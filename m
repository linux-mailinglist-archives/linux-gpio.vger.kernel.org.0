Return-Path: <linux-gpio+bounces-21744-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B49ADE80C
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA4F03A7457
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 10:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074D22EA733;
	Wed, 18 Jun 2025 10:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jTisuL0r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7E52EA148;
	Wed, 18 Jun 2025 10:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240812; cv=none; b=cefXUa0vL2csWVhdI/mqSooTL9Mc7NW7ZUzCXP/1OudJrTnYOgLJDweFxoLpFYpMM+bBQSryjA67uuXIAt6B+w8Np7BflMRHahAnmKz42cvjCtxJHmLHVgtVVDpxFhX0dD9FqXvHjewXYksuZVils0tcThKYT7lr3UXDdWpNfB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240812; c=relaxed/simple;
	bh=LUoFIeL08oQuBjZ67R7liYVjWq3+Iq/Os7NI5McPR+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VmcYEOx+bZcgMQ38ENF/H9xDNTd5Fr3mQr0rBjN9Qth77rrJPF36A247y6qHlSON3M/3olJU2P0aQNDSb+adP6lvlgADmXo5u5Y5joNL/lWgAu6hAvG6KtD6NiGZjNyFau/o8AbIAeC/fQQvXy8OYC+ZeVfW3QAo+vNkyVEc+aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jTisuL0r; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60780d74c85so10241050a12.2;
        Wed, 18 Jun 2025 03:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240806; x=1750845606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZ+hW3wafejylBA1U6s9m5ESiBO/lIfqC7WIQgChIIw=;
        b=jTisuL0rQ1gYoiAWVvR8up971h4cfV8Hv8GQ+TXpuavoPFVLkP5h2iinaOggebtWzr
         XI+OSev+c/t1sicpCkk4BY14DwUXz2Bm1uXQ83+zHkvnqxg5hhEIvfhO2bVkgcecaU02
         SI81qKOHWg3XP4D7Sm9FGuTddPE/MQ0ySTA+i1RVTGs4R8R3yV2WUHdBHz6/FbjEJ4Nu
         RGZCM/GjzVVtcgGIw9eYimLKkxgoi3f4v7MPBazXCVJ2klVg4U189V0ZnmUuenLdaiXz
         oRRVeF+7cYyFgSw8EHsIfOIoH1NuUhyk8l8HmhHV2vmfasgFgJV+1eKG2rSzqdJmg5NI
         XxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240806; x=1750845606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZ+hW3wafejylBA1U6s9m5ESiBO/lIfqC7WIQgChIIw=;
        b=b4JhqGRuHg8Ozw+tyWp5olVPuoATOhqkhk/30tIuOxWHrQxyuFLu0j90QWfF0EFMlK
         wlLw0CT88k0+GVzIRCb1aCpPhAeIkd/XHpd1Rm5uAgBYzYusYSnXTE5Srq5BPWOeit2I
         9Ufp+/3xk+fUbMRcuwuZ2FHgC7TGRLoSS5THUML+i4S5dZPYb10nePA6TfXLO2BoArab
         ngL19quuMMM/xjsRinULUvFOlH9Y1p0EteQDzRhtrSIdOSkSMqO4w0f/F9ui8h/O2Zoz
         wiYlu8Wg1stZ4CpRVZkugxsLGmoCKp5vgz2S7PP6DukdvgEfdfyLw/qg6lW46LYShRLD
         VTuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUrMH+AA1H/2h4zWGClep5PRVTXu+PhylGD8GCSwECaqBfCYuaMbSKW7AVU8O02VRjxohxCNHlrOxq+g==@vger.kernel.org, AJvYcCWmdTTxk3Lt+6PgV7fVACFeZ5s9lIosvsIbKkNHFEAhvoiqldNGYmbqX6cV2B05lgc8JK50kIJrNA5RLhdo@vger.kernel.org, AJvYcCWv+OpxJnMjpcOiRQkMlMkp03i+i7g2rICpyTj/BlMsNzL1K4sCVuu8f37FP9I7rnjukT670vYxZtpz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3bM4j9tRqeVloUdwJwwHgHocju7XgMgAsNfuNu34rx9B7G0M3
	4JJiF7O8VGmGOvYKAcjFY5tKsutCurun9a4/jlQfz/7hf/EqsmE3iBCQVOgagQ==
X-Gm-Gg: ASbGncuN23587ACveHbL3Mnkmq/bD74E3W5t7EzAKvmc53fd1yOUI/I7jjNy5j0fP8T
	VMIoLqNmOz+Hs5fCatq1ruNhCZRFD2cWczh1UWT70JbYCqMI9/6KMeh1oG6aqjHU9u4yYDikYGD
	LPofmHE1bghz8+x+Vj6YuAiaGENcnZv8vDEF3L2RbjpWVSX58gxfNHzVwMqK89sZWdoPpb+FaB4
	MoMW2MXuwq3XfgmDTWo2uMObPGGrL4+HXpqY/xMY2BXglrJQ2yOwHRSikcVUcpiQmQZSykXWSy/
	Z3BFcjbVzrv97XdyYdxvvvwYoN7NLLYkFVflvSULsuLg6tARalWpjinE0bj341D1611HK7nuSVR
	RfuAsdo1kGw==
