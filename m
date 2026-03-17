Return-Path: <linux-gpio+bounces-33672-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sE91EsOiuWmiLQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33672-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 19:51:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC402B1369
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 19:51:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D35C30ED1A0
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 18:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9353F788F;
	Tue, 17 Mar 2026 18:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CyLauK+w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63066379966
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 18:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773773206; cv=none; b=Rgr5C36y33SxoHV6FnowHZrA1koo6C0Z2IBxFnPfzpnArQFq3BED+U2llVjPftkhJrZzec2m9TZIz+3YBdrY2ARhzthX5JPddvxVHLzRqN778zt8OcdICGu1oP5ZMHpovj5We7KbkGOEdwz1lkP8YaVAFyNxOB3X9cLtOGfNRMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773773206; c=relaxed/simple;
	bh=H/15e+tV/d2pzSks+rLQMNbzkgJBsJnsW7LKjF/mJKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CwKntfImAqKBIv5F1hXOj3WKvR5kx/77dyXtL8ZqTF3WtO6pBXacoscKiEIH9CuzbLZP+zeoQTqNUzbU8gq0wYe5Xd2IWZFiR6aC3jHc3xHte7JfeIMUbr22kNFMB62dHf9uuDVBz5RjZhPwNFv3dDAnnwn1uEs7qSp2Hg78xOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyLauK+w; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4853aec185aso50313785e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 11:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773773203; x=1774378003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Rfm0YqeQRT0IKIMBoMuMttRETLBxjpI7/MLXXdpqqE=;
        b=CyLauK+wH1Ox/EppRNDA4bCDUBxUQ1mpKMYC2s13wOVqxwyOQtTjWPOS4Nzhhn2asQ
         XGXwGlPmD4iKkFmQkcE4LYyOWlUBvKFu4diqrsdGggGiKiReE9z5Y/+TotsFYH8Xntia
         gWbd7tXbQsdUSn+qOT/aAA8SMjYBErhlq9aQZWY4ufv2bqZ+nXmIvx60HkRaKoEsNZoH
         934+vCmC4eK13f7nahfc8GdPZ5Su+8Nqf1qvwwuXDKjZuwK02Is0gwyf24JxqI1vtwT0
         9GX96zHvoLgf+U/HBos8O07M1S86uw38EkSBeKorBNZEIOIxA6vZzCjMTsj9w504DpWj
         P/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773773203; x=1774378003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Rfm0YqeQRT0IKIMBoMuMttRETLBxjpI7/MLXXdpqqE=;
        b=F/loEp35m8wrIo93VrpbJVycxkZpV+Q/RD/08LRcjgcWcCpGaV1PyUNqli834F+Cdj
         5afyLbtR8+CidmLS1lckUlhWugKIMyaFvgTZdkRxfFqEJz40+oaHyR7gkkYSL+yvTMem
         4chdg3ytg/Ugqh8Zw/A3FYbuu5A96f6KnfNhi0opIuYfYQRbtRugB16CC6mhIhwpNBO0
         1XyKvYtZAZ4GYo/Mds9ub/A7r8JoOyfwNp9s9C/WOPVbGWiW3SbWTpHDxTEbYIK0Lvx9
         USfmLCF2HJFsoee8TcQVAsu2Va/ncOWFuvdkgESY4Cz3JblVI53QKz+HPWGUfhIlMIke
         SiLg==
X-Forwarded-Encrypted: i=1; AJvYcCWqHpfrtQW0c/YPCsDDJrA8OD6mKzGkEOZNavXoBj8npPA4dAEfGl3YU9xJDJiDFsGqsavEA4jzbXzs@vger.kernel.org
X-Gm-Message-State: AOJu0YyH1oAB3PPcT5m2j9Tbvy8+GZss+CFlmdG6MVsIVhUrhMSkPeJP
	k6v8hYMZY4y6x/WpDcfJVwD1RkB317VYZiR6la79ONAUCht1rKBx0rwQ
