Return-Path: <linux-gpio+bounces-16263-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DF2A3D599
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 10:58:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B2D0189D66E
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 09:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223A11F1908;
	Thu, 20 Feb 2025 09:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UQrlWcYs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D749A1F12F4
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 09:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740045444; cv=none; b=a+PSrkMNwiAh4bUlxn37UB2+/+Bck7tc6eKR4u4nO5P5z3OKCOxR7OhRMgGaMoHSkh3ct5t0ToGBf7IbDffSFzeiKiEcRqpwJ05DEEqREvzNvnIyi1mYj8YndzhxFot1nzjBdyNgTmbtS8VuRCcVMDWX987Tsu01GqRY0Y9FMPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740045444; c=relaxed/simple;
	bh=83jrys1E92DqV2B4yqQk7gfJqXMuRsuKUY+FCZWmHyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TBVxkEVTtTO1W5g+GRw8EBECGDJi31cVknY4Lt77KE5PepmRsJF2RMN0/UgwEGY//AwjyjerZvs8e3JtoXVtsIcf4H1QcsxsU5M/YzB6rXISgQFVcv6IhbKgHvx2vuvl8Bd8sAzM0ujlxtNaPFhbr7cUOC3JKA1xjdsbYVEybtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UQrlWcYs; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38f378498b0so621463f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 01:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740045441; x=1740650241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NO370y0/2ADG59Z7li535hI58C2lwDkCkUPq5uenvk=;
        b=UQrlWcYsI+ZytDoiIAyydO/4LhmfxWLAFldug1ohY4hgTQkU0oFjDOZDEMhkbzjLTP
         a6pusk1G7+G+n/eu1ZjrP7SAqIV90pif4vACZ5nKJgR+Tjx9LOPkW2Q2dSrlAgGS8A36
         GYSHUv7OdmPNxDQeLDgEY3ydFeERnSR+h0R7ayYDM7lNHfE1fVg62iYdFtIX8ISx6rsi
         7doC1sGNpRBj+wx0NU/gTJbg0utihCJ47rjuHjfUaWFLPfWWizwshvkzZd+mLOgOJ8Tc
         S/Cz7LqzmhvduwZwtHx4MXKVUYILfBf3Eh2S/05Q/4PJdnTUp6p6W3fCeTjnC3SS9uAI
         7ukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740045441; x=1740650241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2NO370y0/2ADG59Z7li535hI58C2lwDkCkUPq5uenvk=;
        b=ZqJTH30ysQrEoYvmzksD767qq78kORTeZKmyEl0A+2iqpugUdIftM0P23A1sFaTX+H
         7UL+kx463xqTW4SLQ07JKJp0+W57gy3KEqTHcjwX+O9ILUAcXduJKQTaUbIMc2XjPLza
         n5PClWdLme8ikjALdX+Bdgq/EZfa23eo/oop68CVJ6okDQMcg92HN6QlhhU9u7JfYw/5
         h1Czqm1OnPjO/ZAvVkYCmiulJF5juXvg+aaJcsVVNhFl5ERKkL4g7rb+jihc/zUp4fXC
         uUriGVPlMmABk3bglR5disYkdyTSQzalwxMCOO3pbiN3uKr+BIvEjHQ0NKuy3BMGlRoM
         HepA==
X-Gm-Message-State: AOJu0Yy1S/5c4ue1zZ1Mt+DIpVmZoFVQnQORWLGqiUNdu8buPSuyhMpr
	OwW5puWaJ5dDkJhX4O8phkaQ6jTToyVxx+8stUTUleXdntNoz+mt9K2KqrW9s7s=
X-Gm-Gg: ASbGncsVeOr0uapWYduORSHADIe7HbdB0jjDx158Lx7ysks2ckJu1bULi/sbHhm94L2
	vgGx0FZTACxNGExnlRTS6WLgEmP/cCdXJwIpUeYruAOadZt6TxRmKLX8KVMgN2ICiKzmvb4/KYI
	2tVmaUu4Q3vvEpl8whvAxt2R+Q22jTdyLd06v/p08fUreIVb1yco2EBAXZKu4qyAKu7uAWM9dzG
	3V5F0oXqipxUhxETyym/c9bXVTlY4kqODNi7focpnoDLSrIUij3r3JGCoPAfgmMph42rSSinPjy
	oQLfZgg=
X-Google-Smtp-Source: AGHT+IEO825ZkHmQ8WbNulFejsXgznfD4+7SKpzDZn/YojbRukVDHPqQhfbjIfNIrmAwUbEE3pnONg==
X-Received: by 2002:a5d:47a5:0:b0:38f:3914:c624 with SMTP id ffacd0b85a97d-38f58781f55mr5039562f8f.7.1740045440994;
        Thu, 20 Feb 2025 01:57:20 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:e2e4:418d:7462:9cf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d65dfsm20509174f8f.64.2025.02.20.01.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 01:57:20 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Feb 2025 10:57:03 +0100
