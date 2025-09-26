Return-Path: <linux-gpio+bounces-26636-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60988BA43EF
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 16:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66CBF740439
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 14:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E5311F1317;
	Fri, 26 Sep 2025 14:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="i2sRff4D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACA01F1518
	for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2025 14:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758897366; cv=none; b=N1UPFq8NHE4e+CNaiI6rJFXc9YGqyubwJ9Je8xtzuj1MN/gzWOQ9fYHcOHM/laiCjx7p69MzRP8CERzKvwl3Ql0v1iVUZM0LAnZHghSPrrP3XC5/92/qklp4CVevyOygNomO+phCdECzbOlOMmmUOF7W/cHYkmz42I2VGpx2IYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758897366; c=relaxed/simple;
	bh=pMHrie5JTNXkNRBEbOryNO09BHMSzoODaJWxs8KB1tQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dCxr2nmUWYYkXIG16f386hIIWn9FGmFRANnEk7PCp62TQXVI0qYe/HEr8QyukBTvg4FlE0TPZTrVO5WXrG/UKi+4GicH+y8bxkYJn8pdwGZ2Kx/K7oRx9ecBGOD39iR0BbHjBGUWScAyImaBT/pTkfW3AtJLeB4GmlraeBnOmEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=i2sRff4D; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3f44000626bso1474248f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2025 07:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758897360; x=1759502160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Yovk5t0UpJ5tpnxfLbMU7evhndE6i8JEyGxHZslUhI=;
        b=i2sRff4DwL04jOWnAkSgCYnIGHpEQ1XsF8XDsJnbC65SwmzJEU2snEHiI35pYGANFq
         M4eo3FbRoj01WxnYhkhuoB6DYKT6t5XiDZ5Zc+6GoasGv2dV+GFfWRG1/+YTvfu/TDur
         G2yJLJOGlvNKwgTDeZ44mjzn94aiSV4J7rjOeGGMJksQqUgNmhB2TXQ3HcAXHVzk6ZhU
         tj9pBZVEIg/eRY+rSVCXzgpMsjrze620x6NT3/PSpKHU0RAy97KmsSPEIdbUybtZtY30
         2WuznhAvJ1UXx4LRSaDOv6dhc6x0FEyzmAQf6oCKCPbPdbeWsoFHgKeYz0MbOSWX8R3/
         lAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758897360; x=1759502160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Yovk5t0UpJ5tpnxfLbMU7evhndE6i8JEyGxHZslUhI=;
        b=lN3QxXNRBuNMAL/a/Rd53E4EOgVWRdBCVdzhEP/rcwpaeSQSi4oYGr+mpzcwB624/z
         R9MJTWu7uhnoyshNnwoI+rZ59ICh+PusBiqAHxNRusyEL3jFc3xuYVvqmRRGeLRSVxvL
         h58VFTE0s6ByfvfhVGgHr1/VhKHwVlKf4BewhVrE8iLfu/0tW+JkGRBnTFrlLSDe5pJV
         3uakIdHW9VzLukMaDn+ULjjSAt4uY7NlWCAmUY31rwyl12wEOoX2xP/m+puMPRPAlkia
         gDEHtI3Uzm8AAstEaQJj768XhR2WJlXLYb5OHqXfwUBIyoGAGMk2jWPc8FxlpgYMg5XT
         0ZCw==
X-Gm-Message-State: AOJu0Yww0VQptl4VsJRnD8GfNPs9ySzMeohC+7RkigZcmo2Kgb1cNr3d
	vGqhIzAsBcneGHJ83eNqllngTScF5VLwgweo4sjiNsd7QE2u8o1i2ZPtkY4kVKXwjIc=
X-Gm-Gg: ASbGncv3DMIrtolY6GBCftMZavKpOaOka3PtzgpWtPXv6IuTJWhjwMzJKAqDIBhrbn7
	LZPQd0ELFih87Snuf/UM0uMD//Zn+Z9VDYmsNYy96jA21BjJW10YUM1ytF+ywXDLIQZvixCqgj1
	5/PHmoGkMUmUKLjNIw4aLaUUVzxNu7/QWOBFCNiMl/urOfQANulLDxj6FQdZeMg+G32VbKZdvVI
	gyCZ5L5iRq0tqreMkr098M8GTsW8b9D5vKeVWnVk8qcoCSGaYYupcdwFI4DCWfATtgtiFIhzXNk
	3p43cAfsQhjRAsMJ2Zbe7l1vCesj0WY0H0O1nvC4z5VOb0srWe0Tfm+rbp39gJrtFpPh82hfjW2
	1ygxo3zgCET0PMKja
X-Google-Smtp-Source: AGHT+IHLNJXj9Yw0HhVztQBEvMB9Ze7C8I9G5OTlMzu+ZW8QDqm1TBYZZmsJ5FwW040mP0JVkMNbug==
X-Received: by 2002:a05:6000:2503:b0:3ff:17ac:a34c with SMTP id ffacd0b85a97d-40e49e728d5mr7344806f8f.59.1758897360155;
        Fri, 26 Sep 2025 07:36:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ab15:a65:aecd:6def])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc92491efsm7515317f8f.62.2025.09.26.07.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:35:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 26 Sep 2025 16:35:44 +0200
