Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3544C9E45
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Mar 2022 08:12:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239823AbiCBHNe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Mar 2022 02:13:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235356AbiCBHNb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Mar 2022 02:13:31 -0500
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 906C045AF8
        for <linux-gpio@vger.kernel.org>; Tue,  1 Mar 2022 23:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
        s=s201512; t=1646205161;
        bh=huLhAprZxNDaMXRVKOWtreTvo8DAszHRZkmEmGgVR38=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=QNYoZ3UnPeoNreeqCTDWJSc0MiETPizJ4P9nVd+deqfaTHBCVjFfRFEzZP2Y4ZtBC
         Nh6AKXXYVCh9QMZB+fqweG/U6MutdBEBH36sOE6idvry/JrGRbSUV7ipsW9QyzkXs1
         7QTFJk74vjpDbS79QjTXTuciRliUzFABwVY/U8r0=
Received: from localhost.localdomain ([111.193.130.237])
        by newxmesmtplogicsvrsza5.qq.com (NewEsmtp) with SMTP
        id 318A5C44; Wed, 02 Mar 2022 15:12:24 +0800
X-QQ-mid: xmsmtpt1646205144tuekiyquq
Message-ID: <tencent_68563A6FDF372313228831913CC3A7041108@qq.com>
X-QQ-XMAILINFO: NvH2zBBgt3uT/qA3FFsWIeCWY5xGY66X3sdjzusKNG2NDIdqMMpyVJyebZC+nb
         SHySQBPC0C1Py5xE62Ric6H8oKFb3v6Ppu56ol6FlLdUxFiqKBdl3eXo44guLhqxYKcDypwI4UJH
         c1FhdWpD3zR+cAWjLDp9uIcHWrxLBxxHdalVN/4YDGW8/mQgxG+1aqSLPO7QCBxFJzlpQhoc9llb
         Pybf6HeMQsJFSr6eX3yhlSrzxutKMo1wr5W24jbVsj54rWDAf0x3nZ2M0B06A1Smt1adnEHtkX29
         DOP8wf2GCUiugjJ9fwbR+P38DnSLvreHVBDDHU8SgdkJ8EQ15fHQv2Tyd4lykylZ+lB1fbGSDGDB
         xnFZF7O8MXIkuy9Ss7baqjarwfGHpP251HrmFTD7VoEayx4bJavltGqCSpUiUxGCSFqgVj+uYGor
         dvX061IjIRlZYWJwYRvyhIl2gFWzEGMqjkJ49PhT3LDIO7n+Hv60JftNpXUf8EAyiSCa4X7UAvNi
         jJl0lXrxL2oBAJtWxFcenJcbHjZa6XfQXfYkaYdNN8ju0upzlOSpFklyFnbEpJNS8O5At4nIAYuI
         sbrCI7EiRvtO5gUzyK/MXxP49oOE1LOtMsCSTlbEslAm0ksX4GlYHbIGaOrJLhunftMIPmjpRDZD
         nhu+ZWmv8/f4pNYF4AhiHkVgv7ALQTg9ebP6qt9DlQ3UA3o+ChasNr1+mWldM2nOE9PVd9uBI8BE
         C445PPzxytx+Cdym+BfWoDDV5P2+YHWFKAf5Ua25Q+jMCesZ/gS3CUJ+bLPs9l+/0wQaN5Ji4D5u
         LdQZItQLEoDR+9DHUxhT4mLVaZphBmny1x/yX2BBmT/35xZ5B/hPuej+9cmm9XgCV7LKNfLhQT1V
         RN0Yg7sGzYK0dEEBOqfoRYW29Zy0DoJrzELZFv/oAF9qdQncJ2/e4=
From:   Weiguo Li <liwg06@foxmail.com>
To:     andrew@aj.id.au
Cc:     joel@jms.id.au, linux-aspeed@lists.ozlabs.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH v2] pinctrl: aspeed: fix null dereference in debug
Date:   Wed,  2 Mar 2022 15:12:24 +0800
X-OQ-MSGID: <20220302071224.580142-1-liwg06@foxmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <c51e5a79-168e-4189-ba8e-a426ab82cd89@www.fastmail.com>
References: <c51e5a79-168e-4189-ba8e-a426ab82cd89@www.fastmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,HELO_DYNAMIC_IPADDR,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,
        RCVD_IN_MSPIKE_WL,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

"pdesc" is null checked, but already dereferenced ahead in debug.
Swap their positions to avoid potential null dereference.

Signed-off-by: Weiguo Li <liwg06@foxmail.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
v2:
* resend it after registering an account in aspeed patchwork
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index c94e24aadf92..83d47ff1cea8 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -236,11 +236,11 @@ int aspeed_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 		const struct aspeed_sig_expr **funcs;
 		const struct aspeed_sig_expr ***prios;
 
-		pr_debug("Muxing pin %s for %s\n", pdesc->name, pfunc->name);
-
 		if (!pdesc)
 			return -EINVAL;
 
+		pr_debug("Muxing pin %s for %s\n", pdesc->name, pfunc->name);
+
 		prios = pdesc->prios;
 
 		if (!prios)
-- 
2.25.1

