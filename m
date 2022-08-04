Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D855589A92
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Aug 2022 12:49:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbiHDKtd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Aug 2022 06:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238145AbiHDKta (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Aug 2022 06:49:30 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5309E5019F
        for <linux-gpio@vger.kernel.org>; Thu,  4 Aug 2022 03:49:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 01150B824E4
        for <linux-gpio@vger.kernel.org>; Thu,  4 Aug 2022 10:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F576C43470;
        Thu,  4 Aug 2022 10:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659610166;
        bh=NRYgkbOBZl35JeLYiTrlSXLZ0yPBiRFJgFdAcvvkHxU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=g2ik1eaEM/rZo+hFWBRmv3Rk+FDT+ZJALZe7ymjJyFELnmquWZgpeqcp991scGS8l
         5o1Tw95zcFU2HSUVE+5coEt2Cw/+tqdI281hr5yBGGN9A1azI7n33or5w7DSnU0dLf
         FamgLbC9AnUfZwDPndvH31IKMBrug8ZWJktIA0vovLV5pMb/y8tA8Szmh903v2v5ZJ
         VLND6qC1KDVC4gHhCjM7mO6Vf0oayXaYXYWZynBi5OXffA78vBbE8lD92KdKYviqwv
         Kyj84Y5MHLAzF5SPdCUP9yQRypFl61tC2HSZsudY2+zVJy3DeEnx2TOa+maRzxG6nt
         aUQqnLrkpzpUA==
Received: by pali.im (Postfix)
        id 0FF91B01; Thu,  4 Aug 2022 12:49:24 +0200 (CEST)
From:   =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To:     Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: [PATCH 3/4] pinctrl: armada-37xx: Checks for errors in gpio_request_enable callback
Date:   Thu,  4 Aug 2022 12:49:14 +0200
Message-Id: <20220804104915.23719-3-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220804104915.23719-1-pali@kernel.org>
References: <20220804104915.23719-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Now when all MPP pins are properly defined and every MPP pin has GPIO
function, always checks for errors in armada_37xx_gpio_request_enable()
function when calling armada_37xx_pmx_set_by_name(). Function
armada_37xx_pmx_set_by_name() should not return "not supported" error
anymore for any GPIO pin when requesting GPIO mode.

Fixes: 87466ccd9401 ("pinctrl: armada-37xx: Add pin controller support for Armada 37xx")
Signed-off-by: Pali Rohár <pali@kernel.org>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index e5e5f0ea0e77..8978e6c15905 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -503,8 +503,11 @@ static int armada_37xx_gpio_request_enable(struct pinctrl_dev *pctldev,
 
 	dev_dbg(info->dev, "requesting gpio %d\n", offset);
 
-	while ((group = armada_37xx_find_next_grp_by_pin(info, offset, &grp)))
-		armada_37xx_pmx_set_by_name(pctldev, "gpio", group);
+	while ((group = armada_37xx_find_next_grp_by_pin(info, offset, &grp))) {
+		ret = armada_37xx_pmx_set_by_name(pctldev, "gpio", group);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
-- 
2.20.1

