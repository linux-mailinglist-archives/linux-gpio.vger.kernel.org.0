Return-Path: <linux-gpio+bounces-15891-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D974A338EC
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 08:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0AA13A63EB
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 07:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5552080E0;
	Thu, 13 Feb 2025 07:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remarkable.no header.i=@remarkable.no header.b="NgS/r/DB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CA22054E7
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 07:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739432126; cv=none; b=kyuLIxT5NffjOcWZzDeMvqEdoj/eOFOs9DUwntxBWQC7V+zQbX5k9OiauCJME23VQlsQxiCFY/Z5Rdmx/f5vCqVVQLhtvGGOMUvrmWJk7tgomPj8xoTbfzEYRvPT8+urUPGr5MCBGOUERtPSqsnqila8OC6GuUSvePnZhm2HpxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739432126; c=relaxed/simple;
	bh=2tKIPw58ucrpDUSRuDbKrc1NDg2QmcUXIhVSVlNc06c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VFUHH7uS+eJ93IfTGC+fQlY8NVHK277hLbFajLbknJLohRpqfQk8JRTc+0uK4MFP1xKZEt/KZEhJG3rroNKeoUXIGNHAfCesZYaEPDZRPDIRuUfVpcRnykz3JSl4SHmq8jXdN3T/w2iskOyE8cxvznmM4tXs4oCjtVgVitbc2dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=remarkable.no; spf=pass smtp.mailfrom=remarkable.no; dkim=pass (2048-bit key) header.d=remarkable.no header.i=@remarkable.no header.b=NgS/r/DB; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=remarkable.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remarkable.no
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-543e47e93a3so524595e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 23:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remarkable.no; s=google; t=1739432121; x=1740036921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fGCto14audklsl81FTFkjEL9QQPadC+V8+u7WnekYLY=;
        b=NgS/r/DBwA9m26stXQ9SvK78OKPzlP5SovooXIThGPf3ZpQ6mrUYv+tCcTdAUf/Lar
         uyKWFZfSYZzKlSirZN9/X0B6uSAvxpMSaV0RXJ4xQfC1HjxTQAN7sLpCQBUzIT+DH8Vx
         9vplLtneULhKNNQfLnhsTRNUziQUnjDcKOIVDweOK4z+NecNWZu5iOYCNMJyuEycYPCH
         cia5yvmziVY2NrIwb6uwKgLvIXrDbQ1TEYJVM1krTFvDiqpPwUrSLIKwI0IBoPQWFM/+
         VXIbwzczcrnWmyzNVdnhVdoY9dLXJrPoQEE1zmwHxCCGQPRQ4DkFL6fNsCTCjRr4cz3r
         hsuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739432121; x=1740036921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGCto14audklsl81FTFkjEL9QQPadC+V8+u7WnekYLY=;
        b=XW2YdJ8AZG95LZj80VQJ5tsrL9HcQYzGNFzwpSPb6F8AqNxgS4L+K9lNDKvvXWvR6B
         cidmOTyHlhOx2CW/no68BnQ3dvp7RQt0WiXwGH+q6knyJMFxpc9Y4m9tngLxsWtuXJ6/
         E1yzYJV+WN36TKjuB3t76QaCUBCEW5fGGm8DF18dROMJzVtl60eJ7D44xdHeox1sl4Od
         PlMjex3/9ZAQs8TlwEpY6IqaEoue2W4KAAFYm7Ip0mmY90PBrs50K+cwT35vIvZImzna
         gRuQpnz1VR31919V19xqC4D/BQkCPwPl2kE+qWhBbh5UlPUmRC7TPoY+TnblNyIgkYGk
         fBoA==
X-Gm-Message-State: AOJu0Yzp2MjfutoweHrbLFmVaJNlyUHhSdnLAS90SVvn5H6JFQp2Zn66
	ocJLu+RKaHi9KG8IZCy6U+8doQVrfpePZnx0wW4h49QBD1jW4PKG21rDO5AaPEKnhIrkq6AlyD8
	wRIQc
