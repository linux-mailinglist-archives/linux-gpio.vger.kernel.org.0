Return-Path: <linux-gpio+bounces-31503-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJJIKfc4h2kuVQQAu9opvQ
	(envelope-from <linux-gpio+bounces-31503-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Feb 2026 14:07:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 479AB105EBD
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Feb 2026 14:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BF5E301AF66
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Feb 2026 13:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3D834106D;
	Sat,  7 Feb 2026 13:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HnvmOGO8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CE6310655
	for <linux-gpio@vger.kernel.org>; Sat,  7 Feb 2026 13:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770469618; cv=none; b=JwTH3SD7tgKltFthMRxQYkRUHovxIHyBpJ6rl8a6o+YEEDGI3c2A807dZiuv2AtpJ+MaTI0rxMQFQGkNBT3MsHy3hqb9a28tI9uVRA7PlpGHqnxin3TAm3RiCSbrvVZHUHJWjkTYWmDo0dp6C84gfjX3Vq19n+XpLvtMbsy1lxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770469618; c=relaxed/simple;
	bh=ioStEdl7qvq+MiKhacXaWAuWblYHH+N6bwME0/E3Ocg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b4IjUF7zyo0A76cvTpMSgqYOQW65qAdbQWWE4BCrmOlAl6cOnGOeQlIseozUmZdXcJAGe5pGRd80jPla7/0+ncKFQjS0jX5p5peJ/FX0L79A1pwVVbR7dhUV3LfNKaub4VSSXRevLARc9KebmLdhu0ecLwepQMBgZ/SJPDkjKAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HnvmOGO8; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64a28af2f4cso2300603d50.1
        for <linux-gpio@vger.kernel.org>; Sat, 07 Feb 2026 05:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770469617; x=1771074417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHjIXZUa5dDIO94dk7U7Rh8yW4cGtzCrjj1MjQ3dPr4=;
        b=HnvmOGO8kk6nfFbK03DarilvcY7txh3ESC8MnOBJYrMAI0oxYNShlPCy6UTN6lYdlg
         n46b0KsGJQrulzH71dzFOJ12+IujmG5gKNzJhZlT1gltSiPshErCwET9zFtOdxxusuos
         Zb9R+XVCLmLoSs7GlJZecTeZ3jDsm1kfyuE6LxdYEB2ZMAWd4YI5X6PhHPvXFPGYUn/m
         LuSofX+YrAK/XH+RqAD6aSyTATq9WH2XmdcoW3UZnSudo5jYBHgHXb/NPZwMNc+IfCEF
         HIQd7aT0vWfrWAOVXRZ4er6JWvwUSCp398m0AggkwuryIeBoZIOLlzUztcTUwMXCAehk
         I68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770469617; x=1771074417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rHjIXZUa5dDIO94dk7U7Rh8yW4cGtzCrjj1MjQ3dPr4=;
        b=XzIbLMb4z1K/+m/FjefHJHqoVabjA9k8/fKZBp8iZ5GwtdC7gIlldoN/eXeVj7OK2R
         OHLQ/GZsEwOaOPWmOaxVaVrRzwfrLBtgYt0UfZOZd9O9iqobosDW8FmQ0MU9BWb9TB/m
         jVgFOzf0YnuDaIkitDYrvtAFRTGXCqp7ZAYFpAihPcLEvwSVBJcyuAkhomUetDxOF5Hq
         nWTu6S8qZMxn31AWneEt0prH9btB11GPldBuDYrAXvZtVrUIWBJ1SI9jaL+KNO+S4QzE
         DfqWBqv30fS/4AtvV83yVzaHT3TFRByIL2TQP3J1PFOVBUoiz9KII7MS6KLz0ndpXdnd
         pcYA==
X-Forwarded-Encrypted: i=1; AJvYcCW4W7aXLdYDJr+G5K1bzIdbHBGCRGx6XPWDY3HKPTaCqXL7DtoOTCAxx4Tl/q6F0o3luAnaMvg5u3EF@vger.kernel.org
X-Gm-Message-State: AOJu0YyuibJvbruvySpx9nFkOUXm0z08+LRWXJFhMQGH9IA/UM2u8T20
	1skLkaNODDAwCnASJX0BzXIxqKJ52M8mAtrsxbGn5SGsdSMMBkPdupTr
X-Gm-Gg: AZuq6aK2yk7LQIAc+Wy3MOxILnnPwsotKIfrzd7MZqrxJK8Dk8jkV/y9G559qHn0nmM
	XUeSHkl8hqTWGgn0RoX80r+3wqhqixAgzroC/2WgLn3LEISTvLOXwlA5YRd0TLRpsjAaKcIJhyt
	uCjmyXWY85izUp1hOUX43z59pIOlyPe7zBQkvCnql92Q5PS1OIkVKWyF9QaXUZnBJsAojguvfv7
	1Z+e7wJhOuRv3w36GlSrQVAYE0YeaxFpOv/8FC+h368gdEbEaA625QB1DAmPlBw08tnB1X+xgG6
	a/YABL1GycNQxYfIGX4//mQtb4OHZxtk8cLRx72M74WNyk6wJL9v+2vdFVE6GXM27zhlJcXlpxp
	AV7wzOSnbFwWjD3rM652603l3EOLOY65RMehTgGAZQVb1CmLnXgYGZVC3+dqaUz7ttCC/rUI7tv
	aFBkPTNoNA3UH0H1MmKsNJ1/0c
X-Received: by 2002:a05:690e:144a:b0:649:ef5b:aeaf with SMTP id 956f58d0204a3-649ef5bbc11mr6283624d50.25.1770469616826;
        Sat, 07 Feb 2026 05:06:56 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b1ab:5cb0:a2f8:764b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649f248c511sm4991572d50.8.2026.02.07.05.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 05:06:56 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: linusw@kernel.org
Cc: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	jonas@kwiboo.se,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH v2 2/2] pinctrl: rockchip: Add RV1103B pinctrl support
Date: Sat,  7 Feb 2026 10:06:42 -0300
Message-Id: <20260207130642.2833312-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260207130642.2833312-1-festevam@gmail.com>
References: <20260207130642.2833312-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31503-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[festevam@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.992];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nabladev.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 479AB105EBD
X-Rspamd-Action: no action

