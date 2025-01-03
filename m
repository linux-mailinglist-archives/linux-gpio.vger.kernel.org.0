Return-Path: <linux-gpio+bounces-14456-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4219A005D2
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 09:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0B60162E8D
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 08:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC221CDA09;
	Fri,  3 Jan 2025 08:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKzrB/j3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAFA1946B9
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 08:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735893341; cv=none; b=h5qxDGUSXFKkcwziB1NfwHsbFIUMzSoJPU/rzrLIqUHYopRGqu3Ft0n5On41BYH+ir/+WS+/i6X0QdHoW8UYg/Rguf5ZxDJeDRUbmg2voqwCdt6yzPPBCDpXR/YA9I2EZhngXTl5pP3CRcwCdYj1e8dvrg5e/+LJVsCnH618Hbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735893341; c=relaxed/simple;
	bh=m6o9aISv6L3EEBwD7nPuVZXQzsoBVQIjPOkdAPOO2+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VM1hcgAVbju+pECKLTODqWQEqPEM5b6/teYjBH/nIdEzeeMsyAWNfgH/94v/2O3RnHFYuH7uJLJzS0TiAwIaoplglrTsaZCvEMwfYnjtxYV4Ix4RbGrfgFu5wCf86ASLCeJ7Dac/VCU+FyfRomTV9KKxb6PeDpvFHlQR4/HnKDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKzrB/j3; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ee534d6800so2444308a91.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jan 2025 00:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735893339; x=1736498139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0mNSE5l1moO/1n7caacSdxfwOs3Hhsbfh6K+K68U36Y=;
        b=YKzrB/j3/mUVb4IVfGjXDfr262+bwV53mOD2Nfkv+collNXLmcKZ9nasc89sv2VZiR
         VEaJyq5SSKxqqVLLSoaS0/mGKODwLAvjv3Gz8ciPgsCuOX1/Ua5+VdIFD+p5TNq9sfJ+
         mdLxnmJB7w2IuoaS2FqtI81+2gLgaMnXhCqruDIjhQGT8C57f54yce0BHOKcfUhOGeLh
         rsyzoyO5whq21xo5qxmn5FCVl3fOl8uvbmpURKHRr89N4ghhktvU7wZn0fakWXORe+Mq
         FJq3FwgILLAddmnApOo/SIJ9UFtUNfWNmTDtH19Ds4F2AqJY7ahWZVC+SuHR18nJSYOr
         tsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735893339; x=1736498139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0mNSE5l1moO/1n7caacSdxfwOs3Hhsbfh6K+K68U36Y=;
        b=H0aaF2bOkDTPPkaEd87zCXczCfuQnFDeLijUUT672J60u7YVUlSoyiw0V1YoMXT0mK
         QwjeeuxwvynG/oXpjOkr6a5POLvtj6eIRQMH2Kjg1X5xdhvIUrdHrmA9/iQifVvufo85
         V9TezRPaI1KwjV6eang4XpaKwOgfw+pbMnmF4kv/VStmpw8skutDswRIVz5Xh/88QTwj
         xvtrsW8yBelOifKzN4dlvHUga2O9XgYp/ZoPoKxnb0UVS2HQB7r67FMcJWJakg6QGzmC
         MsiBfsGK6Ui4S7ZNlQLa6VxhlPJKl9RJzDSAXwwK/wuR0s28HRO0qRHLx/DhvwCdfvZZ
         07xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBWxViAXensvh61cLUOwhNA41+bTF5Z8ZhzXyBvXct544AfqoGPp1Rq18yJC09rBfdaJYC7tvceEgl@vger.kernel.org
X-Gm-Message-State: AOJu0YyKoNkJbdB53fFQpyfYBsEM7W+RvMIg+cVoz1IuhniE2CPD2nWL
	gt2TOVKaB+hD7arED6k2B0UVcxBS4mrIX54DoLPT2VAnLGAvM9dm
X-Gm-Gg: ASbGncsWNl1dp6cp6KCqnOZ7jJPsHGg2fOuwEE0dgELKnHdV2tG+bcOqOSROs29Yr2c
	JEh30Be3CuMhvIIfvJ7z/3++TS6S9lEx1WcwmlO6JMYE9xPdJeTaefQ3pC7LYXvt0fdkZPMBhSK
	eyknhHwe2RsE4LKwcbt+VKkdujDvckpmPgoD5I5tlWIqSmskh5wWprvaeQMowdSbqA4pOc3jrdf
	6ehAx4TE3kibzRNZWQsLZMNPRh7IZ/BQ18JE6XW6oYaCyr4cTu02IsUFz/UixycmsllzQ==
