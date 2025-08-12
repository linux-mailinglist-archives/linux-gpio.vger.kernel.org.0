Return-Path: <linux-gpio+bounces-24281-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2728B22660
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 14:10:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22BBB3A9B83
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 12:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB48E2EF669;
	Tue, 12 Aug 2025 12:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="i5XqXcl/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E772EE260
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 12:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755000656; cv=none; b=NC18/4wI2SlDG+HqB3Fb6BbtugMraQeeOvmqhOz1KeIlk15v+uWUAgGhie4Twu55jabGWseKDFtNjtn+pKwsclNVaZfYZT/3H4Xx8swA+s0Pm4DXF9Gc3X3T/Mq96C3JIofEkC31Q7KJYQfwISZrKOL5XdfzepTQgYo/j+nZkQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755000656; c=relaxed/simple;
	bh=Lr/T/ddnWWPmQ1WoS9wi7ZMOxl21Ym0JJ53sdC52aNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=REEF/iv6JfxSEm9jCr5vtufwRdPTWMDW9KwNQ9LDEA7xzYzYeKlyhdUac0CgNrxtKR0em7Tw/is/mDQEdH+uad4uyeLAJM8wd8jrq7lNJ86ImSXod5o78f8dAvFa+ivabX/0dFT9gLdmJzLZcYcPYLOcIXfvlRndPR3He1fECpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=i5XqXcl/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a11a138faso3439255e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 05:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000652; x=1755605452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BoP26MtrrK9fpLGv6HH73c1Nfr6/cyq0mqqxNIfUfTk=;
        b=i5XqXcl/RUilMuOdlejivMOUzqD8+WkbDPeyvy4o1lwbn73FCjzbi9kLScxOv83ROC
         GTAT1KWZTdpzl0xlUhUVDBSyuiJnrIauTqdMJh/rYEsHald8YbsIJPB6dWpSPTbVijq9
         qfquGn4/+ujamrdPkvdmj8R+Z/147yTV2CDjeckCOzIg/YQ8ncl2rwH+ARyF3v+PZMoI
         LyHFpcjKuyCe7UYaCwNCM2dTSo14HBgRvyK1QGk/mYxtY1rUr7QBu7pcSTk9Lz8mwC5U
         EAtJ6y1OS8cf85JC29N56E9Jp6btN6fglDG6wUllYtn2ZZp5BqlKM5sHVs+la7KTCxIO
         0cRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000652; x=1755605452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BoP26MtrrK9fpLGv6HH73c1Nfr6/cyq0mqqxNIfUfTk=;
        b=HYUGveUUbxpsjyDwbU+PMrIAqhFF+w+7CDvV6g9uJCgM54owvaK5CQEZ5C6mO5ysN6
         EAimhCtK7wv6kxJim5eSG5S0evz3X3+KLoydmxlqghXuPbgOf6u9m4MLLWvs+JEqcSQa
         HfRcp33kT2DUwtDXYJoyuXJmB1ChDjxR+cNZWHRjmEWYpq6bV5GjqTP7EY6OTkWldUa9
         bMETjj4TBsT9eDXkGWQ7fCiRhyOlPyt3LPrMn5jXBiICsS/eUqA8JG4SAtC/wY7HnDBa
         9gPRRpGbyHSCqoPinoOAAhSnIZnBqL/r6liRpYDkiaFMKqCURRLzs0/t7zENX9XJNtEQ
         Gefg==
X-Gm-Message-State: AOJu0YyuZZvjohS2V28HAo6tNGN80K1HJhFxkHVPrTGD+aRM4qdUpyhj
	xPAoLErZJGDW9fFiiL35vFU1l44cA3oYSsN/sTEbJaqtJeJ33rMPS0QTf0/iofg3Bb0=
X-Gm-Gg: ASbGncsxdXprY8KC7KbBYgUNYQdB1JkJ5Xxdpf62Fk/0l2UZ3lohM2vM+SeVub1sqcr
	cdysoI3jBFqSWqEdxk1naOGGgWzuSTNJbiixiR2onInAB1//R2S3TFSth9+pp+jAqk+8BVVOlWy
	+yz2PlqUrStXedImRHaQJgvUR2wteXbWaW3g8BJ9Jo1pj8oc6N0kJGFPJzrPdK8rbr8KHSk5DTZ
	7MHCxLoHMUwN2eunPBGxIWxRR4wLK1tJHieNLtPn7p6w2tUvhcelIRKyzvvcZMRZVHEfytDKSIz
	2hxmOsxomSjz06+YTvUWm24P4RZr9syHHK5w9h9h1nSg2gizHGVzGAfNUltMt77Xom2InU76wyX
	W3yTE2fkyuLpCBnbFFcPwO3EKUA==
