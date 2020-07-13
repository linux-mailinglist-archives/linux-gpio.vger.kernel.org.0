Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A08521D906
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 16:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730208AbgGMOt5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 10:49:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730205AbgGMOt4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 10:49:56 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D735C08C5E0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:56 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z13so16874084wrw.5
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cN4hxjZffgZiTP9rm/+61P197dYAAsxmh3k67ken7Lc=;
        b=WTQoGW2es+DWWY184OTiOYJ7kP1gCvv1WQ1ASQc8H3lTiNUlHTvhvgokw5MlYOoQcb
         xbItXOry4H/me4A1wb4XHXpe777Ljj2j2PknAYL9l5Queojhz9t3xFJmVNwHR8zJ3FHh
         bowur06fz2y6nvUF56d2jjF3lrqddddvG8BYENEtvI7g4ZHPvMWU1gHLsk5vkKJrmIrO
         oY34NgGyGzEm4WxR86ifRP9ONNsVzsA9XQhauVnIBm7MLH426LUj15DxIlnJ6LtJGOHl
         lcGlArQ6p1HY3fzm/ioHcW8cff1EfGLZ4AJMIaaVLko2XmYUKKLb+1FdYJQVw+Qbw7AR
         Fq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cN4hxjZffgZiTP9rm/+61P197dYAAsxmh3k67ken7Lc=;
        b=IjM7DYOkBgBmtviKeqtN9eVMvrT3i3Bu3MIGH/QQ7vsEsNsao8uv7H2j0K/ZF87xxf
         qTPet+i4BqEyANOUfKoxDWfm/Ss/d3NzWoGf/J5HlNBGvicDWcNZmzOeKkRvC0xNoZgU
         8s4oxRQvteMN//jVFDvYE8b8cuAASRtTlk+Yqd4FQwmRMhDOHa9OJelcskz0TgeXFjeD
         KVY/hf6GX4rP1+Z88T7ap/S+0Rnsg4oDeeR0JDz0mifZbphQN2aGppd+zBVWxG7yUjSY
         iwjInSjd/bthNhVXXI2R09443yKTCGO9AnaqiEXJd/XrU00jfQ6opSi9VcSNCGaeMQ5z
         pCyg==
X-Gm-Message-State: AOAM533+QGAu7Zfi8IrrMRlnjJHzw2Hdyjz0MzZR7t2mt7SILsftpOZ3
        UHYgyu2oAESAfgqLLbZaox683Q==
X-Google-Smtp-Source: ABdhPJz8jfAdXhMgUGuKXug5KeJG6GRYTP016bM0s16EfAm3SEIqrcdRn9WoEAoC6M02wqoX9iLYiQ==
X-Received: by 2002:a5d:4a45:: with SMTP id v5mr80799127wrs.228.1594651794974;
        Mon, 13 Jul 2020 07:49:54 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.6])
        by smtp.gmail.com with ESMTPSA id o29sm26207756wra.5.2020.07.13.07.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:49:54 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 20/25] pinctrl: pinctrl-rza1: Demote some kerneldoc headers and fix others
Date:   Mon, 13 Jul 2020 15:49:25 +0100
Message-Id: <20200713144930.1034632-21-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200713144930.1034632-1-lee.jones@linaro.org>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some description blocks are void of any description/documentation,
others are missing 'struct' identifiers, there are also a couple of
misspellings of function parameter names.  Fix all of them.

Fixes the following W=1 kernel build warning(s):

 drivers/pinctrl/pinctrl-rza1.c:81: warning: cannot understand function prototype: 'struct rza1_bidir_pin '
 drivers/pinctrl/pinctrl-rza1.c:90: warning: cannot understand function prototype: 'struct rza1_bidir_entry '
 drivers/pinctrl/pinctrl-rza1.c:98: warning: cannot understand function prototype: 'struct rza1_swio_pin '
 drivers/pinctrl/pinctrl-rza1.c:108: warning: cannot understand function prototype: 'struct rza1_swio_entry '
 drivers/pinctrl/pinctrl-rza1.c:116: warning: cannot understand function prototype: 'struct rza1_pinmux_conf '
 drivers/pinctrl/pinctrl-rza1.c:443: warning: cannot understand function prototype: 'struct rza1_mux_conf '
 drivers/pinctrl/pinctrl-rza1.c:462: warning: cannot understand function prototype: 'struct rza1_port '
 drivers/pinctrl/pinctrl-rza1.c:482: warning: cannot understand function prototype: 'struct rza1_pinctrl '
 drivers/pinctrl/pinctrl-rza1.c:546: warning: Function parameter or member 'port' not described in 'rza1_pinmux_get_flags'
 drivers/pinctrl/pinctrl-rza1.c:546: warning: Function parameter or member 'pin' not described in 'rza1_pinmux_get_flags'
 drivers/pinctrl/pinctrl-rza1.c:546: warning: Function parameter or member 'func' not described in 'rza1_pinmux_get_flags'
 drivers/pinctrl/pinctrl-rza1.c:546: warning: Function parameter or member 'rza1_pctl' not described in 'rza1_pinmux_get_flags'
 drivers/pinctrl/pinctrl-rza1.c:575: warning: Function parameter or member 'port' not described in 'rza1_set_bit'
 drivers/pinctrl/pinctrl-rza1.c:575: warning: Function parameter or member 'reg' not described in 'rza1_set_bit'
 drivers/pinctrl/pinctrl-rza1.c:575: warning: Function parameter or member 'bit' not described in 'rza1_set_bit'
 drivers/pinctrl/pinctrl-rza1.c:575: warning: Function parameter or member 'set' not described in 'rza1_set_bit'
 drivers/pinctrl/pinctrl-rza1.c:672: warning: Function parameter or member 'rza1_pctl' not described in 'rza1_pin_mux_single'
 drivers/pinctrl/pinctrl-rza1.c:672: warning: Excess function parameter 'pinctrl' description in 'rza1_pin_mux_single'

Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/pinctrl/pinctrl-rza1.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
index 38a14bbced5f6..511f232ab7bc2 100644
--- a/drivers/pinctrl/pinctrl-rza1.c
+++ b/drivers/pinctrl/pinctrl-rza1.c
@@ -75,7 +75,7 @@
  * RZ/A1 pinmux flags
  */
 
