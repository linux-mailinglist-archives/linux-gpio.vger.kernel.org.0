Return-Path: <linux-gpio+bounces-37905-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sp4MAulKIGqr0QAAu9opvQ
	(envelope-from <linux-gpio+bounces-37905-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 17:40:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0A36394E7
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 17:40:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JTdf8khi;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37905-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37905-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E40DC30EE22F
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 15:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6013D649D;
	Wed,  3 Jun 2026 15:17:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C683CBE6E;
	Wed,  3 Jun 2026 15:17:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499838; cv=none; b=Jr72wbt6uq6xrh8YbD8KS590HTDBQIV/JScJNJ8XBMm/+fJowxrVOPTjL8pz24WEYwR6yItfmhj7x3jqQQnPjh0qzrwCUQXQehaX48hXtO4IP8xWoNtJncCNceiujo9ZdmcHaBscTExYSXtumDNn/ZcTNBb+uWWaBvdZ1fIAiWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499838; c=relaxed/simple;
	bh=J1kkX8u2FHxFISmABClS1R5aqNqzRnB1dhVJJ5HEc4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oh8MDtO1ded6ImYg6Ur6xcPfvzu+B+FwYpsGp3fHpOEFE8IkSy/kPdFkHyJDPr3ZzA61uv+GyZjpvSloPVr1aMpU+Mk/MCLsrDjpakt94lQzWhy2eVLVY9oab/7PitZu/Zp7/L/HHMVZ+l3FK1MCY6HmeYdDjWAjop2aeQpf/YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JTdf8khi; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532B21F00898;
	Wed,  3 Jun 2026 15:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780499837;
	bh=XPCmppQDCS/VPvRcd5NSa0jwL94hAn6T/iBNBC2VjbI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JTdf8khiVcUTPOaaVxub2+4BkgbNSUo7Fw+m1451pcXYbRMy0PyLKOn0vZcHSUsXR
	 Amg6pzQxSS5tKl7CnlpoDNrM7E5rcPbtr6lTu+z1VFlTQ8zXm1fOWAfQ54Gks81Kzf
	 /au4MUrLCD50Fuzy1jdIFn7Bo3ODQ6RMM4B9VbAc3P4OFgwFn4dy+8a3IEwOkptD0d
	 gBpGA6Ao8jIqrNKY22Nz2FoCqcQzYiSys5VMbwhAyyWJS/sGN0RlXuagMORPdDPTTi
	 EElVvBMuWLhQGACxDEzQN5mAxJMP6XmhnCaRQQnIS6xUSFQ4y/6iqjj4UgoES9gyEM
	 GF5CHv1GF1hgQ==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 5/6] pinctrl: renesas: rzg2l: Add RZ/G3S support for selecting the I3C power source
Date: Wed,  3 Jun 2026 18:16:41 +0300
Message-ID: <20260603151642.4075678-6-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603151642.4075678-1-claudiu.beznea@kernel.org>
References: <20260603151642.4075678-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37905-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.jz@bp.renesas.com,m:claudiu.beznea@kernel.org,m:claudiu.beznea@tuxon.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:wsa+renesas@sang-engineering.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com,bp.renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sang-engineering.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF0A36394E7

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V. The
pin controller provides a register to select between these two options.
Update the Renesas RZ/G2L pin controller driver to allow selecting the
I3C power source on RZ/G3S SoC.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- none

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 73 +++++++++++++++++++++++--
 1 file changed, 68 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index b52a85066f63..9a0706fea220 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -69,6 +69,7 @@
 #define PIN_CFG_PVDD1833_OTH_AWO_POC	BIT(19) /* known on RZ/G3L only */
 #define PIN_CFG_PVDD1833_OTH_ISO_POC	BIT(20) /* known on RZ/G3L only */
 #define PIN_CFG_WDTOVF_N_POC		BIT(21) /* known on RZ/G3L only */
+#define PIN_CFG_IO_VMC_I3C		BIT(22)
 
 #define RZG2L_SINGLE_PIN		BIT_ULL(63)	/* Dedicated pin */
 #define RZG2L_VARIABLE_CFG		BIT_ULL(62)	/* Variable cfg for port pins */
