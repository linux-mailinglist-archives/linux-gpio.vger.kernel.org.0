Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3592D609CE3
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Oct 2022 10:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbiJXIhO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Oct 2022 04:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbiJXIhK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Oct 2022 04:37:10 -0400
X-Greylist: delayed 1687 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 24 Oct 2022 01:37:07 PDT
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A5B965023
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 01:37:06 -0700 (PDT)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
        id 05E1A20058; Mon, 24 Oct 2022 16:08:53 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1666598933;
        bh=YzggHOK4PpaZutcPV7wD1BB9sukzzm1aq1Ia5vtAuvI=;
        h=From:To:Cc:Subject:Date;
        b=EMNreDb37+TnqWa43AQqF0cy2ypLoPiFMNgZFEjIXK4YTUVri6KcnZEPOupNrm0zu
         qbyCaUXoRqk6n+oxhufCovNTj0+GlRKXCcOQl3CVop4PJBbO+ivFa2VfGmNcPYEzVY
         clRwnaWVXeMAW2gQBH78WUln4DFen0aaqRRrZ/9gQWM2yyw3UXyETIM2Z10eJDYhd/
         vr2qC14f/ngN/9xV6dATot4zfU6MxMcZPxsnyOZkWNfg3LgHQwTsNrpUA8c9ty0UGv
         ofOwh43uNfsyVsQV391fx7ABHlHXsE9/O7iMbQogILsYgRSWgj4rmU1Xn41mPER1rT
         7yEi4doT3BJ1A==
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] gpio: ftgpio010: use device name for gpiochip name & label
Date:   Mon, 24 Oct 2022 16:08:28 +0800
Message-Id: <20221024080828.3840438-1-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently, we use just the fixed string "FTGPIO010" as the gpiochip name
for ftgpio010 drivers. Because it's fixed, this means we cannot
distinguish multiple ftgpio010 devices present on a single system.

This change uses the dev_name() instead, which should be unique between
multiple instances.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 drivers/gpio/gpio-ftgpio010.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
index f77a965f5780..2728672ef9f8 100644
--- a/drivers/gpio/gpio-ftgpio010.c
+++ b/drivers/gpio/gpio-ftgpio010.c
@@ -277,7 +277,7 @@ static int ftgpio_gpio_probe(struct platform_device *pdev)
 		dev_err(dev, "unable to init generic GPIO\n");
 		goto dis_clk;
 	}
-	g->gc.label = "FTGPIO010";
+	g->gc.label = dev_name(dev);
 	g->gc.base = -1;
 	g->gc.parent = dev;
 	g->gc.owner = THIS_MODULE;
-- 
2.35.1

