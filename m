Return-Path: <linux-gpio+bounces-39539-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4CVBDVEJTGqrfAEAu9opvQ
	(envelope-from <linux-gpio+bounces-39539-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 22:00:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B200F71537B
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 22:00:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=DpOPMp3P;
	dmarc=pass (policy=none) header.from=chromium.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39539-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39539-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A778303CC6F
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 19:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DCBC3DBD4D;
	Mon,  6 Jul 2026 19:59:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A833D646B
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 19:59:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783367964; cv=none; b=rHaYc0jctPBAiYeoXiTz6LsdnyuSfgqEtVTACIin3StNY39q9+w1egwW4NS82yLI00Rowsd9JLDR7jJI6tvf4MU+q6JEUPFf7edtqSIlEum75Evh4dQ5B4g/WlTNm+FFggVuZUp3YsihAOZBxB6s8OhTLOb1QwqjcE7RujEqDnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783367964; c=relaxed/simple;
	bh=zm4pwa0j8aQAbGAAQ2fHIgg7PP4VgszcHMA35/t268s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WaN49hVWha++lVLrgF8d4Wwd3VadpBXoKLT29MaHlO3Kivvgp90chzWAWaTQ17UVJ8jMyKd3/YtEtg85e81UqsTW638nCtwQXLclD/YofWd6lHmLrJ3xq/hTHYqiTfrKyjXwAgkQOGTBbQ0JM17MUcukv2LmxLAyVBhzAOXOdqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DpOPMp3P; arc=none smtp.client-ip=209.85.161.49
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6a192afad7dso1807670eaf.2
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 12:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783367958; x=1783972758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvpgM8iEMmGwLW3WZ/vDkcz2b692kXnqlfLB+Q/ZfdA=;
        b=DpOPMp3PGKkGSPLULhJbaFOsql19pnMFHfjTpchMHQEQtcKfrcsoLTpmE96X+6K9Lz
         dIJ/Oz357djH/QUbjXDqk70Wq1XtOnh7GrBmQelQU3R+gDBkid64SM540R+VlRlCJBXV
         4xtoCMr4k98l2XQ4qBbu6Crjk1aQKwxWyb1nQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783367958; x=1783972758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvpgM8iEMmGwLW3WZ/vDkcz2b692kXnqlfLB+Q/ZfdA=;
        b=NLUe1CahwUU6u05wYlO2v9Fb+xQrBhewVWqZa3WHLhCMhMzYT0sTYtjYnP8dhS/8Tj
         3G9IOZ8GypDptqFFbg+DI1jwNjHu/T82BUpT6s4ncd+lWWoA1ge4Vak2oL+klu5yXbIL
         xrkRzIcVgAa4/+hGO3p3vZMOr5unLiZIkKACdfq2BmjKioxRtOJUSAB8YvNuZmlzfFaM
         cGCATrT4Z8mkQuAfct+2Y+sviSWzczV7f+UjAs6vSx2DC+OV5vkyNI0uVK4g7uqUwwLr
         AJBxp0YGWzD+PpVEoDzGHeWroKDhnCz3ExULofotGznPAawWvs/aVrRCnagFG8CqYWMY
         L1nA==
X-Forwarded-Encrypted: i=1; AFNElJ9f0E3MgCH7neXwkaCHfCt5k0j+LlGoWxuPrMuGngZjbRLBcXBkCxHA7D/BqVQj+HBOgZH9zKMxU4kb@vger.kernel.org
X-Gm-Message-State: AOJu0YywwA1mRu6acR3RegZ6BNgUs8gucfO6a7fLxm6hd8m/cASgrNaB
	7UIf4E74xWeNlfWVpN8KdMs5spuzkBX2dC+KuhDNeNqCsB3TIHvY6eJMJYVp9PR5Lg==
X-Gm-Gg: AfdE7cl8bCVourPcnnG2Td976vOpB8RRToLyz50Hc16QmqDZ6kTLhMbsmChxMnane3E
	vhMZZT/8ng9T1mDODzR3NJX+1Hp+NOANwq9bWW0Ft3BeaZRoJdqttmUMR4DWTwlOkKRQdMezRWb
	MliM70EgrzV0UZFSV7vs4KWpl/t6WhcFFFSi4i27zZw5eQKMvp2r1805bKFWXim/9ES7JBX1fKI
	LgXmpkiVfpQwWF0sVbXw+XoTq5qbUq6N1X7j4PBjOIOHD0iF9Tjep+B02DLSCjAxFnPBv2gM2XC
	JrH6XzWA/RLgGQE6Rv/EJ4WGSSVt+Ze7UJXCpeKZ3tpyJgw8zZbbTxI5Qe2nlhUhyZZfZAEiNWe
	HYGSZ7Dj5hyKhXwS2fg0r2tbSOoqAcGK/zVoA0ZbXwS+iODbP93HM7hjrf0G8nBZHv9v/vvpj4o
	wI1wyfz3qzrbEbRfScEA==
X-Received: by 2002:a05:6820:1806:b0:6a1:8b23:d4c8 with SMTP id 006d021491bc7-6a35538decamr1446369eaf.3.1783367958449;
        Mon, 06 Jul 2026 12:59:18 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542d017csm12161834a34.8.2026.07.06.12.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:59:17 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Linus Walleij <linusw@kernel.org>,
	huang lin <hl@rock-chips.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/12] pinctrl: rockchip: Add RV1106 pinctrl support
