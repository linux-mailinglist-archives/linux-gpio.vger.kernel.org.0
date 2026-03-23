Return-Path: <linux-gpio+bounces-34054-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHJoN+qUwWnuTwQAu9opvQ
	(envelope-from <linux-gpio+bounces-34054-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 20:30:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE092FC4C5
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 20:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21EC231B31D5
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 19:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931B1318ED7;
	Mon, 23 Mar 2026 19:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fV+Y5bfb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CE631F983
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 19:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292513; cv=none; b=pXgFjOSLBWpqAcz1jR8dbC5w9DgCfxQY9kvTecRLMi9f7s1/rEmbMbg5nb7NOm4BQh+sjxTNIy6eoglJw29ERkulO2l0co7jE/jbFvkr3co7SfCMMaAczcZs97X2aJZrqDzTofBwlK1YVY5MfDAgpL2bUN0WDr5qdIx6FCiHgCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292513; c=relaxed/simple;
	bh=78h6zo0OmGYwoE9jXpMgQ5eL1Q+6zRrrpxk2B2OYgvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZAQN1C7CsbniCJioFxLEJGAsVNA2SHAVi5wWMfahJ9eg7MjoDMOjVsQ7enzs2NHzm85cA+Gsz+5JNiOWg3/npi03J2XEu/p4LhtVgghcitXJdo8QW6qPpQPuDFr8NwCOuQcU6QwV7AZ/IH0sYGJCa6UCy57Ctz3AcBNGpv+aGAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fV+Y5bfb; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486b9675d36so37229405e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 12:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774292510; x=1774897310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YC5M6Gei+tjtXgncpnAEt2N0RrhP9pRpNjEcwCa4CLI=;
        b=fV+Y5bfblPjFkJ961WGi0rUyIyBKwC4HabC7T8ODnCTisgWLZKLfIEcuhxk9PP2iD4
         E0Nbm1ZHzp0x2k4iTapeaSq1EBriOO3szTVBDTVUR6VGWR9MSBnz6717zcg6JkaT4frF
         Qrr7/r59jZyiVtT4bwlzMtkGGy7LuA/hcvvLJw6WbcZ18x3H6Xi9ZILPb85HBoo24VCb
         NC2M1Ms3INzq7HOyWWWN0CwrnjwpmYFwY5ZIyZbP7TmrjGSaM6BhXa+IW+ZQ//Ib/ND9
         HO0FjoZqRaFPDGnNXljzh879UgJQAHKLTq/kMR2ert05tD1AT1w0GCrGioMb9/CNVlye
         aFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774292510; x=1774897310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YC5M6Gei+tjtXgncpnAEt2N0RrhP9pRpNjEcwCa4CLI=;
        b=pkylZxbYYe/Wd4V5SCyn/RJ9e6ej9eOS00LMCXs4/lf+9Pgo04SM3QL9k8fm6vwMYO
         O6KVv3i4VV0pBkI6FE8R93yeHGsIDvvfzY3tidLkQyE4D3hMrwE+leHmyPcx8gOkZdSF
         sZGJBK5IBK8YQnSyTjQRkTNzf6El+8KTsWOyhoKs8o4VF8eUZOI6oedAoJi1ndZJR5C3
         3Z8WcE8IeFK2lry13EtJ7yAOYVZCOLDbCs8E/nSyNyTvV40mfNiWEBzbE8dEHhoWv7/q
         QVwzY4DXyrAkrIXM3pigyY3muNCVz8EKQobnjf6CZHYQ1qyqGSE7ATM1miMsKPIRndEZ
         Q1aw==
X-Forwarded-Encrypted: i=1; AJvYcCX1iFbGRiHS/9B8wWFvjFhsv0ABjE4hj4X5SKwkGf9vSJerTGV2quyfFpJLsH2dYk+h9/nJrv/8cHuR@vger.kernel.org
X-Gm-Message-State: AOJu0YwBzKJwH6bYNVOJ2LFAR9M6+IiqunFUsPmKlhnVQgavnnZ0U/NQ
	nFu/Fl1JbuhQ9R4oMN2kYhQA3766EFsfHOv6UaZlXYPzFPfatZvrci0R0VKWPlE31xk=
X-Gm-Gg: ATEYQzxpP+RQf0zn6UDdcVSSu/pL+QmY89LV6kWeFVTviINkBPGsMI034uxxrjNVDiF
	Cq9TwzFGZOKSl8dNoj1WeH8WPtt+xTNcHt6mYn0D1VXuz+V4ecqi0T/qaMCirEkNqAapDtFfkGd
	vlI1ePgmLid+u9JfdMcKxbldekhOOlZIK3t8k93dVYpaYoxuRA3734jBCXNclZ1waiCGcKrLCZL
	OYdZRwL+Q1dW5TNQ59sjupMzvR8g/6NffOeIDoze9xGYu1gR9rSscvh6aH2pd3zP7jTgKwevNjo
	SIbk+aQtI66A1hcomeO7CfwxLVxswC6IaJ/rhcZQCBYEC6TOXvN5Jfsq4B2qiScvA+aYILQQfWk
	tNZgk77e3gDddQneBhgkMbjLJ7TYyY7a+aXzCa2rWxne9C1y1SPsoBrzzkKmfaoNMxHOJZslQ/U
	UQPdiQC0iK4YZcNWELzTugT0kFj2w+
X-Received: by 2002:a05:6000:2486:b0:43b:4951:6479 with SMTP id ffacd0b85a97d-43b642800a7mr20717468f8f.37.1774292510222;
        Mon, 23 Mar 2026 12:01:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bdaf8sm36940550f8f.13.2026.03.23.12.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:01:49 -0700 (PDT)
Date: Mon, 23 Mar 2026 22:01:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v6 7/7] gpio: gpio-by-pinctrl: add pinctrl based generic GPIO
 driver
