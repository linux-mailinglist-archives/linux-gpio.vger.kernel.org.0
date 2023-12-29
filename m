Return-Path: <linux-gpio+bounces-1917-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D945081FF95
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Dec 2023 14:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F6B61F21B24
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Dec 2023 13:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F92111BA;
	Fri, 29 Dec 2023 13:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="eK9NUZ75"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D288C111B0
	for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 13:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CABEE3F73C
	for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 13:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1703855290;
	bh=R+U2uLziDgx+IP4bP4iaMKnlOMS40so+TR+KdlJRETI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=eK9NUZ751EG8XuCqHJjBkaq+ncUXr6PzlYT+zrbvp2ACMCzKJpSx4DvkmFeKL5Q99
	 boW7ZeongFkRMzciT9OS9UVesrn+sn9vWQnNqoqVxpZrkXfiuPBZwd1Obr1yaMLyRt
	 l9q0yqHBFXfz6fX95Tqa8yghJqsqxhTkfjWzizuQu25jyxrcQ1FEwxkvI6Yf4vIwgI
	 oZQ0i+fW9PjPrZ1IKwLBgyaNGiQb/KhnUFAjqgOROalCparTY7u4BpRoxxNxtmOZMY
	 XlBONN9+8eFY1gs8NFvzc5JTZIFxV4iv3n/APR4+1eVB6+HBGFT9KLfvVW3WQcLUbt
	 PEXMMpXwW/ekw==
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-555aa6b787dso477317a12.3
        for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 05:08:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703855290; x=1704460090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+U2uLziDgx+IP4bP4iaMKnlOMS40so+TR+KdlJRETI=;
        b=Sjz28jGUhXL4PMWQprgFedFOAzQq4P1Y/uy2T4UZ7/JL6VTLsAZvnek9GiST0BuoQ9
         su6/lIOg5AY//X/HN0g/Btu9WcaJN9dDfvKWyK1RxPi6bU1syJaMGNw8LGwRUiJKcEC/
         X+PUmF5xmSmupcfEje9CLr0zFmyAMHFe2dn/wxvxrCPYOrFsYIoDSWkqd/NEfdgHa9bz
         4F7OZybExQMcIAY3obobL4yzTNRecpLDZPxN+j/uSHSpXy3JHbNy+pi5s7VvCww3zju4
         PI7IKyPbr3dxIUzkKm0dTxKeRuW/mtb2AZ5Z/TZisBznK7z+Bsk2027/Qz0BBLDlgzuv
         t+4A==
X-Gm-Message-State: AOJu0YzZ+LwzNToCnwIUfVhywQtGiAJaug0ADNfwvBhsMi/uABHkQQrh
	AYOz76cnWyi+hTIRHZqsbBm2CWomF7zvFR7A6JucTQ5LQQPEXt3Q1vVmc1p/vJAt+LKXLbH+w+W
	AwhyldJ/AoYXqn0qTEOfYd3wdFevSsrQxcYOhV5m6/iC3y4j4AHZdKjy0
X-Received: by 2002:a17:907:1047:b0:a1f:7298:aa25 with SMTP id oy7-20020a170907104700b00a1f7298aa25mr5908872ejb.45.1703855290056;
        Fri, 29 Dec 2023 05:08:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOl2xY+pSzy8GIwLI8YWCBORZjtn0Q6seBKWUm/MYOhifqEVMnq+cdXs9qSb+TuynSBKEeaQ==
X-Received: by 2002:a17:907:1047:b0:a1f:7298:aa25 with SMTP id oy7-20020a170907104700b00a1f7298aa25mr5908860ejb.45.1703855289728;
        Fri, 29 Dec 2023 05:08:09 -0800 (PST)
Received: from stitch.. ([2001:67c:20a1:1909:b62b:6d4a:f569:ad01])
        by smtp.gmail.com with ESMTPSA id ex1-20020a170907954100b00a26f22dca5asm4359327ejc.0.2023.12.29.05.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 05:08:09 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH v1] gpio: dwapb: Use generic request, free and set_config
Date: Fri, 29 Dec 2023 14:07:51 +0100
Message-ID: <20231229130758.84214-1-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This way GPIO will be denied on pins already claimed by other devices
and basic pin configuration (pull-up, pull-down etc.) can be done
through the userspace GPIO API.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 drivers/gpio/gpio-dwapb.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 8c59332429c2..798235791f70 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -416,11 +416,12 @@ static int dwapb_gpio_set_config(struct gpio_chip *gc, unsigned offset,
 {
 	u32 debounce;
 
-	if (pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
-		return -ENOTSUPP;
+	if (pinconf_to_config_param(config) == PIN_CONFIG_INPUT_DEBOUNCE) {
+		debounce = pinconf_to_config_argument(config);
+		return dwapb_gpio_set_debounce(gc, offset, debounce);
+	}
 
-	debounce = pinconf_to_config_argument(config);
-	return dwapb_gpio_set_debounce(gc, offset, debounce);
+	return gpiochip_generic_config(gc, offset, config);
 }
 
 static int dwapb_convert_irqs(struct dwapb_gpio_port_irqchip *pirq,
@@ -530,10 +531,14 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
 	port->gc.fwnode = pp->fwnode;
 	port->gc.ngpio = pp->ngpio;
 	port->gc.base = pp->gpio_base;
+	port->gc.request = gpiochip_generic_request;
+	port->gc.free = gpiochip_generic_free;
 
 	/* Only port A support debounce */
 	if (pp->idx == 0)
 		port->gc.set_config = dwapb_gpio_set_config;
+	else
+		port->gc.set_config = gpiochip_generic_config;
 
 	/* Only port A can provide interrupts in all configurations of the IP */
 	if (pp->idx == 0)
-- 
2.43.0


