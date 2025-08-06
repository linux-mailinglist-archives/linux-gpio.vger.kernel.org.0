Return-Path: <linux-gpio+bounces-24053-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 079FBB1CCBD
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 21:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E59D07B1605
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 19:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77CFA2BEFFA;
	Wed,  6 Aug 2025 19:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZHKeLU7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342EE2BEC2E;
	Wed,  6 Aug 2025 19:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754510172; cv=none; b=Ivr36NPP7UStJufn3Ksuy5NQtPGpVvpbBcBfvsLvxlEXmG/rs+P5IaqVr/5lM8gD5k72vsJHju0N+dgHqSwlgtDiqkHw6GvFAxLfCEG/EHeFMPNCtZqfiiAHwjERC1gvXleIHSgvKs5pDUWsFFvD8EDRCjOo7ciLhPEPe9en0r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754510172; c=relaxed/simple;
	bh=E6LzYY3ygK54KwVC++QfV19r46lyuNQCVJQjXDuj9wQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WyAtBsCfOwKtWrwzS5c7T6I81DXuuhdxW459WqMewwegwEAy4Cmxgow5jZY74DhufQBC9TZBXxUR41oZo/ALKFYtTqCE+ffLFFUfsIBUi+CD/kE7xe28d5IxHDENF6TLvYBj+2ykHGC34zESxLyTQ6UAWBUyV7cB9d7/pHSKY2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZHKeLU7; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4563cfac2d2so2580875e9.3;
        Wed, 06 Aug 2025 12:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754510168; x=1755114968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4y1gg5On8YmscNymu6i/JyMxnSP9TwiXD9O0veSpR4E=;
        b=YZHKeLU7DS9V3hYWCaL0Q+QSMm9LzPcbRi2v5WrgCRzYLxMYQEtZrPQPILtb6xZSKq
         e6WMWzi6v15mv6+SDNuhLn/Rg1YXmMSGoRHPy996Qhbd08Gv8alOwY9FaNk+U+Q5WQHT
         4cELcsDcsKGHLlie9OHhfhn1w6oZDtLPsLztzazbRloLGLzeUN/666EAWzPQu2/u8yMb
         gLZz3hdmnGbth7llvKldJPHaBZ54RX0k3P88RInquUc2VhX86/M2h3E1ucGY9smizEz1
         aQB7eV63yDNgAxlVEYb2T10hjX4PAmM/l3Wo97RblRfAFCAb0uGzUiHlhYwD2b3LUa9I
         e9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510168; x=1755114968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4y1gg5On8YmscNymu6i/JyMxnSP9TwiXD9O0veSpR4E=;
        b=fnrUzGycZhE3IxpsPgUeGqGkA304T4xIdAGAMv3ENMIWl4k5+xZTiVuR6aNTb8RgJN
         X/BzYk3tPIGfavmolKy8WXvcJ9trBW/slVEc7RqJ19AVWaSQTdnmLZNzS7kRwtnv1I7d
         yEXNf/1ogl7OGz3q2teMhqExgafn1msB8uzwO/lX8YpknlGzm6Dm+va2VH4pY7ZTthUe
         l6YdkOvvm2xEiQGWdyiYY+JNIxfyObGToQ3nnui5QbVoK2vhOVv4DmW64E8Q25cHPUIb
         7ZCROTdmn7u/MY02GfgpFvq9kU9VeZWAf2Uf7D1mMSTda4oj+owGFtoNnWc2FRUaN2T1
         g/fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVf7RQeMBF/EiNWqrZuZe7aC+dzNSgWf9F7BHWPwcDypUgrc872ptJGJmhwuC8EM2rMfMRmTZrXoK2XHxfF@vger.kernel.org, AJvYcCWn9wJ2T8I+aejwFHpKcYhaJ5CDA/L/38t0o4jee7CB+WrPPhOa1f+AB0r5T5Mguf7APyIcJjWQElCI@vger.kernel.org
X-Gm-Message-State: AOJu0YzIn48aCczE7ORyrNtux4lN4JKUF8FsbFz/EPBM9gsJAP3K8PC/
	t4uJ21wcOfgxtwrG9HF5tsXzHkMfyPBX8uiZcCNgD2uzdtqktVLuvBFY
X-Gm-Gg: ASbGncsB2WKbsSKl8/X9ELHKhZQC+RDhcLDXQt4E/BmNPFohreZvDXv1lLJj02HoM7n
	2XsTRD+rfQhwRx+9eJhFld0Ed7VrdIwxH3AopJyiowp/NjyTZVTaX9/Aa+JNQ272y+uPUUzdUaA
	l59cna/MmkO2RHBRgL4f03H8Xqg4t6bkQZ+CSnDY/e0vhapWwKqHMt2JCefAiXme4RiqAP/CEh3
	qhHd7zgfq1LNd+dxt/e5WmZRmOWdG270dlnHljfxCfTJAsNL0X2rrKm/nhVr5d0Bvea7cesc7J+
	srUHps5zI6YPDy/EGnmM4IeebaLD9G9wMGgo/rFCqITPuaYof0Z+ImjGPK0CksMwq/jjFy3f9tp
	D/cO92U7Wnojm8g9fnNTj07WICofRYtu53v1pbpBmoz0HcgD12UCp4tG2HhjVGa7+FmhoiKQazA
	==
X-Google-Smtp-Source: AGHT+IFxLjlmcuAuXFSiL+h2g/JjpSHnBvJ1R9/E/B2Mmf1/hu8K/JCTR16AaiGLwBmPdJxI3g9l4w==
X-Received: by 2002:a05:600c:4e8e:b0:459:d9a2:e952 with SMTP id 5b1f17b1804b1-459e7440a1amr29822005e9.1.1754510168155;
        Wed, 06 Aug 2025 12:56:08 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3bf93dsm24137782f8f.27.2025.08.06.12.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 12:56:07 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 6/7] pinctrl: renesas: rzg2l: Add PFC_OEN support for RZ/G3E SoC
Date: Wed,  6 Aug 2025 20:55:54 +0100
Message-ID: <20250806195555.1372317-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806195555.1372317-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250806195555.1372317-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3:
- Added Reviewed-by tag from Geert.

v1->v2:
- Adapted the code to use the new unified OEN handling
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 61 +++++++++++++++++++++----
 1 file changed, 52 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index d5eea8ae4cdc..9fb9e6d2c6d5 100644
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
@@ -1200,23 +1224,39 @@ static int rzv2h_bias_param_to_hw(enum pin_config_param param)
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
@@ -2008,17 +2048,17 @@ static const u64 r9a09g047_gpio_configs[] = {
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
@@ -3318,6 +3358,9 @@ static struct rzg2l_pinctrl_data r9a09g047_data = {
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
2.50.1


