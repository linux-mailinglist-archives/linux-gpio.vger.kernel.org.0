Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B928A56512E
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 11:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233444AbiGDJoI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 05:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231830AbiGDJoI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 05:44:08 -0400
X-Greylist: delayed 1843 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 04 Jul 2022 02:44:06 PDT
Received: from mail-m964.mail.126.com (mail-m964.mail.126.com [123.126.96.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0E74F6332
        for <linux-gpio@vger.kernel.org>; Mon,  4 Jul 2022 02:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=41i5r
        G8ygh0AXWUPqVCZsoz5sLrBm1d3ZMZjIaig2/A=; b=keV+ffiohwCSFevFGRvDN
        wVvot9nmyWD1oZNGZZLQ6rOUYf5mvD81V3bF72TmpWv3WLQmFZ6j/wF80P3x/V5+
        aVbS9895MteMVDtBnpdHltUWcROX7UhDeDSnrTILKEdttyoRMckEPXHjahGmY3ti
        nzhKZIak6vnJzY81s1CtUk=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp9 (Coremail) with SMTP id NeRpCgCneMUqr8JiR35wGA--.18507S2;
        Mon, 04 Jul 2022 17:13:15 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, windhl@126.com
Subject: [PATCH] gpio: gpiolib-of: Fix refcount bugs in of_mm_gpiochip_add_data()
Date:   Mon,  4 Jul 2022 17:13:13 +0800
Message-Id: <20220704091313.277567-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NeRpCgCneMUqr8JiR35wGA--.18507S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xry5GFyDuF1DurW7Zw17GFg_yoWDCrgE9w
        1kXrW7Gr1DGan5XrsxAw4fur9avws7uF93AFsavF93twn5Z39Fgr1S9r43X3sxur48GrW5
        Grs8JrWUArs3KjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRtgAwDUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi2gs0F1uwMVqn-QAAso
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We should use of_node_get() when a new reference of device_node
is created. It is noted that the old reference stored in
'mm_gc->gc.of_node' should also be decreased.

Fixes: f141ed65f256 ("gpio: Move DT support code into drivers/gpio")
Signed-off-by: Liang He <windhl@126.com>
---
 drivers/gpio/gpiolib-of.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 3d6c3ffd5576..de100b0217da 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -860,7 +860,8 @@ int of_mm_gpiochip_add_data(struct device_node *np,
 	if (mm_gc->save_regs)
 		mm_gc->save_regs(mm_gc);
 
-	mm_gc->gc.of_node = np;
+	of_node_put(mm_gc->gc.of_node);
+	mm_gc->gc.of_node = of_node_get(np);
 
 	ret = gpiochip_add_data(gc, data);
 	if (ret)
@@ -868,6 +869,7 @@ int of_mm_gpiochip_add_data(struct device_node *np,
 
 	return 0;
 err2:
+	of_node_put(np);
 	iounmap(mm_gc->regs);
 err1:
 	kfree(gc->label);
-- 
2.25.1