X-Gm-Gg: ATEYQzzkPUSPZvAqi+CiC51eU7V8mWO0Y4uR10atDkpRiJcOY0vCsK9LwyAGL/eF2eh
	bTVRgSNazplARfRMoVbIv1Y0jZlLjFix6WY5auKtGeF2wo6B+lZUadUxrpqdv3d+DaMOw2t32xX
	TrI8n96L79AGYPAbyZtgORx+xU+CL+v6NqM2Fm8x7cZniHp5Y7xZO96L0d/Rm0NPEZMkbjrDNz/
	JemzQbO659ec1EYpSw4it7IYJR1G3JTNI1Vg4xX5fTqq3L/t+pP/dscT5RP1g1YCyO5KfYEnUlG
	ksda02ghaC5T75ftLCYTzXRO1R+IY7OAhTWPN1swYygImDCqEyIXgcsCYkVs/JBlCUzigfr9yau
	TRKChLdMJ4IhEDuXvBTvkj/l5Tia15HxmOkRcmpSmB13TlfRvqTt7DyVEI5k8pfaBg9KmLwHiZD
	aSSeOru5Xuk01MCG626RA=
X-Received: by 2002:a05:600c:46c5:b0:485:419c:4eba with SMTP id 5b1f17b1804b1-486f441fbfcmr11282675e9.1.1773773202275;
        Tue, 17 Mar 2026 11:46:42 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4ba760esm102725e9.24.2026.03.17.11.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:46:41 -0700 (PDT)
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
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Gary Bisson <bisson.gary@gmail.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 7/9] regulator: mt6392: Add support for MT6392 regulator
Date: Tue, 17 Mar 2026 18:43:10 +0000
Message-ID: <20260317184507.523060-8-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317184507.523060-1-l.scorcia@gmail.com>
References: <20260317184507.523060-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33672-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,packett.cool,kernel.org,mediatek.com,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[config.dev:url,baylibre.com:email,packett.cool:email,mediatek.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9FC402B1369
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 drivers/regulator/mt6392-regulator.c       | 487 +++++++++++++++++++++
 include/linux/regulator/mt6392-regulator.h |  40 ++
 4 files changed, 537 insertions(+)
 create mode 100644 drivers/regulator/mt6392-regulator.c
 create mode 100644 include/linux/regulator/mt6392-regulator.h

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index d2335276cce5..66876d730807 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -991,6 +991,15 @@ config REGULATOR_MT6380
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
index 1beba1493241..db5145cfcf36 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -117,6 +117,7 @@ obj-$(CONFIG_REGULATOR_MT6360) += mt6360-regulator.o
 obj-$(CONFIG_REGULATOR_MT6363) += mt6363-regulator.o
 obj-$(CONFIG_REGULATOR_MT6370) += mt6370-regulator.o
 obj-$(CONFIG_REGULATOR_MT6380)	+= mt6380-regulator.o
+obj-$(CONFIG_REGULATOR_MT6392)	+= mt6392-regulator.o
 obj-$(CONFIG_REGULATOR_MT6397)	+= mt6397-regulator.o
 obj-$(CONFIG_REGULATOR_MTK_DVFSRC) += mtk-dvfsrc-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_LABIBB) += qcom-labibb-regulator.o
