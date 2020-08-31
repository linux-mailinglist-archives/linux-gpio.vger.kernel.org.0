Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBF3D257418
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 09:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbgHaHOo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 03:14:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbgHaHOk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 03:14:40 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAD5EC061575;
        Mon, 31 Aug 2020 00:14:39 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id 2so2650265pjx.5;
        Mon, 31 Aug 2020 00:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GC2aANQFRXh9v9luIuGhhYBwbkmyii8u5E9MO8Ji+8s=;
        b=Iw/o0InEzwEWvEwjD5wzDB0BbioWCMeEE+Uzqgoodqcs5+0Wc/YrRekpZtjD57zdJ9
         xrOkcIynnP+L8NJIFy3efZmnAIbwAVWTkqG8wDM1BracelrXWSzbWRtfBosqxFdOqE6Y
         WayjxX++yoY9GOUTRVlhozPxL3S5S34lJru7E0zOZPQw94SCLmMzKLrxT81dS/sUUtOf
         4nnJtiJEoOf63XQSpUWCZxJ9tze28zX1PiAW4R1Uu38JKbzc+0xvWvZfV260suVuezZN
         ZnXwMFca+Zl0cYUsJ6FGLOvKU5nEXgMPoqqTfGVJCWDWgiV4XredY21NdKVXiyjQ51gW
         DByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GC2aANQFRXh9v9luIuGhhYBwbkmyii8u5E9MO8Ji+8s=;
        b=Kk9hcikmLoc8Ys9tNVfexNxDgrwUuqwyJ8DDAGxXmk8k8Oyp6e+xarMZJyf6iciJbL
         h7Qnau6LdGPuTxpm8iDH0BLEwrr4E/DsORs+MPgp5DabF0i5t9TM+Iys6+ZWAGyHECqW
         Ssek62S8hg+vmxLfnz11niFNRBWNsRdi7Ka8hDbNZoqBta0tkLYvzgZcOkARO73xC9VU
         DzB7mdIudG5Fixok68Jb5vcVyolT3blQ8i0SK+lBSHzdG+MfEdlNKmZBu463Z6FJcXMI
         r7I2xAm6zcWmNLwLAvcrzxh5qy4AcTMpaJ6WUaZMlbE3lBjySYQjbeZSC8VuWC1iUydl
         vYyQ==
X-Gm-Message-State: AOAM5328Yz/7f2HwNRM0ehpeqPghZ3fb3cvcanntIkamBfxCnKWjgbM4
        Uz/SXoTQfzvnyf0TrFmfQ7Q=
X-Google-Smtp-Source: ABdhPJxvoBImEKm+Jbwf1j4ow9Ye1V12SGvLDhrliOoxJWAIFxeNydQy+n9qNO+0oFlNYaMVcy/Ppg==
X-Received: by 2002:a17:90a:a583:: with SMTP id b3mr164319pjq.127.1598858079571;
        Mon, 31 Aug 2020 00:14:39 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.6])
        by smtp.gmail.com with ESMTPSA id s67sm7173587pfs.117.2020.08.31.00.14.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 00:14:39 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     linus.walleij@linaro.org, lee.jones@linaro.org,
        bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        dillon min <dillon.minfei@gmail.com>
Subject: [PATCH: 1/2] gpio: tc35894: fix up tc35894 interrupt configuration
Date:   Mon, 31 Aug 2020 15:14:32 +0800
Message-Id: <1598858073-5285-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598858073-5285-1-git-send-email-dillon.minfei@gmail.com>
References: <1598858073-5285-1-git-send-email-dillon.minfei@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>

The offset of regmap is incorrect, j * 8 is move to the
wrong register.

for example:

asume i = 0, j = 1. we want to set KPY5 as interrupt
falling edge mode, regmap[0][1] should be TC3589x_GPIOIBE1 0xcd
but, regmap[i] + j * 8 = TC3589x_GPIOIBE0 + 8 ,point to 0xd4,
this is TC3589x_GPIOIE2 not TC3589x_GPIOIBE1.

Fixes: c103de240439 ("gpio: reorganize drivers")
Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 drivers/gpio/gpio-tc3589x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index 58b0da9eb76f..ea3f68a28fea 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -212,7 +212,7 @@ static void tc3589x_gpio_irq_sync_unlock(struct irq_data *d)
 				continue;
 
 			tc3589x_gpio->oldregs[i][j] = new;
-			tc3589x_reg_write(tc3589x, regmap[i] + j * 8, new);
+			tc3589x_reg_write(tc3589x, regmap[i] + j, new);
 		}
 	}
 
-- 
2.7.4