-/**
+/*
  * rza1_bidir_pin - describe a single pin that needs bidir flag applied.
  */
 struct rza1_bidir_pin {
@@ -83,7 +83,7 @@ struct rza1_bidir_pin {
 	u8 func: 4;
 };
 
-/**
+/*
  * rza1_bidir_entry - describe a list of pins that needs bidir flag applied.
  *		      Each struct rza1_bidir_entry describes a port.
  */
@@ -92,7 +92,7 @@ struct rza1_bidir_entry {
 	const struct rza1_bidir_pin *pins;
 };
 
-/**
+/*
  * rza1_swio_pin - describe a single pin that needs swio flag applied.
  */
 struct rza1_swio_pin {
@@ -102,7 +102,7 @@ struct rza1_swio_pin {
 	u16 input: 1;
 };
 
-/**
+/*
  * rza1_swio_entry - describe a list of pins that needs swio flag applied
  */
 struct rza1_swio_entry {
@@ -110,7 +110,7 @@ struct rza1_swio_entry {
 	const struct rza1_swio_pin *pins;
 };
 
-/**
+/*
  * rza1_pinmux_conf - group together bidir and swio pinmux flag tables
  */
 struct rza1_pinmux_conf {
@@ -431,7 +431,7 @@ static const struct rza1_pinmux_conf rza1l_pmx_conf = {
  * RZ/A1 types
  */
 /**
- * rza1_mux_conf - describes a pin multiplexing operation
+ * struct rza1_mux_conf - describes a pin multiplexing operation
  *
  * @id: the pin identifier from 0 to RZA1_NPINS
  * @port: the port where pin sits on
@@ -450,7 +450,7 @@ struct rza1_mux_conf {
 };
 
 /**
- * rza1_port - describes a pin port
+ * struct rza1_port - describes a pin port
  *
  * This is mostly useful to lock register writes per-bank and not globally.
  *
@@ -467,12 +467,12 @@ struct rza1_port {
 };
 
 /**
- * rza1_pinctrl - RZ pincontroller device
+ * struct rza1_pinctrl - RZ pincontroller device
  *
  * @dev: parent device structure
  * @mutex: protect [pinctrl|pinmux]_generic functions
  * @base: logical address base
- * @nports: number of pin controller ports
+ * @nport: number of pin controller ports
  * @ports: pin controller banks
  * @pins: pin array for pinctrl core
  * @desc: pincontroller desc for pinctrl core
@@ -536,7 +536,7 @@ static inline int rza1_pinmux_get_swio(unsigned int port,
 	return -ENOENT;
 }
 
-/**
+/*
  * rza1_pinmux_get_flags() - return pinmux flags associated to a pin
  */
 static unsigned int rza1_pinmux_get_flags(unsigned int port, unsigned int pin,
@@ -566,7 +566,7 @@ static unsigned int rza1_pinmux_get_flags(unsigned int port, unsigned int pin,
  * RZ/A1 SoC operations
  */
 
-/**
+/*
  * rza1_set_bit() - un-locked set/clear a single bit in pin configuration
  *		    registers
  */
@@ -664,7 +664,7 @@ static inline int rza1_pin_get(struct rza1_port *port, unsigned int pin)
 /**
  * rza1_pin_mux_single() - configure pin multiplexing on a single pin
  *
- * @pinctrl: RZ/A1 pin controller device
+ * @rza1_pctl: RZ/A1 pin controller device
  * @mux_conf: pin multiplexing descriptor
  */
 static int rza1_pin_mux_single(struct rza1_pinctrl *rza1_pctl,
-- 
2.25.1