X-Google-Smtp-Source: AGHT+IHRV/PrvU4It40AKrowU5SGQvvYdkKFhMC4R60rhuMGOLgJUiRFHyCQsx08hnHqoCcTPaqexQ==
X-Received: by 2002:a05:6a00:6f4b:b0:726:380a:282f with SMTP id d2e1a72fcca58-72abdd3c245mr27376891b3a.2.1735893339150;
        Fri, 03 Jan 2025 00:35:39 -0800 (PST)
Received: from localhost.localdomain ([45.78.50.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad836d22sm25727340b3a.77.2025.01.03.00.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 00:35:38 -0800 (PST)
From: hlleng <a909204013@gmail.com>
To: info@metux.net,
	vireshk@kernel.org,
	linux-gpio@vger.kernel.org,
	virtualization@lists.linux.dev
Cc: hlleng <a909204013@gmail.com>
Subject: [PATCH] drivers:gpio: support multiple virtio-gpio controller instances
Date: Fri,  3 Jan 2025 16:35:20 +0800
Message-ID: <20250103083520.1764441-1-a909204013@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify the virtio-gpio driver to support multiple virtual GPIO controller
instances. The previous static global irq_chip structure caused conflicts
between multiple virtio-gpio device instances as they shared the same
interrupt controller configuration.

Fix this by:
1. Remove the static global vgpio_irq_chip structure
2. Dynamically allocate a dedicated irq_chip for each virtio-gpio instance
3. Use device-specific names for each instance's irq_chip

Signed-off-by: hlleng <a909204013@gmail.com>
---
 drivers/gpio/gpio-virtio.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index 93544ff62513..ac39da17a29b 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -350,19 +350,6 @@ static void virtio_gpio_irq_bus_sync_unlock(struct irq_data *d)
 	mutex_unlock(&vgpio->irq_lock);
 }
 
-static struct irq_chip vgpio_irq_chip = {
-	.name			= "virtio-gpio",
-	.irq_enable		= virtio_gpio_irq_enable,
-	.irq_disable		= virtio_gpio_irq_disable,
-	.irq_mask		= virtio_gpio_irq_mask,
-	.irq_unmask		= virtio_gpio_irq_unmask,
-	.irq_set_type		= virtio_gpio_irq_set_type,
-
-	/* These are required to implement irqchip for slow busses */
-	.irq_bus_lock		= virtio_gpio_irq_bus_lock,
-	.irq_bus_sync_unlock	= virtio_gpio_irq_bus_sync_unlock,
-};
-
 static bool ignore_irq(struct virtio_gpio *vgpio, int gpio,
 		       struct vgpio_irq_line *irq_line)
 {
@@ -542,6 +529,7 @@ static int virtio_gpio_probe(struct virtio_device *vdev)
 	struct virtio_gpio_config config;
 	struct device *dev = &vdev->dev;
 	struct virtio_gpio *vgpio;
+	struct irq_chip *gpio_irq_chip;
 	u32 gpio_names_size;
 	u16 ngpio;
 	int ret, i;
@@ -591,13 +579,26 @@ static int virtio_gpio_probe(struct virtio_device *vdev)
 		if (!vgpio->irq_lines)
 			return -ENOMEM;
 
+		gpio_irq_chip = devm_kzalloc(dev, sizeof(*gpio_irq_chip), GFP_KERNEL);
+		if (!gpio_irq_chip)
+			return -ENOMEM;
+
+		gpio_irq_chip->name = dev_name(dev);
+		gpio_irq_chip->irq_enable = virtio_gpio_irq_enable;
+		gpio_irq_chip->irq_disable = virtio_gpio_irq_disable;
+		gpio_irq_chip->irq_mask = virtio_gpio_irq_mask;
+		gpio_irq_chip->irq_unmask = virtio_gpio_irq_unmask;
+		gpio_irq_chip->irq_set_type = virtio_gpio_irq_set_type;
+		gpio_irq_chip->irq_bus_lock = virtio_gpio_irq_bus_lock;
+		gpio_irq_chip->irq_bus_sync_unlock = virtio_gpio_irq_bus_sync_unlock;
+
 		/* The event comes from the outside so no parent handler */
 		vgpio->gc.irq.parent_handler	= NULL;
 		vgpio->gc.irq.num_parents	= 0;
 		vgpio->gc.irq.parents		= NULL;
 		vgpio->gc.irq.default_type	= IRQ_TYPE_NONE;
 		vgpio->gc.irq.handler		= handle_level_irq;
-		vgpio->gc.irq.chip		= &vgpio_irq_chip;
+		vgpio->gc.irq.chip		= gpio_irq_chip;
 
 		for (i = 0; i < ngpio; i++) {
 			vgpio->irq_lines[i].type = VIRTIO_GPIO_IRQ_TYPE_NONE;
-- 
2.45.1


