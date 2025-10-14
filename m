Return-Path: <linux-gpio+bounces-27136-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3BEBDB014
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 21:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A01094F1002
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 19:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B54A2C326A;
	Tue, 14 Oct 2025 19:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ed51fLjn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5852C3252
	for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 19:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760469105; cv=none; b=qVP+ZcCr6XfbyaK1yA/oHBrcCemhPgPLBT/drrjMh4pmElB9WbkgK1+9laPRpykX1GAp+ejWHksbQkbsGF8q2ABaIpoZaurHIuoFHfpN1SrakoadxMxSepJDkUghWmKv/G7vYPF7wzniLfff96p08WuHDW9aaMyH1PNKrOa2jVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760469105; c=relaxed/simple;
	bh=YefT5otysJ8NjA8T2i4+1rJNyo8a8/c0YKBFqBkyJ/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SiRqP6tl3HK58ukio7tP7OVcrY0SBVFlH5laZbSDaHdKD1zeO6TRf0dtNXRmmG75yCefHIlKxTHJKweiro8w0KHDCkdEtSNwoxei195zUgydlZiXVjP3tsE7CtIXjkAhK/8+qG7+mHYu/zmi+OqvKPxUzO/bGkURoOKS5XOAL1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ed51fLjn; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b608df6d2a0so4466461a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 12:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760469103; x=1761073903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BogSUI7PkmiswfdRdXAifBQbqaT4kGoB2ig/EHU0lIU=;
        b=ed51fLjnpNY+CnRs75SH14pCN8FN1yRBmKcp6icKFvfJ4NFL2da0rqhf3NsYEpi7bp
         0H/IF/9aUjUkVEE3B+jLxiYRlVVA2QRhAwqh+JUjtu5GGWinDHLOk82MhSckwAD3fpQB
         kp+CdovE0FDdD/7NoHicyH2ynt99GaJ7G0W/AV43mKP2tNJuRQXBCuxNrezxgKy++vK2
         zZCXTyXeuL/5rXaKC1bqOchm4651yz1DrspAY2+Eb2gtr6DLDAKpXu0s7hIj7wKBwgr+
         vioCO8Oa+o7sDhBw3TDnepKWtkHGQyzuKEkCiwvnmmS/uKBOFEKdXS2CbICyZu37ak6b
         qqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760469103; x=1761073903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BogSUI7PkmiswfdRdXAifBQbqaT4kGoB2ig/EHU0lIU=;
        b=HN3Knm9ar/mqep2tYMf3IjbhWQtbXoGfw9rSbW77pAIuisThz89RTxh1+jADc8MVku
         fl6Cac6QAn2z/yJRstZa+/DKEi1WB91Zvy8xVl97cLHE03X30vDVsM+ptUfXCLjPJ45j
         UNsYAuPzXJHrBHrg79900LvBNxpAQUy9nETncP5bOxP5WTYw0nlT0hmWY2sFaApQTPE6
         s/ehrWdif3VGO17AsYegVYSEJePeUg9GQ48KKErWWuFGa7wQdt8r8kNEE1fPn4WAQxFD
         02Fwx7RG7yhtlUuGruym83pciHK+qWw1EML3+NgDvW7/B4e7twl/Dsvf+jOfR5U24wW5
         hTgA==
X-Forwarded-Encrypted: i=1; AJvYcCUV0PQ7exoC0Wnm17GFyIZDuxMIa3aU/LDm1Qb8uOCa7FP18WlytwGvmH6cF91idREZWkWW1hQC50ZJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyUsV5n1BrXWQ65Z6zoIJ/Z0bAuIyYGPsWOm9R23zt33WzF6Rk+
	OsKR0qrt2FyF3cdWUBlMbNTl5K5LaExfWfxQ2q8e80TUY6Xig2LBIMpA
X-Gm-Gg: ASbGncu1oQaTPu1jm1L+FCv8ClpXlJem1JhXU7ZsyWlkNe+r9Ic4IvVAxgLo04agM6P
	vDzUphc5C0E0uqGK1jztqI6DwAPrpjwVsLfGeC/uCScyQjRQV4PJq558FhdXaoJfeoDNF3hNEAv
	OuXRR0aysnYxu1Fg/5fU60ZCoZXHk8gdEYD9irZ8O2rlXE/BdP4P3yQk3LAw/pD4tnuFCFMHq4Y
	Uybw/ab106Aj5gYVIfJWw0WDgzIDv0/7/NmAnnKC53Y3vSG4NdE7PJZeca37+aM0k/Yq1LKZdd6
	GQCyzL94898Wx4K55pPjEBAMCBDjahg5sdASIdxSkQ8EIgWHg2fx/c3VMUYbfY7mXf4ARymoVD5
	QBmUkTz5IR1fSPO3isERBRc5cFBSDtcMEeXwN9wubA1VJPh3CSEauzyda+sWxQolMgz4HMqU=
