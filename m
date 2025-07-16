Return-Path: <linux-gpio+bounces-23388-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D7DB07E06
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 21:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F5484E4FA0
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 19:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79BC2E8884;
	Wed, 16 Jul 2025 19:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFlgsA07"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FC22E7BA7;
	Wed, 16 Jul 2025 19:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694340; cv=none; b=UVFzp2aOhVZSn1oR6jXWPG2ZsMKMw/iPRBa3OZY61F0vO+6IkqCYK7XvXia395CcN4FycgezTRB13o3nBjndPzxAvWhFxKgPNNquQMsdjyYpapp2EDPOVWD9rUhGi5XP+GMd6qKoyWp01CO2WJ6FF/b+UoeAEyWqLt8pZvbiCE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694340; c=relaxed/simple;
	bh=EpXkZ0NqK4PAcS20oG1hL/ZSCQDz6nGU/fV8vl5Dv/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J9ivdLlsmFjtwOqYl0rIw/tfnemt8xuSPqUYV8CmmhLCMnj7cc/Nb7ThIh429C1trKgBE17eV8PMvERVhWe/8h0yg2w3DMDDAmFiAhGyWXE5jaEHOF36MeumPsuALIabXOKJAyyEA+3nCrVACdHMw//AlXTLP7qKKB5+Co6s/hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFlgsA07; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60c5b7cae8bso288575a12.1;
        Wed, 16 Jul 2025 12:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694334; x=1753299134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UyyUpFOdqizO7uPykjXufiqqr0hLMcwwCapej8jvSgQ=;
        b=SFlgsA07R5eT25OzVdthzyIx4mNY7dP3jeixn6l2GWciKzWCVQcNmPnB5JuYKdYgQz
         nayiLjEya9wESopiAZd0CRaF1/IUuiv9zX3MvL8UMEdA7jPlSX/9xuUPNum2SHfI3368
         Z1f1vBdf7H+Vs7plD5njTySqKwGhJuVuWMyr0ADJdAZYjWKgZ/0j+zUyGEeal2TPTlod
         PpLhDPL+P9nhyZAU6rfRXsZmGg4giwyvQLmMa4LcDQvYdoUAqOliZqQxdhDu1aWV9c7F
         eS+zDImnivFtl2Q6VP3FMxRqsv4XKAYhqtnWkppLr9/R3tTGbyUdxf3oqzxeq+wuf+l/
         zpzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694334; x=1753299134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UyyUpFOdqizO7uPykjXufiqqr0hLMcwwCapej8jvSgQ=;
        b=CnQd36fpYyHGFpEkTOfZEw2t8gY7ZCNbXbZKHjc7/b73AdFFFnJR4UXDJjFdRW0n6M
         PA54YMCKMN8t49qNzCDhEYMbsKuJltv3NU0lG29pRC/wtpCx3NCbrw+QTGI6ODj/jrtv
         aoooK+omH8eJtUUG517AhRKGIhH+kFeNrtoeIq11lyQLG4TAedtbrOgFo3ys8LyY3vFb
         x89C56A1hXzP/1VXY3Nq0PE17IiAiGv4ZLW4nZwiUtFk2Kj+aaTkf2ZfeV/J8T90+Cng
         PbZxhC1t1WXLECAV0CpJDNlkFlQWxsz0msknvzQEhpqXJNbeT32br/FeTHqqk9sEuXjF
         cZlA==
X-Forwarded-Encrypted: i=1; AJvYcCVo28UUyGB0JzqXeOz+ObXeKcTlw8sTlNAqQm2A6x+oy3ojysnAIkh84OQ1tHCdZK4DPcPGeuy0iZCdqgo3@vger.kernel.org, AJvYcCWSa46rQF0GVhG3izoC1PpmLOe6VgMwUaROeNwXy6Ll3orTtTQqQwEtV5/gcBWPpoKtOaBiPbREhvB3@vger.kernel.org, AJvYcCWkvEuuq3F1xkOcvB40bGKWPkSHOYY1NNPueC3rundbnvUb25Mez6oypKNcCZC9oLR+6mC+x+Vw0HHKWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjZH67CCiGPq+GDCDmxpgFou0fKn9x17hT8BsmN5AEeTqpZGlE
	rOlslyjXek6j9FLHpNS5gqbJTCx1JG3b1l2QGl2R17K3wwuh4x2AK7NW
X-Gm-Gg: ASbGncvDS0RzQTzrEuZKFQj54fGpQK6bmlSxidTd71ZFIND9z9cTs8ISaqzNaYOB9Xo
	v4YFCbTTm/kTmSQaga6TGWBh2wy/+XvxMG/hEp/UP6aPEpcNSf28bXkah8d5FYIRGlxPtVFaEOj
	tPVNATHpBVt0jbu8bzuRivmfFwJcMqgpbMcU1gy9EQ/4/HoCTxS8VXD6w7FRc287Uo3RTb2snNx
	xEPlyn4S8RxMsA+1xldskqr/UbZdYK8un8VDxhaUk+aRPsPbazwMfxOSL8zzVnlGOCbk5Hs2F6h
	vPY02up0RbHo4pbQsBHh2Wko8+vxVBZyjDrhC8zpgigoPvmZ5IDGTwNdQovHGc+qrRWFksJLgmg
	x+HJSQynZ8fmCFe+B4y2f/XqMTuv81JTZmbM=
X-Google-Smtp-Source: AGHT+IH3SGAKlOOJGE/iBQVBfncJfccxFxM9fKChJG3UdNOgErpmtzrcUD5CpyEfM47WTG4hsYxXrg==
X-Received: by 2002:a17:907:72d1:b0:ae9:c849:fae0 with SMTP id a640c23a62f3a-ae9ce1e4d8amr384962166b.58.1752694333903;
        Wed, 16 Jul 2025 12:32:13 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:32:13 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v6 23/24] media: i2c: remove MAX96717 driver