Date: Mon,  6 Jul 2026 13:58:00 -0600
Message-ID: <20260706195818.3906949-5-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706195818.3906949-1-sjg@chromium.org>
References: <20260706195818.3906949-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39539-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:heiko@sntech.de,m:linux-rockchip@lists.infradead.org,m:devicetree@vger.kernel.org,m:festevam@nabladev.com,m:linux-arm-kernel@lists.infradead.org,m:sjg@chromium.org,m:jeffy.chen@rock-chips.com,m:linusw@kernel.org,m:hl@rock-chips.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sjg@chromium.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sjg@chromium.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chromium.org:from_mime,chromium.org:email,chromium.org:mid,chromium.org:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B200F71537B

Add pinctrl support for the Rockchip RV1106, taken from the vendor
kernel in the Luckfox Pico SDK [1] at commit 824b817f8 (a Linux
5.10.160 kernel tree). The IOC registers are spread across several
blocks, addressed through per-bank offsets, with the GPIO0 block in the
PMU. The drive strength uses the RK3568-style exponential encoding.

The RV1103 is a package variant of the RV1106 with fewer pins and uses
the same pin controller.

[1] https://github.com/LuckfoxTECH/luckfox-pico

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 drivers/pinctrl/pinctrl-rockchip.c | 208 +++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-rockchip.h |   1 +
 2 files changed, 209 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 7e0fcd45fd26..f9cbcb955853 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -1725,6 +1725,166 @@ static int rv1103b_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
 	return 0;
 }
 