X-Google-Smtp-Source: AGHT+IH6ay/Mncuf3xHUiJWwNuJOB4u2RjfTBQCf/aIwCE5FpVXep984UAF3OAMLdG6dwukU1EvpdQ==
X-Received: by 2002:a17:903:3c2b:b0:24b:62ef:9d38 with SMTP id d9443c01a7336-29027379a32mr350982335ad.19.1760469102875;
        Tue, 14 Oct 2025 12:11:42 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:c7d3:9987:bec4:a0:deaf])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de658bsm172402755ad.22.2025.10.14.12.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 12:11:42 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] pinctrl: renesas: rzt2h: Add pin configuration support
Date: Tue, 14 Oct 2025 20:11:21 +0100
Message-ID: <20251014191121.368475-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014191121.368475-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251014191121.368475-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add pin configuration support for the Renesas RZ/T2H SoC. The RZ/T2H allows
configuring pin properties through the DRCTLm (I/O Buffer Function
Switching) registers, including:
- Drive strength (low/middle/high/ultra high)
- Pull-up/pull-down/no-bias configuration (3 options: no pull, pull-up,
  pull-down)
- Schmitt trigger control (enable/disable)
- Slew rate control (2 options: slow/fast)

The drive strength configuration uses four discrete levels (low, middle,
high, ultra high) rather than the standard milliamp values. To properly
represent this hardware behavior, implement a custom device-tree binding
parameter "renesas,drive-strength" that accepts values 0-3 corresponding
to these discrete levels.

The DRCTLm registers are accessed in 32-bit mode, with each port split
into two halves (bits 0-3 and bits 4-7) requiring separate register
offsets.

Implement pinconf_ops to support:
- Getting/setting individual pin configurations
- Getting/setting pin group configurations
- Standard properties: bias-disable, bias-pull-up, bias-pull-down,
  input-schmitt-enable, slew-rate
- Custom property: renesas,drive-strength

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 230 ++++++++++++++++++++++++
 1 file changed, 230 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index 4826ff91cd90..501b05844046 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -42,16 +42,27 @@
 #define PMC(m)		(0x400 + (m))
 #define PFC(m)		(0x600 + 8 * (m))
 #define PIN(m)		(0x800 + (m))
+#define DRCTL(n)	(0xa00 + 0x008 * (n))
 #define RSELP(m)	(0xc00 + (m))
 
 #define PM_MASK			GENMASK(1, 0)
 #define PM_PIN_MASK(pin)	(PM_MASK << ((pin) * 2))
 #define PM_INPUT		BIT(0)
 #define PM_OUTPUT		BIT(1)
+#define SR_MASK			0x01
+#define SCHMITT_MASK		0x01
+#define IOLH_MASK		0x03
+#define PUPD_MASK		0x03
 
 #define PFC_MASK		GENMASK_ULL(5, 0)
 #define PFC_PIN_MASK(pin)	(PFC_MASK << ((pin) * 8))
 
