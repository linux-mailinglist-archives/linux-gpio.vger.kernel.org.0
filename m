Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8E421D90F
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 16:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730201AbgGMOub (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 10:50:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730197AbgGMOtz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 10:49:55 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E771C08C5DB
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:55 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l2so13447734wmf.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=817wc3B0tEQkksY1V8NZK3Mi1te+eDyPgZM0j9ShTnE=;
        b=oX40QjZLvI5SFCfkxOzc9ZqFxjAYZWST2zk70YDAqN7UJzQ5f4YwKrapiOHYw9qldU
         M0tdXlSw6HnNt4GXNxvWYAMkZj5Vgf5yVUXFVEAAnxjNdD48KRqr7ZVdsWCKIFE2Rzrn
         YxYD6esQQcry5gxO3VDGlXG6WK+/8Ek0L44pmDEyqxGrRKtDAF7VVF3z0GvlgUVVCgGY
         uKWGymRx3+YWrYfTwIo1jJMjUi4uPWTQ1T6Xo0zUWv6yq4xkb35vgVIvOosb32An7miO
         5f4QCgP/L7iHd41LZL+9E74sbZfWcilKQsl407gClR5yeFcTDm64jf/921eJ2q3EpHf4
         2SEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=817wc3B0tEQkksY1V8NZK3Mi1te+eDyPgZM0j9ShTnE=;
        b=nXMLcJuxO0OKIROTtRo2tzHnSWktcwgR5MexF8ST2QreFRlOYBUFtw4CMbpx58MyIF
         SlK+1mF4KcyDT0/Nsj0BDr3OPVZur+Y7b1RYhJXza0Tvot3GWTZFSX14ZJlRNbl76OIg
         tLwA3KF1FmAItk0hBDySEScrbHlcYZLreuN/8sS6pFADnBcEVy680c/LMDZWnlaOLVzj
         JQNqZ4xEbpvFwHM7VdRyPOkDc/st16CMoJZssoephlkp8gtKbBgn66+7VFKzJOjheXjB
         Ap8SBXtsblA1xSUv8a944JHz1ONAk07lLtkOPxolvMrOTIH8n08wwNY541XnUdhUnkb7
         wB5w==
X-Gm-Message-State: AOAM532JdLa+p3uEn59SLX5mdTs8de0NvzLSZV1sMXjMZBm9NPFb3kgO
        8lfEaAhoGgqD3Hp52rv5X0ZoiA==
X-Google-Smtp-Source: ABdhPJwp2zFf5tPmLBLPvGbiRZ72PJzfEQKUiUEhit/GogfCqeT4Nsl9fIj4qN5zry/cdy7zSOT92g==
X-Received: by 2002:a1c:7402:: with SMTP id p2mr280589wmc.117.1594651793611;
        Mon, 13 Jul 2020 07:49:53 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.6])
        by smtp.gmail.com with ESMTPSA id o29sm26207756wra.5.2020.07.13.07.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:49:53 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 19/25] pinctrl: pinctrl-rockchip: Fix a bunch of kerneldoc misdemeanours
Date:   Mon, 13 Jul 2020 15:49:24 +0100
Message-Id: <20200713144930.1034632-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200713144930.1034632-1-lee.jones@linaro.org>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Demote headers which are clearly not kerneldoc, provide titles for
struct definition blocks, fix API slip (bitrot) misspellings and
provide some missing entries.

Fixes the following W=1 kernel build warning(s):

 drivers/pinctrl/pinctrl-rockchip.c:82: warning: cannot understand function prototype: 'struct rockchip_iomux '
 drivers/pinctrl/pinctrl-rockchip.c:97: warning: Enum value 'DRV_TYPE_IO_DEFAULT' not described in enum 'rockchip_pin_drv_type'
 drivers/pinctrl/pinctrl-rockchip.c:97: warning: Enum value 'DRV_TYPE_IO_1V8_OR_3V0' not described in enum 'rockchip_pin_drv_type'
 drivers/pinctrl/pinctrl-rockchip.c:97: warning: Enum value 'DRV_TYPE_IO_1V8_ONLY' not described in enum 'rockchip_pin_drv_type'
 drivers/pinctrl/pinctrl-rockchip.c:97: warning: Enum value 'DRV_TYPE_IO_1V8_3V0_AUTO' not described in enum 'rockchip_pin_drv_type'
 drivers/pinctrl/pinctrl-rockchip.c:97: warning: Enum value 'DRV_TYPE_IO_3V3_ONLY' not described in enum 'rockchip_pin_drv_type'
 drivers/pinctrl/pinctrl-rockchip.c:97: warning: Enum value 'DRV_TYPE_MAX' not described in enum 'rockchip_pin_drv_type'
 drivers/pinctrl/pinctrl-rockchip.c:106: warning: Enum value 'PULL_TYPE_IO_DEFAULT' not described in enum 'rockchip_pin_pull_type'
 drivers/pinctrl/pinctrl-rockchip.c:106: warning: Enum value 'PULL_TYPE_IO_1V8_ONLY' not described in enum 'rockchip_pin_pull_type'
 drivers/pinctrl/pinctrl-rockchip.c:106: warning: Enum value 'PULL_TYPE_MAX' not described in enum 'rockchip_pin_pull_type'
 drivers/pinctrl/pinctrl-rockchip.c:109: warning: Cannot understand  * @drv_type: drive strength variant using rockchip_perpin_drv_type
 on line 109 - I thought it was a doc line
 drivers/pinctrl/pinctrl-rockchip.c:122: warning: Cannot understand  * @reg_base: register base of the gpio bank
 on line 109 - I thought it was a doc line
 drivers/pinctrl/pinctrl-rockchip.c:325: warning: Function parameter or member 'route_location' not described in 'rockchip_mux_route_data'
 drivers/pinctrl/pinctrl-rockchip.c:328: warning: Cannot understand  */
 on line 109 - I thought it was a doc line
 drivers/pinctrl/pinctrl-rockchip.c:375: warning: Function parameter or member 'data' not described in 'rockchip_pin_group'
 drivers/pinctrl/pinctrl-rockchip.c:387: warning: Function parameter or member 'ngroups' not described in 'rockchip_pmx_func'

Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/pinctrl/pinctrl-rockchip.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index c07324d1f2657..c96d810635ad6 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -63,7 +63,7 @@ enum rockchip_pinctrl_type {
 	RK3399,
 };
 
