Return-Path: <linux-gpio+bounces-21242-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A47FBAD3B64
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 16:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3D4F3A85D9
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1248235046;
	Tue, 10 Jun 2025 14:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hvqNvHRL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE8623278D
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 14:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566324; cv=none; b=sqPO9oIoVeObTEFOKAY3Ao72EEKVkjOBh5HDEmucmo1gX2vImo0f5nRfrCyAoTj3mWM//ZTQAkam+6kUHJWqt7pWrtFFB+hTQqw2RT4K+a3HkM36b8apJJa3wp2Bmp4QPxGwcnhB1O0VjJ2UNJYkU93ZVsifBupnJoTggVC1mxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566324; c=relaxed/simple;
	bh=qVnEdb+boNEICwN7/DRVxb/irxrpifQ6wv99efHfC2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NVDe/OY+TpauTnbud6Yx0ptVNu9jrwivGdqz0Cd+ewdcYUoHlfJ18O26Pip+SOBVtDlrOlaK2oCFGrXN70I+PdCR7NljGCUeAShfQrhQFq17WMapeSEjchf+uuTQSzxomIken+f1/kitIepTOeiv8aun6ZL/3LxFk1CdprBCrPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hvqNvHRL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-451d7b50815so48177105e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 07:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749566321; x=1750171121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Cdlqvlk5WCptlmo2FF6frtmxR+pgET3/5DYOrxB4jk=;
        b=hvqNvHRLTh2WChBPxkmLLhNDmm5QkyFE7TsSTUTp44JAdR3f//LWil2lOxvqLPI5mF
         uTxWmQnVEtfo9Os70z6Pwh/Rp81ibn/7hti5PHcpV7mlnF82fMX2j/730iJgy+KS/+P0
         vx67z4looaAdcbQKBPjdnfyvpq6553juc3V8e4ved53PvkKFe/BbbbrulVGyNC1YOeSE
         8lh7tbkbV0juhuMrE/i6AZjeoSQQeKXxqatHOUKkyVurS1B1pgCgEPPovnISkrpVN96F
         KnIck5LhBAsP91CfpmzfuEmys4n8YfRP9hNHVcGch/Lv5nCfKQZhlGp4PTivLK5hLlYl
         8hkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566321; x=1750171121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Cdlqvlk5WCptlmo2FF6frtmxR+pgET3/5DYOrxB4jk=;
        b=JYQDh5LuTT1pRo3b7aFtyl+cdwHa4oQQ8tUCENzd9EW1GApWeX8wgdnwOd+lmEXu32
         SN8Y/7r86vrBR1We8jJlL4n8u6IqcwQhtxy0gg1zrDQehkMVVrc8nhandn9Os55qY4XH
         2S+XJlLcayZGzBcc8YraJHJj2hXLsgDFQKUxm4lnORlCnfccYvia6WWknfnwcS8IcVdP
         XJTeKO9SUP0B6tP+lo1OvP86MczEtZpmw89xPcP0+pk7KPWsV0UxAMck+YdhYHeyZevm
         ZBjJGNBXsd4sUHdEl8oehz9VqHh0fNytVkPvdQl1W9gh3sTPOXxnMY3qcpHDIszrdDHU
         lAtw==
X-Gm-Message-State: AOJu0YyRe6naX+cs2qExj5B4CfOIYpjOPwULcmC5mKhTLdGKIEwdGMUt
	WQF+Z6RXE+o+MWrF4hmT5tz/8R9auGWFNA31yNjWgPtiWQLqLQrJZfyvQLIE54umyic5Yt295uD
	UGojG
