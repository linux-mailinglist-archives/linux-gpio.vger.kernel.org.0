Return-Path: <linux-gpio+bounces-39728-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c0WTG/FhT2p2fgIAu9opvQ
	(envelope-from <linux-gpio+bounces-39728-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 10:55:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F72272E8A8
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 10:55:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=analog.com header.s=DKIM header.b=FwyYv5BA;
	dmarc=pass (policy=quarantine) header.from=analog.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39728-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39728-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D956730971EA
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 08:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A45274014A9;
	Thu,  9 Jul 2026 08:51:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B423FFFB8;
	Thu,  9 Jul 2026 08:51:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587067; cv=none; b=uSdcG7MkN41DFoqQrONGc8rrx8D6k2Y7LljEmsi68s7TukvlNtYdWMnUiHuHAr8CRV6ZB0m4iRn7TOl+wdKxaCR2R0g2ouFPqlcYl91eoAQniSWxi/yo+VbQFGEMN6RTxZqWLUT0z6f/5J4TarvtwpDAk+yI9kWY6EexY55sh9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587067; c=relaxed/simple;
	bh=RJpV7TdKEVn/X4ZDVZi4+0WvVsUR+xhJUsor4mZbVIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fMN9GOlodhU6VRJakCsWvoQS1E3jwhuzms9uWfVgby73DisTI+nbIMIC8oE29iSf2EeOR/KRtEIATcs+ogewbTyIgc3NW2f5S2PmcW3UDBaWBoyNrziZVx70dgqtFgPaBD4hNLxPAbdJH9RzN2Zqgw7UZ2bY3RqyNB/x8xKA5y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=FwyYv5BA; arc=none smtp.client-ip=148.163.135.77
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6697aXWu437246;
	Thu, 9 Jul 2026 04:50:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=zaJQa
	gw2Uvcv2k57hcJ+xsI0R/KwG/16fdfA/l3TVpI=; b=FwyYv5BAZLDsFu+fWWA9t
	y8AfgIANUUdxLqITUJh6YjSciHn7eeyKq0zLNtKU38T5R6tbOe8uUS07kzK3yTHB
	3iydmrNitUWXSmMr8OOyqOJLrQC8vqR1+Yn9KCTx9ojF4dEcFzhO7RBG6mc8xJ2K
	z3P/6KOu2gBcMkclQVWliA5AR2hyJHy/Va1eKHXG1ahQyF3Hus55LqyFXxiiJSfY
	fDO3uZjcaOUSeu/JKMmriEkDWiOSnXazM07u+kkl2/jHPUbM+lbIoZJTVb4yUwb9
	iUMuU82rgZuF/IJPOTB2TVqHuROTwxRI6BM3nWHcRhOoXgJGasAqnLViXLG2k0As
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fa42yhecr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 04:50:55 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6698oseu003607
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jul 2026 04:50:54 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 9 Jul 2026 04:50:53 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 9 Jul 2026 04:50:53 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 9 Jul 2026 04:50:53 -0400
Received: from HYB-e1y2fvUQ3cx.ad.analog.com (HYB-e1y2fvUQ3cx.ad.analog.com [10.44.3.70])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6698oLR1015849;
	Thu, 9 Jul 2026 04:50:45 -0400
From: Janani Sunil <janani.sunil@analog.com>
Date: Thu, 9 Jul 2026 10:50:16 +0200
Subject: [PATCH 5/6] gpio: ad7768: Add AD7768 GPIO auxiliary driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260709-ad7768-driver-v1-5-44e1194fd96a@analog.com>
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
In-Reply-To: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Michael Hennerich
	<Michael.Hennerich@analog.com>,
        Jonathan Cameron <jic23@kernel.org>,
        "David
 Lechner" <dlechner@baylibre.com>,
        Andy Shevchenko <andy@kernel.org>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux@analog.com>, <linux-iio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <jananisunil.dev@gmail.com>, Janani Sunil <janani.sunil@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783587021; l=7959;
 i=janani.sunil@analog.com; s=20260507; h=from:subject:message-id;
 bh=RJpV7TdKEVn/X4ZDVZi4+0WvVsUR+xhJUsor4mZbVIY=;
 b=GLrg9rBC+qx6NUhju0LiwhXBjF2TOy9QokWt7TkizhY0AEOdoewaG5vJp+RqU/PVSlSWeol1b
 8Uu+FQ5DpezBgE589Xn7pgypcNAapnbvybHOmhWYKTbCbHPGFy3e7Sq
X-Developer-Key: i=janani.sunil@analog.com; a=ed25519;
 pk=e25MyjRLPY3RWrYm/LrJ+/+t1MZJUbkgIW5CZg+g+hA=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=eKUjSnp1 c=1 sm=1 tr=0 ts=6a4f60ef cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8
 a=VwQbUJbxAAAA:8 a=8ZZp8Apl2tdtarh-5OgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX4m6qWJaPVB6G
 BbT9VYY5nS1boIip9YDtD6G4JS6Jvsdh3IZNkCyhHy996zw604e+Hvb9yVqNh6U5vpWVf+pTSmj
 ftjpTBCg0s7aRF/eWDjHqzflwkBuxjNUQKF0pxbc6a70br36473g
X-Proofpoint-GUID: QGXv1_6jaglYJksfyd680SORmDWAnvuw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX48ZNrdVHDD+u
 hyszBQy+QRrsnRnpzkGoqzs0Cz/LiGEiFNu/4QCXzYcG+uYX6bzUTUEPJ4jJPss5J5U2Zc2YHc7
 R77CFbKf9vJYyhHv+j72HNXJIoU87o3hQc1Qve5zVc1jAySBAFUPHzSiutVxRCWNRPHeTRaLro3
 U2yjDNiKntTgeX1oFGd3Qvmb+CCayqpNVKdDMiz3eRKfopQ9m9z7RxokQUoz1JSYVkffDb/6VSn
 JT/tUuamkEQXFAeUvPOL3MKk/f7YvkcihjAwIHhnXEFe2Lg9Vlr9jzWbymUv1Fd90P9nK3q/kiq
 NUFt84hAH3pcpL24630etN5VRUpRMLQBUhVo/ecJkJA08vvrPqwiOb7CpGpiyY4rglAwVQpwWQJ
 hBd3JPkeS/fevA8HaFBu0KCGcmG6SweGQoLNnwMkBTZE5enGt5Xfr+XV/GH0TmmLDvVpeBJgrRz
 XvGrcAC4nCO0HOoQ2zw==
X-Proofpoint-ORIG-GUID: QGXv1_6jaglYJksfyd680SORmDWAnvuw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39728-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nuno.sa@analog.com,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:olivier.moysan@foss.st.com,m:p.zabel@pengutronix.de,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jananisunil.dev@gmail.com,m:janani.sunil@analog.com,m:krzk@kernel.org,m:conor@kernel.org,m:jananisunildev@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[janani.sunil@analog.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[analog.com,vger.kernel.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:dkim,analog.com:mid,analog.com:from_mime,analog.com:url,analog.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[janani.sunil@analog.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[analog.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F72272E8A8

The AD7768/AD7768-4 ADC exposes 5 general-purpose I/O pins that can be
independently configured as inputs or outputs. Add an auxiliary bus driver
to expose these pins as a GPIO chip, registered by the parent IIO driver.

The driver uses the parent's regmap for register access and delegates
runtime power management to the parent device.

Signed-off-by: Janani Sunil <janani.sunil@analog.com>
---
 MAINTAINERS                |   1 +
 drivers/gpio/Kconfig       |  10 +++
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpio-ad7768.c | 208 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 220 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dc94e7803a7c..3de7ebcc4ee7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1639,6 +1639,7 @@ L:	linux-iio@vger.kernel.org
 S:	Supported
 W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/iio/adc/adi,ad7768.yaml
+F:	drivers/gpio/gpio-ad7768.c
 F:	drivers/iio/adc/ad7768.c
 
 ANALOG DEVICES INC AD7780 DRIVER
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 28cf6d2e83c2..12ebbdb16982 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1796,6 +1796,16 @@ endmenu
 menu "Auxiliary Bus GPIO drivers"
 	depends on AUXILIARY_BUS
 
+config GPIO_AD7768
+	tristate "Analog Devices AD7768 GPIO support"
+	depends on AD7768 && GPIOLIB
+	help
+	  Say yes here to expose the AD7768 utility pins as GPIOs when the
+	  device tree node is marked as a GPIO controller.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called gpio-ad7768.
+
 config GPIO_LTC4283
 	tristate "Analog Devices LTC4283 GPIO support"
 	depends on SENSORS_LTC4283
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 4d0e900402fc..d2921963efc7 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_GPIO_104_IDI_48)		+= gpio-104-idi-48.o
 obj-$(CONFIG_GPIO_104_IDIO_16)		+= gpio-104-idio-16.o
 obj-$(CONFIG_GPIO_74X164)		+= gpio-74x164.o
 obj-$(CONFIG_GPIO_74XX_MMIO)		+= gpio-74xx-mmio.o
+obj-$(CONFIG_GPIO_AD7768)		+= gpio-ad7768.o
 obj-$(CONFIG_GPIO_ADNP)			+= gpio-adnp.o
 obj-$(CONFIG_GPIO_ADP5520)		+= gpio-adp5520.o
 obj-$(CONFIG_GPIO_ADP5585)		+= gpio-adp5585.o
diff --git a/drivers/gpio/gpio-ad7768.c b/drivers/gpio/gpio-ad7768.c
new file mode 100644
index 000000000000..c2f01b1abd7c
--- /dev/null
+++ b/drivers/gpio/gpio-ad7768.c
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Analog Devices AD7768 GPIO auxiliary driver
+ *
+ * Copyright 2026 Analog Devices Inc.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#define AD7768_REG_GPIO_CONTROL		0x0E
+#define AD7768_REG_GPIO_WRITE		0x0F
+#define AD7768_REG_GPIO_READ		0x10
+
+#define AD7768_GPIO_UGPIO_ENABLE	BIT(7)
+#define AD7768_GPIO_INPUT		0x00
+#define AD7768_GPIO_OUTPUT(x)		BIT(x)
+
+#define AD7768_NUM_GPIOS		5
+
+struct ad7768_gpio_state {
+	struct device *parent;
+	struct regmap *regmap;
+	struct mutex lock; /* protects regmap accesses */
+	struct gpio_chip gc;
+};
+
+static int ad7768_gpio_direction_input(struct gpio_chip *chip,
+				       unsigned int offset)
+{
+	struct ad7768_gpio_state *st = gpiochip_get_data(chip);
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(st->parent, pm);
+	int ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(st->regmap, AD7768_REG_GPIO_CONTROL,
+				  BIT(offset), AD7768_GPIO_INPUT);
+}
+
+static int ad7768_gpio_get_direction(struct gpio_chip *chip,
+				     unsigned int offset)
+{
+	struct ad7768_gpio_state *st = gpiochip_get_data(chip);
+	unsigned int val;
+	int ret;
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(st->parent, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(st->regmap, AD7768_REG_GPIO_CONTROL, &val);
+	if (ret)
+		return ret;
+
+	return !!(val & BIT(offset)) ? GPIO_LINE_DIRECTION_OUT :
+				       GPIO_LINE_DIRECTION_IN;
+}
+
+static int ad7768_gpio_direction_output(struct gpio_chip *chip,
+					unsigned int offset, int value)
+{
+	struct ad7768_gpio_state *st = gpiochip_get_data(chip);
+	int ret;
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(st->parent, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&st->lock);
+
+	ret = regmap_update_bits(st->regmap, AD7768_REG_GPIO_CONTROL,
+				 BIT(offset), AD7768_GPIO_OUTPUT(offset));
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(st->regmap, AD7768_REG_GPIO_WRITE,
+				  BIT(offset), value << offset);
+}
+
+static int ad7768_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct ad7768_gpio_state *st = gpiochip_get_data(chip);
+	unsigned int val;
+	int ret;
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(st->parent, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&st->lock);
+
+	ret = regmap_read(st->regmap, AD7768_REG_GPIO_CONTROL, &val);
+	if (ret)
+		return ret;
+
+	if (val & BIT(offset))
+		ret = regmap_read(st->regmap, AD7768_REG_GPIO_WRITE, &val);
+	else
+		ret = regmap_read(st->regmap, AD7768_REG_GPIO_READ, &val);
+	if (ret)
+		return ret;
+
+	return !!(val & BIT(offset));
+}
+
+static int ad7768_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
+{
+	struct ad7768_gpio_state *st = gpiochip_get_data(chip);
+	unsigned int val;
+	int ret;
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(st->parent, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&st->lock);
+
+	ret = regmap_read(st->regmap, AD7768_REG_GPIO_CONTROL, &val);
+	if (ret)
+		return ret;
+
+	if (!(val & BIT(offset)))
+		return 0;
+
+	return regmap_update_bits(st->regmap, AD7768_REG_GPIO_WRITE,
+				  BIT(offset), value << offset);
+}
+
+static int ad7768_gpio_probe(struct auxiliary_device *adev,
+			     const struct auxiliary_device_id *id)
+{
+	struct device *dev = &adev->dev;
+	const char *label = dev_get_platdata(dev);
+	struct ad7768_gpio_state *st;
+	struct gpio_chip *gc;
+	int ret;
+
+	st = devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
+	if (!st)
+		return -ENOMEM;
+
+	st->parent = dev->parent;
+	st->regmap = dev_get_regmap(dev->parent, NULL);
+
+	ret = devm_mutex_init(dev, &st->lock);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(st->parent);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_update_bits(st->regmap, AD7768_REG_GPIO_CONTROL,
+				 AD7768_GPIO_UGPIO_ENABLE,
+				 AD7768_GPIO_UGPIO_ENABLE);
+
+	pm_runtime_mark_last_busy(st->parent);
+	pm_runtime_put_autosuspend(st->parent);
+
+	if (ret < 0)
+		return ret;
+
+	gc = &st->gc;
+	gc->label = label;
+	gc->base = -1;
+	gc->ngpio = AD7768_NUM_GPIOS;
+	gc->parent = dev;
+	gc->owner = THIS_MODULE;
+	gc->can_sleep = true;
+	gc->get_direction = ad7768_gpio_get_direction;
+	gc->direction_input = ad7768_gpio_direction_input;
+	gc->direction_output = ad7768_gpio_direction_output;
+	gc->get = ad7768_gpio_get;
+	gc->set = ad7768_gpio_set;
+
+	return devm_gpiochip_add_data(dev, &st->gc, st);
+}
+
+static const struct auxiliary_device_id ad7768_gpio_ids[] = {
+	{ .name = "ad7768.gpio" },
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, ad7768_gpio_ids);
+
+static struct auxiliary_driver ad7768_gpio_driver = {
+	.probe = ad7768_gpio_probe,
+	.id_table = ad7768_gpio_ids,
+};
+module_auxiliary_driver(ad7768_gpio_driver);
+
+MODULE_AUTHOR("Janani Sunil <janani.sunil@analog.com>");
+MODULE_DESCRIPTION("Analog Devices AD7768 GPIO auxiliary driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0