X-Google-Smtp-Source: AGHT+IE1GX7DGHrc/gZ3V/eg/+T9xbeMHPLlXYos8zyxgRaVNRK4gga5i/4AwEPrEBbSzKkdz8qcIA==
X-Received: by 2002:a05:6402:5114:b0:607:1053:504e with SMTP id 4fb4d7f45d1cf-608d088ef85mr14308679a12.2.1750240805354;
        Wed, 18 Jun 2025 03:00:05 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.03.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 03:00:04 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org (open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)),
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 19/19] media: i2c: remove MAX96714 driver
Date: Wed, 18 Jun 2025 12:58:55 +0300
Message-ID: <20250618095858.2145209-20-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous MAX96714 driver has been removed and its functionality has
been moved to the MAX9296A driver which makes use of the Maxim GMSL2/3
serializer framework.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 MAINTAINERS                  |    1 -
 drivers/media/i2c/Kconfig    |   17 -
 drivers/media/i2c/Makefile   |    1 -
 drivers/media/i2c/max96714.c | 1024 ----------------------------------
 4 files changed, 1043 deletions(-)
 delete mode 100644 drivers/media/i2c/max96714.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c001a342afda..462e7d346331 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14739,7 +14739,6 @@ M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
-F:	drivers/media/i2c/max96714.c
 
 MAX96717 GMSL2 SERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index da811020b655..fccdb9c7d982 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1665,23 +1665,6 @@ config VIDEO_DS90UB960
 	  Device driver for the Texas Instruments DS90UB960
 	  FPD-Link III Deserializer and DS90UB9702 FPD-Link IV Deserializer.
 
-config VIDEO_MAX96714
-	tristate "Maxim MAX96714 GMSL2 deserializer"
-	depends on OF && I2C && VIDEO_DEV
-	select I2C_MUX
-	select MEDIA_CONTROLLER
-	select GPIOLIB
-	select V4L2_CCI_I2C
-	select V4L2_FWNODE
-	select VIDEO_V4L2_SUBDEV_API
-	help
-	  Device driver for the Maxim MAX96714 GMSL2 Deserializer.
-	  MAX96714 deserializers convert a GMSL2 input to MIPI CSI-2
-	  output.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called max96714.
-
 source "drivers/media/i2c/maxim-serdes/Kconfig"
 
 endmenu
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 29ac7ea2bfa0..347d2dc0a796 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -68,7 +68,6 @@ obj-$(CONFIG_VIDEO_LT6911UXE) += lt6911uxe.o
 obj-$(CONFIG_VIDEO_M52790) += m52790.o
 obj-$(CONFIG_VIDEO_MAX9271_LIB) += max9271.o
 obj-$(CONFIG_VIDEO_MAX9286) += max9286.o
-obj-$(CONFIG_VIDEO_MAX96714) += max96714.o
 obj-$(CONFIG_VIDEO_MAXIM_SERDES) += maxim-serdes/
 obj-$(CONFIG_VIDEO_ML86V7667) += ml86v7667.o
 obj-$(CONFIG_VIDEO_MSP3400) += msp3400.o
