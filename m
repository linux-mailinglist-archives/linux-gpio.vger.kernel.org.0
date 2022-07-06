Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 881C6567E31
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jul 2022 08:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbiGFGE1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jul 2022 02:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiGFGE0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2022 02:04:26 -0400
Received: from mail-m963.mail.126.com (mail-m963.mail.126.com [123.126.96.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F3C87223
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jul 2022 23:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=whMGJ
        mDQ8PAuWlWWdEH5NtCX0k4DhueQvEoQERelp9o=; b=eM6SNX+d9JyIAmZ/4zYUx
        9KJLzmzw1EfwHQNj7ckQXedK0xAFasso2KEP+H6NkmAf5CrkP8s8mPPoVj5kbmLq
        grHdfwlskRV4xx5rqf4hwS9KsfaYaVyz6BJKtC2EUrXBbnr7gk58f5zUUJIWoQc9
        GMitWrxlRezIBcXuRyVYPQ=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp8 (Coremail) with SMTP id NORpCgCX7XFvJcVim6hkHQ--.3033S2;
        Wed, 06 Jul 2022 14:02:24 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de,
        linux-gpio@vger.kernel.org, windhl@126.com
Subject: [PATCH] gpio: rockchip: Fix missing of_node_put() in rockchip_gpio_probe() and rockchip_gpiolib_register()
Date:   Wed,  6 Jul 2022 14:02:22 +0800
Message-Id: <20220706060222.302051-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NORpCgCX7XFvJcVim6hkHQ--.3033S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruryrtrWfXF4xtr1rJw1fWFg_yoWfuFg_Kw
        17WrW7Xr18KFnY9wsrZa43urZay3WDWrs5Za1vvFW3JFyqvw1DXr1ruwn8Ar9rZrsrAFZr
        Gw1qvryYkF43GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRMeHDDUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuBA2F2JVkOjGLQAAst
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We should call of_node_put() for the reference returned by
of_get_parent() which will increase the refcount.

Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
Signed-off-by: Liang He <windhl@126.com>
---
 drivers/gpio/gpio-rockchip.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index e342a6dc4c6c..708d4e6065aa 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -613,6 +613,7 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
 			return -ENODATA;
 
 		pctldev = of_pinctrl_get(pctlnp);
+		of_node_put(pctlnp);
 		if (!pctldev)
 			return -ENODEV;
 
@@ -715,6 +716,7 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	pctldev = of_pinctrl_get(pctlnp);
+	of_node_put(pctlnp);
 	if (!pctldev)
 		return -EPROBE_DEFER;
 
-- 
2.25.1

