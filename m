Return-Path: <linux-gpio+bounces-18414-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CECA7F5CA
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19C527A56CB
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777E517993;
	Tue,  8 Apr 2025 07:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZULZqffn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDF325F981
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096677; cv=none; b=d6tHDQ6JLn6g+dbtFSFE0WaRbnfZJC+M/UPF0IyljJfyp7Spf7wVeylfJdLCb5dCAKIMBozBkUuAysErLpczam3kSQ3xpSZRwqWaDI2pgx9qUz7L3syvSV/rrQUixBm8d/Rwmi2+FCE4twJVWeoMt1a4Rl1m9ObDNnQ1GLNKqhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096677; c=relaxed/simple;
	bh=mm+CYE4HlFqyXrmHXF0COUC9+WgpXE6WtAJk1HFSlKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lLYwtcX8SlkvVJ8sUdSJAf7T+61nG56lCFhNuUQwZ3NECnPV+2iHBg5EMbEiLKdD+WAhzanAI1d1I8uFbEUp+33O+2FPSOoH9LfElqIskq+XUwol/EGzUxwVGpMMoEEKQWgBYkORaXjQe6DPyRjqfzb7o9aTU41mouycuMHvy9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZULZqffn; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf680d351so36280115e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096674; x=1744701474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgKpi2eMQzrwoQvXzcbqAzy5xxQOgpVGvK0+n6zqybM=;
        b=ZULZqffngMELte3ct9tsSzgXaFDt3iCneO9p0Cys3zktRJcTIi9pCuWcJAJyE2Yc4x
         XTIUfkGue3oSXimwM3L0JUP4h7bvXsGLsNcVbX/356VXDtoZ+TuN+CcJXn7T4xHW/nYl
         aIWZSUIEN8A2+lIKrSGAgTKngWExfavu20MR4QipvwKZRsAURaZ/Vhs8odG00CrgGbVu
         Xt5vqXpPyJk0S81NSa3qnYkgSCye3ti2ynlfjcXVtCztgBtZP8crVMeZrjomD6VJTWEO
         GeD4JmbOOC83qZ9+iWzuRWIAhXcp8KOZZ+79Ohgpfy0UUmi8cHngEK3HiXGFCY1osUjU
         Ka9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096674; x=1744701474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kgKpi2eMQzrwoQvXzcbqAzy5xxQOgpVGvK0+n6zqybM=;
        b=BkTQXIHq+j2CQ2sImhFmJ0bDIycKw+ixkXPShVJhWBNFYh+aFzv3L0BoYP2AjKoxrX
         5MhBxNrrUOFmnFkW83qswpAS9Kt1rbFDL7FDPyyMQrnO2Y5sfibrrQl1osCSpnsAuuLC
         B5PNL1wFQPr+I7bwfVAkpy/+qni40FTPVcMYlpj8rUg+91AjR/Qs/7piufgYrXWzoa/H
         uYB77eMQZ/aXsbCcrbC1LnxL3zQbJYdELFjiWEpkRbO4eNde+z+qzo5KMZJogR9yyVVS
         LK8te3aVPG9ZKw40iT7yvFJRzX8+Zg/1Ua0kJ1L0yGOV3yoLW9TtPIruI/O9SBqVMLBZ
         Icmw==
X-Forwarded-Encrypted: i=1; AJvYcCX8aTs4MJP+uw8nEWwSHpO2zlnKwdT81k3InPB7BCVokZonJhk6Ef5PmfP+CZjBRf0KEeV1ZR4kII6Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzJoZO9OXUwjaue9zO2NS3md5gGwsfqUgH4Vd6LGKYQDX8zl0IY
	jbKk7ycnul8KP+InpWatEsju6h3juD2fsksUzUYiLb3v4FbhbCzcGPgGSEMgBiA=
X-Gm-Gg: ASbGncv4h6G34qKH/aDZJJra2Ss6e0Zurh9MPD/inRY0isRP138v+sDRorcfZi1LAcz
	Ee9eUg9/ZXaC6vygh/0vGSwPdQ73xTaWBtrX4+gAzqiX1yL1Kqcog/+a+gBIeqT+MlVcYuZ4MOt
	Nyvov/KqBJPKvK0yOO7OYxCV1IoFQCcLQBAQqLsWp2OM11vN4Cn2wvrwIbtchXwvOya0BJG/0Ey
	z9wXPKqfTNVNIPiKJcdqBIrw1V6xnA4hZ2/LV+66KXKrwcMcu+oXZKk0f9LgMNM2kZUGsx1XoLN
	uK2X0mDFtwFC9vRsazi/QNxERmKRRz6aba7VEA==
