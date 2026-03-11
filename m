Return-Path: <linux-gpio+bounces-33187-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLhRMEDFsWniFAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33187-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:40:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 477782697D3
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D888B3130AB9
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 19:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B100B2C11CA;
	Wed, 11 Mar 2026 19:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mQDgDSU1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5324372EFC
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 19:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257974; cv=none; b=Gf3/sqDYpNA92ls2CC1OzNhP2zs6dVkuOAu8TG30HpC2FZsQYcX8wzzemiDsh6Luju+8oin/e67mZHG7l66Wv9vDnnIqHaBJSlFTtwv75KNxkq+53lmKTSi/qTgL0sGmngnE6/6v+v1NlcziFlmppCvqozEfKClfdufTf0K8PHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257974; c=relaxed/simple;
	bh=b0+EIOi8VZGnVfS2+VeQ8ek/Iuh35iblH8PEzYt72RI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=olMTLbU0uDzx1bxhT89s4OMKm4xopODn3puByU02PHeK5ITz/pPZ3SZ5jUdF7IlaTAX1tXzzo82hi1xKkzDA0jSMJLjOYQzf3yTMYbnXiD26NR8VR5NhCsYDpVxwSeKjHRk/nRMcIkFakZbrJ1QYS/Zv3yfr3mA+y3yGyGhBRoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mQDgDSU1; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439b9b1900bso159793f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 12:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773257968; x=1773862768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sctYsMoKQO849nQjqKlN3dvm2Uh2aK2/meOPVblHZeQ=;
        b=mQDgDSU1j7+4ILCSoXi0duEfpK0OukCQEU7RlfznQn4yjQuxhmasN5l5u0gZmp0GSm
         ALFNHhZRQpw5oO/pNkpq9VQgXZDlRwiDlMbcr/FQhRF5RUzrMUbUY8eL5KYPOTuRCros
         SCSjQT308+Zxr2SPTgxN5LNMyondlcIwYFKdA8UsX//LEFKwqIbSbeifs8+0y8dNdnzS
         qPJb9srYDsP/b7POSLqzRLz1qOu4OfmOmU3e9wFZlQd0hKcTEACYnVdCBkFABAMoyO6v
         6bGV61Yk828eCtmTq0eu9o5aMNZOOSU2z0EYwDB0MdOomrwu9tab0cOSTDuLa8//ansV
         fdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257968; x=1773862768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sctYsMoKQO849nQjqKlN3dvm2Uh2aK2/meOPVblHZeQ=;
        b=idaib/MDtMFUe4dEbLfkuU5rmA1/mqKfqcIYhJ4/IjI6kXG7r3XV2qefaVRs9mg21w
         /MoIKUoCi+q6Y7JWSFLQyjqZQAjQsfHBnekHjuVbWsE8gumSQG1rc7nUPy0COnr4DyW8
         Icth4urQeqSBpi4aD/ZadckY7WEXQmvg9eH1MJ5BLY3W0lODVeHkPFlXcd32+GR+EOZA
         qg8ZGf7Luc5oECgmQrE2iDn8eTji+9b1iS8aNG4N999dhJH4sLeywxM1fEV2kczoPM9C
         5aBQyJqysdEixSyADYFcRWmceCbaBvctDV0FsmG48J/sg0g4QHJ3/3yOTJdCABlLhQoC
         2aTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkbvl8Yz5fCkxzdDCZt29UqDB976M/TaMn544DjcMSYYbOpA9GFmii9xevfmhw322Z9XYCY2C5tAhp@vger.kernel.org
X-Gm-Message-State: AOJu0YyUsBzBUnYQXNpr9Vd+DBDnCzsIh7ETHtT2STg7RhYQ0TaRZxCH
	xjzjBaM8Ug1kbugFEr0eYvIS/M8OhzBR0bsTzXmkU8EmYRrQuvey33GnSWDQOCaTd7c=
X-Gm-Gg: ATEYQzw09175tf45QJLovfzpPcrAHnEbrWwAOiVxrd9iZ4J7fxdnHQHh49NwSDZKULI
	jk3Zd2fAMN935X4tfy02AsJUzkhloHoFXuMIApfzgbUqPeBbFpi4Iato9zlw+ysEdGphmA2nOFX
	93Wt0Lrk6Yxq0j1ElJDOL1Mb189oFvXeXqlRl/ZtVgOGkT0o72qHjYTwl+qeFVZHlxGrgA9Bzz0
	zhHqkOM4aHlklyvtXOU7H4Et0CKAFnX+bnIu07p1rjbxzmSCMl6oD2wqoF6vEUmHI6ngXlWojdg
	OgRQKdwbaVJJ70vQlLZw9UQIv0xB+kkzQtUMk9D+/y83Ra+/f2hCPVhf+retZUPqqxqw/50RZR3
	ODmQnPEg2RmSPuyfQeSWOnEc6irwmenwL7KKbAmZXCkhQfwy1S+yYPeb4FyGT0wDXH64vJCJ1OT
	b0ZQBRHuiRXT3zr+qCdAgGvxI0ZsLE
X-Received: by 2002:a05:6000:2508:b0:439:ac8f:5da5 with SMTP id ffacd0b85a97d-439f81bdae2mr7697986f8f.8.1773257967835;
        Wed, 11 Mar 2026 12:39:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19aec5sm1559967f8f.4.2026.03.11.12.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:39:27 -0700 (PDT)
Date: Wed, 11 Mar 2026 22:39:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org
Subject: [PATCH v3 7/7] gpio: add pinctrl based generic gpio driver
Message-ID: <93920f541564bc4e6aaf0f2b6df2f5aca721d452.1773150895.git.dan.carpenter@linaro.org>
References: <cover.1773150895.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1773150895.git.dan.carpenter@linaro.org>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33187-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 477782697D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: AKASHI Takahiro <takahiro.akashi@linaro.org>

