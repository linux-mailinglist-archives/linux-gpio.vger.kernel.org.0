Return-Path: <linux-gpio+bounces-12406-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 975529B83F4
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 21:03:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0027CB2207A
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 20:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16C21CEADC;
	Thu, 31 Oct 2024 20:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KukWMSYm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0BD1CCEF1
	for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 20:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730404931; cv=none; b=cqBwdoH5RLNDrHaem1QpF5Mi8dchWAvpOQscqlAId4dChNlYfJj0yjGddvXySBzH445T13e01Tr4YKe2SQd8Cjn9AVRpQbWnaU7WOHkmfJv/NO1WDVmkHzeXHc20u79ASddGkAsu7AuEiHfmS5WHXRS7fHDKTFNJd5ASjSd+t6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730404931; c=relaxed/simple;
	bh=grXFaneMr1ISdxB6vm0ixLnCulIRiajDw5Hs4ZGd2QI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p30kw5J6vpYOqz9UKPuVEs11igy9z2wV5J7uy5sxeBSkbwTsCHqCq/h2IvW1iv7wVr7RqEmdq8WPYMzWQZW8Vhsj6stfiDse8JmwPFly3cM3LZvkVuf/SoNL9VdafZ00ZJZy8jNlGAKMHm3rGFXQmns0vTpgjRoE/sLoGC9vgkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KukWMSYm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so11723835e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 13:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730404928; x=1731009728; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HG0t4NeqbVLn85G3sOjEZke50iDELODkv6ssAwuGw0k=;
        b=KukWMSYmZAP0rQRob9dCMV93pkgneMVxONCqrE3ElMEVOCe0Oyl4YnCVYc7iLw4Ho7
         KzJHTBznIQr2yhKI+F3iohjJnXM6YcXeUbfRbZra7jdYbxhcICd1c/QRA2fu6DLhxnDI
         IKS2SspLtmzE5PVE2Aj6fOk/N5zbHMcNqLXvkqY9kMy2uhTdNUgCVmTKd+Fe8BNf510d
         DKIjTuVxdbrNQ9OxV4kvESKM+KgYyd9iYzIjVQ9uu45kleEPBsGunm2mzePVrc2A+hut
         drQsmii/J2ECn9JcFuzRw5b4TD8E9RBLkTjZxPoWkHwIFvxc1EU4wlUjpJ73G+m7/wlB
         eR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730404928; x=1731009728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HG0t4NeqbVLn85G3sOjEZke50iDELODkv6ssAwuGw0k=;
        b=cKfK28dYr+P4MDnmPBm/wxMwILHkXl0O1rlnx3WrMxwNapLC8LA6/lFezn2OSMTmCZ
         dsXw4AjbYdeK0qOJJ0Jo74edy0h+CF/ea6Nn9pdUNZq3/jBkepAWNFvhZi9wYIXPdeha
         nqHfJeF1Z90fBzsPcddPmn0+TFVICKG4VfyKfYYsAY90tKumJLjV+w/qPnyExtajkroM
         avMXmeUlW4Bloq7frPeie8ZNK9rKggZX1RtSLZpsbzZomGAXMz9sJacA1zDpLJUD4dVU
         CRjM5W8tIEeTRd1Xi2izAGLZN9ZT0k/NubkFdZfRVWskrbGXc16v1aqG9xeg7hDPsPLQ
         NKYQ==
X-Gm-Message-State: AOJu0YyLQDFLd6oKZDlopJd8IZqiee2/jghY5E7oHwuQfTWg0HpjQ8v/
	ssxtsCr0UnbzzDExg7uSDRO1WWC5+3G8SeBPkbVtrMUWLUcDr00hsPJuSbig4tk=
X-Google-Smtp-Source: AGHT+IFdJz3U9m7KPLf0+/MvSmAS4Ua279P5RD6u7ZsSqyiraKix7E62FxZs6WZVT7OQXDxf0bMwtw==
X-Received: by 2002:a5d:64e7:0:b0:37d:49cc:cadc with SMTP id ffacd0b85a97d-381be7c20ebmr3290683f8f.32.1730404927612;
        Thu, 31 Oct 2024 13:02:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f39e:5519:d578:740])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c1189123sm3003993f8f.115.2024.10.31.13.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 13:02:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 31 Oct 2024 21:01:55 +0100
