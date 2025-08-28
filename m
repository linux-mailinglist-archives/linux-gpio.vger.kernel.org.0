Return-Path: <linux-gpio+bounces-25139-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96326B3A888
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 19:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 675B87B640C
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 17:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7BD733CEA6;
	Thu, 28 Aug 2025 17:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZgRhYXyw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32842322543
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 17:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756402999; cv=none; b=JX9suZGL1wacHAeG/zwH0LlH3tSzQ6E2umY9VU52cOqDG9iKIXjJZ7Spn/3Q1kXNOPX10oNEb54WEE1SylLfqwM7kGP1A18xMt+5uffDDQsi8fRnOQrIIESf+ANKYlBA0KPzfPLH3acqF/+I8A1+rhKbFJx5g0+yzcY8PZ4Cpo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756402999; c=relaxed/simple;
	bh=KJVJo3dQeUCUOTp4zjToBpgt7PAknQCK8RwuspjW5+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HdADEyFdfaDrJ6QEDlXTIG1dVv52D4t3r/20EFmZnT4b3jtfuFdsFveOBgkm3j9S8+nzRJslEtstthfrxG8f5rDlgg8bRdT8Dl3AdDMhWVjLWr8r+x35ok7ud7yyVmbd91Ra3WUrlPHev4F9s4Wm4GVw39910eTGnChrJEVBtAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZgRhYXyw; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45b7d485204so5421255e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 10:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756402995; x=1757007795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uLExPwrrhLt7Gjo11OPUlkuGrkV1p3VMRYBWzwc39Yk=;
        b=ZgRhYXyw80buOHT50Q5XJLqZAQBhKMkHPDb1jEIEJ0EzGXjTEU8kmce+WhYEmjv8M/
         ywPWr4zGT9e/Bsar9XyvFOrTqsqZ3ynW+Kg/+jn81OFNH3j4XZoWtnjG0MctLlqc5DnY
         B9u6TmPQHMDhk7wFiLWug2aJjsx/jBttuq1T6kGdWJmNFm3iVYnYIUN4kaIw9bCc1xcg
         Qsgwtkkfzltq38skuGm3Z7EotsHdFMHZyEhrlC91OcICpDFAOB7/ywGQ5KV2AnvFMIQr
         vQvltDiusy1HXGVZmpQ8znZ6fxd3ATzhj8E7juoEefhyjvAHG2Ad0CFNX/Gxr4jiUcj0
         3BCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756402995; x=1757007795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uLExPwrrhLt7Gjo11OPUlkuGrkV1p3VMRYBWzwc39Yk=;
        b=PYe64pbER9+HFrbfhZVYCfNqwI2RKDjy5fYreoYTff9qPvDTcxiLm6bjwgS/qtv7e1
         ANWEN8nCLyQEbb+V1uAlrFDW5xoeHq7ITqFliyutHIe3H8LoU9bxqe4ytjPBa0LNrDlJ
         OSumDFatyyf026vA32O6H2YIO+pNQjo7qd88G3MvyyVB8ucuQGrknWHGfhJu07DOQUj7
         XAnmgvSAtXzq9wZzMWJX3nc+/JmJ5TIt/8Fa/q9PMCqt9qrzDU213KGEoH8kgRACqEwf
         7N2gAcmij2b+/mVV7RbZ9P3O0/JRC306Oo6YQTTdSw2eFl+lPA0SbkTeHKXuty4VP+0Q
         sxrQ==
X-Gm-Message-State: AOJu0Yz1UuTCzTJNVu6ckf4EeQWyo9hiO0ay4XLEq0lcNOJzEhNxeJ6e
	95zLhzYQd+F/RNhXMkfLvUaSjT0YCAlpgA2uQoV/GWNe8Mu32T9i6swW/2tXSzVhwa4=
X-Gm-Gg: ASbGncvVJXVMEfG0J6ORWkhVvBqRAoNXr+5AhsHnUTxL4YZF06OdLGPbtU6ypeshuLq
	OEOS/5I4ZA0IqOMB7di4wPcDQO0+SXjOVgTKhYh3wYwW+WA4HmVpvYDx3BHVEGYVPq6lGwgBfML
	/8VaduSf3ETUN7k9xE4BLPimoVyB06T+zvH3g1bE7R7Y29+lkmyCnLStf5zWfU6uxG8fNhAd86q
	kDWYwxIiQML9fg8G6B/ZLZZQppWZrJy0fVuhgnwBaKzV8fvMqRYYp0V398ytAbygmHbSiiD4Deu
	oG2+megH2x3EZA0PZaS7VMEo6tBvVcu49J9bJLpnb3Aq5xUdg5iqp752WvXXEpwMf2wMnOlKJsX
	Rx50EkvQXts1PehXhwg==
X-Google-Smtp-Source: AGHT+IHIkdrfXcqcSbkohDZwM+8/nmmKbufQEHNjWqAYRSkpwd1bpwhrkAXy7RSGdSeRwXlKMzKXZA==
X-Received: by 2002:a05:600c:c87:b0:459:dd34:52fb with SMTP id 5b1f17b1804b1-45b5179ebb2mr221340295e9.12.1756402995387;
        Thu, 28 Aug 2025 10:43:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7d2393sm3812075e9.3.2025.08.28.10.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 10:43:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 19:43:06 +0200
