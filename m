Return-Path: <linux-gpio+bounces-7392-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8419051AA
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 13:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B1AC282BBB
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 11:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7114616F0E4;
	Wed, 12 Jun 2024 11:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="o5ZwoQR0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD7B16F0EA
	for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 11:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718193186; cv=none; b=IDxRM6T48oPGw4wxntI+JuuL9BDNS/yPjNowyY5RPnhkqsNVhu3w52NmLRq1rTfmxzvq2uyT9AAb+yRPAKeLX1esV7KxxbBkQ1hbLdb8mO8mcsLKKJhs0cJPieKqXOL/kc34lr0MaTic7GCakcKBHtvQ79fJpGmkSq3/MAABUTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718193186; c=relaxed/simple;
	bh=JDQkMWjIUvqE84ikntSBnxeL6cRw7OvNB40R51BdsFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=irr3pNbdt9A5AfAfGZbv4pWy2R7QGFUbQ3w+JA3fowXIXcq06UZdVsShcBaP9lokIxD4EQ5CWii/v0FKnQBEjyNHRQFQsCqM1g0X6dJic9L9GoQSSTvJtscfp8byu7eeyOJsU1v/poTyjfGqil2vfWgg1PveCpvcjDLXWOx/BVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=o5ZwoQR0; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-35f1dc4ab9aso17717f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 04:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718193183; x=1718797983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufjGpymO2l4pPxuTK47gK3FSS4v9zOl7SdWpW7/pLTw=;
        b=o5ZwoQR0rAO4TGVJnnplKBsHMPK351oUwBYkRYyvRftaiqSh3r6JtdKgZsjQf8/OZa
         aB/yAtFAM5KdBd6XONd605p7gUOTnLtXYtDNc/jYjJzOktoF3d5UWolndePo4Yckl/Xr
         pKsj3+8x7ZMhnkvBeMmAHS0uAfFZHVPoqTpIWj3+p/pIbU73PlJ3ezMRGeXPLfAxHX/H
         QLuAnggjYIzAPaEIgbxUwoQlMSB1g0ZhR3fyKuncsXSv565QSirkBKPvLndWJyBAo8b+
         WeJIGMAk8Ys8JTDaaPeayEaOOitrkXaH017iKkWqT20kTBn1ZB2JDNT+CF7QrUFQFwfX
         skUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718193183; x=1718797983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufjGpymO2l4pPxuTK47gK3FSS4v9zOl7SdWpW7/pLTw=;
        b=N9RVp/Uugk96IPYOGUDzaUt9wA56CJuhM49Sc++SsW8VgR+IJUDJVBk2I0vZiPYYjk
         kIfWS+I9z2pn5X4YnNtumflEmFKexLm++/cExD6BPMqrL9dmWIVraUUHdsvtL6vsUYLc
         3ptc/Y5sEb+NHuhxOwl65ftBbM4o+kHSsoNBFM5SFxspuPRKTekdTGoGEaOpqh+uTM8T
         oGns47berw31RxPywfhw9rdp5gCUhm9N0NoONVVIhHh3Fy9QJztiIxfY7XEDLE/Knzb3
         +77Zkm26+OqlEhNaxxGkUPkcPCRVBdCDAnaxHUKsX+ec8AEHCFssBlCc5dzPNhP7WjUb
         XRHQ==
X-Gm-Message-State: AOJu0YxTV7IHwMwTu+H46SOmTwkbGQ86sKtANbilhqDfw8kuoSvxkbWu
	alsOx6VwWyf4MRwFeBkZLWHc99nPSAVMutoddN6kd3WRtScbCnLzLxM3tR/8KQA=
X-Google-Smtp-Source: AGHT+IFjWInjWc9PWimjyszlJor2DHMYg9MFG+aIxIDc+zyXvpGduUgSZ7AIcsH+SI3wjocwmcF9dQ==
X-Received: by 2002:a05:6000:bd0:b0:35f:1522:10b1 with SMTP id ffacd0b85a97d-35fe8910281mr1125602f8f.52.1718193183229;
        Wed, 12 Jun 2024 04:53:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:8d3:3800:a172:4e8b:453e:2f03])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f1c958f9fsm10457352f8f.38.2024.06.12.04.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 04:53:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/2] gpio: sim: lock GPIOs as interrupts when they are requested
Date: Wed, 12 Jun 2024 13:52:26 +0200
Message-ID: <20240612115231.26703-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240612115231.26703-1-brgl@bgdev.pl>
References: <20240612115231.26703-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use the notifier exposed by the interrupt simulator to be notified about
interrupts associated with simulated GPIO pins being requested or
released and lock/unlock them as interrupts accordingly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sim.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 2ed5cbe7c8a8..b5526f09b22b 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -53,6 +53,7 @@ struct gpio_sim_chip {
 	struct irq_domain *irq_sim;
 	struct mutex lock;
 	const struct attribute_group **attr_groups;
+	struct notifier_block nb;
 };
 
 struct gpio_sim_attribute {
@@ -227,6 +228,24 @@ static void gpio_sim_free(struct gpio_chip *gc, unsigned int offset)
 	}
 }
 
+static int gpio_sim_irq_domain_notify(struct notifier_block *nb,
+				      unsigned long action, void *data)
+{
+	struct gpio_sim_chip *chip = container_of(nb, struct gpio_sim_chip, nb);
+	irq_hw_number_t *offset = data;
+
+	switch (action) {
+	case IRQ_SIM_DOMAIN_IRQ_REQUESTED:
+		gpiochip_lock_as_irq(&chip->gc, *offset);
+		return NOTIFY_OK;
+	case IRQ_SIM_DOMAIN_IRQ_RELEASED:
+		gpiochip_unlock_as_irq(&chip->gc, *offset);
+		return NOTIFY_OK;
+	}
+
+	return NOTIFY_DONE;
+}
+
 static void gpio_sim_dbg_show(struct seq_file *seq, struct gpio_chip *gc)
 {
 	struct gpio_sim_chip *chip = gpiochip_get_data(gc);
@@ -322,13 +341,15 @@ static void gpio_sim_put_device(void *data)
 	put_device(dev);
 }
 
-static void gpio_sim_dispose_mappings(void *data)
+static void gpio_sim_teardown_irq_sim(void *data)
 {
 	struct gpio_sim_chip *chip = data;
 	unsigned int i;
 
 	for (i = 0; i < chip->gc.ngpio; i++)
 		irq_dispose_mapping(irq_find_mapping(chip->irq_sim, i));
+
+	irq_sim_domain_unregister_notifier(chip->irq_sim, &chip->nb);
 }
 
 static void gpio_sim_sysfs_remove(void *data)
@@ -454,7 +475,12 @@ static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device *dev)
 	if (IS_ERR(chip->irq_sim))
 		return PTR_ERR(chip->irq_sim);
 
-	ret = devm_add_action_or_reset(dev, gpio_sim_dispose_mappings, chip);
+	chip->nb.notifier_call = gpio_sim_irq_domain_notify;
+	ret = irq_sim_domain_register_notifier(chip->irq_sim, &chip->nb);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, gpio_sim_teardown_irq_sim, chip);
 	if (ret)
 		return ret;
 
-- 
2.40.1


