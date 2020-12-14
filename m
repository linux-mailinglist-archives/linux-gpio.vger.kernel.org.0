Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC6EF2D9190
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 02:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731697AbgLNB2K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 20:28:10 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:41784 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437697AbgLNB2A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 20:28:00 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 0BE1NtDr074558;
        Mon, 14 Dec 2020 09:23:55 +0800 (GMT-8)
        (envelope-from billy_tsai@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 14 Dec
 2020 09:27:05 +0800
From:   Billy Tsai <billy_tsai@aspeedtech.com>
To:     <andrew@aj.id.au>, <linus.walleij@linaro.org>, <joel@jms.id.au>,
        <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <BMC-SW@aspeedtech.com>
Subject: [PATCH v2] driver: aspeed: g6: Fix PWMG0 pinctrl setting
Date:   Mon, 14 Dec 2020 09:27:00 +0800
Message-ID: <20201214012700.23560-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <D9745FBC-BEA7-421E-B56C-21EA9AAE094E@aspeedtech.com>
References: <D9745FBC-BEA7-421E-B56C-21EA9AAE094E@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 0BE1NtDr074558
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The SCU offset for signal PWM8 in group PWM8G0 is wrong, fix it from
SCU414 to SCU4B4.
Besides that, When PWM8~15 of PWMG0 set it needs to clear SCU414 bits
at the same time.

Fixes: 2eda1cdec49f ("pinctrl: aspeed: Add AST2600 pinmux support")

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 24 ++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index b673a44ffa3b..1dfb12a5b2ce 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -367,49 +367,57 @@ FUNC_GROUP_DECL(RMII4, F24, E23, E24, E25, C25, C24, B26, B25, B24);
 
 #define D22 40
 SIG_EXPR_LIST_DECL_SESG(D22, SD1CLK, SD1, SIG_DESC_SET(SCU414, 8));
-SIG_EXPR_LIST_DECL_SEMG(D22, PWM8, PWM8G0, PWM8, SIG_DESC_SET(SCU414, 8));
+SIG_EXPR_LIST_DECL_SEMG(D22, PWM8, PWM8G0, PWM8, SIG_DESC_SET(SCU4B4, 8),
+			SIG_DESC_CLEAR(SCU414, 8));
 PIN_DECL_2(D22, GPIOF0, SD1CLK, PWM8);
 GROUP_DECL(PWM8G0, D22);
 
 #define E22 41
 SIG_EXPR_LIST_DECL_SESG(E22, SD1CMD, SD1, SIG_DESC_SET(SCU414, 9));
-SIG_EXPR_LIST_DECL_SEMG(E22, PWM9, PWM9G0, PWM9, SIG_DESC_SET(SCU4B4, 9));
+SIG_EXPR_LIST_DECL_SEMG(E22, PWM9, PWM9G0, PWM9, SIG_DESC_SET(SCU4B4, 9),
+			SIG_DESC_CLEAR(SCU414, 9));
 PIN_DECL_2(E22, GPIOF1, SD1CMD, PWM9);
 GROUP_DECL(PWM9G0, E22);
 
 #define D23 42
 SIG_EXPR_LIST_DECL_SESG(D23, SD1DAT0, SD1, SIG_DESC_SET(SCU414, 10));
-SIG_EXPR_LIST_DECL_SEMG(D23, PWM10, PWM10G0, PWM10, SIG_DESC_SET(SCU4B4, 10));
+SIG_EXPR_LIST_DECL_SEMG(D23, PWM10, PWM10G0, PWM10, SIG_DESC_SET(SCU4B4, 10),
+			SIG_DESC_CLEAR(SCU414, 10));
 PIN_DECL_2(D23, GPIOF2, SD1DAT0, PWM10);
 GROUP_DECL(PWM10G0, D23);
 
 #define C23 43
 SIG_EXPR_LIST_DECL_SESG(C23, SD1DAT1, SD1, SIG_DESC_SET(SCU414, 11));
-SIG_EXPR_LIST_DECL_SEMG(C23, PWM11, PWM11G0, PWM11, SIG_DESC_SET(SCU4B4, 11));
+SIG_EXPR_LIST_DECL_SEMG(C23, PWM11, PWM11G0, PWM11, SIG_DESC_SET(SCU4B4, 11),
+			SIG_DESC_CLEAR(SCU414, 11));
 PIN_DECL_2(C23, GPIOF3, SD1DAT1, PWM11);
 GROUP_DECL(PWM11G0, C23);
 
 #define C22 44
 SIG_EXPR_LIST_DECL_SESG(C22, SD1DAT2, SD1, SIG_DESC_SET(SCU414, 12));
-SIG_EXPR_LIST_DECL_SEMG(C22, PWM12, PWM12G0, PWM12, SIG_DESC_SET(SCU4B4, 12));
+SIG_EXPR_LIST_DECL_SEMG(C22, PWM12, PWM12G0, PWM12, SIG_DESC_SET(SCU4B4, 12),
+			SIG_DESC_CLEAR(SCU414, 12));
 PIN_DECL_2(C22, GPIOF4, SD1DAT2, PWM12);
 GROUP_DECL(PWM12G0, C22);
 
 #define A25 45
 SIG_EXPR_LIST_DECL_SESG(A25, SD1DAT3, SD1, SIG_DESC_SET(SCU414, 13));
-SIG_EXPR_LIST_DECL_SEMG(A25, PWM13, PWM13G0, PWM13, SIG_DESC_SET(SCU4B4, 13));
+SIG_EXPR_LIST_DECL_SEMG(A25, PWM13, PWM13G0, PWM13, SIG_DESC_SET(SCU4B4, 13),
+			SIG_DESC_CLEAR(SCU414, 13));
 PIN_DECL_2(A25, GPIOF5, SD1DAT3, PWM13);
 GROUP_DECL(PWM13G0, A25);
 
 #define A24 46
 SIG_EXPR_LIST_DECL_SESG(A24, SD1CD, SD1, SIG_DESC_SET(SCU414, 14));
-SIG_EXPR_LIST_DECL_SEMG(A24, PWM14, PWM14G0, PWM14, SIG_DESC_SET(SCU4B4, 14));
+SIG_EXPR_LIST_DECL_SEMG(A24, PWM14, PWM14G0, PWM14, SIG_DESC_SET(SCU4B4, 14),
+			SIG_DESC_CLEAR(SCU414, 14));
 PIN_DECL_2(A24, GPIOF6, SD1CD, PWM14);
 GROUP_DECL(PWM14G0, A24);
 
 #define A23 47
 SIG_EXPR_LIST_DECL_SESG(A23, SD1WP, SD1, SIG_DESC_SET(SCU414, 15));
-SIG_EXPR_LIST_DECL_SEMG(A23, PWM15, PWM15G0, PWM15, SIG_DESC_SET(SCU4B4, 15));
+SIG_EXPR_LIST_DECL_SEMG(A23, PWM15, PWM15G0, PWM15, SIG_DESC_SET(SCU4B4, 15),
+			SIG_DESC_CLEAR(SCU414, 15));
 PIN_DECL_2(A23, GPIOF7, SD1WP, PWM15);
 GROUP_DECL(PWM15G0, A23);
 
-- 
2.17.1

