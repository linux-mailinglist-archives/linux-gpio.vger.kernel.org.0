Return-Path: <linux-gpio+bounces-23029-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCA6AFEEA2
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 18:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85892545014
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 16:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C4A2DA779;
	Wed,  9 Jul 2025 16:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PX2Wc2Ud"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE142EA161;
	Wed,  9 Jul 2025 16:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077321; cv=none; b=IleiwGgupLcwq52mQXntfwrvQFcEMkHEfzVmTCrF9B1dWA4/7VS4gvP6l03o3qDdleLZk7FjbrL6gepwKPXpOT6wsfGMfFn8cBbp7AGkJy4ldEXV9oVxwvlG5IAlhGS+ZKTmcF5dUSd1PkYsiteLko3KkyBFwr25zWjTXNzzbYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077321; c=relaxed/simple;
	bh=cmS8OaxXs07rdRkZmeuQ8U2/HjwTz+q7p3ytpa5Nz10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jrr2p76r/fyNz6h1F1P3IRdrdJaM0Hc+MZCjxu2OV99bQFAD1Bq/4NcJdbFwdWkr+cxnm8wwx0ficwA0cPG7JwrzOtUzvlktHPGaj1YLvP0a4UJLV9DIeOvjaI7EOPRLw1auII7X0xzKHIDooEVHN8tZ2D6DFCfaK1zU/OBr+ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PX2Wc2Ud; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso81566f8f.2;
        Wed, 09 Jul 2025 09:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752077318; x=1752682118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=225/uGLq7GzKmveCG3TTIRsj6STqcgVffZebkZov6Dg=;
        b=PX2Wc2Udo4d2rmrp+svbHAsdvsMX8wmENbbh5R9LSwcjbbsGevPg7Ii/222aJsm1ui
         tlY2bjJZE2WXYaKn4giqmldoZEOE1MkD0fYQwCRhc4N6rTpnrPcjkKVT1wH4ED0do9Aq
         TXzNK2aA/qNjZ97W0mMxLKjp5gid8s2bF/xrxOR/RMojay3fmzI1+yzflZ947NZo2Jpw
         Q0eRdgrTxTlGVKVoW8pgpj+8TJiaJ+5ljxqIefM4p8dzCYXzmeZ7BzL0YRjS9t1rHcqw
         9C3LtVxLMoqabY4cKlYjo4nVwY6PtiDPScREsHMNDDW01bT3Jy/BuRHtsvufsE8vN6RB
         SJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752077318; x=1752682118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=225/uGLq7GzKmveCG3TTIRsj6STqcgVffZebkZov6Dg=;
        b=ndPVfpapitZYBFYxw+HBBBEUrOucUqS8rkAe5E/1PFhpSPuOWqnQn14rOsM8vssqF9
         r0BJ7dEa8HKmnzD9CQV4qQhNTkmO8BYvFv2bliEVDtU5y096bFWWp4202bDXQhHdvASG
         KBnUulbWghJrQLKvk+fKCV6SWaadbHxtAiK7/WIrx9je2Qe3tQ8TI+YxOV8ybijbKFht
         Lj2aGAW7lvkvbGm5R6ospDRm/lAkckCGghw8N0Yzv7Cg18vDuTLTdCrNUJnxQgbD9gIU
         ekYMAqqhKu+p3gUoVAkFdcRD5uzMWQBjM2cOEqIkJaxf22lbPpHzaEs9oNdNp6xos+HY
         1V4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFA3H4DRsDkSFArVDTC+SvIfjyRVTJKPCDnyws5XmvtyEGc7jnUpuMfzhKW6bWC7Wyx80neK0QwVLI@vger.kernel.org, AJvYcCXK/2EDBBPXC8ksPNNUxnb2T9uU85/mUjwb/O6aSYh150gWGdUzRBLpO8G01OF4DaXp88zv4S5K11US9ou0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0KVvfS6STCN3xsga5MPr1OnThP4GFhmIR8B6ox94e/DoOBYtT
	jyC4fEjSVVQirkLO9oqDLJbZ57kGjmOBk5ruKpZifKrNKnPjNNAr8uzbsMCVSA==
