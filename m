Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 135D421D92E
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 16:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730029AbgGMOth (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 10:49:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729993AbgGMOtg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 10:49:36 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BBD8C061794
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:36 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id j18so13588110wmi.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BDQo0AmW/wRqsDL2beQj5GgZo90S5+xYNYVa82ZvelY=;
        b=GoRSkBxS/tnbpEU8KW8mepOxP/TVgSZbKxeDQfb1oEnG4csHx4qgPKtw1Dpch1UzMu
         6g6z3ry4DE6sORZjwGWlJ1wuPVGeu0GlPBSTfXy2Ikx2dr3U54PkfYnhJnY8jAi1ZE1N
         j+Oeczc9kTqHziWxpVqMo6x/pdMF9PFXB/K6zJh9dQ5CmyyPITOmzo+win3AbA2SmG/A
         rKbhrZ1lpGQwKRiKrKyxkIJmluCboFzEbi02fEDhmuaZQWcQ67BOwHPpTljpSLqQTeq7
         si2L97FkbLl1Q10+xLOD2nS+7mOQeM/04ztAslVRuYKXnSSaoTpulqjXSZhXR4/L93j0
         ZDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BDQo0AmW/wRqsDL2beQj5GgZo90S5+xYNYVa82ZvelY=;
        b=ok9Gbs/YEY1lLt4NrfedACwtkBdTsFoyrGm4Mzv/dZyDgQsUHCYoHTF8f4tVbB2hVt
         Oqwzswq2mzHofKLu3xk+CfA5P8yAU807eWbFb7KNT8rC8lXGbbK4gy878jkwzyYgAU4B
         j2sz/uTvc4b8KLVE4Q27ecHUU3tRfV8Euu+U3aEpSQ5AFLXGNJQasSTqj08LkLsTd9A7
         D3kr7C60IuubqXv4XhWDZfA8ksPIp33LVv+GKcKIubRvMljBJLtE81/BSUjp1CCECtSy
         huQF9OspzDl1fTc1rnDi7fwvtHvQaOXhuxVdg9z7FQPm4prOTaNGf/Mn5EXYRtylPV6m
         VMSA==
X-Gm-Message-State: AOAM532PszpIQhf999j5WwsLNTvCCE5JcpF6VHlO8A41CrrsJ2X5WKLg
        ZhiEIFlqRaSuyR0glRo5ctB3tA==
X-Google-Smtp-Source: ABdhPJyxjPXyrITvonbGSDpgcAIA2SxE1HKmSbCG/9Vl4N/MI4NmSZ7my4z4TL/3FhV7XwfdjkOjzA==
X-Received: by 2002:a1c:3546:: with SMTP id c67mr329431wma.102.1594651775115;
        Mon, 13 Jul 2020 07:49:35 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.6])
        by smtp.gmail.com with ESMTPSA id o29sm26207756wra.5.2020.07.13.07.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:49:34 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Barry Song <baohua@kernel.org>
Subject: [PATCH 02/25] pinctrl: sirf: pinctrl-atlas7: Fix a bunch of documentation misdemeanours
Date:   Mon, 13 Jul 2020 15:49:07 +0100
Message-Id: <20200713144930.1034632-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200713144930.1034632-1-lee.jones@linaro.org>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From ill formatted kerneldoc, to incomplete *and* incorrect struct headers,
through to formatting issues and missing attribute descriptions.