+#define RV1106_DRV_BITS_PER_PIN		8
+#define RV1106_DRV_PINS_PER_REG		2
+#define RV1106_DRV_GPIO0_OFFSET		0x10
+#define RV1106_DRV_GPIO1_OFFSET		0x80
+#define RV1106_DRV_GPIO2_OFFSET		0x100C0
+#define RV1106_DRV_GPIO3_OFFSET		0x20100
+#define RV1106_DRV_GPIO4_OFFSET		0x30020
+
+static int rv1106_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
+				       int pin_num, struct regmap **regmap,
+				       int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	/* GPIO0_IOC is located in PMU */
+	switch (bank->bank_num) {
+	case 0:
+		*regmap = info->regmap_pmu;
+		*reg = RV1106_DRV_GPIO0_OFFSET;
+		break;
+
+	case 1:
+		*regmap = info->regmap_base;
+		*reg = RV1106_DRV_GPIO1_OFFSET;
+		break;
+
+	case 2:
+		*regmap = info->regmap_base;
+		*reg = RV1106_DRV_GPIO2_OFFSET;
+		break;
+
+	case 3:
+		*regmap = info->regmap_base;
+		*reg = RV1106_DRV_GPIO3_OFFSET;
+		break;
+
+	case 4:
+		*regmap = info->regmap_base;
+		*reg = RV1106_DRV_GPIO4_OFFSET;
+		break;
+
+	default:
+		dev_err(info->dev, "unsupported bank_num %d\n", bank->bank_num);
+		break;
+	}
+
+	*reg += ((pin_num / RV1106_DRV_PINS_PER_REG) * 4);
+	*bit = pin_num % RV1106_DRV_PINS_PER_REG;
+	*bit *= RV1106_DRV_BITS_PER_PIN;
+
+	return 0;
+}
+
+#define RV1106_PULL_BITS_PER_PIN		2
+#define RV1106_PULL_PINS_PER_REG		8
+#define RV1106_PULL_GPIO0_OFFSET		0x38
+#define RV1106_PULL_GPIO1_OFFSET		0x1C0
+#define RV1106_PULL_GPIO2_OFFSET		0x101D0
+#define RV1106_PULL_GPIO3_OFFSET		0x201E0
+#define RV1106_PULL_GPIO4_OFFSET		0x30070
+
+static int rv1106_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
+					int pin_num, struct regmap **regmap,
+					int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	/* GPIO0_IOC is located in PMU */
+	switch (bank->bank_num) {
+	case 0:
+		*regmap = info->regmap_pmu;
+		*reg = RV1106_PULL_GPIO0_OFFSET;
+		break;
+
+	case 1:
+		*regmap = info->regmap_base;
+		*reg = RV1106_PULL_GPIO1_OFFSET;
+		break;
+
+	case 2:
+		*regmap = info->regmap_base;
+		*reg = RV1106_PULL_GPIO2_OFFSET;
+		break;
+
+	case 3:
+		*regmap = info->regmap_base;
+		*reg = RV1106_PULL_GPIO3_OFFSET;
+		break;
+
+	case 4:
+		*regmap = info->regmap_base;
+		*reg = RV1106_PULL_GPIO4_OFFSET;
+		break;
+
+	default:
+		dev_err(info->dev, "unsupported bank_num %d\n", bank->bank_num);
+		break;
+	}
+
+	*reg += ((pin_num / RV1106_PULL_PINS_PER_REG) * 4);
+	*bit = pin_num % RV1106_PULL_PINS_PER_REG;
+	*bit *= RV1106_PULL_BITS_PER_PIN;
+
+	return 0;
+}
+
+#define RV1106_SMT_BITS_PER_PIN		1
+#define RV1106_SMT_PINS_PER_REG		8
+#define RV1106_SMT_GPIO0_OFFSET		0x40
+#define RV1106_SMT_GPIO1_OFFSET		0x280
+#define RV1106_SMT_GPIO2_OFFSET		0x10290
+#define RV1106_SMT_GPIO3_OFFSET		0x202A0
+#define RV1106_SMT_GPIO4_OFFSET		0x300A0
+
+static int rv1106_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
+					   int pin_num,
+					   struct regmap **regmap,
+					   int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	/* GPIO0_IOC is located in PMU */
+	switch (bank->bank_num) {
+	case 0:
+		*regmap = info->regmap_pmu;
+		*reg = RV1106_SMT_GPIO0_OFFSET;
+		break;
+
+	case 1:
+		*regmap = info->regmap_base;
+		*reg = RV1106_SMT_GPIO1_OFFSET;
+		break;
+
+	case 2:
+		*regmap = info->regmap_base;
+		*reg = RV1106_SMT_GPIO2_OFFSET;
+		break;
+
+	case 3:
+		*regmap = info->regmap_base;
+		*reg = RV1106_SMT_GPIO3_OFFSET;
+		break;
+
+	case 4:
+		*regmap = info->regmap_base;
+		*reg = RV1106_SMT_GPIO4_OFFSET;
+		break;
+
+	default:
+		dev_err(info->dev, "unsupported bank_num %d\n", bank->bank_num);
+		break;
+	}
+
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
@@ -3310,6 +3470,7 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 		ret = strength;
 		goto config;
 	} else if (ctrl->type == RV1103B ||
+		   ctrl->type == RV1106 ||
 		   ctrl->type == RK3506 ||
 		   ctrl->type == RK3528 ||
 		   ctrl->type == RK3562 ||
@@ -3482,6 +3643,7 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
 				: PIN_CONFIG_BIAS_DISABLE;
 	case PX30:
 	case RV1103B:
+	case RV1106:
 	case RV1108:
 	case RK3188:
 	case RK3288:
@@ -3547,6 +3709,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 		break;
 	case PX30:
 	case RV1103B:
+	case RV1106:
 	case RV1108:
 	case RV1126:
 	case RK3188:
@@ -3843,6 +4006,7 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
 		return pull ? false : true;
 	case PX30:
 	case RV1103B:
+	case RV1106:
 	case RV1108:
 	case RV1126:
 	case RK3188:
@@ -4623,6 +4787,48 @@ static struct rockchip_pin_ctrl rv1103b_pin_ctrl __maybe_unused = {
 	.schmitt_calc_reg	= rv1103b_calc_schmitt_reg_and_bit,
 };
 
+static struct rockchip_pin_bank rv1106_pin_banks[] = {
+	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0",
+			     IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
+			     IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
+			     IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
+			     IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU),
+	PIN_BANK_IOMUX_FLAGS_OFFSET(1, 32, "gpio1",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0, 0x08, 0x10, 0x18),
+	PIN_BANK_IOMUX_FLAGS_OFFSET(2, 32, "gpio2",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0x10020, 0x10028, 0, 0),
+	PIN_BANK_IOMUX_FLAGS_OFFSET(3, 32, "gpio3",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0x20040, 0x20048, 0x20050, 0x20058),
+	PIN_BANK_IOMUX_FLAGS_OFFSET(4, 24, "gpio4",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0,
+				    0x30000, 0x30008, 0x30010, 0),
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
@@ -5261,6 +5467,8 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
 		.data = &px30_pin_ctrl },
 	{ .compatible = "rockchip,rv1103b-pinctrl",
 		.data = &rv1103b_pin_ctrl },
+	{ .compatible = "rockchip,rv1106-pinctrl",
+		.data = &rv1106_pin_ctrl },
 	{ .compatible = "rockchip,rv1108-pinctrl",
 		.data = &rv1108_pin_ctrl },
 	{ .compatible = "rockchip,rv1126-pinctrl",
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index bb0e803e3b8a..e8b5e850bbef 100644
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
-- 
2.43.0


