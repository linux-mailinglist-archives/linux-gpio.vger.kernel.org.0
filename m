Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E99972E80F2
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Dec 2020 16:33:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgLaPco (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Dec 2020 10:32:44 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:26523 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726830AbgLaPcn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 31 Dec 2020 10:32:43 -0500
X-IronPort-AV: E=Sophos;i="5.78,464,1599490800"; 
   d="scan'208";a="67552553"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Jan 2021 00:31:52 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5995F4009866;
        Fri,  1 Jan 2021 00:31:50 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] gpio: rcar: Remove redundant compatible values
Date:   Thu, 31 Dec 2020 15:31:41 +0000
Message-Id: <20201231153141.25525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The mandatory compatible values 'renesas,rcar-gen{1,2,3}-gpio' have been
already added to all the respective R-Car Gen{1,2,3} SoC DTSI files,
remove the redundant device specific values from the driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/gpio/gpio-rcar.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 0b572dbc4a36..f3b8c4b44cab 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -392,33 +392,6 @@ static const struct gpio_rcar_info gpio_rcar_info_gen2 = {
 
 static const struct of_device_id gpio_rcar_of_table[] = {
 	{
-		.compatible = "renesas,gpio-r8a7743",
-		/* RZ/G1 GPIO is identical to R-Car Gen2. */
-		.data = &gpio_rcar_info_gen2,
-	}, {
-		.compatible = "renesas,gpio-r8a7790",
-		.data = &gpio_rcar_info_gen2,
-	}, {
-		.compatible = "renesas,gpio-r8a7791",
-		.data = &gpio_rcar_info_gen2,
-	}, {
-		.compatible = "renesas,gpio-r8a7792",
-		.data = &gpio_rcar_info_gen2,
-	}, {
-		.compatible = "renesas,gpio-r8a7793",
-		.data = &gpio_rcar_info_gen2,
-	}, {
-		.compatible = "renesas,gpio-r8a7794",
-		.data = &gpio_rcar_info_gen2,
-	}, {
-		.compatible = "renesas,gpio-r8a7795",
-		/* Gen3 GPIO is identical to Gen2. */
-		.data = &gpio_rcar_info_gen2,
-	}, {
-		.compatible = "renesas,gpio-r8a7796",
-		/* Gen3 GPIO is identical to Gen2. */
-		.data = &gpio_rcar_info_gen2,
-	}, {
 		.compatible = "renesas,rcar-gen1-gpio",
 		.data = &gpio_rcar_info_gen1,
 	}, {
-- 
2.17.1

