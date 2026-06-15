Return-Path: <linux-gpio+bounces-38457-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id llKMCEWoL2rhEAUAu9opvQ
	(envelope-from <linux-gpio+bounces-38457-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 09:22:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8056842B2
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 09:22:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SVnfL7pK;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38457-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38457-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B993C301B17D
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 07:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC40C3BCD28;
	Mon, 15 Jun 2026 07:20:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC4B29BDBB
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 07:20:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781508038; cv=none; b=ov6x9MnteFfFmr0FRkttmxQTo8Q3oEIIYClo+HQOQN6Y+AokXaDtYsCnPRRV3zILZdQNDvgmIv7ctdt/TvVtnANkAlecwvy1nYGYmfSwP7rrUdFMTVnx66bfUH+Ap4BCgWGK6k9jSFWtsor6V61EVdbPKxkwOFNUvgOTJDwqzbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781508038; c=relaxed/simple;
	bh=1YL8sPszBXVqeUac431h1lj2JyEuirOXoQmN47nQcGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b6eN6fMcUSRIe8eNyaphEfkAJCbKkgjwywfnG5TNkcvL0MoxE1SVLn5siHL/qFJmU2/2q5tPNJEiWB2xnScvy1DXW53fSt16+QnbS2wV/AZkWs7qZTqLNb/hfy7gDyagQEF7l7ly92OcIOYvqYzYO7M/Jyty+2FULdyXvQypTfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVnfL7pK; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49222b6e871so15596325e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 00:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781508034; x=1782112834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wINyseeJxapeyBVBOl6gJLd9xmd6tC96LZmJ/8JBYbQ=;
        b=SVnfL7pKV0BkOtvYn8WbKAmWvMc2jNaq+Z8J/otftcYD/CGrNHkP7Z46qTsOcIi0Q5
         gibczQaNjCLvq7iObk8Ii8iMLS6SMsytRz5/UUYbObwqcT5jU1aI8I3E5rkn7xbT1TYg
         jhAOaLjvq8gyZMx4bMgdnZZvAHObYIa+CTjaUWf/zlQw7DVQ4ImPSLMGRg3fDAkxBIQb
         MGR0mZCl85OYsu24Vu9ahU9yDnwyvW21o15AkCtiH3T3+XNzSK6n1lMiGuKlTvCR6NIe
         NK+cwOoISnBH/T0hVVH7p6JMfF817mo3s9JjdEX2A9MFp3GJ69R5FT0V3fYOImUuzyB7
         ON/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781508034; x=1782112834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wINyseeJxapeyBVBOl6gJLd9xmd6tC96LZmJ/8JBYbQ=;
        b=iVanJAhXKVdokfPq/2Tgcb0+kZSvK4A9A0QvMaqpvBqcL1wRyUdFSFzXFJtKMLjZpo
         ZJHBqFVCa28hTWnv5Nyj4r/8+vy0Vg//jSEcOefiSAor5SeTbZYn2uQuyphbW9L+wKKy
         YK8RoWYG5eMZgQpN72iULlY+BBL1nY+KS2k1/nu9UAr/MjIi+hPByp0LwLHO+NIBny0y
         W8Fb0+dCepXiAHRF2iVPXd6SDQBI3ATyRZL2hKjuVsuCWXUvu/IUGP36LtDyhHuKk6R/
         LuaMaszizkg1JqHg+s4oqVuHGRrbI/0ivAPD8cqTk4KrekLa2rhVppDfJblIJ+opD9AC
         DyAA==
X-Forwarded-Encrypted: i=1; AFNElJ9e1UFLbG3rFYc8eooQlhnpYDw6x+31w1y/LlbwLebcT53epCa3Kxl3AXD6ugRnjx226RaJtlAlABTb@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy8L1JP6jvC88pmb+5MsFEvaX5PCzludHmg2lh5cIZfhnA3HUm
	wRH2nJjQH12UPr7mFKP6jG71Hn6EOC6XEDwuKOx9zw4RxHCydJuyeYcV
X-Gm-Gg: Acq92OHvNvUE2Ghi4JMCHkd17k0u67ga5w7p+HXT0JLqGFWToTs9IpC/9UYtpj9U/3j
	QwQQ/Tj5npu915fsaY/iyFaF1dn7WKX1KIJHSGSF8DxCPiFW+lp4BhW7qtxMNBhHP/8+3S7YXbR
	Ftgf/k0/vK2Uph2n6wA4ufQ+lQcamXkyCrudzVZ2dBuHQh40RPLCDpieRZ4efNpsl0XX0RiCBK3
	Jd4dKaeyX5gIiB/GctJP+s45q7R1E57GPOSmsnIBlokuKCNrkMu2w3UDPACoOyyqaahciBZ+VW3
	LsBpwWArw4ay9+gJ/Ma02Z82wDYh9q6B1YmFXttNn5HK+QmeAKZG4qfZYkAKs0aGzZz1Vdz3SOH
	85ao/I6dw+9nJ/Ymv9hKMZgMXcuTJrzuQldqXISDhFuiQ2nqbDUCzIEnMY+xNpjxN+OcXAmU4WA
	sOAJF9lVxkKTpXBTzF
X-Received: by 2002:a05:600c:a210:b0:490:e60b:5fcd with SMTP id 5b1f17b1804b1-490ec521002mr100580025e9.32.1781508033914;
        Mon, 15 Jun 2026 00:20:33 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203c0801sm200181015e9.10.2026.06.15.00.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:20:33 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v7 8/9] regulator: Add MediaTek MT6392 regulator