Subject: [PATCH v4 5/5] gpio: sysfs: emit chardev line-state events on edge
 store
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-gpio-notify-sysfs-v4-5-142021c2195c@linaro.org>
References: <20241031-gpio-notify-sysfs-v4-0-142021c2195c@linaro.org>
In-Reply-To: <20241031-gpio-notify-sysfs-v4-0-142021c2195c@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2143;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=VPwlZ8nGOi8NK4NOOYE429uUxxX6CyDyQfdMC7P82fI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnI+I4WmYgaN7hopWfPfyg4/7kgpmKSho8uMiuI
 hmLg4nTrsuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZyPiOAAKCRARpy6gFHHX
 chfJD/9xX94dUejypKQ2wDpArGCpy1bvkeHW93n1gGrPEIHITENtbuA7vJ/bVDI8pTXHocA6WuK
 oPPppHXRoqSZT2iV5Gx+CjftykF/fnHH0r8ICbZKa9hZ1vzB33XSlbAgLTR7/KZJLO+sZ0hMGzP
 ZiCAxXRpoR4a0x3JBkDMEiRqWUwXNcHkOeZBWNZTPfDV0KacyVWpBadl//yWM+c2QZwVYAFt3Fj
 YzWrZXNUNRlXHxXb4j7KxNOTx/xaaIulu9hHBOZWkz9hjNY+9EwocM4U5pUj8FzdgMKJd5VEa+o
 KtS44V4S+OjYJsHTFuNmmMzQnUhUrfZTee5LYCWTjn3A/K3wkq2lV4VGpC/3zA2+xI+eG3JbdGq
 cQP1DMVdS0f6pZX924SbP6fYGbnLqaKA2T+a5uzD/AZxpXjxu7SnAyEnbxKAwAqHB+Ufk7uzP5g
 NhhvZr9Wcx7CXy31GsztEf5J6GqGxkWhZUkeUvMRZ9QvzEkvHvoMj/qsUmNGVo91KUB+6ZMl3Ro
 CAOTOvIqnMhB14UAK4nCLlFSYQdKt9PZ47ztVNhfujHTNkcLYqfHQZuRBzVjeUR6/5gAkepdIlu
 7pGKaVcfSK9+h0/HUniQQBgtIOovr2R9t9aJVjU3xt1XL0abW9tfJHt5nnGrJXMZqhHcz7CUvgm
 Y4G1BDstItyFFDg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to emit line-state events on edge changes in sysfs, update the
EDGE flags in the descriptor in gpio_sysfs_request_irq() and emit the
event on a successful store.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 49a5aa89cafc..5d7e8e64783c 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -179,12 +179,16 @@ static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
 		return -ENODEV;
 
 	irq_flags = IRQF_SHARED;
-	if (flags & GPIO_IRQF_TRIGGER_FALLING)
+	if (flags & GPIO_IRQF_TRIGGER_FALLING) {
 		irq_flags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
 			IRQF_TRIGGER_RISING : IRQF_TRIGGER_FALLING;
-	if (flags & GPIO_IRQF_TRIGGER_RISING)
+		set_bit(FLAG_EDGE_FALLING, &desc->flags);
+	}
+	if (flags & GPIO_IRQF_TRIGGER_RISING) {
 		irq_flags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
 			IRQF_TRIGGER_FALLING : IRQF_TRIGGER_RISING;
+		set_bit(FLAG_EDGE_RISING, &desc->flags);
+	}
 
 	/*
 	 * FIXME: This should be done in the irq_request_resources callback
@@ -210,6 +214,8 @@ static int gpio_sysfs_request_irq(struct device *dev, unsigned char flags)
 err_unlock:
 	gpiochip_unlock_as_irq(guard.gc, gpio_chip_hwgpio(desc));
 err_put_kn:
+	clear_bit(FLAG_EDGE_RISING, &desc->flags);
+	clear_bit(FLAG_EDGE_FALLING, &desc->flags);
 	sysfs_put(data->value_kn);
 
 	return ret;
@@ -231,6 +237,8 @@ static void gpio_sysfs_free_irq(struct device *dev)
 	data->irq_flags = 0;
 	free_irq(data->irq, data);
 	gpiochip_unlock_as_irq(guard.gc, gpio_chip_hwgpio(desc));
+	clear_bit(FLAG_EDGE_RISING, &desc->flags);
+	clear_bit(FLAG_EDGE_FALLING, &desc->flags);
 	sysfs_put(data->value_kn);
 }
 
@@ -282,6 +290,8 @@ static ssize_t edge_store(struct device *dev,
 	if (status)
 		return status;
 
+	gpiod_line_state_notify(data->desc, GPIO_V2_LINE_CHANGED_CONFIG);
+
 	return size;
 }
 static DEVICE_ATTR_RW(edge);

-- 
2.45.2


