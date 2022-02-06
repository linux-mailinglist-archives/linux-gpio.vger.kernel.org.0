Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 308824AB1D6
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Feb 2022 20:51:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242126AbiBFTvZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Feb 2022 14:51:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233917AbiBFTvY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Feb 2022 14:51:24 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C9EE1C043184
        for <linux-gpio@vger.kernel.org>; Sun,  6 Feb 2022 11:51:23 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.88,348,1635174000"; 
   d="scan'208";a="110327371"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 07 Feb 2022 04:46:20 +0900
Received: from localhost.localdomain (unknown [10.226.92.17])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2D35B40E9806;
        Mon,  7 Feb 2022 04:46:18 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] pinctrl: renesas: rzg2l: Improve rzg2l_gpio_register()
Date:   Sun,  6 Feb 2022 19:46:14 +0000
Message-Id: <20220206194614.13209-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220206194614.13209-1-biju.das.jz@bp.renesas.com>
References: <20220206194614.13209-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update rzg2l_gpio_register() to use driver data for chip->names
and check for gpio-range. This allows reusing the driver for
SoC's with different port pin definitions(eg:- RZ/G2UL SoC has
fewer ports compared to RZ/G2L and port pin definitions are
different).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index ccee9c9e2e22..cb805502fb0f 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1090,12 +1090,12 @@ static int rzg2l_gpio_register(struct rzg2l_pinctrl *pctrl)
 	}
 
 	if (of_args.args[0] != 0 || of_args.args[1] != 0 ||
-	    of_args.args[2] != ARRAY_SIZE(rzg2l_gpio_names)) {
+	    of_args.args[2] != pctrl->data->n_port_pins) {
 		dev_err(pctrl->dev, "gpio-ranges does not match selected SOC\n");
 		return -EINVAL;
 	}
 
-	chip->names = rzg2l_gpio_names;
+	chip->names = pctrl->data->port_pins;
 	chip->request = rzg2l_gpio_request;
 	chip->free = rzg2l_gpio_free;
 	chip->get_direction = rzg2l_gpio_get_direction;
-- 
2.17.1

