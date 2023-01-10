Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20DEB66476D
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jan 2023 18:30:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232310AbjAJRac (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Jan 2023 12:30:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232239AbjAJRab (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Jan 2023 12:30:31 -0500
X-Greylist: delayed 31324 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 10 Jan 2023 09:30:30 PST
Received: from xtrwhcvx.outbound-mail.sendgrid.net (xtrwhcvx.outbound-mail.sendgrid.net [167.89.12.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BEB857920
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jan 2023 09:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=from:subject:mime-version:to:cc:content-transfer-encoding:
        content-type:cc:content-type:from:subject:to;
        s=s1; bh=Enqo4zcrTsUPyc2S07hAbw7HI1eT9vQAq0wVBVB7Yd4=;
        b=aBZxGv/2ep3ucOFExFH5RAstX7MhM3a4tnjQBBwqkhLHaIXPW2XKeX6NL8mLmBk0Ydfv
        Xi+MO9LnQ+4EEI/svV4PTSjB3iKfIOKOrErPu2ehronm8pJQJJ3qBZi6Dm4wi6OTd71Wpi
        7RXqFzTIYeuNNs30TVpErn0qCiy87E/VNc90WATrnmnR514xlH/7Lgs7mYSaFYg/CcLd3+
        1Aqhi4Jx+2M+Yr0huhp42xeME4nRTKH5+xhznO1u24h+rRGECVtO2pSvSaIWJWBwpC5ALj
        tyaag9D8NDw3NjajUhECLUwGDhASUvJGCX7qkIpiD+KDyv/8bvf1aYzLRtmQl07A==
Received: by filterdrecv-69c5db5cf4-v9q2s with SMTP id filterdrecv-69c5db5cf4-v9q2s-1-63BDA095-34
        2023-01-10 17:29:58.008202659 +0000 UTC m=+4645307.329602419
Received: from bionic.localdomain (unknown)
        by geopod-ismtpd-5-2 (SG)
        with ESMTP
        id uBQmAU3MRMi3h8v1Qw4eHg
        Tue, 10 Jan 2023 17:29:57.639 +0000 (UTC)
From:   Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH] pinctrl: rockchip: fix reading pull type on rk3568
Date:   Tue, 10 Jan 2023 17:29:58 +0000 (UTC)
Message-Id: <20230110172955.1258840-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h2fH6Ac=2FiJCsTv9mT?=
 =?us-ascii?Q?SoNlCMkYTzJBaSMZUI61OYiMl+cON9WWqgEivQy?=
 =?us-ascii?Q?7cFZLkZUUePEvFYf4d8rr=2Fy2NX9HfLR0+0DOW+S?=
 =?us-ascii?Q?5l=2FKoIyFzQ8rY0o2+FEzxWbDUUU2zhC3cG4VfRV?=
 =?us-ascii?Q?NzOw4d+x9kvSGTQYyxMdTlvZImtj=2FLe5tRlF9Y?=
To:     Linus Walleij <linus.walleij@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     Jianqun Xu <jay.xu@rock-chips.com>, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Jonas Karlman <jonas@kwiboo.se>
X-Entity-ID: P7KYpSJvGCELWjBME/J5tg==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When reading pinconf-pins from debugfs it fails to get the configured pull
type on RK3568, "unsupported pinctrl type" error messages is also reported.

Fix this by adding support for RK3568 in rockchip_get_pull, including a
reverse of the pull-up value swap applied in rockchip_set_pull so that
pull-up is correctly reported in pinconf-pins.
Also update the workaround comment to reflect affected pins, GPIO0_D3-D6.

Fixes: c0dadc0e47a8 ("pinctrl: rockchip: add support for rk3568")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/pinctrl/pinctrl-rockchip.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 849d5fa2a362..5eeac92f610a 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -2436,10 +2436,19 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
 	case RK3308:
 	case RK3368:
 	case RK3399:
+	case RK3568:
 	case RK3588:
 		pull_type = bank->pull_type[pin_num / 8];
 		data >>= bit;
 		data &= (1 << RK3188_PULL_BITS_PER_PIN) - 1;
+		/*
+		 * In the TRM, pull-up being 1 for everything except the GPIO0_D3-D6,
+		 * where that pull up value becomes 3.
+		 */
+		if (ctrl->type == RK3568 && bank->bank_num == 0 && pin_num >= 27 && pin_num <= 30) {
+			if (data == 3)
+				data = 1;
+		}
 
 		return rockchip_pull_list[pull_type][data];
 	default:
@@ -2497,7 +2506,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 			}
 		}
 		/*
-		 * In the TRM, pull-up being 1 for everything except the GPIO0_D0-D6,
+		 * In the TRM, pull-up being 1 for everything except the GPIO0_D3-D6,
 		 * where that pull up value becomes 3.
 		 */
 		if (ctrl->type == RK3568 && bank->bank_num == 0 && pin_num >= 27 && pin_num <= 30) {
-- 
2.39.0

