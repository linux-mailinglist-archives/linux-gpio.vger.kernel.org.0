Return-Path: <linux-gpio+bounces-39822-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h0kBEK7ZUGoO6QIAu9opvQ
	(envelope-from <linux-gpio+bounces-39822-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 13:38:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A453873A53A
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 13:38:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39822-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39822-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B57E30434C8
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 11:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7361E42314F;
	Fri, 10 Jul 2026 11:37:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2876F41DEE4;
	Fri, 10 Jul 2026 11:37:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683428; cv=none; b=CXMhCn6c/S6H5MLmq4rKoB9IGAEAaUQEwqwQj72vxba6YrWQ2uQVwCYwl3afNJfFztT6xIa0xXku92n7+zlpUbDekxuEFHJ9BNhI5agQ5KBZeKIBi6OS22Vtc77eWIPJgECKfKWTN3dDsDL7Nd831rQBUBtszgq6Dl7DM6xQffo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683428; c=relaxed/simple;
	bh=23+2VbAmmF+lkSt2JR8wIxR3UiDQN2gGlYHq9m800xM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uHgVOEE3NlCtX+iKRLlahzU2phwECJ4XtiNLwJR/b4/J71k6NFF9NofnjqwHeL68koyOY5jN5enL3ZLLXOph/ewPDxdzcEnUX84q8bhUvTmcXYfwUVkQA98zG3+SUXgHbIjyRQFjip+xXFT9bNFa6bgkAucAcLFe81LksXHEjUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 689E41F00ACF;
	Fri, 10 Jul 2026 11:36:54 +0000 (UTC)
From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v4 4/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for selecting the I3C power source
Date: Fri, 10 Jul 2026 14:36:36 +0300
Message-ID: <20260710113637.1328000-5-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:claudiu.beznea@tuxon.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:wsa+renesas@sang-engineering.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[claudiu.beznea@tuxon.dev,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-39822-lists,linux-gpio=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,tuxon.dev:mid,tuxon.dev:from_mime,sang-engineering.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A453873A53A

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V. The
pin controller provides a register to select between these two options.
Update the Renesas RZ/G2L pin controller driver to allow selecting the
I3C power source on RZ/G3S SoC.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

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


