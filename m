Return-Path: <linux-gpio+bounces-14556-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39904A03C51
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 11:28:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A61AB3A54E9
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 10:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849591E8839;
	Tue,  7 Jan 2025 10:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MyyUhiKr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F71A1E47C4;
	Tue,  7 Jan 2025 10:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736245665; cv=none; b=H6CZA2W+FbFcAPlvc5xk1eePEk7SighTC3GD+g46DGFQAgz6CnQClZZwcW6t7KRIZzBXNxsThKcsAcAxrPNcSpbrG5r+u8PCSzbg3sO+vxms53JuMXdqjg+0PCnR+46QXwkKViHaoSUOvwwI+2XW/Er+b9DnrbZSS6dP2NP8p3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736245665; c=relaxed/simple;
	bh=cGqXAvBKjHldE5wjPw0icjxXqxd19A6GvXP+eKa/IR8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WjlEcKzqtlly7AY7yO8EhlmxMo00pD+uLuv5b0w4M3O9VWLeXx46F3qyVjjCgNKjuh7aCztG4Vzczyf0+/opQR7lLmHlp8C6sPbKrOOfTIFLFUFvVp0nH73GBwrzN1yvRAevE4/RnU32suRoUPZQzRy4eykZOMLCFg/sBH8JwnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MyyUhiKr; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso12947967f8f.1;
        Tue, 07 Jan 2025 02:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736245662; x=1736850462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2QVGdUnSb3wHEFLqL+2JggAjxwQDMbWS6MssaUao6QY=;
        b=MyyUhiKrR27MiWWvylEyJAvuful+wFQOMq2PqzLGwHdc7y7i7g1fKuzs4qVln8Slgq
         e3DLo8ub7fHTCWBmepY3cdKDFIF3uDBJ09eK5LmV+TJVvXjP0IBKL2h8WoNk31zUceGy
         FcrRcJQIGBzU56wSpo14q91LTN0iZt8360zmEXLrOUgzz3kzT3ZTdv0y8l1eIevjk45q
         XTxROnd1MqOc96ondAUK8/x7JoAhnP+vdyGxdJ2QrsM4U7+1JeRvgN+85uXuJLZ8JJ+Z
         qlWzj1gKxYtKa2JGKLq46t+sSgCPxRq0Jf5nRx0ahNLrE0/9MozHLvC32padLKyqkKNS
         6fYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736245662; x=1736850462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2QVGdUnSb3wHEFLqL+2JggAjxwQDMbWS6MssaUao6QY=;
        b=AGVQ90t0OrZi7Je9pYI4nCheQQz3DskwxwOr0xgUVonSfQ5yswmUeOvde02PUXCUTs
         RPCNB7HXKOryLmEkIgqkuQRvKTz5v9KoLP5aaLgHah8/BDNWo2qxQ8/OFiWRulFAwAae
         AGAjFzXwqcCqib0FPu0ZAAI2n/ds9SSjL8Sf5WDJUC57WpHjw+QpEOtJgYAWcek/fS5C
         bj2fw6lGnUMxzZWQeqlKvFE17qTp5mz/Na56HMkIz9V2fzIFRh4HkYI6jLOYPRL04BwP
         MdYnMx9XUXGs6zhI2pvovaz/CLXuqVvPskJMm1V3htx6EuAh/J/c4eW6LYZiwg+eJnoW
         61vw==
X-Forwarded-Encrypted: i=1; AJvYcCUGSpJoiyj98pHIuCGMWES8MsszSKv261rJvYFp+8+SG5sV1Pb5tUNGrdcbsrsQU/FSNi4NuRG5n2yh6Xh0@vger.kernel.org, AJvYcCUNI/5cELTH8Yoojc6dK8JDc7+suZhnFEcXZHUkiPIaGbOgeg3f8Xa3PBm+vl7sTsvGMXAWprmksiiz@vger.kernel.org
X-Gm-Message-State: AOJu0YwdPjlWJSgvESXaJ9pGRVG5FQGmxOfhiGYCWjBIfo2uunoFysdF
	HqarmnINkEeVdctE3KGGPGI+z5sx+rgiXdtarBJJwkDq+kryAapg
