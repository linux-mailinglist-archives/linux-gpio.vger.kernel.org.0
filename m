Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7BA589A90
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Aug 2022 12:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbiHDKte (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Aug 2022 06:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238427AbiHDKta (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Aug 2022 06:49:30 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFFCA3DF39
        for <linux-gpio@vger.kernel.org>; Thu,  4 Aug 2022 03:49:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 75C0DB82510
        for <linux-gpio@vger.kernel.org>; Thu,  4 Aug 2022 10:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E3AC43141;
        Thu,  4 Aug 2022 10:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659610167;
        bh=1rb6O8LRdwEcTR40sjSsN+WfgRWcVvhq+f42Fyg1OW8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vBTzW6oI6uguIyuzonnR/66G5d4XkxfKmdqY+HsKz0HP3J3iDgWTH1gwIwSozqSD4
         W0olwUkNn2wXPdJHXXcBb2jw2YC5mDnnKiIUrqveYnTnwYQkIXOWDxsHsucGhc4/qG
         SGaGDk2JoReERhEetWk3wa2llIAzdAKv+Kc7mPamUJovmtWRij4UyLNnrF+hxoFKZN
         pUP07ZZfD7BusD9NJQ7RxSfF+FqiOtv/IHaKsws2h5wyQvL6Pc832Lc8yCuanFkWwB
         He4scGy1E+cQJS134EVg9rpJVROaNvjx1SgLvE5ueJRcr9aYiAtzBcPOnPL4viFEgO
         N1FIvFqdhOH1g==
Received: by pali.im (Postfix)
        id B7FFAB0F; Thu,  4 Aug 2022 12:49:24 +0200 (CEST)
From:   =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To:     Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: [PATCH 4/4] pinctrl: armada-37xx: Remove unused macro PIN_GRP()
Date:   Thu,  4 Aug 2022 12:49:15 +0200
Message-Id: <20220804104915.23719-4-pali@kernel.org>
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

Macro PIN_GRP() is not used, remove it.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 8978e6c15905..1b48c4db2f28 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -112,16 +112,6 @@ struct armada_37xx_pinctrl {
 	struct armada_37xx_pm_state	pm;
 };
 
-#define PIN_GRP(_name, _start, _nr, _mask, _func1, _func2)	\
-	{					\
-		.name = _name,			\
-		.start_pin = _start,		\
-		.npins = _nr,			\
-		.reg_mask = _mask,		\
-		.val = {0, _mask},		\
-		.funcs = {_func1, _func2}	\
-	}
-
 #define PIN_GRP_GPIO_0(_name, _start, _nr)	\
 	{					\
 		.name = _name,			\
-- 
2.20.1

