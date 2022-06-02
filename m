Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E514853B45A
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jun 2022 09:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231760AbiFBHb6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Jun 2022 03:31:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231339AbiFBHb5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jun 2022 03:31:57 -0400
Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2873910BC
        for <linux-gpio@vger.kernel.org>; Thu,  2 Jun 2022 00:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=Tv54K64KAS47W0fZu8
        ABJ1rNTevhTFrE+FBMX/8VZkQ=; b=O5mmA9LF4+4+hUkTIF84QIiW6FpRZ0ExaI
        8pxubX6mXmNS1cZjcEeARMNmrjNsOhRXQuXhW2sE8Q61vRkD/2Rmoit4GKi4zzv1
        OgWr2Y6kWTzVivMApOuDKoJ5ZwjM1sORKvVniMaykMBZmOORGS9Hn9Ac7DjKDVrj
        K4WxrSXS8=
Received: from localhost.localdomain (unknown [202.112.113.212])
        by smtp8 (Coremail) with SMTP id DMCowAA3th4bZ5hijKu5Fg--.52368S4;
        Thu, 02 Jun 2022 15:30:46 +0800 (CST)
From:   Yuanjun Gong <ruc_gongyuanjun@163.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Yuanjun Gong <ruc_gongyuanjun@163.com>
Subject: [PATCH 1/1] pinctrl/ar91: fix a memleak in at91_dt_node_to_map
Date:   Thu,  2 Jun 2022 15:30:33 +0800
Message-Id: <20220602073033.8385-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: DMCowAA3th4bZ5hijKu5Fg--.52368S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw45CF4fXr1xXFWUWr1ftFb_yoW8GFWUpa
        n3GF13AF48GrsxWF9rKayqqFy3Ga1xJ3yUWayjg3s3XF15JF1kXF1UGFWUtFZ0kFZ3JF1S
        93yqyFy7u3yUGFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUjjgcUUUUU=
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/xtbB0AUU5WEsqyef-gABsF
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A new_map is allocated in at91_dt_node_to_map but it is not
freed in at91_dt_free_map, causing a memory leak.

Fix it by using kcalloc to allocate new_map and free it in
at91_dt_free_map

Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
---
 drivers/pinctrl/pinctrl-at91.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index d91a010e65f5..32ab983a77fe 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -291,8 +291,7 @@ static int at91_dt_node_to_map(struct pinctrl_dev *pctldev,
 	}
 
 	map_num += grp->npins;
-	new_map = devm_kcalloc(pctldev->dev, map_num, sizeof(*new_map),
-			       GFP_KERNEL);
+	new_map = kcalloc(map_num, sizeof(*new_map), GFP_KERNEL);
 	if (!new_map)
 		return -ENOMEM;
 
@@ -302,7 +301,7 @@ static int at91_dt_node_to_map(struct pinctrl_dev *pctldev,
 	/* create mux map */
 	parent = of_get_parent(np);
 	if (!parent) {
-		devm_kfree(pctldev->dev, new_map);
+		kfree(new_map);
 		return -EINVAL;
 	}
 	new_map[0].type = PIN_MAP_TYPE_MUX_GROUP;
@@ -329,6 +328,7 @@ static int at91_dt_node_to_map(struct pinctrl_dev *pctldev,
 static void at91_dt_free_map(struct pinctrl_dev *pctldev,
 				struct pinctrl_map *map, unsigned num_maps)
 {
+	kfree(map);
 }
 
 static const struct pinctrl_ops at91_pctrl_ops = {
-- 
2.17.1

