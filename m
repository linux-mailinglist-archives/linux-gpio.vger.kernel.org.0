Return-Path: <linux-gpio+bounces-40082-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eCcmLciNVmoR9AAAu9opvQ
	(envelope-from <linux-gpio+bounces-40082-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 21:28:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 155747583EB
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 21:28:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=IbVxb0ax;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40082-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40082-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFE9F3192669
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 19:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F1241DE1F;
	Tue, 14 Jul 2026 19:26:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7700A4D8DA6
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 19:26:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057165; cv=none; b=q91wKSEM11G8sB/P4+Mf+XAHpySjhRj/6Y/gyjXDOb28eE23urbkP1HNtvUW788vhfhoMevZaZ7DjZMUPBuTHR/WcUFiufH1H32rOsTMgA/fKpH4PsLWmbVwH4dvDXOwgg4XbFb53Yu/pHL4DJHXoZZDJVOC2oflUob6ESiI+xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057165; c=relaxed/simple;
	bh=JH9tB6Vhlm61sJCxrzsmuD3alpcEhsVDnDTpUfmwJpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tt9TtLTaCAxDoETQWYIEuGrX4XiE+1Ro3exUnXuAWGvK4QCEtbVpffRE3Qzm9J1p1ZEq9EkrYH+jZVSeuNEqJzF7ydk6Zg3C0lkvDqJfm4P7OMsPLuPMA2n4OdCjBKyb8kwoXTIL7U82RCLWo0OKdKUQFazo5Fe/kl2uU0izQSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IbVxb0ax; arc=none smtp.client-ip=209.85.161.41
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6a3897109bfso1481177eaf.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 12:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784057159; x=1784661959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=veRGkLISMehf8RXhzpz3c0dz8vEqqd5XVWE0pPHfpPw=;
        b=IbVxb0axApjTfnWgTU+5MXcsVpkjJG9dtYJwtjBProxQaWNP7ZdNt2DSun4k+hWC4h
         GUhg3m/X5gOby3P0stVpYx4urUXmAXZgWsEs5VRssyukFvqDylmLfMOL0wT4oJUe9U9K
         scqMdpzqrTtZYb/i24FgxY3YoReeUTZlnRtgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057159; x=1784661959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=veRGkLISMehf8RXhzpz3c0dz8vEqqd5XVWE0pPHfpPw=;
        b=fGo/YAtjgyNGz6k0ptC6+DKQ8bqtukQT3Z6Fuy0AR4w0fv1DNvgXbeW0b8Onn4nEb8
         hl2esEG6yCcpJVqf4ICVVvh5WlGyISO+LAitzMn4BzpQGaW+X+r/A7LIO6OLM//C0+kq
         BSqcPKaDDpjMsYUE4F2EY+8l3RrmTp/deiw/J02Oxprl81NcyNd0Kpkf+gvFBr/lEOjh
         5u61h/py5axhW2NhqzobYIsPEn1dRHkY9Ca9+Z7EbTKuBuhsm2r83ddwyVK/TipqFhxr
         H9bEB0TjzTx2VtpseDca+aZ8B6Di5fytxDWD/2SXEoBORoREXKuKI9o0+nXuKpX1boQh
         XYkQ==
X-Forwarded-Encrypted: i=1; AFNElJ8RbxpthUZuy53YHzWyzUBNif79cdrZPTgL+udh/VUsi1wbDfQoxFu5Ud0izpVebcwfIZsTWvM0dsoS@vger.kernel.org
X-Gm-Message-State: AOJu0YyXffPvsQu+5oeS0Iyo05V0hKXZrXWQCosX3ikY4eqEhb1jSj6Q
	QoREjvRLcdhM7fGivmkj9R7JyVYomie/fvu5aM9K2D340VgYi+azTymEmXafqF3X8w==
X-Gm-Gg: AfdE7cnBT6q2S3Q1/NWVysWoQ8FPA/TGa1O38mQb1P7M38D+vPbVT97I9O4wuSN8toc
	+TVFeFoJ8xtDjQckmd4f+VVfEd5zYU8Ke5QVPYJE/IoBfcNOi6IWVY3HQF90pDFKB6FF63gpPnO
	tBTxS4PZN+rx7J43Y/sMdd2TPWVAR/njXmd1019If+ZcTaeK7F+WlukjAOdNUY9DzuotNxDZPUp
	AH440RSAbI6F7zPc7yFY0oOUXHxAG9bUOFMdRoJ0vGof5/YSFYCU4X5161w/AabYj0s4zMECp7p
	CLTP9gliINbQQGvyxVzd/Lg+dzxpOobjunB0Ww+vkgQP6VeDkiL/LjL8R6YwmjuWhPb/pmERbbm
	wMmZQg2aNPHkhUQCBbpBZqVFJ1EfPSAc4mOErsXWt+qoI2b/nQFe0Pwc1cAn4XuUMbs9cpNBI2/
	nrXY0FK4o=
X-Received: by 2002:a05:6820:2108:b0:6a1:4833:fd4b with SMTP id 006d021491bc7-6a3d9eb58a9mr69686eaf.5.1784057158678;
        Tue, 14 Jul 2026 12:25:58 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4519d89f7desm15759043fac.7.2026.07.14.12.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:25:58 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] pinctrl: rockchip: Add RV1106 pinctrl support
