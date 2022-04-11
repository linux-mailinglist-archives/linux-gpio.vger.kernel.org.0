Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C96E14FBC96
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Apr 2022 14:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346273AbiDKM66 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Apr 2022 08:58:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346287AbiDKM65 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Apr 2022 08:58:57 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99710B60
        for <linux-gpio@vger.kernel.org>; Mon, 11 Apr 2022 05:56:43 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:b509:6862:2557:437a])
        by laurent.telenet-ops.be with bizsmtp
        id HQwi270011G7NMJ01Qwibd; Mon, 11 Apr 2022 14:56:42 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ndtaz-000AS4-K7; Mon, 11 Apr 2022 14:56:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ndtaz-009JMP-0R; Mon, 11 Apr 2022 14:56:41 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: Remove unneeded #include <linux/init.h>
Date:   Mon, 11 Apr 2022 14:56:40 +0200
Message-Id: <fb71c409ea3ad76163496e305dc955ca8e84416d.1649681741.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The last __init annotations were removed from these source files almost
one decade ago.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-pinctrl for v5.19.

 drivers/pinctrl/renesas/gpio.c       | 1 -
 drivers/pinctrl/renesas/pfc-emev2.c  | 1 -
 drivers/pinctrl/renesas/pfc-sh7722.c | 1 -
 drivers/pinctrl/renesas/pfc-sh7723.c | 1 -
 drivers/pinctrl/renesas/pfc-sh7724.c | 1 -
 drivers/pinctrl/renesas/pfc-sh7734.c | 1 -
 drivers/pinctrl/renesas/pfc-sh7757.c | 1 -
 drivers/pinctrl/renesas/pfc-sh7785.c | 1 -
 drivers/pinctrl/renesas/pfc-sh7786.c | 1 -
 drivers/pinctrl/renesas/pfc-shx3.c   | 1 -
 drivers/pinctrl/renesas/pinctrl.c    | 1 -
 11 files changed, 11 deletions(-)

diff --git a/drivers/pinctrl/renesas/gpio.c b/drivers/pinctrl/renesas/gpio.c
index ad06f5355d1ed1c5..ea3d38b4af8da4e1 100644
--- a/drivers/pinctrl/renesas/gpio.c
+++ b/drivers/pinctrl/renesas/gpio.c
@@ -8,7 +8,6 @@
 
 #include <linux/device.h>
 #include <linux/gpio/driver.h>
-#include <linux/init.h>
 #include <linux/module.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/slab.h>
diff --git a/drivers/pinctrl/renesas/pfc-emev2.c b/drivers/pinctrl/renesas/pfc-emev2.c
index 2326d348447d4123..b3f50853d66ebcd7 100644
--- a/drivers/pinctrl/renesas/pfc-emev2.c
+++ b/drivers/pinctrl/renesas/pfc-emev2.c
@@ -4,7 +4,6 @@
  *
  * Copyright (C) 2015 Niklas Söderlund
  */
-#include <linux/init.h>
 #include <linux/kernel.h>
 
 #include "sh_pfc.h"
diff --git a/drivers/pinctrl/renesas/pfc-sh7722.c b/drivers/pinctrl/renesas/pfc-sh7722.c
index 13d9967dce592d8e..635e3dca27038890 100644
--- a/drivers/pinctrl/renesas/pfc-sh7722.c
+++ b/drivers/pinctrl/renesas/pfc-sh7722.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <linux/init.h>
 #include <linux/kernel.h>
 #include <cpu/sh7722.h>
 
diff --git a/drivers/pinctrl/renesas/pfc-sh7723.c b/drivers/pinctrl/renesas/pfc-sh7723.c
index 6f08f527c01081c3..94c7acf591d68a29 100644
--- a/drivers/pinctrl/renesas/pfc-sh7723.c
+++ b/drivers/pinctrl/renesas/pfc-sh7723.c
@@ -5,7 +5,6 @@
  *  Copyright (C) 2008  Magnus Damm
  */
 
