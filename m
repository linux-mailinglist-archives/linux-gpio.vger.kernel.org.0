Return-Path: <linux-gpio+bounces-39318-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yF2HHEgQRWog6QoAu9opvQ
	(envelope-from <linux-gpio+bounces-39318-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 15:04:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 358A06EDCAD
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 15:04:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=tVKkf0jZ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39318-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39318-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F3617301F1DD
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 12:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C734F481A87;
	Wed,  1 Jul 2026 12:42:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56204481A8F;
	Wed,  1 Jul 2026 12:42:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909731; cv=none; b=rg8e49sS2WMeN9Z7LUYB7dD2EELKvhSjL8/Hu8y/KFu+My5IJaLrRWzqOIM0LR7C9pnBf7IocBDg9aLCPOyN6G6P0zuMsaFOM7ixPbsBuV/grVHHAiq5fr2uX2vgpHAlS1PvczkCJeqTRONQzHqs/7eawZMzYHFUHw3jBYFMH3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909731; c=relaxed/simple;
	bh=Kb0Kjj/lRaGqIbftEove1Ls+6eVqjNKJAuiSPddSNkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Es25c8D2duGaPpmcAnjinDzy/txVAMzy54T15Kuq4YcRnsjvZMjjyqVq0+N9zGCd+SQ6Krqf67DO8mhTC1ypLgZCT2V47OULsSe0XcbPoCpVCa6LLBrLXZJ8NY96Zeqn6rcv4ckLxSGb5d+Emeixgu8VELKH3DgI3w3ZgNOpaHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tVKkf0jZ; arc=none smtp.client-ip=95.215.58.171
Date: Wed, 1 Jul 2026 15:41:56 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782909726; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=oLInEPpW6IWTykRsZtSvdDHwnOjOOQ3zahSwIna77SY=;
	b=tVKkf0jZZWI1z4J77JkZlv+BJrqnO/6hkmQqBFRc8eDVWoT3mwvIEF5d2HUnyQyH6ARUVF
	MvrwXAJQkLTOSR494U7WYgqzsbCuHFfzD/5ibJjRf33jF4evKqJpHpp5HP7CgqJ1+CnVcd
	CSLGY6bfSKNY1wREjNElvgt6ujDoU/k=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matti Vaittinen <matti.vaittinen@linux.dev>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 3/8] mfd: Support for ROHM BD73800 PMIC core
