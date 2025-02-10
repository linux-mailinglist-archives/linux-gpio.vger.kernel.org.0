Return-Path: <linux-gpio+bounces-15654-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CC0A2EBDF
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 12:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 342D53A8013
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 11:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2635B1F3D5E;
	Mon, 10 Feb 2025 11:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hb3JQqVr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A88D1F3D3F
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 11:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739188192; cv=none; b=QMoufhTaVLaLIE10ThAjSFmkLNIzT+urdmuc45UOKn6JuLUDcSaFjXNA/0xCclen0/cJW8umEBS2OE+JJN8N2ZcMooHoyxI2quqpLlAwJIcxPRLgTabIKbzCVZyGeelhpwMGV5TpnOwRhiEgdxgxj3l7qE8WIbFkogRFIO/4Bhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739188192; c=relaxed/simple;
	bh=LnIWPwlyM/8ENYW81f37MvCRjBLr8uT8Ig1qt/tLfLI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FGDABF4lEcxa+FEQzK3qF0m3hxsFAI04uWMI7/2mjZ6OZpT4vTBUbDqb78gCVQeMv/XnubjbGY6PMNHFywNorGd4jKT4ouEOHLlsvKhbpicZchAXGaA/3Fgh/NxSo9T0qZYuc7lFvASmXXmhFPVspBJb5d7QzqIci0+OmvrzEgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hb3JQqVr; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f5e943543so4070475ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 03:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739188190; x=1739792990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ivq4rOjqcMtcp86r8Le4OyvwVvaLK9Ybknb9whMQ8sw=;
        b=hb3JQqVrhA32ngE+BU24qE5ubn9QhQAnZYFifKNVi/a4xImesDPjdjF8M1Mh1SNV/J
         8gxiCJ/qcZdo8ewAxHLhfr5Y1SU7Q5ftPB3Whba/sKc5rFmoV0McdJvrO6u2Fu0awM6g
         2VfqyAtWL1infW2SNHdfVwTZMlFqkB8fS2WXoWDv1Byw9JXimBM+Bq11qameylE93SCM
         miy9r8QRd6CloieUc9SxkV70Cmie/Gzlt63sOv1gUuf0bZAR2XtsYtmgyG24OWJiLnIm
         Yj2uh2cetkBlnlT/bkXLOqpNyUN+j6b/WG63cu8K2+QtqzBczSma0EEw+X/N8oeAg5KE
         vE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739188190; x=1739792990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ivq4rOjqcMtcp86r8Le4OyvwVvaLK9Ybknb9whMQ8sw=;
        b=lt6TyBaexQ5gWXHvqZlNO+7MU3IiaXKn3lcN7DBtdRo7Wx4X5VArb7ZQeszz5tW+AM
         OwsT/UzifYR133yeAe0O+4D8aRYhYys4h2z6p/pGZ3Pke08HDS+4kIu6CVFnkVd5LgL5
         f1szE/2ZJbylbFRW+/pDybwYQnfCQhR/FRGb3hzopoFlDnpMatLGu+r9RyO2iw9rwuAh
         QUVKWs5A2hJGF8WFbR9iCHwICLLhRNgTiKYmP800j9AIdKWRHn7sMXuNqi3vL/v/Xq1M
         PAqkBcRdYoNMtWH1fqnvDGKXkXYpQn+iEjs1jkjxbnbkILcGHatCMeH9ni4E/SWLt8hn
         nXfw==
X-Forwarded-Encrypted: i=1; AJvYcCV57vpsDzWeGSS2UJaUEHiZsfGRZlepC424tcJ4w+3loJda4srSEK2gNylvBY3ALSZw30PYkp0j6w+M@vger.kernel.org
X-Gm-Message-State: AOJu0YwHWMdLOlCeRt2Bvd7Nu/E+GiWJvhyHgYXvzyH3vU4xF+Y77hgk
	/jWiAPIYhO4OTH9pGbzkFTId37qXF+eThXA49IubglJoYXrfTcBy
X-Gm-Gg: ASbGncsck2olZjmSsN1CqdKhVsmCebWNmkcblvGvVIGiXVdtE6pvognYD/ot6f6TWIl
	WUmD7A1YpwD3XSLD5j4GjKnMPoOI+LQjAjA2DZbY8njgwuXM944PpY/xo2gSiTDyc1jRez597ey
	S1LfWlBueUOxySDSaa+X0DlZRz2CBa/dKAGmfkPsWkVo1llOgPIQ7OZzI4XTudG0ep0H2G3rFEk
	TJ3IgnxxoyC4HmQ9BeIRwMfoXhOd+Py+jwEfR02P2FJ11JSdFzFHy98B84jjWw6kyg3XY4iA0ZR
	mkjgzZMdLfkf3+Hr1v2yanVxrhhm
X-Google-Smtp-Source: AGHT+IGqyt0x8perOxvOGaYXy7nT409A3phfwrJpRPWWjTCB6RpC8xBN5ySrfOcN7s5jEAP1TdqkUg==
X-Received: by 2002:a05:6a20:d49a:b0:1ed:acb6:7fb4 with SMTP id adf61e73a8af0-1ee03a41ae9mr8636078637.3.1739188190526;
        Mon, 10 Feb 2025 03:49:50 -0800 (PST)
Received: from localhost.localdomain ([45.78.50.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7309569d5e4sm1103778b3a.162.2025.02.10.03.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 03:49:50 -0800 (PST)
From: hlleng <a909204013@gmail.com>
To: info@metux.net,
	vireshk@kernel.org,
	linux-gpio@vger.kernel.org,
	virtualization@lists.linux.dev,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	viresh.kumar@linaro.org
Cc: hlleng <a909204013@gmail.com>
Subject: [PATCH v2] gpio:virtio: support multiple virtio-gpio controller instances
Date: Mon, 10 Feb 2025 19:49:35 +0800
Message-ID: <20250210114935.204309-1-a909204013@gmail.com>
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
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/gpio/gpio-virtio.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index 93544ff62..ac39da17a 100644
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