+#define DRCTL_BIT_OFFSET(bit)		((bit) * 8)
+#define DRCTL_IOLH_SHIFT(bit)		DRCTL_BIT_OFFSET(bit)
+#define DRCTL_PUPD_SHIFT(bit)		(DRCTL_BIT_OFFSET(bit) + 2)
+#define DRCTL_SCHMITT_SHIFT(bit)	(DRCTL_BIT_OFFSET(bit) + 4)
+#define DRCTL_SR_SHIFT(bit)		(DRCTL_BIT_OFFSET(bit) + 5)
+
 /*
  * Use 16 lower bits [15:0] for pin identifier
  * Use 8 higher bits [23:16] for pin mux function
@@ -101,8 +112,22 @@ static inline type rzt2h_pinctrl_read##size(struct rzt2h_pinctrl *pctrl, u8 port
 
 RZT2H_PINCTRL_REG_ACCESS(b, u8)
 RZT2H_PINCTRL_REG_ACCESS(w, u16)
+RZT2H_PINCTRL_REG_ACCESS(l, u32)
 RZT2H_PINCTRL_REG_ACCESS(q, u64)
 
+/* Custom pinconf parameters */
+#define RENESAS_RZT2H_PIN_CONFIG_DRIVE_STRENGTH		(PIN_CONFIG_END + 1)
+
+static const struct pinconf_generic_params renesas_rzt2h_custom_bindings[] = {
+	{"renesas,drive-strength", RENESAS_RZT2H_PIN_CONFIG_DRIVE_STRENGTH, 0},
+};
+
+#ifdef CONFIG_DEBUG_FS
+static const struct pin_config_item renesas_rzt2h_conf_items[] = {
+	PCONFDUMP(RENESAS_RZT2H_PIN_CONFIG_DRIVE_STRENGTH, "drive-strength", NULL, true),
+};
+#endif
+
 static int rzt2h_validate_pin(struct rzt2h_pinctrl *pctrl, unsigned int offset)
 {
 	u8 port = RZT2H_PIN_ID_TO_PORT(offset);
@@ -425,6 +450,196 @@ static int rzt2h_dt_node_to_map(struct pinctrl_dev *pctldev,
 	return ret;
 }
 
+static int rzt2h_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
+				     unsigned int _pin,
+				     unsigned long *config)
+{
+	struct rzt2h_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	u32 param = pinconf_to_config_param(*config);
+	u32 port = RZT2H_PIN_ID_TO_PORT(_pin);
+	u8 bit = RZT2H_PIN_ID_TO_PIN(_pin);
+	u32 addr = DRCTL(port);
+	unsigned int arg;
+	int ret;
+
+	ret = rzt2h_validate_pin(pctrl, _pin);
+	if (ret)
+		return ret;
+
+	/* Access DRCTLm register in 32-bit mode */
+	if (bit >= 4) {
+		bit -= 4;
+		addr += 4;
+	}
+
+	arg = rzt2h_pinctrl_readl(pctrl, port, addr);
+
+	switch (param) {
+	case PIN_CONFIG_SLEW_RATE:
+		 arg = (arg >> DRCTL_SR_SHIFT(bit)) & SR_MASK;
+		break;
+
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_PULL_UP:
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		 arg = (arg >> DRCTL_PUPD_SHIFT(bit)) & PUPD_MASK;
+		if ((arg == 0 && param != PIN_CONFIG_BIAS_DISABLE) ||
+		    (arg == 0x1 && param != PIN_CONFIG_BIAS_PULL_UP) ||
+		    (arg == 0x2 && param != PIN_CONFIG_BIAS_PULL_DOWN))
+			return -EINVAL;
+		break;
+
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+		arg = (arg >> DRCTL_SCHMITT_SHIFT(bit)) & SCHMITT_MASK;
+		if (!arg)
+			return -EINVAL;
+		break;
+
+	case RENESAS_RZT2H_PIN_CONFIG_DRIVE_STRENGTH:
+		arg = (arg >> DRCTL_IOLH_SHIFT(bit)) & IOLH_MASK;
+		break;
+
+	default:
+		return -ENOTSUPP;
+	}
+
+	*config = pinconf_to_config_packed(param, arg);
+
+	return 0;
+};
+
+static void rzt2h_drctl_rmw(struct rzt2h_pinctrl *pctrl, unsigned int pin,
+			    u32 mask, u32 val)
+{
+	u32 port = RZT2H_PIN_ID_TO_PORT(pin);
+	u8 bit = RZT2H_PIN_ID_TO_PIN(pin);
+	u32 offset = DRCTL(port);
+	unsigned long flags;
+	u32 drctl;
+
+	/* Access DRCTLm register in 32-bit mode */
+	if (bit >= 4)
+		offset += 4;
+
+	spin_lock_irqsave(&pctrl->lock, flags);
+	drctl = rzt2h_pinctrl_readl(pctrl, port, offset) & ~mask;
+	rzt2h_pinctrl_writel(pctrl, port, drctl | val, offset);
+	spin_unlock_irqrestore(&pctrl->lock, flags);
+}
+
+static int rzt2h_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
+				     unsigned int _pin,
+				     unsigned long *_configs,
+				     unsigned int num_configs)
+{
+	struct rzt2h_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	u8 bit = RZT2H_PIN_ID_TO_PIN(_pin);
+	unsigned int i;
+	int ret;
+
+	ret = rzt2h_validate_pin(pctrl, _pin);
+	if (ret)
+		return ret;
+
+	/* Adjust bit for upper half of port */
+	if (bit >= 4)
+		bit -= 4;
+
+	for (i = 0; i < num_configs; i++) {
+		u32 arg = pinconf_to_config_argument(_configs[i]);
+		u32 param = pinconf_to_config_param(_configs[i]);
+		u32 mask, val;
+
+		switch (param) {
+		case PIN_CONFIG_SLEW_RATE:
+			mask = SR_MASK << DRCTL_SR_SHIFT(bit);
+			val = (!!arg) << DRCTL_SR_SHIFT(bit);
+			break;
+
+		case PIN_CONFIG_BIAS_DISABLE:
+		case PIN_CONFIG_BIAS_PULL_UP:
+		case PIN_CONFIG_BIAS_PULL_DOWN: {
+			u32 bias = (param == PIN_CONFIG_BIAS_DISABLE) ? 0 :
+				(param == PIN_CONFIG_BIAS_PULL_UP) ? 1 : 2;
+
+			mask = PUPD_MASK << DRCTL_PUPD_SHIFT(bit);
+			val = bias << DRCTL_PUPD_SHIFT(bit);
+			break;
+		}
+
+		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+			mask = SCHMITT_MASK << DRCTL_SCHMITT_SHIFT(bit);
+			val = (!!arg) << DRCTL_SCHMITT_SHIFT(bit);
+			break;
+
+		case RENESAS_RZT2H_PIN_CONFIG_DRIVE_STRENGTH:
+			if (arg > IOLH_MASK)
+				return -EINVAL;
+
+			mask = IOLH_MASK << DRCTL_IOLH_SHIFT(bit);
+			val = arg << DRCTL_IOLH_SHIFT(bit);
+			break;
+
+		default:
+			return -EOPNOTSUPP;
+		}
+
+		rzt2h_drctl_rmw(pctrl, _pin, mask, val);
+	}
+
+	return 0;
+}
+
+static int rzt2h_pinctrl_pinconf_group_set(struct pinctrl_dev *pctldev,
+					   unsigned int group,
+					   unsigned long *configs,
+					   unsigned int num_configs)
+{
+	const unsigned int *pins;
+	unsigned int i, npins;
+	int ret;
+
+	ret = pinctrl_generic_get_group_pins(pctldev, group, &pins, &npins);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < npins; i++) {
+		ret = rzt2h_pinctrl_pinconf_set(pctldev, pins[i], configs,
+						num_configs);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+};
+
+static int rzt2h_pinctrl_pinconf_group_get(struct pinctrl_dev *pctldev,
+					   unsigned int group,
+					   unsigned long *config)
+{
+	const unsigned int *pins;
+	unsigned int i, npins, prev_config = 0;
+	int ret;
+
+	ret = pinctrl_generic_get_group_pins(pctldev, group, &pins, &npins);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < npins; i++) {
+		ret = rzt2h_pinctrl_pinconf_get(pctldev, pins[i], config);
+		if (ret)
+			return ret;
+
+		/* Check config matching between to pin  */
+		if (i && prev_config != *config)
+			return -EOPNOTSUPP;
+
+		prev_config = *config;
+	}
+
+	return 0;
+};
+
 static const struct pinctrl_ops rzt2h_pinctrl_pctlops = {
 	.get_groups_count = pinctrl_generic_get_group_count,
 	.get_group_name = pinctrl_generic_get_group_name,
@@ -441,6 +656,15 @@ static const struct pinmux_ops rzt2h_pinctrl_pmxops = {
 	.strict = true,
 };
 
+static const struct pinconf_ops rzt2h_pinctrl_confops = {
+	.is_generic = true,
+	.pin_config_get = rzt2h_pinctrl_pinconf_get,
+	.pin_config_set = rzt2h_pinctrl_pinconf_set,
+	.pin_config_group_set = rzt2h_pinctrl_pinconf_group_set,
+	.pin_config_group_get = rzt2h_pinctrl_pinconf_group_get,
+	.pin_config_config_dbg_show = pinconf_generic_dump_config,
+};
+
 static int rzt2h_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	struct rzt2h_pinctrl *pctrl = gpiochip_get_data(chip);
@@ -674,7 +898,13 @@ static int rzt2h_pinctrl_register(struct rzt2h_pinctrl *pctrl)
 	desc->npins = pctrl->data->n_port_pins;
 	desc->pctlops = &rzt2h_pinctrl_pctlops;
 	desc->pmxops = &rzt2h_pinctrl_pmxops;
+	pctrl->desc.confops = &rzt2h_pinctrl_confops;
 	desc->owner = THIS_MODULE;
+	pctrl->desc.num_custom_params = ARRAY_SIZE(renesas_rzt2h_custom_bindings);
+	pctrl->desc.custom_params = renesas_rzt2h_custom_bindings;
+#ifdef CONFIG_DEBUG_FS
+	pctrl->desc.custom_conf_items = renesas_rzt2h_conf_items;
+#endif
 
 	pins = devm_kcalloc(dev, desc->npins, sizeof(*pins), GFP_KERNEL);
 	if (!pins)
-- 
2.43.0