From: Fabio Estevam <festevam@nabladev.com>

Add pinctrl support for the RV1103B.

Based on the 5.10 Rockchip vendor kernel driver.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
Changes since v1:
 - None.
 
 drivers/pinctrl/pinctrl-rockchip.c | 313 ++++++++++++++++++++++++++++-
 drivers/pinctrl/pinctrl-rockchip.h |   1 +
 2 files changed, 313 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 2fc67aeafdb3..092ce4cac9cf 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -467,6 +467,22 @@ static const struct pinctrl_ops rockchip_pctrl_ops = {
  * Hardware access
  */
 
+static struct rockchip_mux_recalced_data rv1103b_mux_recalced_data[] = {
+	{
+		.num = 1,
+		.pin = 6,
+		.reg = 0x10024,
+		.bit = 8,
+		.mask = 0xf
+	}, {
+		.num = 1,
+		.pin = 7,
+		.reg = 0x10024,
+		.bit = 12,
+		.mask = 0xf
+	},
+};
+
 static struct rockchip_mux_recalced_data rv1108_mux_recalced_data[] = {
 	{
 		.num = 1,
@@ -1172,6 +1188,9 @@ static int rockchip_get_mux(struct rockchip_pin_bank *bank, int pin)
 	else
 		regmap = info->regmap_base;
 
+	if (ctrl->type == RV1103B && bank->bank_num == 2 && pin >= 12)
+		return 0;
+
 	if (ctrl->type == RK3506) {
 		if (bank->bank_num == 1)
 			regmap = info->regmap_ioc1;
@@ -1298,6 +1317,9 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 	else
 		regmap = info->regmap_base;
 
+	if (ctrl->type == RV1103B && bank->bank_num == 2 && pin >= 12)
+		return 0;
+
 	if (ctrl->type == RK3506) {
 		if (bank->bank_num == 1)
 			regmap = info->regmap_ioc1;
@@ -1495,6 +1517,214 @@ static int px30_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
 	return 0;
 }
 
+#define RV1103B_DRV_BITS_PER_PIN		8
+#define RV1103B_DRV_PINS_PER_REG		2
+#define RV1103B_DRV_GPIO0_A_OFFSET		0x40100
+#define RV1103B_DRV_GPIO0_B_OFFSET		0x50110
+#define RV1103B_DRV_GPIO1_A01_OFFSET		0x140
+#define RV1103B_DRV_GPIO1_A67_OFFSET		0x1014C
+#define RV1103B_DRV_GPIO2_OFFSET		0x30180
+#define RV1103B_DRV_GPIO2_SARADC_OFFSET		0x3080C
+
+static int rv1103b_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
+				       int pin_num, struct regmap **regmap,
+				       int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+	int ret = 0;
+
+	*regmap = info->regmap_base;
+	switch (bank->bank_num) {
+	case 0:
+		if (pin_num < 7)
+			*reg = RV1103B_DRV_GPIO0_A_OFFSET;
+		else if (pin_num > 7 && pin_num < 14)
+			*reg = RV1103B_DRV_GPIO0_B_OFFSET - 0x10;
+		else
+			ret = -EINVAL;
+		break;
+
+	case 1:
+		if (pin_num < 6)
+			*reg = RV1103B_DRV_GPIO1_A01_OFFSET;
+		else if (pin_num >= 6 && pin_num < 23)
+			*reg = RV1103B_DRV_GPIO1_A67_OFFSET - 0xc;
+		else if (pin_num >= 24 && pin_num < 30)
+			*reg = RV1103B_DRV_GPIO1_A67_OFFSET - 0xc;
+		else
+			ret = -EINVAL;
+		break;
+
+	case 2:
+		if (pin_num < 12) {
+			*reg = RV1103B_DRV_GPIO2_OFFSET;
+		} else if (pin_num >= 16) {
+			ret = -EINVAL;
+		} else {
+			*reg = RV1103B_DRV_GPIO2_SARADC_OFFSET;
+			*bit = 10;
+
+			return 0;
+		}
+		break;
+
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	if (ret) {
+		dev_err(info->dev, "unsupported bank_num %d pin_num %d\n", bank->bank_num, pin_num);
+
+		return ret;
+	}
+
+	*reg += ((pin_num / RV1103B_DRV_PINS_PER_REG) * 4);
+	*bit = pin_num % RV1103B_DRV_PINS_PER_REG;
+	*bit *= RV1103B_DRV_BITS_PER_PIN;
+
+	return 0;
+}
+
+#define RV1103B_PULL_BITS_PER_PIN		2
+#define RV1103B_PULL_PINS_PER_REG		8
+#define RV1103B_PULL_GPIO0_A_OFFSET		0x40200
+#define RV1103B_PULL_GPIO0_B_OFFSET		0x50204
+#define RV1103B_PULL_GPIO1_A01_OFFSET		0x210
+#define RV1103B_PULL_GPIO1_A67_OFFSET		0x10210
+#define RV1103B_PULL_GPIO2_OFFSET		0x30220
+#define RV1103B_PULL_GPIO2_SARADC_OFFSET	0x3080C
+
+static int rv1103b_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
+					int pin_num, struct regmap **regmap,
+					int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+	int ret = 0;
+
+	*regmap = info->regmap_base;
+	switch (bank->bank_num) {
+	case 0:
+		if (pin_num < 7)
+			*reg = RV1103B_PULL_GPIO0_A_OFFSET;
+		else if (pin_num > 7 && pin_num < 14)
+			*reg = RV1103B_PULL_GPIO0_B_OFFSET - 0x4;
+		else
+			ret = -EINVAL;
+		break;
+
+	case 1:
+		if (pin_num < 6)
+			*reg = RV1103B_PULL_GPIO1_A01_OFFSET;
+		else if (pin_num >= 6 && pin_num < 23)
+			*reg = RV1103B_PULL_GPIO1_A67_OFFSET;
+		else if (pin_num >= 24 && pin_num < 30)
+			*reg = RV1103B_PULL_GPIO1_A67_OFFSET;
+		else
+			ret = -EINVAL;
+		break;
+
+	case 2:
+		if (pin_num < 12) {
+			*reg = RV1103B_PULL_GPIO2_OFFSET;
+		} else if (pin_num >= 16) {
+			ret = -EINVAL;
+		} else {
+			*reg = RV1103B_PULL_GPIO2_SARADC_OFFSET;
+			*bit = 13;
+
+			return 0;
+		}
+		break;
+
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	if (ret) {
+		dev_err(info->dev, "unsupported bank_num %d pin_num %d\n", bank->bank_num, pin_num);
+
+		return ret;
+	}
+
+	*reg += ((pin_num / RV1103B_PULL_PINS_PER_REG) * 4);
+	*bit = pin_num % RV1103B_PULL_PINS_PER_REG;
+	*bit *= RV1103B_PULL_BITS_PER_PIN;
+
+	return 0;
+}
+
+#define RV1103B_SMT_BITS_PER_PIN		1
+#define RV1103B_SMT_PINS_PER_REG		8
+#define RV1103B_SMT_GPIO0_A_OFFSET		0x40400
+#define RV1103B_SMT_GPIO0_B_OFFSET		0x50404
+#define RV1103B_SMT_GPIO1_A01_OFFSET		0x410
+#define RV1103B_SMT_GPIO1_A67_OFFSET		0x10410
+#define RV1103B_SMT_GPIO2_OFFSET		0x30420
+#define RV1103B_SMT_GPIO2_SARADC_OFFSET		0x3080C
+
+static int rv1103b_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
+					   int pin_num,
+					   struct regmap **regmap,
+					   int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+	int ret = 0;
+
+	*regmap = info->regmap_base;
+	switch (bank->bank_num) {
+	case 0:
+		if (pin_num < 7)
+			*reg = RV1103B_SMT_GPIO0_A_OFFSET;
+		else if (pin_num > 7 && pin_num < 14)
+			*reg = RV1103B_SMT_GPIO0_B_OFFSET - 0x4;
+		else
+			ret = -EINVAL;
+		break;
+
+	case 1:
+		if (pin_num < 6)
+			*reg = RV1103B_SMT_GPIO1_A01_OFFSET;
+		else if (pin_num >= 6 && pin_num < 23)
+			*reg = RV1103B_SMT_GPIO1_A67_OFFSET;
+		else if (pin_num >= 24 && pin_num < 30)
+			*reg = RV1103B_SMT_GPIO1_A67_OFFSET;
+		else
+			ret = -EINVAL;
+		break;
+
+	case 2:
+		if (pin_num < 12) {
+			*reg = RV1103B_SMT_GPIO2_OFFSET;
+		} else if (pin_num >= 16) {
+			ret = -EINVAL;
+		} else {
+			*reg = RV1103B_SMT_GPIO2_SARADC_OFFSET;
+			*bit = 8;
+
+			return 0;
+		}
+		break;
+
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	if (ret) {
+		dev_err(info->dev, "unsupported bank_num %d pin_num %d\n", bank->bank_num, pin_num);
+
+		return ret;
+	}
+
+	*reg += ((pin_num / RV1103B_SMT_PINS_PER_REG) * 4);
+	*bit = pin_num % RV1103B_SMT_PINS_PER_REG;
+	*bit *= RV1103B_SMT_BITS_PER_PIN;
+
+	return 0;
+}
+
 #define RV1108_PULL_PMU_OFFSET		0x10
 #define RV1108_PULL_OFFSET		0x110
 #define RV1108_PULL_PINS_PER_REG	8
@@ -2982,6 +3212,9 @@ static int rockchip_get_drive_perpin(struct rockchip_pin_bank *bank,
 	u8 bit;
 	int drv_type = bank->drv[pin_num / 8].drv_type;
 
+	if (ctrl->type == RV1103B && pin_num >= 12)
+		drv_type = DRV_TYPE_IO_LEVEL_2_BIT;
+
 	ret = ctrl->drv_calc_reg(bank, pin_num, &regmap, &reg, &bit);
 	if (ret)
 		return ret;
@@ -3043,6 +3276,11 @@ static int rockchip_get_drive_perpin(struct rockchip_pin_bank *bank,
 	if (ret)
 		return ret;
 
+	if (ctrl->type == RV1103B && bank->bank_num == 2 && pin_num >= 12) {
+		data = data >> 10;
+		return data & 0x3;
+	}
+
 	data >>= bit;
 	data &= (1 << rmask_bits) - 1;
 
@@ -3071,7 +3309,8 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 		rmask_bits = RK3588_DRV_BITS_PER_PIN;
 		ret = strength;
 		goto config;
-	} else if (ctrl->type == RK3506 ||
+	} else if (ctrl->type == RV1103B ||
+		   ctrl->type == RK3506 ||
 		   ctrl->type == RK3528 ||
 		   ctrl->type == RK3562 ||
 		   ctrl->type == RK3568) {
@@ -3182,6 +3421,12 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 			ret = strength;
 		}
 	}
+
+	if (ctrl->type == RV1103B && bank->bank_num == 2 && pin_num >= 12) {
+		rmask_bits = 2;
+		ret = strength;
+	}
+
 	/* enable the write to the equivalent lower bits */
 	data = ((1 << rmask_bits) - 1) << (bit + 16);
 	rmask = data | (data >> 16);
@@ -3236,6 +3481,7 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
 				? PIN_CONFIG_BIAS_PULL_PIN_DEFAULT
 				: PIN_CONFIG_BIAS_DISABLE;
 	case PX30:
+	case RV1103B:
 	case RV1108:
 	case RK3188:
 	case RK3288:
@@ -3251,6 +3497,9 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
 		pull_type = bank->pull_type[pin_num / 8];
 		data >>= bit;
 		data &= (1 << RK3188_PULL_BITS_PER_PIN) - 1;
+
+		if (ctrl->type == RV1103B && bank->bank_num == 2 && pin_num >= 12)
+			pull_type = 1;
 		/*
 		 * In the TRM, pull-up being 1 for everything except the GPIO0_D3-D6,
 		 * where that pull up value becomes 3.
@@ -3297,6 +3546,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 		ret = regmap_write(regmap, reg, data);
 		break;
 	case PX30:
+	case RV1103B:
 	case RV1108:
 	case RV1126:
 	case RK3188:
@@ -3312,6 +3562,8 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 	case RK3576:
 	case RK3588:
 		pull_type = bank->pull_type[pin_num / 8];
+		if (ctrl->type == RV1103B && bank->bank_num == 2 && pin_num >= 12)
+			pull_type = 1;
 		ret = -EINVAL;
 		for (i = 0; i < ARRAY_SIZE(rockchip_pull_list[pull_type]);
 			i++) {
@@ -3417,6 +3669,11 @@ static int rockchip_get_schmitt(struct rockchip_pin_bank *bank, int pin_num)
 	if (ret)
 		return ret;
 
+	if (ctrl->type == RV1103B && bank->bank_num == 2 && pin_num >= 12) {
+		data >>= 8;
+		return data & 0x3;
+	}
+
 	data >>= bit;
 	switch (ctrl->type) {
 	case RK3562:
@@ -3473,6 +3730,12 @@ static int rockchip_set_schmitt(struct rockchip_pin_bank *bank,
 		}
 	}
 
+	if (ctrl->type == RV1103B && bank->bank_num == 2 && pin_num >= 12) {
+		data = 0x3 << (bit + 16);
+		rmask = data | (data >> 16);
+		data |= ((enable ? 0x3 : 0) << bit);
+	}
+
 	return regmap_update_bits(regmap, reg, rmask, data);
 }
 
@@ -3579,6 +3842,7 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
 	case RK3066B:
 		return pull ? false : true;
 	case PX30:
+	case RV1103B:
 	case RV1108:
 	case RV1126:
 	case RK3188:
@@ -4319,6 +4583,51 @@ static struct rockchip_pin_ctrl px30_pin_ctrl = {
 		.schmitt_calc_reg	= px30_calc_schmitt_reg_and_bit,
 };
 
+static struct rockchip_pin_bank rv1103b_pin_banks[] = {
+	PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS(0, 32, "gpio0",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0x40000, 0x50008, 0x50010, 0x50018,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT),
+	PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS(1, 32, "gpio1",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0x20, 0x10028, 0x10030, 0x10038,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT),
+	PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS(2, 32, "gpio2",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0x30040, 0x30048, 0x30050, 0x30058,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT),
+};
+
+static struct rockchip_pin_ctrl rv1103b_pin_ctrl __maybe_unused = {
+	.pin_banks		= rv1103b_pin_banks,
+	.nr_banks		= ARRAY_SIZE(rv1103b_pin_banks),
+	.label			= "RV1103B-GPIO",
+	.type			= RV1103B,
+	.iomux_recalced		= rv1103b_mux_recalced_data,
+	.niomux_recalced	= ARRAY_SIZE(rv1103b_mux_recalced_data),
+	.pull_calc_reg		= rv1103b_calc_pull_reg_and_bit,
+	.drv_calc_reg		= rv1103b_calc_drv_reg_and_bit,
+	.schmitt_calc_reg	= rv1103b_calc_schmitt_reg_and_bit,
+};
+
 static struct rockchip_pin_bank rv1108_pin_banks[] = {
 	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", IOMUX_SOURCE_PMU,
 					     IOMUX_SOURCE_PMU,
@@ -4955,6 +5264,8 @@ static struct rockchip_pin_ctrl rk3588_pin_ctrl = {
 static const struct of_device_id rockchip_pinctrl_dt_match[] = {
 	{ .compatible = "rockchip,px30-pinctrl",
 		.data = &px30_pin_ctrl },
+	{ .compatible = "rockchip,rv1103b-pinctrl",
+		.data = &rv1103b_pin_ctrl },
 	{ .compatible = "rockchip,rv1108-pinctrl",
 		.data = &rv1108_pin_ctrl },
 	{ .compatible = "rockchip,rv1126-pinctrl",
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index 4f4aff42a80a..bb0e803e3b8a 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -185,6 +185,7 @@
 
 enum rockchip_pinctrl_type {
 	PX30,
+	RV1103B,
 	RV1108,
 	RV1126,
 	RK2928,
-- 
2.34.1