The ARM SCMI pinctrl protocol allows GPIO access.  Instead of creating
a new SCMI gpio driver, this driver is a generic GPIO driver that uses
standard pinctrl interfaces.

Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpio/Kconfig           |   7 ++
 drivers/gpio/Makefile          |   1 +
 drivers/gpio/gpio-by-pinctrl.c | 124 +++++++++++++++++++++++++++++++++
 3 files changed, 132 insertions(+)
 create mode 100644 drivers/gpio/gpio-by-pinctrl.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b45fb799e36c..4c8d2589c412 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -246,6 +246,13 @@ config GPIO_BRCMSTB
 	help
 	  Say yes here to enable GPIO support for Broadcom STB (BCM7XXX) SoCs.
 
+config GPIO_BY_PINCTRL
+	tristate "GPIO support based on a pure pin control backend"
+	depends on GPIOLIB
+	help
+	  Select this option to support GPIO devices based solely on pin
+	  control.  This is used to do GPIO over the ARM SCMI protocol.
+
 config GPIO_CADENCE
 	tristate "Cadence GPIO support"
 	depends on OF_GPIO
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index c05f7d795c43..20d4a57afdaa 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_GPIO_BD9571MWV)		+= gpio-bd9571mwv.o
 obj-$(CONFIG_GPIO_BLZP1600)		+= gpio-blzp1600.o
 obj-$(CONFIG_GPIO_BRCMSTB)		+= gpio-brcmstb.o
 obj-$(CONFIG_GPIO_BT8XX)		+= gpio-bt8xx.o
+obj-$(CONFIG_GPIO_BY_PINCTRL)		+= gpio-by-pinctrl.o
 obj-$(CONFIG_GPIO_CADENCE)		+= gpio-cadence.o
 obj-$(CONFIG_GPIO_CGBC)			+= gpio-cgbc.o
 obj-$(CONFIG_GPIO_CLPS711X)		+= gpio-clps711x.o
diff --git a/drivers/gpio/gpio-by-pinctrl.c b/drivers/gpio/gpio-by-pinctrl.c
new file mode 100644
index 000000000000..c1fed14c9d01
--- /dev/null
+++ b/drivers/gpio/gpio-by-pinctrl.c
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (C) 2023 Linaro Inc.
+//   Author: AKASHI takahiro <takahiro.akashi@linaro.org>
+
+#include <linux/gpio/driver.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+#include "gpiolib.h"
+
+struct pin_control_gpio_priv {
+	struct gpio_chip chip;
+};
+
+static int pin_control_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	unsigned long config;
+	bool in, out;
+	int ret;
+
+	config = PIN_CONFIG_INPUT_ENABLE;
+	ret = pinctrl_gpio_get_config(gc, offset, &config);
+	if (ret)
+		return ret;
+	in = config;
+
+	config = PIN_CONFIG_OUTPUT_ENABLE;
+	ret = pinctrl_gpio_get_config(gc, offset, &config);
+	if (ret)
+		return ret;
+	out = config;
+
+	/* Consistency check - in theory both can be enabled! */
+	if (in && !out)
+		return GPIO_LINE_DIRECTION_IN;
+	if (!in && out)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return -EINVAL;
+}
+
+static int pin_control_gpio_direction_output(struct gpio_chip *chip,
+					     unsigned int offset, int val)
+{
+	return pinctrl_gpio_direction_output(chip, offset);
+}
+
+static int pin_control_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	unsigned long config;
+	int ret;
+
+	config = PIN_CONFIG_LEVEL;
+	ret = pinctrl_gpio_get_config(chip, offset, &config);
+	if (ret)
+		return ret;
+
+	return !!config;
+}
+
+static int pin_control_gpio_set(struct gpio_chip *chip, unsigned int offset,
+				 int val)
+{
+	unsigned long config;
+
+	config = PIN_CONF_PACKED(PIN_CONFIG_LEVEL, val);
+	return pinctrl_gpio_set_config(chip, offset, config);
+}
+
+static int pin_control_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct pin_control_gpio_priv *priv;
+	struct gpio_chip *chip;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	chip = &priv->chip;
+	chip->label = dev_name(dev);
+	chip->parent = dev;
+	chip->base = -1;
+
+	chip->request = gpiochip_generic_request;
+	chip->free = gpiochip_generic_free;
+	chip->get_direction = pin_control_gpio_get_direction;
+	chip->direction_input = pinctrl_gpio_direction_input;
+	chip->direction_output = pin_control_gpio_direction_output;
+	chip->get = pin_control_gpio_get;
+	chip->set = pin_control_gpio_set;
+	chip->set_config = gpiochip_generic_config;
+
+	ret = devm_gpiochip_add_data(dev, chip, priv);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+}
+
+static const struct of_device_id pin_control_gpio_match[] = {
+	{ .compatible = "scmi-pinctrl-gpio" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, pin_control_gpio_match);
+
+static struct platform_driver pin_control_gpio_driver = {
+	.probe = pin_control_gpio_probe,
+	.driver = {
+		.name = "pin-control-gpio",
+		.of_match_table = pin_control_gpio_match,
+	},
+};
+module_platform_driver(pin_control_gpio_driver);
+
+MODULE_AUTHOR("AKASHI Takahiro <takahiro.akashi@linaro.org>");
+MODULE_DESCRIPTION("Pinctrl based GPIO driver");
+MODULE_LICENSE("GPL");
-- 
2.51.0