Date: Wed, 16 Jul 2025 22:31:08 +0300
Message-ID: <20250716193111.942217-24-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous MAX96717 driver has been removed and its functionality has
been moved to a MAX96717 driver which makes use of the Maxim GMSL2/3
serializer framework.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 MAINTAINERS                  |    1 -
 drivers/media/i2c/Kconfig    |   17 -
 drivers/media/i2c/Makefile   |    1 -
 drivers/media/i2c/max96717.c | 1102 ----------------------------------
 4 files changed, 1121 deletions(-)
 delete mode 100644 drivers/media/i2c/max96717.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ff0c7fe22ce6e..c2e7c677f4652 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14766,7 +14766,6 @@ M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
-F:	drivers/media/i2c/max96717.c
 
 MAX9860 MONO AUDIO VOICE CODEC DRIVER
 M:	Peter Rosin <peda@axentia.se>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 801a712a31808..27fb7524f39bf 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1669,23 +1669,6 @@ config VIDEO_MAX96714
 	  To compile this driver as a module, choose M here: the
 	  module will be called max96714.
 
-config VIDEO_MAX96717
-	tristate "Maxim MAX96717 GMSL2 Serializer support"
-	depends on I2C && VIDEO_DEV && COMMON_CLK
-	select I2C_MUX
-	select MEDIA_CONTROLLER
-	select GPIOLIB
-	select V4L2_CCI_I2C
-	select V4L2_FWNODE
-	select VIDEO_V4L2_SUBDEV_API
-	help
-	  Device driver for the Maxim MAX96717 GMSL2 Serializer.
-	  MAX96717 serializers convert video on a MIPI CSI-2
-	  input to a GMSL2 output.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called max96717.
-
 source "drivers/media/i2c/maxim-serdes/Kconfig"
 
 endmenu
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 25a0093d40ecf..29ac7ea2bfa0b 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -69,7 +69,6 @@ obj-$(CONFIG_VIDEO_M52790) += m52790.o
 obj-$(CONFIG_VIDEO_MAX9271_LIB) += max9271.o
 obj-$(CONFIG_VIDEO_MAX9286) += max9286.o
 obj-$(CONFIG_VIDEO_MAX96714) += max96714.o
-obj-$(CONFIG_VIDEO_MAX96717) += max96717.o
 obj-$(CONFIG_VIDEO_MAXIM_SERDES) += maxim-serdes/
 obj-$(CONFIG_VIDEO_ML86V7667) += ml86v7667.o
 obj-$(CONFIG_VIDEO_MSP3400) += msp3400.o
diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
deleted file mode 100644
index 015e42fbe2462..0000000000000
--- a/drivers/media/i2c/max96717.c
+++ /dev/null
@@ -1,1102 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Maxim GMSL2 Serializer Driver
- *
- * Copyright (C) 2024 Collabora Ltd.
- */
-
-#include <linux/bitfield.h>
-#include <linux/clk.h>
-#include <linux/clk-provider.h>
-#include <linux/delay.h>
-#include <linux/gpio/driver.h>
-#include <linux/i2c-mux.h>
-#include <linux/i2c.h>
-#include <linux/property.h>
-#include <linux/regmap.h>
-
-#include <media/v4l2-cci.h>
-#include <media/v4l2-ctrls.h>
-#include <media/v4l2-fwnode.h>
-#include <media/v4l2-subdev.h>
-
-#define MAX96717_DEVICE_ID  0xbf
-#define MAX96717F_DEVICE_ID 0xc8
-#define MAX96717_PORTS      2
-#define MAX96717_PAD_SINK   0
-#define MAX96717_PAD_SOURCE 1
-#define MAX96717_CSI_NLANES 4
-
-#define MAX96717_DEFAULT_CLKOUT_RATE	24000000UL
-
-/* DEV */
-#define MAX96717_REG3    CCI_REG8(0x3)
-#define MAX96717_RCLKSEL GENMASK(1, 0)
-#define RCLKSEL_REF_PLL  CCI_REG8(0x3)
-#define MAX96717_REG6    CCI_REG8(0x6)
-#define RCLKEN           BIT(5)
-#define MAX96717_DEV_ID  CCI_REG8(0xd)
-#define MAX96717_DEV_REV CCI_REG8(0xe)
-#define MAX96717_DEV_REV_MASK GENMASK(3, 0)
-
-/* VID_TX Z */
-#define MAX96717_VIDEO_TX0 CCI_REG8(0x110)
-#define MAX96717_VIDEO_AUTO_BPP BIT(3)
-#define MAX96717_VIDEO_TX2 CCI_REG8(0x112)
-#define MAX96717_VIDEO_PCLKDET BIT(7)
-
-/* VTX_Z */
-#define MAX96717_VTX0                  CCI_REG8(0x24e)
-#define MAX96717_VTX1                  CCI_REG8(0x24f)
-#define MAX96717_PATTERN_CLK_FREQ      GENMASK(3, 1)
-#define MAX96717_VTX_VS_DLY            CCI_REG24(0x250)
-#define MAX96717_VTX_VS_HIGH           CCI_REG24(0x253)
-#define MAX96717_VTX_VS_LOW            CCI_REG24(0x256)
-#define MAX96717_VTX_V2H               CCI_REG24(0x259)
-#define MAX96717_VTX_HS_HIGH           CCI_REG16(0x25c)
-#define MAX96717_VTX_HS_LOW            CCI_REG16(0x25e)
-#define MAX96717_VTX_HS_CNT            CCI_REG16(0x260)
-#define MAX96717_VTX_V2D               CCI_REG24(0x262)
-#define MAX96717_VTX_DE_HIGH           CCI_REG16(0x265)
-#define MAX96717_VTX_DE_LOW            CCI_REG16(0x267)
-#define MAX96717_VTX_DE_CNT            CCI_REG16(0x269)
-#define MAX96717_VTX29                 CCI_REG8(0x26b)
-#define MAX96717_VTX_MODE              GENMASK(1, 0)
-#define MAX96717_VTX_GRAD_INC          CCI_REG8(0x26c)
-#define MAX96717_VTX_CHKB_COLOR_A      CCI_REG24(0x26d)
-#define MAX96717_VTX_CHKB_COLOR_B      CCI_REG24(0x270)
-#define MAX96717_VTX_CHKB_RPT_CNT_A    CCI_REG8(0x273)
-#define MAX96717_VTX_CHKB_RPT_CNT_B    CCI_REG8(0x274)
-#define MAX96717_VTX_CHKB_ALT          CCI_REG8(0x275)
-
-/* GPIO */
-#define MAX96717_NUM_GPIO         11
-#define MAX96717_GPIO_REG_A(gpio) CCI_REG8(0x2be + (gpio) * 3)
-#define MAX96717_GPIO_OUT         BIT(4)
-#define MAX96717_GPIO_IN          BIT(3)
-#define MAX96717_GPIO_RX_EN       BIT(2)
-#define MAX96717_GPIO_TX_EN       BIT(1)
-#define MAX96717_GPIO_OUT_DIS     BIT(0)
-
-/* FRONTTOP */
-/* MAX96717 only have CSI port 'B' */
-#define MAX96717_FRONTOP0     CCI_REG8(0x308)
-#define MAX96717_START_PORT_B BIT(5)
-
-/* MIPI_RX */
-#define MAX96717_MIPI_RX1       CCI_REG8(0x331)
-#define MAX96717_MIPI_LANES_CNT GENMASK(5, 4)
-#define MAX96717_MIPI_RX2       CCI_REG8(0x332) /* phy1 Lanes map */
-#define MAX96717_PHY2_LANES_MAP GENMASK(7, 4)
-#define MAX96717_MIPI_RX3       CCI_REG8(0x333) /* phy2 Lanes map */
-#define MAX96717_PHY1_LANES_MAP GENMASK(3, 0)
-#define MAX96717_MIPI_RX4       CCI_REG8(0x334) /* phy1 lane polarities */
-#define MAX96717_PHY1_LANES_POL GENMASK(6, 4)
-#define MAX96717_MIPI_RX5       CCI_REG8(0x335) /* phy2 lane polarities */
-#define MAX96717_PHY2_LANES_POL GENMASK(2, 0)
-
-/* MIPI_RX_EXT */
-#define MAX96717_MIPI_RX_EXT11 CCI_REG8(0x383)
-#define MAX96717_TUN_MODE      BIT(7)
-
-/* REF_VTG */
-#define REF_VTG0                CCI_REG8(0x3f0)
-#define REFGEN_PREDEF_EN        BIT(6)
-#define REFGEN_PREDEF_FREQ_MASK GENMASK(5, 4)
-#define REFGEN_PREDEF_FREQ_ALT  BIT(3)
-#define REFGEN_RST              BIT(1)
-#define REFGEN_EN               BIT(0)
-
-/* MISC */
-#define PIO_SLEW_1 CCI_REG8(0x570)
-
-enum max96717_vpg_mode {
-	MAX96717_VPG_DISABLED = 0,
-	MAX96717_VPG_CHECKERBOARD = 1,
-	MAX96717_VPG_GRADIENT = 2,
-};
-
-struct max96717_priv {
-	struct i2c_client		  *client;
-	struct regmap			  *regmap;
-	struct i2c_mux_core		  *mux;
-	struct v4l2_mbus_config_mipi_csi2 mipi_csi2;
-	struct v4l2_subdev                sd;
-	struct media_pad                  pads[MAX96717_PORTS];
-	struct v4l2_ctrl_handler          ctrl_handler;
-	struct v4l2_async_notifier        notifier;
-	struct v4l2_subdev                *source_sd;
-	u16                               source_sd_pad;
-	u64			          enabled_source_streams;
-	u8                                pll_predef_index;
-	struct clk_hw                     clk_hw;
-	struct gpio_chip                  gpio_chip;
-	enum max96717_vpg_mode            pattern;
-};
-
-static inline struct max96717_priv *sd_to_max96717(struct v4l2_subdev *sd)
-{
-	return container_of(sd, struct max96717_priv, sd);
-}
-
-static inline struct max96717_priv *clk_hw_to_max96717(struct clk_hw *hw)
-{
-	return container_of(hw, struct max96717_priv, clk_hw);
-}
-
-static int max96717_i2c_mux_select(struct i2c_mux_core *mux, u32 chan)
-{
-	return 0;
-}
-
-static int max96717_i2c_mux_init(struct max96717_priv *priv)
-{
-	priv->mux = i2c_mux_alloc(priv->client->adapter, &priv->client->dev,
-				  1, 0, I2C_MUX_LOCKED | I2C_MUX_GATE,
-				  max96717_i2c_mux_select, NULL);
-	if (!priv->mux)
-		return -ENOMEM;
-
-	return i2c_mux_add_adapter(priv->mux, 0, 0);
-}
-
-static inline int max96717_start_csi(struct max96717_priv *priv, bool start)
-{
-	return cci_update_bits(priv->regmap, MAX96717_FRONTOP0,
-			       MAX96717_START_PORT_B,
-			       start ? MAX96717_START_PORT_B : 0, NULL);
-}
-
-static int max96717_apply_patgen_timing(struct max96717_priv *priv,
-					struct v4l2_subdev_state *state)
-{
-	struct v4l2_mbus_framefmt *fmt =
-		v4l2_subdev_state_get_format(state, MAX96717_PAD_SOURCE);
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
-	cci_update_bits(priv->regmap, MAX96717_VTX1,
-			MAX96717_PATTERN_CLK_FREQ, 0xa, &ret);
-
-	dev_info(&priv->client->dev, "height: %d width: %d\n", fmt->height,
-		 fmt->width);
-
-	cci_write(priv->regmap, MAX96717_VTX_VS_DLY, 0, &ret);
-	cci_write(priv->regmap, MAX96717_VTX_VS_HIGH, v_sw * h_tot, &ret);
-	cci_write(priv->regmap, MAX96717_VTX_VS_LOW,
-		  (v_active + v_fp + v_bp) * h_tot, &ret);
-	cci_write(priv->regmap, MAX96717_VTX_HS_HIGH, h_sw, &ret);
-	cci_write(priv->regmap, MAX96717_VTX_HS_LOW, h_active + h_fp + h_bp,
-		  &ret);
-	cci_write(priv->regmap, MAX96717_VTX_V2D,
-		  h_tot * (v_sw + v_bp) + (h_sw + h_bp), &ret);
-	cci_write(priv->regmap, MAX96717_VTX_HS_CNT, v_tot, &ret);
-	cci_write(priv->regmap, MAX96717_VTX_DE_HIGH, h_active, &ret);
-	cci_write(priv->regmap, MAX96717_VTX_DE_LOW, h_fp + h_sw + h_bp,
-		  &ret);
-	cci_write(priv->regmap, MAX96717_VTX_DE_CNT, v_active, &ret);
-	/* B G R */
-	cci_write(priv->regmap, MAX96717_VTX_CHKB_COLOR_A, 0xfecc00, &ret);
-	/* B G R */
-	cci_write(priv->regmap, MAX96717_VTX_CHKB_COLOR_B, 0x006aa7, &ret);
-	cci_write(priv->regmap, MAX96717_VTX_CHKB_RPT_CNT_A, 0x3c, &ret);
-	cci_write(priv->regmap, MAX96717_VTX_CHKB_RPT_CNT_B, 0x3c, &ret);
-	cci_write(priv->regmap, MAX96717_VTX_CHKB_ALT, 0x3c, &ret);
-	cci_write(priv->regmap, MAX96717_VTX_GRAD_INC, 0x10, &ret);
-
-	return ret;
-}
-
-static int max96717_apply_patgen(struct max96717_priv *priv,
-				 struct v4l2_subdev_state *state)
-{
-	unsigned int val;
-	int ret = 0;
-
-	if (priv->pattern)
-		ret = max96717_apply_patgen_timing(priv, state);
-
-	cci_write(priv->regmap, MAX96717_VTX0, priv->pattern ? 0xfb : 0,
-		  &ret);
-
-	val = FIELD_PREP(MAX96717_VTX_MODE, priv->pattern);
-	cci_update_bits(priv->regmap, MAX96717_VTX29, MAX96717_VTX_MODE,
-			val, &ret);
-	return ret;
-}
-
-static int max96717_s_ctrl(struct v4l2_ctrl *ctrl)
-{
-	struct max96717_priv *priv =
-		container_of(ctrl->handler, struct max96717_priv, ctrl_handler);
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
-	/* Use bpp from bpp register */
-	ret = cci_update_bits(priv->regmap, MAX96717_VIDEO_TX0,
-			      MAX96717_VIDEO_AUTO_BPP,
-			      priv->pattern ? 0 : MAX96717_VIDEO_AUTO_BPP,
-			      NULL);
-
-	/*
-	 * Pattern generator doesn't work with tunnel mode.
-	 * Needs RGB color format and deserializer tunnel mode must be disabled.
-	 */
-	return cci_update_bits(priv->regmap, MAX96717_MIPI_RX_EXT11,
-			       MAX96717_TUN_MODE,
-			       priv->pattern ? 0 : MAX96717_TUN_MODE, &ret);
-}
-
-static const char * const max96717_test_pattern[] = {
-	"Disabled",
-	"Checkerboard",
-	"Gradient"
-};
-
-static const struct v4l2_ctrl_ops max96717_ctrl_ops = {
-	.s_ctrl = max96717_s_ctrl,
-};
-
-static int max96717_gpiochip_get(struct gpio_chip *gpiochip,
-				 unsigned int offset)
-{
-	struct max96717_priv *priv = gpiochip_get_data(gpiochip);
-	u64 val;
-	int ret;
-
-	ret = cci_read(priv->regmap, MAX96717_GPIO_REG_A(offset),
-		       &val, NULL);
-	if (ret)
-		return ret;
-
-	if (val & MAX96717_GPIO_OUT_DIS)
-		return !!(val & MAX96717_GPIO_IN);
-	else
-		return !!(val & MAX96717_GPIO_OUT);
-}
-
-static int max96717_gpiochip_set(struct gpio_chip *gpiochip,
-				 unsigned int offset, int value)
-{
-	struct max96717_priv *priv = gpiochip_get_data(gpiochip);
-
-	return cci_update_bits(priv->regmap, MAX96717_GPIO_REG_A(offset),
-			       MAX96717_GPIO_OUT, MAX96717_GPIO_OUT, NULL);
-}
-
-static int max96717_gpio_get_direction(struct gpio_chip *gpiochip,
-				       unsigned int offset)
-{
-	struct max96717_priv *priv = gpiochip_get_data(gpiochip);
-	u64 val;
-	int ret;
-
-	ret = cci_read(priv->regmap, MAX96717_GPIO_REG_A(offset), &val, NULL);
-	if (ret < 0)
-		return ret;
-
-	return !!(val & MAX96717_GPIO_OUT_DIS);
-}
-
-static int max96717_gpio_direction_out(struct gpio_chip *gpiochip,
-				       unsigned int offset, int value)
-{
-	struct max96717_priv *priv = gpiochip_get_data(gpiochip);
-
-	return cci_update_bits(priv->regmap, MAX96717_GPIO_REG_A(offset),
-			       MAX96717_GPIO_OUT_DIS | MAX96717_GPIO_OUT,
-			       value ? MAX96717_GPIO_OUT : 0, NULL);
-}
-
-static int max96717_gpio_direction_in(struct gpio_chip *gpiochip,
-				      unsigned int offset)
-{
-	struct max96717_priv *priv = gpiochip_get_data(gpiochip);
-
-	return cci_update_bits(priv->regmap, MAX96717_GPIO_REG_A(offset),
-			       MAX96717_GPIO_OUT_DIS, MAX96717_GPIO_OUT_DIS,
-			       NULL);
-}
-
-static int max96717_gpiochip_probe(struct max96717_priv *priv)
-{
-	struct device *dev = &priv->client->dev;
-	struct gpio_chip *gc = &priv->gpio_chip;
-	int i, ret = 0;
-
-	gc->label = dev_name(dev);
-	gc->parent = dev;
-	gc->owner = THIS_MODULE;
-	gc->ngpio = MAX96717_NUM_GPIO;
-	gc->base = -1;
-	gc->can_sleep = true;
-	gc->get_direction = max96717_gpio_get_direction;
-	gc->direction_input = max96717_gpio_direction_in;
-	gc->direction_output = max96717_gpio_direction_out;
-	gc->set_rv = max96717_gpiochip_set;
-	gc->get = max96717_gpiochip_get;
-
-	/* Disable GPIO forwarding */
-	for (i = 0; i < gc->ngpio; i++)
-		cci_update_bits(priv->regmap, MAX96717_GPIO_REG_A(i),
-				MAX96717_GPIO_RX_EN | MAX96717_GPIO_TX_EN,
-				0, &ret);
-
-	if (ret)
-		return ret;
-
-	ret = devm_gpiochip_add_data(dev, gc, priv);
-	if (ret) {
-		dev_err(dev, "Unable to create gpio_chip\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-static int _max96717_set_routing(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_state *state,
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
-	ret = v4l2_subdev_routing_validate(sd, routing,
-					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
-	if (ret)
-		return ret;
-
-	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-static int max96717_set_routing(struct v4l2_subdev *sd,
-				struct v4l2_subdev_state *state,
-				enum v4l2_subdev_format_whence which,
-				struct v4l2_subdev_krouting *routing)
-{
-	struct max96717_priv *priv = sd_to_max96717(sd);
-
-	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && priv->enabled_source_streams)
-		return -EBUSY;
-
-	return _max96717_set_routing(sd, state, routing);
-}
-
-static int max96717_set_fmt(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_state *state,
-			    struct v4l2_subdev_format *format)
-{
-	struct max96717_priv *priv = sd_to_max96717(sd);
-	struct v4l2_mbus_framefmt *fmt;
-	u64 stream_source_mask;
-
-	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
-	    priv->enabled_source_streams)
-		return -EBUSY;
-
-	/* No transcoding, source and sink formats must match. */
-	if (format->pad == MAX96717_PAD_SOURCE)
-		return v4l2_subdev_get_fmt(sd, state, format);
-
-	/* Set sink format */
-	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
-	if (!fmt)
-		return -EINVAL;
-
-	*fmt = format->format;
-
-	/* Propagate to source format */
-	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
-							   format->stream);
-	if (!fmt)
-		return -EINVAL;
-	*fmt = format->format;
-
-	stream_source_mask = BIT(format->stream);
-
-	return v4l2_subdev_state_xlate_streams(state, MAX96717_PAD_SOURCE,
-					       MAX96717_PAD_SINK,
-					       &stream_source_mask);
-}
-
-static int max96717_init_state(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_state *state)
-{
-	struct v4l2_subdev_route routes[] = {
-		{
-			.sink_pad = MAX96717_PAD_SINK,
-			.sink_stream = 0,
-			.source_pad = MAX96717_PAD_SOURCE,
-			.source_stream = 0,
-			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
-		},
-	};
-	struct v4l2_subdev_krouting routing = {
-		.num_routes = ARRAY_SIZE(routes),
-		.routes = routes,
-	};
-
-	return _max96717_set_routing(sd, state, &routing);
-}
-
-static bool max96717_pipe_pclkdet(struct max96717_priv *priv)
-{
-	u64 val = 0;
-
-	cci_read(priv->regmap, MAX96717_VIDEO_TX2, &val, NULL);
-
-	return val & MAX96717_VIDEO_PCLKDET;
-}
-
-static int max96717_log_status(struct v4l2_subdev *sd)
-{
-	struct max96717_priv *priv = sd_to_max96717(sd);
-	struct device *dev = &priv->client->dev;
-
-	dev_info(dev, "Serializer: max96717\n");
-	dev_info(dev, "Pipe: pclkdet:%d\n", max96717_pipe_pclkdet(priv));
-
-	return 0;
-}
-
-static int max96717_enable_streams(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_state *state, u32 pad,
-				   u64 streams_mask)
-{
-	struct max96717_priv *priv = sd_to_max96717(sd);
-	u64 sink_streams;
-	int ret;
-
-	if (!priv->enabled_source_streams)
-		max96717_start_csi(priv, true);
-
-	ret = max96717_apply_patgen(priv, state);
-	if (ret)
-		goto stop_csi;
-
-	if (!priv->pattern) {
-		sink_streams =
-			v4l2_subdev_state_xlate_streams(state,
-							MAX96717_PAD_SOURCE,
-							MAX96717_PAD_SINK,
-							&streams_mask);
-
-		ret = v4l2_subdev_enable_streams(priv->source_sd,
-						 priv->source_sd_pad,
-						 sink_streams);
-		if (ret)
-			goto stop_csi;
-	}
-
-	priv->enabled_source_streams |= streams_mask;
-
-	return 0;
-
-stop_csi:
-	if (!priv->enabled_source_streams)
-		max96717_start_csi(priv, false);
-
-	return ret;
-}
-
-static int max96717_disable_streams(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_state *state, u32 pad,
-				    u64 streams_mask)
-{
-	struct max96717_priv *priv = sd_to_max96717(sd);
-	u64 sink_streams;
-
-	/*
-	 * Stop the CSI receiver first then the source,
-	 * otherwise the device may become unresponsive
-	 * while holding the I2C bus low.
-	 */
-	priv->enabled_source_streams &= ~streams_mask;
-	if (!priv->enabled_source_streams)
-		max96717_start_csi(priv, false);
-
-	if (!priv->pattern) {
-		int ret;
-
-		sink_streams =
-			v4l2_subdev_state_xlate_streams(state,
-							MAX96717_PAD_SOURCE,
-							MAX96717_PAD_SINK,
-							&streams_mask);
-
-		ret = v4l2_subdev_disable_streams(priv->source_sd,
-						  priv->source_sd_pad,
-						  sink_streams);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
-static const struct v4l2_subdev_pad_ops max96717_pad_ops = {
-	.enable_streams = max96717_enable_streams,
-	.disable_streams = max96717_disable_streams,
-	.set_routing = max96717_set_routing,
-	.get_fmt = v4l2_subdev_get_fmt,
-	.set_fmt = max96717_set_fmt,
-};
-
-static const struct v4l2_subdev_core_ops max96717_subdev_core_ops = {
-	.log_status = max96717_log_status,
-};
-
-static const struct v4l2_subdev_internal_ops max96717_internal_ops = {
-	.init_state = max96717_init_state,
-};
-
-static const struct v4l2_subdev_ops max96717_subdev_ops = {
-	.core = &max96717_subdev_core_ops,
-	.pad = &max96717_pad_ops,
-};
-
-static const struct media_entity_operations max96717_entity_ops = {
-	.link_validate = v4l2_subdev_link_validate,
-};
-
-static int max96717_notify_bound(struct v4l2_async_notifier *notifier,
-				 struct v4l2_subdev *source_subdev,
-				 struct v4l2_async_connection *asd)
-{
-	struct max96717_priv *priv = sd_to_max96717(notifier->sd);
-	struct device *dev = &priv->client->dev;
-	int ret;
-
-	ret = media_entity_get_fwnode_pad(&source_subdev->entity,
-					  source_subdev->fwnode,
-					  MEDIA_PAD_FL_SOURCE);
-	if (ret < 0) {
-		dev_err(dev, "Failed to find pad for %s\n",
-			source_subdev->name);
-		return ret;
-	}
-
-	priv->source_sd = source_subdev;
-	priv->source_sd_pad = ret;
-
-	ret = media_create_pad_link(&source_subdev->entity, priv->source_sd_pad,
-				    &priv->sd.entity, 0,
-				    MEDIA_LNK_FL_ENABLED |
-				    MEDIA_LNK_FL_IMMUTABLE);
-	if (ret) {
-		dev_err(dev, "Unable to link %s:%u -> %s:0\n",
-			source_subdev->name, priv->source_sd_pad,
-			priv->sd.name);
-		return ret;
-	}
-
-	return 0;
-}
-
-static const struct v4l2_async_notifier_operations max96717_notify_ops = {
-	.bound = max96717_notify_bound,
-};
-
-static int max96717_v4l2_notifier_register(struct max96717_priv *priv)
-{
-	struct device *dev = &priv->client->dev;
-	struct v4l2_async_connection *asd;
-	struct fwnode_handle *ep_fwnode;
-	int ret;
-
-	ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
-						    MAX96717_PAD_SINK, 0, 0);
-	if (!ep_fwnode) {
-		dev_err(dev, "No graph endpoint\n");
-		return -ENODEV;
-	}
-
-	v4l2_async_subdev_nf_init(&priv->notifier, &priv->sd);
-
-	asd = v4l2_async_nf_add_fwnode_remote(&priv->notifier, ep_fwnode,
-					      struct v4l2_async_connection);
-
-	fwnode_handle_put(ep_fwnode);
-
-	if (IS_ERR(asd)) {
-		dev_err(dev, "Failed to add subdev: %ld", PTR_ERR(asd));
-		v4l2_async_nf_cleanup(&priv->notifier);
-		return PTR_ERR(asd);
-	}
-
-	priv->notifier.ops = &max96717_notify_ops;
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
-static int max96717_subdev_init(struct max96717_priv *priv)
-{
-	struct device *dev = &priv->client->dev;
-	int ret;
-
-	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max96717_subdev_ops);
-	priv->sd.internal_ops = &max96717_internal_ops;
-
-	v4l2_ctrl_handler_init(&priv->ctrl_handler, 1);
-	priv->sd.ctrl_handler = &priv->ctrl_handler;
-
-	v4l2_ctrl_new_std_menu_items(&priv->ctrl_handler,
-				     &max96717_ctrl_ops,
-				     V4L2_CID_TEST_PATTERN,
-				     ARRAY_SIZE(max96717_test_pattern) - 1,
-				     0, 0, max96717_test_pattern);
-	if (priv->ctrl_handler.error) {
-		ret = priv->ctrl_handler.error;
-		goto err_free_ctrl;
-	}
-
-	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
-	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
-	priv->sd.entity.ops = &max96717_entity_ops;
-
-	priv->pads[MAX96717_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
-	priv->pads[MAX96717_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
-
-	ret = media_entity_pads_init(&priv->sd.entity, 2, priv->pads);
-	if (ret) {
-		dev_err_probe(dev, ret, "Failed to init pads\n");
-		goto err_free_ctrl;
-	}
-
-	ret = v4l2_subdev_init_finalize(&priv->sd);
-	if (ret) {
-		dev_err_probe(dev, ret,
-			      "v4l2 subdev init finalized failed\n");
-		goto err_entity_cleanup;
-	}
-	ret = max96717_v4l2_notifier_register(priv);
-	if (ret) {
-		dev_err_probe(dev, ret,
-			      "v4l2 subdev notifier register failed\n");
-		goto err_free_state;
-	}
-
-	ret = v4l2_async_register_subdev(&priv->sd);
-	if (ret) {
-		dev_err_probe(dev, ret, "v4l2_async_register_subdev error\n");
-		goto err_unreg_notif;
-	}
-
-	return 0;
-
-err_unreg_notif:
-	v4l2_async_nf_unregister(&priv->notifier);
-	v4l2_async_nf_cleanup(&priv->notifier);
-err_free_state:
-	v4l2_subdev_cleanup(&priv->sd);
-err_entity_cleanup:
-	media_entity_cleanup(&priv->sd.entity);
-err_free_ctrl:
-	v4l2_ctrl_handler_free(&priv->ctrl_handler);
-
-	return ret;
-}
-
-static void max96717_subdev_uninit(struct max96717_priv *priv)
-{
-	v4l2_async_unregister_subdev(&priv->sd);
-	v4l2_async_nf_unregister(&priv->notifier);
-	v4l2_async_nf_cleanup(&priv->notifier);
-	v4l2_subdev_cleanup(&priv->sd);
-	media_entity_cleanup(&priv->sd.entity);
-	v4l2_ctrl_handler_free(&priv->ctrl_handler);
-}
-
-struct max96717_pll_predef_freq {
-	unsigned long freq;
-	bool is_alt;
-	u8 val;
-};
-
-static const struct max96717_pll_predef_freq max96717_predef_freqs[] = {
-	{ 13500000, true,  0 }, { 19200000, false, 0 },
-	{ 24000000, true,  1 }, { 27000000, false, 1 },
-	{ 37125000, false, 2 }, { 74250000, false, 3 },
-};
-
-static unsigned long
-max96717_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
-{
-	struct max96717_priv *priv = clk_hw_to_max96717(hw);
-
-	return max96717_predef_freqs[priv->pll_predef_index].freq;
-}
-
-static unsigned int max96717_clk_find_best_index(struct max96717_priv *priv,
-						 unsigned long rate)
-{
-	unsigned int i, idx = 0;
-	unsigned long diff_new, diff_old = U32_MAX;
-
-	for (i = 0; i < ARRAY_SIZE(max96717_predef_freqs); i++) {
-		diff_new = abs(rate - max96717_predef_freqs[i].freq);
-		if (diff_new < diff_old) {
-			diff_old = diff_new;
-			idx = i;
-		}
-	}
-
-	return idx;
-}
-
-static long max96717_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
-{
-	struct max96717_priv *priv = clk_hw_to_max96717(hw);
-	struct device *dev = &priv->client->dev;
-	unsigned int idx;
-
-	idx = max96717_clk_find_best_index(priv, rate);
-
-	if (rate != max96717_predef_freqs[idx].freq) {
-		dev_warn(dev, "Request CLK freq:%lu, found CLK freq:%lu\n",
-			 rate, max96717_predef_freqs[idx].freq);
-	}
-
-	return max96717_predef_freqs[idx].freq;
-}
-
-static int max96717_clk_set_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long parent_rate)
-{
-	struct max96717_priv *priv = clk_hw_to_max96717(hw);
-	unsigned int val, idx;
-	int ret = 0;
-
-	idx = max96717_clk_find_best_index(priv, rate);
-
-	val = FIELD_PREP(REFGEN_PREDEF_FREQ_MASK,
-			 max96717_predef_freqs[idx].val);
-
-	if (max96717_predef_freqs[idx].is_alt)
-		val |= REFGEN_PREDEF_FREQ_ALT;
-
-	val |= REFGEN_RST | REFGEN_PREDEF_EN;
-
-	cci_write(priv->regmap, REF_VTG0, val, &ret);
-	cci_update_bits(priv->regmap, REF_VTG0, REFGEN_RST | REFGEN_EN,
-			REFGEN_EN, &ret);
-	if (ret)
-		return ret;
-
-	priv->pll_predef_index = idx;
-
-	return 0;
-}
-
-static int max96717_clk_prepare(struct clk_hw *hw)
-{
-	struct max96717_priv *priv = clk_hw_to_max96717(hw);
-
-	return cci_update_bits(priv->regmap, MAX96717_REG6, RCLKEN,
-			       RCLKEN, NULL);
-}
-
-static void max96717_clk_unprepare(struct clk_hw *hw)
-{
-	struct max96717_priv *priv = clk_hw_to_max96717(hw);
-
-	cci_update_bits(priv->regmap, MAX96717_REG6, RCLKEN, 0, NULL);
-}
-
-static const struct clk_ops max96717_clk_ops = {
-	.prepare     = max96717_clk_prepare,
-	.unprepare   = max96717_clk_unprepare,
-	.set_rate    = max96717_clk_set_rate,
-	.recalc_rate = max96717_clk_recalc_rate,
-	.round_rate  = max96717_clk_round_rate,
-};
-
-static int max96717_register_clkout(struct max96717_priv *priv)
-{
-	struct device *dev = &priv->client->dev;
-	struct clk_init_data init = { .ops = &max96717_clk_ops };
-	int ret;
-
-	init.name = kasprintf(GFP_KERNEL, "max96717.%s.clk_out", dev_name(dev));
-	if (!init.name)
-		return -ENOMEM;
-
-	/* RCLKSEL Reference PLL output */
-	ret = cci_update_bits(priv->regmap, MAX96717_REG3, MAX96717_RCLKSEL,
-			      MAX96717_RCLKSEL, NULL);
-	/* MFP4 fastest slew rate */
-	cci_update_bits(priv->regmap, PIO_SLEW_1, BIT(5) | BIT(4), 0, &ret);
-	if (ret)
-		goto free_init_name;
-
-	priv->clk_hw.init = &init;
-
-	/* Initialize to 24 MHz */
-	ret = max96717_clk_set_rate(&priv->clk_hw,
-				    MAX96717_DEFAULT_CLKOUT_RATE, 0);
-	if (ret < 0)
-		goto free_init_name;
-
-	ret = devm_clk_hw_register(dev, &priv->clk_hw);
-	kfree(init.name);
-	if (ret)
-		return dev_err_probe(dev, ret, "Cannot register clock HW\n");
-
-	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
-					  &priv->clk_hw);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Cannot add OF clock provider\n");
-
-	return 0;
-
-free_init_name:
-	kfree(init.name);
-	return ret;
-}
-
-static int max96717_init_csi_lanes(struct max96717_priv *priv)
-{
-	struct v4l2_mbus_config_mipi_csi2 *mipi = &priv->mipi_csi2;
-	unsigned long lanes_used = 0;
-	unsigned int nlanes, lane, val = 0;
-	int ret;
-
-	nlanes = mipi->num_data_lanes;
-
-	ret = cci_update_bits(priv->regmap, MAX96717_MIPI_RX1,
-			      MAX96717_MIPI_LANES_CNT,
-			      FIELD_PREP(MAX96717_MIPI_LANES_CNT,
-					 nlanes - 1), NULL);
-
-	/* lanes polarity */
-	for (lane = 0; lane < nlanes + 1; lane++) {
-		if (!mipi->lane_polarities[lane])
-			continue;
-		/* Clock lane */
-		if (lane == 0)
-			val |= BIT(2);
-		else if (lane < 3)
-			val |= BIT(lane - 1);
-		else
-			val |= BIT(lane);
-	}
-
-	cci_update_bits(priv->regmap, MAX96717_MIPI_RX5,
-			MAX96717_PHY2_LANES_POL,
-			FIELD_PREP(MAX96717_PHY2_LANES_POL, val), &ret);
-
-	cci_update_bits(priv->regmap, MAX96717_MIPI_RX4,
-			MAX96717_PHY1_LANES_POL,
-			FIELD_PREP(MAX96717_PHY1_LANES_POL,
-				   val >> 3), &ret);
-	/* lanes mapping */
-	for (lane = 0, val = 0; lane < nlanes; lane++) {
-		val |= (mipi->data_lanes[lane] - 1) << (lane * 2);
-		lanes_used |= BIT(mipi->data_lanes[lane] - 1);
-	}
-
-	/*
-	 * Unused lanes need to be mapped as well to not have
-	 * the same lanes mapped twice.
-	 */
-	for (; lane < MAX96717_CSI_NLANES; lane++) {
-		unsigned int idx = find_first_zero_bit(&lanes_used,
-						       MAX96717_CSI_NLANES);
-
-		val |= idx << (lane * 2);
-		lanes_used |= BIT(idx);
-	}
-
-	cci_update_bits(priv->regmap, MAX96717_MIPI_RX3,
-			MAX96717_PHY1_LANES_MAP,
-			FIELD_PREP(MAX96717_PHY1_LANES_MAP, val), &ret);
-
-	return cci_update_bits(priv->regmap, MAX96717_MIPI_RX2,
-			       MAX96717_PHY2_LANES_MAP,
-			       FIELD_PREP(MAX96717_PHY2_LANES_MAP, val >> 4),
-			       &ret);
-}
-
-static int max96717_hw_init(struct max96717_priv *priv)
-{
-	struct device *dev = &priv->client->dev;
-	u64 dev_id, val;
-	int ret;
-
-	ret = cci_read(priv->regmap, MAX96717_DEV_ID, &dev_id, NULL);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Fail to read the device id\n");
-
-	if (dev_id != MAX96717_DEVICE_ID && dev_id != MAX96717F_DEVICE_ID)
-		return dev_err_probe(dev, -EOPNOTSUPP,
-				     "Unsupported device id got %x\n", (u8)dev_id);
-
-	ret = cci_read(priv->regmap, MAX96717_DEV_REV, &val, NULL);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Fail to read device revision");
-
-	dev_dbg(dev, "Found %x (rev %lx)\n", (u8)dev_id,
-		(u8)val & MAX96717_DEV_REV_MASK);
-
-	ret = cci_read(priv->regmap, MAX96717_MIPI_RX_EXT11, &val, NULL);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Fail to read mipi rx extension");
-
-	if (!(val & MAX96717_TUN_MODE))
-		return dev_err_probe(dev, -EOPNOTSUPP,
-				     "Only supporting tunnel mode");
-
-	return max96717_init_csi_lanes(priv);
-}
-
-static int max96717_parse_dt(struct max96717_priv *priv)
-{
-	struct device *dev = &priv->client->dev;
-	struct v4l2_fwnode_endpoint vep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
-	struct fwnode_handle *ep_fwnode;
-	unsigned char num_data_lanes;
-	int ret;
-
-	ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
-						    MAX96717_PAD_SINK, 0, 0);
-	if (!ep_fwnode)
-		return dev_err_probe(dev, -ENOENT, "no endpoint found\n");
-
-	ret = v4l2_fwnode_endpoint_parse(ep_fwnode, &vep);
-
-	fwnode_handle_put(ep_fwnode);
-
-	if (ret < 0)
-		return dev_err_probe(dev, ret, "Failed to parse sink endpoint");
-
-	num_data_lanes = vep.bus.mipi_csi2.num_data_lanes;
-	if (num_data_lanes < 1 || num_data_lanes > MAX96717_CSI_NLANES)
-		return dev_err_probe(dev, -EINVAL,
-				     "Invalid data lanes must be 1 to 4\n");
-
-	priv->mipi_csi2 = vep.bus.mipi_csi2;
-
-	return 0;
-}
-
-static int max96717_probe(struct i2c_client *client)
-{
-	struct device *dev = &client->dev;
-	struct max96717_priv *priv;
-	int ret;
-
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	priv->client = client;
-	priv->regmap = devm_cci_regmap_init_i2c(client, 16);
-	if (IS_ERR(priv->regmap)) {
-		ret = PTR_ERR(priv->regmap);
-		return dev_err_probe(dev, ret, "Failed to init regmap\n");
-	}
-
-	ret = max96717_parse_dt(priv);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to parse the dt\n");
-
-	ret = max96717_hw_init(priv);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Failed to initialize the hardware\n");
-
-	ret = max96717_gpiochip_probe(priv);
-	if (ret)
-		return dev_err_probe(&client->dev, ret,
-				     "Failed to init gpiochip\n");
-
-	ret = max96717_register_clkout(priv);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to register clkout\n");
-
-	ret = max96717_subdev_init(priv);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Failed to initialize v4l2 subdev\n");
-
-	ret = max96717_i2c_mux_init(priv);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to add remote i2c adapter\n");
-		max96717_subdev_uninit(priv);
-	}
-
-	return ret;
-}
-
-static void max96717_remove(struct i2c_client *client)
-{
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct max96717_priv *priv = sd_to_max96717(sd);
-
-	max96717_subdev_uninit(priv);
-	i2c_mux_del_adapters(priv->mux);
-}
-
-static const struct of_device_id max96717_of_ids[] = {
-	{ .compatible = "maxim,max96717f" },
-	{ }
-};
-MODULE_DEVICE_TABLE(of, max96717_of_ids);
-
-static struct i2c_driver max96717_i2c_driver = {
-	.driver	= {
-		.name		= "max96717",
-		.of_match_table	= max96717_of_ids,
-	},
-	.probe		= max96717_probe,
-	.remove		= max96717_remove,
-};
-
-module_i2c_driver(max96717_i2c_driver);
-
-MODULE_DESCRIPTION("Maxim GMSL2 MAX96717 Serializer Driver");
-MODULE_AUTHOR("Julien Massot <julien.massot@collabora.com>");
-MODULE_LICENSE("GPL");
-- 
2.50.1


