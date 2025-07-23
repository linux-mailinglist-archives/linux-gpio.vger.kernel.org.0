Return-Path: <linux-gpio+bounces-23666-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FF9B0ECF1
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 10:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F30625455C9
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 08:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFCA9279DC9;
	Wed, 23 Jul 2025 08:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wpn1eQRg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7B2279DAB
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 08:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753258615; cv=none; b=TJeU0MMiIc2iw2WjThXNTNMJ06XQnk6i0uTo+q/rZ3Gx8/uRomDZfBNqXOR4yaf2EZ/aUEOqt0woYMGRud6nWAB4gKAHEdm/zx+d2WG8R/e+nTOgtqQWgRhJUE8wlyIgLBlu1rNVMlim6RRUeCgQEiXy16XYTI5m648ZIZKcTgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753258615; c=relaxed/simple;
	bh=sAZ3bMEXHLNhsOxH1yjzhZ9+Dt6HlSgub4giuU1zmB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iPxcLyhi7KtpfhspP0ZntIDXASnmJxmQZkrSxLaWgOcfkmlsWLd0dSjuaYnEV+rUP2Xsui5466V0srnuB7dZsPmjOiMAPifSz7zkF/eB09VarZ+CD3+eI2wxqFhLxKo2FGdAFpWtGn8djNZb+w1zp3xCgO8ViuXRjW760YSR4qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wpn1eQRg; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4550709f2c1so48937715e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 01:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753258612; x=1753863412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hITnEF2+b/5GcXEXP0UXkcaJPo8GqvDGTmCRnm0OY4w=;
        b=wpn1eQRgVYK8dLcDLSPNyJp8fpbYpUNZSEoabxC7PtxInIuUFvD1W4tp1XX0ewbtf5
         RJopS1S6QflUh8xkoTjLeAyeNGZpSknB7RImQHR/fk1J97Rv6+i+aCUAQqyHiNJw3nLt
         FNaFxbYxphtQLADqtsk9tn2y5QJed6dZ3RulC9HwEr6I6NbGKMvWNDdugnWuecMcU0gM
         TNnR2tTxWZJ+XBe6a2q0OM4TNccMek41EWA3YeAOuox/NZruez2A46bWa2NesX+av29y
         aYQ1DESrj6jiRQbPyYJMFu3outyZvTlMC+rljvTUGvavJB6NlkTBBaPcNC4IOMhjk+hf
         bptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753258612; x=1753863412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hITnEF2+b/5GcXEXP0UXkcaJPo8GqvDGTmCRnm0OY4w=;
        b=MhBVmMFSxyJ0F8v8vXLQVmXzsJIZ3ak5jPQDu4ACCy0rKlvlNW0roG3leip/UloEIV
         UEbgCGFhE730gakf4EvrKF/Ts4KUZfRHWuyBuRA9Zh8xm8Q9pYNNphVRnwS7ph3pYMAl
         NyqsaECPkC1sxRjmZ4imC76SwvcEbkI9WYZhAEl59L2Z40UATA0JL05+RJPRQG/nLoGl
         ngWzRBinz8PgcUifqm1mpyvtw0Yd6pQqn332D0C6XM7HoyOmixkAc9hqiQvvOmjYwUvC
         gWp3f6j6Q0GusRwsDc4eDyql9zqF3YkrFzFDjAV7hiWxdHfInBVYa66nZyKcpxVUe+sc
         qA2Q==
X-Gm-Message-State: AOJu0YxWn2DhfSu+S1lBuG8psbe83S7iTYoEN1EmKh/5MFMAlX5riZNo
	E7shjGANIRorqTzFfqALxC4N8kXDAGGxPS73uBOjmb9KvuZIZGwsgsj2HP0EXvUhZn4=
X-Gm-Gg: ASbGncsLFIlKJ5w6F/X6ftmQpw61JV5P7SZ3coIyHhYEnXVs41ppMtZYqi/R0RihEKb
	a35L0oyXpCwx+hC0Ojwxb30O//K0w5wvp17gTeh4mE4KQzdF1Oq/uGGWmSzFp2U14ICln0ZZLZ1
	TjIh6G4zugcc5O5dONHosA1VtIFV4Y6uIv6YEm0X7TSlTaQuIEKV4GUI6a9pNO1VimL/r9cbm/Y
	h6q+DA2B3r0YX27AbiFvj+zd8lpi23G7xWoMfXdfMYKtLgxNoH1tZqzjUrDh1stTNLHzUod69pB
	BBEp62cWFDgMm9chNUn6bpkeplsw5AT7Ibq7KlX5fNyXAuziRe8mpA3BUZClSKUlnbNRA+xbLcb
	8pohNvj8EB5fnN8g=
