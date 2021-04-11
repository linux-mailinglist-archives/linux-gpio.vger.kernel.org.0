Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F220035B49A
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Apr 2021 15:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235594AbhDKNbH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Apr 2021 09:31:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235566AbhDKNbG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Apr 2021 09:31:06 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B5BDC061574;
        Sun, 11 Apr 2021 06:30:50 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id u8so7925546qtq.12;
        Sun, 11 Apr 2021 06:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AUZFNUbJkrdMhob/8rYDhLxKm50MELHC9mN2Kmf3DDM=;
        b=lYceDZRa8SAvD4jUS0oxtmxwTuF/De520XtUtSJknzOYU4K/Dc+KbnsJCuy+aFj9Jc
         oQ+LVSV0Q7r+iG68x4vKq5nrQ+jpCuKEYdcNKUUndG+Hc0ZrX61jQrnrqrtcHMR1oYGT
         DFBi7nsitTUuG4LmNQA9l7nDy8obf/p2B207eCmfCfKFwQ7xv7EUWKm6x+EcUN/Epssu
         EFKyGLnS6LP8N/9CB8PcejJk+C4M/piizGpjM8F8C+15krybNdLACSJfd/g/CdGR4Q7i
         H7Wzh0SC4vnNzTejYuWI4nUFnfhIzSdbh73o2MVBtnBg3QyWnbY6ETlQbJJPTrCwjqXn
         qasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AUZFNUbJkrdMhob/8rYDhLxKm50MELHC9mN2Kmf3DDM=;
        b=JcKIxEfY/9i0IC0Qi9sZDMyegYsOuU5HY+7/bKBYLottoi9oGealdY2p+GQlIBPBGz
         fnGvH8N2/UhaYBaEOgn5g5a8L7vvpdK2UiL6YCzRLmD/uvVsg3aAaLaI5pYvQ4JNNwvQ
         +TOmJOfjA4EHx+CwBYvIS0FNmzJVeoOgMbe2Cg/Zc108qEG7bi1bIiMjWxhw0+4dFLvx
         SjGLgvdPg0yJ0M8SCaXdKWgRlyTgTw5FiLL51Q5I0VBrhtLHGmD6Loukp26phHkEvDk0
         scx4JrG/e/6yEhi7aHnBzPtYmWiec9oS14+8gezdAuOnFQqXO5CFwCabuCipVufKPSBd
         LNeA==
X-Gm-Message-State: AOAM533HZbh5HZ/5wwrR+ugO2wVjmNlHuM7Lj7fHSCu9xf0SFHYlPTvw
        lUNBnZ23bbvLMh24GptP0JQ=
X-Google-Smtp-Source: ABdhPJxO2uI87qZt6+QTvTKJBsJ684NIbv7y+UuJQ/9gVQD65I1hd7bVBlUlQ0bcfFW7GKwgOC0vgQ==
X-Received: by 2002:a05:622a:c:: with SMTP id x12mr10107879qtw.95.1618147849113;
        Sun, 11 Apr 2021 06:30:49 -0700 (PDT)
Received: from master-laptop.sparksnet (c-98-233-193-225.hsd1.md.comcast.net. [98.233.193.225])
        by smtp.gmail.com with ESMTPSA id l17sm5734204qtk.60.2021.04.11.06.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 06:30:48 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Jianqun Xu <jay.xu@rock-chips.com>, huangtao@rock-chips.com,
        kever.yang@rock-chips.com, linus.walleij@linaro.org,
        heiko@sntech.de
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] pinctrl/rockchip: separate struct rockchip_pin_bank to a head file
Date:   Sun, 11 Apr 2021 09:30:24 -0400
Message-Id: <20210411133030.1663936-2-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210411133030.1663936-1-pgwipeout@gmail.com>
References: <20210411133030.1663936-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Jianqun Xu <jay.xu@rock-chips.com>

Separate struct rockchip_pin_bank to pinctrl-rockchip.h file, which will
be used by gpio-rockchip driver in the future.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 226 +-------------------------
 drivers/pinctrl/pinctrl-rockchip.h | 245 +++++++++++++++++++++++++++++
 2 files changed, 246 insertions(+), 225 deletions(-)
 create mode 100644 drivers/pinctrl/pinctrl-rockchip.h

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 2eb51ddfca02..dd6c7489c35c 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -37,6 +37,7 @@
 
 #include "core.h"
 #include "pinconf.h"
