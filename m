Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C77AD550927
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Jun 2022 09:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234081AbiFSHe2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Jun 2022 03:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231939AbiFSHe2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Jun 2022 03:34:28 -0400
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C8AABBE1E
        for <linux-gpio@vger.kernel.org>; Sun, 19 Jun 2022 00:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=qhxkr
        /aOqu+vrmKB0+0pl6NWC0/MFEXuMV8Podpx0Ds=; b=MfggCQvt+upNsGoaH47cF
        +b4IfpfMkVkJ0UZH5aI1kQAKd+Vvym4kbUwYlt8QESrmrmncIcXq23CoHykbNGit
        bxa+8EXLpN5o43VpQTj/hGolvuaA9fRQgI1K7z/RceM12t8k03/flLtUQRDi+1Kr
        QlaO9j8qYWvWeZ7NiaA6pE=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp7 (Coremail) with SMTP id DsmowACHl_M80a5iRtXFDg--.28970S2;
        Sun, 19 Jun 2022 15:33:16 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     linus.walleij@linaro.org, heiko@sntech.de
Cc:     windhl@126.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH] pinctrl/rockchip: Fix refcount leak bug
Date:   Sun, 19 Jun 2022 15:33:15 +0800
Message-Id: <20220619073315.4067956-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowACHl_M80a5iRtXFDg--.28970S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrykArWxAryrZw4fZr4UXFb_yoWfJrcEka
        4xWr9rXr1UGFWrur42q3y3WFyFkanrWr4vvFn7ZasxCasrXw1Iqrn5Wry3K3s7Gr4ayr9r
        GrZFvr4rJFWUJjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUID7DUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3B0lF1pEDwJZSwAAsy
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In rockchip_pinctrl_parse_groups(), we need a of_node_put() in each
loop for the of_find_node_by_phandle() to keep the refcount balance.

Signed-off-by: Liang He <windhl@126.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 32e41395fc76..d78827c97760 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -2710,6 +2710,7 @@ static int rockchip_pinctrl_parse_groups(struct device_node *np,
 		np_config = of_find_node_by_phandle(be32_to_cpup(phandle));
 		ret = pinconf_generic_parse_dt_config(np_config, NULL,
 				&grp->data[j].configs, &grp->data[j].nconfigs);
+		of_node_put(np_config);
 		if (ret)
 			return ret;
 	}
-- 
2.25.1