Fixes the following W=1 kernel build warning(s):

 drivers/pinctrl/sirf/pinctrl-atlas7.c:197: warning: Function parameter or member 'id' not described in 'atlas7_pad_config'
 drivers/pinctrl/sirf/pinctrl-atlas7.c:221: warning: Function parameter or member 'func' not described in 'atlas7_pad_status'
 drivers/pinctrl/sirf/pinctrl-atlas7.c:221: warning: Function parameter or member 'pull' not described in 'atlas7_pad_status'
 drivers/pinctrl/sirf/pinctrl-atlas7.c:221: warning: Function parameter or member 'dstr' not described in 'atlas7_pad_status'
 drivers/pinctrl/sirf/pinctrl-atlas7.c:221: warning: Function parameter or member 'reserved' not described in 'atlas7_pad_status'
 drivers/pinctrl/sirf/pinctrl-atlas7.c:359: warning: Cannot understand  * @dev: a pointer back to containing device
 on line 359 - I thought it was a doc line
 drivers/pinctrl/sirf/pinctrl-atlas7.c:4794: warning: Function parameter or member 'pad_type' not described in 'atlas7_pull_info'
 drivers/pinctrl/sirf/pinctrl-atlas7.c:4917: warning: Function parameter or member 'reserved' not described in 'atlas7_ds_info'
 drivers/pinctrl/sirf/pinctrl-atlas7.c:5617: warning: Function parameter or member 'a7gc' not described in 'atlas7_gpio_to_bank'
 drivers/pinctrl/sirf/pinctrl-atlas7.c:5617: warning: Function parameter or member 'gpio' not described in 'atlas7_gpio_to_bank'

Cc: Barry Song <baohua@kernel.org>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/pinctrl/sirf/pinctrl-atlas7.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/sirf/pinctrl-atlas7.c
index 50df9e0844142..e54a6e3cafd23 100644
--- a/drivers/pinctrl/sirf/pinctrl-atlas7.c
+++ b/drivers/pinctrl/sirf/pinctrl-atlas7.c
@@ -169,7 +169,7 @@ struct dt_params {
 
 /**
  * struct atlas7_pad_conf - Atlas7 Pad Configuration
- * @id			The ID of this Pad.
+ * @id:			The ID of this Pad.
  * @type:		The type of this Pad.
  * @mux_reg:		The mux register offset.
  *			This register contains the mux.
@@ -210,7 +210,7 @@ struct atlas7_pad_config {
 		.ad_ctrl_bit = adb,				\
 	}
 
-/**
+/*
  * struct atlas7_pad_status - Atlas7 Pad status
  */
 struct atlas7_pad_status {
@@ -355,10 +355,6 @@ struct atlas7_gpio_chip {
 	struct atlas7_gpio_bank banks[];
 };
 
-/**
- * @dev: a pointer back to containing device
- * @virtbase: the offset to the controller in virtual memory
- */
 struct atlas7_pmx {
 	struct device *dev;
 	struct pinctrl_dev *pctl;
@@ -376,7 +372,7 @@ struct atlas7_pmx {
  * refer to A7DA IO Summary - CS-314158-DD-4E.xls
  */
 
-/*Pads in IOC RTC & TOP */
+/* Pads in IOC RTC & TOP */
 static const struct pinctrl_pin_desc atlas7_ioc_pads[] = {
 	/* RTC PADs */
 	PINCTRL_PIN(0, "rtc_gpio_0"),
@@ -4781,10 +4777,10 @@ struct map_data {
 
 /**
  * struct atlas7_pull_info - Atlas7 Pad pull info
- * @type:The type of this Pad.
- * @mask:The mas value of this pin's pull bits.
- * @v2s: The map of pull register value to pull status.
- * @s2v: The map of pull status to pull register value.
+ * @pad_type:	The type of this Pad.
+ * @mask:	The mas value of this pin's pull bits.
+ * @v2s:	The map of pull register value to pull status.
+ * @s2v:	The map of pull status to pull register value.
  */
 struct atlas7_pull_info {
 	u8 pad_type;
@@ -4908,6 +4904,7 @@ static const struct atlas7_ds_ma_info atlas7_ma2ds_map[] = {
  * @type:		The type of this Pad.
  * @mask:		The mask value of this pin's pull bits.
  * @imval:		The immediate value of drives trength register.
+ * @reserved:		Reserved space
  */
 struct atlas7_ds_info {
 	u8 type;
@@ -5609,7 +5606,7 @@ static int __init atlas7_pinmux_init(void)
 arch_initcall(atlas7_pinmux_init);
 
 
-/**
+/*
  * The Following is GPIO Code
  */
 static inline struct
-- 
2.25.1

