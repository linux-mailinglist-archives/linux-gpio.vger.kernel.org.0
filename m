Return-Path: <linux-gpio+bounces-37347-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IG4EwgxEGoaUwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37347-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 12:33:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4945B22D6
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 12:33:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C535D308F395
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 10:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423933F5BF7;
	Fri, 22 May 2026 10:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FURRJO1e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FCB3E558E;
	Fri, 22 May 2026 10:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445417; cv=none; b=AQwT0JmB6sIR/Su9GBn7D3AbG8Z/gShsC9v/5V8hFuLf59r5euaw+AbrR7iohX7XVvIVteR+FQvx/5xrd3V/4UM3/rLgaOcwmjWXkoZAD0X6VZaGRZpt2bD3fYsGGU9+lj3rwvYPr9ItwHkyBqlnVlle3J4r67exF8MdygCZlCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445417; c=relaxed/simple;
	bh=3ieREa1l0OIGxVr2h0+jei79Cqol5ZZWYWjHXdW0cTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EIvQPcORdSJqG5x0kO+dBaaajWfu9u7j2PTyJ/2DGrOoPr9z/5YzduEDZ23/8kQ0tA+Ji8IqFnJpBq7gPXPrsCIT+CsPRxh4eLFfdLz+MWk1Fs6XIocDzR54Rx2rTGd+GFUY01yDry1udk8yk1mAWQ9kMyDfD/Tu7lIuyJjG8Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FURRJO1e; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 755A01F00A3D;
	Fri, 22 May 2026 10:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445412;
	bh=SpzT0kfCrLKElIpEGkZ7lbyJuca/WmE2raj0yWcYax8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FURRJO1emf/MSMNnJECgBRN1aDo8vmJbo1iYOo/qD6ycdWNKV84Sz5PTzdgE7fFFW
	 9wj/i8EaYBjcA7PC/9tAY0xHKC7qMJ5ce+b2XBkjAcmB5mcrzbr6FfBwFobVQuRkhf
	 1+CX/GzSsi6Uq5OkuamuHSmk4hiJI6/4KbF4ngiXk86a7liGOhBuOrvy+Wpb1r7nP2
	 8WVE4xeCyotpAQedDLsRaoDx18gR2kHGX1EkiKjkZaXHAo/RJjsbc4lBZXKDBEKoJl
	 8U4wv/jFbD/YuJpa4h5xdbsFEzKC4Wa6+AKj+bD9S8b9mZ3tzbPhTCdL+HdjVf/2qA
	 fR8TkxEISX0/g==
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
Subject: [PATCH 8/9] pinctrl: renesas: rzg2l: Add RZ/G3S support for selecting the I3C standby state
Date: Fri, 22 May 2026 13:22:50 +0300
Message-ID: <20260522102251.1723392-9-claudiu.beznea@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37347-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com,sang-engineering.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: AB4945B22D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The I3C pins on the Renesas RZ/G3S SoC can be switched to a standby mode
when the controller operates in I2C mode. According to the RZ/G3S HW
manual (Rev. 1.20), in standby mode "the output is fixed at Hi-Z and no
data is transferred to the inside even if data is input from outside".

Add support to configure the I3C standby mode.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 49 ++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 68329b6c6649..b313de35e9df 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -70,6 +70,7 @@
 #define PIN_CFG_PVDD1833_OTH_ISO_POC	BIT(20) /* known on RZ/G3L only */
 #define PIN_CFG_WDTOVF_N_POC		BIT(21) /* known on RZ/G3L only */
 #define PIN_CFG_IO_VMC_I3C		BIT(22)
+#define PIN_CFG_I3C_STANDBY_RZG3S	BIT(23)
 
 #define RZG2L_SINGLE_PIN		BIT_ULL(63)	/* Dedicated pin */
 #define RZG2L_VARIABLE_CFG		BIT_ULL(62)	/* Variable cfg for port pins */
@@ -215,15 +216,24 @@
 
 /* Custom pinconf parameters */
 #define RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE	(PIN_CONFIG_END + 1)
+#define RENESAS_RZG3S_PIN_CONFIG_I3C_STANDBY		(PIN_CONFIG_END + 2)
 
 static const struct pinconf_generic_params renesas_rzv2h_custom_bindings[] = {
 	{ "renesas,output-impedance", RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE, 1 },
 };
 
+static const struct pinconf_generic_params renesas_rzg3s_custom_bindings[] = {
+	{ "renesas,i3c-standby", RENESAS_RZG3S_PIN_CONFIG_I3C_STANDBY, 0 },
+};
+
 #ifdef CONFIG_DEBUG_FS
 static const struct pin_config_item renesas_rzv2h_conf_items[] = {
 	PCONFDUMP(RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE, "output-impedance", "x", true),
 };
+
+static const struct pin_config_item renesas_rzg3s_conf_items[] = {
+	PCONFDUMP(RENESAS_RZG3S_PIN_CONFIG_I3C_STANDBY, "standby", NULL, true),
+};
 #endif
 
 /* Read/write 8 bits register */
