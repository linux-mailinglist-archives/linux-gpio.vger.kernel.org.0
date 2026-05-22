Return-Path: <linux-gpio+bounces-37341-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EKRL2cvEGrIUgYAu9opvQ
	(envelope-from <linux-gpio+bounces-37341-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 12:26:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 411FD5B20AE
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 12:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 619303000A4B
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 10:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8861A3E6DE7;
	Fri, 22 May 2026 10:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3R9AZVG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B043E0248;
	Fri, 22 May 2026 10:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445395; cv=none; b=AqQz4nacZecONHzH3JRlI4gGBw6IsTP6V+m0vC1qX8GYsd5xuFZ+nt0vHk4JYBE5DbtH09Z+cz7wFYpQWLvK6rbexWk5/AP4Whl2/k6+efjDM2s/MEYGJcup1oZXUJq3W9ErqA2TtNWzgDWeJaVF1lVtJSh5sojjTgpJ+cB+IbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445395; c=relaxed/simple;
	bh=lJQPr3VxlmXH+zSXA+CLMKPYpgVJGQ116BpPTJu7RyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=powmY1/kZEpk363HzNnm6Xg9HeqBV0KC8Z3dzzCCsoM54Z/YbwEIKRx8H8urMnnCakp9MTCAq/IiqEddzIgAvenpYkZB6+by1U1bqSg62R+xfpoC659L6D12YnCbRjrAiTC812NMWJyjLhxDvpPhL1F539pVPCOTB6Ldv+KWlxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K3R9AZVG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 514DB1F00A3E;
	Fri, 22 May 2026 10:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445385;
	bh=rrj5Fbj11F+1roWfV5QbQYCe85rfRXNVPie5x7X3ipA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=K3R9AZVGqKDNaiiuraaDqtPNmYVxhnK5bmAGHVrfHr4Ctyoz0VOV22Bvkfkz1JtHZ
	 CbdqDHxqFOJI67ZT5QtZarXSctZBfPbq2l8fCXdkxg+b/JHL3xupmljz+jqbJaO2xo
	 O4Wbzg9IExE/707AbAzdWjrPHmBL1//MVvR1RoRolaaIkZJq5EVNNKKnkfFD/MdLUO
	 ItIAUf0AE0YiTApBu82jGzcL2mUJfKPBecWwJwZ1jKL5af/KJstCGRb0IjK7DBR54r
	 unA60uLRptaC2aqIedC1K/w0li8VeyjjcQpQr1XsgZLhsmi1j3qGeO3PDKHI0fCFGE
	 59q2EcSrZ81ag==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	wsa+renesas@sang-engineering.com
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 1/9] pinctrl: renesas: rzg2l: Generalize the power source code
Date: Fri, 22 May 2026 13:22:43 +0300
Message-ID: <20260522102251.1723392-2-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522102251.1723392-1-claudiu.beznea@kernel.org>
References: <20260522102251.1723392-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com,sang-engineering.com];
	TAGGED_FROM(0.00)[bounces-37341-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.983];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 411FD5B20AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The current functions used to get/set the pin power source check the
OTHER_POC register, which is specific to the RZ/G3L SoC only. To allow the
code to be extended for other power source functionalities (e.g. I3C on
RZ/G3S), generalize the functions used to get/set the pin power source.

For this, introduce the struct rzg2l_register_masks data structure whose
purpose is to store SoC specific register bit masks. The members of this
structure are then used in rzg2l_caps_to_pwr_reg() to retrieve the bitmask
corresponding to a SoC specific power source capability.

The conversion between HW specific power source values and SW specific
power source values is now handled through rzg2l_pwr_reg_val_to_ps() and
rzg2l_ps_to_pwr_reg_val().

Finally, to keep the code generic, the register update in
rzg2l_set_power_source() was changed to a read-modify-write approach to
cover all cases.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 177 +++++++++++++++---------
 1 file changed, 112 insertions(+), 65 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index ac42093fc579..a648d75a2bd2 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -186,6 +186,7 @@
 #define PVDD_2500		2	/* I/O domain voltage 2.5V */
 #define PVDD_1800		1	/* I/O domain voltage <= 1.8V */
 #define PVDD_3300		0	/* I/O domain voltage >= 3.3V */
+#define PVDD_MASK		0x3
 
 #define PWPR_B0WI		BIT(7)	/* Bit Write Disable */
 #define PWPR_PFCWE		BIT(6)	/* PFC Register Write Enable */
@@ -268,6 +269,23 @@ struct rzg2l_register_offsets {
 	u16 other_poc;
 };
 