X-Gm-Gg: ASbGncsr7wMt/pu2NbOYmDS2fe6i3Lb9m3enVCnzr1lfuZado5jYdfuER+VURl4KsG4
	tiQLvxD+LYTo2kLdObC2ctq8zhmpVPk4nTnIWjWkfMwhWmfNYDI02GWHLnpWILffVvqPyhrwMzL
	8IV4fRmEYsoLurecXg97APTEcmX4h7CBrz3KrzS7pL8mnPjCzKZMPS0t3sbV9P4le1iOublGIHp
	Sz7PyCvyfGi2Zj3FC4TNgldXtiMUuOhDqc+ROPkjTZFvUe61GM=
X-Google-Smtp-Source: AGHT+IEle+fYL1GvOAul2ZRgkmHc+vS1DJX3SBs792BbqFnxqg8EEnvU3kQmaPV7llvUbI7DNVsD+Q==
X-Received: by 2002:a05:6000:4b0b:b0:386:37f5:99e7 with SMTP id ffacd0b85a97d-38a22201897mr53365613f8f.33.1736245661717;
        Tue, 07 Jan 2025 02:27:41 -0800 (PST)
Received: from skynet.lan ([213.99.223.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea3d5sm598711065e9.5.2025.01.07.02.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 02:27:41 -0800 (PST)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: jonas.gorski@gmail.com,
	kylehendrydev@gmail.com,
	florian.fainelli@broadcom.com,
	linus.walleij@linaro.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Subject: [PATCH 2/2] pinctrl: bcm63xx: implement gpio_regmap request/free
Date: Tue,  7 Jan 2025 11:27:35 +0100
Message-Id: <20250107102735.317446-3-noltari@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107102735.317446-1-noltari@gmail.com>
References: <20250107102735.317446-1-noltari@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Implement pinctrl gpio request/free functions on gpio_regmap, which ensures
calling gpio_request_enable on bcm63xx pinctrl drivers when a gpio is
requested.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm63xx.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm63xx.c b/drivers/pinctrl/bcm/pinctrl-bcm63xx.c
index 59d2ce8462d8..4abd52613dfe 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm63xx.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm63xx.c
@@ -6,10 +6,12 @@
  * Copyright (C) 2016 Jonas Gorski <jonas.gorski@gmail.com>
  */
 
+#include <linux/gpio/driver.h>
 #include <linux/gpio/regmap.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mod_devicetable.h>
 #include <linux/of.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 
 #include "pinctrl-bcm63xx.h"
@@ -32,6 +34,16 @@ static int bcm63xx_reg_mask_xlate(struct gpio_regmap *gpio,
 	return 0;
 }
 
+static int bcm63xx_request(struct gpio_chip *chip, unsigned int offset)
+{
+	return pinctrl_gpio_request(chip, offset);
+}
+
+static void bcm63xx_free(struct gpio_chip *chip, unsigned int offset)
+{
+	pinctrl_gpio_free(chip, offset);
+}
+
 static const struct of_device_id bcm63xx_gpio_of_match[] = {
 	{ .compatible = "brcm,bcm6318-gpio", },
 	{ .compatible = "brcm,bcm6328-gpio", },
@@ -57,6 +69,8 @@ static int bcm63xx_gpio_probe(struct device *dev, struct device_node *node,
 	grc.reg_dir_out_base = BCM63XX_DIROUT_REG;
 	grc.reg_set_base = BCM63XX_DATA_REG;
 	grc.reg_mask_xlate = bcm63xx_reg_mask_xlate;
+	grc.request = bcm63xx_request;
+	grc.free = bcm63xx_free;
 
 	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &grc));
 }
-- 
2.39.5


