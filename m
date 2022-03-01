Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0DA34C9459
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Mar 2022 20:32:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233336AbiCATdG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Mar 2022 14:33:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233133AbiCATdF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Mar 2022 14:33:05 -0500
X-Greylist: delayed 73 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 01 Mar 2022 11:32:21 PST
Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C94E513F38
        for <linux-gpio@vger.kernel.org>; Tue,  1 Mar 2022 11:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
        s=s201512; t=1646163138;
        bh=Sb3UcYOkMwOiM+FMVEB/7Mf7e9YvGkIfq21PpjOlOTk=;
        h=From:To:Cc:Subject:Date;
        b=SDdoVYJmK/w8kGVazqgkMcTWXTAQj6LITsb7QIQSz7fY3++Sw2d/f9hfwCCiOH73+
         WQ7XEdxYL+WyM/nCeSvuEWTL7AtUQFH4HXqkY4rxYNLyC+grZko9DYbH/iPDsbqKBC
         t4Sr4qI2pWH3QWYiH/7UZ26EyPfqnrCCvtLEOiqo=
Received: from localhost.localdomain ([111.193.130.237])
        by newxmesmtplogicsvrszc10.qq.com (NewEsmtp) with SMTP
        id 7B723608; Wed, 02 Mar 2022 03:30:55 +0800
X-QQ-mid: xmsmtpt1646163055thmxsx56i
Message-ID: <tencent_BBDF8D2C89ECC450F3349D6E46F8EAF87F0A@qq.com>
X-QQ-XMAILINFO: OfkeHAqGKDFb5pL06KT/dpe47k17PjLJZMgf74ZkiIng4U5qmNF3u9ILDSUGp0
         FkDOYIPRpsZp4waZ4HM7CRHkoEq5qzjZHsZp4j3bskvhlOPyGONFY842xLSDUvROd85nXkPjWngd
         uiqZr9bnP1ZBu4HU250UjY8YU1W9XgC7iWv9n6KWENSpshHAPc3R0Z0Zrm+0DjFAh4FBF+upC5Gc
         6osoqxkqHI9MpZErVDjXLjWux6yCH6+ijtjdS2rzREp0hA+nrpWhzLBmyAkIZRS5xqyAr7LxOm1S
         5FgcnXrIbI2hdP56ruslHwmafNtdilyKSs0OSEt/LJApoGRhRpdGBO/dkUJm0vk6c/zHJFpQL2h/
         k/TWHFxYxttR+LlmLjDBtTfLwfwlwpJldb2OBwU4/WaW3JiKz7B2EljRAN1BvAf1IhKMfC8Evkyw
         CjY40zGo6FUPgQN7w0QRdIkuOT0Ka5JV12woVmukk1UvcrmQY2D5MeF4yypZGgUbFuLFJF49Yik6
         nalhj8DVFpTgpaOlejm1EnZKqG40qz2nRyOteKcr9g7YcuD2fLQSoFmoEROx0kC6DswkDB2G//U1
         6Z10NRy4HhEHJBbNOyCpHwnn0Ad4b59S9zcPOYcIrqWHXnuF8AZvFlzar1QuKJm14FIEeK4y7Zzb
         Y5D1Zr2V3qCxIA7Cs/phY9vglWOXCzLueEB2GvYjDLOfjLRjaVXv2l7TDfu5tB+GeP8TMRkUn0p+
         sWUY6rl4/TXy+ozNLe0j55Mr4IouT/ZdUoR5jESVh3zELXOopZKlEfMwlf+kv+YjzF6uCvgIjm15
         x53jgArbIZZ9vItIshx7c9S1vhye+e4vg4yh02JNberywwMNeoaTYOs8UvNS5XKLVYrWhpPo8hnW
         XxruDdXXqf0s6MM/lIKdUflgV88YQ0dZNLjECx7Tgy
From:   Weiguo Li <liwg06@foxmail.com>
To:     andrew@aj.id.au
Cc:     joel@jms.id.au, linux-aspeed@lists.ozlabs.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: aspeed: fix null dereference in debug
Date:   Wed,  2 Mar 2022 03:30:54 +0800
X-OQ-MSGID: <20220301193054.503419-1-liwg06@foxmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,HELO_DYNAMIC_IPADDR,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
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