X-Gm-Gg: ASbGncvqzB1YPSV5Kk2v4fYIgf6PuJG5eM1NG+xfJkNdFMtbALBBCMKnzK/vBpt05Gh
	ponwkc25Da/peFKAMFG4AjetDNxridR1Thfl9SZYB7qTGJii/bHzwWDuO4aV0E2eHxBbRC193zP
	x8wSlXD3DlVrLPB70rUUmTGXCB4+sGc1HtWPzE0I59mTdqNTffTTUiVdgASAnUjX+LHIGqhJRFE
	o/Cy3L5WjAu3tHtHyDfyLFHDN452KJatHfRg8+k4jDz96zoPNDRgQ283HU/mwMhiZU7plJUYbaK
	SAbx0wan2SM7Zw2UYIjbUApbVmgksDPKMUEvPp8ALXHyFJf3eUGg
X-Google-Smtp-Source: AGHT+IFIsq70xx/8olAsnKRsf07I+3a74XBw8PpCIhG3o3iIHJGPEqV9s3fUbSbqiPnsLG7GW1+tsg==
X-Received: by 2002:a05:600c:1d8d:b0:442:dc6f:2f11 with SMTP id 5b1f17b1804b1-4520140c5cdmr145370845e9.25.1749566321024;
        Tue, 10 Jun 2025 07:38:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e056138sm146001345e9.5.2025.06.10.07.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:38:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 16:38:28 +0200
Subject: [PATCH RFC/RFT 13/15] gpio: sysfs: export the GPIO directory
 locally in the gpiochip<id> directory
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpio-sysfs-chip-export-v1-13-a8c7aa4478b1@linaro.org>
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Kent Gibson <warthog618@gmail.com>, 
 =?utf-8?q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
 Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3803;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=vDsA6l8yJFZon/b6LVAymhVnSm8Df8uSF6oGQiN2TvI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSENiOhOzNKeHb6kIoo8Kkamhflhx2AE4hMYOi
 5L9IVwuyj2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEhDYgAKCRARpy6gFHHX
 cvFKD/9xsCMmUpgjRG4IBY5rd2bX7OmzYthb1jg0WOo2Mtwy56PJBdmj+O3m1W9NHZx6XVuZeDK
 V1IAs6oGCVvAzyiD/PgOysXZz182kdMZ8yFSjtzDO2FMdtIfKXjlPmxbn+2RaokS+9hkTV6stvI
 M1fI5VxnLcq87VxNCuEW4g40eQUzD1zVPRGsqfYSgIahYFTrCXIP6Hi6BJUdrMY4yCDiBLXSIg1
 QgYShoIC0oTPfxGpaAZgEDm/9OFEfIMsjSAejfiw/x3prrmcPdXnMEk7SjcbYAlnlks04/IlDF4
 3e/oSbI8xc6+SaKu80yMlX7zS1uG5SIS+kYCd84/jduryliOt8OFtZxzP1JcZ0lLsTLWe4rAthZ
 cKey3A/rUXpmlhf2w4yHrD4hNQQxpT4Fo/AcQFq/P0+EZAYu1fSGBUJquHzmp3wRVIkk+o29k7b
 D7i+SflwrNM6zMLDG4XCWSXMY2ulY/VswDHLHoJNcniEGeQsrLF3YC2GlbAXRVr+CewiAM3tape
 /yELlwWtPv4tu9Wv07pFhw0tqpYi2KNmC75a5uOhQcn5/fNcmiZ8+nromrTswr4bD13c1tZBDkm
 HPAJXoCxqg46q5ike6tmlWIx2JYVIylBShMYtnLXfunNNbgpAo2XVDNzFl7x4IHsUTerp6CfnZg
 WboJtWX49JX0GTg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As a way to allow the user-space to stop referring to GPIOs by their