Date: Mon, 15 Jun 2026 09:16:14 +0200
Message-ID: <20260615071836.362883-9-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615071836.362883-1-l.scorcia@gmail.com>
References: <20260615071836.362883-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38457-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,packett.cool,kernel.org,mediatek.com,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mediatek@lists.infradead.org,m:parent.f@gmail.com,m:val@packett.cool,m:l.scorcia@gmail.com,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sen.chu@mediatek.com,m:sean.wang@mediatek.com,m:macpaul.lin@mediatek.com,m:lee@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:linusw@kernel.org,m:louisalexis.eyraud@collabora.com,m:julien.massot@collabora.com,m:akkun11.open@gmail.com,m:chen.zhong@mediatek.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:parentf@gmail.com,m:lscorcia@gmail.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:akkun11open@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mediatek.com:email,packett.cool:email,vger.kernel.org:from_smtp,config.dev:url,baylibre.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE8056842B2

From: Fabien Parent <parent.f@gmail.com>

The MT6392 is a regulator found on boards based on the MediaTek
MT8167, MT8516, and probably other SoCs. It is a so called PMIC and
connects as a slave to a SoC using SPI, wrapped inside PWRAP.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Co-developed-by: Val Packett <val@packett.cool>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/regulator/Kconfig                  |   9 +
 drivers/regulator/Makefile                 |   1 +
 drivers/regulator/mt6392-regulator.c       | 756 +++++++++++++++++++++
 include/linux/regulator/mt6392-regulator.h |  42 ++
 4 files changed, 808 insertions(+)
 create mode 100644 drivers/regulator/mt6392-regulator.c
 create mode 100644 include/linux/regulator/mt6392-regulator.h

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index a54a549196fe..ae375b9e6391 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1001,6 +1001,15 @@ config REGULATOR_MT6380
 	  This driver supports the control of different power rails of device
 	  through regulator interface.
 
+config REGULATOR_MT6392
+	tristate "MediaTek MT6392 PMIC"
+	depends on MFD_MT6397
+	help
+	  Say y here to select this option to enable the power regulator of
+	  MediaTek MT6392 PMIC.
+	  This driver supports the control of different power rails of device
+	  through regulator interface.
+
 config REGULATOR_MT6397
 	tristate "MediaTek MT6397 PMIC"
 	depends on MFD_MT6397
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 134eee274dbf..a8e795a1eda1 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -118,6 +118,7 @@ obj-$(CONFIG_REGULATOR_MT6360) += mt6360-regulator.o
 obj-$(CONFIG_REGULATOR_MT6363) += mt6363-regulator.o
 obj-$(CONFIG_REGULATOR_MT6370) += mt6370-regulator.o
 obj-$(CONFIG_REGULATOR_MT6380)	+= mt6380-regulator.o
+obj-$(CONFIG_REGULATOR_MT6392)	+= mt6392-regulator.o
 obj-$(CONFIG_REGULATOR_MT6397)	+= mt6397-regulator.o
 obj-$(CONFIG_REGULATOR_MTK_DVFSRC) += mtk-dvfsrc-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_LABIBB) += qcom-labibb-regulator.o