+#include "pinctrl-rockchip.h"
 
 /* GPIO control registers */
 #define GPIO_SWPORT_DR		0x00
@@ -52,21 +53,6 @@
 #define GPIO_EXT_PORT		0x50
 #define GPIO_LS_SYNC		0x60
 
-enum rockchip_pinctrl_type {
-	PX30,
-	RV1108,
-	RK2928,
-	RK3066B,
-	RK3128,
-	RK3188,
-	RK3288,
-	RK3308,
-	RK3368,
-	RK3399,
-	RK3568,
-};
-
-
 /**
  * Generate a bitmask for setting a value (v) with a write mask bit in hiword
  * register 31:16 area.
@@ -84,103 +70,6 @@ enum rockchip_pinctrl_type {
 #define IOMUX_WIDTH_3BIT	BIT(4)
 #define IOMUX_WIDTH_2BIT	BIT(5)
 
-/**
- * struct rockchip_iomux
- * @type: iomux variant using IOMUX_* constants
- * @offset: if initialized to -1 it will be autocalculated, by specifying
- *	    an initial offset value the relevant source offset can be reset
- *	    to a new value for autocalculating the following iomux registers.
- */
-struct rockchip_iomux {
-	int				type;
-	int				offset;
-};
-
-/*
- * enum type index corresponding to rockchip_perpin_drv_list arrays index.
- */
-enum rockchip_pin_drv_type {
-	DRV_TYPE_IO_DEFAULT = 0,
-	DRV_TYPE_IO_1V8_OR_3V0,
-	DRV_TYPE_IO_1V8_ONLY,
-	DRV_TYPE_IO_1V8_3V0_AUTO,
-	DRV_TYPE_IO_3V3_ONLY,
-	DRV_TYPE_MAX
-};
-
-/*
- * enum type index corresponding to rockchip_pull_list arrays index.
- */
-enum rockchip_pin_pull_type {
-	PULL_TYPE_IO_DEFAULT = 0,
-	PULL_TYPE_IO_1V8_ONLY,
-	PULL_TYPE_MAX
-};
-
-/**
- * struct rockchip_drv
- * @drv_type: drive strength variant using rockchip_perpin_drv_type
- * @offset: if initialized to -1 it will be autocalculated, by specifying
- *	    an initial offset value the relevant source offset can be reset
- *	    to a new value for autocalculating the following drive strength
- *	    registers. if used chips own cal_drv func instead to calculate
- *	    registers offset, the variant could be ignored.
- */
-struct rockchip_drv {
-	enum rockchip_pin_drv_type	drv_type;
-	int				offset;
-};
-
-/**
- * struct rockchip_pin_bank
- * @reg_base: register base of the gpio bank
- * @regmap_pull: optional separate register for additional pull settings
- * @clk: clock of the gpio bank
- * @irq: interrupt of the gpio bank
- * @saved_masks: Saved content of GPIO_INTEN at suspend time.
- * @pin_base: first pin number
- * @nr_pins: number of pins in this bank
- * @name: name of the bank
- * @bank_num: number of the bank, to account for holes
- * @iomux: array describing the 4 iomux sources of the bank
- * @drv: array describing the 4 drive strength sources of the bank
- * @pull_type: array describing the 4 pull type sources of the bank
- * @valid: is all necessary information present
- * @of_node: dt node of this bank
- * @drvdata: common pinctrl basedata
- * @domain: irqdomain of the gpio bank
- * @gpio_chip: gpiolib chip
- * @grange: gpio range
- * @slock: spinlock for the gpio bank
- * @toggle_edge_mode: bit mask to toggle (falling/rising) edge mode
- * @recalced_mask: bit mask to indicate a need to recalulate the mask
- * @route_mask: bits describing the routing pins of per bank
- */
-struct rockchip_pin_bank {
-	void __iomem			*reg_base;
-	struct regmap			*regmap_pull;
-	struct clk			*clk;
-	int				irq;
-	u32				saved_masks;
-	u32				pin_base;
-	u8				nr_pins;
-	char				*name;
-	u8				bank_num;
-	struct rockchip_iomux		iomux[4];
-	struct rockchip_drv		drv[4];
-	enum rockchip_pin_pull_type	pull_type[4];
-	bool				valid;
-	struct device_node		*of_node;
-	struct rockchip_pinctrl		*drvdata;
-	struct irq_domain		*domain;
-	struct gpio_chip		gpio_chip;
-	struct pinctrl_gpio_range	grange;
-	raw_spinlock_t			slock;
-	u32				toggle_edge_mode;
-	u32				recalced_mask;
-	u32				route_mask;
-};
-
 #define PIN_BANK(id, pins, label)			\
 	{						\
 		.bank_num	= id,			\
@@ -320,119 +209,6 @@ struct rockchip_pin_bank {
 #define RK_MUXROUTE_PMU(ID, PIN, FUNC, REG, VAL)	\
 	PIN_BANK_MUX_ROUTE_FLAGS(ID, PIN, FUNC, REG, VAL, ROCKCHIP_ROUTE_PMU)
 
-/**
- * struct rockchip_mux_recalced_data: represent a pin iomux data.
- * @num: bank number.
- * @pin: pin number.
- * @bit: index at register.
- * @reg: register offset.
- * @mask: mask bit
- */
-struct rockchip_mux_recalced_data {
-	u8 num;
-	u8 pin;
-	u32 reg;
-	u8 bit;
-	u8 mask;
-};
-
-enum rockchip_mux_route_location {
-	ROCKCHIP_ROUTE_SAME = 0,
-	ROCKCHIP_ROUTE_PMU,
-	ROCKCHIP_ROUTE_GRF,
-};
-
-/**
- * struct rockchip_mux_recalced_data: represent a pin iomux data.
- * @bank_num: bank number.
- * @pin: index at register or used to calc index.
- * @func: the min pin.
- * @route_location: the mux route location (same, pmu, grf).
- * @route_offset: the max pin.
- * @route_val: the register offset.
- */
-struct rockchip_mux_route_data {
-	u8 bank_num;
-	u8 pin;
-	u8 func;
-	enum rockchip_mux_route_location route_location;
-	u32 route_offset;
-	u32 route_val;
-};
-
-struct rockchip_pin_ctrl {
-	struct rockchip_pin_bank	*pin_banks;
-	u32				nr_banks;
-	u32				nr_pins;
-	char				*label;
-	enum rockchip_pinctrl_type	type;
-	int				grf_mux_offset;
-	int				pmu_mux_offset;
-	int				grf_drv_offset;
-	int				pmu_drv_offset;
-	struct rockchip_mux_recalced_data *iomux_recalced;
-	u32				niomux_recalced;
-	struct rockchip_mux_route_data *iomux_routes;
-	u32				niomux_routes;
-
-	void	(*pull_calc_reg)(struct rockchip_pin_bank *bank,
-				    int pin_num, struct regmap **regmap,
-				    int *reg, u8 *bit);
-	void	(*drv_calc_reg)(struct rockchip_pin_bank *bank,
-				    int pin_num, struct regmap **regmap,
-				    int *reg, u8 *bit);
-	int	(*schmitt_calc_reg)(struct rockchip_pin_bank *bank,
-				    int pin_num, struct regmap **regmap,
-				    int *reg, u8 *bit);
-};
-
-struct rockchip_pin_config {
-	unsigned int		func;
-	unsigned long		*configs;
-	unsigned int		nconfigs;
-};
-
-/**
- * struct rockchip_pin_group: represent group of pins of a pinmux function.
- * @name: name of the pin group, used to lookup the group.
- * @pins: the pins included in this group.
- * @npins: number of pins included in this group.
- * @data: local pin configuration
- */
-struct rockchip_pin_group {
-	const char			*name;
-	unsigned int			npins;
-	unsigned int			*pins;
-	struct rockchip_pin_config	*data;
-};
-
-/**
- * struct rockchip_pmx_func: represent a pin function.
- * @name: name of the pin function, used to lookup the function.
- * @groups: one or more names of pin groups that provide this function.
- * @ngroups: number of groups included in @groups.
- */
-struct rockchip_pmx_func {
-	const char		*name;
-	const char		**groups;
-	u8			ngroups;
-};
-
-struct rockchip_pinctrl {
-	struct regmap			*regmap_base;
-	int				reg_size;
-	struct regmap			*regmap_pull;
-	struct regmap			*regmap_pmu;
-	struct device			*dev;
-	struct rockchip_pin_ctrl	*ctrl;
-	struct pinctrl_desc		pctl;
-	struct pinctrl_dev		*pctl_dev;
-	struct rockchip_pin_group	*groups;
-	unsigned int			ngroups;
-	struct rockchip_pmx_func	*functions;
-	unsigned int			nfunctions;
-};
-
 static struct regmap_config rockchip_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
new file mode 100644
index 000000000000..dba9e9540633
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -0,0 +1,245 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020-2021 Rockchip Electronics Co. Ltd.
+ *
+ * Copyright (c) 2013 MundoReader S.L.
+ * Author: Heiko Stuebner <heiko@sntech.de>
+ *
+ * With some ideas taken from pinctrl-samsung:
+ * Copyright (c) 2012 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ * Copyright (c) 2012 Linaro Ltd
+ *		https://www.linaro.org
+ *
+ * and pinctrl-at91:
+ * Copyright (C) 2011-2012 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
+ */
+
+#ifndef _PINCTRL_ROCKCHIP_H
+#define _PINCTRL_ROCKCHIP_H
+
+enum rockchip_pinctrl_type {
+	PX30,
+	RV1108,
+	RK2928,
+	RK3066B,
+	RK3128,
+	RK3188,
+	RK3288,
+	RK3308,
+	RK3368,
+	RK3399,
+	RK3568,
+};
+
+/**
+ * struct rockchip_iomux
+ * @type: iomux variant using IOMUX_* constants
+ * @offset: if initialized to -1 it will be autocalculated, by specifying
+ *	    an initial offset value the relevant source offset can be reset
+ *	    to a new value for autocalculating the following iomux registers.
+ */
+struct rockchip_iomux {
+	int type;
+	int offset;
+};
+
+/*
+ * enum type index corresponding to rockchip_perpin_drv_list arrays index.
+ */
+enum rockchip_pin_drv_type {
+	DRV_TYPE_IO_DEFAULT = 0,
+	DRV_TYPE_IO_1V8_OR_3V0,
+	DRV_TYPE_IO_1V8_ONLY,
+	DRV_TYPE_IO_1V8_3V0_AUTO,
+	DRV_TYPE_IO_3V3_ONLY,
+	DRV_TYPE_MAX
+};
+
+/*
+ * enum type index corresponding to rockchip_pull_list arrays index.
+ */
+enum rockchip_pin_pull_type {
+	PULL_TYPE_IO_DEFAULT = 0,
+	PULL_TYPE_IO_1V8_ONLY,
+	PULL_TYPE_MAX
+};
+
+/**
+ * struct rockchip_drv
+ * @drv_type: drive strength variant using rockchip_perpin_drv_type
+ * @offset: if initialized to -1 it will be autocalculated, by specifying
+ *	    an initial offset value the relevant source offset can be reset
+ *	    to a new value for autocalculating the following drive strength
+ *	    registers. if used chips own cal_drv func instead to calculate
+ *	    registers offset, the variant could be ignored.
+ */
+struct rockchip_drv {
+	enum rockchip_pin_drv_type	drv_type;
+	int				offset;
+};
+
+/**
+ * struct rockchip_pin_bank
+ * @reg_base: register base of the gpio bank
+ * @regmap_pull: optional separate register for additional pull settings
+ * @clk: clock of the gpio bank
+ * @irq: interrupt of the gpio bank
+ * @saved_masks: Saved content of GPIO_INTEN at suspend time.
+ * @pin_base: first pin number
+ * @nr_pins: number of pins in this bank
+ * @name: name of the bank
+ * @bank_num: number of the bank, to account for holes
+ * @iomux: array describing the 4 iomux sources of the bank
+ * @drv: array describing the 4 drive strength sources of the bank
+ * @pull_type: array describing the 4 pull type sources of the bank
+ * @valid: is all necessary information present
+ * @of_node: dt node of this bank
+ * @drvdata: common pinctrl basedata
+ * @domain: irqdomain of the gpio bank
+ * @gpio_chip: gpiolib chip
+ * @grange: gpio range
+ * @slock: spinlock for the gpio bank
+ * @toggle_edge_mode: bit mask to toggle (falling/rising) edge mode
+ * @recalced_mask: bit mask to indicate a need to recalulate the mask
+ * @route_mask: bits describing the routing pins of per bank
+ */
+struct rockchip_pin_bank {
+	void __iomem			*reg_base;
+	struct regmap			*regmap_pull;
+	struct clk			*clk;
+	int				irq;
+	u32				saved_masks;
+	u32				pin_base;
+	u8				nr_pins;
+	char				*name;
+	u8				bank_num;
+	struct rockchip_iomux		iomux[4];
+	struct rockchip_drv		drv[4];
+	enum rockchip_pin_pull_type	pull_type[4];
+	bool				valid;
+	struct device_node		*of_node;
+	struct rockchip_pinctrl		*drvdata;
+	struct irq_domain		*domain;
+	struct gpio_chip		gpio_chip;
+	struct pinctrl_gpio_range	grange;
+	raw_spinlock_t			slock;
+	u32				toggle_edge_mode;
+	u32				recalced_mask;
+	u32				route_mask;
+};
+
+/**
+ * struct rockchip_mux_recalced_data: represent a pin iomux data.
+ * @num: bank number.
+ * @pin: pin number.
+ * @bit: index at register.
+ * @reg: register offset.
+ * @mask: mask bit
+ */
+struct rockchip_mux_recalced_data {
+	u8 num;
+	u8 pin;
+	u32 reg;
+	u8 bit;
+	u8 mask;
+};
+
+enum rockchip_mux_route_location {
+	ROCKCHIP_ROUTE_SAME = 0,
+	ROCKCHIP_ROUTE_PMU,
+	ROCKCHIP_ROUTE_GRF,
+};
+
+/**
+ * struct rockchip_mux_recalced_data: represent a pin iomux data.
+ * @bank_num: bank number.
+ * @pin: index at register or used to calc index.
+ * @func: the min pin.
+ * @route_location: the mux route location (same, pmu, grf).
+ * @route_offset: the max pin.
+ * @route_val: the register offset.
+ */
+struct rockchip_mux_route_data {
+	u8 bank_num;
+	u8 pin;
+	u8 func;
+	enum rockchip_mux_route_location route_location;
+	u32 route_offset;
+	u32 route_val;
+};
+
+struct rockchip_pin_ctrl {
+	struct rockchip_pin_bank	*pin_banks;
+	u32				nr_banks;
+	u32				nr_pins;
+	char				*label;
+	enum rockchip_pinctrl_type	type;
+	int				grf_mux_offset;
+	int				pmu_mux_offset;
+	int				grf_drv_offset;
+	int				pmu_drv_offset;
+	struct rockchip_mux_recalced_data *iomux_recalced;
+	u32				niomux_recalced;
+	struct rockchip_mux_route_data *iomux_routes;
+	u32				niomux_routes;
+
+	void	(*pull_calc_reg)(struct rockchip_pin_bank *bank,
+				    int pin_num, struct regmap **regmap,
+				    int *reg, u8 *bit);
+	void	(*drv_calc_reg)(struct rockchip_pin_bank *bank,
+				    int pin_num, struct regmap **regmap,
+				    int *reg, u8 *bit);
+	int	(*schmitt_calc_reg)(struct rockchip_pin_bank *bank,
+				    int pin_num, struct regmap **regmap,
+				    int *reg, u8 *bit);
+};
+
+struct rockchip_pin_config {
+	unsigned int		func;
+	unsigned long		*configs;
+	unsigned int		nconfigs;
+};
+
+/**
+ * struct rockchip_pin_group: represent group of pins of a pinmux function.
+ * @name: name of the pin group, used to lookup the group.
+ * @pins: the pins included in this group.
+ * @npins: number of pins included in this group.
+ * @data: local pin configuration
+ */
+struct rockchip_pin_group {
+	const char			*name;
+	unsigned int			npins;
+	unsigned int			*pins;
+	struct rockchip_pin_config	*data;
+};
+
+/**
+ * struct rockchip_pmx_func: represent a pin function.
+ * @name: name of the pin function, used to lookup the function.
+ * @groups: one or more names of pin groups that provide this function.
+ * @ngroups: number of groups included in @groups.
+ */
+struct rockchip_pmx_func {
+	const char		*name;
+	const char		**groups;
+	u8			ngroups;
+};
+
+struct rockchip_pinctrl {
+	struct regmap			*regmap_base;
+	int				reg_size;
+	struct regmap			*regmap_pull;
+	struct regmap			*regmap_pmu;
+	struct device			*dev;
+	struct rockchip_pin_ctrl	*ctrl;
+	struct pinctrl_desc		pctl;
+	struct pinctrl_dev		*pctl_dev;
+	struct rockchip_pin_group	*groups;
+	unsigned int			ngroups;
+	struct rockchip_pmx_func	*functions;
+	unsigned int			nfunctions;
+};
+
+#endif
-- 
2.25.1