@@ -279,6 +289,7 @@ struct rzg2l_register_offsets {
  * @other_poc_pvdd1833_oth_iso_poc: PVDD1833_OTH_ISO_POC mask
  * @other_poc_wdtovf_n_poc: WDTOVF_N_POC mask
  * @i3c_set_poc: I3C_SET_POC mask
+ * @i3c_set_stbn: I3C_SET_STBN mask
  */
 struct rzg2l_register_masks {
 	union {
@@ -292,6 +303,7 @@ struct rzg2l_register_masks {
 		/* RZ/G3S masks */
 		struct {
 			u8 i3c_set_poc;
+			u8 i3c_set_stbn;
 		};
 	};
 };
@@ -1560,6 +1572,8 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 	struct rzg2l_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
 	const struct pinctrl_pin_desc *pin = &pctrl->desc.pins[_pin];
+	const struct rzg2l_register_offsets *regs = &hwcfg->regs;
+	const struct rzg2l_register_masks *masks = &hwcfg->masks;
 	u32 param = pinconf_to_config_param(*config);
 	u64 *pin_data = pin->drv_data;
 	unsigned int arg = 0;
@@ -1702,6 +1716,14 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 		arg = rzg2l_read_pin_config(pctrl, IOLH(off), bit, IOLH_MASK);
 		break;
 
+	case RENESAS_RZG3S_PIN_CONFIG_I3C_STANDBY:
+		if (!(cfg & PIN_CFG_I3C_STANDBY_RZG3S))
+			return -EINVAL;
+
+		arg = readb(pctrl->base + regs->i3c_set);
+		arg = !field_get(masks->i3c_set_stbn, arg);
+		break;
+
 	default:
 		return -ENOTSUPP;
 	}
@@ -1720,6 +1742,8 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 	const struct pinctrl_pin_desc *pin = &pctrl->desc.pins[_pin];
 	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
 	struct rzg2l_pinctrl_pin_settings settings = pctrl->settings[_pin];
+	const struct rzg2l_register_offsets *regs = &hwcfg->regs;
+	const struct rzg2l_register_masks *masks = &hwcfg->masks;
 	u64 *pin_data = pin->drv_data;
 	unsigned int i, arg, index;
 	u32 off, param;
@@ -1846,6 +1870,19 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 			rzg2l_rmw_pin_config(pctrl, IOLH(off), bit, IOLH_MASK, arg);
 			break;
 
+		case RENESAS_RZG3S_PIN_CONFIG_I3C_STANDBY:
+			if (!(cfg & PIN_CFG_I3C_STANDBY_RZG3S))
+				return -EINVAL;
+
+			scoped_guard(raw_spinlock, &pctrl->lock) {
+				u8 tmp = readb(pctrl->base + regs->i3c_set);
+
+				tmp &= ~masks->i3c_set_stbn;
+				tmp |= field_prep(masks->i3c_set_stbn, !arg);
+				writeb(tmp, pctrl->base + regs->i3c_set);
+			}
+			break;
+
 		default:
 			return -ENOTSUPP;
 		}
@@ -2551,8 +2588,10 @@ static const struct rzg2l_dedicated_configs rzg3s_dedicated_pins[] = {
 	{ "AUDIO_CLK1", RZG2L_SINGLE_PIN_PACK(0x2, 0, PIN_CFG_IEN) },
 	{ "AUDIO_CLK2", RZG2L_SINGLE_PIN_PACK(0x2, 1, PIN_CFG_IEN) },
 	{ "WDTOVF_PERROUT#", RZG2L_SINGLE_PIN_PACK(0x6, 0, PIN_CFG_IOLH_A | PIN_CFG_SOFT_PS) },
-	{ "I3C_SDA", RZG2L_SINGLE_PIN_PACK(0x9, 0, (PIN_CFG_IEN | PIN_CFG_IO_VMC_I3C)) },
-	{ "I3C_SCL", RZG2L_SINGLE_PIN_PACK(0x9, 1, (PIN_CFG_IEN | PIN_CFG_IO_VMC_I3C)) },
+	{ "I3C_SDA", RZG2L_SINGLE_PIN_PACK(0x9, 0, (PIN_CFG_IEN | PIN_CFG_IO_VMC_I3C |
+						    PIN_CFG_I3C_STANDBY_RZG3S)) },
+	{ "I3C_SCL", RZG2L_SINGLE_PIN_PACK(0x9, 1, (PIN_CFG_IEN | PIN_CFG_IO_VMC_I3C |
+						    PIN_CFG_I3C_STANDBY_RZG3S)) },
 	{ "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x10, 0, (PIN_CFG_IOLH_B | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x10, 1, (PIN_CFG_IOLH_B | PIN_CFG_IEN |
 						     PIN_CFG_IO_VMC_SD0)) },
@@ -3934,6 +3973,7 @@ static const struct rzg2l_hwcfg rzg3s_hwcfg = {
 		.oen = 0x3018,
 	},
 	.masks = {
+		.i3c_set_stbn = BIT(0),
 		.i3c_set_poc = BIT(2),
 	},
 	.iolh_groupa_ua = {
@@ -4020,6 +4060,11 @@ static struct rzg2l_pinctrl_data r9a08g045_data = {
 	.pin_to_oen_bit = &rzg3s_pin_to_oen_bit,
 	.hw_to_bias_param = &rzg2l_hw_to_bias_param,
 	.bias_param_to_hw = &rzg2l_bias_param_to_hw,
+	.num_custom_params = ARRAY_SIZE(renesas_rzg3s_custom_bindings),
+	.custom_params = renesas_rzg3s_custom_bindings,
+#ifdef CONFIG_DEBUG_FS
+	.custom_conf_items = renesas_rzg3s_conf_items,
+#endif
 };
 
 static struct rzg2l_pinctrl_data r9a08g046_data = {
-- 
2.43.0


