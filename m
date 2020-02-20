Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7031662CD
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 17:29:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728697AbgBTQ3y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 11:29:54 -0500
Received: from inva021.nxp.com ([92.121.34.21]:59246 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728130AbgBTQ3y (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 Feb 2020 11:29:54 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 05B50201078;
        Thu, 20 Feb 2020 17:29:52 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id EAFE1200BC7;
        Thu, 20 Feb 2020 17:29:51 +0100 (CET)
Received: from fsr-ub1864-112.ea.freescale.net (fsr-ub1864-112.ea.freescale.net [10.171.82.98])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id CBACC20328;
        Thu, 20 Feb 2020 17:29:50 +0100 (CET)
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
Subject: [PATCH v2 7/8] rtc: imx-sc: Align imx sc msg structs to 4
Date:   Thu, 20 Feb 2020 18:29:38 +0200
Message-Id: <13404bac8360852d86c61fad5ae5f0c91ffc4cb6.1582216144.git.leonard.crestez@nxp.com>
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

Fixes: a3094fc1a15e ("rtc: imx-sc: add rtc alarm support")
Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-imx-sc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-imx-sc.c b/drivers/rtc/rtc-imx-sc.c
index cf2c12107f2b..a5f59e6f862e 100644
--- a/drivers/rtc/rtc-imx-sc.c
+++ b/drivers/rtc/rtc-imx-sc.c
@@ -35,11 +35,11 @@ struct imx_sc_msg_timer_rtc_set_alarm {
 	u8 mon;
 	u8 day;
 	u8 hour;
 	u8 min;
 	u8 sec;
-} __packed;
+} __packed __aligned(4);
 
 static int imx_sc_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
 	struct imx_sc_msg_timer_get_rtc_time msg;
 	struct imx_sc_rpc_msg *hdr = &msg.hdr;
-- 
2.17.1