Subject: [PATCH libgpiod 3/3] bindings: rust: add examples to the README.md
 in the libgpiod crate
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-rust-release-tweaks-v1-3-beae932eb691@linaro.org>
References: <20250926-rust-release-tweaks-v1-0-beae932eb691@linaro.org>
In-Reply-To: <20250926-rust-release-tweaks-v1-0-beae932eb691@linaro.org>
To: Erik Wierich <erik@riscstar.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2810;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=qlr8UfWccojd4jodC7v+ju5ZIzqtKyXslRY/ixCt4mE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo1qTJp8+OKhYRzBHXD12An9uGVET4NC8ERqpkn
 narRLN5cKuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaNakyQAKCRARpy6gFHHX
 chWpEADGFD+VxAdJdAcIUHoYDDb9ExTmLrcbRxo+jUxwK0YbD4S7akXFYIWlNhL0gs4VEYJstKo
 JTVTz8qZruv5BxgYIRYCUmbhCc12pERVEWfdAqpFTaw3PXtRPqAx5jWY9PX0LejFZzdurhd0SRb
 nUVETN1sXT0diFSe6RduyiM0NXQVKQJAvJt2xGY7zatOuZzWjKmuklHyHpVWJDfwDezDLxMuotA
 qOmp1EDoVVR1OZudRlAD7eB6V+/b/dJKR7SZP2ajS3v8y15JqJ2tNPihIdd8AfVzAEjSYHwvOYu
 kwEmQQqCanTNX/7LP0yLVik4Nltu0rO1vRO+YFkkqhAyMmkrgHB5SXi79mG17aminkYJKoOOb6p
 gJ+njJJJztceYKdTMxxK5OD3S9feAPURu2bh2TO4ERLe9SUGWtsb1N2jyE2hyklSMfXH29m3Og3
 clfI88V2o5TCtkm1vezO49NRMUBsUKgKxkGJ2OfjJ1KVH6CSql085Y57l02owJ35FEASOIqCxj2
 ABlLbdw++zDMadUobT6dtKuSiyq1DSJ/VqqR5Qv5CXAmRzriG4Ojk8Ed+UytqJG2jV7WSb9CTgo
 DD/PCa1wxzF4gChK+9lmrAFUJP+y+08ahsrporjUot/2IPOvXsXcEIAowfBySEs9OOwLN5yLr/G
 u2kM9jO1z/ZSn+w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add some code examples to the README.md with the aim of showing how to
use the bindings on the crates.io landing page for the libgpiod crate.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/libgpiod/README.md | 78 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/bindings/rust/libgpiod/README.md b/bindings/rust/libgpiod/README.md
index 1ef3743a99c967dca1be15f16bd3f299612bed16..0d764f472abf113d096a0e73b5d21f5790db9137 100644
--- a/bindings/rust/libgpiod/README.md
+++ b/bindings/rust/libgpiod/README.md
@@ -31,6 +31,84 @@ versions:
 - `v2_1`: Minimum version of `2.1.x`
 - `vnext`: The upcoming, still unreleased version of the C lib
 
+## Examples
+
+Get GPIO chip information:
+
+```rust
+let chip = Chip::open(&Path::new("/dev/gpiochip0"))?;
+let info = chip.info()?;
+
+println!("{} [{}] ({} lines)", info.name()?, info.label()?, info.num_lines());
+```
+
+Print GPIO line name:
+
+```rust
+let chip = Chip::open(&Path::new("/dev/gpiochip0"))?;
+let info = chip.line_info(0)?;
+let name = info.name().unwrap_or("unnamed");
+
+println!("{name}");
+```
+
+Toggle GPIO line output value:
+
+```rust
+let mut settings = line::Settings::new()?;
+settings
+    .set_direction(line::Direction::Output)?
+    .set_output_value(Value::Active)?;
+
+let mut line_cfg = line::Config::new()?;
+line_cfg.add_line_settings(&[line_offset], settings)?;
+
+let mut req_cfg = request::Config::new()?;
+req_cfg.set_consumer("toggle-line-value")?;
+
+let chip = Chip::open(&Path::new("/dev/gpiochip0"))?;
+
+/* Request with value 1 */
+let mut req = chip.request_lines(Some(&req_cfg), &line_cfg)?;
+
+/* Toggle to value 0 */
+req.set_value(line_offset, Value::InActive)?;
+```
+
+Read GPIO line event:
+
+```rust
+let mut lsettings = line::Settings::new()?;
+lsettings
+    .set_direction(line::Direction::Input)?
+    .set_edge_detection(Some(line::Edge::Both))?;
+
+let mut line_cfg = line::Config::new()?;
+line_cfg.add_line_settings(&[line_offset], settings)?;
+
+let mut req_cfg = request::Config::new()?;
+req_cfg.set_consumer("toggle-line-value")?;
+
+let chip = Chip::open(&Path::new("/dev/gpiochip0"))?;
+let req = chip.request_lines(Some(&req_cfg), &line_cfg)?;
+
+let mut buffer = request::Buffer::new(1)?;
+
+loop {
+    let events = req.read_edge_events(&mut buffer)?;
+    for event in events {
+        println!(
+            "line: {} type: {}",
+            event.line_offset(),
+            match event.event_type()? {
+                EdgeKind::Rising => "Rising",
+                EdgeKind::Falling => "Falling",
+            }
+        );
+    }
+}
+```
+
 ## License
 
 This project is licensed under either of

-- 
2.48.1