Date: Tue, 14 Jul 2026 13:25:31 -0600
Message-ID: <20260714132531.v2.3.0af20e702c540f54a3d1694654b158a9b783d68e@changeid>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714192535.2082729-1-sjg@chromium.org>
References: <20260714192535.2082729-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[sjg@chromium.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-40082-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:heiko@sntech.de,m:robh@kernel.org,m:jonas@kwiboo.se,m:conor+dt@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:sjg@chromium.org,m:jeffy.chen@rock-chips.com,m:hl@rock-chips.com,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sjg@chromium.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:from_mime,chromium.org:email,chromium.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sntech.de:email,changeid:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 155747583EB

Add pinctrl support for the Rockchip RV1106, based on the vendor
kernel in the Luckfox Pico SDK [1] at commit 824b817f8 (a Linux
5.10.160 kernel tree). Each GPIO bank has its own IO control (IOC)
register block, referenced by the rockchip,grf phandle of the bank
node; the register offsets are relative to the bank's own block. The
drive strength uses the RK3568-style exponential encoding and only
pins 0-6 of GPIO0 have drive-strength registers.

The RV1103 is a package variant of the RV1106 with fewer pins and uses
the same pin controller.

[1] https://github.com/LuckfoxTECH/luckfox-pico

Signed-off-by: Simon Glass <sjg@chromium.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---

Changes in v2:
- Use a separate IOC regmap per bank, taken from the rockchip,grf
  phandle of each bank node and identified by the gpio alias, with
  block-relative register offsets
- Reject drive-strength requests for GPIO0 pins above 6, which have no
  drive-strength registers
- Specify only the first iomux offset for each bank, letting the driver
  calculate the increments

 drivers/pinctrl/pinctrl-rockchip.c | 168 +++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-rockchip.h |   4 +
 2 files changed, 172 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 7e0fcd45fd26..0589a7a0879f 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -1188,6 +1188,10 @@ static int rockchip_get_mux(struct rockchip_pin_bank *bank, int pin)
 	else
 		regmap = info->regmap_base;
 
+	/* Banks with their own IOC block use its regmap for the iomux */
+	if (bank->regmap_ioc)
+		regmap = bank->regmap_ioc;
+
 	if (ctrl->type == RV1103B && bank->bank_num == 2 && pin >= 12)
 		return 0;
 
@@ -1317,6 +1321,10 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 	else
 		regmap = info->regmap_base;
 
+	/* Banks with their own IOC block use its regmap for the iomux */
+	if (bank->regmap_ioc)
+		regmap = bank->regmap_ioc;
+
 	if (ctrl->type == RV1103B && bank->bank_num == 2 && pin >= 12)
 		return 0;
 
@@ -1725,6 +1733,78 @@ static int rv1103b_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
 	return 0;
 }
 
