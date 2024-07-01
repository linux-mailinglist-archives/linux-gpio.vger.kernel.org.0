Return-Path: <linux-gpio+bounces-7862-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4168A91E6C5
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 19:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B54441F23BDB
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 17:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDF916EB58;
	Mon,  1 Jul 2024 17:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqwZrc89"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DD377115;
	Mon,  1 Jul 2024 17:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719855537; cv=none; b=Nd72vNmSDH7Sx7uZ1DBRtdG0bJfewfpPGIRYMEw+Uq7UkWoUSCZD5IEfMLNX6EpxnEouqbNQq5mer5CIdnGQZqLofsdz6FC4m13s6kyXGaT2cUdDKxkH0ugbEFc5FG6vyb23OWjdFXSCmXwupc6zSDYgfUv9gMmyNw3tBBzBueM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719855537; c=relaxed/simple;
	bh=kOBxA7IVGGFZ288KxierUcGnNHDFAU6FqOFGdWXU06Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c7asEWohMHIxOL9wFcHjyMYoJt7w8V2UchAGXqDFqCVkCw3B8yomXh6BGReM/xTEFUF1xzEKiCJ4UUJwJK3LE3WZuxevmrKWvLxIJsEr1A1ma2twFua37pRr5Qy+/wpiyqeaIGolU3muq64slISxedKJg7Pyk4kM/moPHMH6Z/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqwZrc89; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7178727da84so1703575a12.0;
        Mon, 01 Jul 2024 10:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719855535; x=1720460335; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1uKjwg1PANLg7nylPVFAopF0C8gM3ML6WorgUYgDXvQ=;
        b=dqwZrc89ZGcwFEylcusDQeMICl4y8a6ql+wzY/J+7joR9Cqvxw0x0HE/t/LQQ1+sYH
         wkUT14YWVtboDksFyE4mx7Qn4HpsjLJteiYDmKACrd0IX9WlocSdemRwepulPUjKyVVN
         bIOaltdOz6weLPwlmTu8HagdNaqgZZld5dYsgp9uGi/QjymyiwPxTFy0DGFDKee6w3NU
         hWkkt/rAcySTwXMzvPJLYxxtPFxd4ULsbjGn5WvhH6o/Tyu8+xFk/+cZV16HBUiSwb/e
         G03VeHfQRZjQSc6h+qatQWFbZPumMxjq3Oem7p+GrBC6NoVyMbIGKwy+eNS5CjiApfVG
         xNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719855535; x=1720460335;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1uKjwg1PANLg7nylPVFAopF0C8gM3ML6WorgUYgDXvQ=;
        b=rVrhmVM2TW5dUNKl36ZhBQ2KzQzUN8V6ocXkog1/RPzmzrd3tWuSIJst4zm859gtyd
         0LM6SBJhgYt49dLImYON2MygJCRplhu5idB3q3dC29x4CacefiHNdi7pFAo33yHL4Oar
         9R/12BFiJGNZvw2wgCNHiZIw0HEQj90a790MpwdXjhAs4bs4ZifuoVXlc1Wf5+x5YIK0
         JZ6PQmlnmXNTNtSsVbw1eRV8LuNMpv9my7/C2xAfygQ20ustUnrpEAID5GJQtJMmcEsc
         94BDrVmxIEIco8z/NRGjcgZ9HFn8lJU8XAKqVgYQCOjhKTDyjGyf343RN3JFtsCD69Ti
         OQQw==
X-Forwarded-Encrypted: i=1; AJvYcCU5godaG+jiRX7PnuKgq/Rke2Phbw29jwHZuRwO2yCTq0jwx6LZptamsOrZf0sGPgInek2UDGbspIAB4wDQow3/ZYZwx3pn6mbDyj36la8kJycWFIoR3hNS9Cp6PbLlVsF2jSjF6fNpxA==
X-Gm-Message-State: AOJu0YxD5mq5ypEjyTrzZ/eXnPnp7ZRClDpaLIe0+pZwCA6/66N5KJ6s
	eHu+8k8c/nudK6hsLG6QOyFs59PTYuVGyeZb0U9iJWBwDACrnDnE
X-Google-Smtp-Source: AGHT+IHpWJR47zSzS3H651HaTKDxyE7g0j9sR2JBCxNxhPlcyEre14Sir2f97+266qrkhg/CQhxiSA==
X-Received: by 2002:a05:6a20:1b23:b0:1be:d1fe:75dc with SMTP id adf61e73a8af0-1bef62786c3mr3940797637.57.1719855533463;
        Mon, 01 Jul 2024 10:38:53 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7783:69e6:8487:f6ab])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080256d3c5sm6805517b3a.83.2024.07.01.10.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 10:38:53 -0700 (PDT)
Date: Mon, 1 Jul 2024 10:38:50 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Martin Schiller <ms@dev.tdt.de>, Hauke Mehrtens <hauke@hauke-m.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] gpiolib: of: fix lookup quirk for MIPS Lantiq
Message-ID: <ZoLpqv1PN08xHioh@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

As it turns out, there is a large number of out-of-tree DTSes (in
OpenWrt project) that used to specify incorrect (active high) polarity
for the Lantiq reset GPIO, so to keep compatibility while they are
being updated a quirk for force the polarity low is needed. Luckily
these old DTSes used nonstandard name for the property ("gpio-reset" vs
"reset-gpios") so the quirk will not hurt if there are any new devices
that need inverted polarity as they can specify the right polarity in
their DTS when using the standard "reset-gpios" property.

Additionally the condition to enable the transition from standard to
non-standard reset GPIO property name was inverted and the replacement
name for the property was not correct. Fix this as well.

Fixes: fbbbcd177a27 ("gpiolib: of: add quirk for locating reset lines with legacy bindings")
Fixes: 90c2d2eb7ab5 ("MIPS: pci: lantiq: switch to using gpiod API")
Reported-by: Martin Schiller <ms@dev.tdt.de>
Acked-by: Martin Schiller <ms@dev.tdt.de>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

v2: collected acked-by, rebased on top of gpio-fixes-for-v6.10-rc6 

 drivers/gpio/gpiolib-of.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index d75f6ee37028..38679cf1969f 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -202,6 +202,16 @@ static void of_gpio_try_fixup_polarity(const struct device_node *np,
 		 * helper, and be consistent with what other drivers do.
 		 */
 		{ "qi,lb60",		"rb-gpios",	true },
+#endif
+#if IS_ENABLED(CONFIG_PCI_LANTIQ)
+		/*
+		 * According to the PCI specification, the RST# pin is an
+		 * active-low signal. However, most of the device trees that
+		 * have been widely used for a long time incorrectly describe
+		 * reset GPIO as active-high, and were also using wrong name
+		 * for the property.
+		 */
+		{ "lantiq,pci-xway",	"gpio-reset",	false },
 #endif
 	};
 	unsigned int i;
@@ -504,9 +514,9 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
 		{ "reset",	"reset-n-io",	"marvell,nfc-uart" },
 		{ "reset",	"reset-n-io",	"mrvl,nfc-uart" },
 #endif
-#if !IS_ENABLED(CONFIG_PCI_LANTIQ)
+#if IS_ENABLED(CONFIG_PCI_LANTIQ)
 		/* MIPS Lantiq PCI */
-		{ "reset",	"gpios-reset",	"lantiq,pci-xway" },
+		{ "reset",	"gpio-reset",	"lantiq,pci-xway" },
 #endif
 
 		/*
-- 
2.45.2.803.g4e1b14247a-goog

-- 
Dmitry

