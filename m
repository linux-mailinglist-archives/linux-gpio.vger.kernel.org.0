Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EFB7283284
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Oct 2020 10:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbgJEIuF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Oct 2020 04:50:05 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:46833 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgJEIuF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2020 04:50:05 -0400
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
        by twspam01.aspeedtech.com with ESMTP id 09588rd6047576
        for <linux-gpio@vger.kernel.org>; Mon, 5 Oct 2020 16:08:53 +0800 (GMT-8)
        (envelope-from chiawei_wang@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 09588T6K047498;
        Mon, 5 Oct 2020 16:08:31 +0800 (GMT-8)
        (envelope-from chiawei_wang@aspeedtech.com)
Received: from ChiaWeiWang-PC.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 5 Oct
 2020 16:28:11 +0800
From:   "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
To:     <lee.jones@linaro.org>, <robh+dt@kernel.org>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <minyard@acm.org>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>, <linus.walleij@linaro.org>,
        <haiyue.wang@linux.intel.com>, <cyrilbur@gmail.com>,
        <rlippert@google.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>, <linux-gpio@vger.kernel.org>
CC:     <ryan_chen@aspeedtech.com>
Subject: [PATCH v2 4/5] pinctrl: aspeed-g5: Fix LPC register offsets
Date:   Mon, 5 Oct 2020 16:28:05 +0800
Message-ID: <20201005082806.28899-5-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201005082806.28899-1-chiawei_wang@aspeedtech.com>
References: <20201005082806.28899-1-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 09588T6K047498
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The LPC register offsets are fixed to adapt to the LPC DTS change,
where the LPC partitioning is removed.

Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 0cab4c2576e2..98e62333fa54 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -60,7 +60,7 @@
 #define COND2		{ ASPEED_IP_SCU, SCU94, GENMASK(1, 0), 0, 0 }
 
 /* LHCR0 is offset from the end of the H8S/2168-compatible registers */
-#define LHCR0		0x20
+#define LHCR0		0xa0
 #define GFX064		0x64
 
 #define B14 0
-- 
2.17.1

