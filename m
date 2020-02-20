Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5651662B9
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 17:29:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728276AbgBTQ3q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 11:29:46 -0500
Received: from inva021.nxp.com ([92.121.34.21]:58946 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726871AbgBTQ3p (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 Feb 2020 11:29:45 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6343A200BED;
        Thu, 20 Feb 2020 17:29:43 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 54446200BC4;
        Thu, 20 Feb 2020 17:29:43 +0100 (CET)
Received: from fsr-ub1864-112.ea.freescale.net (fsr-ub1864-112.ea.freescale.net [10.171.82.98])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 2BDDD20328;
        Thu, 20 Feb 2020 17:29:42 +0100 (CET)
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
Subject: [PATCH v2 0/8] firmware: imx: Align imx SC msg structs to 4
Date:   Thu, 20 Feb 2020 18:29:31 +0200
Message-Id: <cover.1582216144.git.leonard.crestez@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The imx SC api strongly assumes that messages are composed out of
4-bytes words but some of our message structs have sizeof "6" and "7".

This produces many oopses with CONFIG_KASAN=y:

	BUG: KASAN: stack-out-of-bounds in imx_mu_send_data+0x108/0x1f0

It shouldn't cause an issues in normal use because these structs are
always allocated on the stack but tools like KASAN are very useful on
stable kernels.

Chnages since v1:
* Split into many patches with individual fixes: tags
Link to v1: https://patchwork.kernel.org/patch/11376909/

Leonard Crestez (8):
  clk: imx: Align imx sc clock msg structs to 4
  clk: imx: Align imx sc clock parent msg structs to 4
  firmware: imx: misc: Align imx sc msg structs to 4
  firmware: imx: scu-pd: Align imx sc msg structs to 4
  firmware: imx: Align imx_sc_msg_req_cpu_start to 4
  pinctrl: imx: scu: Align imx sc msg structs to 4
  rtc: imx-sc: Align imx sc msg structs to 4
  soc: imx-scu: Align imx sc msg structs to 4

 drivers/clk/imx/clk-scu.c               | 8 ++++----
 drivers/firmware/imx/misc.c             | 8 ++++----
 drivers/firmware/imx/scu-pd.c           | 2 +-
 drivers/pinctrl/freescale/pinctrl-scu.c | 4 ++--
 drivers/rtc/rtc-imx-sc.c                | 2 +-
 drivers/soc/imx/soc-imx-scu.c           | 2 +-
 6 files changed, 13 insertions(+), 13 deletions(-)

-- 
2.17.1

