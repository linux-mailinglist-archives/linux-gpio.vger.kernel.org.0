Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F14E11662BE
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 17:29:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728555AbgBTQ3s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 11:29:48 -0500
Received: from inva020.nxp.com ([92.121.34.13]:34970 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726871AbgBTQ3s (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 Feb 2020 11:29:48 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C24B81A16C8;
        Thu, 20 Feb 2020 17:29:45 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B5BD91A0D00;
        Thu, 20 Feb 2020 17:29:45 +0100 (CET)
Received: from fsr-ub1864-112.ea.freescale.net (fsr-ub1864-112.ea.freescale.net [10.171.82.98])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id B2F6420328;
        Thu, 20 Feb 2020 17:29:44 +0100 (CET)
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>
Cc:     Fabio Estevam <fabio.estevam@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Anson Huang <anson.huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Franck LENORMAND <franck.lenormand@nxp.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v2 2/8] clk: imx: Align imx sc clock parent msg structs to 4
Date:   Thu, 20 Feb 2020 18:29:33 +0200
Message-Id: <aad021e432b3062c142973d09b766656eec18fde.1582216144.git.leonard.crestez@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1582216144.git.leonard.crestez@nxp.com>
References: <cover.1582216144.git.leonard.crestez@nxp.com>
In-Reply-To: <cover.1582216144.git.leonard.crestez@nxp.com>
References: <cover.1582216144.git.leonard.crestez@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The imx SC api strongly assumes that messages are composed out of
4-bytes words but some of our message structs have odd sizeofs.

This produces many oopses with CONFIG_KASAN=y.

Fix by marking with __aligned(4).

Fixes: 666aed2d13ee ("clk: imx: scu: add set parent support")
Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
---
 drivers/clk/imx/clk-scu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 3c5c42d8833e..b8b2072742a5 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -82,11 +82,11 @@ struct imx_sc_msg_get_clock_parent {
 	struct imx_sc_rpc_msg hdr;
 	union {
 		struct req_get_clock_parent {
 			__le16 resource;
 			u8 clk;
-		} __packed req;
+		} __packed __aligned(4) req;
 		struct resp_get_clock_parent {
 			u8 parent;
 		} resp;
 	} data;
 };
-- 
2.17.1

