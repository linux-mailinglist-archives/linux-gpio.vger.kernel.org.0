Return-Path: <linux-gpio+bounces-31495-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Ky9AlcvhmkTKQQAu9opvQ
	(envelope-from <linux-gpio+bounces-31495-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 19:13:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9696E101AAD
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 19:13:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7A8330209C3
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Feb 2026 18:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A9B426D38;
	Fri,  6 Feb 2026 18:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bp5wzyeO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ACB426D2F
	for <linux-gpio@vger.kernel.org>; Fri,  6 Feb 2026 18:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770401617; cv=none; b=rO7WjB8GbZupzrKtmhWSfUfesbAWtyg3L3488uFGrzpg1ObtEuAytqYroyS2IjETTYaIUmn+Vf76A/BbLGNwFp5enVYoyHPner34hoBO2BpNZHqZosfsS1G0vvJKOVbcUsfHtZTEEu1QFyfeHfPSQTgJQs2+qYxEjGKL8O8IpJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770401617; c=relaxed/simple;
	bh=qoGNulMyQBEEKldhkrTSGTYY+tDj/7xBDUW7JwkwxBU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CBYO6LTkJy0rdb3aj162TlRcfKqyqIItVtMNw546YwpSEQs2RxSYA6hvwO6Dcl1Fq/veaU4Wbda7MQpluofzqIqUg1IsiLgfCfJzsCJh8X3b5EJcv+F8cTVY0xNb6mcTl0PuPPha1uRD8EiaRyVHM1jDqhOsl717oM+Nx3ToNRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bp5wzyeO; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-124a677c9afso1717328c88.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Feb 2026 10:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770401616; x=1771006416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNoIv4GR7TzgzReFnrFhQpAiiK0LF7Idur8j5KUiL5g=;
        b=bp5wzyeOc9Z+L6BHVn94/jpj/44B9OQnfrKvaTKysh2DV1sa+TJdeDV/YD9eLQ7SpF
         wPtdDLLND5JqPXQtr6B+d2IR85shsTBtTj3dEP3uKqKLeKEOf7xjL5Q9ktGtETQ0QxSj
         YvmxAXELYIn0GiJx5248gqIaNfRV7XvNHXGMGFBcSGImLXB8N9vz4IzUqlUKuR90+UIc
         mHBNM2N1R+MWMYJ3z21Hdj45uTkvpOQNN+MhJFe8OUqom8smdE3lpAntlxC1bnlQR4VU
         iJ4571s+lSR87kRYfMXJzXkSN0C0nT7sEWN/yCX431cAYAYG/I/Sn19w5n33zwM9doNs
         4z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770401616; x=1771006416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uNoIv4GR7TzgzReFnrFhQpAiiK0LF7Idur8j5KUiL5g=;
        b=bLQzC04ITLLksxOPzKX+nn0sKhMIs14YNWBP8qbNhSi/ckZhdINs+qw4O/tsiywlIL
         /8HCNlT3P9C4zjHcitthEU6jB+TP5ILUVfo/aM+nUPVFLGcYF0ORMdBfF9OM+E1adcu+
         3z3RxUPqx3Q/5v+SJM3c4rQxBZGoUhH1xAC077L3vQ+K0ke8rhaRbGgPaBpx9mD160E/
         kpWPSixZyk/EjcSvZIiCa/7TC8qpRCeGgLeACDtK/PhTA1oRVCn8xF80H+g4s3hvBGon
         SK21+P/k3j58kwaMhfrv9txAHu9l6qjvUuDcvjb1art0pNZUnFFfE3y/7GzwjQZhIxnO
         a8Sw==
X-Forwarded-Encrypted: i=1; AJvYcCXM3b2p80W4cl7CTpDpuSZKsuHcGY0cHhC1fUtVErY3+j92DVC8v/K9yzOwaDAy6J4dFKsCeai9jh9c@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9VZwfV0WRilozlAgY3f9PI2scM0gmexOWxgjyZsR7Qc7+IBoi
	7PAx9Scgl1ZL1IDQL7aTmKiOx4DR16TUJPU/Wme/tavy4/Q1WWXnvElxp0KXtQ==
X-Gm-Gg: AZuq6aL6nM+mK6ihbDlpADNyO4VO+b/Pj1gZ/Kuvq+XJXtgXmN/dk46W+hJ86XMD+iI
	8nKcEnSRfHd7Ih6TeAd/N9p//Gm55mofqDV0XGuxdsqcpcgwz9VE07amfypbs4tSdj2Dx8E2HMa
	rM1YItX052KF/BiTlj0X+UFCYB5cFyUrdJixqioOP8BuWlTwvvCgDapbivqqin/Ks6KYDGZ1EAL
	qDR6fbPH5CWyt5AemHIAKEyZI0sbSlgE7v6ExTAP7oXz/sGXKRIwfisoW7Vlon9iUVGYTg39KIs
	XuUW+0k2RV+SR0PP9d0ZNe/fwRU6aWXhISlqws5wGcGUoFZJS71CSW3JxCAxpQQJqGnzP59zaJB
	IxlLXHswldRUCHnqrxwvLXG+QRvlo9sy3iMoYBvNjq3e0Nwd+jOA9l8+KbbCnMUQhWSbcayhrR/
	ywmSVOg6CVwq3HB7v9w81HwvTgpjBiCD6nlJc=
X-Received: by 2002:a05:7022:45a0:b0:11e:528:4185 with SMTP id a92af1059eb24-127040884demr1544351c88.38.1770401616243;
        Fri, 06 Feb 2026 10:13:36 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:44a3:2bb7:a035:fd7e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1270433ab31sm2782500c88.11.2026.02.06.10.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 10:13:35 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@nabladev.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH 05/11] pinctrl: rockchip: Add RV1103B pinctrl support
Date: Fri,  6 Feb 2026 15:13:03 -0300
Message-Id: <20260206181309.2696095-6-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206181309.2696095-1-festevam@gmail.com>
References: <20260206181309.2696095-1-festevam@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31495-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[festevam@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.993];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nabladev.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9696E101AAD
X-Rspamd-Action: no action

From: Fabio Estevam <festevam@nabladev.com>

Add pinctrl support for the RV1103B.

Based on the 5.10 Rockchip vendor kernel driver.

Cc: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 313 ++++++++++++++++++++++++++++-
 drivers/pinctrl/pinctrl-rockchip.h |   1 +
 2 files changed, 313 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 816823403e97..527548354c0f 100644
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
@@ -4318,6 +4582,51 @@ static struct rockchip_pin_ctrl px30_pin_ctrl = {
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
@@ -4954,6 +5263,8 @@ static struct rockchip_pin_ctrl rk3588_pin_ctrl = {
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