-#include <linux/init.h>
 #include <linux/kernel.h>
 #include <cpu/sh7723.h>
 
diff --git a/drivers/pinctrl/renesas/pfc-sh7724.c b/drivers/pinctrl/renesas/pfc-sh7724.c
index 7a18afecda2c2799..551da3113ce348b8 100644
--- a/drivers/pinctrl/renesas/pfc-sh7724.c
+++ b/drivers/pinctrl/renesas/pfc-sh7724.c
@@ -10,7 +10,6 @@
  *  Copyright (C) 2008  Magnus Damm
  */
 
-#include <linux/init.h>
 #include <linux/kernel.h>
 #include <cpu/sh7724.h>
 
diff --git a/drivers/pinctrl/renesas/pfc-sh7734.c b/drivers/pinctrl/renesas/pfc-sh7734.c
index dbc36079c3811cde..a4e02fc7ea34f1f5 100644
--- a/drivers/pinctrl/renesas/pfc-sh7734.c
+++ b/drivers/pinctrl/renesas/pfc-sh7734.c
@@ -5,7 +5,6 @@
  * Copyright (C) 2012  Renesas Solutions Corp.
  * Copyright (C) 2012  Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
  */
-#include <linux/init.h>
 #include <linux/kernel.h>
 #include <cpu/sh7734.h>
 
diff --git a/drivers/pinctrl/renesas/pfc-sh7757.c b/drivers/pinctrl/renesas/pfc-sh7757.c
index 064e987b09cbf5b9..79cf7c42c35d87dd 100644
--- a/drivers/pinctrl/renesas/pfc-sh7757.c
+++ b/drivers/pinctrl/renesas/pfc-sh7757.c
@@ -10,7 +10,6 @@
  *  Copyright (C) 2008  Magnus Damm
  */
 
-#include <linux/init.h>
 #include <linux/kernel.h>
 #include <cpu/sh7757.h>
 
diff --git a/drivers/pinctrl/renesas/pfc-sh7785.c b/drivers/pinctrl/renesas/pfc-sh7785.c
index c4c1e288c53e6a63..62389f7a1de14aec 100644
--- a/drivers/pinctrl/renesas/pfc-sh7785.c
+++ b/drivers/pinctrl/renesas/pfc-sh7785.c
@@ -5,7 +5,6 @@
  *  Copyright (C) 2008  Magnus Damm
  */
 
-#include <linux/init.h>
 #include <linux/kernel.h>
 #include <cpu/sh7785.h>
 
diff --git a/drivers/pinctrl/renesas/pfc-sh7786.c b/drivers/pinctrl/renesas/pfc-sh7786.c
index b8a098cd77218728..4ed31d78fe30f35f 100644
--- a/drivers/pinctrl/renesas/pfc-sh7786.c
+++ b/drivers/pinctrl/renesas/pfc-sh7786.c
@@ -10,7 +10,6 @@
  *  Copyright (C) 2008  Magnus Damm
  */
 
-#include <linux/init.h>
 #include <linux/kernel.h>
 #include <cpu/sh7786.h>
 
diff --git a/drivers/pinctrl/renesas/pfc-shx3.c b/drivers/pinctrl/renesas/pfc-shx3.c
index 22e812850964e795..96a65d83774f16a7 100644
--- a/drivers/pinctrl/renesas/pfc-shx3.c
+++ b/drivers/pinctrl/renesas/pfc-shx3.c
@@ -4,7 +4,6 @@
  *
  * Copyright (C) 2010  Paul Mundt
  */
-#include <linux/init.h>
 #include <linux/kernel.h>
 #include <cpu/shx3.h>
 
diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
index 4c37aebc75b82e1f..b438d24c13b5c911 100644
--- a/drivers/pinctrl/renesas/pinctrl.c
+++ b/drivers/pinctrl/renesas/pinctrl.c
@@ -9,7 +9,6 @@
 
 #include <linux/device.h>
 #include <linux/err.h>
-#include <linux/init.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-- 
2.25.1

