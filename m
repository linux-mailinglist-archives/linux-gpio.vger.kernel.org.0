Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C91F29E69E
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 09:48:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725841AbgJ2Isy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 04:48:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbgJ2Isy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Oct 2020 04:48:54 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D348FC0613CF;
        Thu, 29 Oct 2020 01:48:53 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g12so1767193pgm.8;
        Thu, 29 Oct 2020 01:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3NBBJNOA89yKkpMLN8TDKgLaYij/cQiFP/n4z7T6KxU=;
        b=JRHjL+rUarLIuDrPA+dHcKat65vHo6sp5Fsw8o2pgW2w/jnUev20V2KSJ+DuDBKVjS
         D3b/xQV0CQdq571uA/9mt5WREQKkSyWTGvcssTS+LDKt8DCZ/aAC2MePYOx2G6TzDWLx
         5ZnCqJLGHQ9qF0Q4TvBUaLF9FsdL0d7yQwMINbk+TUe4X3+XSummfm+fzCNJh7s5cYlE
         fQyG+3/80CW2DofXfdAecb2KBIyPT8QuRACUAPuewNMHmRKkdx1Y9rhm+jo5bZ379VTZ
         SCJC02VPXeEaBIP20wyk1fIW71IwB0kwSar2iY3epIZlwwqDbgg7rCPXHJdawDvi9Z4Q
         CwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3NBBJNOA89yKkpMLN8TDKgLaYij/cQiFP/n4z7T6KxU=;
        b=c4Nge8N8JlTeGJioa1PBDhSI30m9ArED8rgF/4iFYKjrjglaKeQzmaGTfFULAA808f
         5uuStnNp+mewKHW2xrmZuh5u327O552riTeZpT/SinECUHMJXxa0dybICu/8hehzcSmG
         p2TXF827qukmaGqQQzR7M5FfHbTYlYNn0asLFOy/9SgjyCQMorghTm9W7J+ph6d4XK5u
         S2B4Y59YeUFhC4g0F1PZXG+HsEW6W3HIZSNUdic1nOa3GGZqo5a3ZCLjeCRY01ai4QlO
         Y4TdP1yYWuXWT9Jp/TdWumvyOjkCha18hhWphFVN1PFPOxJRS3ITllcGncvZ6uj7baQD
         yCjA==
X-Gm-Message-State: AOAM531jxj71xoq0crc5n7zVZbpMGDvhenVM1mZ5HovqRszSPDNIBcFv
        wk24QopYcQY0i8LACGCXH0kDWAXFMzeOBg==
X-Google-Smtp-Source: ABdhPJx2qB3sBmJ/TI0px1mlKjdPYsF+E39uJFskusqGwMvoSiYndhjJtzTm1/4+d0R8+TxY3d8Xbw==
X-Received: by 2002:a65:40ca:: with SMTP id u10mr3023098pgp.71.1603961332919;
        Thu, 29 Oct 2020 01:48:52 -0700 (PDT)
Received: from sol.lan (106-69-179-84.dyn.iinet.net.au. [106.69.179.84])
        by smtp.gmail.com with ESMTPSA id z16sm2178493pfq.33.2020.10.29.01.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 01:48:52 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH] gpiolib: cdev: add GPIO_V2_LINE_FLAG_EDGE_BOTH and use it in edge_irq_thread()
Date:   Thu, 29 Oct 2020 16:48:32 +0800
Message-Id: <20201029084832.13933-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add GPIO_V2_LINE_FLAG_EDGE_BOTH macro and use it in edge_irq_thread() to
improve readability of edge handling cases.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index ea787eb3810d..5eb4435afa64 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -510,6 +510,8 @@ struct linereq {
 	(GPIO_V2_LINE_FLAG_EDGE_RISING | \
 	 GPIO_V2_LINE_FLAG_EDGE_FALLING)
 
+#define GPIO_V2_LINE_FLAG_EDGE_BOTH GPIO_V2_LINE_EDGE_FLAGS
+
 #define GPIO_V2_LINE_VALID_FLAGS \
 	(GPIO_V2_LINE_FLAG_ACTIVE_LOW | \
 	 GPIO_V2_LINE_DIRECTION_FLAGS | \
@@ -569,8 +571,7 @@ static irqreturn_t edge_irq_thread(int irq, void *p)
 	line->timestamp_ns = 0;
 
 	eflags = READ_ONCE(line->eflags);
-	if (eflags == (GPIO_V2_LINE_FLAG_EDGE_RISING |
-		       GPIO_V2_LINE_FLAG_EDGE_FALLING)) {
+	if (eflags == GPIO_V2_LINE_FLAG_EDGE_BOTH) {
 		int level = gpiod_get_value_cansleep(line->desc);
 
 		if (level)
-- 
2.29.0

