Return-Path: <linux-gpio+bounces-15694-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68331A302D6
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 06:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59E623A6420
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 05:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F601E7C16;
	Tue, 11 Feb 2025 05:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCmw+RYU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCD11E25F9;
	Tue, 11 Feb 2025 05:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739251125; cv=none; b=sk23nu+aY+PimKra0CCIYfNyepp3+iMNnRThnCdFwOukgbVuY6saxUDeNIV/wBOighxdPLzLryY9u7qhZrDijCqwDugVL5XVdfjKZ/X6r5/2pKRYIRGlTWRnO/znTjkjWZ61lk9ICcFunlOGf2yYyylVaRGYKzjKzDq4veF1vM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739251125; c=relaxed/simple;
	bh=CgdpwsCk60f1EaTk4DPRaDb0nas1Y0AkciA42ZqfWeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YPsKpHy+UoKverN6gJg8BaSvGMdh5s2Q8/t2QpH6OPzfbazxoC9/SzbDNCbQwHB0Mnbaw/LiEjQxcZwiKMdGqUlYlOz75w2KpCK1Bw+GyYbMlwnjU3dMip8XMmjNZcDFOCaCZ81TufL5AUfW/CLrUwuIqDaRo7zj77bOKsaJjTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCmw+RYU; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c05cda3e3fso189936985a.1;
        Mon, 10 Feb 2025 21:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739251121; x=1739855921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zWhT17o7B5884IC9QYE32wNbf0TdA/z0Uh8LQblfHg=;
        b=TCmw+RYUudAgneKd0Wm1P1ptxxHgVONnGafF/zlSJIimyQThAG4V5n5V91tQ9M9x76
         trXb2/bNdWdCqexyTZmNg5f4iFPHy+gBPsXXljRa5M6SGSH+atomK/vAKothjrwRKvM2
         ysDAVkqGByE7cID1eYV5NI9npK1QNxxnGiItTWUVft0g6rQMGF16yrMTtgYaJ2mbUFlS
         EjGv8bvwtC2QRtiNBpTkwbtYkRWYdITD+x4vSOleUAJj0RFoi3bxj57Z3K2/1Qe6n9p/
         xd+NqqrbJ9XcwEfWfR1ETkBynayQJqGylw+LyLrRgIzLVxFShb1VPfW2y5xuVW0xNvVa
         /fgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739251121; x=1739855921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zWhT17o7B5884IC9QYE32wNbf0TdA/z0Uh8LQblfHg=;
        b=Bwm2OBbgP8uTGXwom/H9a69wHJWvcSA8f4lCSTrRUjICT5onvaOU7VWo2zLRBdWhem
         JrTUAPmLOOVInjYh8hpFzawFRDE9nzsOcfu+CR5Xb4a7Hb4lthaIcB0CnHdan/MAGvQt
         3oX8rtx+cYWCd2X7/ZlbBi5JGDzPAmh7Hdp1mR75wgyE+UgjCFP28XwkesptfE0JW1hm
         vEqxH35gM0LXzxj2y6bU7oKVfmKQ4Sr/GiaOJB6L4VLFBLA1cFoT0k1QaYZNgnxo3zCz
         wXkuzQcGsBPFzIsvJeWmwtnMmBd4x5Eh1/pKdVMh/SX4esvW54ia40/EbwK75UUfsq9j
         fe8g==
X-Forwarded-Encrypted: i=1; AJvYcCWUUc8VYsCXMfUxzrMa1ohX+sUgRIyASp+HD4p7U5Y10Vs/UW9PmF/v85k0AC7l6w5hsqTR0fxQPos2@vger.kernel.org, AJvYcCX3dsaUMaI35X5boCjnaWe0vW6sdSRGxUKy3qEc1qZRCQ3I7oMZkmsZBH7akuCSzaAnaiREp1zMUwCKVw==@vger.kernel.org, AJvYcCXlZRWwD02EFAAaUCPPn5J9BF0Sv+sdFdAdkKpQlHCThxOtf0Gy6lO9KSozz/Xav7I+gDDhZ5zf8SLJvqH7@vger.kernel.org
X-Gm-Message-State: AOJu0YyK21wvDyAiUPCOpXyOV5k410o3RsQ30xE0gkBPUDcxjGzNKnX/
	3zP1XtT0feTJV7Ck1FLueXPgsSW3LFz8w1bn6QEWreC4/JXIDbUS
X-Gm-Gg: ASbGnct4s+BFgQI7RABYrWxIH/UC7Y/yLyNgoYvdIlbeSC04Y6+nFiOjh2zi1rMt5xL
	8qFGtc/zSHvshe05HWkR6/FsRmwvKeQQXEec22EzphFmH++mnN6WnrrNR2zqyWZ5hhp0B7DaXB6
	fMjvjdDCGFksa1pTfPwbsk/TU8BU/+aCVCVlLSePXbwL/LZkq+jMx2vxQAmxV9MiDcU1QBl+bsG
	/4Sbq2F/FLoj1IK1mWaEX5BnICmnwou3duTnxWfwCIX0zVjF5fRxt5YO4uQDYQIv/s=
