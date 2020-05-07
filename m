Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B14281C83B2
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2020 09:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbgEGHpW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 May 2020 03:45:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726382AbgEGHpW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 May 2020 03:45:22 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1406C061A10
        for <linux-gpio@vger.kernel.org>; Thu,  7 May 2020 00:45:21 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:6572:4a1f:d283:9ae8])
        by albert.telenet-ops.be with bizsmtp
        id bjlH2200Q3ZRV0X06jlJ2N; Thu, 07 May 2020 09:45:18 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWbDZ-0001Hj-Sr; Thu, 07 May 2020 09:45:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWbDZ-0007n9-QL; Thu, 07 May 2020 09:45:17 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: rza1: Fix flag name in comment
Date:   Thu,  7 May 2020 09:45:16 +0200
Message-Id: <20200507074516.29903-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

rza1_swio_pin relates to the swio flag instead of the bidir flag.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc for v5.8.

 drivers/pinctrl/pinctrl-rza1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
index ff4a7fb518bb3d84..38a14bbced5f60e7 100644
--- a/drivers/pinctrl/pinctrl-rza1.c
+++ b/drivers/pinctrl/pinctrl-rza1.c
@@ -93,7 +93,7 @@ struct rza1_bidir_entry {
 };
 
 /**
- * rza1_swio_pin - describe a single pin that needs bidir flag applied.
+ * rza1_swio_pin - describe a single pin that needs swio flag applied.
  */
 struct rza1_swio_pin {
 	u16 pin: 4;
-- 
2.17.1