Message-ID: <043fc930caca4c436651e8fa77a1ae16a26d0a98.1782909323.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1782909323.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gdsKCu9rD6rUveDm"
Content-Disposition: inline
In-Reply-To: <cover.1782909323.git.mazziesaccount@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.24 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mazziesaccount@gmail.com,m:matti.vaittinen@fi.rohmeurope.com,m:matti.vaittinen@linux.dev,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linusw@kernel.org,m:brgl@kernel.org,m:alexandre.belloni@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com,fi.rohmeurope.com,linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[matti.vaittinen@linux.dev,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39318-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,redhat.com,bootlin.com,vger.kernel.org];
	HAS_REPLYTO(0.00)[mazziesaccount@gmail.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matti.vaittinen@linux.dev,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DKIM_TRACE(0.00)[linux.dev:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,rohmeurope.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 358A06EDCAD


--gdsKCu9rD6rUveDm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

The BD73800 integrates regulators, ADC (intended for accumulating current /
voltage / power values), a real-time clock (RTC), clock gate and GPIOs.

Add core support for ROHM BD73800 Power Management IC.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
 drivers/mfd/Kconfig              |  15 +-
 drivers/mfd/rohm-bd71828.c       | 145 ++++++++++++++-
 include/linux/mfd/rohm-bd73800.h | 307 +++++++++++++++++++++++++++++++
 include/linux/mfd/rohm-generic.h |   1 +
 4 files changed, 461 insertions(+), 7 deletions(-)
 create mode 100644 include/linux/mfd/rohm-bd73800.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 763ce6a34782..c5e9032eb9de 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2222,7 +2222,7 @@ config MFD_ROHM_BD718XX
 	  and emergency shut down as well as 32,768KHz clock output.
=20
 config MFD_ROHM_BD71828
-	tristate "ROHM BD718[15/28/79], BD72720 and BD73900 PMICs"
+	tristate "ROHM BD718[15/28/79], BD72720 and BD73[8/9]00 PMICs"
 	depends on I2C=3Dy
 	depends on OF
 	select REGMAP_I2C
@@ -2230,14 +2230,17 @@ config MFD_ROHM_BD71828
 	select MFD_CORE
 	help
 	  Select this option to get support for the ROHM BD71815, BD71828,
-	  BD71879, BD72720 and BD73900 Power Management ICs (PMICs). These are
-	  single-chip Power Management ICs (PMIC), mainly for battery-powered
-	  portable devices.
+	  BD71879, BD72720, BD73800 and BD73900 Power Management ICs (PMICs).
+	  These are single-chip Power Management ICs (PMIC), mainly for
+	  battery-powered portable devices.
 	  The BD71815 has 5 bucks, 7 LDOs, and a boost for driving LEDs.
 	  The BD718[28/79] have 7 buck converters and 7 LDOs.
 	  The BD72720 and the BD73900 have 10 bucks and 11 LDOs.
-	  All ICs provide a single-cell linear charger, a Coulomb counter,
-	  a Real-Time Clock (RTC), GPIOs and a 32.768 kHz clock gate.
+	  All the above ICs provide a single-cell linear charger, and a Coulomb
+	  counter.
+	  The BD73800 has 8 bucks, 4 LDOs and ADC for power/current
+	  accumulation but no charging logic. All these PMICs integrate also a
+	  Real-Time Clock (RTC), GPIOs and a 32.768 kHz clock gate.
=20
 config MFD_ROHM_BD957XMUF
 	tristate "ROHM BD9576MUF and BD9573MUF Power Management ICs"
diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
index a79f354bf5cb..31637777b627 100644
--- a/drivers/mfd/rohm-bd71828.c
+++ b/drivers/mfd/rohm-bd71828.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2019 ROHM Semiconductors
  *
- * ROHM BD718[15/28/79] and BD72720 PMIC driver
+ * ROHM BD718[15/28/79], BD72720 and BD73[8/9]00 PMIC driver
  */
=20
 #include <linux/gpio_keys.h>
@@ -15,6 +15,7 @@
 #include <linux/mfd/rohm-bd71815.h>
 #include <linux/mfd/rohm-bd71828.h>
 #include <linux/mfd/rohm-bd72720.h>
+#include <linux/mfd/rohm-bd73800.h>
 #include <linux/mfd/rohm-generic.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -68,6 +69,12 @@ static const struct resource bd72720_rtc_irqs[] =3D {
 	DEFINE_RES_IRQ_NAMED(BD72720_INT_RTC2, "bd70528-rtc-alm-2"),
 };
=20
+static const struct resource bd73800_rtc_irqs[] =3D {
+	DEFINE_RES_IRQ_NAMED(BD73800_INT_RTC0, "bd70528-rtc-alm-0"),
+	DEFINE_RES_IRQ_NAMED(BD73800_INT_RTC1, "bd70528-rtc-alm-1"),
+	DEFINE_RES_IRQ_NAMED(BD73800_INT_RTC2, "bd70528-rtc-alm-2"),
+};
+
 static const struct resource bd71815_power_irqs[] =3D {
 	DEFINE_RES_IRQ_NAMED(BD71815_INT_DCIN_RMV, "bd71815-dcin-rmv"),
 	DEFINE_RES_IRQ_NAMED(BD71815_INT_CLPS_OUT, "bd71815-dcin-clps-out"),
@@ -249,6 +256,17 @@ static const struct mfd_cell bd72720_mfd_cells[] =3D {
 	},
 };
=20
+static const struct mfd_cell bd73800_mfd_cells[] =3D {
+	{ .name =3D "bd73800-pmic", },
+	{ .name =3D "bd73800-clk", },
+	{ .name =3D "bd73800-gpio", },
+	{
+		.name =3D "bd73800-rtc",
+		.num_resources =3D ARRAY_SIZE(bd73800_rtc_irqs),
+		.resources =3D &bd73800_rtc_irqs[0],
+	},
+};
+
 static const struct regmap_range bd71815_volatile_ranges[] =3D {
 	regmap_reg_range(BD71815_REG_SEC, BD71815_REG_YEAR),
 	regmap_reg_range(BD71815_REG_CONF, BD71815_REG_BAT_TEMP),
@@ -358,6 +376,17 @@ static const struct regmap_range bd72720_volatile_rang=
es_4c[] =3D {
 	BD72720_UNWRAP_REG_RANGE(BD72720_REG_IMPCHK_CTRL, BD72720_REG_IMPCHK_CTRL=
),
 };
=20
+static const struct regmap_range bd73800_volatile_ranges[] =3D {
+	regmap_reg_range(BD73800_REG_POR_REASON, BD73800_REG_POW_STATE),
+	regmap_reg_range(BD73800_REG_PS_CTRL_1, BD73800_REG_PS_CTRL_2),
+	regmap_reg_range(BD73800_REG_RCVNUM, BD73800_REG_RCVNUM),
+	regmap_reg_range(BD73800_REG_RTC_SEC, BD73800_REG_RTC_YEAR),
+	regmap_reg_range(BD73800_REG_RTC_CONF, BD73800_REG_RTC_CONF),
+	regmap_reg_range(BD73800_REG_ADC_ACCUM_KICK, BD73800_REG_ADC_TEMP_VAL0),
+	regmap_reg_range(BD73800_REG_INT_MAIN_STAT, BD73800_REG_INT_5_STAT),
+	regmap_reg_range(BD73800_REG_INT_MAIN_SRC, BD73800_REG_INT_5_SRC),
+};
+
 static const struct regmap_access_table bd71815_volatile_regs =3D {
 	.yes_ranges =3D &bd71815_volatile_ranges[0],
 	.n_yes_ranges =3D ARRAY_SIZE(bd71815_volatile_ranges),
@@ -383,6 +412,24 @@ static const struct regmap_access_table bd72720_volati=
le_regs_4c =3D {
 	.n_yes_ranges =3D ARRAY_SIZE(bd72720_volatile_ranges_4c),
 };
=20
+static const struct regmap_access_table bd73800_volatile_regs =3D {
+	.yes_ranges =3D &bd73800_volatile_ranges[0],
+	.n_yes_ranges =3D ARRAY_SIZE(bd73800_volatile_ranges),
+};
+
+static const struct regmap_range bd73800_read_only_ranges[] =3D {
+	regmap_reg_range(BD73800_REG_PRODUCT_ID, BD73800_REG_NVMVERSION),
+	regmap_reg_range(BD73800_REG_POW_STATE, BD73800_REG_POW_STATE),
+	regmap_reg_range(BD73800_REG_ADC_ACCUM_CNT2, BD73800_REG_ADC_TEMP_VAL0),
+	regmap_reg_range(BD73800_REG_INT_MAIN_STAT, BD73800_REG_INT_MAIN_STAT),
+	regmap_reg_range(BD73800_REG_INT_MAIN_SRC, BD73800_REG_INT_5_SRC),
+};
+
+static const struct regmap_access_table bd73800_ro_regs =3D {
+	.no_ranges =3D &bd73800_read_only_ranges[0],
+	.n_no_ranges =3D ARRAY_SIZE(bd73800_read_only_ranges),
+};
+
 static const struct regmap_config bd71815_regmap =3D {
 	.reg_bits =3D 8,
 	.val_bits =3D 8,
@@ -467,6 +514,15 @@ static const struct regmap_config bd72720_regmap_4c =
=3D {
 	.cache_type =3D REGCACHE_MAPLE,
 };
=20
+static const struct regmap_config bd73800_regmap =3D {
+	.reg_bits =3D 8,
+	.val_bits =3D 8,
+	.wr_table =3D &bd73800_ro_regs,
+	.volatile_table =3D &bd73800_volatile_regs,
+	.max_register =3D BD73800_MAX_REGISTER - 1,
+	.cache_type =3D REGCACHE_MAPLE,
+};
+
 /*
  * Mapping of main IRQ register bits to sub-IRQ register offsets so that w=
e can
  * access corect sub-IRQ registers based on bits that are set in main IRQ
@@ -798,6 +854,60 @@ static int bd72720_set_type_config(unsigned int **buf,=
 unsigned int type,
 	return regmap_irq_set_type_config_simple(buf, type, irq_data, idx, irq_dr=
v_data);
 }
=20
+static const struct regmap_irq bd73800_irqs[] =3D {
+	/* INT_STAT_1 register IRQs, ADC and RTC */
+	REGMAP_IRQ_REG(BD73800_INT_ADC_ACCUM_DONE, 0, BD73800_INT_ADC_ACCUM_DONE_=
MASK),
+	REGMAP_IRQ_REG(BD73800_INT_ADC_ACCUM_OVF, 0, BD73800_INT_ADC_ACCUM_OVF_MA=
SK),
+	REGMAP_IRQ_REG(BD73800_INT_ADC_ACCUM_VAL, 0, BD73800_INT_ADC_ACCUM_VAL_MA=
SK),
+	REGMAP_IRQ_REG(BD73800_INT_ADC_ACCUM_TW, 0, BD73800_INT_ADC_ACCUM_TW_MASK=
),
+	REGMAP_IRQ_REG(BD73800_INT_ADC_POW_VAL, 0, BD73800_INT_ADC_POW_VAL_MASK),
+	REGMAP_IRQ_REG(BD73800_INT_RTC0, 0, BD73800_INT_RTC0_MASK),
+	REGMAP_IRQ_REG(BD73800_INT_RTC1, 0, BD73800_INT_RTC1_MASK),
+	REGMAP_IRQ_REG(BD73800_INT_RTC2, 0, BD73800_INT_RTC2_MASK),
+
+	/* BUCK reg interrupts */
+	/* INT_STAT_2 IRQs */
+	REGMAP_IRQ_REG(BD73800_INT_BUCK1_DVS_DONE, 1, BD73800_INT_BUCK1_DVS_DONE_=
MASK),
+	REGMAP_IRQ_REG(BD73800_INT_BUCK2_DVS_DONE, 1, BD73800_INT_BUCK2_DVS_DONE_=
MASK),
+	REGMAP_IRQ_REG(BD73800_INT_BUCK3_DVS_DONE, 1, BD73800_INT_BUCK3_DVS_DONE_=
MASK),
+	REGMAP_IRQ_REG(BD73800_INT_BUCK4_DVS_DONE, 1, BD73800_INT_BUCK4_DVS_DONE_=
MASK),
+	REGMAP_IRQ_REG(BD73800_INT_BUCK5_DVS_DONE, 1, BD73800_INT_BUCK5_DVS_DONE_=
MASK),
+	REGMAP_IRQ_REG(BD73800_INT_BUCK6_DVS_DONE, 1, BD73800_INT_BUCK6_DVS_DONE_=
MASK),
+	REGMAP_IRQ_REG(BD73800_INT_BUCK7_DVS_DONE, 1, BD73800_INT_BUCK7_DVS_DONE_=
MASK),
+	REGMAP_IRQ_REG(BD73800_INT_BUCK8_DVS_DONE, 1, BD73800_INT_BUCK8_DVS_DONE_=
MASK),
+	/* INT_STAT_3 IRQs */
+	REGMAP_IRQ_REG(BD73800_INT_BUCK1_OCP, 2, BD73800_INT_BUCK1_OCP_MASK),
+	REGMAP_IRQ_REG(BD73800_INT_BUCK2_OCP, 2, BD73800_INT_BUCK2_OCP_MASK),
+	REGMAP_IRQ_REG(BD73800_INT_BUCK3_OCP, 2, BD73800_INT_BUCK3_OCP_MASK),
+	REGMAP_IRQ_REG(BD73800_INT_BUCK4_OCP, 2, BD73800_INT_BUCK4_OCP_MASK),
+	REGMAP_IRQ_REG(BD73800_INT_BUCK5_OCP, 2, BD73800_INT_BUCK5_OCP_MASK),
+	REGMAP_IRQ_REG(BD73800_INT_BUCK6_OCP, 2, BD73800_INT_BUCK6_OCP_MASK),
+	REGMAP_IRQ_REG(BD73800_INT_BUCK7_OCP, 2, BD73800_INT_BUCK7_OCP_MASK),
+	REGMAP_IRQ_REG(BD73800_INT_BUCK8_OCP, 2, BD73800_INT_BUCK8_OCP_MASK),
+
+	/* INT_STAT_4 IRQs, power-button, WDG and reset */
+	REGMAP_IRQ_REG(BD73800_INT_PBTN_LONG_PRESS, 3, BD73800_INT_PBTN_LONG_PRES=
S_MASK),
+	REGMAP_IRQ_REG(BD73800_INT_PBTN_MID_PRESS, 3, BD73800_INT_PBTN_MID_PRESS_=
MASK),
+	/*
+	 * The SHORT_PUSH is generated when button is first pressed (longer
+	 * than configured time limit), and then released before the MID_PRESS
+	 * time limit. The SHORT_PRESS is generated immediately when button is
+	 * pressed for longer than configured limit, whether it is released or
+	 * not.
+	 */
+	REGMAP_IRQ_REG(BD73800_INT_PBTN_SHORT_PUSH, 3, BD73800_INT_PBTN_SHORT_PUS=
H_MASK),
+	REGMAP_IRQ_REG(BD73800_INT_PBTN_SHORT_PRESS, 3, BD73800_INT_PBTN_SHORT_PR=
ESS_MASK),
+	REGMAP_IRQ_REG(BD73800_INT_WDG, 3, BD73800_INT_WDG_MASK),
+	REGMAP_IRQ_REG(BD73800_INT_SWRESET, 3, BD73800_INT_SWRESET_MASK),
+	REGMAP_IRQ_REG(BD73800_INT_SEQ_DONE, 3, BD73800_INT_SEQ_DONE_MASK),
+
+	/* INT_STAT_5 IRQs, GPIO */
+	REGMAP_IRQ_REG(BD73800_INT_GPIO1, 4, BD73800_INT_GPIO1_MASK),
+	REGMAP_IRQ_REG(BD73800_INT_GPIO2, 4, BD73800_INT_GPIO2_MASK),
+	REGMAP_IRQ_REG(BD73800_INT_GPIO3, 4, BD73800_INT_GPIO3_MASK),
+	REGMAP_IRQ_REG(BD73800_INT_GPIO4, 4, BD73800_INT_GPIO4_MASK),
+};
+
 static const struct regmap_irq_chip bd71828_irq_chip =3D {
 	.name =3D "bd71828_irq",
 	.main_status =3D BD71828_REG_INT_MAIN,
@@ -852,6 +962,25 @@ static const struct regmap_irq_chip bd72720_irq_chip =
=3D {
 	.irq_reg_stride =3D 1,
 };
=20
+static const struct regmap_irq_chip bd73800_irq_chip =3D {
+	.name =3D "bd73800_irq",
+	.main_status =3D BD73800_REG_INT_MAIN_STAT,
+	.irqs =3D &bd73800_irqs[0],
+	.num_irqs =3D ARRAY_SIZE(bd73800_irqs),
+	.status_base =3D BD73800_REG_INT_1_STAT,
+	.unmask_base =3D BD73800_REG_INT_1_EN,
+	.ack_base =3D BD73800_REG_INT_1_STAT,
+	.init_ack_masked =3D true,
+	.num_regs =3D 5,
+	.num_main_regs =3D 1,
+	/*
+	 * Ignore mirrored bits [7:5]. They are handled as part of normal INT_4
+	 * handling.
+	 */
+	.num_main_status_bits =3D 5,
+	.irq_reg_stride =3D 1,
+};
+
 static int set_clk_mode(struct device *dev, struct regmap *regmap,
 			int clkmode_reg)
 {
@@ -987,6 +1116,17 @@ static int bd71828_i2c_probe(struct i2c_client *i2c)
 		main_lvl_val =3D BD72720_MASK_LVL1_EN_ALL;
 		break;
 	}
+	case ROHM_CHIP_TYPE_BD73800:
+		mfd =3D bd73800_mfd_cells;
+		cells =3D ARRAY_SIZE(bd73800_mfd_cells);
+		regmap_config =3D &bd73800_regmap;
+		irqchip =3D &bd73800_irq_chip;
+		clkmode_reg =3D BD73800_REG_OUT32K;
+		button_irq =3D BD73800_INT_PBTN_SHORT_PUSH;
+		main_lvl_mask_reg =3D BD73800_REG_INT_MAIN_EN;
+		main_lvl_val =3D BD73800_INT_MAIN_EN_ALL;
+		break;
+
 	default:
 		dev_err(&i2c->dev, "Unknown device type");
 		return -EINVAL;
@@ -1066,6 +1206,9 @@ static const struct of_device_id bd71828_of_match[] =
=3D {
 	}, {
 		.compatible =3D "rohm,bd72720",
 		.data =3D (void *)ROHM_CHIP_TYPE_BD72720,
+	}, {
+		.compatible =3D "rohm,bd73800",
+		.data =3D (void *)ROHM_CHIP_TYPE_BD73800,
 	 },
 	{ },
 };
diff --git a/include/linux/mfd/rohm-bd73800.h b/include/linux/mfd/rohm-bd73=
800.h
new file mode 100644
index 000000000000..4bceb20ac6b1
--- /dev/null
+++ b/include/linux/mfd/rohm-bd73800.h
@@ -0,0 +1,307 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright 2024 ROHM Semiconductors.
+ *
+ * Author: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
+ */
+
+#ifndef _MFD_BD73800_H
+#define _MFD_BD73800_H
+
+#include <linux/regmap.h>
+
+enum {
+	BD73800_BUCK1	=3D	0,
+	BD73800_BUCK2,
+	BD73800_BUCK3,
+	BD73800_BUCK4,
+	BD73800_BUCK5,
+	BD73800_BUCK6,
+	BD73800_BUCK7,
+	BD73800_BUCK8,
+	BD73800_LDO1,
+	BD73800_LDO2,
+	BD73800_LDO3,
+	BD73800_LDO4,
+};
+
+/*
+ * All regulators except BUCK 5 have full 8-bit register of valid voltage
+ * values, including 0.
+ */
+#define BD73800_NUM_VOLTS	(0xff + 1)
+/*
+ * BUCK 5 has two sets of voltage ranges, both having valid voltage select=
ors
+ * from 0x0 to 0x7f
+ */
+#define BD73800_BUCK5_VOLTS	(0x80 + 0x80)
+
+/* BD73800 interrupts */
+enum {
+	/* INT_STAT_1 register IRQs, ADC and RTC */
+	BD73800_INT_ADC_ACCUM_DONE,
+	BD73800_INT_ADC_ACCUM_OVF,
+	BD73800_INT_ADC_ACCUM_VAL,
+	BD73800_INT_ADC_ACCUM_TW,
+	BD73800_INT_ADC_POW_VAL,
+	BD73800_INT_RTC0,
+	BD73800_INT_RTC1,
+	BD73800_INT_RTC2,
+
+	/* BUCK reg interrupts */
+	/* INT_STAT_2 IRQs */
+	BD73800_INT_BUCK1_DVS_DONE,
+	BD73800_INT_BUCK2_DVS_DONE,
+	BD73800_INT_BUCK3_DVS_DONE,
+	BD73800_INT_BUCK4_DVS_DONE,
+	BD73800_INT_BUCK5_DVS_DONE,
+	BD73800_INT_BUCK6_DVS_DONE,
+	BD73800_INT_BUCK7_DVS_DONE,
+	BD73800_INT_BUCK8_DVS_DONE,
+	/* INT_STAT_3 IRQs */
+	BD73800_INT_BUCK1_OCP,
+	BD73800_INT_BUCK2_OCP,
+	BD73800_INT_BUCK3_OCP,
+	BD73800_INT_BUCK4_OCP,
+	BD73800_INT_BUCK5_OCP,
+	BD73800_INT_BUCK6_OCP,
+	BD73800_INT_BUCK7_OCP,
+	BD73800_INT_BUCK8_OCP,
+
+	/* INT_STAT_4 IRQs, power-button, WDG and reset */
+	BD73800_INT_PBTN_LONG_PRESS,
+	BD73800_INT_PBTN_MID_PRESS,
+	/*
+	 * The SHORT_PUSH is generated when button is first pressed (longer
+	 * than configured time limit), and then released before the MID_PRESS
+	 * time limit. The SHORT_PRESS is generated immediately when button is
+	 * pressed for longer than configured limit, whether it is released or
+	 * not.
+	 */
+	BD73800_INT_PBTN_SHORT_PUSH,
+	BD73800_INT_PBTN_SHORT_PRESS,
+	BD73800_INT_WDG,
+	BD73800_INT_SWRESET,
+	BD73800_INT_SEQ_DONE,
+
+	/* INT_STAT_5 IRQs, GPIO */
+	BD73800_INT_GPIO1,
+	BD73800_INT_GPIO2,
+	BD73800_INT_GPIO3,
+	BD73800_INT_GPIO4,
+};
+
+#define BD73800_MASK_RUN_EN		BIT(2)
+#define BD73800_MASK_SUSP_EN		BIT(1)
+#define BD73800_MASK_IDLE_EN		BIT(0)
+#define BD73800_MASK_VOLT		GENMASK(7, 0)
+#define BD73800_MASK_BUCK5_VOLT		GENMASK(6, 0)
+#define BD73800_MASK_RAMP_DELAY		GENMASK(2, 1)
+#define BD73800_BUCK5_RANGE_MASK	BIT(7)
+
+/* BD73800 registers */
+enum {
+	BD73800_REG_PRODUCT_ID	=3D 0x0,
+	BD73800_REG_MANUFACTURER_ID,
+	BD73800_REG_REVISION,
+	BD73800_REG_NVMVERSION,
+	BD73800_REG_POR_REASON,
+	BD73800_REG_RESET_REASON1,
+	BD73800_REG_RESET_REASON2,
+	BD73800_REG_RESET_REASON3,
+	BD73800_REG_POW_STATE,
+	BD73800_REG_WRST_SEL,
+	BD73800_REG_PS_CTRL_1,
+	BD73800_REG_PS_CTRL_2,
+	BD73800_REG_RCVCFG,
+	BD73800_REG_RCVNUM,
+	BD73800_REG_CRDCFG, /* 0x0f, followed by undocumented reg */
+
+	BD73800_REG_BUCK1_ON =3D 0x11,
+	BD73800_REG_BUCK1_MODE,
+	BD73800_REG_BUCK1_VOLT_RUN,
+	BD73800_REG_BUCK1_VOLT_IDLE,
+	BD73800_REG_BUCK1_VOLT_SUSP, /* 0x15, followed by undocumented reg */
+
+	BD73800_REG_BUCK2_ON =3D 0x17,
+	BD73800_REG_BUCK2_MODE,
+	BD73800_REG_BUCK2_VOLT_RUN,
+	BD73800_REG_BUCK2_VOLT_IDLE,
+	BD73800_REG_BUCK2_VOLT_SUSP, /* 0x1b */
+
+	BD73800_REG_BUCK3_ON =3D 0x1d,
+	BD73800_REG_BUCK3_MODE,
+	BD73800_REG_BUCK3_VOLT_RUN,
+	BD73800_REG_BUCK3_VOLT_IDLE,
+	BD73800_REG_BUCK3_VOLT_SUSP, /* 0x21 */
+
+	BD73800_REG_BUCK4_ON =3D 0x23,
+	BD73800_REG_BUCK4_MODE,
+	BD73800_REG_BUCK4_VOLT_RUN,
+	BD73800_REG_BUCK4_VOLT_IDLE,
+	BD73800_REG_BUCK4_VOLT_SUSP, /* 0x27 */
+
+	BD73800_REG_BUCK5_ON =3D 0x29,
+	BD73800_REG_BUCK5_MODE,
+	BD73800_REG_BUCK5_VOLT_RUN,
+	BD73800_REG_BUCK5_VOLT_IDLE,
+	BD73800_REG_BUCK5_VOLT_SUSP, /* 0x2d */
+
+	BD73800_REG_BUCK6_ON =3D 0x2f,
+	BD73800_REG_BUCK6_MODE,
+	BD73800_REG_BUCK6_VOLT_RUN,
+	BD73800_REG_BUCK6_VOLT_IDLE,
+	BD73800_REG_BUCK6_VOLT_SUSP, /* 0x33 */
+
+	BD73800_REG_BUCK7_ON =3D 0x35,
+	BD73800_REG_BUCK7_MODE,
+	BD73800_REG_BUCK7_VOLT_RUN,
+	BD73800_REG_BUCK7_VOLT_IDLE,
+	BD73800_REG_BUCK7_VOLT_SUSP, /* 0x39 */
+
+	BD73800_REG_BUCK8_ON =3D 0x3b,
+	BD73800_REG_BUCK8_MODE,
+	BD73800_REG_BUCK8_VOLT_RUN,
+	BD73800_REG_BUCK8_VOLT_IDLE,
+	BD73800_REG_BUCK8_VOLT_SUSP, /* 0x3f */
+
+	BD73800_REG_LDO1_ON =3D 0x41,
+	BD73800_REG_LDO1_VOLT,
+	BD73800_REG_LDO1_MODE,
+	BD73800_REG_LDO2_ON,
+	BD73800_REG_LDO2_VOLT,
+	BD73800_REG_LDO2_MODE,
+	BD73800_REG_LDO3_ON,
+	BD73800_REG_LDO3_VOLT,
+	BD73800_REG_LDO3_MODE,
+	BD73800_REG_LDO4_ON,
+	BD73800_REG_LDO4_VOLT,
+	BD73800_REG_LDO4_MODE, /* 0x4c */
+
+	BD73800_REG_GPO_OUT =3D 0x4e,
+	BD73800_REG_OUT32K =3D 0x50,
+	BD73800_REG_RTC_SEC,
+	BD73800_REG_RTC_MIN,
+	BD73800_REG_RTC_HOUR,
+	BD73800_REG_RTC_WEEK,
+	BD73800_REG_RTC_DAY,
+	BD73800_REG_RTC_MONTH,
+	BD73800_REG_RTC_YEAR,
+	BD73800_REG_RTC_ALM0_SEC,
+	BD73800_REG_RTC_ALM0_MIN,
+	BD73800_REG_RTC_ALM0_HOUR,
+	BD73800_REG_RTC_ALM0_WEEK,
+	BD73800_REG_RTC_ALM0_DAY,
+	BD73800_REG_RTC_ALM0_MONTH,
+	BD73800_REG_RTC_ALM0_YEAR,
+	BD73800_REG_RTC_ALM1_SEC,
+	BD73800_REG_RTC_ALM1_MIN,
+	BD73800_REG_RTC_ALM1_HOUR,
+	BD73800_REG_RTC_ALM1_WEEK,
+	BD73800_REG_RTC_ALM1_DAY,
+	BD73800_REG_RTC_ALM1_MONTH,
+	BD73800_REG_RTC_ALM1_YEAR,
+	BD73800_REG_RTC_ALM2,
+	BD73800_REG_RTC_CONF, /* 0x69 */
+
+	BD73800_REG_ADC_CTRL_1 =3D 0x6b,
+	BD73800_REG_ADC_CTRL_2,
+	BD73800_REG_ADC_ACCUM_NUM2,
+	BD73800_REG_ADC_ACCUM_NUM1,
+	BD73800_REG_ADC_ACCUM_NUM0,
+	BD73800_REG_ADC_ACCUM_KICK,
+	BD73800_REG_ADC_ACCUM_CNT2,
+	BD73800_REG_ADC_ACCUM_CNT1,
+	BD73800_REG_ADC_ACCUM_CNT0,
+	BD73800_REG_ADC_ACCUM_VAL2,
+	BD73800_REG_ADC_ACCUM_VAL1,
+	BD73800_REG_ADC_ACCUM_VAL0,
+	BD73800_REG_ADC_VOL_VAL1,
+	BD73800_REG_ADC_VOL_VAL0,
+	BD73800_REG_ADC_CUR_VAL1,
+	BD73800_REG_ADC_CUR_VAL0,
+	BD73800_REG_ADC_POW_VAL1,
+	BD73800_REG_ADC_POW_VAL0,
+	BD73800_REG_ADC_TEMP_VAL1,
+	BD73800_REG_ADC_TEMP_VAL0,
+	BD73800_REG_ADC_ACCUM_VAL_INT_TH4,
+	BD73800_REG_ADC_ACCUM_VAL_INT_TH3,
+	BD73800_REG_ADC_ACCUM_VAL_INT_TH2,
+	BD73800_REG_ADC_ACCUM_VAL_INT_TH1,
+	BD73800_REG_ADC_ACCUM_VAL_INT_TH0,
+	BD73800_REG_ADC_WARN_TEMP_INT_TH1,
+	BD73800_REG_ADC_WARN_TEMP_INT_TH0,
+	BD73800_REG_ADC_POW_VAL_INT_TH1,
+	BD73800_REG_ADC_POW_VAL_INT_TH0, /* 0x89 */
+
+	BD73800_REG_PBTN_CONF =3D 0x8b,
+
+	BD73800_REG_INT_MAIN_EN =3D 0x8f,
+	BD73800_REG_INT_1_EN,
+	BD73800_REG_INT_2_EN,
+	BD73800_REG_INT_3_EN,
+	BD73800_REG_INT_4_EN,
+	BD73800_REG_INT_5_EN, /* 0x94 */
+
+	BD73800_REG_INT_MAIN_STAT =3D 0x96,
+	BD73800_REG_INT_1_STAT,
+	BD73800_REG_INT_2_STAT,
+	BD73800_REG_INT_3_STAT,
+	BD73800_REG_INT_4_STAT,
+	BD73800_REG_INT_5_STAT, /* 0x9b */
+
+	BD73800_REG_INT_MAIN_SRC =3D 0x9d,
+	BD73800_REG_INT_1_SRC,
+	BD73800_REG_INT_2_SRC,
+	BD73800_REG_INT_3_SRC,
+	BD73800_REG_INT_4_SRC,
+	BD73800_REG_INT_5_SRC, /* 0xa2 */
+
+	BD73800_REG_RST_MASK =3D 0xaf,
+	BD73800_MAX_REGISTER,
+};
+
+#define BD73800_REG_RTC_START			BD73800_REG_RTC_SEC
+#define BD73800_REG_RTC_ALM_START		BD73800_REG_RTC_ALM0_SEC
+
+/* BD73800 IRQ register masks */
+
+#define BD73800_INT_MAIN_EN_ALL			GENMASK(4, 0)
+#define BD73800_INT_ADC_ACCUM_DONE_MASK		BIT(0)
+#define BD73800_INT_ADC_ACCUM_OVF_MASK		BIT(1)
+#define BD73800_INT_ADC_ACCUM_VAL_MASK		BIT(2)
+#define BD73800_INT_ADC_ACCUM_TW_MASK		BIT(3)
+#define BD73800_INT_ADC_POW_VAL_MASK		BIT(4)
+#define BD73800_INT_RTC0_MASK			BIT(5)
+#define BD73800_INT_RTC1_MASK			BIT(6)
+#define BD73800_INT_RTC2_MASK			BIT(7)
+#define BD73800_INT_BUCK1_DVS_DONE_MASK		BIT(0)
+#define BD73800_INT_BUCK2_DVS_DONE_MASK		BIT(1)
+#define BD73800_INT_BUCK3_DVS_DONE_MASK		BIT(2)
+#define BD73800_INT_BUCK4_DVS_DONE_MASK		BIT(3)
+#define BD73800_INT_BUCK5_DVS_DONE_MASK		BIT(4)
+#define BD73800_INT_BUCK6_DVS_DONE_MASK		BIT(5)
+#define BD73800_INT_BUCK7_DVS_DONE_MASK		BIT(6)
+#define BD73800_INT_BUCK8_DVS_DONE_MASK		BIT(7)
+#define BD73800_INT_BUCK1_OCP_MASK		BIT(0)
+#define BD73800_INT_BUCK2_OCP_MASK		BIT(1)
+#define BD73800_INT_BUCK3_OCP_MASK		BIT(2)
+#define BD73800_INT_BUCK4_OCP_MASK		BIT(3)
+#define BD73800_INT_BUCK5_OCP_MASK		BIT(4)
+#define BD73800_INT_BUCK6_OCP_MASK		BIT(5)
+#define BD73800_INT_BUCK7_OCP_MASK		BIT(6)
+#define BD73800_INT_BUCK8_OCP_MASK		BIT(7)
+#define BD73800_INT_PBTN_LONG_PRESS_MASK	BIT(0)
+#define BD73800_INT_PBTN_MID_PRESS_MASK		BIT(1)
+#define BD73800_INT_PBTN_SHORT_PUSH_MASK	BIT(2)
+#define BD73800_INT_PBTN_SHORT_PRESS_MASK	BIT(3)
+#define BD73800_INT_WDG_MASK			BIT(4)
+#define BD73800_INT_SWRESET_MASK		BIT(5)
+#define BD73800_INT_SEQ_DONE_MASK		BIT(6)
+#define BD73800_INT_GPIO1_MASK			BIT(0)
+#define BD73800_INT_GPIO2_MASK			BIT(1)
+#define BD73800_INT_GPIO3_MASK			BIT(2)
+#define BD73800_INT_GPIO4_MASK			BIT(3)
+
+#endif /* _MFD_BD73800_H */
+
diff --git a/include/linux/mfd/rohm-generic.h b/include/linux/mfd/rohm-gene=
ric.h
index 0a284919a6c3..3ec87428ee97 100644
--- a/include/linux/mfd/rohm-generic.h
+++ b/include/linux/mfd/rohm-generic.h
@@ -17,6 +17,7 @@ enum rohm_chip_type {
 	ROHM_CHIP_TYPE_BD71837,
 	ROHM_CHIP_TYPE_BD71847,
 	ROHM_CHIP_TYPE_BD72720,
+	ROHM_CHIP_TYPE_BD73800,
 	ROHM_CHIP_TYPE_BD96801,
 	ROHM_CHIP_TYPE_BD96802,
 	ROHM_CHIP_TYPE_BD96805,
--=20
2.54.0


--gdsKCu9rD6rUveDm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmpFCxMACgkQeFA3/03a
ocXH3Qf/TG7+cNVTsEDXCA8n0AWnqJeIMF0LMvXVuXnZKIEMQBssbJzWRi+/WBt4
7KuHuZGm2kiOT2nk7sdu80cP9Zjw+vKYmRJV6QUnoHGb0GZI/v/7UFIFKzKIjIS4
ZgCGcC5AZrakuwXAjq6IqWbsrrT872y7i+lKmNwbvVbRQg/wdFkC7nI/Fpf9mx42
qJ1JBIWFe+BogIx48OWcfdWeDprpuzLCD0NMLh74toc4XLAh0pStQHhvgC5qkNFX
EO1hFGkPBucJHnWx0htvulzKuro8flXBf1Ght8z1bRjzC608/wyvyNhtd3a+orcN
8KhsYnuAoAz39az7aR2ph2jZ/K3xbw==
=KAoW
-----END PGP SIGNATURE-----

--gdsKCu9rD6rUveDm--

