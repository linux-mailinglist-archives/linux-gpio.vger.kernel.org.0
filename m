Return-Path: <linux-gpio+bounces-8940-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAA7959B6F
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 14:15:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41A7C1F22A4A
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 12:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037C8171E43;
	Wed, 21 Aug 2024 12:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Qu13vSEb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E07315B54B
	for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2024 12:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724242506; cv=none; b=V5rGKCOwco+0KZwFS6Hbaz8J+iWoBXKuS65G0u+VT69cxKQ4KQ3s2zKkY9ep7IGz5jud1OMVim8jFxGhfT7M1AaRWoVj2oRCLIur6MFfln7vfVvHHbXFdhFxUrBMWJIgaB5TxbKBEN7DUkudURowk8V1oU1oBl/e90O0BFjQHTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724242506; c=relaxed/simple;
	bh=/0VUObltFI36YwzvQUOf07lA1enaqqy/ADCqR56tepE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y6RWxhsDSITFiO/rdQ9wVLG3792ISB1bFVtzHG8j/aQQ/SjLrvy1hUorjC9pRUa/0rlk07GHebPKpZQ/vuBbJjCH7QpyMqSqDjdaWBgs5DDubxVPswt2hx30WH9Xb47UBtBqgezF8EjNpkilR/zkbSktUvkH6MUIx/AOGDf/ycI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Qu13vSEb; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-36d2a601c31so3832867f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2024 05:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1724242503; x=1724847303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eNEYv5X2eaQvG8N/4e9judfOPIHJ3R5WVAeQVepl5OU=;
        b=Qu13vSEbHq3fytHJ+gtPGd5SNOeFcu417KeCSh9+i/mm75eG3X0/rEpd9WS823dUQ6
         +5rwADpGrmOWzDzdWqPQQiFS37GK2Yef08D1zz4klRpMEfNsJ3GJrbqbUeRZCO18r2HR
         3OXZLSBPhm7qldjLvbuqgJswC1hA+TkVOTr12S2uQtBxJNiwMcx4jRMs4J2LCbj4R1eh
         TThqSxX3GJg3sFQTJpF2K6hpoTIby95dRIiKfOMrRKJB3TvYnSIXSBmjP79u3JQHwVho
         8cDU+5Qaqzt1ntKN4C3+hoZKJkKx/Ilo3tD2kxV4n04qwMFR9YxOncPIvL2jxOj78ACH
         JWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724242503; x=1724847303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eNEYv5X2eaQvG8N/4e9judfOPIHJ3R5WVAeQVepl5OU=;
        b=q0+zUqEIndeaouy8tLdOHeVhN+Bn62sdGZdHdplQQHPOK9Xi1VBgIbYvCi0aGsHHkX
         uX2U7RdXu5qmTdFMIl0vwvt9o6YOELd9yFgGj0sKdD3mCpZWuzRo8PK/SyiEYwaR82i3
         VHLvS604YNRfpFkQriROt63oLEjA5bL3Vc2rRdmqFiiVNO9KjrcgyuBQ6mglVKnh9r9F
         2YtkilA6NGIP29jw5EDLwaRUgWMWUHNTh/vT00dyrjdfXNHoxXbFF2lgBv1b9sRUP3J2
         SOW63fsqfs7W0hwLdNDYdsIjNBLrFC8NdRe3T1gRYQXxSste+zIk2JALPS0Gyf58vUtX
         4cnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+Wj/TAVUoAuA8O+l3bJBedBLUxBlRuo+Zh1zawVkmmqv2jzTpIxobMgmbz0DPO+iOXNZIfGT+rzRt@vger.kernel.org
X-Gm-Message-State: AOJu0YwNYAktlNYykmznHrYDxHJMe86KxUObLaNdKQV71GcrMSPrYR6u
	suzVnIwZae5tk+2YWliZ64hRAFbQhIKbdWP81rHv0FLf99ISBEuQvTBB5ofCKm8=
X-Google-Smtp-Source: AGHT+IESkq5T2JFkI+DO8A4yBDzS+8in4n0X7cqNUYMPHMjQFQFHAT6eBufSmUam01sj30Xhz3cNcg==
X-Received: by 2002:a05:6000:196b:b0:371:8bc9:1682 with SMTP id ffacd0b85a97d-372fd6f1402mr1455433f8f.33.1724242502824;
        Wed, 21 Aug 2024 05:15:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:42a6:b34f:6c18:3851])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abee8b43fsm23056595e9.12.2024.08.21.05.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 05:15:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Alban Bedel <albeu@free.fr>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/4] gpio: ath79: order headers alphabetically
Date: Wed, 21 Aug 2024 14:14:53 +0200
Message-ID: <20240821121456.19553-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Put all headers in alphabetical order.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ath79.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index 6211d99a5770..be2952fdae3b 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -9,12 +9,12 @@
  */
 
 #include <linux/gpio/driver.h>
-#include <linux/platform_device.h>
-#include <linux/platform_data/gpio-ath79.h>
-#include <linux/of.h>
 #include <linux/interrupt.h>
-#include <linux/module.h>
 #include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_data/gpio-ath79.h>
+#include <linux/platform_device.h>
 
 #define AR71XX_GPIO_REG_OE		0x00
 #define AR71XX_GPIO_REG_IN		0x04
-- 
2.43.0


