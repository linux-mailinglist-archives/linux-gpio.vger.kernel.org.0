Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 483AF1DC4F6
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2020 03:57:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgEUB5Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 May 2020 21:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727034AbgEUB5Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 May 2020 21:57:24 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F65C061A0E
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2020 18:57:23 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id q9so2248260pjm.2
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2020 18:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ingics-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=swBHuwbGTAKrXfbO+COnYs003ZQtWEFH/MzYZEQhbwg=;
        b=UPw4ynXmgF9cRZrXacrzQoz8r2kt4j8HWL3T8f/PUjq8WmXdZMhVsDkAdLATGlxyqU
         Zh8kdxKfJNn8SvDSHDHVd63NATCJyAMqjIPy2jXsckunvxMnU5+6mH7nLrrICw6vAhQo
         xS7iB6Ao1vwv/LwbmCznr2Q6dlAqpwtjoiZe9U2zG/GIlC7HuwhYgrnHVcQIy4yrQ6wQ
         0ElUcVujXXoSv1Qj4P1HY49aBGtrNRZgpUoGvnwn5l4woSTMHyILIq2tHwCjv3r7VLqu
         JBuEjmUcnmisct7HBtzT2Ziby3v8mOZXeq0D88xGCtsExrykZF73zkUvpVh7OF8Ws4sP
         u+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=swBHuwbGTAKrXfbO+COnYs003ZQtWEFH/MzYZEQhbwg=;
        b=m4V53VJslSB9D3PxuNZV3JYKn5taRc9cYRfmeu9tjd2939dwP2l5ZfDxB3N+VlHUn8
         5Jb9XSv9tlffvGtosjVc8m8HFPgDrzDsLoIBv0rDQejaGnj91uEZ1qBfODDpUNqk0k7O
         20J5VmGrJghErTk8UKV+CoSk3qlY+S4zl9L6iR1MLiFTaB+pUtKkJXeaq08AG3QiU3Ou
         9QpYmDg26Vs31P/0Qg3llAvzp96KmS7SvnIdn4SbxqojScPpUtk82fi07VV9qeKoZTP1
         /OwIXDnN6QwMLvZqyITFWLqBEw/JhFVv0Cv0BNly7Nj8BdWcxPUxy32HCWX20zzC7QI2
         9+kQ==
X-Gm-Message-State: AOAM531l8CPtHbp6ji0hhidQex/S/M6L9KLkCydXso6o39R468mQnkMS
        895WA93SyjkfJzYbJpWX8QY4dlEg/T7tdg==
X-Google-Smtp-Source: ABdhPJyJIWEE3OIXYQ308peUbLV3oSeTiSvisc3AmMt5YZgJ7HnZt031e3kH/vWxl5kLdDUpH/WorQ==
X-Received: by 2002:a17:90a:fa91:: with SMTP id cu17mr7909565pjb.149.1590026242274;
        Wed, 20 May 2020 18:57:22 -0700 (PDT)
Received: from localhost.localdomain (36-239-220-3.dynamic-ip.hinet.net. [36.239.220.3])
        by smtp.gmail.com with ESMTPSA id gn20sm3021994pjb.24.2020.05.20.18.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 18:57:21 -0700 (PDT)
From:   Axel Lin <axel.lin@ingics.com>
To:     linux-gpio@vger.kernel.org
Cc:     Asmaa Mnebhi <Asmaa@mellanox.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Axel Lin <axel.lin@ingics.com>
Subject: [RFT][PATCH] gpio: mlxbf2: Fix sleeping while holding spinlock
Date:   Thu, 21 May 2020 09:57:13 +0800
Message-Id: <20200521015713.2206065-1-axel.lin@ingics.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

mutex_lock() can sleep, don't call mutex_lock() while holding spin_lock.

Fixes: bc0ae0e737f5 ("gpio: add driver for Mellanox BlueField 2 GPIO controller")
Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
Hi Asmaa,
I don't have this h/w to test, please help to review and test this patch.

Thanks,
Axel

 drivers/gpio/gpio-mlxbf2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index fca6a50d9308..94d5efce1721 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -126,8 +126,8 @@ static int mlxbf2_gpio_lock_acquire(struct mlxbf2_gpio_context *gs)
 {
 	u32 arm_gpio_lock_val;
 
-	spin_lock(&gs->gc.bgpio_lock);
 	mutex_lock(yu_arm_gpio_lock_param.lock);
+	spin_lock(&gs->gc.bgpio_lock);
 
 	arm_gpio_lock_val = readl(yu_arm_gpio_lock_param.io);
 
@@ -135,8 +135,8 @@ static int mlxbf2_gpio_lock_acquire(struct mlxbf2_gpio_context *gs)
 	 * When lock active bit[31] is set, ModeX is write enabled
 	 */
 	if (YU_LOCK_ACTIVE_BIT(arm_gpio_lock_val)) {
-		mutex_unlock(yu_arm_gpio_lock_param.lock);
 		spin_unlock(&gs->gc.bgpio_lock);
+		mutex_unlock(yu_arm_gpio_lock_param.lock);
 		return -EINVAL;
 	}
 
@@ -151,8 +151,8 @@ static int mlxbf2_gpio_lock_acquire(struct mlxbf2_gpio_context *gs)
 static void mlxbf2_gpio_lock_release(struct mlxbf2_gpio_context *gs)
 {
 	writel(YU_ARM_GPIO_LOCK_RELEASE, yu_arm_gpio_lock_param.io);
-	mutex_unlock(yu_arm_gpio_lock_param.lock);
 	spin_unlock(&gs->gc.bgpio_lock);
+	mutex_unlock(yu_arm_gpio_lock_param.lock);
 }
 
 /*
-- 
2.25.1

