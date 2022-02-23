Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6F2B4C0E52
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Feb 2022 09:35:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236250AbiBWIgD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Feb 2022 03:36:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235122AbiBWIgC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Feb 2022 03:36:02 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C8746AA5B
        for <linux-gpio@vger.kernel.org>; Wed, 23 Feb 2022 00:35:33 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c0fe:4675:4cef:99a5])
        by baptiste.telenet-ops.be with bizsmtp
        id yYbX2600f4Plfy301YbXg0; Wed, 23 Feb 2022 09:35:31 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMn7T-001cqF-95; Wed, 23 Feb 2022 09:35:31 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMn7S-00B6hJ-FB; Wed, 23 Feb 2022 09:35:30 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: Remove unneeded #include <linux/gpio.h>
Date:   Wed, 23 Feb 2022 09:35:29 +0100
Message-Id: <578825d779b45af745cc7623c7f69d2ddeadac4b.1645605227.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus reports some Renesas pin control sub-drivers are still including
<linux/gpio.h> instead of <linux/gpio/driver.h>.  As these sub-drivers
don't need either, the includes can just be removed.

Reported-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-pinctrl-for-v5.18.

 drivers/pinctrl/renesas/pfc-sh7203.c | 1 -
 drivers/pinctrl/renesas/pfc-sh7264.c | 1 -
 drivers/pinctrl/renesas/pfc-sh7269.c | 1 -
 drivers/pinctrl/renesas/pfc-sh7720.c | 1 -
 drivers/pinctrl/renesas/pfc-sh7722.c | 1 -
 5 files changed, 5 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-sh7203.c b/drivers/pinctrl/renesas/pfc-sh7203.c
index d4d889c9dc833d96..19735746b1bb2157 100644
--- a/drivers/pinctrl/renesas/pfc-sh7203.c
+++ b/drivers/pinctrl/renesas/pfc-sh7203.c
@@ -6,7 +6,6 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/gpio.h>
 #include <cpu/sh7203.h>
 
 #include "sh_pfc.h"
diff --git a/drivers/pinctrl/renesas/pfc-sh7264.c b/drivers/pinctrl/renesas/pfc-sh7264.c
index 1d13b244383332d3..30096925a70c5d88 100644
--- a/drivers/pinctrl/renesas/pfc-sh7264.c
+++ b/drivers/pinctrl/renesas/pfc-sh7264.c
@@ -6,7 +6,6 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/gpio.h>
 #include <cpu/sh7264.h>
 
 #include "sh_pfc.h"
diff --git a/drivers/pinctrl/renesas/pfc-sh7269.c b/drivers/pinctrl/renesas/pfc-sh7269.c
index fa92d50c65c465c7..f59f558d75ae253e 100644
--- a/drivers/pinctrl/renesas/pfc-sh7269.c
+++ b/drivers/pinctrl/renesas/pfc-sh7269.c
@@ -7,7 +7,6 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/gpio.h>
 #include <cpu/sh7269.h>
 
 #include "sh_pfc.h"
diff --git a/drivers/pinctrl/renesas/pfc-sh7720.c b/drivers/pinctrl/renesas/pfc-sh7720.c
index bcaed309e7d8287b..6eedcc5bbb4d6705 100644
--- a/drivers/pinctrl/renesas/pfc-sh7720.c
+++ b/drivers/pinctrl/renesas/pfc-sh7720.c
@@ -6,7 +6,6 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/gpio.h>
 #include <cpu/sh7720.h>
 
 #include "sh_pfc.h"
diff --git a/drivers/pinctrl/renesas/pfc-sh7722.c b/drivers/pinctrl/renesas/pfc-sh7722.c
index 8790d1624e5fdb1b..a5ceda5ebe76a941 100644
--- a/drivers/pinctrl/renesas/pfc-sh7722.c
+++ b/drivers/pinctrl/renesas/pfc-sh7722.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/init.h>
 #include <linux/kernel.h>
-#include <linux/gpio.h>
 #include <cpu/sh7722.h>
 
 #include "sh_pfc.h"
-- 
2.25.1

