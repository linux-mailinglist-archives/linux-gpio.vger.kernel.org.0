Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 178AF2DCB18
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Dec 2020 03:50:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727417AbgLQCuO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Dec 2020 21:50:14 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:16681 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727348AbgLQCuO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Dec 2020 21:50:14 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 0BH2k1jh041831;
        Thu, 17 Dec 2020 10:46:01 +0800 (GMT-8)
        (envelope-from billy_tsai@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 17 Dec
 2020 10:49:21 +0800
From:   Billy Tsai <billy_tsai@aspeedtech.com>
To:     <andrew@aj.id.au>, <linus.walleij@linaro.org>, <joel@jms.id.au>,
        <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <BMC-SW@aspeedtech.com>
Subject: [PATCH v3] driver: aspeed: g6: Fix PWMG0 pinctrl setting
Date:   Thu, 17 Dec 2020 10:49:12 +0800
Message-ID: <20201217024912.3198-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <1e823780-b1ef-42dd-bb60-321b4d482d31@www.fastmail.com>
References: <1e823780-b1ef-42dd-bb60-321b4d482d31@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 0BH2k1jh041831
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The SCU offset for signal PWM8 in group PWM8G0 is wrong, fix it from
SCU414 to SCU4B4.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index b673a44ffa3b..aa53e9d3489b 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -367,7 +367,7 @@ FUNC_GROUP_DECL(RMII4, F24, E23, E24, E25, C25, C24, B26, B25, B24);
 
 #define D22 40
 SIG_EXPR_LIST_DECL_SESG(D22, SD1CLK, SD1, SIG_DESC_SET(SCU414, 8));
-SIG_EXPR_LIST_DECL_SEMG(D22, PWM8, PWM8G0, PWM8, SIG_DESC_SET(SCU414, 8));
+SIG_EXPR_LIST_DECL_SEMG(D22, PWM8, PWM8G0, PWM8, SIG_DESC_SET(SCU4B4, 8));
 PIN_DECL_2(D22, GPIOF0, SD1CLK, PWM8);
 GROUP_DECL(PWM8G0, D22);
 
-- 
2.17.1