global numbers, introduce a parallel group of line attributes for
exported GPIO that live inside the GPIO chip class device and are
referred to by their HW offset within their parent chip.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Documentation/ABI/obsolete/sysfs-gpio |  5 +++++
 drivers/gpio/gpiolib-sysfs.c          | 39 ++++++++++++++++++++++++++++++++++-
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/obsolete/sysfs-gpio b/Documentation/ABI/obsolete/sysfs-gpio
index f856e286051d6bfa4990660dcb25b3fdb27cd0f2..3212cf64f43b67b23a1ac17df025638a52a5bb31 100644
--- a/Documentation/ABI/obsolete/sysfs-gpio
+++ b/Documentation/ABI/obsolete/sysfs-gpio
@@ -27,6 +27,11 @@ Description:
 	    /base ... (r/o) same as N
 	    /label ... (r/o) descriptive, not necessarily unique
 	    /ngpio ... (r/o) number of GPIOs; numbered N to N + (ngpio - 1)
+	    /gpio<OFFSET>
+	        /value
+	        /direction
+	        /edge
+	        /active-low
 	/chipX ... for each gpiochip; #X is the gpio device ID
 	    /export ... asks the kernel to export a GPIO at HW offset X to userspace
 	    /unexport ... to return a GPIO at HW offset X to the kernel
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index aa998d9e96cce5d64784645eea73f987471c7285..d8c17d71d5458011d15bc4239bd4c041244da3fd 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -47,11 +47,13 @@ struct gpiod_data {
 
 	struct mutex mutex;
 	struct kernfs_node *value_class_node;
+	struct kernfs_node *value_chip_node;
 	int irq;
 	unsigned char irq_flags;
 
 	bool direction_can_change;
 
+	struct kobject *parent;
 	struct device_attribute dir_attr;
 	struct device_attribute val_attr;
 	struct device_attribute edge_attr;
@@ -180,6 +182,7 @@ static irqreturn_t gpio_sysfs_irq(int irq, void *priv)
 	struct gpiod_data *data = priv;
 
 	sysfs_notify_dirent(data->value_class_node);
+	kernfs_notify(data->value_chip_node);
 
 	return IRQ_HANDLED;
 }
@@ -780,13 +783,46 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	gdev_data = gdev_get_data(gdev);
 	if (!gdev_data) {
 		status = -ENODEV;
-		goto err_unregister_device;
+		goto err_put_dirent;
 	}
 
 	list_add(&desc_data->list, &gdev_data->exported_lines);
 
+	desc_data->attr_group.name = kasprintf(GFP_KERNEL, "gpio%u",
+					       gpio_chip_hwgpio(desc));
+	if (!desc_data->attr_group.name) {
+		status = -ENOMEM;
+		goto err_put_dirent;
+	}
+
+	desc_data->parent = &gdev_data->cdev_id->kobj;
+	status = sysfs_create_groups(desc_data->parent,
+				     desc_data->attr_groups);
+	if (status)
+		goto err_free_name;
+
+	char *path __free(kfree) = kasprintf(GFP_KERNEL, "gpio%u/value",
+					     gpio_chip_hwgpio(desc));
+	if (!path) {
+		status = -ENOMEM;
+		goto err_remove_groups;
+	}
+
+	desc_data->value_chip_node = kernfs_walk_and_get(desc_data->parent->sd,
+							 path);
+	if (!desc_data->value_chip_node) {
+		status = -ENODEV;
+		goto err_remove_groups;
+	}
+
 	return 0;
 
+err_remove_groups:
+	sysfs_remove_groups(desc_data->parent, desc_data->attr_groups);
+err_free_name:
+	kfree(desc_data->attr_group.name);
+err_put_dirent:
+	sysfs_put(desc_data->value_class_node);
 err_unregister_device:
 	device_unregister(desc_data->dev);
 err_free_data:
@@ -876,6 +912,7 @@ void gpiod_unexport(struct gpio_desc *desc)
 		clear_bit(FLAG_EXPORT, &desc->flags);
 		sysfs_put(desc_data->value_class_node);
 		device_unregister(desc_data->dev);
+		kernfs_put(desc_data->value_chip_node);
 
 		/*
 		 * Release irq after deregistration to prevent race with

-- 
2.48.1