X-Google-Smtp-Source: AGHT+IFtw66nWp7htWuj6hUmM+Dbf0+ulWHYAVB5P+RX8ymNU8TUsFzfUBzeVng+OK5UkoGL4mBdUw==
X-Received: by 2002:a05:620a:298e:b0:7b1:1180:a455 with SMTP id af79cd13be357-7c047bbab72mr2262641885a.22.1739251120726;
        Mon, 10 Feb 2025 21:18:40 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c041dec2f4sm622019485a.22.2025.02.10.21.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 21:18:39 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 7/8] pinctrl: sophgo: add support for SG2044 SoC
Date: Tue, 11 Feb 2025 13:17:55 +0800
Message-ID: <20250211051801.470800-8-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211051801.470800-1-inochiama@gmail.com>
References: <20250211051801.470800-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SG2044 share the share common control logic with SG2042. So
only pin definition is needed.

Add pin definition driver for SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pinctrl/sophgo/Kconfig          |  12 +
 drivers/pinctrl/sophgo/Makefile         |   1 +
 drivers/pinctrl/sophgo/pinctrl-sg2044.c | 718 ++++++++++++++++++++++++
 3 files changed, 731 insertions(+)
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2044.c

diff --git a/drivers/pinctrl/sophgo/Kconfig b/drivers/pinctrl/sophgo/Kconfig
index 94f3646c5d5b..9b0a3a4753b1 100644
--- a/drivers/pinctrl/sophgo/Kconfig
+++ b/drivers/pinctrl/sophgo/Kconfig
@@ -74,3 +74,15 @@ config PINCTRL_SOPHGO_SG2042
 	  This pin controller allows selecting the mux function for
 	  each pin. This driver can also be built as a module called
 	  pinctrl-sg2042.
+
+config PINCTRL_SOPHGO_SG2044
+	tristate "Sophgo SG2044 SoC Pinctrl driver"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	depends on OF
+	select PINCTRL_SOPHGO_COMMON
+	select PINCTRL_SOPHGO_SG2042_OPS
+	help
+	  Say Y to select the pinctrl driver for SG2044 SoC.
+	  This pin controller allows selecting the mux function for
+	  each pin. This driver can also be built as a module called
+	  pinctrl-sg2044.
diff --git a/drivers/pinctrl/sophgo/Makefile b/drivers/pinctrl/sophgo/Makefile
index 7be7a1006e09..479c65e6dbc0 100644
--- a/drivers/pinctrl/sophgo/Makefile
+++ b/drivers/pinctrl/sophgo/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_PINCTRL_SOPHGO_CV1812H)	+= pinctrl-cv1812h.o
 obj-$(CONFIG_PINCTRL_SOPHGO_SG2000)	+= pinctrl-sg2000.o
 obj-$(CONFIG_PINCTRL_SOPHGO_SG2002)	+= pinctrl-sg2002.o
 obj-$(CONFIG_PINCTRL_SOPHGO_SG2042)	+= pinctrl-sg2042.o