diff --git a/drivers/regulator/mt6392-regulator.c b/drivers/regulator/mt6392-regulator.c
new file mode 100644
index 000000000000..50cc0019f48a
--- /dev/null
+++ b/drivers/regulator/mt6392-regulator.c
@@ -0,0 +1,487 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Copyright (c) 2020 BayLibre, SAS.
+// Author: Chen Zhong <chen.zhong@mediatek.com>
+// Author: Fabien Parent <fparent@baylibre.com>
+//
+// Based on mt6397-regulator.c
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
+#include <dt-bindings/regulator/mediatek,mt6392-regulator.h>
+
+/*
+ * MT6392 regulators' information
+ *
+ * @desc: standard fields of regulator description.
+ * @qi: Mask for query enable signal status of regulators
+ * @vselon_reg: Register sections for hardware control mode of bucks
+ * @vselctrl_reg: Register for controlling the buck control mode.
+ * @vselctrl_mask: Mask for query buck's voltage control mode.
+ */
+struct mt6392_regulator_info {
+	struct regulator_desc desc;
+	u32 qi;
+	u32 vselon_reg;
+	u32 vselctrl_reg;
+	u32 vselctrl_mask;
+	u32 modeset_reg;
+	u32 modeset_mask;
+};
+
+#define MT6392_BUCK(match, vreg, min, max, step, volt_ranges, enreg,	\
+		vosel, vosel_mask, voselon, vosel_ctrl,			\
+		_modeset_reg, _modeset_mask, rampdelay)		\
+[MT6392_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.of_match = of_match_ptr(match),			\
+		.ops = &mt6392_volt_range_ops,				\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6392_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = ((max) - (min)) / (step) + 1,		\
+		.linear_ranges = volt_ranges,				\
+		.n_linear_ranges = ARRAY_SIZE(volt_ranges),		\
+		.vsel_reg = vosel,					\
+		.vsel_mask = vosel_mask,				\
+		.enable_reg = enreg,					\
+		.enable_mask = BIT(0),					\
+		.ramp_delay = rampdelay,				\
+	},								\
+	.qi = BIT(13),							\
+	.vselon_reg = voselon,						\
+	.vselctrl_reg = vosel_ctrl,					\
+	.vselctrl_mask = BIT(1),					\
+	.modeset_reg = _modeset_reg,					\
+	.modeset_mask = _modeset_mask,					\
+}
+
+#define MT6392_LDO(match, vreg, ldo_volt_table, enreg, enbit, vosel,	\
+		vosel_mask, _modeset_reg, _modeset_mask, entime)	\
+[MT6392_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.of_match = of_match_ptr(match),			\
+		.ops = &mt6392_volt_table_ops,				\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6392_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = ARRAY_SIZE(ldo_volt_table),		\
+		.volt_table = ldo_volt_table,				\
+		.vsel_reg = vosel,					\
+		.vsel_mask = vosel_mask,				\
+		.enable_reg = enreg,					\
+		.enable_mask = BIT(enbit),				\
+		.enable_time = entime,					\
+	},								\
+	.qi = BIT(15),							\
+	.modeset_reg = _modeset_reg,					\
+	.modeset_mask = _modeset_mask,					\
+}
+
+#define MT6392_LDO_LINEAR(match, vreg, min, max, step, volt_ranges,	\
+		enreg, enbit, vosel, vosel_mask, _modeset_reg,		\
+		_modeset_mask, entime)					\
+[MT6392_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.of_match = of_match_ptr(match),			\
+		.ops = &mt6392_volt_ldo_range_ops,			\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6392_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = ((max) - (min)) / (step) + 1,		\
+		.linear_ranges = volt_ranges,				\
+		.n_linear_ranges = ARRAY_SIZE(volt_ranges),		\
+		.vsel_reg = vosel,					\
+		.vsel_mask = vosel_mask,				\
+		.enable_reg = enreg,					\
+		.enable_mask = BIT(enbit),				\
+		.enable_time = entime,					\
+	},								\
+	.qi = BIT(15),							\
+	.modeset_reg = _modeset_reg,					\
+	.modeset_mask = _modeset_mask,					\
+}
+
+#define MT6392_REG_FIXED(match, vreg, enreg, enbit, volt,		\
+		_modeset_reg, _modeset_mask, entime)			\
+[MT6392_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.of_match = of_match_ptr(match),			\
+		.ops = &mt6392_volt_fixed_ops,				\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6392_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = 1,					\
+		.enable_reg = enreg,					\
+		.enable_mask = BIT(enbit),				\
+		.enable_time = entime,					\
+		.min_uV = volt,						\
+	},								\
+	.qi = BIT(15),							\
+	.modeset_reg = _modeset_reg,					\
+	.modeset_mask = _modeset_mask,					\
+}
+
+#define MT6392_REG_FIXED_NO_MODE(match, vreg, enreg, enbit, volt,	\
+	entime)								\
+[MT6392_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.of_match = of_match_ptr(match),			\
+		.ops = &mt6392_volt_fixed_no_mode_ops,			\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6392_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = 1,					\
+		.enable_reg = enreg,					\
+		.enable_mask = BIT(enbit),				\
+		.enable_time = entime,					\
+		.min_uV = volt,						\
+	},								\
+	.qi = BIT(15),							\
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
+	val <<= ffs(info->modeset_mask) - 1;
+
+	ret = regmap_update_bits(rdev->regmap, info->modeset_reg,
+				 info->modeset_mask, val);
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
+	ret = regmap_read(rdev->regmap, info->modeset_reg, &val);
+	if (ret < 0)
+		return ret;
+
+	val &= info->modeset_mask;
+	val >>= ffs(info->modeset_mask) - 1;
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
+	val <<= ffs(info->modeset_mask) - 1;
+
+	ret = regmap_update_bits(rdev->regmap, info->modeset_reg,
+				 info->modeset_mask, val);
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
+	ret = regmap_read(rdev->regmap, info->modeset_reg, &val);
+	if (ret < 0)
+		return ret;
+
+	val &= info->modeset_mask;
+	val >>= ffs(info->modeset_mask) - 1;
+
+	if (val & 0x1)
+		mode = REGULATOR_MODE_STANDBY;
+	else
+		mode = REGULATOR_MODE_NORMAL;
+
+	return mode;
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
+	.set_mode = mt6392_ldo_set_mode,
+	.get_mode = mt6392_ldo_get_mode,
+};
+
+static const struct regulator_ops mt6392_volt_fixed_ops = {
+	.list_voltage = regulator_list_voltage_linear,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.set_mode = mt6392_ldo_set_mode,
+	.get_mode = mt6392_ldo_get_mode,
+};
+
+static const struct regulator_ops mt6392_volt_fixed_no_mode_ops = {
+	.list_voltage = regulator_list_voltage_linear,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+};
+
+/* The array is indexed by id(MT6392_ID_XXX) */
+static struct mt6392_regulator_info mt6392_regulators[] = {
+	MT6392_BUCK("buck_vproc", VPROC, 700000, 1493750, 6250,
+		    buck_volt_range1, MT6392_VPROC_CON7, MT6392_VPROC_CON9, 0x7f,
+		    MT6392_VPROC_CON10, MT6392_VPROC_CON5, MT6392_VPROC_CON2, 0x100,
+		    12500),
+	MT6392_BUCK("buck_vsys", VSYS, 1400000, 2987500, 12500,
+		    buck_volt_range2, MT6392_VSYS_CON7, MT6392_VSYS_CON9, 0x7f,
+		    MT6392_VSYS_CON10, MT6392_VSYS_CON5, MT6392_VSYS_CON2, 0x100,
+		    25000),
+	MT6392_BUCK("buck_vcore", VCORE, 700000, 1493750, 6250,
+		    buck_volt_range1, MT6392_VCORE_CON7, MT6392_VCORE_CON9, 0x7f,
+		    MT6392_VCORE_CON10, MT6392_VCORE_CON5, MT6392_VCORE_CON2, 0x100,
+		    12500),
+	MT6392_REG_FIXED("ldo_vxo22", VXO22, MT6392_ANALDO_CON1, 10, 2200000,
+			 MT6392_ANALDO_CON1, 0x2, 110),
+	MT6392_LDO("ldo_vaud22", VAUD22, ldo_volt_table1,
+		   MT6392_ANALDO_CON2, 14, MT6392_ANALDO_CON8, 0x60,
+		   MT6392_ANALDO_CON2, 0x2, 264),
+	MT6392_REG_FIXED_NO_MODE("ldo_vcama", VCAMA, MT6392_ANALDO_CON4, 15,
+				 2800000, 264),
+	MT6392_REG_FIXED("ldo_vaud28", VAUD28, MT6392_ANALDO_CON23, 14, 2800000,
+			 MT6392_ANALDO_CON23, 0x2, 264),
+	MT6392_REG_FIXED("ldo_vadc18", VADC18, MT6392_ANALDO_CON25, 14, 1800000,
+			 MT6392_ANALDO_CON25, 0x2, 264),
+	MT6392_LDO_LINEAR("ldo_vcn35", VCN35, 3300000, 3600000, 100000,
+			  ldo_volt_range2, MT6392_ANALDO_CON21, 12,
+			  MT6392_ANALDO_CON16, 0xC, MT6392_ANALDO_CON21, 0x2, 264),
+	MT6392_REG_FIXED("ldo_vio28", VIO28, MT6392_DIGLDO_CON0, 14, 2800000,
+			 MT6392_DIGLDO_CON0, 0x2, 264),
+	MT6392_REG_FIXED("ldo_vusb", VUSB, MT6392_DIGLDO_CON2, 14, 3300000,
+			 MT6392_DIGLDO_CON2, 0x2, 264),
+	MT6392_LDO("ldo_vmc", VMC, ldo_volt_table3,
+		   MT6392_DIGLDO_CON3, 12, MT6392_DIGLDO_CON24, 0x10,
+		   MT6392_DIGLDO_CON3, 0x2, 264),
+	MT6392_LDO("ldo_vmch", VMCH, ldo_volt_table4,
+		   MT6392_DIGLDO_CON5, 14, MT6392_DIGLDO_CON26, 0x80,
+		   MT6392_DIGLDO_CON5, 0x2, 264),
+	MT6392_LDO("ldo_vemc3v3", VEMC3V3, ldo_volt_table4,
+		   MT6392_DIGLDO_CON6, 14, MT6392_DIGLDO_CON27, 0x80,
+		   MT6392_DIGLDO_CON6, 0x2, 264),
+	MT6392_LDO("ldo_vgp1", VGP1, ldo_volt_table5,
+		   MT6392_DIGLDO_CON7, 15, MT6392_DIGLDO_CON28, 0xE0,
+		   MT6392_DIGLDO_CON7, 0x2, 264),
+	MT6392_LDO("ldo_vgp2", VGP2, ldo_volt_table5,
+		   MT6392_DIGLDO_CON8, 15, MT6392_DIGLDO_CON29, 0xE0,
+		   MT6392_DIGLDO_CON8, 0x2, 264),
+	MT6392_REG_FIXED("ldo_vcn18", VCN18, MT6392_DIGLDO_CON11, 14, 1800000,
+			 MT6392_DIGLDO_CON11, 0x2, 264),
+	MT6392_LDO("ldo_vcamaf", VCAMAF, ldo_volt_table5,
+		   MT6392_DIGLDO_CON31, 15, MT6392_DIGLDO_CON32, 0xE0,
+		   MT6392_DIGLDO_CON31, 0x2, 264),
+	MT6392_LDO("ldo_vm", VM, ldo_volt_table6,
+		   MT6392_DIGLDO_CON47, 14, MT6392_DIGLDO_CON48, 0x30,
+		   MT6392_DIGLDO_CON47, 0x2, 264),
+	MT6392_REG_FIXED("ldo_vio18", VIO18, MT6392_DIGLDO_CON49, 14, 1800000,
+			 MT6392_DIGLDO_CON49, 0x2, 264),
+	MT6392_LDO("ldo_vcamd", VCAMD, ldo_volt_table7,
+		   MT6392_DIGLDO_CON51, 14, MT6392_DIGLDO_CON52, 0x60,
+		   MT6392_DIGLDO_CON51, 0x2, 264),
+	MT6392_REG_FIXED("ldo_vcamio", VCAMIO, MT6392_DIGLDO_CON53, 14, 1800000,
+			 MT6392_DIGLDO_CON53, 0x2, 264),
+	MT6392_REG_FIXED("ldo_vm25", VM25, MT6392_DIGLDO_CON55, 14, 2500000,
+			 MT6392_DIGLDO_CON55, 0x2, 264),
+	MT6392_LDO("ldo_vefuse", VEFUSE, ldo_volt_table8,
+		   MT6392_DIGLDO_CON57, 14, MT6392_DIGLDO_CON58, 0x10,
+		   MT6392_DIGLDO_CON57, 0x2, 264),
+};
+
+static int mt6392_set_buck_vosel_reg(struct platform_device *pdev)
+{
+	struct mt6397_chip *mt6392 = dev_get_drvdata(pdev->dev.parent);
+	int i;
+	u32 regval;
+
+	for (i = 0; i < MT6392_MAX_REGULATOR; i++) {
+		if (mt6392_regulators[i].vselctrl_reg) {
+			if (regmap_read(mt6392->regmap,
+					mt6392_regulators[i].vselctrl_reg,
+					&regval) < 0) {
+				dev_err(&pdev->dev,
+					"Failed to read buck ctrl\n");
+				return -EIO;
+			}
+
+			if (regval & mt6392_regulators[i].vselctrl_mask) {
+				mt6392_regulators[i].desc.vsel_reg =
+				mt6392_regulators[i].vselon_reg;
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
+	/* Query buck controller to select activated voltage register part */
+	if (mt6392_set_buck_vosel_reg(pdev))
+		return -EIO;
+
+	for (i = 0; i < MT6392_MAX_REGULATOR; i++) {
+		config.dev = &pdev->dev;
+		config.driver_data = &mt6392_regulators[i];
+		config.regmap = mt6392->regmap;
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
+	{"mt6392-regulator", 0},
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(platform, mt6392_platform_ids);
+
+static struct platform_driver mt6392_regulator_driver = {
+	.driver = {
+		.name = "mt6392-regulator",
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
index 000000000000..20d80dfc8783
--- /dev/null
+++ b/include/linux/regulator/mt6392-regulator.h
@@ -0,0 +1,40 @@
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
+	MT6392_ID_RG_MAX,
+};
+
+#define MT6392_MAX_REGULATOR	MT6392_ID_RG_MAX
+
+#endif /* __LINUX_REGULATOR_MT6392_H */
-- 
2.43.0


