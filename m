Return-Path: <linux-gpio+bounces-9269-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B599628B3
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 15:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA506283F6A
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 13:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65252188CAD;
	Wed, 28 Aug 2024 13:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fR57m6Jv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89164187FE5;
	Wed, 28 Aug 2024 13:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724851971; cv=none; b=f4RJ9n6DxH/UY3aljbvIMCaunM1RKKm1xFh+ifILiQDQeuL7VfP9L2FJcxrIgqKLA3JSLJjEmhPjOojKAwlQEF04trQ7IlfBMR5sWPJU14eghred2aPynbGJ8WZN47i8rRQ33cElVQzGJxn/i3GlkFbUynMJ0w5dDNmJYS9IoQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724851971; c=relaxed/simple;
	bh=2XSRcAhsIgxmGMC+Jhj0eYGlLwatsGrfTxmjiiVbw28=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K1gKKuAoN/dgj7NYWsDIyvQYXxilXRhaQbiaH9ssrXRiPNtPOefoOV0U8DmMN0m5KNCnFsjyH+7+391bMaul41TAJEdl05xqMc9BLUJOFqc1hsNs4/ZbOIdTJithKNujP7wHO5jTQVqEj1FPOzTaobI5172i9WRI1959Q/NmnYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fR57m6Jv; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42bac9469e8so2570995e9.3;
        Wed, 28 Aug 2024 06:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724851968; x=1725456768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vX5OXPOSkMPqbGMZAISswtCFwqTn+jp7AakChDRSONg=;
        b=fR57m6JvT3D7cGOlaypD1/xhAV17/vVYhGVQHfpds3lEkFDlXZYsD6lQvCr4FokLtY
         ZDrO3RACe6doDPkfJFnla2akv5iTA2GimLxgorfNeRA/vOihcYn/ljl73vkTnzBhTDSd
         1FU8GE8Vb4AuGdsEaR5690+j6E3eRBlgouwR7fErEV1z8QCBRqHzPWJ37eCXG6Ut6w0Q
         U6CkDG7ipmzHWKuo2PksJiBcm4+/4PELU+T+hOr6qVRFXpQGkEQFiwR8kQuRVBOJ7q7f
         6nSQceXJfo6QQm4hWObfZJQQkeZvb06usgRyivgpwSk+Rqz+oYqZit3BTnkoSJmvWurd
         6FbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724851968; x=1725456768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vX5OXPOSkMPqbGMZAISswtCFwqTn+jp7AakChDRSONg=;
        b=ICdmAqY6qy+cuHT/JkrTQUu/a3x2pEcMVSp28pPrvw3c4nDExxW3Zl07I5p4/EmFBy
         ek3o9vFpkYYrRoZzLh2b8hUDd3vySfNjLw4MozOUfm/Y2TnE3eTfuczczxS8Ub8TkOh8
         ZFEIaRTs77GO9NA2E7qyqt/RuHrjvzC3Ycagb3KgngvaZXQuTXnGF8TSC0YXAqu+BlhK
         mFdQiRdbZdKyd4+zyHxl88HJ9XeHcydHHmHkAwTJCca1zoc17gC5HwTaRYWEx0t1dBWo
         qK4X04Zq/M4cUOcfQr1rog9cB2/yu/D3yvtN3v5dl3VUI5RaRllRxHH7HfvRaYIt7Bjs
         b3qg==
X-Forwarded-Encrypted: i=1; AJvYcCViDAn7QtN1bMuUo08Zg4jauH79mykQ3frSGcRITdd7vliOyW3DcUXPik3bd9BDp9mkFZL6tXYQIEui@vger.kernel.org, AJvYcCVlA3259CWiojWgi/qqSiUQ/11LZZ8bBgohyk5WwYHS0Ofo8oCY3Z9N7VSD3L5sd4TI+TwIKGMK@vger.kernel.org, AJvYcCWObZguviD/n8Uo3dPonyTCdrXC1V/Cs59qb3gTaRh9EKUrywf5U3GEY/91qd/2FrQ4jezMwhWJplvws97t@vger.kernel.org
X-Gm-Message-State: AOJu0YyejwKi15EZhngU2+2JKDpRE2IFP2AraA2l6/32FhuO9/5r13V9
	zypDGXG+iIrKZFmvd3vdHgOdL5j1jWGxEQay4wnclg8h+NMJ0JbXbQRZvS6n
X-Google-Smtp-Source: AGHT+IGFX29cXbltT3lcGmPWqanqujpX/4qjLupXabLKah0CJhhZP+MvW7aCG8Zkc714ofxFD8gg/Q==
X-Received: by 2002:a05:600c:3ba9:b0:429:991:dd71 with SMTP id 5b1f17b1804b1-42acc8d4bd5mr107123905e9.11.1724851967480;
        Wed, 28 Aug 2024 06:32:47 -0700 (PDT)
Received: from partp-nb.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba6396662sm22136845e9.3.2024.08.28.06.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 06:32:46 -0700 (PDT)
From: Parth Pancholi <parth105105@gmail.com>
To: Keerthy <j-keerthy@ti.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Parth Pancholi <parth.pancholi@toradex.com>,
	stable@vger.kernel.org
Subject: [PATCH] gpio: davinci: fix lazy disable
Date: Wed, 28 Aug 2024 15:32:07 +0200
Message-Id: <20240828133207.493961-1-parth105105@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

On a few platforms such as TI's AM69 device, disable_irq()
fails to keep track of the interrupts that happen between
disable_irq() and enable_irq() and those interrupts are missed.
Use the ->irq_unmask() and ->irq_mask() methods instead
of ->irq_enable() and ->irq_disable() to correctly keep track of
edges when disable_irq is called.
This solves the issue of disable_irq() not working as expected
on such platforms.

Fixes: 23265442b02b ("ARM: davinci: irq_data conversion.")
Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Parth Pancholi <parth.pancholi@toradex.com>
Cc: stable@vger.kernel.org
---
 drivers/gpio/gpio-davinci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 1d0175d6350b..0ecfa7de5ce2 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -289,7 +289,7 @@ static int davinci_gpio_probe(struct platform_device *pdev)
  * serve as EDMA event triggers.
  */
 
-static void gpio_irq_disable(struct irq_data *d)
+static void gpio_irq_mask(struct irq_data *d)
 {
 	struct davinci_gpio_regs __iomem *g = irq2regs(d);
 	uintptr_t mask = (uintptr_t)irq_data_get_irq_handler_data(d);
@@ -298,7 +298,7 @@ static void gpio_irq_disable(struct irq_data *d)
 	writel_relaxed(mask, &g->clr_rising);
 }
 
-static void gpio_irq_enable(struct irq_data *d)
+static void gpio_irq_unmask(struct irq_data *d)
 {
 	struct davinci_gpio_regs __iomem *g = irq2regs(d);
 	uintptr_t mask = (uintptr_t)irq_data_get_irq_handler_data(d);
@@ -324,8 +324,8 @@ static int gpio_irq_type(struct irq_data *d, unsigned trigger)
 
 static struct irq_chip gpio_irqchip = {
 	.name		= "GPIO",
-	.irq_enable	= gpio_irq_enable,
-	.irq_disable	= gpio_irq_disable,
+	.irq_unmask	= gpio_irq_unmask,
+	.irq_mask	= gpio_irq_mask,
 	.irq_set_type	= gpio_irq_type,
 	.flags		= IRQCHIP_SET_TYPE_MASKED | IRQCHIP_SKIP_SET_WAKE,
 };
-- 
2.34.1