Subject: [PATCH libgpiod v3 04/10] bindings: rust: update bindgen
 dependency
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-rust-1-0-0-release-v3-4-0f9c6c1c4808@linaro.org>
References: <20250828-rust-1-0-0-release-v3-0-0f9c6c1c4808@linaro.org>
In-Reply-To: <20250828-rust-1-0-0-release-v3-0-0f9c6c1c4808@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2881;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=U01z/WZ9JrFhOL+iVdnUwA5NDYzm8LAqCObS/Lg0CLs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosJUtTCTL1T3HPZb007I1Jgx9gxQzGPGjoE2nV
 M+L5QEV3DuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLCVLQAKCRARpy6gFHHX
 cgvID/9tQgSvkVnKQZZOMzLw951ca0E3nZBCdIMEIC4gMp5kfXYOdas8U3+4DIRmnN8z3GVKeMy
 H3WHwi9Z75LtWbsm+z1COhTwYXKrH0m9JgxxRTJWBidz+8kcgIlpjuPTycFzK9BFhE4Znd7rxRg
 sW0i5MvRTOYQJnof9d/ab7aJKT7kzlZnV0abCTiIEv4kb57KVEkZBuV84/qMJMYztqHw+7UhrIP
 Q5OBZC7Vytwzd8uPhAlXoein771D6Ic09Y5HjJPH01A5YUW/IvwnQV0up9o6oZMbiSu2ESMyNOx
 4ZhYT/VUCynGOJpK3694H5657t53ALGLRnkn4bOVZo8uVketdftc815a9hBQrIGch+Pr7NPG5MD
 anRsKyTwM0w25EM99MHr1VnCYGykzRyJVgD68XzGUbKsdWHU8OqjKjRzcb/yrvV8PhdUEpRaoZA
 H0i0F+7mPtSFxthe4vCEvDowBIL47c1SF4g4aEzEc90dEXMjaMKBRlnzkVHVtET5EOKSqGAT+HI
 xINQXz++RnRKTLT7FXLWZuBXT8CglaIvPvZzVIEGO6iJHNxbR4JnsuxXTh/fJ/f511zUKFsSMrM
 OdSW40MhoVclL+GAZ8S+2r5WigrZR3SB78mHbC/YTE8XOVrEsqlZQt1WUNwvpS6Go1I+gy+AiVk
 NgCl9WR0cIORxMA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Bump bindgen dependency in both gpiosim-sys and libgpiod-sys to the most
recent version. We now need to call CargoCallbacks::new() when boxing
the ParseCallbacks trait.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/gpiosim-sys/Cargo.toml  | 2 +-
 bindings/rust/gpiosim-sys/build.rs    | 2 +-
 bindings/rust/libgpiod-sys/Cargo.toml | 2 +-
 bindings/rust/libgpiod-sys/build.rs   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/bindings/rust/gpiosim-sys/Cargo.toml b/bindings/rust/gpiosim-sys/Cargo.toml
index 47b74cda2f391eb5a15f8aa2be3ccbeed0c92604..020c6e7ec0d8c07da833f8a67f1c65ee6041a14a 100644
--- a/bindings/rust/gpiosim-sys/Cargo.toml
+++ b/bindings/rust/gpiosim-sys/Cargo.toml
@@ -19,5 +19,5 @@ errno = "0.2.8"
 libgpiod = { path = "../libgpiod" }
 
 [build-dependencies]
-bindgen = "0.63"
+bindgen = "0.72"
 cc = "1.0.46"
diff --git a/bindings/rust/gpiosim-sys/build.rs b/bindings/rust/gpiosim-sys/build.rs
index c31fccb096841c248706089be7d8b9d232073265..81127e8ba2de336ec20ba2051fa8403b6d86eb06 100644
--- a/bindings/rust/gpiosim-sys/build.rs
+++ b/bindings/rust/gpiosim-sys/build.rs
@@ -20,7 +20,7 @@ fn generate_bindings() {
         .header("../../../tests/gpiosim/gpiosim.h")
         // Tell cargo to invalidate the built crate whenever any of the
         // included header files changed.
-        .parse_callbacks(Box::new(bindgen::CargoCallbacks))
+        .parse_callbacks(Box::new(bindgen::CargoCallbacks::new()))
         // Finish the builder and generate the bindings.
         .generate()
         // Unwrap the Result and panic on failure.
diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
index e789a874cade99d6fc792136079d6ddb6988dfee..d5901b96721255c4ebefaef6b18a6bd9847d3b4e 100644
--- a/bindings/rust/libgpiod-sys/Cargo.toml
+++ b/bindings/rust/libgpiod-sys/Cargo.toml
@@ -24,7 +24,7 @@ v2_1 = []
 [dependencies]
 
 [build-dependencies]
-bindgen = "0.63"
+bindgen = "0.72"
 system-deps = "2.0"
 
 [package.metadata.system-deps.libgpiod]
diff --git a/bindings/rust/libgpiod-sys/build.rs b/bindings/rust/libgpiod-sys/build.rs
index 9e6a93c04324b419f157fcb20fe2bedf98b6fd91..ab5b11308c92579a5b16883d47ec5a616c2db78c 100644
--- a/bindings/rust/libgpiod-sys/build.rs
+++ b/bindings/rust/libgpiod-sys/build.rs
@@ -24,7 +24,7 @@ fn main() {
         .header("wrapper.h")
         // Tell cargo to invalidate the built crate whenever any of the
         // included header files changed.
-        .parse_callbacks(Box::new(bindgen::CargoCallbacks));
+        .parse_callbacks(Box::new(bindgen::CargoCallbacks::new()));
 
     // Inform bindgen about the include paths identified by system_deps.
     for (_name, lib) in libs {

-- 
2.48.1


