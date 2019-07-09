Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10AB963449
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2019 12:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbfGIK3f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jul 2019 06:29:35 -0400
Received: from mx.socionext.com ([202.248.49.38]:38488 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726560AbfGIK3f (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Jul 2019 06:29:35 -0400
Received: from unknown (HELO kinkan-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 09 Jul 2019 19:29:33 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
        by kinkan-ex.css.socionext.com (Postfix) with ESMTP id F04AD18022B;
        Tue,  9 Jul 2019 19:29:33 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Tue, 9 Jul 2019 19:29:33 +0900
Received: from plum.e01.socionext.com (unknown [10.213.132.32])
        by kinkan.css.socionext.com (Postfix) with ESMTP id A8A4C1A14E3;
        Tue,  9 Jul 2019 19:29:33 +0900 (JST)
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-gpio@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 5/5] pinctrl: uniphier: Fix Pro5 SD pin-mux setting
Date:   Tue,  9 Jul 2019 19:29:16 +0900
Message-Id: <1562668156-12927-6-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562668156-12927-1-git-send-email-hayashi.kunihiko@socionext.com>
References: <1562668156-12927-1-git-send-email-hayashi.kunihiko@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SD uses the following pins starting from 247:
    SDCD, SDWP, SDVOLC, SDCLK, SDCMD, SDDAT{0,1,2,3}

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c
index 577f12e..22ce0a5 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c
@@ -807,7 +807,7 @@ static const unsigned nand_pins[] = {19, 20, 21, 22, 23, 24, 25, 28, 29, 30,
 static const int nand_muxvals[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
 static const unsigned nand_cs1_pins[] = {26, 27};
 static const int nand_cs1_muxvals[] = {0, 0};
-static const unsigned sd_pins[] = {250, 251, 252, 253, 254, 255, 256, 257, 258};
+static const unsigned sd_pins[] = {247, 248, 249, 250, 251, 252, 253, 254, 255};
 static const int sd_muxvals[] = {0, 0, 0, 0, 0, 0, 0, 0, 0};
 static const unsigned spi0_pins[] = {120, 121, 122, 123};
 static const int spi0_muxvals[] = {0, 0, 0, 0};
-- 
2.7.4

