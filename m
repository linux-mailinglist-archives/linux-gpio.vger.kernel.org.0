Return-Path: <linux-gpio+bounces-21035-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6135BACEB8A
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 10:13:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C78403AAC8F
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 08:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32A4202C30;
	Thu,  5 Jun 2025 08:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ri4Ij5GB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065F81F8BD6
	for <linux-gpio@vger.kernel.org>; Thu,  5 Jun 2025 08:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749111211; cv=none; b=HOqJicxr7mEEK/OE4nKQBaL4HBwkWgepylMkScgKhpJoDK/WQdeAl6HhP7kTWsfE7Z6uCsW5EQ0Dinc3wsJaXSNPxp23Q8lbfVAajA3pPobDpM9VNtY3MMLR9jVx9dY4J2J/NcPW+Il47yeiiAR7ErCN0AgL6AHYr0MWgyzwUOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749111211; c=relaxed/simple;
	bh=DRjhWrHQT4lgyqKM0TUzkIauvvSfSwAN+/c7Y/Dehrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sFge+Sc4ngaK6QWml+llT0S/69oiYnfQ0/7SB9GV2qJh/PSqh4JgtE327FcOxwtay/sdFzX7VGyggwGAc9h+S+fnBVH//o1G3Lpdk21OMd/OmkR0V+KPHgEf5XIlx3yiiJzJkQLr8xtunKreKFTcgSefFacGJYJGg9cBC7WJnLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ri4Ij5GB; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a5257748e1so472376f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jun 2025 01:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749111208; x=1749716008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XgNGBWUntlzsqlsrqfACQ9ak5SzabU4TyO+KeG66LBY=;
        b=Ri4Ij5GB6u1OXDA6XPePVUz0k0LhH5olKd5W9RqZd9ryFBCPwj+8aqnK9NEpptBe0B
         c3v3ezESCmiH6RSK6X7Jgi7lb6u4cyorgIP/TKeJt424m+8DeAK6B+QmUQE6bbW6a71U
         u3YZiXx/hjfnZPqmz+C/2YwXb9JrUOl1zC7RJjJWc5Wq98heD1MlnuKHlgGPVulp0JMK
         TaI27Gya2KnsRb7J5nmdXKfj8Vfm1aWeCmuA99X79Mc7vzq51IlZbs6yZPfmncsQK0Op
         rP4D37vI4MZ+bO/cllG7iy1e82Qw/jLaSWXQ0QeHvXX8mSlLE3MkAvNeNcLSxiDlFeW4
         4/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749111208; x=1749716008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgNGBWUntlzsqlsrqfACQ9ak5SzabU4TyO+KeG66LBY=;
        b=SLLfYZjLUwGDaZ6vJoZ8lR8WFupLzJLFqxPUFlNl1zFimc4vjR6W6EiFkpqkoTxK9o
         4Dp7UgQj3M4a1zD6sVBnYgIDitc3ruD5OJAsMrTlKBDZljszH0xwvDRm3ST0vTtK70cr
         QsXPVnBnGHWwzPbX6sxI8yGxhy5UrzexGsf4WXdpsC/W/vY+D3AaRx0o4L8npWG+MqHM
         SL48q7bKB6fjI1p/ILeJ9WWqmFFmnknpHsYwMPmZ/uSNuVZIpM332Kl69hrpp2b4jWuj
         L7gHrB0hzOin+q6shUEoSthXOSmhIEYZRNZN32MX+sCf35lbYPuV0H1/4DrSYs+0ldYl
         vJcg==
X-Gm-Message-State: AOJu0Yz4fGZgtD8yNk9DwofvhPcw4AUrazlmA9GnLWeLd3vZxhcSJgB5
	dcMghMK/AH9BOdr0knIVp6gq0qSBhm4KG5bJFR0QAWH/5U+V9ZI8f2GEcwg3XIYr2aSLPaizUL3
	pgxMo
X-Gm-Gg: ASbGncvxyVuBWiBa67J1zYIDDyEVSTJA4RIQPjv/KZVq7I2xy7UIHtXxK0inNFihQTp
	Lnyd0zoYLkMsxFz44VwefQ8RIBpb4do/QCnQ/mWjm7lgfdjHT9QAHs9YBcmjbrA4kvK/m5QVSw8
	zPXgbGnOZJsLqfkYCuW1X6nqZw/5N2bn1+tpNFa0g44Pt+d6F/G+VR09jT7yZWypcdS1eWSepUr
	XiIKLAtaeUYLyquYx+aLWm3UVN+y1qu3O8YIQCyy/q4DLbswUMNulmvwO6oAM3M0jxtW7Rjm4TX
	XYih0kaNs7y1qGjU1rbNWh4elgCMKpQ4Mwq5p2XvxrvGtLAhYW7ck68=
