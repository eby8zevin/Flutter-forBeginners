package com.ahmadabuhasan.barvolume;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    private static final String STATE_RESULT = "state_result";

    private EditText etPanjang;
    private EditText etLebar;
    private EditText etTinggi;
    private Button btnHitung;
    private TextView tvHasil;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        etPanjang = findViewById(R.id.et_panjang);
        etLebar = findViewById(R.id.et_lebar);
        etTinggi = findViewById(R.id.et_tinggi);
        btnHitung = findViewById(R.id.btn_hitung);
        tvHasil = findViewById(R.id.tv_hasil);

        btnHitung.setOnClickListener(this);

        if (savedInstanceState != null) {
            String result = savedInstanceState.getString(STATE_RESULT);
            tvHasil.setText(result);
        }
    }

    @Override
    protected void onSaveInstanceState(@NonNull Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putString(STATE_RESULT, tvHasil.getText().toString());
    }

    @Override
    public void onClick(View v) {
        if (v.getId() == R.id.btn_hitung) {
            String inputPanjang = etPanjang.getText().toString().trim();
            String inputLebar = etLebar.getText().toString().trim();
            String inputTinggi = etTinggi.getText().toString().trim();

            boolean isEmptyFields = false;
            boolean isInvalidDouble = false;

            if (TextUtils.isEmpty(inputPanjang)) {
                isEmptyFields = true;
                etPanjang.setError("Field ini tidak boleh kosong");
            }

            if (TextUtils.isEmpty(inputLebar)) {
                isEmptyFields = true;
                etLebar.setError("Field ini tidak boleh kosong");
            }

            if (TextUtils.isEmpty(inputTinggi)) {
                isEmptyFields = true;
                etTinggi.setError("Field ini tidak boleh kosong");
            }

            Double length = toDouble(inputPanjang);
            Double width = toDouble(inputLebar);
            Double height = toDouble(inputTinggi);

            if (length == null) {
                isInvalidDouble = true;
                etPanjang.setError("Field ini harus berupa nomer yang valid");
            }
            if (width == null) {
                isInvalidDouble = true;
                etLebar.setError("Field ini harus berupa nomer yang valid");
            }
            if (height == null) {
                isInvalidDouble = true;
                etTinggi.setError("Field ini harus berupa nomer yang valid");
            }
            if (!isEmptyFields && !isInvalidDouble) {
                double volume = length * width * height;
                tvHasil.setText(String.valueOf(volume));
            }
        }
    }

    private Double toDouble(String str) {
        try {
            return Double.valueOf(str);
        } catch (NumberFormatException e) {
            return null;
        }
    }
}