+#define RV1106_DRV_BITS_PER_PIN		8
+#define RV1106_DRV_PINS_PER_REG		2
+#define RV1106_PULL_BITS_PER_PIN	2
+#define RV1106_PULL_PINS_PER_REG	8
+#define RV1106_SMT_BITS_PER_PIN		1
+#define RV1106_SMT_PINS_PER_REG		8
+
+/*
+ * Each bank has its own IOC block, referenced by the rockchip,grf
+ * phandle of the bank node. The offsets below are relative to the
+ * bank's own block.
+ */
+static const int rv1106_drv_offsets[] = { 0x10, 0x80, 0xc0, 0x100, 0x20 };
+static const int rv1106_pull_offsets[] = { 0x38, 0x1c0, 0x1d0, 0x1e0, 0x70 };
+static const int rv1106_smt_offsets[] = { 0x40, 0x280, 0x290, 0x2a0, 0xa0 };
+
+static int rv1106_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
+				       int pin_num, struct regmap **regmap,
+				       int *reg, u8 *bit)
+{
+	if (bank->bank_num >= ARRAY_SIZE(rv1106_drv_offsets) ||
+	    !bank->regmap_ioc)
+		return -EINVAL;
+
+	/* Only pins 0-6 of GPIO0 have drive-strength registers */
+	if (bank->bank_num == 0 && pin_num > 6)
+		return -ENOTSUPP;
+
+	*regmap = bank->regmap_ioc;
+	*reg = rv1106_drv_offsets[bank->bank_num];
+	*reg += ((pin_num / RV1106_DRV_PINS_PER_REG) * 4);
+	*bit = pin_num % RV1106_DRV_PINS_PER_REG;
+	*bit *= RV1106_DRV_BITS_PER_PIN;
+
+	return 0;
+}
+
+static int rv1106_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
+					int pin_num, struct regmap **regmap,
+					int *reg, u8 *bit)
+{
+	if (bank->bank_num >= ARRAY_SIZE(rv1106_pull_offsets) ||
+	    !bank->regmap_ioc)
+		return -EINVAL;
+
+	*regmap = bank->regmap_ioc;
+	*reg = rv1106_pull_offsets[bank->bank_num];
+	*reg += ((pin_num / RV1106_PULL_PINS_PER_REG) * 4);
+	*bit = pin_num % RV1106_PULL_PINS_PER_REG;
+	*bit *= RV1106_PULL_BITS_PER_PIN;
+
+	return 0;
+}
+
+static int rv1106_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
+					   int pin_num,
+					   struct regmap **regmap,
+					   int *reg, u8 *bit)
+{
+	if (bank->bank_num >= ARRAY_SIZE(rv1106_smt_offsets) ||
+	    !bank->regmap_ioc)
+		return -EINVAL;
+
+	*regmap = bank->regmap_ioc;
+	*reg = rv1106_smt_offsets[bank->bank_num];
+	*reg += ((pin_num / RV1106_SMT_PINS_PER_REG) * 4);
+	*bit = pin_num % RV1106_SMT_PINS_PER_REG;
+	*bit *= RV1106_SMT_BITS_PER_PIN;
+
+	return 0;
+}
+
 #define RV1108_PULL_PMU_OFFSET		0x10
 #define RV1108_PULL_OFFSET		0x110
 #define RV1108_PULL_PINS_PER_REG	8
