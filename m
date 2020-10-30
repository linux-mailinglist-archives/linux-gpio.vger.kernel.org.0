Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E53029FD7B
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Oct 2020 06:55:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725806AbgJ3Fzp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Oct 2020 01:55:45 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:47021 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgJ3Fzp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2020 01:55:45 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 09U5pfvL022493;
        Fri, 30 Oct 2020 13:51:41 +0800 (GMT-8)
        (envelope-from billy_tsai@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 30 Oct
 2020 13:54:56 +0800
From:   Billy Tsai <billy_tsai@aspeedtech.com>
To:     <andrew@aj.id.au>, <linus.walleij@linaro.org>, <joel@jms.id.au>,
        <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <BMC-SW@aspeedtech.com>
Subject: [PATCH v2] pinctrl: aspeed: Fix GPI only function problem.
Date:   Fri, 30 Oct 2020 13:54:50 +0800
Message-ID: <20201030055450.29613-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201027084417.10137-1-billy_tsai@aspeedtech.com>
References: <20201027084417.10137-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 09U5pfvL022493
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some gpio pin at aspeed soc is input only and the prefix name of these
pin is "GPI" only.
This patch fine-tune the condition of GPIO check from "GPIO" to "GPI"
and it will fix the usage error of banks D and E in the AST2400/AST2500
and banks T and U in the AST2600.

Fixes: 4d3d0e4272d8 ("pinctrl: Add core support for Aspeed SoCs")

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index e03ee78b2434..95c8d400ad59 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -286,13 +286,14 @@ int aspeed_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 static bool aspeed_expr_is_gpio(const struct aspeed_sig_expr *expr)
 {
 	/*
-	 * The signal type is GPIO if the signal name has "GPIO" as a prefix.
+	 * The signal type is GPIO if the signal name has "GPI" as a prefix.
 	 * strncmp (rather than strcmp) is used to implement the prefix
 	 * requirement.
 	 *
-	 * expr->signal might look like "GPIOT3" in the GPIO case.
+	 * expr->signal might look like "GPIOB1" in the GPIO case.
+	 * expr->signal might look like "GPIT0" in the GPI case.
 	 */
-	return strncmp(expr->signal, "GPIO", 4) == 0;
+	return strncmp(expr->signal, "GPI", 3) == 0;
 }
 
 static bool aspeed_gpio_in_exprs(const struct aspeed_sig_expr **exprs)
-- 
2.17.1

