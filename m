Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E65B36D4F98
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Apr 2023 19:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232153AbjDCRxu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Apr 2023 13:53:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231956AbjDCRxs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Apr 2023 13:53:48 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C2E630E3
        for <linux-gpio@vger.kernel.org>; Mon,  3 Apr 2023 10:53:29 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-54606036bb3so401538537b3.6
        for <linux-gpio@vger.kernel.org>; Mon, 03 Apr 2023 10:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680544408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUvqcKTV5t7oEc0P58WrmGpTA7ia/Y6+JrGme5iKxeU=;
        b=wd82Yv5v/ED67HB18yVKB4t6nYbSgiV2G/AV6JsB+oa1osythiFRIb8hOcF7fTGnX9
         TmluUh6yvn4jucPj4ZBLkRRrXwWDJJcDl5j6l1QMshoZ5zNQ+U40/A9pYmjR+6owJ4PS
         V4gA7q/jclRLq8xDYeOtcGnClSc0JosyeTFA6b5kw3/uE1e7bUeAHuM2s5gRcT0leUqf
         8yr17Z97HBpHnWq++5sL0nOw1rCm3I5ralNk04w8cPurCrRF0IrHZbeuYfnA5tYTKkT3
         lGehGpsMcyagrsx95ohKnaCos9FzxkeTA8/1Wo5TgnASk0+lWPgvejVzWWF90gRrlCmm
         cBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680544408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CUvqcKTV5t7oEc0P58WrmGpTA7ia/Y6+JrGme5iKxeU=;
        b=pkRFAHj8n0mrbc/WoAR0LWz2Yf+2IovJtXaRhuZ0t8hiZWe7b7djqVXEK8GYXh8Imn
         9vTkGTRm3xSIh832qiYsPGUHnIE6PfZLZhOL6NGTINV9eapGaW2fwyrJGj6lx3wUJ5oN
         EVLwvzR8SE6O7dl7wuzRN3/itu4ATxj4ET4bcZSClkMrqtqN/zR9aadcrH6EEVoxQAsw
         A70EqUOGLVHhejHE/IYJNtdjErXsVDhEDVagJtjKCpP4RLFl+dA1IdYL5lCFqIolEi7D
         eMM69rXJEsgLg6xWjinxynZ2aoHRQpoq8rA9+tgtCW1fOZ0cCDgZ3SR4PuRq9PxSoYMR
         CSCg==
X-Gm-Message-State: AAQBX9d15h95J81gPs0C7tW+8eMthv6qlTxuFAqDBOxSGJpoF46BCNOx
        RKOoqKxOLJAJWVyXB/Zbo0rm6tGpyd00C0QT8YoNjw==
X-Google-Smtp-Source: AKy350aRVRKmuDufgMcmed/FOHa6dQcOcYp4ftYUzmeaZe8mApB16TJBQezY0ZRvgroq2JZui7WQtg==
X-Received: by 2002:a81:92d2:0:b0:546:209d:ee81 with SMTP id j201-20020a8192d2000000b00546209dee81mr17819646ywg.2.1680544408198;
        Mon, 03 Apr 2023 10:53:28 -0700 (PDT)
Received: from fedora.attlocal.net (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id z135-20020a814c8d000000b00545a08184adsm2661663ywa.61.2023.04.03.10.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 10:53:27 -0700 (PDT)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        William Breathitt Gray <william.gray@linaro.org>
Subject: [PATCH 1/2] gpio: 104-dio-48e: Enable use_raw_spinlock for dio48e_regmap_config
Date:   Mon,  3 Apr 2023 13:53:13 -0400
Message-Id: <05a878d340251b781387db4b6490f288e41a651c.1680543810.git.william.gray@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680543810.git.william.gray@linaro.org>
References: <cover.1680543810.git.william.gray@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The dio48e regmap can be used in an interrupt context by regmap-irq. To
prevent a deadlock, enable use_raw_spinlock for dio48e_regmap_config.

Fixes: 2f7e845f512f ("gpio: 104-dio-48e: Migrate to the regmap-irq API")
Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
---
 drivers/gpio/gpio-104-dio-48e.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-48e.c
index a3846faf3780..11c48130bb8f 100644
--- a/drivers/gpio/gpio-104-dio-48e.c
+++ b/drivers/gpio/gpio-104-dio-48e.c
@@ -86,6 +86,7 @@ static const struct regmap_config dio48e_regmap_config = {
 	.volatile_table = &dio48e_volatile_table,
 	.precious_table = &dio48e_precious_table,
 	.cache_type = REGCACHE_FLAT,
+	.use_raw_spinlock = true,
 };
 
 /* only bit 3 on each respective Port C supports interrupts */
-- 
2.39.2

