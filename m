Return-Path: <linux-gpio+bounces-24411-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A430B27C36
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 11:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AF6AA0174C
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 09:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611042D3747;
	Fri, 15 Aug 2025 08:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ltbv87O2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46312580F9
	for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 08:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248285; cv=none; b=D/+WRbghZL9dX6zWuC3i5acX+CMlbALiCgjp7L+sXTTlTbeC9S5dxCXgwWPUTvwHjZL5QmYzTYp51IhyvlmYLwoDaWNJ9Z/RF58smhpvpjFbj4LVVmcR9aStQthDl93idEF9FG21Hna+Qv0gKtBkWAokEEEwZbGevkqNteuE16Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248285; c=relaxed/simple;
	bh=S9CdpUW/NSUroKAPq8ZHc1TNwcblN380NHnE9jGiR7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TnUqp2KQb1DlN7HIJy2kJig5JLS+5JDYlv/mh/JVyGVOAkhMrvrcKzA9c4IVdYPMkY2CVyCG61T7hW9ExD4w8mBMqzy243E0KsnSwJ2u3reHNnBL/4PEUaZ1agskpY/mKY44uLpI64VBCkN7I/w60ObDtDnWfAu8rvWW276pmwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ltbv87O2; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9e411c820so932706f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 01:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248281; x=1755853081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlFWDqk7RNjp3eb0SPl4657w9HpSw7kZp4BAuLl0BK8=;
        b=Ltbv87O2Pmgc0n/HAZKN+Rh5kFTZTbJo66Fa1qpUtdf0v9in9yw7VLj/phGGOUrIX4
         88x7mNyEVJcVfPElXHGbcQmXpJloBbeMxANF0fohztUV+NsPTmyrc5DINc8iGSWpGcok
         guYZ8R5J7e8VGNqQpuncnbYdOh/U4Wr8vz71BPMr1VfSXKYJZA6Pip6oNxoPuKnhGHZT
         /fCOUyeKD/DRwBVx7ZtY5PRgMxB3clF/xt4HkUD+UsHTzyp4MD+WxUxpf/MItBMRVUVT
         b53bD6O+/R+YVTiZ90O7/PIZLDSXpulGTAV9WONgAH4plltUTpGKsUQeYf0VqtZrcN2I
         HxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248281; x=1755853081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlFWDqk7RNjp3eb0SPl4657w9HpSw7kZp4BAuLl0BK8=;
        b=h200H/4wg2kl4usRJdQi9CU2hS2IiBDu7pmO0Vn294g8hkMWRlAUTxkQXEY4uzoUss
         daoqEtgs2vZTVOWmB2h724cQZd7rXYi5pt20Gzzb9RheDm/WvTOOHsqRGssf2Sn7yRLY
         Jstnq02H+WQY0kqk7ovxJReTQ8FmP3M+Pl5CzSqlRM0CT1eQUdVnzAJP/f+wn/a80wUj
         AD8SLPIF7KNa2V3TT/10Xz2FLPpGFPmsr8Kjzphb54KlabPoZqKkZbcqJ+zSGhSGMhDb
         P2uw4T4gdl8xk3WzQsZWvQm4E6egwhK5Yi+cWEWouek1sLxRjhI3sTMDDAsFWcgnZAA4
         1vgQ==
X-Gm-Message-State: AOJu0YxMOBYtrzQr8JhceyZ7BhpPUX26zGZv6CX9PZthqt0lgjYCZboM
	9jfBgKmx9WP6YfW5eUx3Ozcke6v76asCtKGahW2ALZL2OjUz0UJ9xyItMZ2Jf/UGl7Y=
X-Gm-Gg: ASbGncsV7MpJhZn+ydqV5yPg28uazp+woEvnQln1Z49JryiWo/paWZXJD/YMmKa4TZc
	Ib3pWm6AxfgMUWtFkh/Ar/XoHouXv/z+ohDFKQ7cU6F9huZZ7P7ZXijZdl/8KAfdpxWNtJfG2qa
	Z81bAnimEHh0rHCtgLOkCVKwWI/5L+7W8vzvqkLJiZl+N7zD4VkE7SKfgGI0cb2Y4h2TutggPF5
	2xZd186ow9n646vGcMqL5Sc5m22YFiaJNcV21MbGDuXSDP1Pto9Sm4xADzblFqAaXVzss3EUCCM
	aG7FtlXm7gE/mutQ627vNDua2DO0wN9IuwNEeeZuYp+cYdNH3sDncBr4OXHnuDZ0ktoQl6jcp7S
	JHo71sGtn89LN+bAJtg==
X-Google-Smtp-Source: AGHT+IEO3k+mTEFNAxZvNmKu6oF9jWeR/70sf6BRLpyv18LAsRh0ZWBBA5aI869r4Kjl5KbFDDQjvw==
X-Received: by 2002:a05:6000:2507:b0:3b7:92ec:68ec with SMTP id ffacd0b85a97d-3bb67007622mr963972f8f.14.1755248281179;
        Fri, 15 Aug 2025 01:58:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb64758d1csm1193355f8f.8.2025.08.15.01.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 01:58:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 10:57:51 +0200
Subject: [PATCH libgpiod v2 3/9] bindings: rust: update bindgen dependency
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-rust-1-0-0-release-v2-3-b1794cb4b9be@linaro.org>
References: <20250815-rust-1-0-0-release-v2-0-b1794cb4b9be@linaro.org>
In-Reply-To: <20250815-rust-1-0-0-release-v2-0-b1794cb4b9be@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2881;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=7gkRGmS5hsSSAU0FTCiZ++dYw8nNPUEIYbeMztEUPeE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvaUQM9mO7SPkQvydcLCzDk68b2W3gNIZhkWo
 duB9SdctqSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ72lAAKCRARpy6gFHHX
 cr0jD/4zSEA+DulaKepuvc8/yES9lp6d+euH618rzRUjYEvOxyNuGvGAQP+TutkWTN+S2f7mT/K
 Z1HJ7Pi5w9pJehfDH3h6hon90o3JkYj70GSALOwW5BSzHBJRNYwIgPC5yb287Pjq1MnxGxP+Wka
 KWmhHEESVEiyhExZm1pMr9jRYUas1oU5/AQmbqG0YkJfEvPuR6ND/ZAEdDlgyELBqcMlMLnOn8P
 cFibOEPkV+djwmrxrTp35Wh2zqwG7KICOl/deMIwaNm4D0gchkDtONV9nHjF5QeEC/5boIKhNKG
 gM2Xv+HOYKPHVIFXc5Vtcu0zZxJYh9Vq0v/Wzigu8Lz6csXi+H0qKrmNyHOAH8ahNWmdQLEneAb
 xfBi26oiqMClvjXex61AgUlWbKy2hVp7o1vEnOkNqd2N0S4PHEfFJ9o+niQwkTwT7kWWSlS5yxw
 N0ClptkvsAjlYmV1tF2PXCaoKpR1OezvcrWkuSxAVByDrCCA0g4/tMkJMqTzJKBj/X8rCjieuK1
 YwYmiA8D3bDVlfyZFmH4jaXHeUlWOvuRFwA97kxu2TuEcd5vqjdS6VDzdG5Sjk4C1IoYq0n/us/
 WBGoAUVIvSCzumHI4zvG8GuAm2cyN38qlou3b5idF7O6hT9fgeFc/Y4FGteYF2Dxw9JDSy33CtP
 vcB9aciwKhOqGaw==
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


