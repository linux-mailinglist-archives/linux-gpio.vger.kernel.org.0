Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D793C58AACD
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Aug 2022 14:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240152AbiHEMWa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Aug 2022 08:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240676AbiHEMW0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Aug 2022 08:22:26 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52ACAE74
        for <linux-gpio@vger.kernel.org>; Fri,  5 Aug 2022 05:22:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0DB6DB828B0
        for <linux-gpio@vger.kernel.org>; Fri,  5 Aug 2022 12:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A561C43142;
        Fri,  5 Aug 2022 12:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659702142;
        bh=uaT7n1Hd/gr9DCqS4OpUxjqFwYoxHR6+Y3niYA4mBeQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Yj68D56oWgr52vEBrwP0t4J4f0u/0eTdCRFusSsO0mT84Kq1fudMkYZv+5EJ+S4M2
         ntN6XEXI8vox5Qudd9TunnPpXEytEJR3RnTQ3to+uhKgO7LOS26zE/apLNowpeqY0u
         0AYZKvaUpcAAgSs0MqdrmQOyMHxrmOOf0XxeFPymNX9CL0a1ezTKgU0cSB9ECCN5+1
         NRIEBygkzdmDQiZwWZnuABY5ExIvzNDH1t+fzOkZrdvpCXqMTfd+xvgmBIkW7iDUyP
         K8qBlnHfrRmwb78AE3LfCpcV8p/hMCvgKIE3c1htCy+xDZbm8C/cRXo33rgbWUnb40
         8M9piAQ6VOlnQ==
Received: by pali.im (Postfix)
        id 383AEA52; Fri,  5 Aug 2022 14:22:20 +0200 (CEST)
From:   =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To:     Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2 4/4] pinctrl: armada-37xx: Remove unused macro PIN_GRP()
Date:   Fri,  5 Aug 2022 14:22:02 +0200
Message-Id: <20220805122202.23174-4-pali@kernel.org>
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

Macro PIN_GRP() is not used, remove it.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 3227f70922fc..3f76899eb8e3 100644
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

