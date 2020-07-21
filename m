Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10AA82282C7
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 16:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729252AbgGUOv0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 10:51:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728692AbgGUOvY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 10:51:24 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 128CEC061794;
        Tue, 21 Jul 2020 07:51:24 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id y3so4144381wrl.4;
        Tue, 21 Jul 2020 07:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8RncRLRROBybh/ytSIm9sTMuxY+/JPpvgiNZMG+zOjs=;
        b=qWXQaaojQFRmE/P5FEKCaLLi+eA1yKMJ9rHSam2RR35uL3fL658gDkoZ3Rxozhv6mq
         kdPPf1TxzAROMNd0NoWMASS3+iEsQMEuNg4MDp1MpXDqJwn4KYsrqLwV7OOmmElszvHU
         gnDxAYbh8Cxs2MNOxd/p4g/IVN3ouVcqf6P6aNlXxXDTq6TgzcMfW96OkgYDhqtfGYqh
         rKfp9H93EtjCxZ6C6TDh/zZ5/CNIBb34AoOqQyLNte3el/Qui9CaCON40B6oGRTaVG75
         qWoAgazG0vEZWVQQIN19sjIPEdv60GrVpJpO6BRa1x0V8WRYOAjL+v21fLyPOGjn51jj
         Ow+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8RncRLRROBybh/ytSIm9sTMuxY+/JPpvgiNZMG+zOjs=;
        b=ZChY0oCTfjBCIiH40I66Kpno3+/JvKhFmSvHuyCK1SGR56xrYUNy5wnJskY23HNmQl
         qhwjAqoVk8DMLIrnDqnWDWAL9a74UFRwSm7RjxmyuWT5YoyicK4v4bby3sOFG7vt1e2n
         A/LV9bwUInIpvqZR0adkgzp2tpLzJsZb+hZHqGN8mwadHaE3xEyke8jGjJimfWT3gGSx
         0VjycAnUU5eWmfpbgYKLk4eltgREgE6bKSkmsjNHvcD0YHI8nHT9ysSqyBz3D79z0lkb
         HuSDWVfxmYxg2DdwOB1haN3dH/Itq40lW5JXPU6lN9pGKitF6LQJEDz4FKV9vSYAMhow
         5DCw==
X-Gm-Message-State: AOAM533Ha6P6qO/+ggcgnp9qzVuthQaMT5Yy9f57zAV6ETzfMoNp2RhJ
        cLeDow31uls6hDi39BVEJ58=
X-Google-Smtp-Source: ABdhPJxF0Tl5MQytmchwiS8ACtgVR96BZHratVl3DSqzMmZN7JlYv5S4cBfzHaeNcIk2J8WbcWHrSA==
X-Received: by 2002:adf:b198:: with SMTP id q24mr26004342wra.335.1595343082809;
        Tue, 21 Jul 2020 07:51:22 -0700 (PDT)
Received: from localhost ([156.204.74.63])
        by smtp.gmail.com with ESMTPSA id o21sm3711943wmh.18.2020.07.21.07.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 07:51:22 -0700 (PDT)
From:   Abanoub Sameh <abanoubsameh8@gmail.com>
X-Google-Original-From: Abanoub Sameh <abanoubsameh@protonmail.com>
To:     andy.shevchenko@gmail.com
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Subject: [PATCH 2/2] gpio: gpio-sch.c: fixed coding style issue
Date:   Tue, 21 Jul 2020 16:51:04 +0200
Message-Id: <20200721145104.776561-2-abanoubsameh@protonmail.com>
X-Mailer: git-send-email 2.28.0.rc0
In-Reply-To: <20200721145104.776561-1-abanoubsameh@protonmail.com>
References: <20200721145104.776561-1-abanoubsameh@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Added a lined between a declaration and other statements according to the
kenel coding style.

Signed-off-by: Abanoub Sameh <abanoubsameh@protonmail.com>
---
 drivers/gpio/gpio-sch.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-sch.c b/drivers/gpio/gpio-sch.c
index d7cade67717b..3a1b1adb08c6 100644
--- a/drivers/gpio/gpio-sch.c
+++ b/drivers/gpio/gpio-sch.c
@@ -89,6 +89,7 @@ static int sch_gpio_direction_in(struct gpio_chip *gc, unsigned int gpio_num)
 static int sch_gpio_get(struct gpio_chip *gc, unsigned int gpio_num)
 {
 	struct sch_gpio *sch = gpiochip_get_data(gc);
+
 	return sch_gpio_reg_get(sch, gpio_num, GLV);
 }
 
-- 
2.28.0.rc0

