Return-Path: <linux-gpio+bounces-10579-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A1E98A7BA
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 16:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54546B22E53
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 14:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB4D199930;
	Mon, 30 Sep 2024 14:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MQnPF69R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2753B192B85
	for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 14:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727707698; cv=none; b=siB/m2OVQijLztsekPTg8mAMStsJPdurdh5OS2b4ku5pHgDuvcflK2LD9XkdyZnnKcuIo41/ou8GkPv8hvQRTLpcz8aGALo7/RyOLLs/a+5CuvYxhSeHglSObNUNpGnWi+OxD8P+0MPsoHJDOqduoLolt0M5pF98PNBVDBmcVeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727707698; c=relaxed/simple;
	bh=XyeXw8eHm4U0xRIzD5hFcCRVmwEbNSDv589PG5lUl74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pPCC72ZRaNhJifARd12REWeRAUawEcMgjjtoNqf0GdJ/SGhX2DzHu8hqYv8qluzB1WtmD9GiddOO+BsVpsYkF6bvgDwoh8rl0LtwJCNdoDOX6qElMmoJSxaG8HabU04CfhDLsD6wk2MoCQMDhNght/SKkksu76x26uC5u8Kk124=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MQnPF69R; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37ccd50faafso2851913f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 07:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727707693; x=1728312493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfRPqMQ2YRL7cytKg67BDcrJy4YgVjPhIG+hcafClNU=;
        b=MQnPF69RLDKe2DhPGAmndJgnKxSniaiyRZkyaX2Nm4adIw9A8ciIB0yIDSTg6Fyh0J
         PLZTWpe+dUaVelgYYgvzZqREeKn41hv/jBSAzQdK1GodsLqvsWFdscuH1EeeNrTURjdG
         AagOwC7biLl7CuD5VGey7U9ZgMrKRDqSvfB4rfa1HEMunu+xllnKlEDV5Ief0Kc0Ybvi
         KIBeI0pV+Pc8qRUUI4LN46qkEeDjjnbj9qYSZkCuLE5zrLxnu4KBTaDXES3rM+ULtLJ6
         IWUIEtZsDVeOXc4GKmxGAnua3fePAMhHeL54V4L5QHQKklgSWlKZVbl/sMINlChrPiJo
         0dCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727707693; x=1728312493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfRPqMQ2YRL7cytKg67BDcrJy4YgVjPhIG+hcafClNU=;
        b=MQ4lkd78soQyy09G1Fkclv5KBBfrUbulBhCDQqeTi2nFH6oMllaNkCFak7v3LVJamv
         uDM94v2tWjkDD9In0Kcvj4UE9Dm/92sZ/92xKw7zDrUq6ctHPxHaluQN8ezT5pcNG6K1
         ozInQigemYlz9ennkBx4XkL3OZ9JolRVpwn8KdlMorrzeIePFO/Bv1dQsWryA+ZOJ5Pz
         NIZiHwtyYduTXqcqCixBAWzQzBjzVhDlz/Pg57QNEQ5Pae0LqD2ovWYIY6V6ovCUWa3J
         Nyo1JaNzgWiOYsB0dNN74gFR3zfCOQ2ZPwFP7fHngj7UkvrMswhXBPeRdUxwRmel0deH
         Xbkg==
X-Gm-Message-State: AOJu0Ywuhsyp3HF6rIM67EQU38SyAgip91nJcjBx6o8xN4IzxGtSvwM9
	yB+j4Rtb6BKbpobBwAN/52ZB1NxDxeUwskmqKMDIxcKYyOCWWsSVsyReeoH1SiM=
X-Google-Smtp-Source: AGHT+IFS82UmXpIStxa6SqM6CC7PH3OIn3uYOLSrafHNIkj5K/JZaHIK6K+sosLECIqdEFs+/WLaOw==
X-Received: by 2002:a5d:644c:0:b0:37c:c4b4:339e with SMTP id ffacd0b85a97d-37cd5acba99mr8323137f8f.25.1727707693439;
        Mon, 30 Sep 2024 07:48:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8791:e3e5:a9ca:31a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd566a41fsm9241505f8f.45.2024.09.30.07.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 07:48:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 3/3] gpio: xilinx: use generic device properties
Date: Mon, 30 Sep 2024 16:48:04 +0200
Message-ID: <20240930144804.75068-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240930144804.75068-1-brgl@bgdev.pl>
References: <20240930144804.75068-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

OF-specific routines should not be used unless necessary. Generic device
properties are preferred so switch to using them in the driver code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-xilinx.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index d99824d42c77..41c552a58059 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -15,7 +15,6 @@
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
@@ -564,7 +563,6 @@ static int xgpio_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct xgpio_instance *chip;
 	int status = 0;
-	struct device_node *np = dev->of_node;
 	u32 is_dual = 0;
 	u32 width[2];
 	u32 state[2];
@@ -579,7 +577,7 @@ static int xgpio_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, chip);
 
 	/* First, check if the device is dual-channel */
-	of_property_read_u32(np, "xlnx,is-dual", &is_dual);
+	device_property_read_u32(dev, "xlnx,is-dual", &is_dual);
 
 	/* Setup defaults */
 	memset32(width, 0, ARRAY_SIZE(width));
@@ -587,14 +585,14 @@ static int xgpio_probe(struct platform_device *pdev)
 	memset32(dir, 0xFFFFFFFF, ARRAY_SIZE(dir));
 
 	/* Update GPIO state shadow register with default value */
-	of_property_read_u32(np, "xlnx,dout-default", &state[0]);
-	of_property_read_u32(np, "xlnx,dout-default-2", &state[1]);
+	device_property_read_u32(dev, "xlnx,dout-default", &state[0]);
+	device_property_read_u32(dev, "xlnx,dout-default-2", &state[1]);
 
 	bitmap_from_arr32(chip->state, state, 64);
 
 	/* Update GPIO direction shadow register with default value */
-	of_property_read_u32(np, "xlnx,tri-default", &dir[0]);
-	of_property_read_u32(np, "xlnx,tri-default-2", &dir[1]);
+	device_property_read_u32(dev, "xlnx,tri-default", &dir[0]);
+	device_property_read_u32(dev, "xlnx,tri-default-2", &dir[1]);
 
 	bitmap_from_arr32(chip->dir, dir, 64);
 
@@ -602,13 +600,13 @@ static int xgpio_probe(struct platform_device *pdev)
 	 * Check device node and parent device node for device width
 	 * and assume default width of 32
 	 */
-	if (of_property_read_u32(np, "xlnx,gpio-width", &width[0]))
+	if (device_property_read_u32(dev, "xlnx,gpio-width", &width[0]))
 		width[0] = 32;
 
 	if (width[0] > 32)
 		return -EINVAL;
 
-	if (is_dual && of_property_read_u32(np, "xlnx,gpio2-width", &width[1]))
+	if (is_dual && device_property_read_u32(dev, "xlnx,gpio2-width", &width[1]))
 		width[1] = 32;
 
 	if (width[1] > 32)
-- 
2.43.0