Message-ID: <edd789f8fc87f294211adf84b09c2af9f4aa6a6f.1774283146.git.dan.carpenter@linaro.org>
References: <cover.1774283146.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774283146.git.dan.carpenter@linaro.org>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34054-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 6EE092FC4C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: AKASHI Takahiro <takahiro.akashi@linaro.org>

The ARM SCMI pinctrl protocol allows GPIO access.  Instead of creating
a new SCMI GPIO driver, this driver is a generic GPIO driver that uses
standard pinctrl interfaces.

Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
v6: Use pinconf_to_config_packed() instead of PIN_CONF_PACKED()
v5: Clean up based on Andy's feedback:
    Update Kconfig entry
    Update Copyright date
    Fix includes
    Get rid of unused private data
    Simplify pin_control_gpio_get_direction()
v4: Add r-b tags
v3: Forward port and update
---
 drivers/gpio/Kconfig           |  13 +++++
 drivers/gpio/Makefile          |   1 +
 drivers/gpio/gpio-by-pinctrl.c | 101 +++++++++++++++++++++++++++++++++
 3 files changed, 115 insertions(+)
 create mode 100644 drivers/gpio/gpio-by-pinctrl.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b45fb799e36c..c631ecb01e07 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -246,6 +246,19 @@ config GPIO_BRCMSTB
 	help
 	  Say yes here to enable GPIO support for Broadcom STB (BCM7XXX) SoCs.
 
+config GPIO_BY_PINCTRL
+	tristate "GPIO support based on a pure pin control backend"
+	depends on GPIOLIB
+	help
+	  Support for generic GPIO handling based on top of pin control.
+	  Traditionally, firmware creates a GPIO interface or a pin
+	  controller interface and we have a driver to support it.  But
+	  in SCMI, the pin control interface is generic and we can
+	  create a simple GPIO device based on the pin control interface
+	  without doing anything custom.
+
+	  This driver used to do GPIO over the ARM SCMI protocol.
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
index 000000000000..ddfdc479d38a
--- /dev/null
+++ b/drivers/gpio/gpio-by-pinctrl.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (C) 2026 Linaro Inc.
+//   Author: AKASHI takahiro <takahiro.akashi@linaro.org>
+
+#include <linux/errno.h>
+#include <linux/gpio/driver.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+#include "gpiolib.h"
+
+static int pin_control_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	unsigned long config;
+	int ret;
+
+	config = PIN_CONFIG_OUTPUT_ENABLE;
+	ret = pinctrl_gpio_get_config(gc, offset, &config);
+	if (ret)
+		return ret;
+	if (config)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
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
+				int val)
+{
+	unsigned long config;
+
+	config = pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);
+	return pinctrl_gpio_set_config(chip, offset, config);
+}
+
+static int pin_control_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_chip *chip;
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
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
+	return devm_gpiochip_add_data(dev, chip, NULL);
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
2.53.0


