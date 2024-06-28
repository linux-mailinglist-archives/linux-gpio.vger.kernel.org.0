Return-Path: <linux-gpio+bounces-7808-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B38FA91C5DE
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 20:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3D591C227BA
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 18:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597F51CE0A7;
	Fri, 28 Jun 2024 18:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VoQBUR+4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8ADD1CE09B;
	Fri, 28 Jun 2024 18:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719599725; cv=none; b=mWO1Z8odh84AEGEeQPxZWHjboNN5VNE8aSfNAD4NWxyJnYi6sjX8ETZRKdXC2PfQljhfHza12kx78h4mUdhNvNX1naxJ3SC/QxzoEt5ywk8iBWwTjwhmcIc6P72qVmYA/k6bCQKUqjCNN7KscTWN4eEaV52iMv34FHQmU0neOWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719599725; c=relaxed/simple;
	bh=GOsdMilJvLMHAOsYb2Z083Z+B64KSGROgNmdiqfg0z4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aUJZiCNFXjbFmYQk7me+BX4NdQj/HbX0hkgnlGuXHTftfriTVneHoVIrM+kWZ2Bve5bwVhxTVQo+1o7S5eM3qsrtY72khaC8801snA0Qr3ocrw+QDmEKVLR4ybsd8UTif2tV98H727SiPP/HASMhOnjaRLWIFIbuAfb/zEymvqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VoQBUR+4; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2c9357a2647so385519a91.0;
        Fri, 28 Jun 2024 11:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719599723; x=1720204523; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UBGqppPEgcrJ3GF42QUu1svvxoo9ZNIZ7HPafu0hexg=;
        b=VoQBUR+4GVEH3eGryRk913rNaiMl+OLqoC9tVUDkwblXjkVCxb5Ma0CqrQIfQjNSPf
         ALB432ey38ZhwU0yvy85UsVFpitLtudmyuiPBYCucQ0QvXI3CpshObZM2PvFogW7Mvf4
         WfX3/82aeDK2Bic2LXUkFRyQXRexUznjl6JLFxOa2LuN+kg0QqcytdPIf06XfMO9pxaR
         YZr4bIDcM0Cgns3MFJCtywHWkVep7E3GKSrLbPHEBZQGYPOLLUW/eXOqq/n70UC3yGbz
         P/HXdf0OmCWnFtrYHwIWNw1dg6udpb1ucYxNH1cFThyKUGl6OOkj7ypCTFiYrbfIvWeF
         Pmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719599723; x=1720204523;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UBGqppPEgcrJ3GF42QUu1svvxoo9ZNIZ7HPafu0hexg=;
        b=p8GRPXGKHXA3aQw3NK0pMM3JUViOAhV9MtHB5JYHDHchXvClyJuBwk4+0xFCB0M5Dy
         6TN4KFLX3ziMyQOtDZJKeNlEpqfbX416hgBN3ycdjSF6i35B/z0mOlLlH7myeaOJIkLb
         M+LlOOp6z3pZLB6IDtwINfiXrS+tpfGHiFrRRqXK3RS3D8Pc9L3vD8ISQmFobn5bvURj
         Pt2pQGj6FVqyAcffJCr2KRNnn4H9TMogYTp2Bm0awXocPx8QUq+Un+fsE8lGMhWiP3Ra
         Qx5jjF2ATrdbbhM4j0XgdwR3SlQQ0m5fWE1PU4T6MRdbtIrdcya7U8ecAf8lWHzXKmYQ
         l9tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkX7CkvwOma8a1h5UM4MVK87df7eKED3djgcQfp8+QmvNbv8u6bEs1EwWvtV0Gu42zZjw0C2lskMM7xmgQGLAP2UeVNHvWG5jHbVn5Bk6swTotydEogBDBdw4fMMnTFRt1Eg63o46T/A==
X-Gm-Message-State: AOJu0Yw+ZRuw8qco0eOowXaf/LJYT5ll8sCZulnJjzhOgIQV292h1AQU
	NkhyujzJz9ExWhO0QIBA47N6g0PjEzBGnRMBLBWIKRLQrHmSLHw9hx02Vw==
X-Google-Smtp-Source: AGHT+IHlrJJkXKFLv3v4ZK3tPmFSE1CR+4ZgYoM2ZkbAKQ8LLKylZTEo4VpWF8zp7NYcjuECjSbq0w==
X-Received: by 2002:a17:90a:fb55:b0:2c8:6582:16e8 with SMTP id 98e67ed59e1d1-2c865821805mr11332689a91.3.1719599722766;
        Fri, 28 Jun 2024 11:35:22 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c929:2998:720d:a104])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91d3bc596sm1962671a91.39.2024.06.28.11.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 11:35:22 -0700 (PDT)
Date: Fri, 28 Jun 2024 11:35:19 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Martin Schiller <ms@dev.tdt.de>, Hauke Mehrtens <hauke@hauke-m.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpiolib: of: fix lookup quirk for MIPS Lantiq
Message-ID: <Zn8CZ47e3LFncrDP@google.com>
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

Additionally the condition to enable the translation from standard to
non-standard reset GPIO property name was inverted and the replacement
name for the property was not correct. Fix this as well.

Fixes: fbbbcd177a27 ("gpiolib: of: add quirk for locating reset lines with legacy bindings")
Fixes: 90c2d2eb7ab5 ("MIPS: pci: lantiq: switch to using gpiod API")
Reported-by: Martin Schiller <ms@dev.tdt.de>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 59c7f8a2431a..d21085830632 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -203,6 +203,16 @@ static void of_gpio_try_fixup_polarity(const struct device_node *np,
 		 */
 		{ "qi,lb60",		"rb-gpios",	true },
 #endif
+#if IS_ENABLED(CONFIG_PCI_LANTIQ)
+		/*
+		 * According to the PCI specification, the RST# pin is an
+		 * active-low signal. However, most of the device trees that
+		 * have been widely used for a long time incorrectly describe
+		 * reset GPIO as active-high, and were also using wrong name
+		 * for the property.
+		 */
+		{ "lantiq,pci-xway",	"gpio-reset",	false },
+#endif
 #if IS_ENABLED(CONFIG_TOUCHSCREEN_TSC2005)
 		/*
 		 * DTS for Nokia N900 incorrectly specified "active high"
@@ -512,9 +522,9 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
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

