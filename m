Return-Path: <linux-gpio+bounces-39320-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id teXLN04ORWom6AoAu9opvQ
	(envelope-from <linux-gpio+bounces-39320-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 14:55:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC8C6EDA62
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 14:55:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=vvDjfoi5;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39320-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39320-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9C27330FD3D
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 12:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B53E348AE28;
	Wed,  1 Jul 2026 12:43:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176F147F2F4
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 12:43:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909784; cv=none; b=D4nULAEbvxpYX+TNO7lhJgfc7WZoAfxJGeGrkIZkKBr2tiLAy89+YuGXK7h22Vk5G1TFQRjidhedzJ0NmdZ+Bl3heqNmjWJCoMpB92HKAnCGfTxJP5Qjfxj6LnN0n3hrCr4MsZHZDGLjBztlSeaS3Qm1P2F/eCoYNf5oNM6G3i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909784; c=relaxed/simple;
	bh=Gu9H0RtSZmtOGQcZKs96XirqF+I9Zymkk8Ym1l0t3ZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H1yKPRjyg3E28CdDCoLcC8hzLviUHJ/38SMPMfMgJRXGKYuAROhQxf1zVFuSbxMdTJyMyZAY78H/a0j4H6aYF+MXZSuOzwNpWeA5y7ufGYh64rGBWGES2hJ3YwupbFAKboOrDlYEdVZ/nxvbajMVnSjWKQVbH8R9Tjv4DZD4/ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vvDjfoi5; arc=none smtp.client-ip=95.215.58.187
Date: Wed, 1 Jul 2026 15:42:35 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782909780; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=+deONOdBVGHFnE//figqc84i1+n+HuN49nL4vj4DlgA=;
	b=vvDjfoi5peTY/JjFc04BkshaaSdaRyWr+/YVhxzS0T3f4XuidEAXSjYvdtz+AnggEy5JAj
	WwUjlsLPhgF/DC+LeX0wpL5LsIsMaVommtmpMP4RTV4s8xPgNKSlXy1E0byAFJiR4qBXUx
	+CxPdlL7UmeDJb8r6tf45Fz8J1F1boo=
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
Subject: [PATCH 5/8] regulator: bd71828: Support ROHM BD73800
Message-ID: <1d00359236272fd1fab0dfbcb9119d2f91aa0d23.1782909323.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1782909323.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KUI/PnXIqYlDsLZA"
Content-Disposition: inline
In-Reply-To: <cover.1782909323.git.mazziesaccount@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.24 / 15.00];
	SIGNED_PGP(-2.00)[];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-39320-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mazziesaccount@gmail.com,m:matti.vaittinen@fi.rohmeurope.com,m:matti.vaittinen@linux.dev,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linusw@kernel.org,m:brgl@kernel.org,m:alexandre.belloni@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,fi.rohmeurope.com,linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[matti.vaittinen@linux.dev,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[mazziesaccount@gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matti.vaittinen@linux.dev,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,redhat.com,bootlin.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[linux.dev:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3AC8C6EDA62


--KUI/PnXIqYlDsLZA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

The ROHM BD73800 is a power management IC which integrates 8 BUCKs and 4
LDOs. The PMIC has internal state-machine and it can support transitions
to RUN, SUSPEND and IDLE states. The LDOs 1 and 3 have two different
voltage range configurations that can be set at the manufacturing phase
by OTP. By default driver assumes low voltage ranges to be used because
the data-sheet indicates the higher voltage ranges to be an 'OTP option'.
The high voltage range can be indicated via device-tree property.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
 drivers/regulator/Kconfig             |   4 +-
 drivers/regulator/bd71828-regulator.c | 555 +++++++++++++++++++++++++-
 2 files changed, 556 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index a54a549196fe..0e5a3994f49d 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -241,12 +241,12 @@ config REGULATOR_BD71815
 	  will be called bd71815-regulator.
=20
 config REGULATOR_BD71828
-	tristate "ROHM BD71828, BD72720 and BD73900 Power Regulators"
+	tristate "ROHM BD71828, BD72720 and BD73[8/9]00 Power Regulators"
 	depends on MFD_ROHM_BD71828
 	select REGULATOR_ROHM
 	help
 	  This driver supports voltage regulators on ROHM BD71828,
-	  BD71879, BD72720 and BD73900 PMICs. This will enable
+	  BD71879, BD72720 and BD73[8/9]00 PMICs. This will enable
 	  support for the software controllable buck and LDO regulators.
=20
 	  This driver can also be built as a module. If so, the module
diff --git a/drivers/regulator/bd71828-regulator.c b/drivers/regulator/bd71=
828-regulator.c
index bd61caa8284a..89738953f8b5 100644
--- a/drivers/regulator/bd71828-regulator.c
+++ b/drivers/regulator/bd71828-regulator.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (C) 2019 ROHM Semiconductors
 // bd71828-regulator.c ROHM BD71828GW-DS1 regulator driver
-//
=20
 #include <linux/cleanup.h>
 #include <linux/delay.h>
@@ -10,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/mfd/rohm-bd71828.h>
 #include <linux/mfd/rohm-bd72720.h>
+#include <linux/mfd/rohm-bd73800.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/of.h>
@@ -32,6 +32,13 @@ struct bd71828_regulator_data {
 	int reg_init_amnt;
 };
=20
+/*
+ * LDO1 and LDO3 node names are used also in the driver to find OTP settin=
g for
+ * the used voltage range.
+ */
+#define LDO1_NODE_NAME "ldo1"
+#define LDO3_NODE_NAME "ldo3"
+
 static const struct reg_init bd71828_buck1_inits[] =3D {
 	/*
 	 * DVS Buck voltages can be changed by register values or via GPIO.
@@ -173,6 +180,54 @@ static const struct linear_range bd72720_ldo6_volts[] =
=3D {
 	REGULATOR_LINEAR_RANGE(1800000, 0x79, 0x7f, 0),
 };
=20
+static const struct linear_range bd73800_buck12348_volts[] =3D {
+	REGULATOR_LINEAR_RANGE(500000, 0x00, 0x50, 10000),
+	REGULATOR_LINEAR_RANGE(1300000, 0x51, 0xff, 0),
+};
+
+static const unsigned int bd73800_buck5_volt_range_sel[] =3D {
+	0x0, 0x0, 0x1, 0x1,
+};
+
+static const struct linear_range bd73800_buck5_volts[] =3D {
+	/* range selector 0 */
+	REGULATOR_LINEAR_RANGE(500000, 0x00, 0x50, 10000),
+	REGULATOR_LINEAR_RANGE(1300000, 0x51, 0x7f, 0),
+	/* range selector 1 */
+	REGULATOR_LINEAR_RANGE(300000, 0x00, 0x46, 10000),
+	REGULATOR_LINEAR_RANGE(1000000, 0x47, 0x7f, 0),
+};
+/*
+ * iBUCK5 has two different pickable ranges, each having voltages matching
+ * selectors 0x0 to 0x7f. This gives 0x7f + 1 different voltages for each =
of
+ * the ranges.
+ */
+#define BD73800_NUM_BUCK5_VOLTS ((0x7f + 1) * 2)
+
+static const struct linear_range bd73800_buck67_volts[] =3D {
+	REGULATOR_LINEAR_RANGE(1500000, 0x00, 0xc8, 10000),
+	REGULATOR_LINEAR_RANGE(3500000, 0xc9, 0xff, 0),
+};
+
+/*
+ * On the BD73800 the LDO1 and LDO3 support two different voltage areas.
+ * Whether to use 'high' or 'low' ranges is configured by OTP. There seems
+ * to be no register to read the configured area so it must be given via
+ * device-tree properties.
+ */
+static const struct linear_range bd73800_ldo13_low_volts[] =3D {
+	REGULATOR_LINEAR_RANGE(600000, 0x00, 0x78, 10000),
+	REGULATOR_LINEAR_RANGE(1800000, 0x79, 0xff, 0),
+};
+
+static const struct linear_range bd73800_ldo13_high_volts[] =3D {
+	REGULATOR_LINEAR_RANGE(750000, 0x00, 0xff, 10000),
+};
+
+static const struct linear_range bd73800_ldo24_volts[] =3D {
+	REGULATOR_LINEAR_RANGE(750000, 0x00, 0xff, 10000),
+};
+
 static const unsigned int bd71828_ramp_delay[] =3D { 2500, 5000, 10000, 20=
000 };
=20
 /*
@@ -226,6 +281,36 @@ static int bd71828_ldo6_parse_dt(struct device_node *n=
p,
 	return 0;
 }
=20
+/* Operations for all other BUCKs but BUCK 5 */
+static const struct regulator_ops bd73800_buck_ops =3D {
+	.enable =3D regulator_enable_regmap,
+	.disable =3D regulator_disable_regmap,
+	.is_enabled =3D regulator_is_enabled_regmap,
+	.list_voltage =3D regulator_list_voltage_linear_range,
+	.set_voltage_sel =3D regulator_set_voltage_sel_regmap,
+	.get_voltage_sel =3D regulator_get_voltage_sel_regmap,
+	.set_ramp_delay =3D regulator_set_ramp_delay_regmap,
+};
+
+static const struct regulator_ops bd73800_buck5_ops =3D {
+	.enable =3D regulator_enable_regmap,
+	.disable =3D regulator_disable_regmap,
+	.is_enabled =3D regulator_is_enabled_regmap,
+	.list_voltage =3D regulator_list_voltage_pickable_linear_range,
+	.set_voltage_sel =3D regulator_set_voltage_sel_pickable_regmap,
+	.get_voltage_sel =3D regulator_get_voltage_sel_pickable_regmap,
+	.set_ramp_delay =3D regulator_set_ramp_delay_regmap,
+};
+
+static const struct regulator_ops bd73800_ldo_ops =3D {
+	.enable =3D regulator_enable_regmap,
+	.disable =3D regulator_disable_regmap,
+	.is_enabled =3D regulator_is_enabled_regmap,
+	.list_voltage =3D regulator_list_voltage_linear_range,
+	.set_voltage_sel =3D regulator_set_voltage_sel_regmap,
+	.get_voltage_sel =3D regulator_get_voltage_sel_regmap,
+};
+
 static const struct regulator_ops bd71828_buck_ops =3D {
 	.enable =3D regulator_enable_regmap,
 	.disable =3D regulator_disable_regmap,
@@ -1566,6 +1651,412 @@ static const struct bd71828_regulator_data bd72720_=
rdata[] =3D {
 	},
 };
=20
+static const struct bd71828_regulator_data bd73800_rdata[] =3D {
+	{
+		.desc =3D {
+			.name =3D "buck1",
+			.of_match =3D of_match_ptr("buck1"),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD73800_BUCK1,
+			.ops =3D &bd73800_buck_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd73800_buck12348_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd73800_buck12348_volts),
+			.n_voltages =3D BD73800_NUM_VOLTS,
+			.enable_reg =3D BD73800_REG_BUCK1_ON,
+			.enable_mask =3D BD73800_MASK_RUN_EN,
+			.vsel_reg =3D BD73800_REG_BUCK1_VOLT_RUN,
+			.vsel_mask =3D BD73800_MASK_VOLT,
+			.ramp_delay_table =3D bd71828_ramp_delay,
+			.n_ramp_values =3D ARRAY_SIZE(bd71828_ramp_delay),
+			.ramp_reg =3D BD73800_REG_BUCK1_MODE,
+			.ramp_mask =3D BD73800_MASK_RAMP_DELAY,
+			.owner =3D THIS_MODULE,
+			.of_parse_cb =3D buck_set_hw_dvs_levels,
+		},
+		.dvs =3D {
+			.level_map =3D ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND,
+			.run_reg =3D BD73800_REG_BUCK1_VOLT_RUN,
+			.run_mask =3D BD73800_MASK_VOLT,
+			.idle_reg =3D BD73800_REG_BUCK1_VOLT_IDLE,
+			.idle_mask =3D BD73800_MASK_VOLT,
+			.idle_on_mask =3D BD73800_MASK_IDLE_EN,
+			.suspend_reg =3D BD73800_REG_BUCK1_VOLT_SUSP,
+			.suspend_mask =3D BD73800_MASK_VOLT,
+			.suspend_on_mask =3D BD73800_MASK_SUSP_EN,
+		},
+	}, {
+		.desc =3D {
+			.name =3D "buck2",
+			.of_match =3D of_match_ptr("buck2"),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD73800_BUCK2,
+			.ops =3D &bd73800_buck_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd73800_buck12348_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd73800_buck12348_volts),
+			.n_voltages =3D BD73800_NUM_VOLTS,
+			.enable_reg =3D BD73800_REG_BUCK2_ON,
+			.enable_mask =3D BD73800_MASK_RUN_EN,
+			.vsel_reg =3D BD73800_REG_BUCK2_VOLT_RUN,
+			.vsel_mask =3D BD73800_MASK_VOLT,
+			.ramp_delay_table =3D bd71828_ramp_delay,
+			.n_ramp_values =3D ARRAY_SIZE(bd71828_ramp_delay),
+			.ramp_reg =3D BD73800_REG_BUCK2_MODE,
+			.ramp_mask =3D BD73800_MASK_RAMP_DELAY,
+			.owner =3D THIS_MODULE,
+			.of_parse_cb =3D buck_set_hw_dvs_levels,
+		},
+		.dvs =3D {
+			.level_map =3D ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND,
+			.run_reg =3D BD73800_REG_BUCK2_VOLT_RUN,
+			.run_mask =3D BD73800_MASK_VOLT,
+			.idle_reg =3D BD73800_REG_BUCK2_VOLT_IDLE,
+			.idle_mask =3D BD73800_MASK_VOLT,
+			.idle_on_mask =3D BD73800_MASK_IDLE_EN,
+			.suspend_reg =3D BD73800_REG_BUCK2_VOLT_SUSP,
+			.suspend_mask =3D BD73800_MASK_VOLT,
+			.suspend_on_mask =3D BD73800_MASK_SUSP_EN,
+		},
+	}, {
+		.desc =3D {
+			.name =3D "buck3",
+			.of_match =3D of_match_ptr("buck3"),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD73800_BUCK3,
+			.ops =3D &bd73800_buck_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd73800_buck12348_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd73800_buck12348_volts),
+			.n_voltages =3D BD73800_NUM_VOLTS,
+			.enable_reg =3D BD73800_REG_BUCK3_ON,
+			.enable_mask =3D BD73800_MASK_RUN_EN,
+			.vsel_reg =3D BD73800_REG_BUCK3_VOLT_RUN,
+			.vsel_mask =3D BD73800_MASK_VOLT,
+			.ramp_delay_table =3D bd71828_ramp_delay,
+			.n_ramp_values =3D ARRAY_SIZE(bd71828_ramp_delay),
+			.ramp_reg =3D BD73800_REG_BUCK3_MODE,
+			.ramp_mask =3D BD73800_MASK_RAMP_DELAY,
+			.owner =3D THIS_MODULE,
+			.of_parse_cb =3D buck_set_hw_dvs_levels,
+		},
+		.dvs =3D {
+			.level_map =3D ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND,
+			.run_reg =3D BD73800_REG_BUCK3_VOLT_RUN,
+			.run_mask =3D BD73800_MASK_VOLT,
+			.idle_reg =3D BD73800_REG_BUCK3_VOLT_IDLE,
+			.idle_mask =3D BD73800_MASK_VOLT,
+			.idle_on_mask =3D BD73800_MASK_IDLE_EN,
+			.suspend_reg =3D BD73800_REG_BUCK3_VOLT_SUSP,
+			.suspend_mask =3D BD73800_MASK_VOLT,
+			.suspend_on_mask =3D BD73800_MASK_SUSP_EN,
+		},
+
+	}, {
+		.desc =3D {
+			.name =3D "buck4",
+			.of_match =3D of_match_ptr("buck4"),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD73800_BUCK4,
+			.ops =3D &bd73800_buck_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd73800_buck12348_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd73800_buck12348_volts),
+			.n_voltages =3D BD73800_NUM_VOLTS,
+			.enable_reg =3D BD73800_REG_BUCK4_ON,
+			.enable_mask =3D BD73800_MASK_RUN_EN,
+			.vsel_reg =3D BD73800_REG_BUCK4_VOLT_RUN,
+			.vsel_mask =3D BD73800_MASK_VOLT,
+			.ramp_delay_table =3D bd71828_ramp_delay,
+			.n_ramp_values =3D ARRAY_SIZE(bd71828_ramp_delay),
+			.ramp_reg =3D BD73800_REG_BUCK4_MODE,
+			.ramp_mask =3D BD73800_MASK_RAMP_DELAY,
+			.owner =3D THIS_MODULE,
+			.of_parse_cb =3D buck_set_hw_dvs_levels,
+		},
+		.dvs =3D {
+			.level_map =3D ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND,
+			.run_reg =3D BD73800_REG_BUCK4_VOLT_RUN,
+			.run_mask =3D BD73800_MASK_VOLT,
+			.idle_reg =3D BD73800_REG_BUCK4_VOLT_IDLE,
+			.idle_mask =3D BD73800_MASK_VOLT,
+			.idle_on_mask =3D BD73800_MASK_IDLE_EN,
+			.suspend_reg =3D BD73800_REG_BUCK4_VOLT_SUSP,
+			.suspend_mask =3D BD73800_MASK_VOLT,
+			.suspend_on_mask =3D BD73800_MASK_SUSP_EN,
+		},
+	}, {
+		.desc =3D {
+			.name =3D "buck5",
+			.of_match =3D of_match_ptr("buck5"),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD73800_BUCK5,
+			.ops =3D &bd73800_buck5_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd73800_buck5_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd73800_buck5_volts),
+			.linear_range_selectors_bitfield =3D
+						bd73800_buck5_volt_range_sel,
+			.n_voltages =3D BD73800_NUM_BUCK5_VOLTS,
+			.enable_reg =3D BD73800_REG_BUCK5_ON,
+			.enable_mask =3D BD73800_MASK_RUN_EN,
+			.vsel_reg =3D BD73800_REG_BUCK5_VOLT_RUN,
+			.vsel_mask =3D BD73800_MASK_VOLT,
+			.vsel_range_reg =3D BD73800_REG_BUCK5_MODE,
+			.vsel_range_mask =3D BD73800_BUCK5_RANGE_MASK,
+			.range_applied_by_vsel =3D true,
+			.ramp_delay_table =3D bd71828_ramp_delay,
+			.n_ramp_values =3D ARRAY_SIZE(bd71828_ramp_delay),
+			.ramp_reg =3D BD73800_REG_BUCK5_MODE,
+			.ramp_mask =3D BD73800_MASK_RAMP_DELAY,
+			.owner =3D THIS_MODULE,
+		},
+		.dvs =3D {
+			/*
+			 * We don't support setting the IDLE / SUSPEND voltages
+			 * for the BUCK 5 for now. Reason is that the pickable
+			 * range selector bit is common for all states (RUN,
+			 * SUSPEND and IDLE), and toggling it for one impacts
+			 * also others.
+			 * Furthermore, writing the BD73800 range selector does
+			 * not impact the RUN voltage until a new voltage value
+			 * is also written to the vsel register. Hence the
+			 * voltage change can be done without any 'intermediate
+			 * voltages', even when the range is changed when the
+			 * BUCK is enabled.
+			 * It, however, is not documented how the IDLE / SUSPEND
+			 * states work in this regard. I expect the full
+			 * combination of the range selector and vsel is taken
+			 * into account at the state change, no matter when they
+			 * have been written to.
+			 */
+			.level_map =3D ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND,
+			.run_reg =3D BD73800_REG_BUCK5_VOLT_RUN,
+			.run_mask =3D BD73800_MASK_VOLT,
+			.idle_on_mask =3D BD73800_MASK_IDLE_EN,
+			.suspend_on_mask =3D BD73800_MASK_SUSP_EN,
+		},
+
+	}, {
+		.desc =3D {
+			.name =3D "buck6",
+			.of_match =3D of_match_ptr("buck6"),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD73800_BUCK6,
+			.ops =3D &bd73800_buck_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd73800_buck67_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd73800_buck67_volts),
+			.n_voltages =3D BD73800_NUM_VOLTS,
+			.enable_reg =3D BD73800_REG_BUCK6_ON,
+			.enable_mask =3D BD73800_MASK_RUN_EN,
+			.vsel_reg =3D BD73800_REG_BUCK6_VOLT_RUN,
+			.vsel_mask =3D BD73800_MASK_VOLT,
+			.ramp_delay_table =3D bd71828_ramp_delay,
+			.n_ramp_values =3D ARRAY_SIZE(bd71828_ramp_delay),
+			.ramp_reg =3D BD73800_REG_BUCK6_MODE,
+			.ramp_mask =3D BD73800_MASK_RAMP_DELAY,
+			.owner =3D THIS_MODULE,
+			.of_parse_cb =3D buck_set_hw_dvs_levels,
+		},
+		.dvs =3D {
+			.level_map =3D ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND,
+			.run_reg =3D BD73800_REG_BUCK6_VOLT_RUN,
+			.run_mask =3D BD73800_MASK_VOLT,
+			.idle_reg =3D BD73800_REG_BUCK6_VOLT_IDLE,
+			.idle_mask =3D BD73800_MASK_VOLT,
+			.idle_on_mask =3D BD73800_MASK_IDLE_EN,
+			.suspend_reg =3D BD73800_REG_BUCK6_VOLT_SUSP,
+			.suspend_mask =3D BD73800_MASK_VOLT,
+			.suspend_on_mask =3D BD73800_MASK_SUSP_EN,
+		},
+	}, {
+		.desc =3D {
+			.name =3D "buck7",
+			.of_match =3D of_match_ptr("buck7"),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD73800_BUCK7,
+			.ops =3D &bd73800_buck_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd73800_buck67_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd73800_buck67_volts),
+			.n_voltages =3D BD73800_NUM_VOLTS,
+			.enable_reg =3D BD73800_REG_BUCK7_ON,
+			.enable_mask =3D BD73800_MASK_RUN_EN,
+			.vsel_reg =3D BD73800_REG_BUCK7_VOLT_RUN,
+			.vsel_mask =3D BD73800_MASK_VOLT,
+			.ramp_delay_table =3D bd71828_ramp_delay,
+			.n_ramp_values =3D ARRAY_SIZE(bd71828_ramp_delay),
+			.ramp_reg =3D BD73800_REG_BUCK7_MODE,
+			.ramp_mask =3D BD73800_MASK_RAMP_DELAY,
+			.owner =3D THIS_MODULE,
+			.of_parse_cb =3D buck_set_hw_dvs_levels,
+		},
+		.dvs =3D {
+			.level_map =3D ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND,
+			.run_reg =3D BD73800_REG_BUCK7_VOLT_RUN,
+			.run_mask =3D BD73800_MASK_VOLT,
+			.idle_reg =3D BD73800_REG_BUCK7_VOLT_IDLE,
+			.idle_mask =3D BD73800_MASK_VOLT,
+			.idle_on_mask =3D BD73800_MASK_IDLE_EN,
+			.suspend_reg =3D BD73800_REG_BUCK7_VOLT_SUSP,
+			.suspend_mask =3D BD73800_MASK_VOLT,
+			.suspend_on_mask =3D BD73800_MASK_SUSP_EN,
+		},
+	}, {
+		.desc =3D {
+			.name =3D "buck8",
+			.of_match =3D of_match_ptr("buck8"),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD73800_BUCK8,
+			.ops =3D &bd73800_buck_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd73800_buck12348_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd73800_buck12348_volts),
+			.n_voltages =3D BD73800_NUM_VOLTS,
+			.enable_reg =3D BD73800_REG_BUCK8_ON,
+			.enable_mask =3D BD73800_MASK_RUN_EN,
+			.vsel_reg =3D BD73800_REG_BUCK8_VOLT_RUN,
+			.vsel_mask =3D BD73800_MASK_VOLT,
+			.ramp_delay_table =3D bd71828_ramp_delay,
+			.n_ramp_values =3D ARRAY_SIZE(bd71828_ramp_delay),
+			.ramp_reg =3D BD73800_REG_BUCK8_MODE,
+			.ramp_mask =3D BD73800_MASK_RAMP_DELAY,
+			.owner =3D THIS_MODULE,
+			.of_parse_cb =3D buck_set_hw_dvs_levels,
+		},
+		.dvs =3D {
+			.level_map =3D ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND,
+			.run_reg =3D BD73800_REG_BUCK8_VOLT_RUN,
+			.run_mask =3D BD73800_MASK_VOLT,
+			.idle_reg =3D BD73800_REG_BUCK8_VOLT_IDLE,
+			.idle_mask =3D BD73800_MASK_VOLT,
+			.idle_on_mask =3D BD73800_MASK_IDLE_EN,
+			.suspend_reg =3D BD73800_REG_BUCK8_VOLT_SUSP,
+			.suspend_mask =3D BD73800_MASK_VOLT,
+			.suspend_on_mask =3D BD73800_MASK_SUSP_EN,
+		},
+	}, {
+		.desc =3D {
+			.name =3D "ldo1",
+			.of_match =3D of_match_ptr(LDO1_NODE_NAME),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD73800_LDO1,
+			.ops =3D &bd73800_ldo_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd73800_ldo13_low_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd73800_ldo13_low_volts),
+			.n_voltages =3D BD73800_NUM_VOLTS,
+			.enable_reg =3D BD73800_REG_LDO1_ON,
+			.enable_mask =3D BD73800_MASK_RUN_EN,
+			.vsel_reg =3D BD73800_REG_LDO1_VOLT,
+			.vsel_mask =3D BD73800_MASK_VOLT,
+			.owner =3D THIS_MODULE,
+			.of_parse_cb =3D buck_set_hw_dvs_levels,
+		},
+		.dvs =3D {
+			/*
+			 * LDOs support only single voltage for all states.
+			 * Voltage can be individually enabled for each state
+			 * though. Allow setting enable/disable config by
+			 * setting the <state>_on_mask for all supported states.
+			 */
+			.level_map =3D ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND,
+			.run_reg =3D BD73800_REG_LDO1_VOLT,
+			.run_mask =3D BD73800_MASK_VOLT,
+			.idle_on_mask =3D BD73800_MASK_IDLE_EN,
+			.suspend_on_mask =3D BD73800_MASK_SUSP_EN,
+		},
+	}, {
+		.desc =3D {
+			.name =3D "ldo2",
+			.of_match =3D of_match_ptr("ldo2"),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD73800_LDO2,
+			.ops =3D &bd73800_ldo_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd73800_ldo24_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd73800_ldo24_volts),
+			.n_voltages =3D BD73800_NUM_VOLTS,
+			.enable_reg =3D BD73800_REG_LDO2_ON,
+			.enable_mask =3D BD73800_MASK_RUN_EN,
+			.vsel_reg =3D BD73800_REG_LDO2_VOLT,
+			.vsel_mask =3D BD73800_MASK_VOLT,
+			.owner =3D THIS_MODULE,
+			.of_parse_cb =3D buck_set_hw_dvs_levels,
+		},
+		.dvs =3D {
+			.level_map =3D ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND,
+			.run_reg =3D BD73800_REG_LDO2_VOLT,
+			.run_mask =3D BD73800_MASK_VOLT,
+			.idle_on_mask =3D BD73800_MASK_IDLE_EN,
+			.suspend_on_mask =3D BD73800_MASK_SUSP_EN,
+		},
+	}, {
+		.desc =3D {
+			.name =3D "ldo3",
+			.of_match =3D of_match_ptr(LDO3_NODE_NAME),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD73800_LDO3,
+			.ops =3D &bd73800_ldo_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd73800_ldo13_low_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd73800_ldo13_low_volts),
+			.n_voltages =3D BD73800_NUM_VOLTS,
+			.enable_reg =3D BD73800_REG_LDO3_ON,
+			.enable_mask =3D BD73800_MASK_RUN_EN,
+			.vsel_reg =3D BD73800_REG_LDO3_VOLT,
+			.vsel_mask =3D BD73800_MASK_VOLT,
+			.owner =3D THIS_MODULE,
+			.of_parse_cb =3D buck_set_hw_dvs_levels,
+		},
+		.dvs =3D {
+			.level_map =3D ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND,
+			.run_reg =3D BD73800_REG_LDO3_VOLT,
+			.run_mask =3D BD73800_MASK_VOLT,
+			.idle_on_mask =3D BD73800_MASK_IDLE_EN,
+			.suspend_on_mask =3D BD73800_MASK_SUSP_EN,
+		},
+	}, {
+		.desc =3D {
+			.name =3D "ldo4",
+			.of_match =3D of_match_ptr("ldo4"),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD73800_LDO4,
+			.ops =3D &bd73800_ldo_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd73800_ldo24_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd73800_ldo24_volts),
+			.n_voltages =3D BD73800_NUM_VOLTS,
+			.enable_reg =3D BD73800_REG_LDO4_ON,
+			.enable_mask =3D BD73800_MASK_RUN_EN,
+			.vsel_reg =3D BD73800_REG_LDO4_VOLT,
+			.vsel_mask =3D BD73800_MASK_VOLT,
+			.owner =3D THIS_MODULE,
+			.of_parse_cb =3D buck_set_hw_dvs_levels,
+		},
+		.dvs =3D {
+			.level_map =3D ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND,
+			.run_reg =3D BD73800_REG_LDO4_VOLT,
+			.run_mask =3D BD73800_MASK_VOLT,
+			.idle_on_mask =3D BD73800_MASK_IDLE_EN,
+			.suspend_on_mask =3D BD73800_MASK_SUSP_EN,
+		},
+	},
+};
+
 static int bd72720_buck10_ldon_head_mode(struct device *dev,
 					 struct device_node *npreg,
 					 struct regmap *regmap,
@@ -1620,6 +2111,50 @@ static int bd72720_dt_parse(struct device *dev,
 	return bd72720_buck10_ldon_head_mode(dev, nproot, regmap, buck10_desc);
 }
=20
+static int bd73800_check_ldo_otp_options(struct device *dev,
+					 struct bd71828_regulator_data *d,
+					 unsigned int num_reg_data)
+{
+	bool ldo1_use_high_range =3D false, ldo3_use_high_range =3D false;
+	struct device_node *nproot =3D dev->parent->of_node;
+	struct device_node *np;
+
+	/*
+	 * The code assumes regulator IDs to start from 0 and to match the
+	 * indexing of regulator data arrays. WARN if someone changes this.
+	 */
+	WARN_ON(d[BD73800_LDO1].desc.id !=3D BD73800_LDO1);
+	WARN_ON(d[BD73800_LDO3].desc.id !=3D BD73800_LDO3);
+
+	nproot =3D of_get_child_by_name(nproot, "regulators");
+	if (!nproot) {
+		dev_err(dev, "failed to find regulators node\n");
+		return -ENODEV;
+	}
+	for_each_child_of_node(nproot, np) {
+		if (of_node_name_eq(np, LDO1_NODE_NAME))
+			ldo1_use_high_range =3D of_property_read_bool(np,
+							"rohm,ldo-range-high");
+		if (of_node_name_eq(np, LDO3_NODE_NAME))
+			ldo3_use_high_range =3D of_property_read_bool(np,
+							"rohm,ldo-range-high");
+	}
+	of_node_put(nproot);
+
+	if (ldo1_use_high_range) {
+		d[BD73800_LDO1].desc.linear_ranges =3D bd73800_ldo13_high_volts;
+		d[BD73800_LDO1].desc.n_linear_ranges =3D
+					ARRAY_SIZE(bd73800_ldo13_high_volts);
+	}
+	if (ldo3_use_high_range) {
+		d[BD73800_LDO3].desc.linear_ranges =3D bd73800_ldo13_high_volts;
+		d[BD73800_LDO3].desc.n_linear_ranges =3D
+					ARRAY_SIZE(bd73800_ldo13_high_volts);
+	}
+
+	return 0;
+}
+
 static int bd71828_probe(struct platform_device *pdev)
 {
 	int i, j, ret, num_regulators;
@@ -1657,6 +2192,23 @@ static int bd71828_probe(struct platform_device *pde=
v)
 		num_regulators =3D ARRAY_SIZE(bd71828_rdata);
=20
 		break;
+
+	case ROHM_CHIP_TYPE_BD73800:
+	{
+		rdata =3D devm_kmemdup(&pdev->dev, bd73800_rdata, sizeof(bd73800_rdata),
+			     GFP_KERNEL);
+		if (!rdata)
+			return -ENOMEM;
+
+		num_regulators =3D ARRAY_SIZE(bd73800_rdata);
+
+		ret =3D bd73800_check_ldo_otp_options(&pdev->dev, rdata,
+						    num_regulators);
+		if (ret)
+			return ret;
+
+		break;
+	}
 	default:
 		return dev_err_probe(&pdev->dev, -EINVAL,
 				     "Unsupported device\n");
@@ -1693,6 +2245,7 @@ static int bd71828_probe(struct platform_device *pdev)
 static const struct platform_device_id bd71828_pmic_id[] =3D {
 	{ .name =3D "bd71828-pmic", .driver_data =3D ROHM_CHIP_TYPE_BD71828 },
 	{ .name =3D "bd72720-pmic", .driver_data =3D ROHM_CHIP_TYPE_BD72720 },
+	{ .name =3D "bd73800-pmic", .driver_data =3D ROHM_CHIP_TYPE_BD73800 },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, bd71828_pmic_id);
--=20
2.54.0


--KUI/PnXIqYlDsLZA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmpFCzsACgkQeFA3/03a
ocUGOAf/ZswwS9DLExH3DvwDbAC+CpYaY3MB/J7X6U/+TD6GdnCROrsnZ7rq+f8U
8w1Ctoaag8JhJIEYap0wTg9I1Lx3eK1V832RdzLfxGQm6Rp3cnfcm/9D5FhbpO76
LpXhnf8vYsWy7c8x8NUnLRhLvCt2CkU/FDLqi65BIs+1mU2OLjuUgcwS+bS2ZNJT
GV9U7lyra12wemZ92+wvxIYmgSjKb6HpNE29laRLCfEYuauMVqB4CK9vx40/nygL
4V91pZL7RTFksX03OTQdPwT+doByNzzIpfN5fDJXz4xAS7b9EjEGEUnFZw6+3XGA
P/SV7YAWayn1mSNpk1qfyEK1b4EoKw==
=ZbZy
-----END PGP SIGNATURE-----

--KUI/PnXIqYlDsLZA--

