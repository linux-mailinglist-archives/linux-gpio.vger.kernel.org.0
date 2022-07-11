Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB3F3570361
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jul 2022 14:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232132AbiGKMww (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jul 2022 08:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231250AbiGKMww (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2022 08:52:52 -0400
Received: from mail-m964.mail.126.com (mail-m964.mail.126.com [123.126.96.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AFC7F49B67
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2022 05:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=vf2D1
        CO68HWN+wn5OV2jl2FCGSL7hFU89U+VShJvqq0=; b=U/5DA8huupXY3DYW+eCh2
        OWPRe9VZfUMFX5xFspgrl+WvJ41khCsQOARh18l1ZKsg7IxkgZ/R5N0ObewGnyzU
        asbrvrplWg1Unh273zOlmFzaeI6CnAW4/d+FALM0G0ecC3rM/h3B9v9HAKTSCa3/
        LVaoH4kdn9CQFgKIMyuGOg=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp9 (Coremail) with SMTP id NeRpCgCnjdEXHcxiH9APGg--.56764S2;
        Mon, 11 Jul 2022 20:52:40 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, windhl@126.com
Subject: [PATCH v2] gpio: gpiolib-of: Fix refcount bugs in of_mm_gpiochip_add_data()
Date:   Mon, 11 Jul 2022 20:52:38 +0800
Message-Id: <20220711125238.360962-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NeRpCgCnjdEXHcxiH9APGg--.56764S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw4rWw1DGrWxWw18CF1fCrg_yoW8Cr18p3
        y7KryfAw1kKr4xGryvvF18uFWY934vkFWag3WIkFyavw1qgasYy3y2gayrZ3s0vFW8CrW5
        Xr40qF15G3Wv9aUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_iSdJUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi2hg7F1uwMYlBYAAAsc
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

This patch is based on the fact that there is a call site in function
'qe_add_gpiochips()' of src file 'drivers\soc\fsl\qe\gpio.c'. In this
function, of_mm_gpiochip_add_data() is contained in an iteration of
for_each_compatible_node() which will automatically increase and
decrease the refcount. So we need additional of_node_get() for the
reference escape in of_mm_gpiochip_add_data().

Fixes: a19e3da5bc5f ("of/gpio: Kill of_gpio_chip and add members directly to gpio_chip")
Signed-off-by: Liang He <windhl@126.com>
---
 changelog:

 v2: (1) add more explaination advised by Linus Walleij
     (2) use correct fix tag
 v1: fix the refcount bug by
 https://lore.kernel.org/all/20220704091313.277567-1-windhl@126.com/

 NOTE: I have confirmed that the mm_gc->gc.of_node has been correctly
put by
of_mm_gpiochip_remove()-->gpiochip_remove()-->of_gpiochip_remove()

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

