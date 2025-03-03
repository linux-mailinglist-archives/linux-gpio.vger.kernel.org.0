Return-Path: <linux-gpio+bounces-17074-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 499D2A4EACF
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 19:12:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 025137A26DB
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 18:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0E3259C9C;
	Tue,  4 Mar 2025 17:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cYAWsUbR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from beeline2.cc.itu.edu.tr (beeline2.cc.itu.edu.tr [160.75.25.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FE124EAB6
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 17:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=160.75.25.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741110821; cv=pass; b=U+ResWeOG62KLdva0oFGUiZTidAbnjM6BQY3QH6QBOPzdDOdYOS7ITB673RQblVzAfomjv5Kyo2PpDgbzL6w2eHuyhg/osXqUoSCMZZfW4OfbKZBCVaiV01ImJ7VFfj3xTOQ1Fn4lkdxiocs3dFAZB9jVxm3VRa715Mje4V9NsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741110821; c=relaxed/simple;
	bh=gJCT2x0MTbORYrOB0+eP20IuPL7gfsLN+SSPmgQiy48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZBR2zQux82HDD8u6+jGnghTob+Q+Ap7N6x7yO6Hml+YV77jnCZP6kyVA+yTzbjQGD1SYaX4Pwrzr5+1r3xP/6Ghg41cJKwQ/fbp2JZJpj1aDEhPny7Mpw1Ts3AnbjH90IbskLdRsjBnnIbIi2u6WJSVwDF1b8aUPLNNT+LBfxA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cYAWsUbR; arc=none smtp.client-ip=209.85.128.46; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; arc=pass smtp.client-ip=160.75.25.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline2.cc.itu.edu.tr (Postfix) with ESMTPS id 614154089531
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 20:53:37 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=pass (2048-bit key, unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=cYAWsUbR
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6h763RRszG3cJ
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 19:32:50 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id 2077F427BA; Tue,  4 Mar 2025 19:32:40 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cYAWsUbR
X-Envelope-From: <linux-kernel+bounces-541797-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cYAWsUbR
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
	by le2 (Postfix) with ESMTP id DBB21421DE
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 16:23:17 +0300 (+03)
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by fgw1.itu.edu.tr (Postfix) with SMTP id 7376A3064C07
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 16:23:17 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1CB13AC751
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 13:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C704D214A70;
	Mon,  3 Mar 2025 13:19:00 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDECE21505C
	for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 13:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741007936; cv=none; b=CYA63XO6qNGyKE7O4+EjJ5L/zh17LVPO3M/Y+6EX8R/wenBcQEhTr5Jp30wipRlaQ5OTdbebWREQsD8GP00uKn3wbrmYlO2EaBz1YqSSUKBxb5vRJagDK1Wge8gMC6WIT2B+iyyYsNqec0tFmNzioUlADM5ZFvt20VyV/0VrRIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741007936; c=relaxed/simple;
	bh=gJCT2x0MTbORYrOB0+eP20IuPL7gfsLN+SSPmgQiy48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fO9X21E549I/5dOAp1VFAg85d0W0/6gfGWY5D+nXpT07JYdQK6289SI9fcLpM5EoSDqIFA50Kj6cD/37FTlcizvR2RTa/wfBoHaScX4v5O83Qf5ww6gzi0YeIKDihrISMf86jwUD6QkCLqeF076q93u1sBKc0LFjn8fz2J3gkT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cYAWsUbR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43bbd711eedso9766295e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Mar 2025 05:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741007933; x=1741612733; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Mna2g5kGAQGbITypIOAf332guWttEFjYKfE+wICzl8=;
        b=cYAWsUbRJv5Eo4BFu6NUWQjUiXEnOqSFNt/ZkN/pDyEMoLtq5sX5NiyQXdIjAWukBE
         eFM57fCCrIov/Jcm9TrzvXUH6IbTipsxgWECxyBMIDNoMhzWUU/fveiEOn09cZFWQ/Rv
         IipgyM5TxnYLiOtKGz7HE5JulJH8Bb5xUy/d8LX7nTicikw9HtYMibi1s7W4i3rKNgGT
         xRP3KwmdwN72Sb3dlFUX6yUonsdRUby91zG9V1XjVjcDsprjxhlsopARD/GHh4aNdmvj
         pAukKJguecMZBc0RBGY1EAYoiKKVihaDm+UdvWBM1SVPyCLZBT8uKutySK4OgLn0ROjg
         /6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007933; x=1741612733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Mna2g5kGAQGbITypIOAf332guWttEFjYKfE+wICzl8=;
        b=iV0D5e/h4O/LuACaH3aKJbNRgfHNpHluxnjjqSU2N76Ruz6XCZE+ehTAvcWysw5rMr
         M7K5uQEwBLduh3SILfBKsA9UFe2/yZsQdfVGt33lCbXgK0rbqtKa018yVrV76od5oK53
         99c7WPW7xALa+z0VRv2hps1CQv9qCpMyCEGjj35Ho3QSD1nL96lB4DT9VzaIJsfTrbMf
         ZofrhGGNZt8pM/Ired9uDKhUxdVnJcSY8vnYe8Cfa0OlihBuk8P7dm0QeR8n05shvpDe
         N9AIl5Dcqw1ndOnPLng1TTICgQYTBqcCDJbzL8u1WRdh7kzY9ZLEIpv0tKLc2YXN4G+0
         Inpg==
X-Forwarded-Encrypted: i=1; AJvYcCWwATv/Lg0AEaMCyzskw3x2IcU+LjQyPSFLC0Ojf5yRo0/+CD7xWkF5OPEDdV0iYw3SwF+a0Lb3x2702h8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHzU/l7NsBYaCFm5cnncgNAgzuHjA/Hdgj8CtGNGNHB/NtvXdY
	Fy4Z0G+s4eemzAjvIX1NyP31UvFCV5nZMeC/8hrOhpEuZrdZq/Mj3gAuq+O05eU=
X-Gm-Gg: ASbGncvo1tsd8fg78WgZo5JtJXQdQGVwwiPh3JJcUQhr+f45Yn0vKTacE8Da7Ve4IyG
	R8sfdT6CtIDQn/uku1V3zPfaD3KMtrN8dJPzwjcfXCel3HxH3TQrZX6bmAf6UiXcHRQUZgEB0Kl
	4WO1OlUGT/SNzLjNmyPLXjPkGEUPRVRKH83gXqjWd4eKQpe6n3sxmrj3bsm11TBeR3t5n2oZVP1
	mYhFMeJTG7VE8DbtMzrNPgJZQAfPVEigvMVEpyt1bWgK/vsWYk2g7If8DfUhUjJkIuzqgtiIEe8
	WGScdamBzxJrhoLDBDB3EwvVD10mlXt75iSm6Q==
X-Google-Smtp-Source: AGHT+IFY22PCA1a2+aN5bDi5iCcPupeWgrWRYBU3OAd6qR1uqfM8OPw60ciFVK/sAA1n6Y60dhPpwQ==
X-Received: by 2002:a05:600c:1392:b0:439:88bb:d002 with SMTP id 5b1f17b1804b1-43ba6727b57mr103602005e9.23.1741007933166;
        Mon, 03 Mar 2025 05:18:53 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba538b9fsm194821915e9.17.2025.03.03.05.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:18:52 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Mar 2025 14:18:39 +0100
Subject: [PATCH 14/15] gpio: aspeed-sgpio: use lock guards
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-gpiochip-set-conversion-v1-14-1d5cceeebf8b@linaro.org>
References: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
In-Reply-To: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mun Yew Tham <mun.yew.tham@intel.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5780;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=0qXZl4P6oay9QYtQck71x8HYJPy63jgVqg/jPZp1JP8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnxawsJBgL9NLW7b7FCtj23bKQ2kGRMqw9cfP5j
 kWw5bq4/RWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8WsLAAKCRARpy6gFHHX
 cjEGD/9I/yPodJyzCvoLyTdAs9s5HAxWXV840R+OGBpnA+oBXEY0FEbNiwC/ZRm6SNhGJrpxwfM
 0Cw6Nxab1aIHNmI/IkLcksuG5r8U++V+RfblyWmsofiye6Cjmi2k1JY8NHPqGNfxGHSCi05c6hr
 +o0YH0h4Pkb/XCzt7Xrp9gQxm14ttMk9AnxYSEj8KT53aCRaiacOJeAueSocxP/0plWhJWnLBlE
 udhOpcnmP2QDd3bu2veRGB05Tb3mO8juN5L0ClWpZH7vfWmJ4tGxo6CLQ/BJCbctfAzExS6R+8Z
 wrisMCfrjV1zNfFfgvEC9iQXHEXeprwQA+LPKEdM8uUK7wsSIaNYRhgCH2zKOv3tfd84zaa04xA
 VHJ6Si4eURMZ5f5J26a+xy6d9LHe7hM6r4zG/yOurvpFt5+UdpPnB7K9tC0AtobOSf1nYMXu/Sx
 xSgB2mwmYmf3UgO0RE9yimPFnwaA4+Q6rMb2bSyqnKDIC9RbqCYCdO0fqjgz0zaWogldF2563Pc
 rqMkKNXgx38lLXc1hXAjdiEn5FsrcnratZRfM72ETy/jHE1TjvODlvn4UVeKvQg1+yYmrtuOnZ5
 D9tcdNqZ961mLhWwMoF//HwFYaND3V9NpBfENgdDRuf/cQg9XmRLHJDhqH0uqZ+Ah5XIdxt1iBe
 e56xOZfdkwuJ96Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6h763RRszG3cJ
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741715464.13955@w/rbWVDacv0kpHHxbxakkg
X-ITU-MailScanner-SpamCheck: not spam

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reduce the code complexity by using automatic lock guards with the raw
spinlock.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-aspeed-sgpio.c | 76 +++++++++++++++-------------------------
 1 file changed, 29 insertions(+), 47 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index 34eb26298e32..5ce86de22563 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
 #include <linux/hashtable.h>
@@ -170,17 +171,14 @@ static int aspeed_sgpio_get(struct gpio_chip *gc, unsigned int offset)
 {
 	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
 	const struct aspeed_sgpio_bank *bank = to_bank(offset);
-	unsigned long flags;
 	enum aspeed_sgpio_reg reg;
 	int rc = 0;
 
-	raw_spin_lock_irqsave(&gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&gpio->lock);
 
 	reg = aspeed_sgpio_is_input(offset) ? reg_val : reg_rdata;
 	rc = !!(ioread32(bank_reg(gpio, bank, reg)) & GPIO_BIT(offset));
 
-	raw_spin_unlock_irqrestore(&gpio->lock, flags);
-
 	return rc;
 }
 
@@ -214,13 +212,10 @@ static int sgpio_set_value(struct gpio_chip *gc, unsigned int offset, int val)
 static void aspeed_sgpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 {
 	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&gpio->lock);
 
 	sgpio_set_value(gc, offset, val);
-
-	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 }
 
 static int aspeed_sgpio_dir_in(struct gpio_chip *gc, unsigned int offset)
@@ -231,15 +226,14 @@ static int aspeed_sgpio_dir_in(struct gpio_chip *gc, unsigned int offset)
 static int aspeed_sgpio_dir_out(struct gpio_chip *gc, unsigned int offset, int val)
 {
 	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
-	unsigned long flags;
 	int rc;
 
 	/* No special action is required for setting the direction; we'll
 	 * error-out in sgpio_set_value if this isn't an output GPIO */
 
-	raw_spin_lock_irqsave(&gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&gpio->lock);
+
 	rc = sgpio_set_value(gc, offset, val);
-	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 
 	return rc;
 }
@@ -269,7 +263,6 @@ static void aspeed_sgpio_irq_ack(struct irq_data *d)
 {
 	const struct aspeed_sgpio_bank *bank;
 	struct aspeed_sgpio *gpio;
-	unsigned long flags;
 	void __iomem *status_addr;
 	int offset;
 	u32 bit;
@@ -278,18 +271,15 @@ static void aspeed_sgpio_irq_ack(struct irq_data *d)
 
 	status_addr = bank_reg(gpio, bank, reg_irq_status);
 
-	raw_spin_lock_irqsave(&gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&gpio->lock);
 
 	iowrite32(bit, status_addr);
-
-	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 }
 
 static void aspeed_sgpio_irq_set_mask(struct irq_data *d, bool set)
 {
 	const struct aspeed_sgpio_bank *bank;
 	struct aspeed_sgpio *gpio;
-	unsigned long flags;
 	u32 reg, bit;
 	void __iomem *addr;
 	int offset;
@@ -301,17 +291,15 @@ static void aspeed_sgpio_irq_set_mask(struct irq_data *d, bool set)
 	if (set)
 		gpiochip_enable_irq(&gpio->chip, irqd_to_hwirq(d));
 
-	raw_spin_lock_irqsave(&gpio->lock, flags);
+	scoped_guard(raw_spinlock_irqsave, &gpio->lock) {
+		reg = ioread32(addr);
+		if (set)
+			reg |= bit;
+		else
+			reg &= ~bit;
 
-	reg = ioread32(addr);
-	if (set)
-		reg |= bit;
-	else
-		reg &= ~bit;
-
-	iowrite32(reg, addr);
-
-	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+		iowrite32(reg, addr);
+	}
 
 	/* Masking the IRQ */
 	if (!set)
@@ -339,7 +327,6 @@ static int aspeed_sgpio_set_type(struct irq_data *d, unsigned int type)
 	const struct aspeed_sgpio_bank *bank;
 	irq_flow_handler_t handler;
 	struct aspeed_sgpio *gpio;
-	unsigned long flags;
 	void __iomem *addr;
 	int offset;
 
@@ -366,24 +353,22 @@ static int aspeed_sgpio_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	raw_spin_lock_irqsave(&gpio->lock, flags);
+	scoped_guard(raw_spinlock_irqsave, &gpio->lock) {
+		addr = bank_reg(gpio, bank, reg_irq_type0);
+		reg = ioread32(addr);
+		reg = (reg & ~bit) | type0;
+		iowrite32(reg, addr);
 
-	addr = bank_reg(gpio, bank, reg_irq_type0);
-	reg = ioread32(addr);
-	reg = (reg & ~bit) | type0;
-	iowrite32(reg, addr);
+		addr = bank_reg(gpio, bank, reg_irq_type1);
+		reg = ioread32(addr);
+		reg = (reg & ~bit) | type1;
+		iowrite32(reg, addr);
 
-	addr = bank_reg(gpio, bank, reg_irq_type1);
-	reg = ioread32(addr);
-	reg = (reg & ~bit) | type1;
-	iowrite32(reg, addr);
-
-	addr = bank_reg(gpio, bank, reg_irq_type2);
-	reg = ioread32(addr);
-	reg = (reg & ~bit) | type2;
-	iowrite32(reg, addr);
-
-	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+		addr = bank_reg(gpio, bank, reg_irq_type2);
+		reg = ioread32(addr);
+		reg = (reg & ~bit) | type2;
+		iowrite32(reg, addr);
+	}
 
 	irq_set_handler_locked(d, handler);
 
@@ -487,13 +472,12 @@ static int aspeed_sgpio_reset_tolerance(struct gpio_chip *chip,
 					unsigned int offset, bool enable)
 {
 	struct aspeed_sgpio *gpio = gpiochip_get_data(chip);
-	unsigned long flags;
 	void __iomem *reg;
 	u32 val;
 
 	reg = bank_reg(gpio, to_bank(offset), reg_tolerance);
 
-	raw_spin_lock_irqsave(&gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&gpio->lock);
 
 	val = readl(reg);
 
@@ -504,8 +488,6 @@ static int aspeed_sgpio_reset_tolerance(struct gpio_chip *chip,
 
 	writel(val, reg);
 
-	raw_spin_unlock_irqrestore(&gpio->lock, flags);
-
 	return 0;
 }
 

-- 
2.45.2



