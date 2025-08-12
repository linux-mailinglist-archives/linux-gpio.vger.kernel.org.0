Return-Path: <linux-gpio+bounces-24277-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 642DAB2265D
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 14:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 087563A99C0
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 12:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 018E62EF657;
	Tue, 12 Aug 2025 12:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="d8OxWygt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642832EE26F
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 12:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755000651; cv=none; b=eOqn25Lk5lFTVvs8jVAKxqA07fZBlQOEUDNqGf3UWS/cJ+i3G6ufBodqZh+J50JMgD0x/G9tAN4UVep3zSrmBXCvmUJk2K1ydU9xRujjQNFYCuohVgP8R2DlrC9k3X8HCFoViCXIpMESpxacuPWJKAjVNi4r6KC20YJiTx7sftU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755000651; c=relaxed/simple;
	bh=Hn2rgRtCeEAi6zrlIAx5qAqs4d139HAsvLYdRxzLm3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mCZH3ecKil0/xteDNrU85MnDxFXSMlN/nM3mYW0TZYnwfBu00jJsYyUU5OJvyDXisQQv7VqOXI05yVrgT7aSuOwLJPsaMxtLHX1vM/yFmfaA9S2PUHO2deeQC+anx55TXpIn2le6wQ43IKSH6S70sjDTdz5zeThSyNRDiF/gtYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=d8OxWygt; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b91325d79fso269929f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 05:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000648; x=1755605448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HLGf594NjpoAe+AQ1D34F4Z6T4aBrurmAdmB4jgX6fs=;
        b=d8OxWygt1TbSiRwc+73uGVE8cRNj9z44cWTy70IxbIDIowpnVoZEh6dlLPBap5grwk
         glUs76oMuUVJRlIlE7qgH93OVMJfk67HDRt4F3ec2UaQtEQWyDYpFrEWuSCMEM2NbTi6
         eG1+pgAL1P9qEBKF+sOkUbDJQXQ7FZX9kK+oKYogw+SUaQaGcFhlrDYeiLZCTTuEgGK7
         CXKgdUjX1Vc08NPxyQvpCkXMZog3vjKC0fC0UF12CF0q10ulbhXi3SO0xKRmf8KypQvG
         Yns0B4XmK2zZP7oxejyPqWno/PEUDpfHqrDx+kiliQmObxpX8IVWprVcYXk0yHetZ0L8
         25Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000648; x=1755605448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLGf594NjpoAe+AQ1D34F4Z6T4aBrurmAdmB4jgX6fs=;
        b=mTAuLE7BDxNvQKQ58WoaxrvhJVvqOKTRSrvpq4IjNXg6pMSXG4l0f0HWtRxCL57sGk
         MSvziwMV8nd9pXORXyKFQCXremDpSmomt/eGqslm+8ValCRaliiavNw0Y2AVePp0gZt8
         +ZJicbSRacI3Aijf6eyZow8OoFbBABToSnYzQHQUOLk3Bm1j0NmeTE7WUr1dUKcX5WaF
         ek4O9MH3xz+oBXniZaBBlE4E9eXITm3cjHyGNXlgG7DblN2eYKpfVlKL+HkX+INGm+r6
         G1MyELrBOvSC+v1FSZkztcJNBDwOLda9cUzOMPZOH1A1iacVvgUOGP14dOZ6u5w2Lpd1
         oHYg==
X-Gm-Message-State: AOJu0YxWavs464XIHmeG8M9oZP+xQ2Jk3GTSPtYBX+/BASwF9zK5NBDF
	Wj2d1eYE4YSJjiSAPBOsA+cZzmEHKWhRsk+Pve4BYOqqZ5a4gic1qPVxIBsptV3kuzE=