diff --git a/drivers/media/i2c/max96714.c b/drivers/media/i2c/max96714.c
deleted file mode 100644
index 3cc1b1ae47d1..000000000000
--- a/drivers/media/i2c/max96714.c
+++ /dev/null
@@ -1,1024 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Maxim GMSL2 Deserializer Driver
- *
- * Copyright (C) 2024 Collabora Ltd.
- */
-
-#include <linux/bitfield.h>
-#include <linux/bitops.h>
-#include <linux/gpio/consumer.h>
-#include <linux/i2c.h>
-#include <linux/i2c-mux.h>
-#include <linux/module.h>
-#include <linux/property.h>
-#include <linux/regmap.h>
-#include <linux/regulator/consumer.h>
-
-#include <media/v4l2-cci.h>
-#include <media/v4l2-ctrls.h>
-#include <media/v4l2-fwnode.h>
-#include <media/v4l2-subdev.h>
-
-#define MAX96714_DEVICE_ID  0xc9
-#define MAX96714F_DEVICE_ID 0xca
-#define MAX96714_NPORTS     2
-#define MAX96714_PAD_SINK   0
-#define MAX96714_PAD_SOURCE 1
-#define MAX96714_CSI_NLANES 4
-
-/* DEV */
-#define MAX96714_REG13                 CCI_REG8(0x0d)
-#define MAX96714_DEV_REV               CCI_REG8(0x0e)
-#define MAX96714_DEV_REV_MASK          GENMASK(3, 0)
-#define MAX96714_LINK_LOCK             CCI_REG8(0x13)
-#define MAX96714_LINK_LOCK_BIT         BIT(3)
-#define MAX96714_IO_CHK0               CCI_REG8(0x38)
-#define MAX96714_PATTERN_CLK_FREQ      GENMASK(1, 0)
-/* VID_RX */
-#define MAX96714_VIDEO_RX8             CCI_REG8(0x11a)
-#define MAX96714_VID_LOCK              BIT(6)
-
-/* VRX_PATGEN_0 */
-#define MAX96714_PATGEN_0              CCI_REG8(0x240)
-#define MAX96714_PATGEN_1              CCI_REG8(0x241)
-#define MAX96714_PATGEN_MODE           GENMASK(5, 4)
-#define MAX96714_PATGEN_VS_DLY         CCI_REG24(0x242)
-#define MAX96714_PATGEN_VS_HIGH        CCI_REG24(0x245)
-#define MAX96714_PATGEN_VS_LOW         CCI_REG24(0x248)
-#define MAX96714_PATGEN_V2H            CCI_REG24(0x24b)
-#define MAX96714_PATGEN_HS_HIGH        CCI_REG16(0x24e)
-#define MAX96714_PATGEN_HS_LOW         CCI_REG16(0x250)
-#define MAX96714_PATGEN_HS_CNT         CCI_REG16(0x252)
-#define MAX96714_PATGEN_V2D            CCI_REG24(0x254)
-#define MAX96714_PATGEN_DE_HIGH        CCI_REG16(0x257)
-#define MAX96714_PATGEN_DE_LOW         CCI_REG16(0x259)
-#define MAX96714_PATGEN_DE_CNT         CCI_REG16(0x25b)
-#define MAX96714_PATGEN_GRAD_INC       CCI_REG8(0x25d)
-#define MAX96714_PATGEN_CHKB_COLOR_A   CCI_REG24(0x25e)
-#define MAX96714_PATGEN_CHKB_COLOR_B   CCI_REG24(0x261)
-#define MAX96714_PATGEN_CHKB_RPT_CNT_A CCI_REG8(0x264)
-#define MAX96714_PATGEN_CHKB_RPT_CNT_B CCI_REG8(0x265)
-#define MAX96714_PATGEN_CHKB_ALT       CCI_REG8(0x266)
-/* BACKTOP */
-#define MAX96714_BACKTOP25             CCI_REG8(0x320)
-#define CSI_DPLL_FREQ_MASK             GENMASK(4, 0)
-
-/* MIPI_PHY */
-#define MAX96714_MIPI_PHY0             CCI_REG8(0x330)
-#define MAX96714_FORCE_CSI_OUT         BIT(7)
-#define MAX96714_MIPI_STDBY_N          CCI_REG8(0x332)
-#define MAX96714_MIPI_STDBY_MASK       GENMASK(5, 4)
-#define MAX96714_MIPI_LANE_MAP         CCI_REG8(0x333)
-#define MAX96714_MIPI_POLARITY         CCI_REG8(0x335)
-#define MAX96714_MIPI_POLARITY_MASK    GENMASK(5, 0)
-
-/* MIPI_TX */
-#define MAX96714_MIPI_LANE_CNT         CCI_REG8(0x44a)
-#define MAX96714_CSI2_LANE_CNT_MASK    GENMASK(7, 6)
-#define MAX96714_MIPI_TX52             CCI_REG8(0x474)
-#define MAX96714_TUN_EN                BIT(0)
-
-#define MHZ(v) ((u32)((v)  * 1000000U))
-
-enum max96714_vpg_mode {
-	MAX96714_VPG_DISABLED = 0,
-	MAX96714_VPG_CHECKERBOARD = 1,
-	MAX96714_VPG_GRADIENT = 2,
-};
-
-struct max96714_rxport {
-	struct {
-		struct v4l2_subdev   *sd;
-		u16                  pad;
-		struct fwnode_handle *ep_fwnode;
-	} source;
-	struct regulator	     *poc;
-};
-
-struct max96714_txport {
-	struct v4l2_fwnode_endpoint vep;
-};
-
-struct max96714_priv {
-	struct i2c_client                 *client;
-	struct regmap                     *regmap;
-	struct gpio_desc                  *pd_gpio;
-	struct max96714_rxport            rxport;
-	struct i2c_mux_core               *mux;
-	u64                               enabled_source_streams;
-	struct v4l2_subdev		  sd;
-	struct media_pad		  pads[MAX96714_NPORTS];
-	struct v4l2_mbus_config_mipi_csi2 mipi_csi2;
-	struct v4l2_ctrl_handler          ctrl_handler;
-	struct v4l2_async_notifier        notifier;
-	s64                               tx_link_freq;
-	enum max96714_vpg_mode            pattern;
-};
-
-static inline struct max96714_priv *sd_to_max96714(struct v4l2_subdev *sd)
-{
-	return container_of(sd, struct max96714_priv, sd);
-}
-
-static int max96714_enable_tx_port(struct max96714_priv *priv)
-{
-	return cci_update_bits(priv->regmap, MAX96714_MIPI_STDBY_N,
-			       MAX96714_MIPI_STDBY_MASK,
-			       MAX96714_MIPI_STDBY_MASK, NULL);
-}
-
-static int max96714_disable_tx_port(struct max96714_priv *priv)
-{
-	return cci_update_bits(priv->regmap, MAX96714_MIPI_STDBY_N,
-			       MAX96714_MIPI_STDBY_MASK, 0, NULL);
-}
-
-static bool max96714_tx_port_enabled(struct max96714_priv *priv)
-{
-	u64 val;
-
-	cci_read(priv->regmap, MAX96714_MIPI_STDBY_N, &val, NULL);
-
-	return val & MAX96714_MIPI_STDBY_MASK;
-}
-
-static int max96714_apply_patgen_timing(struct max96714_priv *priv,
-					struct v4l2_subdev_state *state)
-{
-	struct v4l2_mbus_framefmt *fmt =
-		v4l2_subdev_state_get_format(state, MAX96714_PAD_SOURCE);
-	const u32 h_active = fmt->width;
-	const u32 h_fp = 88;
-	const u32 h_sw = 44;
-	const u32 h_bp = 148;
-	u32 h_tot;
-	const u32 v_active = fmt->height;
-	const u32 v_fp = 4;
-	const u32 v_sw = 5;
-	const u32 v_bp = 36;
-	u32 v_tot;
-	int ret = 0;
-
-	h_tot = h_active + h_fp + h_sw + h_bp;
-	v_tot = v_active + v_fp + v_sw + v_bp;
-
-	/* 75 Mhz pixel clock */
-	cci_update_bits(priv->regmap, MAX96714_IO_CHK0,
-			MAX96714_PATTERN_CLK_FREQ, 1, &ret);
-
-	dev_info(&priv->client->dev, "height: %d width: %d\n", fmt->height,
-		 fmt->width);
-
-	cci_write(priv->regmap, MAX96714_PATGEN_VS_DLY, 0, &ret);
-	cci_write(priv->regmap, MAX96714_PATGEN_VS_HIGH, v_sw * h_tot, &ret);
-	cci_write(priv->regmap, MAX96714_PATGEN_VS_LOW,
-		  (v_active + v_fp + v_bp) * h_tot, &ret);
-	cci_write(priv->regmap, MAX96714_PATGEN_HS_HIGH, h_sw, &ret);
-	cci_write(priv->regmap, MAX96714_PATGEN_HS_LOW, h_active + h_fp + h_bp,
-		  &ret);
-	cci_write(priv->regmap, MAX96714_PATGEN_V2D,
-		  h_tot * (v_sw + v_bp) + (h_sw + h_bp), &ret);
-	cci_write(priv->regmap, MAX96714_PATGEN_HS_CNT, v_tot, &ret);
-	cci_write(priv->regmap, MAX96714_PATGEN_DE_HIGH, h_active, &ret);
-	cci_write(priv->regmap, MAX96714_PATGEN_DE_LOW, h_fp + h_sw + h_bp,
-		  &ret);
-	cci_write(priv->regmap, MAX96714_PATGEN_DE_CNT, v_active, &ret);
-	/* B G R */
-	cci_write(priv->regmap, MAX96714_PATGEN_CHKB_COLOR_A, 0xfecc00, &ret);
-	/* B G R */
-	cci_write(priv->regmap, MAX96714_PATGEN_CHKB_COLOR_B, 0x006aa7, &ret);
-	cci_write(priv->regmap, MAX96714_PATGEN_CHKB_RPT_CNT_A, 0x3c, &ret);
-	cci_write(priv->regmap, MAX96714_PATGEN_CHKB_RPT_CNT_B, 0x3c, &ret);
-	cci_write(priv->regmap, MAX96714_PATGEN_CHKB_ALT, 0x3c, &ret);
-	cci_write(priv->regmap, MAX96714_PATGEN_GRAD_INC, 0x10, &ret);
-
-	return ret;
-}
-
-static int max96714_apply_patgen(struct max96714_priv *priv,
-				 struct v4l2_subdev_state *state)
-{
-	unsigned int val;
-	int ret = 0;
-
-	if (priv->pattern)
-		ret = max96714_apply_patgen_timing(priv, state);
-
-	cci_write(priv->regmap, MAX96714_PATGEN_0, priv->pattern ? 0xfb : 0,
-		  &ret);
-
-	val = FIELD_PREP(MAX96714_PATGEN_MODE, priv->pattern);
-	cci_update_bits(priv->regmap, MAX96714_PATGEN_1, MAX96714_PATGEN_MODE,
-			val, &ret);
-	return ret;
-}
-
-static int max96714_s_ctrl(struct v4l2_ctrl *ctrl)
-{
-	struct max96714_priv *priv =
-		container_of(ctrl->handler, struct max96714_priv, ctrl_handler);
-	int ret;
-
-	switch (ctrl->id) {
-	case V4L2_CID_TEST_PATTERN:
-		if (priv->enabled_source_streams)
-			return -EBUSY;
-		priv->pattern = ctrl->val;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	ret = cci_update_bits(priv->regmap, MAX96714_MIPI_PHY0,
-			      MAX96714_FORCE_CSI_OUT,
-			      priv->pattern ? MAX96714_FORCE_CSI_OUT : 0, NULL);
-
-	/* Pattern generator doesn't work with tunnel mode */
-	return cci_update_bits(priv->regmap, MAX96714_MIPI_TX52,
-			       MAX96714_TUN_EN,
-			       priv->pattern ? 0 : MAX96714_TUN_EN, &ret);
-}
-
-static const char * const max96714_test_pattern[] = {
-	"Disabled",
-	"Checkerboard",
-	"Gradient"
-};
-
-static const struct v4l2_ctrl_ops max96714_ctrl_ops = {
-	.s_ctrl = max96714_s_ctrl,
-};
-
-static int max96714_enable_streams(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_state *state,
-				   u32 source_pad, u64 streams_mask)
-{
-	struct max96714_priv *priv = sd_to_max96714(sd);
-	u64 sink_streams;
-	int ret;
-
-	if (!priv->enabled_source_streams)
-		max96714_enable_tx_port(priv);
-
-	ret = max96714_apply_patgen(priv, state);
-	if (ret)
-		goto err;
-
-	if (!priv->pattern) {
-		if (!priv->rxport.source.sd) {
-			ret = -ENODEV;
-			goto err;
-		}
-
-		sink_streams =
-			v4l2_subdev_state_xlate_streams(state,
-							MAX96714_PAD_SOURCE,
-							MAX96714_PAD_SINK,
-							&streams_mask);
-
-		ret = v4l2_subdev_enable_streams(priv->rxport.source.sd,
-						 priv->rxport.source.pad,
-						 sink_streams);
-		if (ret)
-			goto err;
-	}
-
-	priv->enabled_source_streams |= streams_mask;
-
-	return 0;
-
-err:
-	if (!priv->enabled_source_streams)
-		max96714_disable_tx_port(priv);
-
-	return ret;
-}
-
-static int max96714_disable_streams(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_state *state,
-				    u32 source_pad, u64 streams_mask)
-{
-	struct max96714_priv *priv = sd_to_max96714(sd);
-	u64 sink_streams;
-
-	if (!priv->pattern) {
-		int ret;
-
-		sink_streams =
-			v4l2_subdev_state_xlate_streams(state,
-							MAX96714_PAD_SOURCE,
-							MAX96714_PAD_SINK,
-							&streams_mask);
-
-		ret = v4l2_subdev_disable_streams(priv->rxport.source.sd,
-						  priv->rxport.source.pad,
-						  sink_streams);
-		if (ret)
-			return ret;
-	}
-
-	priv->enabled_source_streams &= ~streams_mask;
-
-	if (!priv->enabled_source_streams)
-		max96714_disable_tx_port(priv);
-
-	return 0;
-}
-
-static int max96714_set_fmt(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_state *state,
-			    struct v4l2_subdev_format *format)
-{
-	struct max96714_priv *priv = sd_to_max96714(sd);
-	struct v4l2_mbus_framefmt *fmt;
-
-	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
-	    priv->enabled_source_streams)
-		return -EBUSY;
-
-	/* No transcoding, source and sink formats must match. */
-	if (format->pad == MAX96714_PAD_SOURCE)
-		return v4l2_subdev_get_fmt(sd, state, format);
-
-	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
-	if (!fmt)
-		return -EINVAL;
-
-	*fmt = format->format;
-
-	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
-							   format->stream);
-	if (!fmt)
-		return -EINVAL;
-
-	*fmt = format->format;
-
-	return 0;
-}
-
-static int _max96714_set_routing(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_state *state,
-				 enum v4l2_subdev_format_whence which,
-				 struct v4l2_subdev_krouting *routing)
-{
-	static const struct v4l2_mbus_framefmt format = {
-		.width = 1280,
-		.height = 1080,
-		.code = MEDIA_BUS_FMT_Y8_1X8,
-		.field = V4L2_FIELD_NONE,
-	};
-	int ret;
-
-	/*
-	 * Note: we can only support up to V4L2_FRAME_DESC_ENTRY_MAX, until
-	 * frame desc is made dynamically allocated.
-	 */
-	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
-		return -EINVAL;
-
-	ret = v4l2_subdev_routing_validate(sd, routing,
-					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
-	if (ret)
-		return ret;
-
-	return v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
-}
-
-static int max96714_set_routing(struct v4l2_subdev *sd,
-				struct v4l2_subdev_state *state,
-				enum v4l2_subdev_format_whence which,
-				struct v4l2_subdev_krouting *routing)
-{
-	struct max96714_priv *priv = sd_to_max96714(sd);
-
-	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && priv->enabled_source_streams)
-		return -EBUSY;
-
-	return _max96714_set_routing(sd, state, which, routing);
-}
-
-static int max96714_init_state(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_state *state)
-{
-	struct v4l2_subdev_route routes[] = {
-		{
-			.sink_pad = MAX96714_PAD_SINK,
-			.sink_stream = 0,
-			.source_pad = MAX96714_PAD_SOURCE,
-			.source_stream = 0,
-			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
-		}
-	};
-	struct v4l2_subdev_krouting routing = {
-		.num_routes = ARRAY_SIZE(routes),
-		.routes = routes,
-	};
-
-	return _max96714_set_routing(sd, state, V4L2_SUBDEV_FORMAT_ACTIVE,
-				     &routing);
-}
-
-static const struct v4l2_subdev_pad_ops max96714_pad_ops = {
-	.enable_streams = max96714_enable_streams,
-	.disable_streams = max96714_disable_streams,
-
-	.set_routing = max96714_set_routing,
-	.get_fmt = v4l2_subdev_get_fmt,
-	.set_fmt = max96714_set_fmt,
-};
-
-static bool max96714_link_locked(struct max96714_priv *priv)
-{
-	u64 val = 0;
-
-	cci_read(priv->regmap, MAX96714_LINK_LOCK, &val, NULL);
-
-	return val & MAX96714_LINK_LOCK_BIT;
-}
-
-static void max96714_link_status(struct max96714_priv *priv)
-{
-	struct device *dev = &priv->client->dev;
-
-	dev_info(dev, "Link locked:%d\n", max96714_link_locked(priv));
-}
-
-static bool max96714_pipe_locked(struct max96714_priv *priv)
-{
-	u64 val;
-
-	cci_read(priv->regmap, MAX96714_VIDEO_RX8, &val, NULL);
-
-	return val & MAX96714_VID_LOCK;
-}
-
-static void max96714_pipe_status(struct max96714_priv *priv)
-{
-	struct device *dev = &priv->client->dev;
-
-	dev_info(dev, "Pipe vidlock:%d\n", max96714_pipe_locked(priv));
-}
-
-static void max96714_csi_status(struct max96714_priv *priv)
-{
-	struct device *dev = &priv->client->dev;
-	u64 freq = 0;
-
-	cci_read(priv->regmap, MAX96714_BACKTOP25, &freq, NULL);
-	freq = FIELD_GET(CSI_DPLL_FREQ_MASK, freq);
-
-	dev_info(dev, "CSI controller DPLL freq:%u00MHz CSIPHY enabled:%d\n",
-		 (u8)freq, max96714_tx_port_enabled(priv));
-}
-
-static int max96714_log_status(struct v4l2_subdev *sd)
-{
-	struct max96714_priv *priv = sd_to_max96714(sd);
-	struct device *dev = &priv->client->dev;
-
-	dev_info(dev, "Deserializer: max96714\n");
-
-	max96714_link_status(priv);
-	max96714_pipe_status(priv);
-	max96714_csi_status(priv);
-
-	return 0;
-}
-
-static const struct v4l2_subdev_core_ops max96714_subdev_core_ops = {
-	.log_status = max96714_log_status,
-};
-
-static const struct v4l2_subdev_video_ops max96714_video_ops = {
-	.s_stream	= v4l2_subdev_s_stream_helper,
-};
-
-static const struct v4l2_subdev_internal_ops max96714_internal_ops = {
-	.init_state = max96714_init_state,
-};
-
-static const struct v4l2_subdev_ops max96714_subdev_ops = {
-	.video = &max96714_video_ops,
-	.core = &max96714_subdev_core_ops,
-	.pad = &max96714_pad_ops,
-};
-
-static const struct media_entity_operations max96714_entity_ops = {
-	.link_validate = v4l2_subdev_link_validate,
-};
-
-static int max96714_notify_bound(struct v4l2_async_notifier *notifier,
-				 struct v4l2_subdev *subdev,
-				 struct v4l2_async_connection *asd)
-{
-	struct max96714_priv *priv = sd_to_max96714(notifier->sd);
-	struct device *dev = &priv->client->dev;
-	int ret;
-
-	ret = media_entity_get_fwnode_pad(&subdev->entity,
-					  priv->rxport.source.ep_fwnode,
-					  MEDIA_PAD_FL_SOURCE);
-	if (ret < 0) {
-		dev_err(dev, "Failed to find pad for %s\n", subdev->name);
-		return ret;
-	}
-
-	priv->rxport.source.sd = subdev;
-	priv->rxport.source.pad = ret;
-
-	ret = media_create_pad_link(&priv->rxport.source.sd->entity,
-				    priv->rxport.source.pad, &priv->sd.entity,
-				    MAX96714_PAD_SINK,
-				    MEDIA_LNK_FL_ENABLED |
-				    MEDIA_LNK_FL_IMMUTABLE);
-	if (ret) {
-		dev_err(dev, "Unable to link %s:%u -> %s:%u\n",
-			priv->rxport.source.sd->name, priv->rxport.source.pad,
-			priv->sd.name, MAX96714_PAD_SINK);
-		return ret;
-	}
-
-	return 0;
-}
-
-static const struct v4l2_async_notifier_operations max96714_notify_ops = {
-	.bound = max96714_notify_bound,
-};
-
-static int max96714_v4l2_notifier_register(struct max96714_priv *priv)
-{
-	struct device *dev = &priv->client->dev;
-	struct max96714_rxport *rxport = &priv->rxport;
-	struct v4l2_async_connection *asd;
-	int ret;
-
-	if (!rxport->source.ep_fwnode)
-		return 0;
-
-	v4l2_async_subdev_nf_init(&priv->notifier, &priv->sd);
-
-	asd = v4l2_async_nf_add_fwnode(&priv->notifier,
-				       rxport->source.ep_fwnode,
-				       struct v4l2_async_connection);
-	if (IS_ERR(asd)) {
-		dev_err(dev, "Failed to add subdev: %pe", asd);
-		v4l2_async_nf_cleanup(&priv->notifier);
-		return PTR_ERR(asd);
-	}
-
-	priv->notifier.ops = &max96714_notify_ops;
-
-	ret = v4l2_async_nf_register(&priv->notifier);
-	if (ret) {
-		dev_err(dev, "Failed to register subdev_notifier");
-		v4l2_async_nf_cleanup(&priv->notifier);
-		return ret;
-	}
-
-	return 0;
-}
-
-static int max96714_create_subdev(struct max96714_priv *priv)
-{
-	struct device *dev = &priv->client->dev;
-	int ret;
-
-	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max96714_subdev_ops);
-	priv->sd.internal_ops = &max96714_internal_ops;
-
-	v4l2_ctrl_handler_init(&priv->ctrl_handler, 1);
-	priv->sd.ctrl_handler = &priv->ctrl_handler;
-
-	v4l2_ctrl_new_int_menu(&priv->ctrl_handler, NULL, V4L2_CID_LINK_FREQ,
-			       0, 0, &priv->tx_link_freq);
-	v4l2_ctrl_new_std_menu_items(&priv->ctrl_handler,
-				     &max96714_ctrl_ops,
-				     V4L2_CID_TEST_PATTERN,
-				     ARRAY_SIZE(max96714_test_pattern) - 1,
-				     0, 0, max96714_test_pattern);
-	if (priv->ctrl_handler.error) {
-		ret = priv->ctrl_handler.error;
-		goto err_free_ctrl;
-	}
-
-	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
-	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
-	priv->sd.entity.ops = &max96714_entity_ops;
-
-	priv->pads[MAX96714_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
-	priv->pads[MAX96714_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
-
-	ret = media_entity_pads_init(&priv->sd.entity,
-				     MAX96714_NPORTS,
-				     priv->pads);
-	if (ret)
-		goto err_free_ctrl;
-
-	priv->sd.state_lock = priv->sd.ctrl_handler->lock;
-
-	ret = v4l2_subdev_init_finalize(&priv->sd);
-	if (ret)
-		goto err_entity_cleanup;
-
-	ret = max96714_v4l2_notifier_register(priv);
-	if (ret) {
-		dev_err(dev, "v4l2 subdev notifier register failed: %d\n", ret);
-		goto err_subdev_cleanup;
-	}
-
-	ret = v4l2_async_register_subdev(&priv->sd);
-	if (ret) {
-		dev_err(dev, "v4l2_async_register_subdev error: %d\n", ret);
-		goto err_unreg_notif;
-	}
-
-	return 0;
-
-err_unreg_notif:
-	v4l2_async_nf_unregister(&priv->notifier);
-	v4l2_async_nf_cleanup(&priv->notifier);
-err_subdev_cleanup:
-	v4l2_subdev_cleanup(&priv->sd);
-err_entity_cleanup:
-	media_entity_cleanup(&priv->sd.entity);
-err_free_ctrl:
-	v4l2_ctrl_handler_free(&priv->ctrl_handler);
-
-	return ret;
-};
-
-static void max96714_destroy_subdev(struct max96714_priv *priv)
-{
-	v4l2_async_nf_unregister(&priv->notifier);
-	v4l2_async_nf_cleanup(&priv->notifier);
-	v4l2_async_unregister_subdev(&priv->sd);
-
-	v4l2_subdev_cleanup(&priv->sd);
-
-	media_entity_cleanup(&priv->sd.entity);
-	v4l2_ctrl_handler_free(&priv->ctrl_handler);
-}
-
-static int max96714_i2c_mux_select(struct i2c_mux_core *mux, u32 chan)
-{
-	return 0;
-}
-
-static int max96714_i2c_mux_init(struct max96714_priv *priv)
-{
-	priv->mux = i2c_mux_alloc(priv->client->adapter, &priv->client->dev,
-				  1, 0, I2C_MUX_LOCKED | I2C_MUX_GATE,
-				  max96714_i2c_mux_select, NULL);
-	if (!priv->mux)
-		return -ENOMEM;
-
-	return i2c_mux_add_adapter(priv->mux, 0, 0);
-}
-
-static int max96714_init_tx_port(struct max96714_priv *priv)
-{
-	struct v4l2_mbus_config_mipi_csi2 *mipi;
-	unsigned long lanes_used = 0;
-	unsigned int val, lane;
-	int ret;
-
-	ret = max96714_disable_tx_port(priv);
-
-	mipi = &priv->mipi_csi2;
-	val = div_u64(priv->tx_link_freq * 2, MHZ(100));
-
-	cci_update_bits(priv->regmap, MAX96714_BACKTOP25,
-			CSI_DPLL_FREQ_MASK, val, &ret);
-
-	val = FIELD_PREP(MAX96714_CSI2_LANE_CNT_MASK, mipi->num_data_lanes - 1);
-	cci_update_bits(priv->regmap, MAX96714_MIPI_LANE_CNT,
-			MAX96714_CSI2_LANE_CNT_MASK, val, &ret);
-
-	/* lanes polarity */
-	val = 0;
-	for (lane = 0; lane < mipi->num_data_lanes + 1; lane++) {
-		if (!mipi->lane_polarities[lane])
-			continue;
-		if (lane == 0)
-			/* clock lane */
-			val |= BIT(5);
-		else if (lane < 3)
-			/* Lane D0 and D1 */
-			val |= BIT(lane - 1);
-		else
-			/* D2 and D3 */
-			val |= BIT(lane);
-	}
-
-	cci_update_bits(priv->regmap, MAX96714_MIPI_POLARITY,
-			MAX96714_MIPI_POLARITY_MASK, val, &ret);
-
-	/* lanes mapping */
-	val = 0;
-	for (lane = 0; lane < mipi->num_data_lanes; lane++) {
-		val |= (mipi->data_lanes[lane] - 1) << (lane * 2);
-		lanes_used |= BIT(mipi->data_lanes[lane] - 1);
-	}
-
-	/*
-	 * Unused lanes need to be mapped as well to not have
-	 * the same lanes mapped twice.
-	 */
-	for (; lane < MAX96714_CSI_NLANES; lane++) {
-		unsigned int idx = find_first_zero_bit(&lanes_used,
-						       MAX96714_CSI_NLANES);
-
-		val |= idx << (lane * 2);
-		lanes_used |= BIT(idx);
-	}
-
-	return cci_write(priv->regmap, MAX96714_MIPI_LANE_MAP, val, &ret);
-}
-
-static int max96714_rxport_enable_poc(struct max96714_priv *priv)
-{
-	struct max96714_rxport *rxport = &priv->rxport;
-
-	if (!rxport->poc)
-		return 0;
-
-	return regulator_enable(rxport->poc);
-}
-
-static int max96714_rxport_disable_poc(struct max96714_priv *priv)
-{
-	struct max96714_rxport *rxport = &priv->rxport;
-
-	if (!rxport->poc)
-		return 0;
-
-	return regulator_disable(rxport->poc);
-}
-
-static int max96714_parse_dt_txport(struct max96714_priv *priv)
-{
-	struct device *dev = &priv->client->dev;
-	struct v4l2_fwnode_endpoint vep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
-	struct fwnode_handle *ep_fwnode;
-	u32 num_data_lanes;
-	int ret;
-
-	ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
-						    MAX96714_PAD_SOURCE, 0, 0);
-	if (!ep_fwnode)
-		return -EINVAL;
-
-	ret = v4l2_fwnode_endpoint_alloc_parse(ep_fwnode, &vep);
-	fwnode_handle_put(ep_fwnode);
-	if (ret) {
-		dev_err(dev, "tx: failed to parse endpoint data\n");
-		return -EINVAL;
-	}
-
-	if (vep.nr_of_link_frequencies != 1) {
-		ret = -EINVAL;
-		goto err_free_vep;
-	}
-
-	priv->tx_link_freq = vep.link_frequencies[0];
-	/* Min 50MHz, Max 1250MHz, 50MHz step */
-	if (priv->tx_link_freq < MHZ(50) || priv->tx_link_freq > MHZ(1250) ||
-	    (u32)priv->tx_link_freq % MHZ(50)) {
-		dev_err(dev, "tx: invalid link frequency\n");
-		ret = -EINVAL;
-		goto err_free_vep;
-	}
-
-	num_data_lanes = vep.bus.mipi_csi2.num_data_lanes;
-	if (num_data_lanes < 1 || num_data_lanes > MAX96714_CSI_NLANES) {
-		dev_err(dev,
-			"tx: invalid number of data lanes must be 1 to 4\n");
-		ret = -EINVAL;
-		goto err_free_vep;
-	}
-
-	priv->mipi_csi2 = vep.bus.mipi_csi2;
-
-err_free_vep:
-	v4l2_fwnode_endpoint_free(&vep);
-
-	return ret;
-}
-
-static int max96714_parse_dt_rxport(struct max96714_priv *priv)
-{
-	static const char *poc_name = "port0-poc";
-	struct max96714_rxport *rxport = &priv->rxport;
-	struct device *dev = &priv->client->dev;
-	struct fwnode_handle *ep_fwnode;
-	int ret;
-
-	ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
-						    MAX96714_PAD_SINK, 0, 0);
-	if (!ep_fwnode)
-		return -ENOENT;
-
-	rxport->source.ep_fwnode = fwnode_graph_get_remote_endpoint(ep_fwnode);
-	fwnode_handle_put(ep_fwnode);
-
-	if (!rxport->source.ep_fwnode) {
-		dev_err(dev, "rx: no remote endpoint\n");
-		return -EINVAL;
-	}
-
-	rxport->poc = devm_regulator_get_optional(dev, poc_name);
-	if (IS_ERR(rxport->poc)) {
-		ret = PTR_ERR(rxport->poc);
-		if (ret == -ENODEV) {
-			rxport->poc = NULL;
-		} else {
-			dev_err(dev, "rx: failed to get POC supply: %d\n", ret);
-			goto err_put_source_ep_fwnode;
-		}
-	}
-
-	return 0;
-
-err_put_source_ep_fwnode:
-	fwnode_handle_put(rxport->source.ep_fwnode);
-	return ret;
-}
-
-static int max96714_parse_dt(struct max96714_priv *priv)
-{
-	int ret;
-
-	ret = max96714_parse_dt_txport(priv);
-	if (ret)
-		return ret;
-
-	ret = max96714_parse_dt_rxport(priv);
-	/*
-	 * The deserializer can create a test pattern even if the
-	 * rx port is not connected to a serializer.
-	 */
-	if (ret && ret == -ENOENT)
-		ret = 0;
-
-	return ret;
-}
-
-static int max96714_enable_core_hw(struct max96714_priv *priv)
-{
-	struct device *dev = &priv->client->dev;
-	u64 val;
-	int ret;
-
-	if (priv->pd_gpio) {
-		/* wait min 2 ms for reset to complete */
-		gpiod_set_value_cansleep(priv->pd_gpio, 1);
-		fsleep(2000);
-		gpiod_set_value_cansleep(priv->pd_gpio, 0);
-		/* wait min 2 ms for power up to finish */
-		fsleep(2000);
-	}
-
-	ret = cci_read(priv->regmap, MAX96714_REG13, &val, NULL);
-	if (ret) {
-		dev_err_probe(dev, ret, "Cannot read first register, abort\n");
-		goto err_pd_gpio;
-	}
-
-	if (val != MAX96714_DEVICE_ID && val != MAX96714F_DEVICE_ID) {
-		dev_err(dev, "Unsupported device id expected %x got %x\n",
-			MAX96714F_DEVICE_ID, (u8)val);
-		ret = -EOPNOTSUPP;
-		goto err_pd_gpio;
-	}
-
-	ret = cci_read(priv->regmap, MAX96714_DEV_REV, &val, NULL);
-	if (ret)
-		goto err_pd_gpio;
-
-	dev_dbg(dev, "Found %x (rev %lx)\n", MAX96714F_DEVICE_ID,
-		(u8)val & MAX96714_DEV_REV_MASK);
-
-	ret = cci_read(priv->regmap, MAX96714_MIPI_TX52, &val, NULL);
-	if (ret)
-		goto err_pd_gpio;
-
-	if (!(val & MAX96714_TUN_EN)) {
-		dev_err(dev, "Only supporting tunnel mode");
-		ret = -EOPNOTSUPP;
-		goto err_pd_gpio;
-	}
-
-	return 0;
-
-err_pd_gpio:
-	gpiod_set_value_cansleep(priv->pd_gpio, 1);
-	return ret;
-}
-
-static void max96714_disable_core_hw(struct max96714_priv *priv)
-{
-	gpiod_set_value_cansleep(priv->pd_gpio, 1);
-}
-
-static int max96714_get_hw_resources(struct max96714_priv *priv)
-{
-	struct device *dev = &priv->client->dev;
-
-	priv->regmap = devm_cci_regmap_init_i2c(priv->client, 16);
-	if (IS_ERR(priv->regmap))
-		return PTR_ERR(priv->regmap);
-
-	priv->pd_gpio =
-		devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_HIGH);
-	if (IS_ERR(priv->pd_gpio))
-		return dev_err_probe(dev, PTR_ERR(priv->pd_gpio),
-				     "Cannot get powerdown GPIO\n");
-	return 0;
-}
-
-static int max96714_probe(struct i2c_client *client)
-{
-	struct device *dev = &client->dev;
-	struct max96714_priv *priv;
-	int ret;
-
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	priv->client = client;
-
-	ret = max96714_get_hw_resources(priv);
-	if (ret)
-		return ret;
-
-	ret = max96714_enable_core_hw(priv);
-	if (ret)
-		return ret;
-
-	ret = max96714_parse_dt(priv);
-	if (ret)
-		goto err_disable_core_hw;
-
-	max96714_init_tx_port(priv);
-
-	ret = max96714_rxport_enable_poc(priv);
-	if (ret)
-		goto err_free_ports;
-
-	ret = max96714_i2c_mux_init(priv);
-	if (ret)
-		goto err_disable_poc;
-
-	ret = max96714_create_subdev(priv);
-	if (ret)
-		goto err_del_mux;
-
-	return 0;
-
-err_del_mux:
-	i2c_mux_del_adapters(priv->mux);
-err_disable_poc:
-	max96714_rxport_disable_poc(priv);
-err_free_ports:
-	fwnode_handle_put(priv->rxport.source.ep_fwnode);
-err_disable_core_hw:
-	max96714_disable_core_hw(priv);
-
-	return ret;
-}
-
-static void max96714_remove(struct i2c_client *client)
-{
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct max96714_priv *priv = sd_to_max96714(sd);
-
-	max96714_destroy_subdev(priv);
-	i2c_mux_del_adapters(priv->mux);
-	max96714_rxport_disable_poc(priv);
-	fwnode_handle_put(priv->rxport.source.ep_fwnode);
-	max96714_disable_core_hw(priv);
-	gpiod_set_value_cansleep(priv->pd_gpio, 1);
-}
-
-static const struct of_device_id max96714_of_ids[] = {
-	{ .compatible = "maxim,max96714f" },
-	{ }
-};
-MODULE_DEVICE_TABLE(of, max96714_of_ids);
-
-static struct i2c_driver max96714_i2c_driver = {
-	.driver	= {
-		.name		= "max96714",
-		.of_match_table	= max96714_of_ids,
-	},
-	.probe		= max96714_probe,
-	.remove		= max96714_remove,
-};
-
-module_i2c_driver(max96714_i2c_driver);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("Maxim Integrated GMSL2 Deserializers Driver");
-MODULE_AUTHOR("Julien Massot <julien.massot@collabora.com>");
-- 
2.49.0