X-Google-Smtp-Source: AGHT+IGF1YjCQsU0JWl2hPwF6RqLI2swLQL2ZbV4sdpDt8IBhskHSw7vKYRM2t0MzUdG1NpCJlbrGw==
X-Received: by 2002:a05:600c:1c27:b0:456:eb9:5236 with SMTP id 5b1f17b1804b1-45a10bb6cb7mr35016815e9.15.1755000651561;
        Tue, 12 Aug 2025 05:10:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e1cb7deesm34268788f8f.2.2025.08.12.05.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:10:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:10:36 +0200
Subject: [PATCH libgpiod 06/10] bindings: rust: update system-deps
 dependency
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-rust-1-0-0-release-v1-6-372d698f23e8@linaro.org>
References: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
In-Reply-To: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=8NchlKiLF64jF20oH8sQtBivhwmLtcDEs1GyLr6Jlzg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy9C4HI8jTi+u3YzkOwRRDbY35EN3QO6Ax7Ek
 e9KZaRX1E2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvQgAKCRARpy6gFHHX
 ck9xD/42eHzYNAXSMZ5dnYS569h4bUFxdY8T1jz5ujdtWxylpAJPLW+3oLe6uXQ5GWhRw6SnC5z
 EdG/SBrqhgb3+Q1l7FOAy4EajTI6UCeMuvl3eEKp47D+fGQITBsvfShb/XVCt8GbMos+C5W33nA
 1TFzBOrk5MfAORDfRIjmYUcd8Q1v0Ge7JuiGA1mM+sC+iX71N6pa2JzchDz1ZZxbPPR9p5gLA4r
 F8vWuFHzC2z5Zurtecm1I6m6M0livp2H0iimkX8FgInfaw6PpM649YZUcUU1nugsYRI+wPLQPEv
 6IH5X6FKUT07b9utSHMqTMXkuloVU6A049xRnXIh6GbFSDsjy2EYcJ0hzo23phwF3/I7Ay2tV66
 HU5jiPQ7hjPYkfaZwkjb1SaUUwqVD3GFt76cduPRMgZsu0vpQo4gG+wRrvRyOqScA8urVmrY9aC
 DEkKUS/ts4Hf+4AVks+YKoqUuwC4YIidntzPadIIEGifGxKaYPvK7In0LXxlajkm4XRYTTk4Jaa
 SeuiRIarlgDcCn5lJemdQhfHk38xCD8A3wc05URhwdt/MD6SXY7FGbwpjIRSfl5dqT0wpqRDVV1
 tp4UdkA4kfmXVltzvaDYsYCrC9hHQz8KSMxD8nyEkEp5GngVivZrv241lSbONC4APS+IC/kgm0v
 CLdekpGe+VkRxfw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Bump the system-deps dependency for libgpiod-sys to the most recent
version. The way we iterate over libs has changed, we now need to
convert it explicitly to an iterable.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/libgpiod-sys/Cargo.toml | 2 +-
 bindings/rust/libgpiod-sys/build.rs   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
index 269d69bff9d62c07dcceb573ccc705cfbe2a4cdf..7fb5c174ec8186b6ef8cd64e1e6f25a13bd0dcd3 100644
--- a/bindings/rust/libgpiod-sys/Cargo.toml
+++ b/bindings/rust/libgpiod-sys/Cargo.toml
@@ -25,7 +25,7 @@ v2_1 = []
 
 [build-dependencies]
 bindgen = "0.72"
-system-deps = "2.0"
+system-deps = "7.0"
 
 [package.metadata.system-deps.libgpiod]
 name = "libgpiod"
diff --git a/bindings/rust/libgpiod-sys/build.rs b/bindings/rust/libgpiod-sys/build.rs
index ab5b11308c92579a5b16883d47ec5a616c2db78c..14fd0b011bd6077b0c9be1905b8faaa1a5a39e0d 100644
--- a/bindings/rust/libgpiod-sys/build.rs
+++ b/bindings/rust/libgpiod-sys/build.rs
@@ -27,8 +27,8 @@ fn main() {
         .parse_callbacks(Box::new(bindgen::CargoCallbacks::new()));
 
     // Inform bindgen about the include paths identified by system_deps.
-    for (_name, lib) in libs {
-        for include_path in lib.include_paths {
+    for (_name, lib) in libs.iter() {
+        for include_path in &lib.include_paths {
             builder = builder.clang_arg("-I").clang_arg(
                 include_path
                     .to_str()

-- 
2.48.1


