Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5221F6C36ED
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Mar 2023 17:28:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbjCUQ2L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Mar 2023 12:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbjCUQ2K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Mar 2023 12:28:10 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48682E1AC
        for <linux-gpio@vger.kernel.org>; Tue, 21 Mar 2023 09:28:07 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by albert.telenet-ops.be with bizsmtp
        id b4U12900X1C8whw064U1ui; Tue, 21 Mar 2023 17:28:01 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1peepT-00EAsq-Pu;
        Tue, 21 Mar 2023 17:28:01 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1peeq9-00BFsC-Eo;
        Tue, 21 Mar 2023 17:28:01 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: core: Drop unneeded #ifdef CONFIG_OF
Date:   Tue, 21 Mar 2023 17:28:00 +0100
Message-Id: <55d72ce46b43ec2f41681cb5ba7ca7fcebdb98d1.1679416005.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

As the of_node member of struct device always exists, and there is a
dummy of of_device_get_match_data() for the !CONFIG_OF case, there is no
longer a need to protect code using these interfaces with an #ifdef.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-pinctrl-for-v6.4.
---
 drivers/pinctrl/renesas/core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index 52365b4e3faf31cc..2c8ca3d59612eaf5 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -1364,11 +1364,9 @@ static int sh_pfc_probe(struct platform_device *pdev)
 	struct sh_pfc *pfc;
 	int ret;
 
-#ifdef CONFIG_OF
 	if (pdev->dev.of_node)
 		info = of_device_get_match_data(&pdev->dev);
 	else
-#endif
 		info = (const void *)platform_get_device_id(pdev)->driver_data;
 
 	pfc = devm_kzalloc(&pdev->dev, sizeof(*pfc), GFP_KERNEL);
-- 
2.34.1

