Return-Path: <linux-gpio+bounces-38392-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CyKTM4qNLGovSgQAu9opvQ
	(envelope-from <linux-gpio+bounces-38392-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 00:51:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 680BE67CEA8
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 00:51:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CwPPTQNd;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38392-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38392-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0EE532F294B
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 22:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 798E73D6463;
	Fri, 12 Jun 2026 22:47:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8B83D6491
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 22:47:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781304429; cv=none; b=YLSw3cUb28Zwi8W1TFrOYsEzUd+Jcs3sdBOtMvHPhp7BTkwuxCauVq+2lQbPQuo1XV9irM3mSizVweLfnCVGf/0M71LGMoPfhCPsYpr6lI1xrCZ+jDtfF51SImdL8RWmoQZMXv849mbBn3Dz2Cs6FqY9COh5qcelhUALrd72u8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781304429; c=relaxed/simple;
	bh=oHvglOPKruBb8v3/CxYpF7DzHgE+dGuZHbuEgkrWZec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UqdcX2TVmL/cMX+Mbtpt8dm/j7fycHGjDSupHOsp3vC08qWbYZUT8kv7qFL94BIZO+evEDEoZsP83x6sKqE60HGh7maNzxFYyxMtwYX33EpSSuOl72SMaa9fPr6ysxr+SfElBQG7ZZB+oxkkveJF5vjF6Z/mRRFfeNrHEWNmitY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwPPTQNd; arc=none smtp.client-ip=209.85.221.178
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-59ccf81e6feso571782e0c.2
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 15:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781304426; x=1781909226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YITfAxfZQwR/2oWmKY203s9He7EuuMhN0Pj6HZ/jvn0=;
        b=CwPPTQNdItyZ1cVtfBz2Y1i39K4u/pd22tEimHd79W8Wnd3uEYcUxYiSDmK9zmyJC3
         5siqBQDK59wIiYn4EMyH7OFqzCjIvj9nLdZLOdAuO8vRt+TxiWPaDnrxI9LQ9RJfZpij
         vTjYXHVcbgbfOpj+T6KAxb9Y811BUoyAUaMu3qOOXQIM2kZAfGMWCx4NFXj0UtuA5ftV
         qrEGf6V9jjIVjfgQZwEB1gro8KwV/EY1zJfetqjUxSBoMqk8JA2WfgZev/ZnIMQCWFDq
         aJImtz1q/q4hoaSq8PILgrZDbpsYi8UELa6y8IpJ10Y+TpRgz5Dpva5YoFTPi6cfSJDg
         BJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781304426; x=1781909226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YITfAxfZQwR/2oWmKY203s9He7EuuMhN0Pj6HZ/jvn0=;
        b=SZGFIREtTnqOljW5PkdWj4Pow5J8ixz197FGG/qejMJTkJnyB8cuekklmSHaQm7KXY
         AbVbgXXU/Hje/5oYXWHoidQQPesvZ46jGAJHtE0KSiH0kZkx1si3qaGF7/ROfEP8eqm6
         B0B0qpjjmdQjj+gn8lzX9pXBqUe/BXw+37wup4c6p0HwX0W4nyGat5VdpgjUinMgKH78
         6p6DmcnzQF34OCIeq0CRm/iQdbrg7gVmzPdSNtAh0VBTN/AtATecGjTipNryhaKlobb0
         piXDanO38t5Plw7jYkQKfV5iBWWDLXS+/zYNEPFmV8WobGUD9mK+HbZR6CEN6FjcfokS
         UKyg==
X-Forwarded-Encrypted: i=1; AFNElJ+/+kM6z+8EOCTaYX9I/+0gOvXo5CMYQuWhK46kEFbPsVmMYGaatxz85yg4igC4kQtAUYbxXf4ldx9E@vger.kernel.org
X-Gm-Message-State: AOJu0YzEf7p3QU3+guWRD3Ugy7HTFGV8W8f+ZPVMlTOnp7XrXgPhgz3I
	hPSolwJTsOkxgURx/uqrR1Bgiw0SSDVWhJYuF1rS0UhCXQva+uDBPY55
X-Gm-Gg: Acq92OGzDBXYWyWLWg0H4AOsYo++RBDwbjFBLbNvdeWzVfUFBzPuQC8BfVQE2fCJeA/
	hIvH65uTD8v57Tj3DCydzCUXbhyiryCYVFQXI6eJp8wvTh5+vTSkr4/9+GGMKQGdAXvWGwRzU5W
	PPSeoH6E3BsA9HZNLCUy9ejG3x0x9iPhnGBIMv558F4iIQivg+Mfz1Xhrats7brtTEcsLPj0wKf
	xJ5HnTYe1Jhgf6ZXeYruyDtAsYJj411ViswTK/KoOwOwij3GyRDdKbizHZIZGG/S6SF8L87y+wg
	tCmbNdX0GIQAFKZ2bCSWbXLjUUQXV9UTn1FTaEtulAY4tq7TFlV6qrTrVXN+peNDeLikHyVgaGR
	JbKZWVolVaEQy5b0eDQmwFfqHVa2B8rvVcAuRFCH3GLHlx4jWEgwuXe4YWfl75EzySwAjw1nyuv
	JcwTpIlKwVb1VL+ly69zfGSw==
X-Received: by 2002:a05:6122:169a:b0:5a4:5605:c681 with SMTP id 71dfb90a1353d-5bb6bdadafdmr3420952e0c.0.1781304426357;
        Fri, 12 Jun 2026 15:47:06 -0700 (PDT)
Received: from [192.168.100.6] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb691fd8adsm4244553e0c.13.2026.06.12.15.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 15:47:06 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Fri, 12 Jun 2026 17:46:21 -0500
Subject: [PATCH 3/5] iio: adc: ti-ads1262: Add GPIO controller support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-ads126x-v1-3-894c788d03ed@gmail.com>
References: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
In-Reply-To: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5460; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=oHvglOPKruBb8v3/CxYpF7DzHgE+dGuZHbuEgkrWZec=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDFk6PUmZU5d+C1WMOdvLfHn7XZ+Hh62W9MvdNyuSW9TWH
 RC0Mamjo5SFQYyLQVZMkaU9YdG3R1F5b/0OhN6HmcPKBDKEgYtTACYiksLwT9+I6by7ofbspjNO
 x3O19lVvlo7cKKvg/Xtf+8bq73xSOowMU7xLOl98LvzKduDQe5EI6V1a1oGRe14t2iXZy8vyu7i
 XFQA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38392-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:kuurtb@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kuurtb@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuurtb@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 680BE67CEA8

Add support for the GPIO controller capability found in both TI ADS1262
and ADS1263 ADCs.

Eight analog input pins can be programmed as GPIO. This configuration
does not prevent the pins from being used as analog inputs at the same
time, so no considerations were taken in that regard.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/adc/ti-ads1262.c | 149 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
index fd1911cf65ac..6d5f22836ad8 100644
--- a/drivers/iio/adc/ti-ads1262.c
+++ b/drivers/iio/adc/ti-ads1262.c
@@ -17,6 +17,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/lockdep.h>
 #include <linux/math.h>
@@ -314,6 +315,10 @@ static const int ads1262_pga_gain_avail[] = {
 	1, 2, 4, 8, 16, 32
 };
 
+static const char * const ads1262_gpio_names[] = {
+	"AIN3", "AIN4", "AIN5", "AIN6", "AIN7", "AIN8", "AIN9", "AINCOM"
+};
+
 static int ads1262_dev_power_on(struct ads1262 *st)
 {
 	int ret;
@@ -1050,6 +1055,146 @@ static irqreturn_t ads1262_trigger_handler(int irq, void *p)
 	return IRQ_HANDLED;
 }
 
+static int ads1262_gpiochip_request(struct gpio_chip *gc, unsigned int offset)
+{
+	struct ads1262 *st = gpiochip_get_data(gc);
+	struct device *dev = &st->spi->dev;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(st->regmap, ADS1262_GPIOCON_REG,
+				  BIT(offset), BIT(offset));
+}
+
+static void ads1262_gpiochip_free(struct gpio_chip *gc, unsigned int offset)
+{
+	struct ads1262 *st = gpiochip_get_data(gc);
+	struct device *dev = &st->spi->dev;
+
+	regmap_update_bits(st->regmap, ADS1262_GPIOCON_REG, BIT(offset), 0);
+	pm_runtime_put_autosuspend(dev);
+}
+
+static int ads1262_gpiochip_get_direction(struct gpio_chip *gc,
+					  unsigned int offset)
+{
+	struct ads1262 *st = gpiochip_get_data(gc);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(st->regmap, ADS1262_GPIODIR_REG, &val);
+	if (ret)
+		return ret;
+
+	return val & BIT(offset);
+}
+
+static int ads1262_gpiochip_direction_input(struct gpio_chip *gc,
+					    unsigned int offset)
+{
+	struct ads1262 *st = gpiochip_get_data(gc);
+
+	return regmap_update_bits(st->regmap, ADS1262_GPIODIR_REG,
+				  BIT(offset), 1);
+}
+
+static int ads1262_gpiochip_direction_output(struct gpio_chip *gc,
+					     unsigned int offset, int value)
+{
+	struct ads1262 *st = gpiochip_get_data(gc);
+	int ret;
+
+	ret = regmap_update_bits(st->regmap, ADS1262_GPIODIR_REG,
+				 BIT(offset), 0);
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(st->regmap, ADS1262_GPIODAT_REG,
+				  BIT(offset), value ? BIT(offset) : 0);
+}
+
+static int ads1262_gpiochip_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct ads1262 *st = gpiochip_get_data(gc);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(st->regmap, ADS1262_GPIODAT_REG, &val);
+	if (ret)
+		return ret;
+
+	return val & BIT(offset);
+}
+
+static int ads1262_gpiochip_get_multiple(struct gpio_chip *gc,
+					 unsigned long *mask,
+					 unsigned long *bits)
+{
+	struct ads1262 *st = gpiochip_get_data(gc);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(st->regmap, ADS1262_GPIODAT_REG, &val);
+	if (ret)
+		return ret;
+
+	return val & *mask;
+}
+
+static int ads1262_gpiochip_set(struct gpio_chip *gc, unsigned int offset,
+				int value)
+{
+	struct ads1262 *st = gpiochip_get_data(gc);
+
+	return regmap_update_bits(st->regmap, ADS1262_GPIODAT_REG,
+				  BIT(offset), value ? BIT(offset) : 0);
+}
+
+static int ads1262_gpiochip_set_multiple(struct gpio_chip *gc,
+					 unsigned long *mask,
+					 unsigned long *bits)
+{
+	struct ads1262 *st = gpiochip_get_data(gc);
+
+	return regmap_update_bits(st->regmap, ADS1262_GPIODAT_REG, *mask,
+				  *bits);
+}
+
+static int ads1262_gpiochip_setup(struct ads1262 *st, const char *name)
+{
+	struct device *dev = &st->spi->dev;
+	struct gpio_chip *gc;
+
+	if (!device_property_present(dev, "gpio-controller"))
+		return 0;
+
+	gc = devm_kzalloc(dev, sizeof(*gc), GFP_KERNEL);
+	if (!gc)
+		return -ENOMEM;
+
+	gc->owner = THIS_MODULE;
+	gc->label = name;
+	gc->base = -1;
+	gc->ngpio = ARRAY_SIZE(ads1262_gpio_names);
+	gc->parent = dev;
+	gc->can_sleep = true;
+	gc->request = ads1262_gpiochip_request;
+	gc->free = ads1262_gpiochip_free;
+	gc->get_direction = ads1262_gpiochip_get_direction;
+	gc->direction_input = ads1262_gpiochip_direction_input;
+	gc->direction_output = ads1262_gpiochip_direction_output;
+	gc->get = ads1262_gpiochip_get;
+	gc->get_multiple = ads1262_gpiochip_get_multiple;
+	gc->set = ads1262_gpiochip_set;
+	gc->set_multiple = ads1262_gpiochip_set_multiple;
+	gc->names = ads1262_gpio_names;
+
+	return devm_gpiochip_add_data(dev, gc, st);
+}
+
 static int ads1262_parse_channel_data(struct ads1262 *st,
 				      struct ads1262_channel *chan_data,
 				      struct fwnode_handle *node)
@@ -1750,6 +1895,10 @@ static int ads1262_spi_probe(struct spi_device *spi)
 	if (ret)
 		return ret;
 
+	ret = ads1262_gpiochip_setup(st, name);
+	if (ret)
+		return ret;
+
 	return devm_iio_device_register(dev, indio_dev);
 }
 

-- 
2.54.0


