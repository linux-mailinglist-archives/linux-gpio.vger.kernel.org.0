Return-Path: <linux-gpio+bounces-20121-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2639AAB639E
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 09:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C45194A0C33
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 07:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2AA3214202;
	Wed, 14 May 2025 07:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCNYoxu+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D1220FA81;
	Wed, 14 May 2025 07:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747206103; cv=none; b=Ukbu+hmzAAjrR9eJ2nCDmJFo+jKdZx3dazXaIbAFh65vajB9oNbH+eBs+dcbkpqwr8LtUtetV9Asr8PHLGMEtM6Yf5l5TKFmLnBziK6BtDW07IHmgxqjL6KAxrICSFMSlTOWGAcF+32xysoOJv8wrZZ3pLwnGsCkX7eVvN/TVGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747206103; c=relaxed/simple;
	bh=RqOyY2jGCkyEVgXr7GCKE7372fyZqazKLEDvm8VS4nA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DeLDojoEMNwnB3x1TNqgMqpgQOrwxNgOhCelu7mUlA5NIJvVSyWCBIoMLiU9tU2rzLw6P4RGPVjSsiuaGzQR7QxEfeOLzli+yigBG9+AT+a+MPxf11p0cc/HrPCzo0d1xzrjvaNhjUZL/bSvFqPAnzGC0MULTg+JIWM7USewwck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCNYoxu+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61825C4CEEB;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747206103;
	bh=RqOyY2jGCkyEVgXr7GCKE7372fyZqazKLEDvm8VS4nA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HCNYoxu+yPlb+arEGU8A+AV1VzIIyn7mdqbyISKRa/3pixyQ4n1r2jY5BwbGXFve+
	 ohqbahroBGlr8cGF6kMgEI+9qL9nnUeI91arz2dInEDPDqRc40DP5XPbUc3p3H+GOc
	 VnvzQwRFFekdYZvSh26OgxyjEMnxHdlNp1kJdXk17xQwGm4FlAGfjtcHkHOs7bdCn4
	 wJJi+JoL7bXm7Tm/rrR6SHKMKRPG1ehpFjfi1/xuwkZweDgFkQyCzZKTMdHV5YCC8P
	 w2qEqMyBkns8Qn76b3nmJT669lN8pq2/109MXIKP6Xgomm8NiPZBGwqSvLIwv9oHYL
	 C9wEvuEMTroJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59009C3ABDA;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 14 May 2025 15:01:32 +0800
Subject: [PATCH 5/8] pinctrl: meson: support amlogic S6/S7/S7D SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-s6-s7-pinctrl-v1-5-39d368cad250@amlogic.com>
References: <20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com>
In-Reply-To: <20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747206100; l=5229;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=gBld46AxkELbpQvuVxx+JAeuTI0Fp+bQupU9PRwGIaM=;
 b=O0H7JfjGniNuecua7TnPLDc7MaS7+00eIT5GXbEd2wGaDL8q8He4wQek3RADn0VfcH6+uskOK
 dXygW6aEOgqABPsJ3fMmyGH4oFflTnEVQs1wThzAI05bwrQeZVC7B+n
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

In some Amlogic SoCs, to save register space or due to some
abnormal arrangements, two sets of pins share one mux register.

A group starting from pin0 is the main pin group, which acquires
the register address through DTS and has management permissions,
but the register bit offset is undetermined.

Another GPIO group as a subordinate group. Some pins mux use share
register and bit offset from bit0 . But this group do not have
register management permissions.

This submission implements this situation.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 94 +++++++++++++++++++++++++++++-
 1 file changed, 92 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index 90d4d10ca10b..f2c98ee9cdb1 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -50,8 +50,23 @@ struct aml_pio_control {
 	u32 bit_offset[AML_NUM_REG];
 };
 
