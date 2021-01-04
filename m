Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 287972E9430
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jan 2021 12:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbhADLin (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jan 2021 06:38:43 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:26167 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725840AbhADLim (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jan 2021 06:38:42 -0500
X-IronPort-AV: E=Sophos;i="5.78,473,1599490800"; 
   d="scan'208";a="67771793"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 04 Jan 2021 20:37:51 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2F2164003EA5;
        Mon,  4 Jan 2021 20:37:49 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] gpio: Kconfig: Update help description for GPIO_RCAR config
Date:   Mon,  4 Jan 2021 11:37:44 +0000
Message-Id: <20210104113744.10681-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The gpio-rcar driver also supports RZ/G SoC's, update the description to
reflect this.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
* Dropped SoC version numbers
---
 drivers/gpio/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index c70f46e80a3b..62ae296251eb 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -486,11 +486,11 @@ config GPIO_PXA
 	  Say yes here to support the PXA GPIO device
 
 config GPIO_RCAR
-	tristate "Renesas R-Car GPIO"
+	tristate "Renesas R-Car and RZ/G GPIO support"
 	depends on ARCH_RENESAS || COMPILE_TEST
 	select GPIOLIB_IRQCHIP
 	help
-	  Say yes here to support GPIO on Renesas R-Car SoCs.
+	  Say yes here to support GPIO on Renesas R-Car or RZ/G SoCs.
 
 config GPIO_RDA
 	bool "RDA Micro GPIO controller support"
-- 
2.17.1