X-Gm-Gg: ASbGncsBIqQW3vgEa18x4YT9JH7jbk8yAXUHgS109FZVqX7JpoOOiYqixqumcsqYHfK
	RyaL5j8cd33azT7wNWRN/sUN6FPspQNnE7ngwBz3mbkNG1k0gk3WJOJF8iPN8Iv7MZYdo7HD3QG
	9z4Ojnv83FWqr+z/rlyTB+9w/6pEdxiXLcn8ykoaFoF5yLLjH/JiLACS4gwjOli9BmwL6Si03m2
	rcz+8dWJ73J98QmiDGma64ATJbg+zxX4ykYUXgsupg/tR10CljswmJOvFCSf4/cqTX7tUpNj37T
	6oRAnUQp/fX7IQ29B95oCjwgjas0ZATafqCw0pvhEo8BfZMEAd6b8sflaIX85E5sTT1SvDc96P4
	cdyWli1OdrKY=
X-Google-Smtp-Source: AGHT+IFKLcwT+CBGTaJ3oDmL5xoPc1mmbppX8EoIu052AkLuXIjcYIHQdmOYgMMscSAVWz4AlnsThw==
X-Received: by 2002:a05:6000:144e:b0:3b3:9cc4:6830 with SMTP id ffacd0b85a97d-3b5e453e217mr2843727f8f.48.1752077317689;
        Wed, 09 Jul 2025 09:08:37 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:c930:b02d:bf60:750b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b9671asm16639686f8f.53.2025.07.09.09.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 09:08:37 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 6/7] pinctrl: renesas: rzg2l: Add PFC_OEN support for RZ/G3E SoC
Date: Wed,  9 Jul 2025 17:08:18 +0100
Message-ID: <20250709160819.306875-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250709160819.306875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250709160819.306875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for configuring the PFC_OEN register on the RZ/G3E SoC to
enable output-enable control for specific pins. On this SoC, certain
pins such as TXC_TXCLK need to support switching between input and
output modes depending on the PHY interface mode (e.g., MII vs RGMII).
This functionality maps to the 'output-enable' property in the device
tree and requires explicit control via the PFC_OEN register.

This change updates the r9a09g047_variable_pin_cfg array to mark PB1, PE1,
PL0, PL1, PL2, and PL4 with the PIN_CFG_OEN flag to indicate output-enable
support. A new helper, rzg3e_pin_to_oen_bit(), is introduced to map these
pin names to their respective OEN bit positions, and the corresponding
callbacks are wired into the RZ/G3E SoC configuration using the generic
rzg2l_read_oen() and rzg2l_write_oen() accessors. Additionally, the GPIO
configuration for the PB, PE, and PL ports is updated to use the variable
port pack macro, enabling per-pin configuration necessary for OEN handling.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 61 +++++++++++++++++++++----
 1 file changed, 52 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 64101423e1f3..a6580d06db13 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -397,6 +397,14 @@ static const u64 r9a09g047_variable_pin_cfg[] = {
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PA, 5, RZV2H_MPXED_PIN_FUNCS),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PA, 6, RZV2H_MPXED_PIN_FUNCS),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PA, 7, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PB, 0, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PB, 1, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_OEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PB, 2, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PB, 3, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PB, 4, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PB, 5, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PB, 6, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PB, 7, RZV2H_MPXED_PIN_FUNCS),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PD, 0, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PD, 1, RZV2H_MPXED_PIN_FUNCS),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PD, 2, RZV2H_MPXED_PIN_FUNCS),
@@ -405,6 +413,14 @@ static const u64 r9a09g047_variable_pin_cfg[] = {
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PD, 5, RZV2H_MPXED_PIN_FUNCS),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PD, 6, RZV2H_MPXED_PIN_FUNCS),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PD, 7, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PE, 0, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PE, 1, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_OEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PE, 2, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PE, 3, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PE, 4, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PE, 5, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PE, 6, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PE, 7, RZV2H_MPXED_PIN_FUNCS),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PG, 0, RZV2H_MPXED_PIN_FUNCS),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PG, 1, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PG, 2, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
@@ -424,6 +440,14 @@ static const u64 r9a09g047_variable_pin_cfg[] = {
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PJ, 2, RZV2H_MPXED_PIN_FUNCS),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PJ, 3, RZV2H_MPXED_PIN_FUNCS),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PJ, 4, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PL, 0, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_OEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PL, 1, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_OEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PL, 2, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_OEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PL, 3, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PL, 4, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_OEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PL, 5, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PL, 6, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PL, 7, RZV2H_MPXED_PIN_FUNCS),
 };
 
 static const u64 r9a09g057_variable_pin_cfg[] = {
@@ -1198,23 +1222,39 @@ static int rzv2h_bias_param_to_hw(enum pin_config_param param)
 	return -EINVAL;
 }
 
