Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0AF3786C8C
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Aug 2023 12:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235839AbjHXKGX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Aug 2023 06:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235835AbjHXKF6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Aug 2023 06:05:58 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 114FE1984
        for <linux-gpio@vger.kernel.org>; Thu, 24 Aug 2023 03:05:55 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:3c6b:f703:5ab5:f36d])
        by albert.telenet-ops.be with bizsmtp
        id dN5r2A00G01sfPQ06N5rsD; Thu, 24 Aug 2023 12:05:53 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qZ7Dh-001cx5-Dn;
        Thu, 24 Aug 2023 12:05:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qZ7Dr-000NL4-1A;
        Thu, 24 Aug 2023 12:05:51 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jisheng Zhang <jszhang@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: berlin: Drop superfluous ampersands
Date:   Thu, 24 Aug 2023 12:05:50 +0200
Message-Id: <0ff17be9b31c9fcf03481c0665293b98ced741f7.1692871243.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is no need to use an ampersand to take the address of a function.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/berlin/berlin.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/berlin.c
index 1e427ea4d31bcbfc..9550cc8095c28720 100644
--- a/drivers/pinctrl/berlin/berlin.c
+++ b/drivers/pinctrl/berlin/berlin.c
@@ -96,10 +96,10 @@ static int berlin_pinctrl_dt_node_to_map(struct pinctrl_dev *pctrl_dev,
 }
 
 static const struct pinctrl_ops berlin_pinctrl_ops = {
-	.get_groups_count	= &berlin_pinctrl_get_group_count,
-	.get_group_name		= &berlin_pinctrl_get_group_name,
-	.dt_node_to_map		= &berlin_pinctrl_dt_node_to_map,
-	.dt_free_map		= &pinctrl_utils_free_map,
+	.get_groups_count	= berlin_pinctrl_get_group_count,
+	.get_group_name		= berlin_pinctrl_get_group_name,
+	.dt_node_to_map		= berlin_pinctrl_dt_node_to_map,
+	.dt_free_map		= pinctrl_utils_free_map,
 };
 
 static int berlin_pinmux_get_functions_count(struct pinctrl_dev *pctrl_dev)
-- 
2.34.1