X-Google-Smtp-Source: AGHT+IFIDoEgtgjZmRm76oLe4qBixaJVFcxIWBxSgP9eQc/+muRPjB5OZ4DhcXqFSFfMWbn8IPCLNw==
X-Received: by 2002:a05:6000:2484:b0:38d:ae1e:2f3c with SMTP id ffacd0b85a97d-39d820eb1f9mr1593525f8f.25.1744096673169;
        Tue, 08 Apr 2025 00:17:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:17:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:40 +0200
Subject: [PATCH 03/10] pinctrl: abx500: enable building modules with
 COMPILE_TEST=y
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-3-c9d521d7c8c7@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=7gT59a+ieEBoRyUfHtp8d/jvYbZrPQXR8M3Rkb54480=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2Z62HjgrUOk13umM6zCKtt5wsF8hMyPqGii
 +FbeYzWZu2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmQAKCRARpy6gFHHX
 cr+9D/4pVK6myjhrhbvOnoR4PHJ367IIWOAh/Zh8cc762qftCq98AjRSHWjpi3KMWk+T1SoewR6
 yd9FAaYyN5ggStwHN8ifchYiv+JA8sO+i6UuSIOQUVQzey/SsbW1SeTgmZ3o/GsdKPG/HjoxejZ
 M1kbfrXMCRWGU5zTxGwLAZl126dUhXDTKScOqGDG6ZLFctZH0MSBmu4Nu7uWpRWQK3R+Xr6OGfa
 +BSLVhz77RThlP5bmwNejIlKFQNdlTKOpKLwZ4d0FEN5QJPa8Epbb+Vvkputkda+ERCCbCEvjf9
 8ZSHC0SCNCcLyorbyOA6rgYWiPo+GZMHSqoF/Pl1OFZzp2mCtAXPyQrKJ2wv0I5KYUJSLuNstbX
 pAA8HtMWVKN2o8VTfFf0kYbEFAo7BM5D+3B86ctemR78XtjX9vA/33qPRw6qbRuWNjF2jLMxwGg
 7sr3CLWFwcyqt8oNdhyjEWmfnIO2z+BYPCo7Btr52pKon7rbGIyJAAG4gxmUqgjRO/PJ06aCPjV
 erKdtcafZvxLT9Mf2jX/+expNbOTo5PKgOvekHmSlI2xdATbBZgMQPxFNUNJVlXLL3UGV8fR/Zh
 +ApMwVs12NjHuf/sT9aZDxPH2zbKJvARpXLKynmGD52HIn+u06LPHHbZH2+obwAez7+Tde1ydSJ
 G1AuErL37JcATMA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Increase the build coverage by enabling the abx500 modules with
COMPILE_TEST=y.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/nomadik/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/nomadik/Kconfig b/drivers/pinctrl/nomadik/Kconfig
index aafecf348670..2c1f8a4f5d24 100644
--- a/drivers/pinctrl/nomadik/Kconfig
+++ b/drivers/pinctrl/nomadik/Kconfig
@@ -1,20 +1,20 @@
 # SPDX-License-Identifier: GPL-2.0-only
-if ARCH_U8500
+if (ARCH_U8500 || COMPILE_TEST)
 
 config PINCTRL_ABX500
 	bool "ST-Ericsson ABx500 family Mixed Signal Circuit gpio functions"
-	depends on AB8500_CORE
+	depends on AB8500_CORE || COMPILE_TEST
 	select GENERIC_PINCONF
 	help
 	  Select this to enable the ABx500 family IC GPIO driver
 
 config PINCTRL_AB8500
 	bool "AB8500 pin controller driver"
-	depends on PINCTRL_ABX500 && ARCH_U8500
+	depends on PINCTRL_ABX500 && (ARCH_U8500 || COMPILE_TEST)
 
 config PINCTRL_AB8505
 	bool "AB8505 pin controller driver"
-	depends on PINCTRL_ABX500 && ARCH_U8500
+	depends on PINCTRL_ABX500 && (ARCH_U8500 || COMPILE_TEST)
 
 endif
 

-- 
2.45.2