X-Gm-Gg: ASbGnct8iRG+PYEKdPzCYuYqwIxpQsMkmVH1ZlyEcsA6xMFs2D0eVdW8GU+AQUoUrl3
	gTQTtQvsK1L5J7DL1UbL25h15/LSDRQ+T28A/eEU3ajOcY7MCRz9pYUgYFU+0qp7IxA3jRRxlAg
	t8HyGNg+dd048XYunpE0ssn6SxqFJDPdQO+d+E4tE04JDqHx2zdlh3xffRbYeYQoweUZZGEHt++
	FFZ0baNLAv6jlGQfPSrXqBiDtKeB4/mYaVApJd2o8eGLaLUNMWlVrIkyIvsNccsob8p2anuv+R9
	A4ADb0h+rl8hWk9xQhxAxmY9M4lxzAJJpcukoIWfSFEnPlJqj77whjKGQb4eVBY19JGz13yJZ8y
	Hb8UKIhTNOKvlY7+IW+MHtqa9n5GYhnyZ/RDCXeAhhKE=
X-Google-Smtp-Source: AGHT+IHJ2xexthpHLVGmBYDTrqiK8oku3fJae7PHDJf1R+mJjZA2MjokBEwf4pAahsCIHY07O9fl8g==
X-Received: by 2002:ac2:5e77:0:b0:545:9e:bed4 with SMTP id 2adb3069b0e04-54518166d55mr1586873e87.52.1739432121597;
        Wed, 12 Feb 2025 23:35:21 -0800 (PST)
Received: from yocto-build-johan.c.remarkable-codex-builds.internal (226.215.88.34.bc.googleusercontent.com. [34.88.215.226])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f0ae656sm91629e87.105.2025.02.12.23.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 23:35:21 -0800 (PST)
From: Johan Korsnes <johan.korsnes@remarkable.no>
To: linux-gpio@vger.kernel.org
Cc: Johan Korsnes <johan.korsnes@remarkable.no>,
	Linus Walleij <linus.walleij@linaro.org>,
	Haibo Chen <haibo.chen@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2] gpio: vf610: add locking to gpio direction functions
Date: Thu, 13 Feb 2025 08:35:01 +0100
Message-ID: <20250213073501.14420-1-johan.korsnes@remarkable.no>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add locking to `vf610_gpio_direction_input|output()` functions. Without
this locking, a race condition exists between concurrent calls to these
functions, potentially leading to incorrect GPIO direction settings.

To verify the correctness of this fix, a `trylock` patch was applied,
where after a couple of reboots the race was confirmed. I.e., one user
had to wait before acquiring the lock. With this patch the race has not
been encountered. It's worth mentioning that any type of debugging
(printing, tracing, etc.) would "resolve"/hide the issue.

Signed-off-by: Johan Korsnes <johan.korsnes@remarkable.no>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Haibo Chen <haibo.chen@nxp.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>

---

v2
 - Added description on correcctness to commit text
 - Added Reviewed-by from Walleij and Haibo
---
 drivers/gpio/gpio-vf610.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index c4f34a347cb6..3527487d42c8 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -36,6 +36,7 @@ struct vf610_gpio_port {
 	struct clk *clk_port;
 	struct clk *clk_gpio;
 	int irq;
+	spinlock_t lock; /* protect gpio direction registers */
 };
 
 #define GPIO_PDOR		0x00
@@ -121,12 +122,15 @@ static int vf610_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 {
 	struct vf610_gpio_port *port = gpiochip_get_data(chip);
 	u32 mask = BIT(gpio);
+	unsigned long flags;
 	u32 val;
 
 	if (port->sdata->have_paddr) {
+		spin_lock_irqsave(&port->lock, flags);
 		val = vf610_gpio_readl(port->gpio_base + GPIO_PDDR);
 		val &= ~mask;
 		vf610_gpio_writel(val, port->gpio_base + GPIO_PDDR);
+		spin_unlock_irqrestore(&port->lock, flags);
 	}
 
 	return pinctrl_gpio_direction_input(chip, gpio);
@@ -137,14 +141,17 @@ static int vf610_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio
 {
 	struct vf610_gpio_port *port = gpiochip_get_data(chip);
 	u32 mask = BIT(gpio);
+	unsigned long flags;
 	u32 val;
 
 	vf610_gpio_set(chip, gpio, value);
 
 	if (port->sdata->have_paddr) {
+		spin_lock_irqsave(&port->lock, flags);
 		val = vf610_gpio_readl(port->gpio_base + GPIO_PDDR);
 		val |= mask;
 		vf610_gpio_writel(val, port->gpio_base + GPIO_PDDR);
+		spin_unlock_irqrestore(&port->lock, flags);
 	}
 
 	return pinctrl_gpio_direction_output(chip, gpio);
@@ -297,6 +304,7 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	port->sdata = device_get_match_data(dev);
+	spin_lock_init(&port->lock);
 
 	dual_base = port->sdata->have_dual_base;
 
-- 
2.43.0


