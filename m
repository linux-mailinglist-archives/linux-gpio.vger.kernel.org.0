Return-Path: <linux-gpio+bounces-15478-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16080A2B0A4
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 19:22:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05818188B3D4
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 18:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77081A2564;
	Thu,  6 Feb 2025 18:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remarkable.no header.i=@remarkable.no header.b="OvHgtkWY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34331A4F3C
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 18:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865870; cv=none; b=ZrUTLYqoMddEebFSH3uCOJ+3ofGRLtMekzqFssep49knzYy4U0kK2FgQVIBtTA0/cVgfA26AoU3wvUblPLVJ6jlg98YNSVKfhL6YNhd7WjK8O+A4rt4xfQYChxUUwcv5cxN2+2oliYNqyBxDIEkKQIaGxV1DhXJoidmVJmn3t3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865870; c=relaxed/simple;
	bh=Hbji5T/6K3y5tQ8qKUOLvVFNzd8uxzmS4sFnAmyqUx8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AGt8sVQvNVa8ZStgqaI2NwAyflE15I4zTixEFSkaKDJlntvNwQMbSjq45VKuaWy6/b+lc32E3EU0IqbM3HjbEQY1W6p+L/kksTBSGSAPzXMzwmdZJDSuDCTvMPF4FWjmEXyfqljnS7raW46x9iOhP/IRsUXSZMuD11Yenm4pjC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=remarkable.no; spf=pass smtp.mailfrom=remarkable.no; dkim=pass (2048-bit key) header.d=remarkable.no header.i=@remarkable.no header.b=OvHgtkWY; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=remarkable.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remarkable.no
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53e3778bffdso1241568e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 10:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remarkable.no; s=google; t=1738865865; x=1739470665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2djNpUvfAgvQ84m91IKI9aY9SedH15fgV7SgaS/c8sk=;
        b=OvHgtkWY508j6cffndQqWMYcYfeHFg2FC/0eIJEznfYt/ODqdVLsNahrRKXd5iAFT/
         W0heXDNGlpCvOk2u8UC3LL9fdbvKD0oIZtuWzbaLEQatXRO5NECUeHVa6FI36TETkDVu
         vzk0v5isBA0nazO5kPPZtNXZpa73yog8XQkbj4jOQ6XKaDpjKgDquytbQvsPnmT7+q3O
         XA6Ff04cmE0fwomOXg3HG06OSkyfQM+90FcQVi6EWcjgZ61lh5duofiuT/1LJt7qAOLu
         55KRYcAU7gmNuUGMuDTRdvVAa/IAMr7kq8gXNSFCy8Y7z/CSvTOfCJyHqoZ62tmBeLxn
         ON0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865865; x=1739470665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2djNpUvfAgvQ84m91IKI9aY9SedH15fgV7SgaS/c8sk=;
        b=AnHqOna3C5ejbj//whpKACdx2KITrzNOd+jWiX+BUAT9KI0nC6MuGTVtsBX7CaseEq
         WQZCg5gBetPEpWeQ+o8I/+qFuxs4/urxu5II1qkw11C6vFwyvNqIyxDSFR3JiNPM8TIJ
         yQ4/s1RgMd232TSI3pm+YhR4c+fKeFvOmuRZUefANZeLQCLjO+oj3FVJVwgwSEHlup2j
         VIZMpRylUiceIdNR5QbIFz2NfQKPLnjagtDcTxcGrP/WKw3TUhVSm2EN8vu14qysHCQ5
         49LYno+p+ILyVCAajuII8RLg+Evau4xx9GeMH8kJ2tyqBhMpmSSy+ETFw7UmSsJlqiAa
         epbg==
X-Gm-Message-State: AOJu0YwR0hl4NfmMNhklHKxFH8A3frOzdcQ7hoCqEcTZVRu22H9vt2bL
	715S1wtWTWEvDotkvkN04DpYrgm+dSGN2d1D8nALOWTA6RqLEmnLqqeJ2FMfvH3eXFMMG4yrz5X
	L5w==
X-Gm-Gg: ASbGncu8q3Gjm3Nd/zgwTUlgrik/H6NKsRgCgHMovoX582kgytsX6ofl9NL8zl+zV4s
	r8hEumLdmLX4lCgxqCSs07RSx2eIkswcIf9dIPWUkumvzMCkkZDCtf2vg+ujwDmiM6LkCPGA9D+
	rUkuIZFd+zQns9rDDbGb8XmuXDipwKRlJuc0vtbL7qXljDcKffqNu/uoPsK6UDWo2xlFF6qW2al
	GuKbsmIgokmzoVFkXjzqEWX4TSdz4tsOMDlvmfDFA7VtqEIsrx25GHBQWKVQDAyCL65qd3uIElb
	e+YGgt930Zfdt4ROorgm06ejJvgBCNVtBukDXVVfOQm2OVXQwNhL9c7UEjzRqO5CllmdPm8daEt
	7sFllxmEukxs+cGeLGos+FpbQ4vX/eEv5nu0kVw==
X-Google-Smtp-Source: AGHT+IE5/NRLVqSmdV3o+ILVR/RP/JKGCDcn6ygA3r1tx1LrKyjPsL51CVvwBDhKjmlD6RO8Z46a6Q==
X-Received: by 2002:a05:6512:32c7:b0:53f:231e:6f92 with SMTP id 2adb3069b0e04-54405a45714mr3412824e87.34.1738865865080;
        Thu, 06 Feb 2025 10:17:45 -0800 (PST)
Received: from yocto-build-johan.c.remarkable-codex-builds.internal (20.63.88.34.bc.googleusercontent.com. [34.88.63.20])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544120864c6sm140475e87.88.2025.02.06.10.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 10:17:44 -0800 (PST)
From: Johan Korsnes <johan.korsnes@remarkable.no>
To: linux-gpio@vger.kernel.org
Cc: Johan Korsnes <johan.korsnes@remarkable.no>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Haibo Chen <haibo.chen@nxp.com>
Subject: [PATCH] gpio: vf610: add locking to gpio direction functions
Date: Thu,  6 Feb 2025 19:17:13 +0100
Message-ID: <20250206181714.417433-1-johan.korsnes@remarkable.no>
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

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Haibo Chen <haibo.chen@nxp.com>
Signed-off-by: Johan Korsnes <johan.korsnes@remarkable.no>

---
To verify the correctness of this fix, a `trylock` patch was applied,
where after a couple of reboots the race was confirmed. I.e., one user
had to wait before acquiring the lock. With this patch the race has not
been encountered. It's worth mentioning that any type of debugging
(printing, tracing, etc.) would "resolve" the issue.
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


