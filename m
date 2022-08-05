Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8712F58AACC
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Aug 2022 14:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237660AbiHEMW3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Aug 2022 08:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240671AbiHEMWZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Aug 2022 08:22:25 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACAB6B02
        for <linux-gpio@vger.kernel.org>; Fri,  5 Aug 2022 05:22:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 68663B828AC
        for <linux-gpio@vger.kernel.org>; Fri,  5 Aug 2022 12:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE384C4347C;
        Fri,  5 Aug 2022 12:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659702142;
        bh=b9e6f7QyGeXEQipqkQe1Q41JGjIlUd+dl7sHDQm0Ydk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AL//8Tj3FjVfZYalJJP/aVwVEmAdJouVah4hhxuD+9x2XaPW75jr1jPZdMjANUZIr
         Pa502tpQZJDZJqpHihD4hUnV/XHhVy+39rtoEyLEBuDxSGXbShnaxyr74R0RopwX7A
         wKHwvFlwWcxdnk7hrH8m6IpPqACgvjsAlCpmwtwWj/CXcGmCHXOoIVrJTga686a05b
         nd4dlCmEniIIABRvirNOcfOY8iPjMFqYbZjJI3cja6Jjq10lA2yEMJUs8D+Oyod64z
         ZVwcgNZvhrMkqEeuKQwHLvqUISRiK2aUkvL5Na/9hR3TR37NfKodJ2PiDAc28j7WEO
         r4FVOUvvj0caw==
Received: by pali.im (Postfix)
        id 6D972941; Fri,  5 Aug 2022 14:22:19 +0200 (CEST)
From:   =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To:     Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2 2/4] pinctrl: armada-37xx: Fix definitions for MPP pins 20-22
Date:   Fri,  5 Aug 2022 14:22:00 +0200
Message-Id: <20220805122202.23174-2-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220805122202.23174-1-pali@kernel.org>
References: <20220805122202.23174-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

All 3 MPP pins (20, 21 and 22) can be configured individually and also can
be configured to GPIO functions. Fix definitions for these MPP pins in
existing pin groups. After this change GPIO function can be enabled just
for one of these 3 pins.

Fixes: 87466ccd9401 ("pinctrl: armada-37xx: Add pin controller support for Armada 37xx")
Signed-off-by: Pali Rohár <pali@kernel.org>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 2b44c634ccb5..e5e5f0ea0e77 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -213,9 +213,11 @@ static struct armada_37xx_pin_group armada_37xx_sb_groups[] = {
 	PIN_GRP_GPIO("pcie1", 3, 1, BIT(5), "pcie"), /* this actually controls "pcie1_reset" */
 	PIN_GRP_GPIO("pcie1_clkreq", 4, 1, BIT(9), "pcie"),
 	PIN_GRP_GPIO("pcie1_wakeup", 5, 1, BIT(10), "pcie"),
-	PIN_GRP_GPIO("ptp", 20, 3, BIT(11) | BIT(12) | BIT(13), "ptp"),
-	PIN_GRP("ptp_clk", 21, 1, BIT(6), "ptp", "mii"),
-	PIN_GRP("ptp_trig", 22, 1, BIT(7), "ptp", "mii"),
+	PIN_GRP_GPIO("ptp", 20, 1, BIT(11), "ptp"),
+	PIN_GRP_GPIO_3("ptp_clk", 21, 1, BIT(6) | BIT(12), 0, BIT(6), BIT(12),
+		       "ptp", "mii"),
+	PIN_GRP_GPIO_3("ptp_trig", 22, 1, BIT(7) | BIT(13), 0, BIT(7), BIT(13),
+		       "ptp", "mii"),
 	PIN_GRP_GPIO_3("mii_col", 23, 1, BIT(8) | BIT(14), 0, BIT(8), BIT(14),
 		       "mii", "mii_err"),
 };
-- 
2.20.1