+/**
+ * struct rzg2l_register_masks - Masks for different RZ/G2L pinctrl functionalities
+ * @other_poc_pvdd1833_oth_awo_poc: PVDD1833_OTH_AWO_POC mask
+ * @other_poc_pvdd1833_oth_iso_poc: PVDD1833_OTH_ISO_POC mask
+ * @other_poc_wdtovf_n_poc: WDTOVF_N_POC mask
+ */
+struct rzg2l_register_masks {
+	union {
+		/* RZ/G3L masks */
+		struct {
+			u8 other_poc_pvdd1833_oth_awo_poc;
+			u8 other_poc_pvdd1833_oth_iso_poc;
+			u8 other_poc_wdtovf_n_poc;
+		};
+	};
+};
+
 /**
  * enum rzg2l_iolh_index - starting indices in IOLH specific arrays
  * @RZG2L_IOLH_IDX_1V8: starting index for 1V8 power source
@@ -288,6 +306,8 @@ enum rzg2l_iolh_index {
 /**
  * struct rzg2l_hwcfg - hardware configuration data structure
  * @regs: hardware specific register offsets
+ * @masks: hardware specific masks for various functionalities available in
+ * the registers described by regs
  * @iolh_groupa_ua: IOLH group A uA specific values
  * @iolh_groupb_ua: IOLH group B uA specific values
  * @iolh_groupc_ua: IOLH group C uA specific values
@@ -301,6 +321,7 @@ enum rzg2l_iolh_index {
  */
 struct rzg2l_hwcfg {
 	const struct rzg2l_register_offsets regs;
+	const struct rzg2l_register_masks masks;
 	u16 iolh_groupa_ua[RZG2L_IOLH_IDX_MAX];
 	u16 iolh_groupb_ua[RZG2L_IOLH_IDX_MAX];
 	u16 iolh_groupc_ua[RZG2L_IOLH_IDX_MAX];
@@ -1047,27 +1068,73 @@ static void rzg2l_rmw_pin_config(struct rzg2l_pinctrl *pctrl, u32 offset,
 }
 
 static int rzg2l_caps_to_pwr_reg(const struct rzg2l_register_offsets *regs,
-				 u32 caps, u8 *mask)
+				 const struct rzg2l_register_masks *masks,
+				 u32 caps, u16 *offset, u8 *mask)
 {
-	if (caps & PIN_CFG_IO_VMC_SD0)
-		return SD_CH(regs->sd_ch, 0);
-	if (caps & PIN_CFG_IO_VMC_SD1)
-		return SD_CH(regs->sd_ch, 1);
-	if (caps & PIN_CFG_IO_VMC_ETH0)
-		return ETH_POC(regs->eth_poc, 0);
-	if (caps & PIN_CFG_IO_VMC_ETH1)
-		return ETH_POC(regs->eth_poc, 1);
-	if (caps & PIN_CFG_IO_VMC_QSPI)
-		return QSPI;
+	*mask = PVDD_MASK;
+
+	if (caps & PIN_CFG_IO_VMC_SD0) {
+		*offset = SD_CH(regs->sd_ch, 0);
+		return 0;
+	}
+	if (caps & PIN_CFG_IO_VMC_SD1) {
+		*offset = SD_CH(regs->sd_ch, 1);
+		return 0;
+	}
+	if (caps & PIN_CFG_IO_VMC_ETH0) {
+		*offset = ETH_POC(regs->eth_poc, 0);
+		return 0;
+	}
+	if (caps & PIN_CFG_IO_VMC_ETH1) {
+		*offset = ETH_POC(regs->eth_poc, 1);
+		return 0;
+	}
+	if (caps & PIN_CFG_IO_VMC_QSPI) {
+		*offset = regs->qspi;
+		return 0;
+	}
 	if (caps & PIN_CFG_OTHER_POC_MASK) {
+		*offset = regs->other_poc;
 		if (caps & PIN_CFG_PVDD1833_OTH_AWO_POC)
-			*mask = BIT(0);
+			*mask = masks->other_poc_pvdd1833_oth_awo_poc;
 		else if (caps & PIN_CFG_PVDD1833_OTH_ISO_POC)
-			*mask = BIT(1);
+			*mask = masks->other_poc_pvdd1833_oth_iso_poc;
 		else
-			*mask = BIT(2);
+			*mask = masks->other_poc_wdtovf_n_poc;
+		return 0;
+	}
 
-		return OTHER_POC;
+	return -EINVAL;
+}
+
+static int rzg2l_pwr_reg_val_to_ps(u8 val, u32 caps)
+{
+	switch (val) {
+	case PVDD_1800:
+		return 1800;
+	case PVDD_2500:
+		return 2500;
+	case PVDD_3300:
+		return 3300;
+	}
+
+	return -EINVAL;
+}
+
+static int rzg2l_ps_to_pwr_reg_val(u8 *val, u32 ps, u32 caps)
+{
+	switch (ps) {
+	case 1800:
+		*val = PVDD_1800;
+		return 0;
+	case 2500:
+		if (!(caps & (PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1)))
+			return -EINVAL;
+		*val = PVDD_2500;
+		return 0;
+	case 3300:
+		*val = PVDD_3300;
+		return 0;
 	}
 
 	return -EINVAL;
@@ -1077,76 +1144,51 @@ static int rzg2l_get_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
 {
 	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
 	const struct rzg2l_register_offsets *regs = &hwcfg->regs;
-	u8 val, mask;
-	int pwr_reg;
+	const struct rzg2l_register_masks *masks = &hwcfg->masks;
+	u8 mask, val;
+	u16 offset;
+	int ret;
 
 	if (caps & PIN_CFG_SOFT_PS)
 		return pctrl->settings[pin].power_source;
 
-	pwr_reg = rzg2l_caps_to_pwr_reg(regs, caps, &mask);
-	if (pwr_reg < 0)
-		return pwr_reg;
+	ret = rzg2l_caps_to_pwr_reg(regs, masks, caps, &offset, &mask);
+	if (ret)
+		return ret;
 
-	val = readb(pctrl->base + pwr_reg);
-	if (pwr_reg == OTHER_POC)
-		val = field_get(mask, val);
+	val = readb(pctrl->base + offset);
 
-	switch (val) {
-	case PVDD_1800:
-		return 1800;
-	case PVDD_2500:
-		return 2500;
-	case PVDD_3300:
-		return 3300;
-	default:
-		/* Should not happen. */
-		return -EINVAL;
-	}
+	return rzg2l_pwr_reg_val_to_ps(field_get(mask, val), caps);
 }
 
 static int rzg2l_set_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps, u32 ps)
 {
 	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
 	const struct rzg2l_register_offsets *regs = &hwcfg->regs;
-	u8 poc_val, val, mask;
-	int pwr_reg;
+	const struct rzg2l_register_masks *masks = &hwcfg->masks;
+	u8 mask, val;
+	u16 offset;
+	int ret;
 
 	if (caps & PIN_CFG_SOFT_PS) {
 		pctrl->settings[pin].power_source = ps;
 		return 0;
 	}
 
-	switch (ps) {
-	case 1800:
-		poc_val = PVDD_1800;
-		break;
-	case 2500:
-		if (!(caps & (PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1)))
-			return -EINVAL;
-		poc_val = PVDD_2500;
-		break;
-	case 3300:
-		poc_val = PVDD_3300;
-		break;
-	default:
-		return -EINVAL;
-	}
+	ret = rzg2l_ps_to_pwr_reg_val(&val, ps, caps);
+	if (ret)
+		return ret;
+
+	ret = rzg2l_caps_to_pwr_reg(regs, masks, caps, &offset, &mask);
+	if (ret)
+		return ret;
 
-	pwr_reg = rzg2l_caps_to_pwr_reg(regs, caps, &mask);
-	if (pwr_reg < 0)
-		return pwr_reg;
+	scoped_guard(raw_spinlock, &pctrl->lock) {
+		u8 tmp = readb(pctrl->base + offset);
 
-	if (pwr_reg == OTHER_POC) {
-		scoped_guard(raw_spinlock, &pctrl->lock) {
-			val = readb(pctrl->base + pwr_reg);
-			if (poc_val)
-				val |= mask;
-			else
-				val &= ~mask;
-			writeb(val, pctrl->base + pwr_reg);
-		}
-	} else {
-		writeb(poc_val, pctrl->base + pwr_reg);
+		tmp &= ~mask;
+		tmp |= field_prep(mask, val);
+		writeb(tmp, pctrl->base + offset);
 	}
 
 	pctrl->settings[pin].power_source = ps;
@@ -3795,6 +3837,11 @@ static const struct rzg2l_hwcfg rzg3l_hwcfg = {
 		.oen = 0x3018,
 		.other_poc = OTHER_POC,
 	},
+	.masks = {
+		.other_poc_pvdd1833_oth_awo_poc = BIT(0),
+		.other_poc_pvdd1833_oth_iso_poc = BIT(1),
+		.other_poc_wdtovf_n_poc = BIT(2),
+	},
 	.iolh_groupa_ua = {
 		/* 1v8 power source */
 		[RZG2L_IOLH_IDX_1V8] = 2200, 4400, 9000, 10000,
-- 
2.43.0