X-Google-Smtp-Source: AGHT+IF5OmhImdksIW+BITc6dNWeHGMFAxIpdy9JQhLr9ZkTcFDKG/x2VBx+Wh0bZIAZVAU0Qaqdmg==
X-Received: by 2002:a05:6000:420a:b0:3a4:ed62:c7e2 with SMTP id ffacd0b85a97d-3a51d966b13mr4793441f8f.28.1749111207993;
        Thu, 05 Jun 2025 01:13:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b79e:4a6:355b:c44a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451fb178ee2sm10010865e9.15.2025.06.05.01.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 01:13:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 05 Jun 2025 10:13:20 +0200
Subject: [PATCH libgpiod v2 2/3] doc: improve the readability of the prefix
 variable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-rust-docs-v2-2-883a0a3872c0@linaro.org>
References: <20250605-rust-docs-v2-0-883a0a3872c0@linaro.org>
In-Reply-To: <20250605-rust-docs-v2-0-883a0a3872c0@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik@riscstar.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=77ZEdBx/18Yxsz12amBf5rGcXRRQHt5qzyrxRovOAi0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoQVGldla8EcQa+W7OzKOUR10KebTo1s9u+wGAZ
 aPrTl4HuqyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEFRpQAKCRARpy6gFHHX
 ctgxD/44Pi4V7UiemmLO3QRpVAZVm0ndI3T3bQ4Ntjt3kAkuN8xjDwy/KLDmMr2XqYcSSlhc5Fv
 16zl38tGIYxcl/m8yNs/vNGQn8OUSosxfFTTy5Hr0udO0oD1e7/dXNXuBl96goNI467C+FvwJ6d
 LIPfdgqOMFPMcw3zqZZM6kGyMIV9bxGcDaMdtCeblRTIhLoSgTTHNZj7KYmQcmI4xFTH4fY8z32
 6grNUy6mET1lYtegSyzd7eUcgQpQd7KPsRqfQRCdlQTKC1VBb7Yd8sSeyxNRxBwMR3efnY5Avl0
 doO+jaYLwNEpTmGIFyQ/twhpEOorcbgz82M4uCiSLWYqsAwXBFBiGGCdrX6e5GZ6V4vFWYpJeXB
 uDnJRWHqFRwSdjFmP2kk1DyG9p3I5WoMmyFYCEzdc1yzK7DCkKJqmeai1P95MgTgql22IcqJkcj
 RhtA3XQz6Zb5kpCW/AS2q30LFAZR0mAOQ4Jmr/2UJZeL6juctnkxtRjeWQiAPC2zZoCDcH2t637
 kriRoQoAK4u+hg7g/uPrlGXpIZVI7D/mUCqW0wyTARP7cbnu8Vo+shiF7QMiKYNFG4Eu+9sDHlB
 DhwW5kUwmP7fw/4kefVSzdQ3MlG6lYF2Y5atkfgzaO5KKNAcM69hg3OSjldGvLKg9ugxXj0A0U1
 1SiotAyOvkbQXOg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Currently the default value for prefix - indicating the current
directory - is an empty string. This means that if we do
"{prefix}/foo", we may end up pointing to the root directory which is
not what we want. Make "./" be the default value so that the example
becomes valid and add "/" where we couldn't do it before.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 docs/conf.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/conf.py b/docs/conf.py
index d89c13454baa8fbe9dab17b7c3fde6fc59b577f1..04d1cea2a2175166555993c3e936e7cf1ebd0fe6 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -61,15 +61,15 @@ html_theme = "sphinx_rtd_theme" if sphinx_rtd_theme else "default"
 def make_glib_docs(app):
     # For some reason on RTD we're in the docs/ directory while during a local
     # build, we're still in the top source directory.
-    prefix = "../" if os.getenv("READTHEDOCS") == "True" else ""
+    prefix = "../" if os.getenv("READTHEDOCS") == "True" else "./"
 
     subprocess.run(
         [
             "gi-docgen",
             "generate",
             "--config",
-            f"{prefix}bindings/glib/gi-docgen.toml",
-            f"{prefix}bindings/glib/Gpiodglib-1.0.gir",
+            f"{prefix}/bindings/glib/gi-docgen.toml",
+            f"{prefix}/bindings/glib/Gpiodglib-1.0.gir",
             "--output-dir",
             f"{app.outdir}",
         ],

-- 
2.48.1


