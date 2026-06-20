Return-Path: <linux-gpio+bounces-38748-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1bdzBt/yNmrOGwcAu9opvQ
	(envelope-from <linux-gpio+bounces-38748-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 22:06:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4AA6A9A64
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 22:06:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=jXqxcal1;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38748-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38748-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE3F3305FAE2
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 20:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23A5336D9F8;
	Sat, 20 Jun 2026 20:02:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DB336A37A
	for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2026 20:02:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781985765; cv=none; b=SiYybo7OrM+AvgqswA7lv4/PcICQ1kocSDL9XE0JH/ZsFgnATNJlBGx2zeZdRTzqyJP2roCycrpxeUAKf3b4wbUZ/vHtjXh+dfNWP0hfvuECSRAGeZ9adffd5lU+R4F9WY10d4R6k8674o5FBi51kzOs/LqdtMgHNY2xq+evhoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781985765; c=relaxed/simple;
	bh=9ooy0EqpL/Xp6mywFJLAavn2TAe3uT5Fml5YmbBqQfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdpNIxIRg3qdW2IoZ/tGCb18u9UrQRpcmewBpkJKuIjCpcTBrSnUEuTUM3P7hiItirkyXAMpCdo7abIl3BAvW5GVgxOa0r/2eaYRhgLJHNipzRRt3gDXPsbeuE0EyOvOW1+H/93CRpowRetpWJMXvDXXXKlkt/pBi5qeMkM0hMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jXqxcal1; arc=none smtp.client-ip=209.85.221.54
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4627adcf4d6so1998356f8f.3
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2026 13:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781985762; x=1782590562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvk+boSlKgm4Q/No6stvPmBx7Cs81zw9mL0RMW4PlFw=;
        b=jXqxcal1hWD6TRnvQWv2T/CmKZIvn3Id/CvyX7gSju03xoTF0yn9vgmlrj+dLmr0uk
         R6ZsAAf0u6bYIMhc8eSDKD/D6hius1Y/AC0PkKGvmWxs2XB6d3rtL+LqaJz3vdB6mauZ
         Ux7/k066cPH89Z4FKKeFxru9jhNIsN0T1y5b3GNHaHaBIDM2pJXOxbFaSBnz/1LjSCm6
         zvB7WXY/J31I7OQgrEIH7htdJdR0Tbpg91DjeBSvnGyxu/UrocIojB6uBpeYhNpVEQqH
         Ghygc2xdP0epdx+HnSOpTRtr5HovaNjZxj5H6WhV69yWPO49YaRAdEBUMuf3cXPeKL3T
         9JxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781985762; x=1782590562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gvk+boSlKgm4Q/No6stvPmBx7Cs81zw9mL0RMW4PlFw=;
        b=raJs/r5p+sGxd7f5IBkh1yCMo5doMhPyIsLqXo+g2jXJ8em8b8OJti8r8WTWdAY5PJ
         KKqK/MIU9Yh5P5tE+X+JFbTytdItiggSA0nFVNh/pUR02OuGZhr5QoB7wp4sY1K4ehqJ
         VyOTy2odPSVfrR8Fir+2cssgJ+L/CXGpBmmkob3CvL+SEmUrQMt3DhP8eIMcDhG08+gZ
         HLDkivQrfNkRD2tbVBj8qvGmKIAvqSsPFnHajOfq6nR5AbP80WzeJ5ZLC9TS5NICSeHE
         9Gd7m8ui+qSNNc7UILdAbJvdHqDsu9Sksd0jC+ev+QDu/WoeouF2e4xPUJqsiw2pCh8N
         rPTQ==
X-Forwarded-Encrypted: i=1; AHgh+RpVxxwXLLgWEA1pwxBYRTRwSi4vWoVIUHePWZJUQdp6UDxjs1/n7jB9pL4XZ8A3c6WwDi3/SmH5FRne@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8o6QZfHLDg1WtOue+nkLAr6xcQ32FKe6dpX0DH9JfQT4cqpZR
	7QQb8bmBw3zLb4LoyZO5CLJyfksO70FeDWQ+/taQMPnXyKCYowJLKg7s
X-Gm-Gg: AfdE7cnYY9UPldSU+m3EQH3lt/TatqUqfLAmey23LT/93nwh6ME6m1GfHlWnEkhBXzv
	l9WM258Fn5h6iahhsp8dEmN92IK1tuEA/4wXwGAs34jazG1cPqufW6PbAIY7LRQ/yc9U3lnAHXE
	honrDkHFCFX13sOxU7VquJKKmrTyuLdD7rFcLHb7i+NIe8BLrLkPqmJURRxiFbJHh6R6LxB24fo
	cS5UqDqdmhmydcfURsk5wgj4iU7a3YRm0/hwcGj+Alf5FF+kqaUCAtB3r8RNp1UwrrUUutaP2SU
	PlRIRtEm4rVmQUcintp+OJ+epjlmQbh2/G4dcq1zhraf/O/C6MET6xLif8e/QPZQ16WYX7gfwN6
	LnJgH+b70Tyjb021yyIhipgwaYGsb4spf/ddIAhL7SRmrhXB4Mib6cuoL+iKdLtIMkSbBJuRmkG
	oIv9eXCQ==
X-Received: by 2002:a5d:6110:0:b0:461:a159:98cf with SMTP id ffacd0b85a97d-465071f9a1dmr10388946f8f.6.1781985761721;
        Sat, 20 Jun 2026 13:02:41 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666788226sm10708354f8f.23.2026.06.20.13.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 13:02:40 -0700 (PDT)
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
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v8 8/9] regulator: Add MediaTek MT6392 regulator
Date: Sat, 20 Jun 2026 21:56:54 +0200
Message-ID: <20260620200032.334192-9-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260620200032.334192-1-l.scorcia@gmail.com>
References: <20260620200032.334192-1-l.scorcia@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38748-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,packett.cool,kernel.org,mediatek.com,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mediatek@lists.infradead.org,m:parent.f@gmail.com,m:val@packett.cool,m:l.scorcia@gmail.com,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sen.chu@mediatek.com,m:sean.wang@mediatek.com,m:macpaul.lin@mediatek.com,m:lee@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:linusw@kernel.org,m:julien.massot@collabora.com,m:louisalexis.eyraud@collabora.com,m:akkun11.open@gmail.com,m:chen.zhong@mediatek.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:parentf@gmail.com,m:lscorcia@gmail.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:akkun11open@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:email,vger.kernel.org:from_smtp,baylibre.com:email,mediatek.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,config.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B4AA6A9A64

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
 drivers/regulator/mt6392-regulator.c       | 764 +++++++++++++++++++++
 include/linux/regulator/mt6392-regulator.h |  42 ++
 4 files changed, 816 insertions(+)
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
index 000000000000..19999d198b56
--- /dev/null
+++ b/drivers/regulator/mt6392-regulator.c
@@ -0,0 +1,764 @@
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
+#define MT6392_REGULATOR_MODE_NORMAL	0
+#define MT6392_BUCK_MODE_FORCE_PWM	1
+
+/*
+ * LDO mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+#define MT6392_LDO_MODE_LP		2
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
+		.of_map_mode = mt6392_map_mode,				\
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
+		.of_map_mode = mt6392_map_mode,				\
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
+		.of_map_mode = mt6392_map_mode,				\
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
+		.of_map_mode = mt6392_map_mode,				\
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
+static unsigned int mt6392_map_mode(unsigned int mode)
+{
+	switch (mode) {
+	case MT6392_REGULATOR_MODE_NORMAL:
+		return REGULATOR_MODE_NORMAL;
+	case MT6392_BUCK_MODE_FORCE_PWM:
+		return REGULATOR_MODE_FAST;
+	case MT6392_LDO_MODE_LP:
+		return REGULATOR_MODE_STANDBY;
+	default:
+		return REGULATOR_MODE_INVALID;
+	}
+}
+
+static int mt6392_buck_set_mode(struct regulator_dev *rdev, unsigned int mode)
+{
+	int ret, val = 0;
+	struct mt6392_regulator_info *info = rdev_get_drvdata(rdev);
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
+		val = MT6392_REGULATOR_MODE_NORMAL;
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
+		val = MT6392_REGULATOR_MODE_NORMAL;
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
+	if (!info->lp_modeget_mask) {
+		dev_err(&rdev->dev, "regulator %s doesn't support get_mode\n",
+			info->desc.name);
+		return -EINVAL;
+	}
+
+	ret = regmap_read(rdev->regmap, info->lp_modeget_reg, &val);
+	if (ret < 0)
+		return ret;
+
+	val &= info->lp_modeget_mask;
+	val >>= ffs(info->lp_modeget_mask) - 1;
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