X-Gm-Gg: ASbGncvY1knXrYP0cHXl2CI2ygFVOmM5+JeYEI1D2qx/LKIQAiz9QqBPdb7LEh5A4e+
	23Y3U1z8pBmBzcCa8cbTCjRuW0UgcCSX9+iMA3b40fsuJAaWfpnQfHXRYSo3wzm/H+/1uaDoyrf
	ToT6HYqPjlvzbaUwzTY7BgdHGL0vhi5V8jQm0dMa7qcDdwdSm8k37ow2VdoJ+RA9HYCSwWHssf8
	tUHlQoob62Ioe+nzA7Co6CxhGie1W48ELh+39AVQMkUhuMWnJCyhB33wl+WC7fnGv15Y6OG8Thj
	dEic6C36CPl0zzPbr51WmOXpoyI4Fq8Vfa5e+foKVsqhc0akil2wM2MfiW8KLyN8X14YawsX9Ul
	Hid5QRWUHHPuSW88=
X-Google-Smtp-Source: AGHT+IF1DQ3nuiAxcfp5wAf6Mn6jlrh0Vt3cZgT7GD39bhSi4CPTxsQ0ttvDHHBfGlaSO/icQ3ULeQ==
X-Received: by 2002:a05:6000:2485:b0:3b5:def6:4f7 with SMTP id ffacd0b85a97d-3b91100796cmr2340060f8f.30.1755000647592;
        Tue, 12 Aug 2025 05:10:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e1cb7deesm34268788f8f.2.2025.08.12.05.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:10:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:10:33 +0200
Subject: [PATCH libgpiod 03/10] bindings: rust: update bindgen dependency
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-rust-1-0-0-release-v1-3-372d698f23e8@linaro.org>
References: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
In-Reply-To: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2831;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=0tfgcLpt3bbG9s/M5+JRwh5QZ/OFpysiWzUfxV+k95E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy9CNJUu3RM6FGataDLTOMwLL8l30kd+1Yifi
 Xn45VYq+BKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvQgAKCRARpy6gFHHX
 ckjiEADD9YUnKkwLHWez9FxSKUVE6mxLWGJ7cJ15pZFr5cSALgfZxSs3clEwhj4C369kg1zNIYp
 +2MtuilnkoneKdY7jvn7s1VQHyJBzDG+8rUVNxDK9Gp7MMzWS4LE7cKNgLkhjCJnIrE10ib1ukY
 6IlR0n/qTLw3YzOp9vXST94v/xnahjPBaXO8QRL8tsS4lzfL1noXJ1qtl9m6Qn13zSO7dUB8o88
 ZaIzYDIM4CprfrbsfmRKMtswcnf3OEQ2FPubpRKr6S0wy+q+vfqD4NDoZQ3jpEFP5eKzoDolDSK
 G0HlcJZRC94yhg2N82Zr+sz0TPZYY6i6WzZqfmBXUaYBgdl41xGELke4UTjFQsecC87UIM56hR+
 4b2HY5hKDdbOoJ7tG8Yjk9rwdN2pM/pDNsjgS+vj6WcTz4m6zbLK7lQR+InD+aUWMg3Daay5tx1
 ZdTcUJfU1k2PYY1bjbOwYeYJUqW2PIC9AxxUWK7MXkFmRVStG/ZQ5a2eUfiIXvAO4iDuI+NWemS
 /uKa0g2ItWU5B72WOyzig6v4zFUneYqWiCB+YyabdkZK0cI4T88rSVkW19M8BHB7qREKm6oETOF
 nE+rtUTxXDGSea0TSeEGZp3M+Z0TsgUwx/QMuwgEZyqNlm/U339eHz2d0+vWiFnxXJ3dHneF6II
 UjSbiMdtfnFbm0A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Bump bindgen dependency in both gpiosim-sys and libgpiod-sys to the most
recent version. We now need to call CargoCallbacks::new() when boxing
the ParseCallbacks trait.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/gpiosim-sys/Cargo.toml  | 2 +-
 bindings/rust/gpiosim-sys/build.rs    | 2 +-
 bindings/rust/libgpiod-sys/Cargo.toml | 2 +-
 bindings/rust/libgpiod-sys/build.rs   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/bindings/rust/gpiosim-sys/Cargo.toml b/bindings/rust/gpiosim-sys/Cargo.toml
index 1f44a312563f21181b4b3ff79f1fa3b70ededc5d..7099abe41226236b9cba70a36643b921021952ee 100644
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
index eb600a9ee087638e1a3ea5013dec6ccbbaa29d1e..269d69bff9d62c07dcceb573ccc705cfbe2a4cdf 100644
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