@@ -3310,6 +3390,7 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 		ret = strength;
 		goto config;
 	} else if (ctrl->type == RV1103B ||
+		   ctrl->type == RV1106 ||
 		   ctrl->type == RK3506 ||
 		   ctrl->type == RK3528 ||
 		   ctrl->type == RK3562 ||
@@ -3482,6 +3563,7 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
 				: PIN_CONFIG_BIAS_DISABLE;
 	case PX30:
 	case RV1103B:
+	case RV1106:
 	case RV1108:
 	case RK3188:
 	case RK3288:
@@ -3547,6 +3629,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 		break;
 	case PX30:
 	case RV1103B:
+	case RV1106:
 	case RV1108:
 	case RV1126:
 	case RK3188:
@@ -3843,6 +3926,7 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
 		return pull ? false : true;
 	case PX30:
 	case RV1103B:
+	case RV1106:
 	case RV1108:
 	case RV1126:
 	case RK3188:
@@ -4452,6 +4536,7 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	struct resource *res;
 	void __iomem *base;
 	int ret;
+	int i;
 
 	if (!dev->of_node)
 		return dev_err_probe(dev, -ENODEV, "device tree node not found\n");
@@ -4505,6 +4590,44 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	/* try to find the optional reference to the ioc1 syscon */
 	info->regmap_ioc1 = syscon_regmap_lookup_by_phandle_optional(np, "rockchip,ioc1");
 
+	/*
+	 * On SoCs where each GPIO bank has its own IOC block, the bank nodes
+	 * carry a rockchip,grf phandle pointing at it. The bank number comes
+	 * from the gpio alias, as used by the gpio driver, falling back to
+	 * the node position for devicetrees without aliases. The fallback is
+	 * wrong when an SoC variant omits a bank, so aliases are needed
+	 * there.
+	 */
+	i = 0;
+	for_each_child_of_node_scoped(np, child) {
+		struct rockchip_pin_bank *bank = NULL;
+		int id, j;
+
+		if (!of_match_node(rockchip_bank_match, child))
+			continue;
+
+		id = of_alias_get_id(child, "gpio");
+		if (id < 0)
+			id = i;
+		i++;
+
+		for (j = 0; j < ctrl->nr_banks; j++) {
+			if (ctrl->pin_banks[j].bank_num == id) {
+				bank = &ctrl->pin_banks[j];
+				break;
+			}
+		}
+		if (!bank)
+			continue;
+
+		bank->regmap_ioc = syscon_regmap_lookup_by_phandle_optional(
+							child, "rockchip,grf");
+		if (IS_ERR(bank->regmap_ioc))
+			return dev_err_probe(dev, PTR_ERR(bank->regmap_ioc),
+					     "%pOFn: failed to look up bank ioc\n",
+					     child);
+	}
+
 	ret = rockchip_pinctrl_register(pdev, info);
 	if (ret)
 		return ret;
@@ -4623,6 +4746,49 @@ static struct rockchip_pin_ctrl rv1103b_pin_ctrl __maybe_unused = {
 	.schmitt_calc_reg	= rv1103b_calc_schmitt_reg_and_bit,
 };
 
+static struct rockchip_pin_bank rv1106_pin_banks[] = {
+	PIN_BANK_IOMUX_FLAGS_OFFSET(0, 32, "gpio0",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0, -1, -1, -1),
+	PIN_BANK_IOMUX_FLAGS_OFFSET(1, 32, "gpio1",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0, -1, -1, -1),
+	PIN_BANK_IOMUX_FLAGS_OFFSET(2, 32, "gpio2",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0x20, -1, -1, -1),
+	PIN_BANK_IOMUX_FLAGS_OFFSET(3, 32, "gpio3",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0x40, -1, -1, -1),
+	PIN_BANK_IOMUX_FLAGS_OFFSET(4, 24, "gpio4",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0,
+				    0, -1, -1, -1),
+};
+
+static struct rockchip_pin_ctrl rv1106_pin_ctrl __maybe_unused = {
+	.pin_banks		= rv1106_pin_banks,
+	.nr_banks		= ARRAY_SIZE(rv1106_pin_banks),
+	.label			= "RV1106-GPIO",
+	.type			= RV1106,
+	.pull_calc_reg		= rv1106_calc_pull_reg_and_bit,
+	.drv_calc_reg		= rv1106_calc_drv_reg_and_bit,
+	.schmitt_calc_reg	= rv1106_calc_schmitt_reg_and_bit,
+};
+
 static struct rockchip_pin_bank rv1108_pin_banks[] = {
 	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", IOMUX_SOURCE_PMU,
 					     IOMUX_SOURCE_PMU,
@@ -5261,6 +5427,8 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
 		.data = &px30_pin_ctrl },
 	{ .compatible = "rockchip,rv1103b-pinctrl",
 		.data = &rv1103b_pin_ctrl },
+	{ .compatible = "rockchip,rv1106-pinctrl",
+		.data = &rv1106_pin_ctrl },
 	{ .compatible = "rockchip,rv1108-pinctrl",
 		.data = &rv1108_pin_ctrl },
 	{ .compatible = "rockchip,rv1126-pinctrl",
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index bb0e803e3b8a..f62213d99792 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -186,6 +186,7 @@
 enum rockchip_pinctrl_type {
 	PX30,
 	RV1103B,
+	RV1106,
 	RV1108,
 	RV1126,
 	RK2928,
@@ -295,6 +296,8 @@ struct rockchip_drv {
  * @dev: the pinctrl device bind to the bank
  * @reg_base: register base of the gpio bank
  * @regmap_pull: optional separate register for additional pull settings
+ * @regmap_ioc: optional per-bank IO control regmap, for SoCs where each
+ *	    bank has its own IOC block
  * @clk: clock of the gpio bank
  * @db_clk: clock of the gpio debounce
  * @irq: interrupt of the gpio bank
@@ -323,6 +326,7 @@ struct rockchip_pin_bank {
 	struct device			*dev;
 	void __iomem			*reg_base;
 	struct regmap			*regmap_pull;
+	struct regmap			*regmap_ioc;
 	struct clk			*clk;
 	struct clk			*db_clk;
 	int				irq;
-- 
2.43.0