@@ -186,6 +187,9 @@
 #define PVDD_3300		0	/* I/O domain voltage >= 3.3V */
 #define PVDD_MASK		0x3
 
+#define PVDD_I3C_1200		1	/* I3C I/O domain voltage 1.2V */
+#define PVDD_I3C_1800		0	/* I3C I/O domain voltage 1.8V */
+
 #define PWPR_B0WI		BIT(7)	/* Bit Write Disable */
 #define PWPR_PFCWE		BIT(6)	/* PFC Register Write Enable */
 #define PWPR_REGWE_A		BIT(6)	/* PFC and PMC Register Write Enable on RZ/V2H(P) */
@@ -257,6 +261,7 @@ static const struct pin_config_item renesas_rzv2h_conf_items[] = {
  * @oen: OEN register offset
  * @qspi: QSPI register offset
  * @other_poc: OTHER_POC register offset
+ * @i3c_set: I3C_SET register offset
  */
 struct rzg2l_register_offsets {
 	u16 pwpr;
@@ -265,6 +270,7 @@ struct rzg2l_register_offsets {
 	u16 oen;
 	u16 qspi;
 	u16 other_poc;
+	u16 i3c_set;
 };
 
 /**
@@ -272,6 +278,7 @@ struct rzg2l_register_offsets {
  * @other_poc_pvdd1833_oth_awo_poc: PVDD1833_OTH_AWO_POC mask
  * @other_poc_pvdd1833_oth_iso_poc: PVDD1833_OTH_ISO_POC mask
  * @other_poc_wdtovf_n_poc: WDTOVF_N_POC mask
+ * @i3c_set_poc: I3C_SET_POC mask
  */
 struct rzg2l_register_masks {
 	union {
@@ -281,6 +288,11 @@ struct rzg2l_register_masks {
 			u8 other_poc_pvdd1833_oth_iso_poc;
 			u8 other_poc_wdtovf_n_poc;
 		};
+
+		/* RZ/G3S masks */
+		struct {
+			u8 i3c_set_poc;
+		};
 	};
 };
 
@@ -391,6 +403,7 @@ struct rzg2l_pinctrl_pin_settings {
  * @oen: Output Enable register cache
  * @other_poc: OTHER_POC register cache
  * @qspi: QSPI registers cache
+ * @i3c_set: I3C_SET register cache
  */
 struct rzg2l_pinctrl_reg_cache {
 	u8	*p;
@@ -409,6 +422,7 @@ struct rzg2l_pinctrl_reg_cache {
 	u8	oen;
 	u8	other_poc;
 	u8	qspi;
+	u8	i3c_set;
 };
 
 struct rzg2l_pinctrl {
@@ -441,6 +455,7 @@ struct rzg2l_pinctrl {
 };
 
 static const u16 available_ps[] = { 1800, 2500, 3300 };
+static const u16 available_i3c_ps[] = { 1200, 1800 };
 
 static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinctrl *pctrl,
 					      u64 pincfg,
@@ -1101,12 +1116,28 @@ static int rzg2l_caps_to_pwr_reg(const struct rzg2l_register_offsets *regs,
 			*mask = masks->other_poc_wdtovf_n_poc;
 		return 0;
 	}
+	if (caps & PIN_CFG_IO_VMC_I3C) {
+		*offset = regs->i3c_set;
+		*mask = masks->i3c_set_poc;
+		return 0;
+	}
 
 	return -EINVAL;
 }
 
 static int rzg2l_pwr_reg_val_to_ps(u8 val, u32 caps)
 {
+	if (caps & PIN_CFG_IO_VMC_I3C) {
+		switch (val) {
+		case PVDD_I3C_1200:
+			return 1200;
+		case PVDD_I3C_1800:
+			return 1800;
+		}
+
+		return -EINVAL;
+	}
+
 	switch (val) {
 	case PVDD_1800:
 		return 1800;
@@ -1121,6 +1152,19 @@ static int rzg2l_pwr_reg_val_to_ps(u8 val, u32 caps)
 
 static int rzg2l_ps_to_pwr_reg_val(u8 *val, u32 ps, u32 caps)
 {
+	if (caps & PIN_CFG_IO_VMC_I3C) {
+		switch (ps) {
+		case 1200:
+			*val = PVDD_I3C_1200;
+			return 0;
+		case 1800:
+			*val = PVDD_I3C_1800;
+			return 0;
+		}
+
+		return -EINVAL;
+	}
+
 	switch (ps) {
 	case 1800:
 		*val = PVDD_1800;
@@ -1194,12 +1238,21 @@ static int rzg2l_set_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
 	return 0;
 }
 
-static bool rzg2l_ps_is_supported(u16 ps)
+static bool rzg2l_ps_is_supported(u16 ps, u32 caps)
 {
-	unsigned int i;
+	unsigned int i, len;
+	const u16 *array;
 
-	for (i = 0; i < ARRAY_SIZE(available_ps); i++) {
-		if (available_ps[i] == ps)
+	if (caps & PIN_CFG_IO_VMC_I3C) {
+		array = available_i3c_ps;
+		len = ARRAY_SIZE(available_i3c_ps);
+	} else {
+		array = available_ps;
+		len = ARRAY_SIZE(available_ps);
+	}
+
+	for (i = 0; i < len; i++) {
+		if (array[i] == ps)
 			return true;
 	}
 
@@ -1800,7 +1853,7 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 
 	/* Apply power source. */
 	if (settings.power_source != pctrl->settings[_pin].power_source) {
-		ret = rzg2l_ps_is_supported(settings.power_source);
+		ret = rzg2l_ps_is_supported(settings.power_source, cfg);
 		if (!ret)
 			return -EINVAL;
 
@@ -2498,6 +2551,8 @@ static const struct rzg2l_dedicated_configs rzg3s_dedicated_pins[] = {
 	{ "AUDIO_CLK1", RZG2L_SINGLE_PIN_PACK(0x2, 0, PIN_CFG_IEN) },
 	{ "AUDIO_CLK2", RZG2L_SINGLE_PIN_PACK(0x2, 1, PIN_CFG_IEN) },
 	{ "WDTOVF_PERROUT#", RZG2L_SINGLE_PIN_PACK(0x6, 0, PIN_CFG_IOLH_A | PIN_CFG_SOFT_PS) },
+	{ "I3C_SDA", RZG2L_SINGLE_PIN_PACK(0x9, 0, (PIN_CFG_IEN | PIN_CFG_IO_VMC_I3C)) },
+	{ "I3C_SCL", RZG2L_SINGLE_PIN_PACK(0x9, 1, (PIN_CFG_IEN | PIN_CFG_IO_VMC_I3C)) },
 	{ "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x10, 0, (PIN_CFG_IOLH_B | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x10, 1, (PIN_CFG_IOLH_B | PIN_CFG_IEN |
 						     PIN_CFG_IO_VMC_SD0)) },
@@ -3717,6 +3772,8 @@ static int rzg2l_pinctrl_suspend_noirq(struct device *dev)
 	cache->oen = readb(pctrl->base + pctrl->data->hwcfg->regs.oen);
 	if (regs->other_poc)
 		cache->other_poc = readb(pctrl->base + regs->other_poc);
+	if (regs->i3c_set)
+		cache->i3c_set = readb(pctrl->base + regs->i3c_set);
 
 	if (pctrl->syscon) {
 		int ret;
@@ -3759,6 +3816,8 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
 		writeb(cache->qspi, pctrl->base + regs->qspi);
 	if (regs->other_poc)
 		writeb(cache->other_poc, pctrl->base + regs->other_poc);
+	if (regs->i3c_set)
+		writeb(cache->i3c_set, pctrl->base + regs->i3c_set);
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 	rzg2l_oen_write_with_pwpr(pctrl, cache->oen);
@@ -3871,8 +3930,12 @@ static const struct rzg2l_hwcfg rzg3s_hwcfg = {
 		.pwpr = 0x3000,
 		.sd_ch = 0x3004,
 		.eth_poc = 0x3010,
+		.i3c_set = 0x301c,
 		.oen = 0x3018,
 	},
+	.masks = {
+		.i3c_set_poc = BIT(2),
+	},
 	.iolh_groupa_ua = {
 		/* 1v8 power source */
 		[RZG2L_IOLH_IDX_1V8] = 2200, 4400, 9000, 10000,
-- 
2.43.0


