Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81729292202
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Oct 2020 06:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728338AbgJSEuh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Oct 2020 00:50:37 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:42919 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726829AbgJSEuh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Oct 2020 00:50:37 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 09J4ltkq021159;
        Mon, 19 Oct 2020 12:47:55 +0800 (GMT-8)
        (envelope-from billy_tsai@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 19 Oct
 2020 12:50:30 +0800
From:   Billy Tsai <billy_tsai@aspeedtech.com>
To:     <linus.walleij@linaro.org>, <rentao.bupt@gmail.com>,
        <bgolaszewski@baylibre.com>, <joel@jms.id.au>, <andrew@aj.id.au>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>
CC:     <BMC-SW@aspeedtech.com>
Subject: [PATCH] gpio: aspeed: fix ast2600 bank properties
Date:   Mon, 19 Oct 2020 12:50:26 +0800
Message-ID: <20201019045026.10732-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 09J4ltkq021159
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GPIO_T is mapped to the most significant byte of input/output mask, and
the byte in "output" mask should be 0 because GPIO_T is input only. All
the other bits need to be 1 because GPIO_Q/R/S support both input and
output modes.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index d07bf2c3f136..f24754b3f6d1 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -1114,6 +1114,7 @@ static const struct aspeed_gpio_config ast2500_config =
 
 static const struct aspeed_bank_props ast2600_bank_props[] = {
 	/*     input	  output   */
+	{4, 0xffffffff,  0x00ffffff}, /* Q/R/S/T */
 	{5, 0xffffffff,  0xffffff00}, /* U/V/W/X */
 	{6, 0x0000ffff,  0x0000ffff}, /* Y/Z */
 	{ },
-- 
2.17.1

