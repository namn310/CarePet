<?php

namespace App\Http\Requests;

use Illuminate\Http\JsonResponse;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\ValidationException;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Contracts\Validation\Validator as ValidatorContract;

class UploadImageRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'upload' => 'bail|required|image|mimes:jpeg,png|mimetypes:image/jpeg,image/png|extensions:jpg,png|max:2048',
        ];
    }

    /**
     * Handle a failed validation attempt.
     *
     * @param  \Illuminate\Contracts\Validation\Validator  $validator
     * @return void
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function failedValidation(ValidatorContract $validator)
    {
        $errors = (new ValidationException($validator))->errors();

        foreach ($errors as $key => $value) {
            $errors[$key] = reset($value);
        }

        $requests = [
            "error"  => [
                'message' => $errors['upload'] ?? ''
            ],
        ];
        throw new HttpResponseException(response()->json($requests, JsonResponse::HTTP_BAD_REQUEST));
    }
}