diff --git a/drivers/regulator/mt6392-regulator.c b/drivers/regulator/mt6392-regulator.c
new file mode 100644
index 000000000000..1f91aac3917a
--- /dev/null
+++ b/drivers/regulator/mt6392-regulator.c
@@ -0,0 +1,756 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ * Copyright (c) 2020 BayLibre, SAS.
+ * Author: Chen Zhong <chen.zhong@mediatek.com>
+ * Author: Fabien Parent <fparent@baylibre.com>
+ * Author: Luca Leonardo Scorcia <l.scorcia@gmail.com>
+ *
+ * The data sheet for MT6392 regulators is spotty to say the least,
+ * many important registers/fields are missing and the ones that aren't
+ * lack crucial information. Some useful details have been retrieved from
+ * Android sources.
+ * The driver code is mostly based on the MT6397 one.
+ */
+
+#include <linux/module.h>
+#include <linux/linear_range.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/mfd/mt6397/core.h>
+#include <linux/mfd/mt6392/registers.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+#include <linux/regulator/mt6392-regulator.h>
+#include <linux/regulator/of_regulator.h>
+
+/*
+ * Buck mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+#define MT6392_BUCK_MODE_AUTO		0
+#define MT6392_BUCK_MODE_FORCE_PWM	1
+
+/*
+ * LDO mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+#define MT6392_LDO_MODE_NORMAL		0
+#define MT6392_LDO_MODE_LP		1
+
+/**
+ * MT6392 regulators' information
+ *
+ * @desc: standard fields of regulator description.
+ * @qi_status_reg: Register to query enable signal status of regulators
+ * @qi_status_mask: Mask to query enable signal status of regulators (RO)
+ * @vselctrl_reg: Vsel control mode selector register
+ * @vselctrl_mask: Vsel control mode selector mask (RO)
+ * @vsel_reg_mode_reg: Vsel register when Vsel control mode selector = 0 (Register mode)
+ * @vsel_reg_mode_mask: Vsel register mask in Register mode (RW)
+ * @vsel_normal_mode_reg: Vsel register when Vsel control mode selector = 1 (Normal mode)
+ * @vsel_normal_mode_mask: Vsel register mask in Register mode (RW)
+ * @pwm_modeset_reg: Register to control buck mode (Auto/Force PWM)
+ * @pwm_modeset_mask: Mask to control buck mode (RW)
+ * @lp_modeget_reg: Register to get LDO low-power mode
+ * @lp_modeget_mask: Mask to get LDO low-power mode (RO)
+ * @lp_modeset_reg: Register to control LDO low-power mode
+ * @lp_modeset_mask: Mask to control LDO low-power mode (WO)
+ */
+struct mt6392_regulator_info {
+	struct regulator_desc desc;
+	u32 qi_status_reg;
+	u32 qi_status_mask;
+	u32 vselctrl_reg;
+	u32 vselctrl_mask;
+	u32 vsel_reg_mode_reg;
+	u32 vsel_reg_mode_mask;
+	u32 vsel_normal_mode_reg;
+	u32 vsel_normal_mode_mask;
+	u32 pwm_modeset_reg;
+	u32 pwm_modeset_mask;
+	u32 lp_modeget_reg;
+	u32 lp_modeget_mask;
+	u32 lp_modeset_reg;
+	u32 lp_modeset_mask;
+};
+
+#define MT6392_BUCK(match, vreg, supply, min, max, step, volt_ranges,	\
+	_qi_status_reg, _qi_status_mask, _enable_reg, _enable_mask,	\
+	_vselctrl_reg, _vselctrl_mask,					\
+	_vsel_reg_mode_reg, _vsel_reg_mode_mask,			\
+	_vsel_normal_mode_reg, _vsel_normal_mode_mask,			\
+	_pwm_modeset_reg, _pwm_modeset_mask, _ramp_delay)		\
+[MT6392_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.supply_name = supply,					\
+		.of_match = of_match_ptr(match),			\
+		.regulators_node = of_match_ptr("regulators"),		\
+		.ops = &mt6392_volt_range_ops,				\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6392_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = ((max) - (min)) / (step) + 1,		\
+		.linear_ranges = volt_ranges,				\
+		.n_linear_ranges = ARRAY_SIZE(volt_ranges),		\
+		.enable_reg = _enable_reg,				\
+		.enable_mask = _enable_mask,				\
+		.ramp_delay = _ramp_delay,				\
+	},								\
+	.qi_status_reg = _qi_status_reg,				\
+	.qi_status_mask = _qi_status_mask,				\
+	.vselctrl_reg = _vselctrl_reg,					\
+	.vselctrl_mask = _vselctrl_mask,				\
+	.vsel_reg_mode_reg = _vsel_reg_mode_reg,			\
+	.vsel_reg_mode_mask = _vsel_reg_mode_mask,			\
+	.vsel_normal_mode_reg = _vsel_normal_mode_reg,			\
+	.vsel_normal_mode_mask = _vsel_normal_mode_mask,		\
+	.pwm_modeset_reg = _pwm_modeset_reg,				\
+	.pwm_modeset_mask = _pwm_modeset_mask,				\
+}
+
+#define MT6392_LDO(match, vreg, supply, ldo_volt_table,			\
+	_qi_status_reg, _qi_status_mask,				\
+	_enable_reg, _enable_mask,					\
+	_vsel_reg, _vsel_mask,						\
+	_lp_modeget_reg, _lp_modeget_mask,				\
+	_lp_modeset_reg, _lp_modeset_mask,				\
+	_enable_time)							\
+[MT6392_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.supply_name = supply,					\
+		.of_match = of_match_ptr(match),			\
+		.regulators_node = of_match_ptr("regulators"),		\
+		.ops = &mt6392_volt_table_ops,				\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6392_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = ARRAY_SIZE(ldo_volt_table),		\
+		.volt_table = ldo_volt_table,				\
+		.vsel_reg = _vsel_reg,					\
+		.vsel_mask = _vsel_mask,				\
+		.enable_reg = _enable_reg,				\
+		.enable_mask = _enable_mask,				\
+		.enable_time = _enable_time,				\
+	},								\
+	.qi_status_reg = _qi_status_reg,				\
+	.qi_status_mask = _qi_status_mask,				\
+	.lp_modeget_reg = _lp_modeget_reg,				\
+	.lp_modeget_mask = _lp_modeget_mask,				\
+	.lp_modeset_reg = _lp_modeset_reg,				\
+	.lp_modeset_mask = _lp_modeset_mask,				\
+}
+
+#define MT6392_LDO_LINEAR(match, vreg, supply, min, max, step,		\
+	volt_ranges,							\
+	_qi_status_reg, _qi_status_mask,				\
+	_enable_reg, _enable_mask,					\
+	_vsel_reg, _vsel_mask,						\
+	_lp_modeget_reg, _lp_modeget_mask,				\
+	_lp_modeset_reg, _lp_modeset_mask,				\
+	_enable_time)							\
+[MT6392_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.supply_name = supply,					\
+		.of_match = of_match_ptr(match),			\
+		.regulators_node = of_match_ptr("regulators"),		\
+		.ops = &mt6392_volt_ldo_range_ops,			\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6392_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = ((max) - (min)) / (step) + 1,		\
+		.linear_ranges = volt_ranges,				\
+		.n_linear_ranges = ARRAY_SIZE(volt_ranges),		\
+		.vsel_reg = _vsel_reg,					\
+		.vsel_mask = _vsel_mask,				\
+		.enable_reg = _enable_reg,				\
+		.enable_mask = _enable_mask,				\
+		.enable_time = _enable_time,				\
+	},								\
+	.qi_status_reg = _qi_status_reg,				\
+	.qi_status_mask = _qi_status_mask,				\
+	.lp_modeget_reg = _lp_modeget_reg,				\
+	.lp_modeget_mask = _lp_modeget_mask,				\
+	.lp_modeset_reg = _lp_modeset_reg,				\
+	.lp_modeset_mask = _lp_modeset_mask,				\
+}
+
+#define MT6392_REG_FIXED(match, vreg, supply, volt,			\
+	_qi_status_reg, _qi_status_mask,				\
+	_enable_reg, _enable_mask,					\
+	_lp_modeget_reg, _lp_modeget_mask,				\
+	_lp_modeset_reg, _lp_modeset_mask,				\
+	_enable_time)							\
+[MT6392_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.supply_name = supply,					\
+		.of_match = of_match_ptr(match),			\
+		.regulators_node = of_match_ptr("regulators"),		\
+		.ops = &mt6392_volt_fixed_ops,				\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6392_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = 1,					\
+		.min_uV = volt,						\
+		.enable_reg = _enable_reg,				\
+		.enable_mask = _enable_mask,				\
+		.enable_time = _enable_time,				\
+	},								\
+	.qi_status_reg = _qi_status_reg,				\
+	.qi_status_mask = _qi_status_mask,				\
+	.lp_modeget_reg = _lp_modeget_reg,				\
+	.lp_modeget_mask = _lp_modeget_mask,				\
+	.lp_modeset_reg = _lp_modeset_reg,				\
+	.lp_modeset_mask = _lp_modeset_mask,				\
+}
+
+#define MT6392_REG_FIXED_NO_MODE(match, vreg, supply, volt,		\
+	_qi_status_reg, _qi_status_mask,				\
+	_enable_reg, _enable_mask, _enable_time)			\
+[MT6392_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.supply_name = supply,					\
+		.of_match = of_match_ptr(match),			\
+		.regulators_node = of_match_ptr("regulators"),		\
+		.ops = &mt6392_volt_fixed_no_mode_ops,			\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6392_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = 1,					\
+		.min_uV = volt,						\
+		.enable_reg = _enable_reg,				\
+		.enable_mask = _enable_mask,				\
+		.enable_time = _enable_time,				\
+	},								\
+	.qi_status_reg = _qi_status_reg,				\
+	.qi_status_mask = _qi_status_mask,				\
+}
+
+#define MT6392_REG(match, vreg, supply, volt)				\
+[MT6392_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.supply_name = supply,					\
+		.of_match = of_match_ptr(match),			\
+		.regulators_node = of_match_ptr("regulators"),		\
+		.ops = &mt6392_volt_no_ops,				\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6392_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = 1,					\
+		.min_uV = volt,						\
+	},								\
+}
+
+static const struct linear_range buck_volt_range1[] = {
+	REGULATOR_LINEAR_RANGE(700000, 0, 0x7f, 6250),
+};
+
+static const struct linear_range buck_volt_range2[] = {
+	REGULATOR_LINEAR_RANGE(1400000, 0, 0x7f, 12500),
+};
+
+static const u32 ldo_volt_table1[] = {
+	1800000, 1900000, 2000000, 2200000,
+};
+
+static const struct linear_range ldo_volt_range2[] = {
+	REGULATOR_LINEAR_RANGE(3300000, 0, 3, 100000),
+};
+
+static const u32 ldo_volt_table3[] = {
+	1800000, 3300000,
+};
+
+static const u32 ldo_volt_table4[] = {
+	3000000, 3300000,
+};
+
+static const u32 ldo_volt_table5[] = {
+	1200000, 1300000, 1500000, 1800000, 2000000, 2800000, 3000000, 3300000,
+};
+
+static const u32 ldo_volt_table6[] = {
+	1240000, 1390000,
+};
+
+static const u32 ldo_volt_table7[] = {
+	1200000, 1300000, 1500000, 1800000,
+};
+
+static const u32 ldo_volt_table8[] = {
+	1800000, 2000000,
+};
+
+static int mt6392_buck_set_mode(struct regulator_dev *rdev, unsigned int mode)
+{
+	int ret, val = 0;
+	struct mt6392_regulator_info *info = rdev_get_drvdata(rdev);
+	u32 reg_value;
+
+	if (!info->pwm_modeset_mask) {
+		dev_err(&rdev->dev, "regulator %s doesn't support set_mode\n", info->desc.name);
+		return -EINVAL;
+	}
+
+	switch (mode) {
+	case REGULATOR_MODE_FAST:
+		val = MT6392_BUCK_MODE_FORCE_PWM;
+		break;
+	case REGULATOR_MODE_NORMAL:
+		val = MT6392_BUCK_MODE_AUTO;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val <<= ffs(info->pwm_modeset_mask) - 1;
+
+	ret = regmap_update_bits(rdev->regmap, info->pwm_modeset_reg,
+				 info->pwm_modeset_mask, val);
+
+	if (regmap_read(rdev->regmap, info->pwm_modeset_reg, &reg_value) < 0) {
+		dev_err(&rdev->dev, "Failed to read register value\n");
+		return -EIO;
+	}
+
+	dev_info(&rdev->dev, "%s: info->pwm_modeset_reg 0x%x = 0x%x\n",
+		 info->desc.name, info->pwm_modeset_reg, reg_value);
+
+	return ret;
+}
+
+static unsigned int mt6392_buck_get_mode(struct regulator_dev *rdev)
+{
+	unsigned int val;
+	unsigned int mode;
+	int ret;
+	struct mt6392_regulator_info *info = rdev_get_drvdata(rdev);
+
+	if (!info->pwm_modeset_mask) {
+		dev_err(&rdev->dev, "regulator %s doesn't support get_mode\n", info->desc.name);
+		return -EINVAL;
+	}
+
+	ret = regmap_read(rdev->regmap, info->pwm_modeset_reg, &val);
+	if (ret < 0)
+		return ret;
+
+	val &= info->pwm_modeset_mask;
+	val >>= ffs(info->pwm_modeset_mask) - 1;
+
+	if (val & 0x1)
+		mode = REGULATOR_MODE_FAST;
+	else
+		mode = REGULATOR_MODE_NORMAL;
+
+	return mode;
+}
+
+static int mt6392_ldo_set_mode(struct regulator_dev *rdev, unsigned int mode)
+{
+	int ret, val = 0;
+	struct mt6392_regulator_info *info = rdev_get_drvdata(rdev);
+
+	if (!info->lp_modeset_mask) {
+		dev_err(&rdev->dev, "regulator %s doesn't support set_mode\n",
+			info->desc.name);
+		return -EINVAL;
+	}
+
+	switch (mode) {
+	case REGULATOR_MODE_STANDBY:
+		val = MT6392_LDO_MODE_LP;
+		break;
+	case REGULATOR_MODE_NORMAL:
+		val = MT6392_LDO_MODE_NORMAL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val <<= ffs(info->lp_modeset_mask) - 1;
+
+	ret = regmap_update_bits(rdev->regmap, info->lp_modeset_reg,
+				 info->lp_modeset_mask, val);
+
+	return ret;
+}
+
+static unsigned int mt6392_ldo_get_mode(struct regulator_dev *rdev)
+{
+	unsigned int val;
+	unsigned int mode;
+	int ret;
+	struct mt6392_regulator_info *info = rdev_get_drvdata(rdev);
+
+	if (!info->lp_modeset_mask) {
+		dev_err(&rdev->dev, "regulator %s doesn't support get_mode\n",
+			info->desc.name);
+		return -EINVAL;
+	}
+
+	ret = regmap_read(rdev->regmap, info->lp_modeset_reg, &val);
+	if (ret < 0)
+		return ret;
+
+	val &= info->lp_modeset_mask;
+	val >>= ffs(info->lp_modeset_mask) - 1;
+
+	if (val & 0x1)
+		mode = REGULATOR_MODE_STANDBY;
+	else
+		mode = REGULATOR_MODE_NORMAL;
+
+	return mode;
+}
+
+static int mt6392_get_status(struct regulator_dev *rdev)
+{
+	int ret;
+	u32 regval;
+	struct mt6392_regulator_info *info = rdev_get_drvdata(rdev);
+
+	ret = regmap_read(rdev->regmap, info->qi_status_reg, &regval);
+	if (ret != 0) {
+		dev_err(&rdev->dev, "Failed to read qi_status_reg: %d\n", ret);
+		return ret;
+	}
+
+	return (regval & info->qi_status_mask) ? REGULATOR_STATUS_ON : REGULATOR_STATUS_OFF;
+}
+
+static const struct regulator_ops mt6392_volt_range_ops = {
+	.list_voltage = regulator_list_voltage_linear_range,
+	.map_voltage = regulator_map_voltage_linear_range,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_time_sel = regulator_set_voltage_time_sel,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.get_status = mt6392_get_status,
+	.set_mode = mt6392_buck_set_mode,
+	.get_mode = mt6392_buck_get_mode,
+};
+
+static const struct regulator_ops mt6392_volt_table_ops = {
+	.list_voltage = regulator_list_voltage_table,
+	.map_voltage = regulator_map_voltage_iterate,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_time_sel = regulator_set_voltage_time_sel,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.get_status = mt6392_get_status,
+	.set_mode = mt6392_ldo_set_mode,
+	.get_mode = mt6392_ldo_get_mode,
+};
+
+static const struct regulator_ops mt6392_volt_ldo_range_ops = {
+	.list_voltage = regulator_list_voltage_linear_range,
+	.map_voltage = regulator_map_voltage_linear_range,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_time_sel = regulator_set_voltage_time_sel,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.get_status = mt6392_get_status,
+	.set_mode = mt6392_ldo_set_mode,
+	.get_mode = mt6392_ldo_get_mode,
+};
+
+static const struct regulator_ops mt6392_volt_fixed_ops = {
+	.list_voltage = regulator_list_voltage_linear,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.get_status = mt6392_get_status,
+	.set_mode = mt6392_ldo_set_mode,
+	.get_mode = mt6392_ldo_get_mode,
+};
+
+static const struct regulator_ops mt6392_volt_fixed_no_mode_ops = {
+	.list_voltage = regulator_list_voltage_linear,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.get_status = mt6392_get_status,
+};
+
+static const struct regulator_ops mt6392_volt_no_ops = {
+	.list_voltage = regulator_list_voltage_linear,
+};
+
+/* The array is indexed by id(MT6392_ID_XXX) */
+static struct mt6392_regulator_info mt6392_regulators[] = {
+	MT6392_BUCK("vproc", VPROC, "vproc", 700000, 1493750, 6250,
+		    buck_volt_range1,
+		    MT6392_VPROC_CON7, BIT(13), // Regulator status
+		    MT6392_VPROC_CON7, BIT(0),  // Regulator enable
+		    MT6392_VPROC_CON5, BIT(0),  // Vsel ctrl mode selector,not present in data sheet
+		    MT6392_VPROC_CON9, GENMASK(6, 0),  // Vsel when control mode = register (0)
+		    MT6392_VPROC_CON10, GENMASK(6, 0), // Vsel when control mode = normal (1)
+		    MT6392_VPROC_CON2, BIT(8),  // Auto / Force PWM mode
+		    12500),
+	MT6392_BUCK("vsys", VSYS, "vsys", 1400000, 2987500, 12500,
+		    buck_volt_range2,
+		    MT6392_VSYS_CON7, BIT(13),
+		    MT6392_VSYS_CON7, BIT(0),
+		    MT6392_VSYS_CON5, BIT(0), // Not present in data sheet
+		    MT6392_VSYS_CON9, GENMASK(6, 0),
+		    MT6392_VSYS_CON10, GENMASK(6, 0),
+		    MT6392_VSYS_CON2, BIT(8),
+		    25000),
+	MT6392_BUCK("vcore", VCORE, "vcore", 700000, 1493750, 6250,
+		    buck_volt_range1,
+		    MT6392_VCORE_CON7, BIT(13),
+		    MT6392_VCORE_CON7, BIT(0),
+		    MT6392_VCORE_CON5, BIT(0), // Not present in data sheet
+		    MT6392_VCORE_CON9, GENMASK(6, 0),
+		    MT6392_VCORE_CON10, GENMASK(6, 0),
+		    MT6392_VCORE_CON2, BIT(8),
+		    12500),
+
+	MT6392_REG_FIXED("vxo22", VXO22, "ldo1", 2200000,
+			 MT6392_ANALDO_CON1, BIT(15),
+			 MT6392_ANALDO_CON1, BIT(10), // Not present in data sheet
+			 MT6392_ANALDO_CON1, BIT(7),
+			 MT6392_ANALDO_CON1, BIT(1), // Not present in data sheet
+			 110),
+	MT6392_LDO("vaud22", VAUD22, "ldo1", ldo_volt_table1,
+		   MT6392_ANALDO_CON2, BIT(15),
+		   MT6392_ANALDO_CON2, BIT(14), // Not present in data sheet
+		   MT6392_ANALDO_CON8, GENMASK(6, 5), // Not present in data sheet
+		   MT6392_ANALDO_CON2, BIT(7),
+		   MT6392_ANALDO_CON2, BIT(1),  // Not present in data sheet
+		   264),
+	MT6392_REG_FIXED_NO_MODE("vcama", VCAMA, "ldo1", 2800000,
+				 MT6392_ANALDO_CON4, BIT(15),
+				 MT6392_ANALDO_CON4, BIT(15),
+				 264),
+	MT6392_REG_FIXED("vaud28", VAUD28, "ldo1", 2800000,
+			 MT6392_ANALDO_CON23, BIT(15),
+			 MT6392_ANALDO_CON23, BIT(14), // Not present in data sheet
+			 MT6392_ANALDO_CON23, BIT(7),
+			 MT6392_ANALDO_CON23, BIT(1), // Not present in data sheet
+			 264),
+	MT6392_REG_FIXED("vadc18", VADC18, "ldo1", 1800000,
+			 MT6392_ANALDO_CON25, BIT(15),
+			 MT6392_ANALDO_CON25, BIT(14), // Not present in data sheet
+			 MT6392_ANALDO_CON25, BIT(7),
+			 MT6392_ANALDO_CON25, BIT(1), // Not present in data sheet
+			 264),
+	MT6392_LDO_LINEAR("vcn35", VCN35, "ldo2", 3300000, 3600000, 100000, ldo_volt_range2,
+			  MT6392_ANALDO_CON17, BIT(15), // Not present in data sheet
+			  MT6392_ANALDO_CON21, BIT(12), // Not present in data sheet
+			  MT6392_ANALDO_CON16, GENMASK(4, 3),
+			  MT6392_ANALDO_CON21, BIT(7),
+			  MT6392_ANALDO_CON21, BIT(1), // Not present in data sheet
+			  264),
+	MT6392_REG_FIXED("vio28", VIO28, "ldo2", 2800000,
+			 MT6392_DIGLDO_CON0, BIT(15),
+			 MT6392_DIGLDO_CON0, BIT(14), // Not present in data sheet
+			 MT6392_DIGLDO_CON0, BIT(7),
+			 MT6392_DIGLDO_CON0, BIT(1), // Not present in data sheet
+			 264),
+	MT6392_REG_FIXED("vusb", VUSB, "ldo3", 3300000,
+			 MT6392_DIGLDO_CON2, BIT(15),
+			 MT6392_DIGLDO_CON2, BIT(14), // Not present in data sheet
+			 MT6392_DIGLDO_CON2, BIT(7),
+			 MT6392_DIGLDO_CON2, BIT(1), // Not present in data sheet
+			 264),
+	MT6392_LDO("vmc", VMC, "ldo2", ldo_volt_table3,
+		   MT6392_DIGLDO_CON3, BIT(15),
+		   MT6392_DIGLDO_CON3, BIT(12),
+		   MT6392_DIGLDO_CON24, BIT(4),
+		   MT6392_DIGLDO_CON3, BIT(7),
+		   MT6392_DIGLDO_CON3, BIT(1), // Not present in data sheet
+		   264),
+	MT6392_LDO("vmch", VMCH, "ldo2", ldo_volt_table4,
+		   MT6392_DIGLDO_CON5, BIT(15),
+		   MT6392_DIGLDO_CON5, BIT(14),
+		   MT6392_DIGLDO_CON26, BIT(7),
+		   MT6392_DIGLDO_CON5, BIT(7),
+		   MT6392_DIGLDO_CON5, BIT(1), // Not present in data sheet
+		   264),
+	MT6392_LDO("vemc3v3", VEMC3V3, "ldo3", ldo_volt_table4,
+		   MT6392_DIGLDO_CON6, BIT(15),
+		   MT6392_DIGLDO_CON6, BIT(14), // Not present in data sheet
+		   MT6392_DIGLDO_CON27, BIT(7),
+		   MT6392_DIGLDO_CON6, BIT(7),
+		   MT6392_DIGLDO_CON6, BIT(1), // Not present in data sheet
+		   264),
+	MT6392_LDO("vgp1", VGP1, "ldo3", ldo_volt_table5,
+		   MT6392_DIGLDO_CON7, BIT(15),
+		   MT6392_DIGLDO_CON7, BIT(15),
+		   MT6392_DIGLDO_CON28, GENMASK(7, 5),
+		   MT6392_DIGLDO_CON7, BIT(7),
+		   MT6392_DIGLDO_CON7, BIT(1), // Not present in data sheet
+		   264),
+	MT6392_LDO("vgp2", VGP2, "ldo3", ldo_volt_table5,
+		   MT6392_DIGLDO_CON8, BIT(15),
+		   MT6392_DIGLDO_CON8, BIT(15),
+		   MT6392_DIGLDO_CON29, GENMASK(7, 5),
+		   MT6392_DIGLDO_CON8, BIT(7),
+		   MT6392_DIGLDO_CON8, BIT(1), // Not present in data sheet
+		   264),
+	MT6392_REG_FIXED("vcn18", VCN18, "avddldo", 1800000,
+			 MT6392_DIGLDO_CON11, BIT(15),
+			 MT6392_DIGLDO_CON11, BIT(14), // Not present in data sheet
+			 MT6392_DIGLDO_CON11, BIT(7),
+			 MT6392_DIGLDO_CON11, BIT(1), // Not present in data sheet
+			 264),
+	MT6392_LDO("vcamaf", VCAMAF, "ldo3", ldo_volt_table5,
+		   MT6392_DIGLDO_CON31, BIT(15),
+		   MT6392_DIGLDO_CON31, BIT(15),
+		   MT6392_DIGLDO_CON32, GENMASK(7, 5),
+		   MT6392_DIGLDO_CON31, BIT(7),
+		   MT6392_DIGLDO_CON31, BIT(1), // Not present in data sheet
+		   264),
+	MT6392_LDO("vm", VM, "avddldo", ldo_volt_table6,
+		   MT6392_DIGLDO_CON47, BIT(15),
+		   MT6392_DIGLDO_CON47, BIT(14), // Not present in data sheet
+		   MT6392_DIGLDO_CON48, GENMASK(5, 4), // Not present in data sheet
+		   MT6392_DIGLDO_CON47, BIT(7), // Not present in data sheet
+		   MT6392_DIGLDO_CON47, BIT(1),
+		   264),
+	MT6392_REG_FIXED("vio18", VIO18, "avddldo", 1800000,
+			 MT6392_DIGLDO_CON49, BIT(15),
+			 MT6392_DIGLDO_CON49, BIT(14), // Not present in data sheet
+			 MT6392_DIGLDO_CON49, BIT(7),
+			 MT6392_DIGLDO_CON49, BIT(1), // Not present in data sheet
+			 264),
+	MT6392_LDO("vcamd", VCAMD, "avddldo", ldo_volt_table7,
+		   MT6392_DIGLDO_CON51, BIT(15),
+		   MT6392_DIGLDO_CON51, BIT(14),
+		   MT6392_DIGLDO_CON52, GENMASK(6, 5),
+		   MT6392_DIGLDO_CON51, BIT(7),
+		   MT6392_DIGLDO_CON51, BIT(1),
+		   264),
+	MT6392_REG_FIXED("vcamio", VCAMIO, "avddldo", 1800000,
+			 MT6392_DIGLDO_CON53, BIT(15),
+			 MT6392_DIGLDO_CON53, BIT(14),
+			 MT6392_DIGLDO_CON53, BIT(7),
+			 MT6392_DIGLDO_CON53, BIT(1), // Not present in data sheet
+			 264),
+	MT6392_REG_FIXED("vm25", VM25, "ldo3", 2500000,
+			 MT6392_DIGLDO_CON55, BIT(15),
+			 MT6392_DIGLDO_CON55, BIT(14), // Not present in data sheet
+			 MT6392_DIGLDO_CON55, BIT(7),
+			 MT6392_DIGLDO_CON55, BIT(1), // Not present in data sheet
+			 264),
+	MT6392_LDO("vefuse", VEFUSE, "ldo2", ldo_volt_table8,
+		   MT6392_DIGLDO_CON57, BIT(15),
+		   MT6392_DIGLDO_CON57, BIT(14), // Not present in data sheet
+		   MT6392_DIGLDO_CON58, BIT(5), // Not present in data sheet
+		   MT6392_DIGLDO_CON57, BIT(7),
+		   MT6392_DIGLDO_CON57, BIT(1), // Not present in data sheet
+		   264),
+	MT6392_REG("vdig18", VDIG18, "ldo2", 1800000), // Internal non changeable regulator
+	MT6392_REG_FIXED_NO_MODE("vrtc", VRTC, "ldo1", 2800000,
+				 MT6392_DIGLDO_CON15, BIT(15),
+				 MT6392_DIGLDO_CON15, BIT(8), // Not present in data sheet
+				 264)
+};
+
+// Buck regulators can be in Register mode or Normal mode.
+// Each mode uses a different register to set the desired voltage.
+static int mt6392_set_buck_vsel_reg(struct platform_device *pdev)
+{
+	struct mt6397_chip *mt6392 = dev_get_drvdata(pdev->dev.parent);
+	int i;
+	u32 regval;
+
+	for (i = 0; i < MT6392_MAX_REGULATOR; i++) {
+		if (mt6392_regulators[i].vselctrl_reg) {
+			// Read the vselctrl_reg register
+			if (regmap_read(mt6392->regmap,
+					mt6392_regulators[i].vselctrl_reg,
+					&regval) < 0) {
+				dev_err(&pdev->dev,
+					"Failed to read buck ctrl\n");
+				return -EIO;
+			}
+
+			// vselctrl_reg[vselctrl_mask] defines the mode
+			if (regval & mt6392_regulators[i].vselctrl_mask) {
+				// Regulator in Normal mode
+				mt6392_regulators[i].desc.vsel_reg =
+					mt6392_regulators[i].vsel_normal_mode_reg;
+				mt6392_regulators[i].desc.vsel_mask =
+					mt6392_regulators[i].vsel_normal_mode_mask;
+			} else {
+				// Regulator in Register mode
+				mt6392_regulators[i].desc.vsel_reg =
+					mt6392_regulators[i].vsel_reg_mode_reg;
+				mt6392_regulators[i].desc.vsel_mask =
+					mt6392_regulators[i].vsel_reg_mode_mask;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int mt6392_regulator_probe(struct platform_device *pdev)
+{
+	struct mt6397_chip *mt6392 = dev_get_drvdata(pdev->dev.parent);
+	struct regulator_config config = {};
+	struct regulator_dev *rdev;
+	int i;
+
+	device_set_of_node_from_dev(&pdev->dev, pdev->dev.parent);
+
+	// Initialize the bucks' vsel_reg and vsel_mask according to current HW state
+	if (mt6392_set_buck_vsel_reg(pdev))
+		return -EIO;
+
+	config.dev = mt6392->dev;
+	config.regmap = mt6392->regmap;
+	for (i = 0; i < MT6392_MAX_REGULATOR; i++) {
+		config.driver_data = &mt6392_regulators[i];
+
+		rdev = devm_regulator_register(&pdev->dev,
+					       &mt6392_regulators[i].desc,
+					       &config);
+		if (IS_ERR(rdev)) {
+			dev_err(&pdev->dev, "failed to register %s\n",
+				mt6392_regulators[i].desc.name);
+			return PTR_ERR(rdev);
+		}
+	}
+
+	return 0;
+}
+
+static const struct platform_device_id mt6392_platform_ids[] = {
+	{ .name = "mt6392-regulator" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(platform, mt6392_platform_ids);
+
+static struct platform_driver mt6392_regulator_driver = {
+	.driver = {
+		.name = "mt6392-regulator",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.probe = mt6392_regulator_probe,
+	.id_table = mt6392_platform_ids,
+};
+
+module_platform_driver(mt6392_regulator_driver);
+
+MODULE_AUTHOR("Chen Zhong <chen.zhong@mediatek.com>");
+MODULE_DESCRIPTION("Regulator Driver for MediaTek MT6392 PMIC");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/regulator/mt6392-regulator.h b/include/linux/regulator/mt6392-regulator.h
new file mode 100644
index 000000000000..0eccd085b062
--- /dev/null
+++ b/include/linux/regulator/mt6392-regulator.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Author: Chen Zhong <chen.zhong@mediatek.com>
+ */
+
+#ifndef __LINUX_REGULATOR_MT6392_H
+#define __LINUX_REGULATOR_MT6392_H
+
+enum {
+	MT6392_ID_VPROC = 0,
+	MT6392_ID_VSYS,
+	MT6392_ID_VCORE,
+	MT6392_ID_VXO22,
+	MT6392_ID_VAUD22,
+	MT6392_ID_VCAMA,
+	MT6392_ID_VAUD28,
+	MT6392_ID_VADC18,
+	MT6392_ID_VCN35,
+	MT6392_ID_VIO28,
+	MT6392_ID_VUSB = 10,
+	MT6392_ID_VMC,
+	MT6392_ID_VMCH,
+	MT6392_ID_VEMC3V3,
+	MT6392_ID_VGP1,
+	MT6392_ID_VGP2,
+	MT6392_ID_VCN18,
+	MT6392_ID_VCAMAF,
+	MT6392_ID_VM,
+	MT6392_ID_VIO18,
+	MT6392_ID_VCAMD,
+	MT6392_ID_VCAMIO,
+	MT6392_ID_VM25,
+	MT6392_ID_VEFUSE,
+	MT6392_ID_VDIG18,
+	MT6392_ID_VRTC,
+	MT6392_ID_RG_MAX,
+};
+
+#define MT6392_MAX_REGULATOR	MT6392_ID_RG_MAX
+
+#endif /* __LINUX_REGULATOR_MT6392_H */
-- 
2.43.0


