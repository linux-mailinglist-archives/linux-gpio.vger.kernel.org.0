Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16ACC4CB83C
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Mar 2022 09:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230473AbiCCIDc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Mar 2022 03:03:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230469AbiCCID3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Mar 2022 03:03:29 -0500
Received: from smtpproxy21.qq.com (smtpbg701.qq.com [203.205.195.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13DB43818C
        for <linux-gpio@vger.kernel.org>; Thu,  3 Mar 2022 00:02:43 -0800 (PST)
X-QQ-mid: bizesmtp70t1646294533t7gdvkex
Received: from localhost.localdomain (unknown [58.240.82.166])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Thu, 03 Mar 2022 16:02:07 +0800 (CST)
X-QQ-SSF: 01400000002000C0G000000A0000000
X-QQ-FEAT: rn/rQ7Qm5gXNw165vUDyUK9zHAQ88wOFHpozS3Lroq74ASFiOMJS8J86lw9gQ
        YN9M0Q3sS8X2HFcji9yAWp44+0/tutHqM/dCXxg5jub9IirSt2YbjW2ltxxBzNegyJ0Pyob
        blyxyDzCRl5ycdVRkTgqe/B4FM6brcPHQVwA/7nGG6LqeLGtJoW3y1X+8k45IKptySPJ2qh
        FcSMRAdzhAkvl+CPVr1AqSMpUj4bHMhg0hhA3LpPsKsI1gFSw+gL8CmWF7hXusymYGRFCWf
        oV2JXtvUjrELZuUXEj7L3FoPridtasMBbfgJmOClAoLGCoR4YSZRrXg0Fa4Z1bJt/Zi5nhf
        Ps/mhlyXWzuTD3O60gI2qZ/OxfArbb5+hHXgKDjVNx7ERElGus=
X-QQ-GoodBg: 1
From:   Meng Tang <tangmeng@uniontech.com>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Meng Tang <tangmeng@uniontech.com>
Subject: [PATCH] pinctrl: berlin: fix error return code of berlin_pinctrl_build_state()
Date:   Thu,  3 Mar 2022 16:02:06 +0800
Message-Id: <20220303080206.16463-1-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When krealloc() fails and pctrl->functions is NULL, no error
return code of berlin_pinctrl_build_state() is assigned.
To fix this bug, ret is assigned with -ENOMEM when pctrl->functions
is NULL.

Signed-off-by: Meng Tang <tangmeng@uniontech.com>
---
 drivers/pinctrl/berlin/berlin.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/berlin.c
index b17a03cf87be..a073eedd71aa 100644
--- a/drivers/pinctrl/berlin/berlin.c
+++ b/drivers/pinctrl/berlin/berlin.c
@@ -233,6 +233,8 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 	pctrl->functions = krealloc(pctrl->functions,
 				    pctrl->nfunctions * sizeof(*pctrl->functions),
 				    GFP_KERNEL);
+	if (!pctrl->functions)
+		return -ENOMEM;
 
 	/* map functions to theirs groups */
 	for (i = 0; i < pctrl->desc->ngroups; i++) {
-- 
2.20.1



