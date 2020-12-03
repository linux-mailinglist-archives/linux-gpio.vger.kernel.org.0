Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8B5C2CD06E
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Dec 2020 08:32:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbgLCHcA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Dec 2020 02:32:00 -0500
Received: from inva021.nxp.com ([92.121.34.21]:57696 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbgLCHcA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 3 Dec 2020 02:32:00 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D69FD2017BA;
        Thu,  3 Dec 2020 08:31:13 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D00EB2017B6;
        Thu,  3 Dec 2020 08:31:10 +0100 (CET)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 5B0D5402C4;
        Thu,  3 Dec 2020 08:31:06 +0100 (CET)
From:   Biwen Li <biwen.li@oss.nxp.com>
To:     leoyang.li@nxp.com, bgolaszewski@baylibre.com, aisheng.dong@nxp.com
Cc:     linux-kernel@vger.kernel.org, jiafei.pan@nxp.com,
        linux-gpio@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
Subject: [PATCH] gpio: mpc8xxx: resolve coverity warnings
Date:   Thu,  3 Dec 2020 15:39:10 +0800
Message-Id: <20201203073910.20113-1-biwen.li@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Biwen Li <biwen.li@nxp.com>

Resolve coverity warnings as follows,
    cond_at_most: Checking gpio >= 28U implies that gpio may be up
    to 27 on the false branch.
    overrun-call: Overrunning callees array of size 3 by passing
    argument gpio (which evaluates to 27)
    in call to *mpc8xxx_gc->direction_output

    cond_at_least: Checking gpio <= 3U implies that gpio is at least 4 on
    the false branch.
    overrun-call: Overrunning callee's array of size 3 by passing argument
    gpio (which evaluates to 4) in call to *mpc8xxx_gc->direction_output

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
 drivers/gpio/gpio-mpc8xxx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index a6c2bbdcaa10..12c9a91d87b7 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -3,6 +3,7 @@
  *
  * Copyright (C) 2008 Peter Korsgaard <jacmet@sunsite.dk>
  * Copyright (C) 2016 Freescale Semiconductor Inc.
+ * Copyright 2020 NXP
  *
  * This file is licensed under the terms of the GNU General Public License
  * version 2.  This program is licensed "as is" without any warranty of any
@@ -80,7 +81,7 @@ static int mpc5121_gpio_dir_out(struct gpio_chip *gc,
 {
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = gpiochip_get_data(gc);
 	/* GPIO 28..31 are input only on MPC5121 */
-	if (gpio >= 28)
+	if (gpio >= 28U)
 		return -EINVAL;
 
 	return mpc8xxx_gc->direction_output(gc, gpio, val);
@@ -91,7 +92,7 @@ static int mpc5125_gpio_dir_out(struct gpio_chip *gc,
 {
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = gpiochip_get_data(gc);
 	/* GPIO 0..3 are input only on MPC5125 */
-	if (gpio <= 3)
+	if (gpio <= 3U)
 		return -EINVAL;
 
 	return mpc8xxx_gc->direction_output(gc, gpio, val);
-- 
2.17.1

