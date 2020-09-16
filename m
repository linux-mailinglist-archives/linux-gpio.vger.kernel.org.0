Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE11026CC52
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Sep 2020 22:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbgIPUmf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Sep 2020 16:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbgIPUmc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Sep 2020 16:42:32 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB1BC061756;
        Wed, 16 Sep 2020 13:42:26 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id d19so3829714pld.0;
        Wed, 16 Sep 2020 13:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=KTEiXWsrNTTNF4brX7sslTaA27Wj3jCvRMzdzjVA1+k=;
        b=cRSvvi0YE0LJjsNnQLFLiwPLRVlEijDhvdRIBIBr8yhwSaTr23O6/FkV3eUeZHWNH1
         5dd5sqPqaj0uMn7SPpHv3fgzwI8kR2tF+zHRYDm9JKnO65URipWWSVxohnglZHVlq1Nx
         /Zb8A3yC5nKh2vBpN1z43jRgUMkDNJKbY6jHt8QZDZdp67hKaPTshyMQomOmgn6xcImw
         lBZKQzybZDMWY7QifXzwjoQqOi8oZBHeKuXdhKTEt2mD/cm4DVLNcf2UkPYItgsQ5Lwr
         u0TsOa468276YYmj4N326UMVf4BMH19Cnt+s8qGBOwtzEwGtw34AmhAXkpr9eBNTVEVp
         lt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KTEiXWsrNTTNF4brX7sslTaA27Wj3jCvRMzdzjVA1+k=;
        b=bVLpnDBM64NEByv6wnlj9HQNNl4GZpZxNz9PIykyMs0qxMGW5QzaLNgxiQk/xWMKsD
         75qGXfq206L/q/fJHJ0r+MeG43ZOG1OHkNzdGx6WsswvsKF5JZQMrXLQmxMRetKC+kxZ
         FdLmQQWfKeSP/FOHCpwWtvgY/72i9+1GlbLzHTn2TjhO8EN0ZbRQ/aSNwZBf54+i3rW1
         Y/FSOZf5/+3iU+dAsEzlaAOzp39ly31C3J0o1FZQoSDYsb7W3K79MkH9qRlWjj2Qs6nV
         7aizB8BMp1yQfEvxIsw7m7BaYx0YLhtzcXOuIyi5JHBfeIcPX4YLJMqfInl+aeFXXWES
         BJJg==
X-Gm-Message-State: AOAM531ZtLHkAKa1ppk6IOtkzA0Lmp9JDSiDe0XGw926eFDURGtQSOPx
        4NE5Lrbjt2Rly+Hn0J8cG88=
X-Google-Smtp-Source: ABdhPJz3bA82VJkPymAABgFmCsDwVkj3PWIi1CeckDZIOwQIJJc3547a8fhdrIhdpnvHex5U0dmVMQ==
X-Received: by 2002:a17:902:10f:b029:d1:e5e7:bdd7 with SMTP id 15-20020a170902010fb02900d1e5e7bdd7mr8126307plb.55.1600288945769;
        Wed, 16 Sep 2020 13:42:25 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
        by smtp.gmail.com with ESMTPSA id n9sm10071276pgi.2.2020.09.16.13.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 13:42:24 -0700 (PDT)
From:   rentao.bupt@gmail.com
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, taoren@fb.com
Cc:     Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH] gpio: aspeed: fix ast2600 bank properties
Date:   Wed, 16 Sep 2020 13:42:16 -0700
Message-Id: <20200916204216.9423-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Tao Ren <rentao.bupt@gmail.com>

GPIO_U is mapped to the least significant byte of input/output mask, and
the byte in "output" mask should be 0 because GPIO_U is input only. All
the other bits need to be 1 because GPIO_V/W/X support both input and
output modes.

Similarly, GPIO_Y/Z are mapped to the 2 least significant bytes, and the
according bits need to be 1 because GPIO_Y/Z support both input and
output modes.

Fixes: ab4a85534c3e ("gpio: aspeed: Add in ast2600 details to Aspeed driver")
Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 drivers/gpio/gpio-aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 879db23d8454..d07bf2c3f136 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -1114,8 +1114,8 @@ static const struct aspeed_gpio_config ast2500_config =
 
 static const struct aspeed_bank_props ast2600_bank_props[] = {
 	/*     input	  output   */
-	{5, 0xffffffff,  0x0000ffff}, /* U/V/W/X */
-	{6, 0xffff0000,  0x0fff0000}, /* Y/Z */
+	{5, 0xffffffff,  0xffffff00}, /* U/V/W/X */
+	{6, 0x0000ffff,  0x0000ffff}, /* Y/Z */
 	{ },
 };
 
-- 
2.17.1