Subject: [PATCH v2 06/15] gpio: sim: use value returning setters
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-gpio-set-retval-v2-6-bc4cfd38dae3@linaro.org>
References: <20250220-gpio-set-retval-v2-0-bc4cfd38dae3@linaro.org>
In-Reply-To: <20250220-gpio-set-retval-v2-0-bc4cfd38dae3@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Michael Walle <mwalle@kernel.org>, 
 Bamvor Jian Zhang <bamv2005@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Keerthy <j-keerthy@ti.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2221;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=4rRdeo5YWk0LkDw22ljFe5PNudUuy3MdO7T7WRZ6ito=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBntvx3/w2vZ+VX+sZyEcAAzR8U8eEIF23h/R/rQ
 nJt8/qfdyqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ7b8dwAKCRARpy6gFHHX
 cqNrD/42nR+ZlDZgK/qtK+xulfHuQlHn1AY74smk8hxOmlX3ZsoB4nZolvlRRMsX+P0DfqwCDbG
 J5JYBjhHwqDP/c+YfLhY9SCtWfkdJuA1UdDQaAr7cwZ01DC9hXiy38tBblCKv44f5LcLfH8RfqX
 QfyiWuMJY6Ie5hQ2gsf/p9x27Elo/eGrSY2OAiJ7gvfSxYvzKA2cMWOSO59zjay+MkKmGy2RZ5n
 +GDDHubZbGBEal/fHOdUk1Q7sp2XUB8HUbJeIey7XL94Ekjk9yIbgiRQ9NTgWqNK4Nc8Tz8k2jo
 M8tiBY7EIli7uc8aicwuSGvXenO9Sp2ZBPmsK287HhSg5/7ozvfPCpl0gnnZnUYuy88GliCQm22
 ETOIZqCr1SzgL0yJ44v4XBQmjRIH3KO2DbU3RtVTzD3aXzamxhlG7uftHefUbf1Z96NJtVLEM3U
 HrBKivK9Pk/DEOBBFe5yekduG7/zoCqcdYvddme29mgGBY+tdcW1doJ5X87NIQSmkcpzLR9yaaX
 A4fa9f6AD+VzjzOf7wk0+UbWQaZr/KU1wcIpghAZYueP5aWVaYfJbZFOMXxQ+siycBX5RwFxjWd
 pFSS1n0y2aoncd0L48jawQGiNmh77JnoR2ZnQShBVJ7P6Ma7xNM2dNfXIXk/noTkAvoa6J1iNo7
 gFZa1YKr/EtsdqQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has additional variants of the set(_multiple)
driver callbacks that return an integer to indicate success or failure.
Convert the driver to using them.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sim.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index b6c230fab840..b3baa7e872bd 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -119,12 +119,14 @@ static int gpio_sim_get(struct gpio_chip *gc, unsigned int offset)
 	return !!test_bit(offset, chip->value_map);
 }
 
-static void gpio_sim_set(struct gpio_chip *gc, unsigned int offset, int value)
+static int gpio_sim_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct gpio_sim_chip *chip = gpiochip_get_data(gc);
 
 	scoped_guard(mutex, &chip->lock)
 		__assign_bit(offset, chip->value_map, value);
+
+	return 0;
 }
 
 static int gpio_sim_get_multiple(struct gpio_chip *gc,
@@ -138,14 +140,16 @@ static int gpio_sim_get_multiple(struct gpio_chip *gc,
 	return 0;
 }
 
-static void gpio_sim_set_multiple(struct gpio_chip *gc,
-				  unsigned long *mask, unsigned long *bits)
+static int gpio_sim_set_multiple(struct gpio_chip *gc,
+				 unsigned long *mask, unsigned long *bits)
 {
 	struct gpio_sim_chip *chip = gpiochip_get_data(gc);
 
 	scoped_guard(mutex, &chip->lock)
 		bitmap_replace(chip->value_map, chip->value_map, bits, mask,
 			       gc->ngpio);
+
+	return 0;
 }
 
 static int gpio_sim_direction_output(struct gpio_chip *gc,
@@ -481,9 +485,9 @@ static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device *dev)
 	gc->parent = dev;
 	gc->fwnode = swnode;
 	gc->get = gpio_sim_get;
-	gc->set = gpio_sim_set;
+	gc->set_rv = gpio_sim_set;
 	gc->get_multiple = gpio_sim_get_multiple;
-	gc->set_multiple = gpio_sim_set_multiple;
+	gc->set_multiple_rv = gpio_sim_set_multiple;
 	gc->direction_output = gpio_sim_direction_output;
 	gc->direction_input = gpio_sim_direction_input;
 	gc->get_direction = gpio_sim_get_direction;

-- 
2.45.2