-/**
+/*
  * Encode variants of iomux registers into a type variable
  */
 #define IOMUX_GPIO_ONLY		BIT(0)
@@ -74,6 +74,7 @@ enum rockchip_pinctrl_type {
 #define IOMUX_WIDTH_2BIT	BIT(5)
 
 /**
+ * struct rockchip_iomux
  * @type: iomux variant using IOMUX_* constants
  * @offset: if initialized to -1 it will be autocalculated, by specifying
  *	    an initial offset value the relevant source offset can be reset
@@ -84,7 +85,7 @@ struct rockchip_iomux {
 	int				offset;
 };
 
-/**
+/*
  * enum type index corresponding to rockchip_perpin_drv_list arrays index.
  */
 enum rockchip_pin_drv_type {
@@ -96,7 +97,7 @@ enum rockchip_pin_drv_type {
 	DRV_TYPE_MAX
 };
 
-/**
+/*
  * enum type index corresponding to rockchip_pull_list arrays index.
  */
 enum rockchip_pin_pull_type {
@@ -106,6 +107,7 @@ enum rockchip_pin_pull_type {
 };
 
 /**
+ * struct rockchip_drv
  * @drv_type: drive strength variant using rockchip_perpin_drv_type
  * @offset: if initialized to -1 it will be autocalculated, by specifying
  *	    an initial offset value the relevant source offset can be reset
@@ -119,8 +121,9 @@ struct rockchip_drv {
 };
 
 /**
+ * struct rockchip_pin_bank
  * @reg_base: register base of the gpio bank
- * @reg_pull: optional separate register for additional pull settings
+ * @regmap_pull: optional separate register for additional pull settings
  * @clk: clock of the gpio bank
  * @irq: interrupt of the gpio bank
  * @saved_masks: Saved content of GPIO_INTEN at suspend time.
@@ -138,6 +141,8 @@ struct rockchip_drv {
  * @gpio_chip: gpiolib chip
  * @grange: gpio range
  * @slock: spinlock for the gpio bank
+ * @toggle_edge_mode: bit mask to toggle (falling/rising) edge mode
+ * @recalced_mask: bit mask to indicate a need to recalulate the mask
  * @route_mask: bits describing the routing pins of per bank
  */
 struct rockchip_pin_bank {
@@ -312,6 +317,7 @@ enum rockchip_mux_route_location {
  * @bank_num: bank number.
  * @pin: index at register or used to calc index.
  * @func: the min pin.
+ * @route_location: the mux route location (same, pmu, grf).
  * @route_offset: the max pin.
  * @route_val: the register offset.
  */
@@ -324,8 +330,6 @@ struct rockchip_mux_route_data {
 	u32 route_val;
 };
 
-/**
- */
 struct rockchip_pin_ctrl {
 	struct rockchip_pin_bank	*pin_banks;
 	u32				nr_banks;
@@ -363,9 +367,7 @@ struct rockchip_pin_config {
  * @name: name of the pin group, used to lookup the group.
  * @pins: the pins included in this group.
  * @npins: number of pins included in this group.
- * @func: the mux function number to be programmed when selected.
- * @configs: the config values to be set for each pin
- * @nconfigs: number of configs for each pin
+ * @data: local pin configuration
  */
 struct rockchip_pin_group {
 	const char			*name;
@@ -378,7 +380,7 @@ struct rockchip_pin_group {
  * struct rockchip_pmx_func: represent a pin function.
  * @name: name of the pin function, used to lookup the function.
  * @groups: one or more names of pin groups that provide this function.
- * @num_groups: number of groups included in @groups.
+ * @ngroups: number of groups included in @groups.
  */
 struct rockchip_pmx_func {
 	const char		*name;
-- 
2.25.1

