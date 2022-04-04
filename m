Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9297C4F1868
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Apr 2022 17:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378570AbiDDPby (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Apr 2022 11:31:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353369AbiDDPbw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Apr 2022 11:31:52 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E05C25289
        for <linux-gpio@vger.kernel.org>; Mon,  4 Apr 2022 08:29:54 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6d4d:d9ec:3c70:7c2c])
        by xavier.telenet-ops.be with bizsmtp
        id EfVs2700G40M8zK01fVs8G; Mon, 04 Apr 2022 17:29:52 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nbOeO-008Mgy-08; Mon, 04 Apr 2022 17:29:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nbOeM-00CdT3-Ty; Mon, 04 Apr 2022 17:29:50 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/2] gpio: rcar: Add R-Car Gen4 support
Date:   Mon,  4 Apr 2022 17:29:49 +0200
Message-Id: <9ee064071b7d9b06df471e981cc6123ff19fead9.1649085875.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649085875.git.geert+renesas@glider.be>
References: <cover.1649085875.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

R-Car V3U (R8A779A0) was the first member of the R-Car Gen4 family.
Generalize the support for R-Car V3U to other SoCs in the R-Car Gen4
family by adding a family-specific compatible value.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
---
 drivers/gpio/gpio-rcar.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index bd2e16d6e21c40cf..5fc52341b98263c6 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -411,7 +411,7 @@ static const struct gpio_rcar_info gpio_rcar_info_gen3 = {
 	.has_inen = false,
 };
 
-static const struct gpio_rcar_info gpio_rcar_info_v3u = {
+static const struct gpio_rcar_info gpio_rcar_info_gen4 = {
 	.has_outdtsel = true,
 	.has_both_edge_trigger = true,
 	.has_always_in = true,
@@ -421,7 +421,7 @@ static const struct gpio_rcar_info gpio_rcar_info_v3u = {
 static const struct of_device_id gpio_rcar_of_table[] = {
 	{
 		.compatible = "renesas,gpio-r8a779a0",
-		.data = &gpio_rcar_info_v3u,
+		.data = &gpio_rcar_info_gen4,
 	}, {
 		.compatible = "renesas,rcar-gen1-gpio",
 		.data = &gpio_rcar_info_gen1,
@@ -431,6 +431,9 @@ static const struct of_device_id gpio_rcar_of_table[] = {
 	}, {
 		.compatible = "renesas,rcar-gen3-gpio",
 		.data = &gpio_rcar_info_gen3,
+	}, {
+		.compatible = "renesas,rcar-gen4-gpio",
+		.data = &gpio_rcar_info_gen4,
 	}, {
 		.compatible = "renesas,gpio-rcar",
 		.data = &gpio_rcar_info_gen1,
-- 
2.25.1