+obj-$(CONFIG_PINCTRL_SOPHGO_SG2044)	+= pinctrl-sg2044.o
diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2044.c b/drivers/pinctrl/sophgo/pinctrl-sg2044.c
new file mode 100644
index 000000000000..b0c46d8954ca
--- /dev/null
+++ b/drivers/pinctrl/sophgo/pinctrl-sg2044.c
@@ -0,0 +1,718 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Sophgo SG2042 SoC pinctrl driver.
+ *
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+
+#include <dt-bindings/pinctrl/pinctrl-sg2044.h>
+
+#include "pinctrl-sg2042.h"
+
+static int sg2044_get_pull_up(const struct sophgo_pin *sp, const u32 *psmap)
+{
+	return 19500;
+}
+
+static int sg2044_get_pull_down(const struct sophgo_pin *sp, const u32 *psmap)
+{
+	return 23200;
+}
+
+static const u32 sg2044_oc_map[] = {
+	3200,  6400,  9600,  12700,
+	15900, 19100, 22200, 25300,
+	29500, 32700, 35900, 39000,
+	42000, 45200, 48300, 51400
+};
+
+static int sg2044_get_oc_map(const struct sophgo_pin *sp, const u32 *psmap,
+			     const u32 **map)
+{
+	*map = sg2044_oc_map;
+	return ARRAY_SIZE(sg2044_oc_map);
+}
+
+static const struct sophgo_vddio_cfg_ops sg2044_vddio_cfg_ops = {
+	.get_pull_up		= sg2044_get_pull_up,
+	.get_pull_down		= sg2044_get_pull_down,
+	.get_oc_map		= sg2044_get_oc_map,
+};
+
+static const struct pinctrl_pin_desc sg2044_pins[] = {
+	PINCTRL_PIN(PIN_IIC0_SMBSUS_IN,		"iic0_smbsus_in"),
+	PINCTRL_PIN(PIN_IIC0_SMBSUS_OUT,	"iic0_smbsus_out"),
+	PINCTRL_PIN(PIN_IIC0_SMBALERT,		"iic0_smbalert"),
+	PINCTRL_PIN(PIN_IIC1_SMBSUS_IN,		"iic1_smbsus_in"),
+	PINCTRL_PIN(PIN_IIC1_SMBSUS_OUT,	"iic1_smbsus_out"),
+	PINCTRL_PIN(PIN_IIC1_SMBALERT,		"iic1_smbalert"),
+	PINCTRL_PIN(PIN_IIC2_SMBSUS_IN,		"iic2_smbsus_in"),
+	PINCTRL_PIN(PIN_IIC2_SMBSUS_OUT,	"iic2_smbsus_out"),
+	PINCTRL_PIN(PIN_IIC2_SMBALERT,		"iic2_smbalert"),
+	PINCTRL_PIN(PIN_IIC3_SMBSUS_IN,		"iic3_smbsus_in"),
+	PINCTRL_PIN(PIN_IIC3_SMBSUS_OUT,	"iic3_smbsus_out"),
+	PINCTRL_PIN(PIN_IIC3_SMBALERT,		"iic3_smbalert"),
+	PINCTRL_PIN(PIN_PCIE0_L0_RESET,		"pcie0_l0_reset"),
+	PINCTRL_PIN(PIN_PCIE0_L1_RESET,		"pcie0_l1_reset"),
+	PINCTRL_PIN(PIN_PCIE0_L0_WAKEUP,	"pcie0_l0_wakeup"),
+	PINCTRL_PIN(PIN_PCIE0_L1_WAKEUP,	"pcie0_l1_wakeup"),
+	PINCTRL_PIN(PIN_PCIE0_L0_CLKREQ_IN,	"pcie0_l0_clkreq_in"),
+	PINCTRL_PIN(PIN_PCIE0_L1_CLKREQ_IN,	"pcie0_l1_clkreq_in"),
+	PINCTRL_PIN(PIN_PCIE1_L0_RESET,		"pcie1_l0_reset"),
+	PINCTRL_PIN(PIN_PCIE1_L1_RESET,		"pcie1_l1_reset"),
+	PINCTRL_PIN(PIN_PCIE1_L0_WAKEUP,	"pcie1_l0_wakeup"),
+	PINCTRL_PIN(PIN_PCIE1_L1_WAKEUP,	"pcie1_l1_wakeup"),
+	PINCTRL_PIN(PIN_PCIE1_L0_CLKREQ_IN,	"pcie1_l0_clkreq_in"),
+	PINCTRL_PIN(PIN_PCIE1_L1_CLKREQ_IN,	"pcie1_l1_clkreq_in"),
+	PINCTRL_PIN(PIN_PCIE2_L0_RESET,		"pcie2_l0_reset"),
+	PINCTRL_PIN(PIN_PCIE2_L1_RESET,		"pcie2_l1_reset"),
+	PINCTRL_PIN(PIN_PCIE2_L0_WAKEUP,	"pcie2_l0_wakeup"),
+	PINCTRL_PIN(PIN_PCIE2_L1_WAKEUP,	"pcie2_l1_wakeup"),
+	PINCTRL_PIN(PIN_PCIE2_L0_CLKREQ_IN,	"pcie2_l0_clkreq_in"),
+	PINCTRL_PIN(PIN_PCIE2_L1_CLKREQ_IN,	"pcie2_l1_clkreq_in"),
+	PINCTRL_PIN(PIN_PCIE3_L0_RESET,		"pcie3_l0_reset"),
+	PINCTRL_PIN(PIN_PCIE3_L1_RESET,		"pcie3_l1_reset"),
+	PINCTRL_PIN(PIN_PCIE3_L0_WAKEUP,	"pcie3_l0_wakeup"),
+	PINCTRL_PIN(PIN_PCIE3_L1_WAKEUP,	"pcie3_l1_wakeup"),
+	PINCTRL_PIN(PIN_PCIE3_L0_CLKREQ_IN,	"pcie3_l0_clkreq_in"),
+	PINCTRL_PIN(PIN_PCIE3_L1_CLKREQ_IN,	"pcie3_l1_clkreq_in"),
+	PINCTRL_PIN(PIN_PCIE4_L0_RESET,		"pcie4_l0_reset"),
+	PINCTRL_PIN(PIN_PCIE4_L1_RESET,		"pcie4_l1_reset"),
+	PINCTRL_PIN(PIN_PCIE4_L0_WAKEUP,	"pcie4_l0_wakeup"),
+	PINCTRL_PIN(PIN_PCIE4_L1_WAKEUP,	"pcie4_l1_wakeup"),
+	PINCTRL_PIN(PIN_PCIE4_L0_CLKREQ_IN,	"pcie4_l0_clkreq_in"),
+	PINCTRL_PIN(PIN_PCIE4_L1_CLKREQ_IN,	"pcie4_l1_clkreq_in"),
+	PINCTRL_PIN(PIN_SPIF0_CLK_SEL1,		"spif0_clk_sel1"),
+	PINCTRL_PIN(PIN_SPIF0_CLK_SEL0,		"spif0_clk_sel0"),
+	PINCTRL_PIN(PIN_SPIF0_WP,		"spif0_wp"),
+	PINCTRL_PIN(PIN_SPIF0_HOLD,		"spif0_hold"),
+	PINCTRL_PIN(PIN_SPIF0_SDI,		"spif0_sdi"),
+	PINCTRL_PIN(PIN_SPIF0_CS,		"spif0_cs"),
+	PINCTRL_PIN(PIN_SPIF0_SCK,		"spif0_sck"),
+	PINCTRL_PIN(PIN_SPIF0_SDO,		"spif0_sdo"),
+	PINCTRL_PIN(PIN_SPIF1_CLK_SEL1,		"spif1_clk_sel1"),
+	PINCTRL_PIN(PIN_SPIF1_CLK_SEL0,		"spif1_clk_sel0"),
+	PINCTRL_PIN(PIN_SPIF1_WP,		"spif1_wp"),
+	PINCTRL_PIN(PIN_SPIF1_HOLD,		"spif1_hold"),
+	PINCTRL_PIN(PIN_SPIF1_SDI,		"spif1_sdi"),
+	PINCTRL_PIN(PIN_SPIF1_CS,		"spif1_cs"),
+	PINCTRL_PIN(PIN_SPIF1_SCK,		"spif1_sck"),
+	PINCTRL_PIN(PIN_SPIF1_SDO,		"spif1_sdo"),
+	PINCTRL_PIN(PIN_EMMC_WP,		"emmc_wp"),
+	PINCTRL_PIN(PIN_EMMC_CD,		"emmc_cd"),
+	PINCTRL_PIN(PIN_EMMC_RST,		"emmc_rst"),
+	PINCTRL_PIN(PIN_EMMC_PWR_EN,		"emmc_pwr_en"),
+	PINCTRL_PIN(PIN_SDIO_CD,		"sdio_cd"),
+	PINCTRL_PIN(PIN_SDIO_WP,		"sdio_wp"),
+	PINCTRL_PIN(PIN_SDIO_RST,		"sdio_rst"),
+	PINCTRL_PIN(PIN_SDIO_PWR_EN,		"sdio_pwr_en"),
+	PINCTRL_PIN(PIN_RGMII0_TXD0,		"rgmii0_txd0"),
+	PINCTRL_PIN(PIN_RGMII0_TXD1,		"rgmii0_txd1"),
+	PINCTRL_PIN(PIN_RGMII0_TXD2,		"rgmii0_txd2"),
+	PINCTRL_PIN(PIN_RGMII0_TXD3,		"rgmii0_txd3"),
+	PINCTRL_PIN(PIN_RGMII0_TXCTRL,		"rgmii0_txctrl"),
+	PINCTRL_PIN(PIN_RGMII0_RXD0,		"rgmii0_rxd0"),
+	PINCTRL_PIN(PIN_RGMII0_RXD1,		"rgmii0_rxd1"),
+	PINCTRL_PIN(PIN_RGMII0_RXD2,		"rgmii0_rxd2"),
+	PINCTRL_PIN(PIN_RGMII0_RXD3,		"rgmii0_rxd3"),
+	PINCTRL_PIN(PIN_RGMII0_RXCTRL,		"rgmii0_rxctrl"),
+	PINCTRL_PIN(PIN_RGMII0_TXC,		"rgmii0_txc"),
+	PINCTRL_PIN(PIN_RGMII0_RXC,		"rgmii0_rxc"),
+	PINCTRL_PIN(PIN_RGMII0_REFCLKO,		"rgmii0_refclko"),
+	PINCTRL_PIN(PIN_RGMII0_IRQ,		"rgmii0_irq"),
+	PINCTRL_PIN(PIN_RGMII0_MDC,		"rgmii0_mdc"),
+	PINCTRL_PIN(PIN_RGMII0_MDIO,		"rgmii0_mdio"),
+	PINCTRL_PIN(PIN_PWM0,			"pwm0"),
+	PINCTRL_PIN(PIN_PWM1,			"pwm1"),
+	PINCTRL_PIN(PIN_PWM2,			"pwm2"),
+	PINCTRL_PIN(PIN_PWM3,			"pwm3"),
+	PINCTRL_PIN(PIN_FAN0,			"fan0"),
+	PINCTRL_PIN(PIN_FAN1,			"fan1"),
+	PINCTRL_PIN(PIN_FAN2,			"fan2"),
+	PINCTRL_PIN(PIN_FAN3,			"fan3"),
+	PINCTRL_PIN(PIN_IIC0_SDA,		"iic0_sda"),
+	PINCTRL_PIN(PIN_IIC0_SCL,		"iic0_scl"),
+	PINCTRL_PIN(PIN_IIC1_SDA,		"iic1_sda"),
+	PINCTRL_PIN(PIN_IIC1_SCL,		"iic1_scl"),
+	PINCTRL_PIN(PIN_IIC2_SDA,		"iic2_sda"),
+	PINCTRL_PIN(PIN_IIC2_SCL,		"iic2_scl"),
+	PINCTRL_PIN(PIN_IIC3_SDA,		"iic3_sda"),
+	PINCTRL_PIN(PIN_IIC3_SCL,		"iic3_scl"),
+	PINCTRL_PIN(PIN_UART0_TX,		"uart0_tx"),
+	PINCTRL_PIN(PIN_UART0_RX,		"uart0_rx"),
+	PINCTRL_PIN(PIN_UART0_RTS,		"uart0_rts"),
+	PINCTRL_PIN(PIN_UART0_CTS,		"uart0_cts"),
+	PINCTRL_PIN(PIN_UART1_TX,		"uart1_tx"),
+	PINCTRL_PIN(PIN_UART1_RX,		"uart1_rx"),
+	PINCTRL_PIN(PIN_UART1_RTS,		"uart1_rts"),
+	PINCTRL_PIN(PIN_UART1_CTS,		"uart1_cts"),
+	PINCTRL_PIN(PIN_UART2_TX,		"uart2_tx"),
+	PINCTRL_PIN(PIN_UART2_RX,		"uart2_rx"),
+	PINCTRL_PIN(PIN_UART2_RTS,		"uart2_rts"),
+	PINCTRL_PIN(PIN_UART2_CTS,		"uart2_cts"),
+	PINCTRL_PIN(PIN_UART3_TX,		"uart3_tx"),
+	PINCTRL_PIN(PIN_UART3_RX,		"uart3_rx"),
+	PINCTRL_PIN(PIN_UART3_RTS,		"uart3_rts"),
+	PINCTRL_PIN(PIN_UART3_CTS,		"uart3_cts"),
+	PINCTRL_PIN(PIN_SPI0_CS0,		"spi0_cs0"),
+	PINCTRL_PIN(PIN_SPI0_CS1,		"spi0_cs1"),
+	PINCTRL_PIN(PIN_SPI0_SDI,		"spi0_sdi"),
+	PINCTRL_PIN(PIN_SPI0_SDO,		"spi0_sdo"),
+	PINCTRL_PIN(PIN_SPI0_SCK,		"spi0_sck"),
+	PINCTRL_PIN(PIN_SPI1_CS0,		"spi1_cs0"),
+	PINCTRL_PIN(PIN_SPI1_CS1,		"spi1_cs1"),
+	PINCTRL_PIN(PIN_SPI1_SDI,		"spi1_sdi"),
+	PINCTRL_PIN(PIN_SPI1_SDO,		"spi1_sdo"),
+	PINCTRL_PIN(PIN_SPI1_SCK,		"spi1_sck"),
+	PINCTRL_PIN(PIN_JTAG0_TDO,		"jtag0_tdo"),
+	PINCTRL_PIN(PIN_JTAG0_TCK,		"jtag0_tck"),
+	PINCTRL_PIN(PIN_JTAG0_TDI,		"jtag0_tdi"),
+	PINCTRL_PIN(PIN_JTAG0_TMS,		"jtag0_tms"),
+	PINCTRL_PIN(PIN_JTAG0_TRST,		"jtag0_trst"),
+	PINCTRL_PIN(PIN_JTAG0_SRST,		"jtag0_srst"),
+	PINCTRL_PIN(PIN_JTAG1_TDO,		"jtag1_tdo"),
+	PINCTRL_PIN(PIN_JTAG1_TCK,		"jtag1_tck"),
+	PINCTRL_PIN(PIN_JTAG1_TDI,		"jtag1_tdi"),
+	PINCTRL_PIN(PIN_JTAG1_TMS,		"jtag1_tms"),
+	PINCTRL_PIN(PIN_JTAG1_TRST,		"jtag1_trst"),
+	PINCTRL_PIN(PIN_JTAG1_SRST,		"jtag1_srst"),
+	PINCTRL_PIN(PIN_JTAG2_TDO,		"jtag2_tdo"),
+	PINCTRL_PIN(PIN_JTAG2_TCK,		"jtag2_tck"),
+	PINCTRL_PIN(PIN_JTAG2_TDI,		"jtag2_tdi"),
+	PINCTRL_PIN(PIN_JTAG2_TMS,		"jtag2_tms"),
+	PINCTRL_PIN(PIN_JTAG2_TRST,		"jtag2_trst"),
+	PINCTRL_PIN(PIN_JTAG2_SRST,		"jtag2_srst"),
+	PINCTRL_PIN(PIN_JTAG3_TDO,		"jtag3_tdo"),
+	PINCTRL_PIN(PIN_JTAG3_TCK,		"jtag3_tck"),
+	PINCTRL_PIN(PIN_JTAG3_TDI,		"jtag3_tdi"),
+	PINCTRL_PIN(PIN_JTAG3_TMS,		"jtag3_tms"),
+	PINCTRL_PIN(PIN_JTAG3_TRST,		"jtag3_trst"),
+	PINCTRL_PIN(PIN_JTAG3_SRST,		"jtag3_srst"),
+	PINCTRL_PIN(PIN_GPIO0,			"gpio0"),
+	PINCTRL_PIN(PIN_GPIO1,			"gpio1"),
+	PINCTRL_PIN(PIN_GPIO2,			"gpio2"),
+	PINCTRL_PIN(PIN_GPIO3,			"gpio3"),
+	PINCTRL_PIN(PIN_GPIO4,			"gpio4"),
+	PINCTRL_PIN(PIN_GPIO5,			"gpio5"),
+	PINCTRL_PIN(PIN_GPIO6,			"gpio6"),
+	PINCTRL_PIN(PIN_GPIO7,			"gpio7"),
+	PINCTRL_PIN(PIN_GPIO8,			"gpio8"),
+	PINCTRL_PIN(PIN_GPIO9,			"gpio9"),
+	PINCTRL_PIN(PIN_GPIO10,			"gpio10"),
+	PINCTRL_PIN(PIN_GPIO11,			"gpio11"),
+	PINCTRL_PIN(PIN_GPIO12,			"gpio12"),
+	PINCTRL_PIN(PIN_GPIO13,			"gpio13"),
+	PINCTRL_PIN(PIN_GPIO14,			"gpio14"),
+	PINCTRL_PIN(PIN_GPIO15,			"gpio15"),
+	PINCTRL_PIN(PIN_GPIO16,			"gpio16"),
+	PINCTRL_PIN(PIN_GPIO17,			"gpio17"),
+	PINCTRL_PIN(PIN_GPIO18,			"gpio18"),
+	PINCTRL_PIN(PIN_GPIO19,			"gpio19"),
+	PINCTRL_PIN(PIN_GPIO20,			"gpio20"),
+	PINCTRL_PIN(PIN_GPIO21,			"gpio21"),
+	PINCTRL_PIN(PIN_GPIO22,			"gpio22"),
+	PINCTRL_PIN(PIN_GPIO23,			"gpio23"),
+	PINCTRL_PIN(PIN_GPIO24,			"gpio24"),
+	PINCTRL_PIN(PIN_GPIO25,			"gpio25"),
+	PINCTRL_PIN(PIN_GPIO26,			"gpio26"),
+	PINCTRL_PIN(PIN_GPIO27,			"gpio27"),
+	PINCTRL_PIN(PIN_GPIO28,			"gpio28"),
+	PINCTRL_PIN(PIN_GPIO29,			"gpio29"),
+	PINCTRL_PIN(PIN_GPIO30,			"gpio30"),
+	PINCTRL_PIN(PIN_GPIO31,			"gpio31"),
+	PINCTRL_PIN(PIN_MODE_SEL0,		"mode_sel0"),
+	PINCTRL_PIN(PIN_MODE_SEL1,		"mode_sel1"),
+	PINCTRL_PIN(PIN_MODE_SEL2,		"mode_sel2"),
+	PINCTRL_PIN(PIN_BOOT_SEL0,		"boot_sel0"),
+	PINCTRL_PIN(PIN_BOOT_SEL1,		"boot_sel1"),
+	PINCTRL_PIN(PIN_BOOT_SEL2,		"boot_sel2"),
+	PINCTRL_PIN(PIN_BOOT_SEL3,		"boot_sel3"),
+	PINCTRL_PIN(PIN_BOOT_SEL4,		"boot_sel4"),
+	PINCTRL_PIN(PIN_BOOT_SEL5,		"boot_sel5"),
+	PINCTRL_PIN(PIN_BOOT_SEL6,		"boot_sel6"),
+	PINCTRL_PIN(PIN_BOOT_SEL7,		"boot_sel7"),
+	PINCTRL_PIN(PIN_MULTI_SCKT,		"multi_sckt"),
+	PINCTRL_PIN(PIN_SCKT_ID0,		"sckt_id0"),
+	PINCTRL_PIN(PIN_SCKT_ID1,		"sckt_id1"),
+	PINCTRL_PIN(PIN_PLL_CLK_IN_MAIN,	"pll_clk_in_main"),
+	PINCTRL_PIN(PIN_PLL_CLK_IN_DDR_0,	"pll_clk_in_ddr_0"),
+	PINCTRL_PIN(PIN_PLL_CLK_IN_DDR_1,	"pll_clk_in_ddr_1"),
+	PINCTRL_PIN(PIN_PLL_CLK_IN_DDR_2,	"pll_clk_in_ddr_2"),
+	PINCTRL_PIN(PIN_PLL_CLK_IN_DDR_3,	"pll_clk_in_ddr_3"),
+	PINCTRL_PIN(PIN_XTAL_32K,		"xtal_32k"),
+	PINCTRL_PIN(PIN_SYS_RST,		"sys_rst"),
+	PINCTRL_PIN(PIN_PWR_BUTTON,		"pwr_button"),
+	PINCTRL_PIN(PIN_TEST_EN,		"test_en"),
+	PINCTRL_PIN(PIN_TEST_MODE_MBIST,	"test_mode_mbist"),
+	PINCTRL_PIN(PIN_TEST_MODE_SCAN,		"test_mode_scan"),
+	PINCTRL_PIN(PIN_TEST_MODE_BSD,		"test_mode_bsd"),
+	PINCTRL_PIN(PIN_BISR_BYP,		"bisr_byp"),
+};
+
+static const struct sg2042_pin sg2044_pin_data[ARRAY_SIZE(sg2044_pins)] = {
+	SG2042_GENERAL_PIN(PIN_IIC0_SMBSUS_IN, 0x000,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_IIC0_SMBSUS_OUT, 0x000,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_IIC0_SMBALERT, 0x004,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_IIC1_SMBSUS_IN, 0x004,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_IIC1_SMBSUS_OUT, 0x008,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_IIC1_SMBALERT, 0x008,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_IIC2_SMBSUS_IN, 0x00c,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_IIC2_SMBSUS_OUT, 0x00c,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_IIC2_SMBALERT, 0x010,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_IIC3_SMBSUS_IN, 0x010,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_IIC3_SMBSUS_OUT, 0x014,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_IIC3_SMBALERT, 0x014,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_PCIE0_L0_RESET, 0x018,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_PCIE0_L1_RESET, 0x018,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_PCIE0_L0_WAKEUP, 0x01c,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_PCIE0_L1_WAKEUP, 0x01c,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_PCIE0_L0_CLKREQ_IN, 0x020,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_PCIE0_L1_CLKREQ_IN, 0x020,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_PCIE1_L0_RESET, 0x024,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_PCIE1_L1_RESET, 0x024,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_PCIE1_L0_WAKEUP, 0x028,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_PCIE1_L1_WAKEUP, 0x028,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_PCIE1_L0_CLKREQ_IN, 0x02c,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_PCIE1_L1_CLKREQ_IN, 0x02c,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_PCIE2_L0_RESET, 0x030,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_PCIE2_L1_RESET, 0x030,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_PCIE2_L0_WAKEUP, 0x034,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_PCIE2_L1_WAKEUP, 0x034,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_PCIE2_L0_CLKREQ_IN, 0x038,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_PCIE2_L1_CLKREQ_IN, 0x038,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_PCIE3_L0_RESET, 0x03c,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_PCIE3_L1_RESET, 0x03c,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_PCIE3_L0_WAKEUP, 0x040,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_PCIE3_L1_WAKEUP, 0x040,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_PCIE3_L0_CLKREQ_IN, 0x044,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_PCIE3_L1_CLKREQ_IN, 0x044,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_PCIE4_L0_RESET, 0x048,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_PCIE4_L1_RESET, 0x048,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_PCIE4_L0_WAKEUP, 0x04c,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_PCIE4_L1_WAKEUP, 0x04c,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_PCIE4_L0_CLKREQ_IN, 0x050,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_PCIE4_L1_CLKREQ_IN, 0x050,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_SPIF0_CLK_SEL1, 0x054,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_SPIF0_CLK_SEL0, 0x054,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_SPIF0_WP, 0x058,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_SPIF0_HOLD, 0x058,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_SPIF0_SDI, 0x05c,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_SPIF0_CS, 0x05c,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_SPIF0_SCK, 0x060,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_SPIF0_SDO, 0x060,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_SPIF1_CLK_SEL1, 0x064,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_SPIF1_CLK_SEL0, 0x064,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_SPIF1_WP, 0x068,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_SPIF1_HOLD, 0x068,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_SPIF1_SDI, 0x06c,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_SPIF1_CS, 0x06c,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_SPIF1_SCK, 0x070,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_SPIF1_SDO, 0x070,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_EMMC_WP, 0x074,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_EMMC_CD, 0x074,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_EMMC_RST, 0x078,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_EMMC_PWR_EN, 0x078,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_SDIO_CD, 0x07c,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_SDIO_WP, 0x07c,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_SDIO_RST, 0x080,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_SDIO_PWR_EN, 0x080,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_RGMII0_TXD0, 0x084,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_RGMII0_TXD1, 0x084,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_RGMII0_TXD2, 0x088,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_RGMII0_TXD3, 0x088,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_RGMII0_TXCTRL, 0x08c,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_RGMII0_RXD0, 0x08c,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_RGMII0_RXD1, 0x090,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_RGMII0_RXD2, 0x090,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_RGMII0_RXD3, 0x094,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_RGMII0_RXCTRL, 0x094,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_RGMII0_TXC, 0x098,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_RGMII0_RXC, 0x098,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_RGMII0_REFCLKO, 0x09c,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_RGMII0_IRQ, 0x09c,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_RGMII0_MDC, 0x0a0,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_RGMII0_MDIO, 0x0a0,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_PWM0, 0x0a4,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_PWM1, 0x0a4,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_PWM2, 0x0a8,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_PWM3, 0x0a8,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_FAN0, 0x0ac,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_FAN1, 0x0ac,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_FAN2, 0x0b0,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_FAN3, 0x0b0,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_IIC0_SDA, 0x0b4,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_IIC0_SCL, 0x0b4,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_IIC1_SDA, 0x0b8,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_IIC1_SCL, 0x0b8,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_IIC2_SDA, 0x0bc,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_IIC2_SCL, 0x0bc,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_IIC3_SDA, 0x0c0,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_IIC3_SCL, 0x0c0,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_UART0_TX, 0x0c4,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_UART0_RX, 0x0c4,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_UART0_RTS, 0x0c8,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_UART0_CTS, 0x0c8,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_UART1_TX, 0x0cc,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_UART1_RX, 0x0cc,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_UART1_RTS, 0x0d0,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_UART1_CTS, 0x0d0,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_UART2_TX, 0x0d4,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_UART2_RX, 0x0d4,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_UART2_RTS, 0x0d8,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_UART2_CTS, 0x0d8,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_UART3_TX, 0x0dc,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_UART3_RX, 0x0dc,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_UART3_RTS, 0x0e0,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_UART3_CTS, 0x0e0,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_SPI0_CS0, 0x0e4,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_SPI0_CS1, 0x0e4,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_SPI0_SDI, 0x0e8,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_SPI0_SDO, 0x0e8,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_SPI0_SCK, 0x0ec,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_SPI1_CS0, 0x0ec,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_SPI1_CS1, 0x0f0,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_SPI1_SDI, 0x0f0,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_SPI1_SDO, 0x0f4,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_SPI1_SCK, 0x0f4,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_JTAG0_TDO, 0x0f8,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_JTAG0_TCK, 0x0f8,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_JTAG0_TDI, 0x0fc,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_JTAG0_TMS, 0x0fc,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_JTAG0_TRST, 0x100,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_JTAG0_SRST, 0x100,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_JTAG1_TDO, 0x104,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_JTAG1_TCK, 0x104,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_JTAG1_TDI, 0x108,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_JTAG1_TMS, 0x108,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_JTAG1_TRST, 0x10c,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_JTAG1_SRST, 0x10c,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_JTAG2_TDO, 0x110,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_JTAG2_TCK, 0x110,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_JTAG2_TDI, 0x114,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_JTAG2_TMS, 0x114,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_JTAG2_TRST, 0x118,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_JTAG2_SRST, 0x118,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_JTAG3_TDO, 0x11c,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_JTAG3_TCK, 0x11c,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_JTAG3_TDI, 0x120,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_JTAG3_TMS, 0x120,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_JTAG3_TRST, 0x124,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_JTAG3_SRST, 0x124,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_GPIO0, 0x128,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_GPIO1, 0x128,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_GPIO2, 0x12c,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_GPIO3, 0x12c,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_GPIO4, 0x130,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_GPIO5, 0x130,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_GPIO6, 0x134,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_GPIO7, 0x134,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_GPIO8, 0x138,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_GPIO9, 0x138,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_GPIO10, 0x13c,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_GPIO11, 0x13c,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_GPIO12, 0x140,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_GPIO13, 0x140,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_GPIO14, 0x144,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_GPIO15, 0x144,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_GPIO16, 0x148,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_GPIO17, 0x148,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_GPIO18, 0x14c,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_GPIO19, 0x14c,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_GPIO20, 0x150,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_GPIO21, 0x150,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_GPIO22, 0x154,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_GPIO23, 0x154,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_GPIO24, 0x158,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_GPIO25, 0x158,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_GPIO26, 0x15c,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_GPIO27, 0x15c,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_GPIO28, 0x160,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_GPIO29, 0x160,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_GPIO30, 0x164,
+			   PIN_FLAG_DEFAULT),
+	SG2042_GENERAL_PIN(PIN_GPIO31, 0x164,
+			   PIN_FLAG_WRITE_HIGH),
+	SG2042_GENERAL_PIN(PIN_MODE_SEL0, 0x168,
+			   PIN_FLAG_NO_PINMUX | PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_MODE_SEL1, 0x168,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_NO_PINMUX |
+			   PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_MODE_SEL2, 0x16c,
+			   PIN_FLAG_NO_PINMUX | PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_BOOT_SEL0, 0x16c,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_NO_PINMUX |
+			   PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_BOOT_SEL1, 0x170,
+			   PIN_FLAG_NO_PINMUX | PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_BOOT_SEL2, 0x170,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_NO_PINMUX |
+			   PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_BOOT_SEL3, 0x174,
+			   PIN_FLAG_NO_PINMUX | PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_BOOT_SEL4, 0x174,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_NO_PINMUX |
+			   PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_BOOT_SEL5, 0x178,
+			   PIN_FLAG_NO_PINMUX | PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_BOOT_SEL6, 0x178,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_NO_PINMUX |
+			   PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_BOOT_SEL7, 0x17c,
+			   PIN_FLAG_NO_PINMUX | PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_MULTI_SCKT, 0x17c,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_NO_PINMUX |
+			   PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_SCKT_ID0, 0x180,
+			   PIN_FLAG_NO_PINMUX | PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_SCKT_ID1, 0x180,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_NO_PINMUX |
+			   PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_PLL_CLK_IN_MAIN, 0x184,
+			   PIN_FLAG_NO_PINMUX | PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_PLL_CLK_IN_DDR_0, 0x184,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_NO_PINMUX |
+			   PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_PLL_CLK_IN_DDR_1, 0x188,
+			   PIN_FLAG_NO_PINMUX | PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_PLL_CLK_IN_DDR_2, 0x188,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_NO_PINMUX |
+			   PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_PLL_CLK_IN_DDR_3, 0x18c,
+			   PIN_FLAG_NO_PINMUX | PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_XTAL_32K, 0x18c,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_NO_PINMUX |
+			   PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_SYS_RST, 0x190,
+			   PIN_FLAG_NO_PINMUX | PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_PWR_BUTTON, 0x190,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_NO_PINMUX |
+			   PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_TEST_EN, 0x194,
+			   PIN_FLAG_NO_PINMUX | PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_TEST_MODE_MBIST, 0x194,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_NO_PINMUX |
+			   PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_TEST_MODE_SCAN, 0x198,
+			   PIN_FLAG_NO_PINMUX | PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_TEST_MODE_BSD, 0x198,
+			   PIN_FLAG_WRITE_HIGH | PIN_FLAG_NO_PINMUX |
+			   PIN_FLAG_NO_OEX_EN),
+	SG2042_GENERAL_PIN(PIN_BISR_BYP, 0x19c,
+			   PIN_FLAG_NO_PINMUX | PIN_FLAG_NO_OEX_EN),
+};
+
+static const struct sophgo_pinctrl_data sg2044_pindata = {
+	.pins		= sg2044_pins,
+	.pindata	= sg2044_pin_data,
+	.vddio_ops	= &sg2044_vddio_cfg_ops,
+	.cfg_ops	= &sg2042_cfg_ops,
+	.pctl_ops	= &sg2042_pctrl_ops,
+	.pmx_ops	= &sg2042_pmx_ops,
+	.pconf_ops	= &sg2042_pconf_ops,
+	.npins		= ARRAY_SIZE(sg2044_pins),
+	.pinsize	= sizeof(struct sg2042_pin),
+};
+
+static const struct of_device_id sg2044_pinctrl_ids[] = {
+	{ .compatible = "sophgo,sg2044-pinctrl", .data = &sg2044_pindata },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sg2044_pinctrl_ids);
+
+static struct platform_driver sg2044_pinctrl_driver = {
+	.probe	= sophgo_pinctrl_probe,
+	.driver	= {
+		.name			= "sg2044-pinctrl",
+		.suppress_bind_attrs	= true,
+		.of_match_table		= sg2044_pinctrl_ids,
+	},
+};
+module_platform_driver(sg2044_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for the SG2002 series SoC");
+MODULE_LICENSE("GPL");
-- 
2.48.1