X-Google-Smtp-Source: AGHT+IG4rQ45zwJvy5pWWHMJs8oDQHcJxkv6zWsHNygUoS7+amYPg+iXW/n3Dpdk/x6GWcIEn2a4Xw==
X-Received: by 2002:a05:600c:358c:b0:456:11db:2f1e with SMTP id 5b1f17b1804b1-45868ca7563mr15091635e9.15.1753258611775;
        Wed, 23 Jul 2025 01:16:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34cd:b1d:d4f9:be03])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4586919708asm15096495e9.13.2025.07.23.01.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 01:16:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Jul 2025 10:16:47 +0200
Subject: [PATCH libgpiod 1/2] bindings: rust: fix formatting in examples
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-rust-examples-imports-v1-1-4c87e07a9b79@linaro.org>
References: <20250723-rust-examples-imports-v1-0-4c87e07a9b79@linaro.org>
In-Reply-To: <20250723-rust-examples-imports-v1-0-4c87e07a9b79@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1790;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=OCrCjoIEDqnJU9oQ3Gc5/mlTL1vjnayspyLDjRykZdA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBogJpyv+ObtCtGsXo67Xx6QtN5tofzozS1sQTKN
 rWce0wLSVuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaICacgAKCRARpy6gFHHX
 cj/sEADXt+70/4xjbdIOSQ5NslTIPF1Zz7H8LzDnlWHAqi63b8wgPrYbb2ABE1DLkGKkOfbgbPX
 WuxTM16JsmCOHhRBLznOrY0hqyS82JF72XsFOM7uulKfU8CU2YwHh87UWwFzxYLQ9jLl222l5uq
 TT+1POEv5gX8jkOXrsa7ANLc7hN2RR48Wi1eylI651xHjO7m7qubvgkfQCmCEFbuNmcJoGZu25u
 FiVlwXdj1Cn3i8VH7e3RYFQcU051nPS1Pgeh1vpjZHGAx6l64wdOTt5G5m0OeCZv14ykdQBvJJY
 l8yHtaK+ohyP9EESBzy/u47jljfj8r0YgIgtcFAFBSAH68JTi0/DqTYPh2sCzMXM8+9WNJ66qep
 Jjh4LzjDI9INomSCkGO4SCuSq0r2XpcxpBAEauxiOSxHsnqd4kxPJ1Gl2tOjMNJqoLKP6GliIJY
 KY69mxbKXB4e9IC28sqzsQ7uIPXmH+VyCKP/t7DmNsdxBen98efGQrK6O2YKZuYnH7iVXPH1K8S
 qhbXVlcSB0thCtW36y7ieZeNsQzA3VRqTCY2XEyxLAWJCg3RdW/D8a47n0iU4AV5zjTNJrN/hFa
 bz+R7H+ay5qLpcKHT/2dg7daBTsE3nHuqpDXoa/DAVD32GqSMikoTv24vY+hw2SSH6lUu1Hrnr8
 JdW+Si/LDJ0F86A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use rustfmt to fix formatting of println!() in two examples. The lines
here don't need to be broken as they don't reach the character limit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/libgpiod/examples/find_line_by_name.rs | 7 +------
 bindings/rust/libgpiod/examples/get_line_info.rs     | 4 +---
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/bindings/rust/libgpiod/examples/find_line_by_name.rs b/bindings/rust/libgpiod/examples/find_line_by_name.rs
index 6d6a37b083efce4c61ecfb8c57292c4ee299466c..c563c45eac793d9547b729ed58712f61a9d8e338 100644
--- a/bindings/rust/libgpiod/examples/find_line_by_name.rs
+++ b/bindings/rust/libgpiod/examples/find_line_by_name.rs
@@ -14,12 +14,7 @@ fn main() -> libgpiod::Result<()> {
 
         if offset.is_ok() {
             let info = chip.info()?;
-            println!(
-                "{}: {} {}",
-                line_name,
-                info.name()?,
-                offset?
-            );
+            println!("{}: {} {}", line_name, info.name()?, offset?);
             return Ok(());
         }
     }
diff --git a/bindings/rust/libgpiod/examples/get_line_info.rs b/bindings/rust/libgpiod/examples/get_line_info.rs
index 7fb91a0cffaf5d7419722e9c503ab75cef44488a..9eb8d0fae7ad2d0f09c2721f010513e074f98e58 100644
--- a/bindings/rust/libgpiod/examples/get_line_info.rs
+++ b/bindings/rust/libgpiod/examples/get_line_info.rs
@@ -28,9 +28,7 @@ fn main() -> libgpiod::Result<()> {
         "active-high"
     };
 
-    println!(
-        "line {line_offset:>3}: {name:>12} {consumer:>12} {dir:>8} {low:>10}"
-    );
+    println!("line {line_offset:>3}: {name:>12} {consumer:>12} {dir:>8} {low:>10}");
 
     Ok(())
 }

-- 
2.48.1