-static int rzv2h_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
+static int rzg2l_pin_names_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin,
+				      const char * const pin_names[], unsigned int count)
 {
-	static const char * const pin_names[] = { "ET0_TXC_TXCLK", "ET1_TXC_TXCLK",
-						  "XSPI0_RESET0N", "XSPI0_CS0N",
-						  "XSPI0_CKN", "XSPI0_CKP" };
 	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[_pin];
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(pin_names); i++) {
+	for (i = 0; i < count; i++) {
 		if (!strcmp(pin_desc->name, pin_names[i]))
 			return i;
 	}
 
-	/* Should not happen. */
 	return -EINVAL;
 }
 
+static int rzv2h_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
+{
+	static const char * const pin_names[] = {
+		"ET0_TXC_TXCLK", "ET1_TXC_TXCLK", "XSPI0_RESET0N",
+		"XSPI0_CS0N", "XSPI0_CKN", "XSPI0_CKP"
+	};
+
+	return rzg2l_pin_names_to_oen_bit(pctrl, _pin, pin_names, ARRAY_SIZE(pin_names));
+}
+
+static int rzg3e_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
+{
+	static const char * const pin_names[] = {
+		"PB1", "PE1", "PL4", "PL1", "PL2", "PL0"
+	};
+
+	return rzg2l_pin_names_to_oen_bit(pctrl, _pin, pin_names, ARRAY_SIZE(pin_names));
+}
+
 static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 				     unsigned int _pin,
 				     unsigned long *config)
@@ -2006,17 +2046,17 @@ static const u64 r9a09g047_gpio_configs[] = {
 	RZG2L_GPIO_PORT_PACK(6, 0x28, RZV2H_MPXED_PIN_FUNCS),	/* P8 */
 	0x0,
 	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x2a),			/* PA */
-	RZG2L_GPIO_PORT_PACK(8, 0x2b, RZV2H_MPXED_PIN_FUNCS),	/* PB */
+	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x2b),			/* PB */
 	RZG2L_GPIO_PORT_PACK(3, 0x2c, RZV2H_MPXED_PIN_FUNCS),	/* PC */
 	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x2d),			/* PD */
-	RZG2L_GPIO_PORT_PACK(8, 0x2e, RZV2H_MPXED_PIN_FUNCS),	/* PE */
+	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x2e),			/* PE */
 	RZG2L_GPIO_PORT_PACK(3, 0x2f, RZV2H_MPXED_PIN_FUNCS),	/* PF */
 	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x30),			/* PG */
 	RZG2L_GPIO_PORT_PACK_VARIABLE(6, 0x31),			/* PH */
 	0x0,
 	RZG2L_GPIO_PORT_PACK_VARIABLE(5, 0x33),			/* PJ */
 	RZG2L_GPIO_PORT_PACK(4, 0x34, RZV2H_MPXED_PIN_FUNCS),	/* PK */
-	RZG2L_GPIO_PORT_PACK(8, 0x35, RZV2H_MPXED_PIN_FUNCS),	/* PL */
+	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x35),			/* PL */
 	RZG2L_GPIO_PORT_PACK(8, 0x36, RZV2H_MPXED_PIN_FUNCS),	/* PM */
 	0x0,
 	0x0,
@@ -3316,6 +3356,9 @@ static struct rzg2l_pinctrl_data r9a09g047_data = {
 #endif
 	.pwpr_pfc_lock_unlock = &rzv2h_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzv2h_pmc_writeb,
+	.pin_to_oen_bit = &rzg3e_pin_to_oen_bit,
+	.oen_read = &rzg2l_read_oen,
+	.oen_write = &rzg2l_write_oen,
 	.hw_to_bias_param = &rzv2h_hw_to_bias_param,
 	.bias_param_to_hw = &rzv2h_bias_param_to_hw,
 };
-- 
2.49.0