+/*
+ * partial bank(subordinate) pins mux config use other bank(main) mux registgers
+ * m_bank_id:	the main bank which pin_id from 0, but register bit not from bit 0
+ * m_bit_offs:	bit offset the main bank mux register
+ * sid:         start pin_id of subordinate bank
+ * eid:         end pin_id of subordinate bank
+ */
+struct multi_mux {
+	unsigned int m_bank_id;
+	unsigned int m_bit_offs;
+	unsigned int sid;
+	unsigned int eid;
+};
+
 struct aml_pctl_data {
 	unsigned int number;
+	struct multi_mux multi_data[];
 };
 
 struct aml_pmx_func {
@@ -71,10 +86,12 @@ struct aml_gpio_bank {
 	struct gpio_chip		gpio_chip;
 	struct aml_pio_control		pc;
 	u32				bank_id;
+	u32				mux_bit_offs;
 	unsigned int			pin_base;
 	struct regmap			*reg_mux;
 	struct regmap			*reg_gpio;
 	struct regmap			*reg_ds;
+	const struct multi_mux		*p_mux;
 };
 
 struct aml_pinctrl {
@@ -106,13 +123,39 @@ static const char *aml_bank_name[31] = {
 "GPIOCC", "TEST_N", "ANALOG"
 };
 
+const struct aml_pctl_data s7_priv_data = {
+	.number = 1,
+	.multi_data[0] = {
+		.m_bank_id = AMLOGIC_GPIO_CC,
+		.m_bit_offs = 24,
+		.sid = (AMLOGIC_GPIO_X << 8) + 16,
+		.eid = (AMLOGIC_GPIO_X << 8) + 19,
+	},
+};
+
+const struct aml_pctl_data s6_priv_data = {
+	.number = 2,
+	.multi_data[0] = {
+		.m_bank_id = AMLOGIC_GPIO_CC,
+		.m_bit_offs = 24,
+		.sid = (AMLOGIC_GPIO_X << 8) + 16,
+		.eid = (AMLOGIC_GPIO_X << 8) + 19,
+	},
+	.multi_data[1] = {
+		.m_bank_id = AMLOGIC_GPIO_F,
+		.m_bit_offs = 4,
+		.sid = (AMLOGIC_GPIO_D << 8) + 6,
+		.eid = (AMLOGIC_GPIO_D << 8) + 6,
+	},
+};
+
 static int aml_pmx_calc_reg_and_offset(struct pinctrl_gpio_range *range,
 				       unsigned int pin, unsigned int *reg,
 				       unsigned int *offset)
 {
 	unsigned int shift;
 
-	shift = (pin - range->pin_base) << 2;
+	shift = ((pin - range->pin_base) << 2) + *offset;
 	*reg = (shift / 32) * 4;
 	*offset = shift % 32;
 
@@ -124,9 +167,36 @@ static int aml_pctl_set_function(struct aml_pinctrl *info,
 				 int pin_id, int func)
 {
 	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
+	unsigned int shift;
 	int reg;
-	int offset;
+	int i;
+	unsigned int offset = bank->mux_bit_offs;
+	const struct multi_mux	*p_mux;
+
+	/* peculiar mux reg set */
+	if (bank->p_mux) {
+		p_mux = bank->p_mux;
+		if (pin_id >= p_mux->sid && pin_id <= p_mux->eid) {
+			bank = NULL;
+			for (i = 0; i < info->nbanks; i++) {
+				if (info->banks[i].bank_id == p_mux->m_bank_id) {
+					bank = &info->banks[i];
+						break;
+				}
+			}
+
+			if (!bank || !bank->reg_mux)
+				return -EINVAL;
+
+			shift = (pin_id - p_mux->sid) << 2;
+			reg = (shift / 32) * 4;
+			offset = shift % 32;
+			return regmap_update_bits(bank->reg_mux, reg,
+					0xf << offset, (func & 0xf) << offset);
+		}
+	}
 
+	/* normal mux reg set */
 	if (!bank->reg_mux)
 		return 0;
 
@@ -836,12 +906,30 @@ static const struct gpio_chip aml_gpio_template = {
 static void init_bank_register_bit(struct aml_pinctrl *info,
 				   struct aml_gpio_bank *bank)
 {
+	const struct aml_pctl_data *data = info->data;
+	const struct multi_mux *multi_data;
 	int i;
 
 	for (i = 0; i < AML_NUM_REG; i++) {
 		bank->pc.reg_offset[i] = aml_def_regoffs[i];
 		bank->pc.bit_offset[i] = 0;
 	}
+
+	bank->mux_bit_offs = 0;
+
+	if (data) {
+		for (i = 0; i < data->number; i++) {
+			multi_data = &data->multi_data[i];
+			if (bank->bank_id == multi_data->m_bank_id) {
+				bank->mux_bit_offs = multi_data->m_bit_offs;
+				break;
+			}
+			if (multi_data->sid >> 8 == bank->bank_id) {
+				bank->p_mux = multi_data;
+				break;
+			}
+		}
+	}
 }
 
 static int aml_gpiolib_register_bank(struct aml_pinctrl *info,
@@ -1008,6 +1096,8 @@ static int aml_pctl_probe(struct platform_device *pdev)
 
 static const struct of_device_id aml_pctl_of_match[] = {
 	{ .compatible = "amlogic,pinctrl-a4", },
+	{ .compatible = "amlogic,pinctrl-s7", .data = &s7_priv_data, },
+	{ .compatible = "amlogic,pinctrl-s6", .data = &s6_priv_data, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, aml_pctl_dt_match);

-- 
2.37.1



