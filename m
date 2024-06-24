Return-Path: <linux-gpio+bounces-7637-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EAC914690
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 11:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42FDB1C225F2
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 09:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2442413440A;
	Mon, 24 Jun 2024 09:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VmcDwblC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B34D132120
	for <linux-gpio@vger.kernel.org>; Mon, 24 Jun 2024 09:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719221987; cv=none; b=Nvnhu/QGQIbCCve4MRn6E1j1PKLOh0HLlfBakNxofZHbDka2AxD91xIhxbMENnJtSCEZgwOQz1ggBoutcgm67aVX0l58vXek+QBTh9+OIqVNPWzMZonw011WjPKyrE3DdQT24Mu0DOJvUR5orLYAcpjnB6OWbJK8ulBoY96eFAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719221987; c=relaxed/simple;
	bh=ZToJsqy3HaH/2CQ4Ri3rb7/ITG47bOqRmRyHXkIcB9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BzGT/w4ibSa379MoiDNptUxC6A8za05c7U2mmxFrg2iujU4lUWUnuDBru8SQvcsaCs1ndY0v01BA55Nl0qonFW2Dxky8tye32NUlrwjzbxPhfZ8TeNgnb3ymB1E74i6ecoWtCjXZ/SLJJaNl6tsBHzVVtDmIYcLZHVrjvCn0EIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VmcDwblC; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3620ee2cdf7so2610315f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jun 2024 02:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719221985; x=1719826785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBNm9BKUEMH7BT7HuL0JVF8taCtuzuPG7CgzS2A8+KI=;
        b=VmcDwblCPY/JqLpra5GW1JOJMI4cFf8IJsYrfChKPclUObpHJ9OeYNtLI9Nltv0UyO
         enSOJTskDS2VlzxLz1wkI70Z/2UcIwDMi7NKUm6ug74jaSsY7+cSeYsMrytMZvzn0Zxr
         f+RNFCuP8mFYxXXVNHGmLUafJbEeDvfSMATlxnROhZMOtiBiyrhs76A3oMXjdd0HyBuC
         Tk+eMqqtl4riKQfF+/9o20OT5lsX2FrY7RE9AXolFxRAttrpwr/kzWjEY6fwBmSZJbc2
         AtOP0aIzUFBcshB38QGXVoUbJbKYJD6cGNArDKdDPACcqVFHbk/3W0iRbzBjCSGCAwDf
         anPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719221985; x=1719826785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBNm9BKUEMH7BT7HuL0JVF8taCtuzuPG7CgzS2A8+KI=;
        b=Mmz8vw2i9fLbPcT2u58+C2Dd72GL/ntDZqtBdtXtVwNNBLj1LhHb8YN/266JmSXo5b
         INwIVfc7uOM7RpIolKaIPZHaOyF8giLCuhh8sYdvql4wZkOvllWeL8cqtrxkTgYj0aDk
         SBR135vnbYnUdKHVBM1tR5oEFda1k2kgm1n2liDQ16/r2TnXTU+8rwnIHADBcUwXqv2D
         CfnV9zzm7knBQatnS6iY1N4xd2rkG+NTMlrjtjE1eRbhF7zYRNhBarhOwisXamENrdqW
         1Cgh6sPa96IteZXdVHVWfAsT7KA5o2Oh9UOHO8rVLIZQUes8a3HQLyu+OlAB8wvc6Ix4
         p0fA==
X-Gm-Message-State: AOJu0Ywazz7Nf5mEhqKQAPLzP9XfgGAgC33xnw7cjU0m++Cg1+okbfsf
	+4sL9W9oxoeK8T8vH0nRXaN0pMu8Dym1du8J+nnAnAhHnCuElxkFsvm+/VHEFT0=
X-Google-Smtp-Source: AGHT+IEIIGHqe+Y5cI+4HYZZmg5AfyBiSyyrpJdmK2y3V900vYjwih+OvsIkiER4BOomFOwkOnxQ2Q==
X-Received: by 2002:a5d:6487:0:b0:362:5a6e:2649 with SMTP id ffacd0b85a97d-366e7a56dedmr4598801f8f.56.1719221984625;
        Mon, 24 Jun 2024 02:39:44 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b80e:a46a:7fb3:4e3a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36638d9c1aasm9433138f8f.55.2024.06.24.02.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 02:39:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 2/2] gpio: sim: lock GPIOs as interrupts when they are requested
Date: Mon, 24 Jun 2024 11:39:33 +0200
Message-ID: <20240624093934.17089-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240624093934.17089-1-brgl@bgdev.pl>
References: <20240624093934.17089-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use the extended irq_sim interface to supply the simulated interrupt
domain with callbacks allowing the GPIO sim to lock/unlock GPIOs
requested as interrupts.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sim.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 4157735ea791..dcca1d7f173e 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -227,6 +227,27 @@ static void gpio_sim_free(struct gpio_chip *gc, unsigned int offset)
 	}
 }
 
+static int gpio_sim_irq_requested(struct irq_domain *domain,
+				  irq_hw_number_t hwirq, void *data)
+{
+	struct gpio_sim_chip *chip = data;
+
+	return gpiochip_lock_as_irq(&chip->gc, hwirq);
+}
+
+static void gpio_sim_irq_released(struct irq_domain *domain,
+				  irq_hw_number_t hwirq, void *data)
+{
+	struct gpio_sim_chip *chip = data;
+
+	gpiochip_unlock_as_irq(&chip->gc, hwirq);
+}
+
+static const struct irq_sim_ops gpio_sim_irq_sim_ops = {
+	.irq_sim_irq_requested = gpio_sim_irq_requested,
+	.irq_sim_irq_released = gpio_sim_irq_released,
+};
+
 static void gpio_sim_dbg_show(struct seq_file *seq, struct gpio_chip *gc)
 {
 	struct gpio_sim_chip *chip = gpiochip_get_data(gc);
@@ -443,7 +464,9 @@ static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device *dev)
 	if (!chip->pull_map)
 		return -ENOMEM;
 
-	chip->irq_sim = devm_irq_domain_create_sim(dev, swnode, num_lines);
+	chip->irq_sim = devm_irq_domain_create_sim_full(dev, swnode, num_lines,
+							&gpio_sim_irq_sim_ops,
+							chip);
 	if (IS_ERR(chip->irq_sim))
 		return PTR_ERR(chip->irq_sim);
 
-- 
2.43.0


