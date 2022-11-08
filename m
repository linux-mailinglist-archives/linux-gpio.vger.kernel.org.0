Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E979621BED
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Nov 2022 19:32:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbiKHSce (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 13:32:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbiKHSca (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 13:32:30 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3581C5B857;
        Tue,  8 Nov 2022 10:32:28 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,148,1665414000"; 
   d="scan'208";a="139379478"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 09 Nov 2022 03:32:28 +0900
Received: from localhost.localdomain (unknown [10.226.92.5])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0EDFA400752C;
        Wed,  9 Nov 2022 03:32:25 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH] pinctrl: renesas: pinctrl-rzv2m: remove unnecessary check from rzv2m_dt_node_to_map()
Date:   Tue,  8 Nov 2022 18:32:23 +0000
Message-Id: <20221108183223.3902097-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch removes the unnecessary check from rzv2m_dt_node_to_map()
as the ret value is already negative.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzv2m.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzv2m.c b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
index e8c18198bebd..62e911b7d007 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzv2m.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
@@ -397,8 +397,7 @@ static int rzv2m_dt_node_to_map(struct pinctrl_dev *pctldev,
 	ret = -EINVAL;
 
 done:
-	if (ret < 0)
-		rzv2m_dt_free_map(pctldev, *map, *num_maps);
+	rzv2m_dt_free_map(pctldev, *map, *num_maps);
 
 	return ret;
 }
-- 
2.25.1

