Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED7477D59
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jul 2019 05:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbfG1DNz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 27 Jul 2019 23:13:55 -0400
Received: from hermes.aosc.io ([199.195.250.187]:52376 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725440AbfG1DNz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 27 Jul 2019 23:13:55 -0400
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender: icenowy@aosc.io)
        by hermes.aosc.io (Postfix) with ESMTPSA id CB4BF6F8D3;
        Sun, 28 Jul 2019 03:13:51 +0000 (UTC)
From:   Icenowy Zheng <icenowy@aosc.io>
To:     Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v5 2/6] clk: sunxi-ng: v3s: add missing clock slices for MMC2 module clocks
Date:   Sun, 28 Jul 2019 11:12:23 +0800
Message-Id: <20190728031227.49140-3-icenowy@aosc.io>
In-Reply-To: <20190728031227.49140-1-icenowy@aosc.io>
References: <20190728031227.49140-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The MMC2 clock slices are currently not defined in V3s CCU driver, which
makes MMC2 not working.

Fix this issue.

Fixes: d0f11d14b0bc ("clk: sunxi-ng: add support for V3s CCU")
Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
Changes in v5:
- Fix typo on hw_clk reference.

Patch introduced in v4.


 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
index 4eb68243e310..f79170e145df 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
@@ -513,6 +513,9 @@ static struct clk_hw_onecell_data sun8i_v3s_hw_clks = {
 		[CLK_MMC1]		= &mmc1_clk.common.hw,
 		[CLK_MMC1_SAMPLE]	= &mmc1_sample_clk.common.hw,
 		[CLK_MMC1_OUTPUT]	= &mmc1_output_clk.common.hw,
+		[CLK_MMC2]		= &mmc2_clk.common.hw,
+		[CLK_MMC2_SAMPLE]	= &mmc2_sample_clk.common.hw,
+		[CLK_MMC2_OUTPUT]	= &mmc2_output_clk.common.hw,
 		[CLK_CE]		= &ce_clk.common.hw,
 		[CLK_SPI0]		= &spi0_clk.common.hw,
 		[CLK_USB_PHY0]		= &usb_phy0_clk.common.hw,
-- 
2.21.0

