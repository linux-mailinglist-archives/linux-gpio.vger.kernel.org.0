Return-Path: <linux-gpio+bounces-39727-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pxd8EfllT2rifwIAu9opvQ
	(envelope-from <linux-gpio+bounces-39727-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 11:12:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E031E72EBFE
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 11:12:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=analog.com header.s=DKIM header.b=A7Q1Ksl+;
	dmarc=pass (policy=quarantine) header.from=analog.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39727-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39727-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 06B5830516FC
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 08:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021D1400DF6;
	Thu,  9 Jul 2026 08:51:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207BF3F0746;
	Thu,  9 Jul 2026 08:51:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587065; cv=none; b=q/g4U0ggN9JXvkCpYFALpw86xbdYj5Rx9Wd0Mpu3Nz4jQtuh37shkhdrFCdL33SOc86YGsmS0fhmOqL4nFDuud4H2Mo5Uvxe5VY8KRLlNRyFFmjmVH2pBjxa5Tb+Qe+lvXAXyipllAt/GLDQC/g8pp7piY0iBQKkdX9FQ3iwe7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587065; c=relaxed/simple;
	bh=srdDj+8aAp8EUZbwVOizmwqcewyinqCSy+K5PvgKx6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=kvK2b84LVPBfPdyjh7yYffElBZcZlJnpD++Z9KPObdAmi3Qt2+EsgqiWPWYWCJhU5rJ7OlMJGIZFQMP22s0NHxp1FtoWM57urb4APmF2yCRGJ4Xk7HH2ak2tSEaVkkLsQxAI42gp62ejrSKkgTjzvWTljxDIpcjfbrS8v8U7ZbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=A7Q1Ksl+; arc=none smtp.client-ip=148.163.135.77
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6697qH6E413660;
	Thu, 9 Jul 2026 04:50:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=SZhOR
	DrHb2kuBirWcQQ45ymsQeYPzuGZXY/ZOPFPzbs=; b=A7Q1Ksl+xxYSUUPlj2LLj
	z8UkGIauiU28Wvo4I9xhDOoKdeB9h0yc/XwETOjP0QxmlSVJR8uHepuQ3Fph3H+6
	DwwARahFbdUwLl1pzmwZv7hFFCbeKmGc+VeJfiudHX4k9v1C02lcj/db+lu0ZF/I
	pWsQOjVk1hNexAl6ZN0025zCd1j+578e7XXyzBpbk4Q+iiiQXg9rGZPkeBGMe6lQ
	mH4Cd1jw2ncb6Ox4f5eAD6aaTZ/ek3JOysR00f5HSMB4QXwwnN8EfNZ9FHCA4T25
	Gf3Y6kAYXC/aaJuMjhk7ExEzp+wKfuqUBsuWpnP/uRD2n72rrGtnUcZIQmyimCcB
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fa7mug6j8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 04:50:51 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6698oni1003601
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jul 2026 04:50:49 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Thu, 9 Jul
 2026 04:50:49 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 9 Jul 2026 04:50:49 -0400
Received: from HYB-e1y2fvUQ3cx.ad.analog.com (HYB-e1y2fvUQ3cx.ad.analog.com [10.44.3.70])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6698oLR0015849;
	Thu, 9 Jul 2026 04:50:42 -0400
From: Janani Sunil <janani.sunil@analog.com>
Date: Thu, 9 Jul 2026 10:50:15 +0200
Subject: [PATCH 4/6] iio: adc: Add AD7768 IIO Driver support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260709-ad7768-driver-v1-4-44e1194fd96a@analog.com>
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
In-Reply-To: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Michael Hennerich
	<Michael.Hennerich@analog.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David
 Lechner <dlechner@baylibre.com>,
        Andy Shevchenko <andy@kernel.org>, Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783587021; l=39245;
 i=janani.sunil@analog.com; s=20260507; h=from:subject:message-id;
 bh=srdDj+8aAp8EUZbwVOizmwqcewyinqCSy+K5PvgKx6U=;
 b=jlKn+BU3R/ZbVQNm50XUWqCRRmMUJOHgRR6w1j7wXCp2f/YXP7hQ/uuVyAxfB1a92HGBXP2W6
 PhplnA/dTisBaKx+87fD6vIwyUmXOwee/KVLlA0hYvW1aU6ekgx1QBd
X-Developer-Key: i=janani.sunil@analog.com; a=ed25519;
 pk=e25MyjRLPY3RWrYm/LrJ+/+t1MZJUbkgIW5CZg+g+hA=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: BCjzdxB3X5oQwebNI9bveoEI22zkcz8L
X-Authority-Analysis: v=2.4 cv=Bv6tB4X5 c=1 sm=1 tr=0 ts=6a4f60eb cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=gAnH3GRIAAAA:8
 a=VwQbUJbxAAAA:8 a=_a_VzHAsdQ2u_NTcx1IA:9 a=QEXdDO2ut3YA:10
 a=br55WurUj89AL1qEz8Q6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX/vWXsETML7ir
 VHTpGrTgqq418hW3y8MK1iBWcPbMPY0iB4jDCs3rcYqAB+4paFUx6d0Ah07C3hxVVzBloSKa32V
 AB9oDr15rjBvV6VD3Z6ctRRSEyYT9vFmte31ce1MqQKr25dPezSvDG/k51+hmxwDdieuARutL/c
 i4fB9D5teAqgVwUg/opi9X7h9x8Ig1WMtXSGgDeoaBvRA1Mry8Vw+nbl8HbzCiVhHZFgNgB5lPZ
 7bcTFyxDaHfsBGKP82tlVy0fzSvmfsmesQwxiXlQsmh4QOEI6t5lo9ojXuE52w89bfO3340fIsq
 /qyds5BpJVBfp7Gv2R/DbnUqvRyok0C8wAtZg33xtQV23496KgWY9Wce+ZH1ZQq4+CLIgX5rFvg
 uY3E9IA6EMtKeAiOZ/imvU6eK5c7ilgafxoQsUHnGWCZI+2ElnoZnc/3X1BFe08+uSEMS+colRL
 HLIXNOyGfFRwcdXAwrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX0rR+2gfTzgWt
 2csMcP+PJpjmHsMYdIHhHYYGtwufh/3mz6fQKSWcNzh9qNBaUlK19WtUOrcSwYFZxkeGtNNji6m
 3DnAjApSTDK4o0gZvSl2NKFl+Esr5l8Q5E56dhHrqCLYCKrmsjBp
X-Proofpoint-ORIG-GUID: BCjzdxB3X5oQwebNI9bveoEI22zkcz8L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39727-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nuno.sa@analog.com,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:olivier.moysan@foss.st.com,m:p.zabel@pengutronix.de,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jananisunil.dev@gmail.com,m:janani.sunil@analog.com,m:krzk@kernel.org,m:conor@kernel.org,m:jananisunildev@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[janani.sunil@analog.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[analog.com,vger.kernel.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,analog.com:dkim,analog.com:mid,analog.com:from_mime,analog.com:url,analog.com:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E031E72EBFE

Add support for AD7768 4/8 channel,simultaneous sampling Sigma-Delta
ADC, supporting configurable power modes, decimation filters and data
output lines

Signed-off-by: Janani Sunil <janani.sunil@analog.com>
---
 MAINTAINERS              |    1 +
 drivers/iio/adc/Kconfig  |   16 +
 drivers/iio/adc/Makefile |    1 +
 drivers/iio/adc/ad7768.c | 1291 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 1309 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d667a0411f28..dc94e7803a7c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1639,6 +1639,7 @@ L:	linux-iio@vger.kernel.org
 S:	Supported
 W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/iio/adc/adi,ad7768.yaml
+F:	drivers/iio/adc/ad7768.c
 
 ANALOG DEVICES INC AD7780 DRIVER
 M:	Michael Hennerich <Michael.Hennerich@analog.com>
diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index d1b198cb8a80..1325cdbedea4 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -429,6 +429,22 @@ config AD7766
 	  To compile this driver as a module, choose M here: the module will be
 	  called ad7766.
 
+config AD7768
+	tristate "Analog Devices AD7768/AD7768-4 ADC driver"
+	depends on SPI
+	depends on REGULATOR || COMPILE_TEST
+	select AUXILIARY_BUS
+	select IIO_BUFFER
+	select IIO_BACKEND
+	select REGMAP
+	help
+	  Say yes here to build support for Analog Devices AD7768 and AD7768-4
+	  SPI analog to digital converters.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called ad7768.
+
+
 config AD7768_1
 	tristate "Analog Devices AD7768-1 ADC driver"
 	depends on SPI
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index 0f90b75577ff..3e896c8aa7c3 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_AD7606_IFACE_SPI) += ad7606_spi.o
 obj-$(CONFIG_AD7606) += ad7606.o
 obj-$(CONFIG_AD7625) += ad7625.o
 obj-$(CONFIG_AD7766) += ad7766.o
+obj-$(CONFIG_AD7768) += ad7768.o
 obj-$(CONFIG_AD7768_1) += ad7768-1.o
 obj-$(CONFIG_AD7779) += ad7779.o
 obj-$(CONFIG_AD7780) += ad7780.o
diff --git a/drivers/iio/adc/ad7768.c b/drivers/iio/adc/ad7768.c
new file mode 100644
index 000000000000..f76a7081090e
--- /dev/null
+++ b/drivers/iio/adc/ad7768.c
@@ -0,0 +1,1291 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Analog Devices AD7768 ADC driver
+ *
+ * Copyright 2018-2026 Analog Devices Inc.
+ */
+
+#include <linux/array_size.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/math.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+#include <linux/spi/spi.h>
+#include <linux/types.h>
+
+#include <linux/iio/backend.h>
+#include <linux/iio/iio.h>
+#include <linux/iio/types.h>
+
+#define AD7768_AUX_DEV_GPIO_NAME	"gpio"
+#define AD7768_REG_GPIO_CONTROL		0x0E
+
+/* AD7768 registers definition */
+#define AD7768_REG_CH_STANDBY			0x00
+#define AD7768_REG_CH_MODE(x)			(0x01 + (x))
+#define AD7768_REG_CH_MODE_SEL			0x03
+#define AD7768_REG_POWER_MODE			0x04
+#define AD7768_REG_GENERAL_CONFIG		0x05
+#define AD7768_REG_DATA_CONTROL			0x06
+#define AD7768_REG_INTERFACE_CFG		0x07
+#define AD7768_REG_REV_ID			0x0A
+#define AD7768_REG_PRECHARGE_BUF1		0x11
+#define AD7768_REG_PRECHARGE_BUF2		0x12
+#define AD7768_REG_REFP_BUF			0x13
+#define AD7768_REG_REFN_BUF			0x14
+#define AD7768_REG_OFFSET_BASE			0x1E
+#define AD7768_REG_GAIN_BASE			0x36
+#define AD7768_REG_PHASE_BASE			0x4E
+#define AD7768_REG_OFFSET(ch)			((AD7768_REG_OFFSET_BASE + (3 * (ch))))
+#define AD7768_REG_GAIN(ch)			((AD7768_REG_GAIN_BASE + (3 * (ch))))
+#define AD7768_REG_PHASE(ch)			((AD7768_REG_PHASE_BASE + (ch)))
+#define __AD7768_4_REG_MAP(ch)		((ch) < 2 ? (ch) : ((ch) + 2))
+#define AD7768_4_REG_OFFSET(ch) \
+	(AD7768_REG_OFFSET_BASE + (3 * __AD7768_4_REG_MAP(ch)))
+#define AD7768_4_REG_GAIN(ch) \
+	(AD7768_REG_GAIN_BASE + (3 * __AD7768_4_REG_MAP(ch)))
+#define AD7768_4_REG_PHASE(ch)		(AD7768_REG_PHASE_BASE + __AD7768_4_REG_MAP(ch))
+#define AD7768_REG_DIAGNOSTIC_RX		0x56
+#define AD7768_REG_DIAGNOSTIC_MUX_CTRL		0x57
+#define AD7768_REG_MODULATOR_DELAY_CTRL		0x58
+#define AD7768_REG_CHOP_CTRL			0x59
+
+/* AD7768_REG_CH_MODE */
+#define   AD7768_CH_MODE_FILTER_TYPE_MSK	BIT(3)
+#define   AD7768_CH_MODE_FILTER_TYPE_MODE(x)	(((x) & 0x1) << 3)
+#define   AD7768_CH_MODE_GET_FILTER_TYPE(x)	(((x) >> 3) & 0x1)
+#define   AD7768_CH_MODE_DEC_RATE_MSK		GENMASK(2, 0)
+#define   AD7768_CH_MODE_DEC_RATE_MODE(x)	(((x) & 0x7) << 0)
+
+/* AD7768_REG_CH_MODE_SEL */
+#define   AD7768_CH_MODE_READ_MSK		GENMASK(7, 0)
+#define   AD7768_CH_MODE_READ_MODE(x)		((x) & 0xFF)
+#define   AD7768_CH_MODE_READ_GET(x)		((x) & 0xFF)
+#define   AD7768_CH_MODE_SEL_8CH(ch)		BIT(ch)
+#define   AD7768_CH_MODE_READ_CHN(n)		BIT(n)
+#define   AD7768_GET_CH_MODE_8CH(ch, x)		(!!((x) & BIT(ch)))
+
+/* AD7768_REG_POWER_MODE */
+#define   AD7768_SLEEP_MODE_MSK			BIT(7)
+#define   AD7768_POWER_MODE_POWER_MODE_MSK	GENMASK(5, 4)
+#define   AD7768_POWER_MODE_POWER_MODE(x)	(((x) & 0x3) << 4)
+#define   AD7768_POWER_MODE_GET_POWER_MODE(x)	(((x) >> 4) & 0x3)
+#define   AD7768_POWER_MODE_MCLK_DIV_MSK	GENMASK(1, 0)
+#define   AD7768_POWER_MODE_MCLK_DIV_MODE(x)	(((x) & 0x3) << 0)
+
+/* AD7768_REG_DATA_CONTROL */
+#define   AD7768_DATA_CONTROL_SPI_RESET_MSK	GENMASK(1, 0)
+#define   AD7768_DATA_CONTROL_SPI_RESET_1	0x03
+#define   AD7768_DATA_CONTROL_SPI_RESET_2	0x02
+#define   AD7768_DATA_CONTROL_SPI_SYNC_MSK	BIT(7)
+#define   AD7768_DATA_CONTROL_SPI_SYNC		BIT(7)
+#define   AD7768_DATA_CONTROL_SPI_SYNC_CLEAR	0
+
+/* AD7768_REG_INTERFACE_CFG */
+#define   AD7768_INTERFACE_CFG_DCLK_DIV_MSK	GENMASK(1, 0)
+#define   AD7768_INTERFACE_CFG_DCLK_DIV_MODE(x)	(4 - ffs(x))
+#define   AD7768_MAX_DCLK_DIV			8
+
+#define   AD7768_INTERFACE_CFG_CRC_SELECT_MSK	GENMASK(3, 2)
+/* only 4 samples CRC calculation support exists */
+#define   AD7768_INTERFACE_CFG_CRC_SELECT	FIELD_PREP(GENMASK(3, 2), 0x01)
+
+/* AD7768_REG_GENERAL_CONFIG */
+#define   AD7768_GEN_CONFIG_VCM_SEL_MSK		GENMASK(1, 0)
+#define   AD7768_GEN_CONFIG_VCM_PD		BIT(4)
+
+/* AD7768_REG_PRECHARGE_BUF1 and 2*/
+#define   AD7768_PRECHARGE_BUF1_MSK(val)	((val) & GENMASK(7, 0))
+#define   AD7768_PRECHARGE_BUF2_MSK(val)	(((val) & GENMASK(15, 8)) >> 8)
+#define   AD7768_4_PRECHARGE_BUF1_MSK(val)	((val) & GENMASK(3, 0))
+#define   AD7768_4_PRECHARGE_BUF2_MSK(val)	(((val) & GENMASK(7, 4)) >> 4)
+#define   AD7768_PREBUF_POS_EN(ch)	BIT((ch) * 2)
+#define   AD7768_PREBUF_NEG_EN(ch)	BIT(((ch) * 2) + 1)
+
+#define   AD7768_SPI_READ_CMD			BIT(15)
+#define   AD7768_SPI_REG_MASK			GENMASK(14, 8)
+#define   AD7768_SPI_DATA_MASK			GENMASK(7, 0)
+#define   AD7768_OUTPUT_MODE_TWOS_COMPLEMENT	0x01
+#define   AD7768_SAMPLE_SIZE				32
+#define   MAX_FREQ_PER_MODE			6
+#define   AD7768_MAX_CHANNEL  8
+#define   AD7768_NUM_CHANNEL_MODES		2
+#define   AD7768_CALIB_REG_MSB_MASK(val)		(((val) & 0xFF0000) >> 16)
+#define   AD7768_CALIB_REG_MID_MASK(val)		(((val) & 0x00FF00) >> 8)
+#define   AD7768_CALIB_REG_LSB_MASK(val)		((val) & 0x0000FF)
+#define   AD7768_REV_ID_VAL			0x06
+
+enum ad7768_filter_type {
+	AD7768_FILTER_TYPE_WIDEBAND,
+	AD7768_FILTER_TYPE_SINC5,
+};
+
+enum ad7768_power_modes {
+	AD7768_LOW_POWER_MODE,
+	AD7768_MEDIAN_MODE,
+	AD7768_FAST_MODE,
+	AD7768_NUM_POWER_MODES
+};
+
+struct ad7768_precharge_config {
+	bool prebufp_en;
+	bool prebufn_en;
+	bool refbufp;
+	bool refbufn;
+};
+
+struct ad7768_freq_config {
+	unsigned int freq;
+	unsigned int dec_rate;
+};
+
+struct ad7768_avail_freq {
+	unsigned int n_freqs;
+	struct ad7768_freq_config freq_cfg[MAX_FREQ_PER_MODE];
+};
+
+struct ad7768_chip_info {
+	const char *name;
+	unsigned int num_channels;
+	const struct iio_chan_spec channel[AD7768_MAX_CHANNEL];
+	const struct regmap_config *regmap_config;
+	const unsigned int *available_datalines;
+	unsigned int num_datalines;
+};
+
+struct ad7768_state {
+	struct spi_device *spi;
+	struct regmap *regmap;
+	struct mutex lock; /* Protects device register access and configuration */
+	struct clk *mclk;
+	unsigned int datalines;
+	unsigned int sampling_freq;
+	enum ad7768_power_modes power_mode;
+	const struct ad7768_chip_info *chip_info;
+	struct ad7768_avail_freq avail_freq[AD7768_NUM_POWER_MODES];
+	unsigned int chn_mode[AD7768_MAX_CHANNEL];
+	unsigned int mode_freq[AD7768_NUM_CHANNEL_MODES];
+	unsigned int active_modes;
+	struct iio_backend *back;
+
+	__be16 d16 __aligned(IIO_DMA_MINALIGN);
+};
+
+static const char * const ad7768_vcm_sel_str[] = {
+	"avdd-avss-half", "1.65V", "2.5V", "2.14V"
+};
+
+static const char * const ad7768_power_mode_str[] = {
+	"low", "median", "fast"
+};
+
+static const int ad7768_dec_rate[MAX_FREQ_PER_MODE] = {
+	32, 64, 128, 256, 512, 1024
+};
+
+static const int ad7768_mclk_div[3] = {
+	32, 8, 4
+};
+
+static const unsigned int ad7768_available_datalines[] = {
+	1, 2, 8
+};
+
+static const unsigned int ad7768_4_available_datalines[] = {
+	1, 4
+};
+
+static const char * const ad7768_supply_names[] = {
+	"avdd", "avss", "dvdd", "iovdd", "vref"
+};
+
+static u8 ad7768_map_power_mode_to_regval(u8 x)
+{
+	return x ? (x + 1) : 0;
+}
+
+static u8 ad7768_4_get_refbuf(u8 ch)
+{
+	return (ch < 2) ? BIT(ch) : BIT(ch + 2);
+}
+
+static u8 ad7768_ch_mode_sel_4ch(u8 ch)
+{
+	return (ch < 2) ? BIT(ch) : BIT(ch + 2);
+}
+
+static int ad7768_regmap_read(void *context, const void *reg_buf,
+			      size_t reg_size, void *val_buf, size_t val_size)
+{
+	struct spi_device *spi = context;
+	struct ad7768_state *st = spi_get_drvdata(spi);
+	unsigned int reg;
+	int ret;
+	struct spi_transfer t[] = {
+		{
+			.tx_buf = &st->d16,
+			.len = 2,
+			.cs_change = 1,
+		}, {
+			.tx_buf = &st->d16,
+			.rx_buf = &st->d16,
+			.len = 2,
+		},
+	};
+
+	reg = *(const u8 *)reg_buf;
+
+	st->d16 = cpu_to_be16(AD7768_SPI_READ_CMD |
+			      FIELD_PREP(AD7768_SPI_REG_MASK, reg));
+
+	ret = spi_sync_transfer(spi, t, ARRAY_SIZE(t));
+	if (ret < 0)
+		return ret;
+
+	*(u8 *)val_buf = FIELD_GET(AD7768_SPI_DATA_MASK, be16_to_cpu(st->d16));
+
+	return ret;
+}
+
+static int ad7768_regmap_write(void *context, const void *data, size_t count)
+{
+	struct spi_device *spi = context;
+
+	return spi_write(spi, data, count);
+}
+
+static const struct regmap_bus ad7768_regmap_bus = {
+	.read = ad7768_regmap_read,
+	.write = ad7768_regmap_write,
+	.reg_format_endian_default = REGMAP_ENDIAN_BIG,
+	.val_format_endian_default = REGMAP_ENDIAN_BIG,
+};
+
+static bool ad7768_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case AD7768_REG_CH_STANDBY ... AD7768_REG_REV_ID:
+	case AD7768_REG_GPIO_CONTROL ... AD7768_REG_REFN_BUF:
+		return true;
+	case AD7768_REG_OFFSET(0) ... AD7768_REG_OFFSET(7) + 2:
+	case AD7768_REG_GAIN(0) ... AD7768_REG_GAIN(7) + 2:
+	case AD7768_REG_PHASE(0) ... AD7768_REG_PHASE(7):
+	case AD7768_REG_DIAGNOSTIC_RX ... AD7768_REG_CHOP_CTRL:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool ad7768_4_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case AD7768_REG_CH_STANDBY ... AD7768_REG_REV_ID:
+	case AD7768_REG_GPIO_CONTROL ... AD7768_REG_REFN_BUF:
+		return true;
+	case AD7768_4_REG_OFFSET(0) ... AD7768_4_REG_OFFSET(1) + 2:
+	case AD7768_4_REG_OFFSET(2) ... AD7768_4_REG_OFFSET(3) + 2:
+	case AD7768_4_REG_GAIN(0) ... AD7768_4_REG_GAIN(1) + 2:
+	case AD7768_4_REG_GAIN(2) ... AD7768_4_REG_GAIN(3) + 2:
+	case AD7768_4_REG_PHASE(0) ... AD7768_4_REG_PHASE(1):
+	case AD7768_4_REG_PHASE(2) ... AD7768_4_REG_PHASE(3):
+	case AD7768_REG_DIAGNOSTIC_RX ... AD7768_REG_CHOP_CTRL:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config ad7768_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = AD7768_REG_CHOP_CTRL,
+	.readable_reg = ad7768_readable_reg,
+};
+
+static const struct regmap_config ad7768_4_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = AD7768_REG_CHOP_CTRL,
+	.readable_reg = ad7768_4_readable_reg,
+};
+
+static unsigned int ad7768_get_calib_reg_base(struct ad7768_state *st,
+					      const struct iio_chan_spec *chan,
+					      bool is_gain)
+{
+	if (is_gain) {
+		if (st->chip_info->num_channels == AD7768_MAX_CHANNEL)
+			return AD7768_REG_GAIN(chan->address);
+		return AD7768_4_REG_GAIN(chan->address);
+	}
+
+	if (st->chip_info->num_channels == AD7768_MAX_CHANNEL)
+		return AD7768_REG_OFFSET(chan->address);
+	return AD7768_4_REG_OFFSET(chan->address);
+}
+
+static int ad7768_read_calib_value(struct ad7768_state *st,
+				   unsigned int base_reg, int *val)
+{
+	unsigned int msb, mid, lsb;
+	int ret;
+
+	guard(mutex)(&st->lock);
+
+	ret = regmap_read(st->regmap, base_reg + 0, &msb);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(st->regmap, base_reg + 1, &mid);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(st->regmap, base_reg + 2, &lsb);
+	if (ret)
+		return ret;
+
+	*val = (msb << 16) | (mid << 8) | lsb;
+
+	return 0;
+}
+
+static int ad7768_write_calib_value(struct ad7768_state *st,
+				    unsigned int base_reg, int val)
+{
+	int ret;
+
+	guard(mutex)(&st->lock);
+
+	ret = regmap_write(st->regmap, base_reg, AD7768_CALIB_REG_MSB_MASK(val));
+	if (ret)
+		return ret;
+
+	ret = regmap_write(st->regmap, base_reg + 1,
+			   AD7768_CALIB_REG_MID_MASK(val));
+	if (ret)
+		return ret;
+
+	return regmap_write(st->regmap, base_reg + 2,
+			    AD7768_CALIB_REG_LSB_MASK(val));
+}
+
+static int ad7768_reg_access(struct iio_dev *indio_dev,
+			     unsigned int reg,
+			     unsigned int writeval,
+			     unsigned int *readval)
+{
+	struct ad7768_state *st = iio_priv(indio_dev);
+	int ret;
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(&st->spi->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	if (readval)
+		return regmap_read(st->regmap, reg, readval);
+
+	return regmap_write(st->regmap, reg, writeval);
+}
+
+static int ad7768_sync(struct ad7768_state *st)
+{
+	int ret;
+
+	ret = regmap_update_bits(st->regmap, AD7768_REG_DATA_CONTROL,
+				 AD7768_DATA_CONTROL_SPI_SYNC_MSK,
+				 AD7768_DATA_CONTROL_SPI_SYNC_CLEAR);
+	if (ret < 0)
+		return ret;
+
+	return regmap_update_bits(st->regmap, AD7768_REG_DATA_CONTROL,
+				  AD7768_DATA_CONTROL_SPI_SYNC_MSK,
+				  AD7768_DATA_CONTROL_SPI_SYNC);
+}
+
+static int ad7768_set_clk_divs(struct ad7768_state *st,
+			       unsigned int freq, unsigned int ch)
+{
+	unsigned int mclk, dclk, dclk_div, i;
+	struct ad7768_freq_config f_cfg = {};
+	unsigned int chan_per_doutx;
+
+	mclk = clk_get_rate(st->mclk);
+
+	chan_per_doutx = st->chip_info->num_channels / st->datalines;
+	if (!chan_per_doutx)
+		return -EINVAL;
+
+	for (i = 0; i < st->avail_freq[st->power_mode].n_freqs; i++) {
+		f_cfg = st->avail_freq[st->power_mode].freq_cfg[i];
+		if (freq == f_cfg.freq)
+			break;
+	}
+
+	if (i == st->avail_freq[st->power_mode].n_freqs)
+		return -EINVAL;
+
+	dclk = f_cfg.freq * AD7768_SAMPLE_SIZE * chan_per_doutx;
+	if (dclk > mclk)
+		return -EINVAL;
+
+	/* Set dclk_div to the nearest power of 2 less than the original value */
+	dclk_div = DIV_ROUND_CLOSEST_ULL(mclk, dclk);
+	if (dclk_div > AD7768_MAX_DCLK_DIV)
+		dclk_div = AD7768_MAX_DCLK_DIV;
+	else if (dclk_div > 0 && hweight32(dclk_div) != 1)
+		dclk_div = 1 << (fls(dclk_div) - 1);
+
+	return regmap_update_bits(st->regmap, AD7768_REG_INTERFACE_CFG,
+				  AD7768_INTERFACE_CFG_DCLK_DIV_MSK,
+				  AD7768_INTERFACE_CFG_DCLK_DIV_MODE(dclk_div));
+}
+
+static int ad7768_set_channel_decimation(struct ad7768_state *st,
+					 unsigned int freq, unsigned int ch)
+{
+	struct ad7768_freq_config f_cfg = {};
+	unsigned int i;
+
+	for (i = 0; i < st->avail_freq[st->power_mode].n_freqs; i++) {
+		f_cfg = st->avail_freq[st->power_mode].freq_cfg[i];
+		if (freq == f_cfg.freq)
+			break;
+	}
+
+	if (i == st->avail_freq[st->power_mode].n_freqs)
+		return -EINVAL;
+
+	return regmap_update_bits(st->regmap, AD7768_REG_CH_MODE(st->chn_mode[ch]),
+				  AD7768_CH_MODE_DEC_RATE_MSK,
+				  AD7768_CH_MODE_DEC_RATE_MODE(f_cfg.dec_rate));
+}
+
+static unsigned int ad7768_get_max_mode_freq(const struct ad7768_state *st,
+					     unsigned int mode,
+					     unsigned int mode_freq)
+{
+	unsigned int max_freq = 0;
+	unsigned int i, freq;
+
+	for (i = 0; i < AD7768_NUM_CHANNEL_MODES; i++) {
+		if (!(st->active_modes & BIT(i)))
+			continue;
+
+		freq = i == mode ? mode_freq : st->mode_freq[i];
+		if (freq > max_freq)
+			max_freq = freq;
+	}
+
+	return max_freq;
+}
+
+static int ad7768_set_sampling_freq(struct iio_dev *indio_dev,
+				    unsigned int freq, unsigned int ch)
+{
+	struct ad7768_state *st = iio_priv(indio_dev);
+	unsigned int mode = st->chn_mode[ch];
+	int ret = 0;
+	unsigned int max_freq;
+
+	if (!freq)
+		return -EINVAL;
+
+	guard(mutex)(&st->lock);
+
+	max_freq = ad7768_get_max_mode_freq(st, mode, freq);
+
+	ret = ad7768_set_clk_divs(st, max_freq, ch);
+	if (ret < 0)
+		return ret;
+
+	ret = ad7768_set_channel_decimation(st, freq, ch);
+	if (ret < 0)
+		return ret;
+
+	ret = ad7768_sync(st);
+	if (ret)
+		return ret;
+
+	st->mode_freq[mode] = freq;
+	return 0;
+}
+
+static int ad7768_set_channel_mode(struct iio_dev *indio_dev, unsigned int ch,
+				   unsigned int mode)
+{
+	struct ad7768_state *st = iio_priv(indio_dev);
+	int ret;
+	unsigned int mask;
+
+	if (st->chip_info->num_channels == AD7768_MAX_CHANNEL)
+		mask = AD7768_CH_MODE_SEL_8CH(ch);
+	else
+		mask = ad7768_ch_mode_sel_4ch(ch);
+
+	guard(mutex)(&st->lock);
+
+	ret = regmap_update_bits(st->regmap, AD7768_REG_CH_MODE_SEL, mask,
+				 mode ? mask : 0);
+	if (ret)
+		return ret;
+
+	st->chn_mode[ch] = mode;
+
+	return 0;
+}
+
+static int ad7768_set_power_mode(struct iio_dev *indio_dev, unsigned int mode)
+{
+	struct ad7768_state *st = iio_priv(indio_dev);
+	struct ad7768_avail_freq avail_freq;
+	int max_mode_freq;
+	unsigned int regval;
+	int ret;
+
+	if (mode >= AD7768_NUM_POWER_MODES)
+		return -EINVAL;
+
+	guard(mutex)(&st->lock);
+
+	st->power_mode = mode;
+
+	regval = ad7768_map_power_mode_to_regval(mode);
+	ret = regmap_update_bits(st->regmap, AD7768_REG_POWER_MODE,
+				 AD7768_POWER_MODE_POWER_MODE_MSK,
+				 AD7768_POWER_MODE_POWER_MODE(regval));
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_update_bits(st->regmap, AD7768_REG_POWER_MODE,
+				 AD7768_POWER_MODE_MCLK_DIV_MSK,
+				 AD7768_POWER_MODE_MCLK_DIV_MODE(regval));
+	if (ret < 0)
+		return ret;
+
+	avail_freq = st->avail_freq[mode];
+	max_mode_freq = avail_freq.freq_cfg[avail_freq.n_freqs - 1].freq;
+
+	st->sampling_freq = max_mode_freq;
+
+	return ad7768_sync(st);
+}
+
+static int ad7768_read_raw(struct iio_dev *indio_dev,
+			   const struct iio_chan_spec *chan,
+			   int *val, int *val2, long info)
+{
+	struct ad7768_state *st = iio_priv(indio_dev);
+	unsigned int base_reg;
+	int ret;
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(&st->spi->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	switch (info) {
+	case IIO_CHAN_INFO_SAMP_FREQ: {
+		guard(mutex)(&st->lock);
+		*val = st->mode_freq[st->chn_mode[chan->channel]];
+		return IIO_VAL_INT;
+	}
+
+	case IIO_CHAN_INFO_CALIBBIAS:
+		base_reg = ad7768_get_calib_reg_base(st, chan, false);
+		ret = ad7768_read_calib_value(st, base_reg, val);
+		if (ret)
+			return ret;
+		return IIO_VAL_INT;
+
+	case IIO_CHAN_INFO_CALIBSCALE:
+		base_reg = ad7768_get_calib_reg_base(st, chan, true);
+		ret = ad7768_read_calib_value(st, base_reg, val);
+		if (ret)
+			return ret;
+		return IIO_VAL_INT;
+
+	case IIO_CHAN_INFO_PHASE:
+		if (st->chip_info->num_channels == AD7768_MAX_CHANNEL)
+			base_reg = AD7768_REG_PHASE(chan->address);
+		else
+			base_reg = AD7768_4_REG_PHASE(chan->address);
+
+		ret = regmap_read(st->regmap, base_reg, val);
+		if (ret)
+			return ret;
+
+		return IIO_VAL_INT;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int ad7768_write_raw(struct iio_dev *indio_dev,
+			    struct iio_chan_spec const *chan,
+			    int val, int val2, long info)
+{
+	struct ad7768_state *st = iio_priv(indio_dev);
+	unsigned int base_reg;
+	int ret;
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(&st->spi->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	switch (info) {
+	case IIO_CHAN_INFO_SAMP_FREQ:
+		return ad7768_set_sampling_freq(indio_dev, val, chan->channel);
+
+	case IIO_CHAN_INFO_CALIBBIAS:
+		return ad7768_write_calib_value(st,
+			ad7768_get_calib_reg_base(st, chan, false), val);
+
+	case IIO_CHAN_INFO_CALIBSCALE:
+		return ad7768_write_calib_value(st,
+			ad7768_get_calib_reg_base(st, chan, true), val);
+
+	case IIO_CHAN_INFO_PHASE:
+		if (st->chip_info->num_channels == AD7768_MAX_CHANNEL)
+			base_reg = AD7768_REG_PHASE(chan->address);
+		else
+			base_reg = AD7768_4_REG_PHASE(chan->address);
+
+		return regmap_write(st->regmap, base_reg, val);
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static int ad7768_update_scan_mode(struct iio_dev *indio_dev,
+				   const unsigned long *scan_mask)
+{
+	struct ad7768_state *st = iio_priv(indio_dev);
+	unsigned int c;
+	int ret;
+
+	for (c = 0; c < st->chip_info->num_channels; c++) {
+		if (test_bit(c, scan_mask))
+			ret = iio_backend_chan_enable(st->back, c);
+		else
+			ret = iio_backend_chan_disable(st->back, c);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct ad7768_chip_info ad7768_chip_info = {
+	.name = "ad7768",
+	.num_channels = 8,
+	.regmap_config = &ad7768_regmap_config,
+	.available_datalines = ad7768_available_datalines,
+	.num_datalines = ARRAY_SIZE(ad7768_available_datalines),
+};
+
+static const struct ad7768_chip_info ad7768_4_chip_info = {
+	.name = "ad7768-4",
+	.num_channels = 4,
+	.regmap_config = &ad7768_4_regmap_config,
+	.available_datalines = ad7768_4_available_datalines,
+	.num_datalines = ARRAY_SIZE(ad7768_4_available_datalines),
+};
+
+static int ad7768_buffer_preenable(struct iio_dev *indio_dev)
+{
+	struct ad7768_state *st = iio_priv(indio_dev);
+
+	return pm_runtime_resume_and_get(&st->spi->dev);
+}
+
+static int ad7768_buffer_postdisable(struct iio_dev *indio_dev)
+{
+	struct ad7768_state *st = iio_priv(indio_dev);
+
+	pm_runtime_mark_last_busy(&st->spi->dev);
+	pm_runtime_put_autosuspend(&st->spi->dev);
+	return 0;
+}
+
+static const struct iio_buffer_setup_ops ad7768_buffer_ops = {
+	.preenable = ad7768_buffer_preenable,
+	.postdisable = ad7768_buffer_postdisable,
+};
+
+static const struct iio_info ad7768_info = {
+	.debugfs_reg_access = ad7768_reg_access,
+	.read_raw = ad7768_read_raw,
+	.write_raw = ad7768_write_raw,
+	.update_scan_mode = ad7768_update_scan_mode,
+};
+
+static void ad7768_set_available_sampl_freq(struct ad7768_state *st)
+{
+	unsigned int mode;
+	unsigned int dec;
+	unsigned int mclk = clk_get_rate(st->mclk);
+	struct ad7768_avail_freq *avail_freq;
+
+	for (mode = 0; mode < AD7768_NUM_POWER_MODES; mode++) {
+		avail_freq = &st->avail_freq[mode];
+		for (dec = ARRAY_SIZE(ad7768_dec_rate); dec > 0; dec--) {
+			struct ad7768_freq_config freq_cfg;
+
+			freq_cfg.dec_rate = dec - 1;
+			freq_cfg.freq = mclk / (ad7768_dec_rate[dec - 1] *
+					ad7768_mclk_div[mode]);
+			avail_freq->freq_cfg[avail_freq->n_freqs++] = freq_cfg;
+		}
+	}
+
+	/* The max frequency is not supported in one data line configuration */
+	if (st->datalines == 1)
+		st->avail_freq[AD7768_FAST_MODE].n_freqs--;
+}
+
+static int ad7768_gpio_adev_init(struct ad7768_state *st)
+{
+	struct device *dev = &st->spi->dev;
+	struct auxiliary_device *adev;
+	int id;
+
+	if (!device_property_read_bool(dev, "gpio-controller"))
+		return 0;
+
+	id = (st->spi->controller->bus_num << 8) | spi_get_chipselect(st->spi, 0);
+	adev = __devm_auxiliary_device_create(dev, KBUILD_MODNAME,
+					      AD7768_AUX_DEV_GPIO_NAME,
+					      (void *)st->chip_info->name, id);
+	if (!adev)
+		return dev_err_probe(dev, -ENODEV,
+				     "Failed to create GPIO auxiliary device\n");
+
+	return 0;
+}
+
+static int ad7768_set_filter_mode(struct iio_dev *indio_dev,
+				  const struct iio_chan_spec *chan,
+				  unsigned int mode)
+{
+	struct ad7768_state *st = iio_priv(indio_dev);
+	int ret;
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(&st->spi->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&st->lock);
+
+	ret = regmap_update_bits(st->regmap,
+				 AD7768_REG_CH_MODE(st->chn_mode[chan->address]),
+				 AD7768_CH_MODE_FILTER_TYPE_MSK,
+				 AD7768_CH_MODE_FILTER_TYPE_MODE(mode));
+	if (ret < 0)
+		return ret;
+
+	return ad7768_sync(st);
+}
+
+static int ad7768_get_filter_mode(struct iio_dev *indio_dev,
+				  const struct iio_chan_spec *chan)
+{
+	struct ad7768_state *st = iio_priv(indio_dev);
+	unsigned int regval;
+	int ret;
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(&st->spi->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(st->regmap,
+			  AD7768_REG_CH_MODE(st->chn_mode[chan->address]),
+			  &regval);
+	if (ret < 0)
+		return ret;
+
+	return AD7768_CH_MODE_GET_FILTER_TYPE(regval);
+}
+
+static int ad7768_configure_precharge_buffers(struct iio_dev *indio_dev,
+					      struct ad7768_precharge_config *precharge_cfg)
+{
+	struct ad7768_state *st = iio_priv(indio_dev);
+	int ret;
+	u8 ch;
+	u8 prebuf1_val, prebuf2_val;
+	u16 prebuf_mask = 0;
+	u8 refbufp_val = 0;
+	u8 refbufn_val = 0;
+
+	if (st->chip_info->num_channels == AD7768_MAX_CHANNEL) {
+		for (ch = 0; ch < indio_dev->num_channels; ch++) {
+			u8 channel = indio_dev->channels[ch].channel;
+
+			if (precharge_cfg[channel].prebufp_en)
+				prebuf_mask |= AD7768_PREBUF_POS_EN(channel);
+
+			if (precharge_cfg[channel].prebufn_en)
+				prebuf_mask |= AD7768_PREBUF_NEG_EN(channel);
+
+			if (precharge_cfg[channel].refbufp)
+				refbufp_val |= BIT(channel);
+
+			if (precharge_cfg[channel].refbufn)
+				refbufn_val |= BIT(channel);
+		}
+
+		prebuf1_val = AD7768_PRECHARGE_BUF1_MSK(prebuf_mask);
+		prebuf2_val = AD7768_PRECHARGE_BUF2_MSK(prebuf_mask);
+	} else {
+		for (ch = 0; ch < indio_dev->num_channels; ch++) {
+			u8 channel = indio_dev->channels[ch].channel;
+
+			if (precharge_cfg[channel].prebufp_en)
+				prebuf_mask |= AD7768_PREBUF_POS_EN(channel);
+
+			if (precharge_cfg[channel].prebufn_en)
+				prebuf_mask |= AD7768_PREBUF_NEG_EN(channel);
+
+			if (precharge_cfg[channel].refbufp)
+				refbufp_val |= ad7768_4_get_refbuf(channel);
+
+			if (precharge_cfg[channel].refbufn)
+				refbufn_val |= ad7768_4_get_refbuf(channel);
+		}
+
+		prebuf1_val = AD7768_4_PRECHARGE_BUF1_MSK(prebuf_mask);
+		prebuf2_val = AD7768_4_PRECHARGE_BUF2_MSK(prebuf_mask);
+	}
+
+	ret = regmap_write(st->regmap, AD7768_REG_PRECHARGE_BUF1, prebuf1_val);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_write(st->regmap, AD7768_REG_PRECHARGE_BUF2, prebuf2_val);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_write(st->regmap, AD7768_REG_REFP_BUF, refbufp_val);
+	if (ret < 0)
+		return ret;
+
+	return regmap_write(st->regmap, AD7768_REG_REFN_BUF, refbufn_val);
+}
+
+static const char *const ad7768_filter_types[] = {
+	[AD7768_FILTER_TYPE_WIDEBAND] = "wideband",
+	[AD7768_FILTER_TYPE_SINC5] = "sinc5",
+};
+
+static const struct iio_enum ad7768_filter_types_enum = {
+	.items = ad7768_filter_types,
+	.num_items = ARRAY_SIZE(ad7768_filter_types),
+	.set = ad7768_set_filter_mode,
+	.get = ad7768_get_filter_mode,
+};
+
+static struct iio_chan_spec_ext_info ad7768_ext_info[] = {
+	IIO_ENUM("filter_type", IIO_SEPARATE,
+		 &ad7768_filter_types_enum),
+	IIO_ENUM_AVAILABLE("filter_type", IIO_SEPARATE, &ad7768_filter_types_enum),
+	{ },
+};
+
+static const struct iio_chan_spec ad7768_channel_template = {
+	.type = IIO_VOLTAGE,
+	.info_mask_separate =	BIT(IIO_CHAN_INFO_CALIBBIAS) |
+				BIT(IIO_CHAN_INFO_CALIBSCALE) |
+				BIT(IIO_CHAN_INFO_PHASE) |
+				BIT(IIO_CHAN_INFO_SAMP_FREQ),
+	.indexed = 1,
+	.scan_type = {
+		.sign = 's',
+		.realbits = 24,
+		.storagebits = 32,
+	},
+	.ext_info = ad7768_ext_info,
+};
+
+static void ad7768_init_chan(struct iio_chan_spec *chan, unsigned int channel)
+{
+	*chan = ad7768_channel_template;
+	chan->address = channel;
+	chan->channel = channel;
+	chan->scan_index = channel;
+}
+
+static int ad7768_parse_config(struct iio_dev *indio_dev,
+			       struct device *dev)
+{
+	struct ad7768_state *st = iio_priv(indio_dev);
+	const unsigned int *available_datalines;
+	struct ad7768_precharge_config precharge_cfg[AD7768_MAX_CHANNEL] = {};
+	struct iio_chan_spec *chan;
+	unsigned int num_channels;
+	unsigned int channel;
+	unsigned int i, len, vcm_sel, vcm_pd, ch_mode, pwr_mode;
+	int chan_idx = 0;
+	int ret;
+
+	num_channels = device_get_child_node_count(dev);
+
+	if (!num_channels || num_channels > st->chip_info->num_channels)
+		return dev_err_probe(dev, -EINVAL, "Invalid number of channels\n");
+
+	chan = devm_kcalloc(indio_dev->dev.parent, num_channels,
+			    sizeof(*chan), GFP_KERNEL);
+	if (!chan)
+		return -ENOMEM;
+
+	indio_dev->channels = chan;
+	indio_dev->num_channels = num_channels;
+
+	ret = regmap_write(st->regmap, AD7768_REG_CH_STANDBY,
+			   GENMASK(st->chip_info->num_channels - 1, 0));
+	if (ret < 0)
+		return ret;
+
+	device_for_each_child_node_scoped(dev, child) {
+		ret = fwnode_property_read_u32(child, "reg", &channel);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to parse reg property of %pfwP\n", child);
+
+		if (channel >= st->chip_info->num_channels)
+			return dev_err_probe(dev, -EINVAL,
+					     "Invalid channel number %d\n", channel);
+
+		ret = regmap_update_bits(st->regmap, AD7768_REG_CH_STANDBY,
+					 BIT(channel), 0);
+		if (ret < 0)
+			return ret;
+
+		ret = fwnode_property_read_u32(child, "adi,ch-mode", &ch_mode);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to parse property adi,ch-mode %pfwP\n",
+					     child);
+
+		if (ch_mode >= AD7768_NUM_CHANNEL_MODES)
+			return dev_err_probe(dev, -EINVAL,
+					     "Invalid adi,ch-mode %u for channel %u\n",
+					     ch_mode, channel);
+
+		ret = ad7768_set_channel_mode(indio_dev, channel, ch_mode);
+		if (ret)
+			return ret;
+
+		st->active_modes |= BIT(ch_mode);
+
+		if (fwnode_property_read_bool(child, "adi,prebuf-pos-en"))
+			precharge_cfg[channel].prebufp_en = true;
+
+		if (fwnode_property_read_bool(child, "adi,prebuf-neg-en"))
+			precharge_cfg[channel].prebufn_en = true;
+
+		if (fwnode_property_read_bool(child, "adi,refbuf-pos-en"))
+			precharge_cfg[channel].refbufp = true;
+
+		if (fwnode_property_read_bool(child, "adi,refbuf-neg-en"))
+			precharge_cfg[channel].refbufn = true;
+
+		ad7768_init_chan(&chan[chan_idx], channel);
+		chan_idx++;
+	}
+
+	ret = ad7768_configure_precharge_buffers(indio_dev, precharge_cfg);
+	if (ret < 0)
+		return ret;
+
+	st->datalines = 1;
+	ret = device_property_read_u32(&st->spi->dev, "adi,data-lines-number",
+				       &st->datalines);
+	if (ret)
+		return dev_err_probe(&st->spi->dev, ret,
+				     "Missing \"adi,data-lines-number\" property\n");
+
+	ad7768_set_available_sampl_freq(st);
+
+	ret = device_property_match_property_string(&st->spi->dev,
+						    "adi,common-mode-output",
+						    ad7768_vcm_sel_str,
+						    ARRAY_SIZE(ad7768_vcm_sel_str));
+	if (ret < 0)
+		return dev_err_probe(&st->spi->dev, ret,
+				     "Missing or invalid \"adi,common-mode-output\" property\n");
+	vcm_sel = ret;
+
+	ret = regmap_update_bits(st->regmap,
+				 AD7768_REG_GENERAL_CONFIG,
+				 AD7768_GEN_CONFIG_VCM_SEL_MSK,
+				 vcm_sel);
+	if (ret < 0)
+		return ret;
+
+	vcm_pd = device_property_read_bool(&st->spi->dev, "adi,vcm-power-down");
+
+	ret = regmap_update_bits(st->regmap,
+				 AD7768_REG_GENERAL_CONFIG,
+				 AD7768_GEN_CONFIG_VCM_PD,
+				 vcm_pd ? AD7768_GEN_CONFIG_VCM_PD : 0);
+	if (ret < 0)
+		return ret;
+
+	ret = device_property_match_property_string(&st->spi->dev,
+						    "adi,power-mode",
+						    ad7768_power_mode_str,
+						    ARRAY_SIZE(ad7768_power_mode_str));
+	if (ret < 0) {
+		if (ret != -ENODATA)
+			return dev_err_probe(&st->spi->dev, ret,
+					     "Invalid \"adi,power-mode\" property\n");
+
+		pwr_mode = AD7768_LOW_POWER_MODE;
+	} else {
+		pwr_mode = ret;
+	}
+
+	ret = ad7768_set_power_mode(indio_dev, pwr_mode);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to set power mode\n");
+
+	for (i = 0; i < indio_dev->num_channels; i++) {
+		ret = ad7768_set_sampling_freq(indio_dev, st->sampling_freq,
+					       indio_dev->channels[i].channel);
+		if (ret < 0)
+			return dev_err_probe(dev, ret,
+					     "Failed to set sampling freq for channel %d\n",
+					     indio_dev->channels[i].channel);
+	}
+
+	available_datalines = st->chip_info->available_datalines;
+	len = st->chip_info->num_datalines;
+
+	for (i = 0; i < len; i++) {
+		if (available_datalines[i] == st->datalines)
+			return 0;
+	}
+
+	return dev_err_probe(&st->spi->dev, -EINVAL,
+			     "Invalid data-lines-number %d for %s\n",
+			     st->datalines, st->chip_info->name);
+}
+
+static int ad7768_reset(struct ad7768_state *st)
+{
+	struct reset_control *reset_ctrl;
+	int ret;
+
+	reset_ctrl = devm_reset_control_get_optional_exclusive(&st->spi->dev, NULL);
+	if (IS_ERR(reset_ctrl))
+		return PTR_ERR(reset_ctrl);
+
+	if (reset_ctrl) {
+		ret = reset_control_assert(reset_ctrl);
+		if (ret)
+			return ret;
+
+		ret = reset_control_deassert(reset_ctrl);
+		if (ret)
+			return ret;
+	} else {
+		ret = regmap_write(st->regmap, AD7768_REG_DATA_CONTROL,
+				   AD7768_DATA_CONTROL_SPI_RESET_1);
+		if (ret)
+			return ret;
+
+		ret = regmap_write(st->regmap, AD7768_REG_DATA_CONTROL,
+				   AD7768_DATA_CONTROL_SPI_RESET_2);
+		if (ret)
+			return ret;
+	}
+
+	/* ADC start-up time after reset: 1.66 ms max (datasheet Table 1) */
+	fsleep(2000);
+
+	return 0;
+}
+
+static int ad7768_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	unsigned int spi_readback, rev_id;
+	struct iio_dev *indio_dev;
+	struct ad7768_state *st;
+	int ret;
+
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	st = iio_priv(indio_dev);
+	st->spi = spi;
+	spi_set_drvdata(spi, st);
+
+	ret = devm_mutex_init(dev, &st->lock);
+	if (ret)
+		return ret;
+
+	st->chip_info = spi_get_device_match_data(spi);
+
+	ret = devm_regulator_bulk_get_enable(dev,
+					     ARRAY_SIZE(ad7768_supply_names),
+					     ad7768_supply_names);
+	if (ret)
+		return ret;
+
+	st->mclk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(st->mclk))
+		return PTR_ERR(st->mclk);
+
+	st->regmap = devm_regmap_init(dev, &ad7768_regmap_bus, spi,
+				      st->chip_info->regmap_config);
+	if (IS_ERR(st->regmap))
+		return PTR_ERR(st->regmap);
+
+	ret = regmap_attach_dev(dev, st->regmap, st->chip_info->regmap_config);
+	if (ret)
+		return ret;
+
+	ret = ad7768_reset(st);
+	if (ret)
+		return ret;
+
+	/* Dummy SPI register read to discard the Reset response from the chip */
+	ret = regmap_read(st->regmap, AD7768_REG_REV_ID, &spi_readback);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(st->regmap, AD7768_REG_REV_ID, &rev_id);
+	if (ret)
+		return ret;
+
+	if (rev_id != AD7768_REV_ID_VAL)
+		dev_warn(dev, "Unexpected revision ID 0x%02x\n", rev_id);
+
+	ret = ad7768_parse_config(indio_dev, dev);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_update_bits(st->regmap, AD7768_REG_INTERFACE_CFG,
+				 AD7768_INTERFACE_CFG_CRC_SELECT_MSK,
+				 AD7768_INTERFACE_CFG_CRC_SELECT);
+	if (ret < 0)
+		return ret;
+
+	indio_dev->name = st->chip_info->name;
+	indio_dev->info = &ad7768_info;
+
+	st->back = devm_iio_backend_get(dev, NULL);
+	if (IS_ERR(st->back))
+		return PTR_ERR(st->back);
+
+	ret = devm_iio_backend_request_buffer(dev, st->back, indio_dev);
+	if (ret)
+		return ret;
+
+	ret = iio_backend_num_lanes_set(st->back, st->datalines);
+	if (ret)
+		return ret;
+
+	ret = iio_backend_crc_enable(st->back);
+	if (ret)
+		return ret;
+
+	ret = devm_iio_backend_enable(dev, st->back);
+	if (ret)
+		return ret;
+
+	pm_runtime_set_autosuspend_delay(dev, 2000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_active(dev);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	indio_dev->setup_ops = &ad7768_buffer_ops;
+
+	ret = ad7768_gpio_adev_init(st);
+	if (ret)
+		return ret;
+
+	return devm_iio_device_register(dev, indio_dev);
+}
+
+static int ad7768_runtime_suspend(struct device *dev)
+{
+	struct ad7768_state *st = dev_get_drvdata(dev);
+
+	return regmap_update_bits(st->regmap, AD7768_REG_POWER_MODE,
+				  AD7768_SLEEP_MODE_MSK,
+				  AD7768_SLEEP_MODE_MSK);
+}
+
+static int ad7768_runtime_resume(struct device *dev)
+{
+	struct ad7768_state *st = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regmap_update_bits(st->regmap, AD7768_REG_POWER_MODE,
+				 AD7768_SLEEP_MODE_MSK, 0);
+	if (ret)
+		return ret;
+
+	fsleep(20000);
+
+	return 0;
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(ad7768_pm_ops, ad7768_runtime_suspend,
+	ad7768_runtime_resume, NULL);
+
+static const struct of_device_id ad7768_of_match[]  = {
+	{ .compatible = "adi,ad7768", .data = &ad7768_chip_info },
+	{ .compatible = "adi,ad7768-4", .data = &ad7768_4_chip_info },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ad7768_of_match);
+
+static const struct spi_device_id ad7768_spi_id[] = {
+	{"ad7768", (kernel_ulong_t)&ad7768_chip_info},
+	{"ad7768-4", (kernel_ulong_t)&ad7768_4_chip_info},
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, ad7768_spi_id);
+
+static struct spi_driver ad7768_driver = {
+	.probe = ad7768_probe,
+	.driver = {
+		.name = "ad7768",
+		.of_match_table = ad7768_of_match,
+		.pm = pm_ptr(&ad7768_pm_ops),
+	},
+	.id_table = ad7768_spi_id,
+};
+module_spi_driver(ad7768_driver);
+
+MODULE_AUTHOR("Stefan Popa <stefan.popa@analog.com>");
+MODULE_AUTHOR("Janani Sunil <janani.sunil@analog.com>");
+MODULE_DESCRIPTION("Analog Devices AD7768 ADC driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("IIO_BACKEND");

-- 
2.43.0


