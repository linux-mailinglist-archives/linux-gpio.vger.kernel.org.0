Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4BB5750407
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jul 2023 12:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbjGLKBX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jul 2023 06:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232761AbjGLKBJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jul 2023 06:01:09 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E080E1711
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jul 2023 03:01:08 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fbdfda88f4so68816685e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jul 2023 03:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689156067; x=1691748067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=scBfE2ojH74ugw2iGKwYRKybXV2n3li+bsa1KFBbvjc=;
        b=FLLieTiYbLN4+Ij2w9wMbvafPWoLw+RQN3tWfU+ICXKRuuxyfOWC18H7VjpKfIo+sc
         oniioZBP02FDP7IkyTN+rDNczaoVitHKeOO93KAukA9hy/VnCL6QkwQ0wpNej+UyzvQj
         9NFQcanwXEPamCLSL1EYNPtz3qjhE60ntLcm1qZyvcpA8edBm/hiFVhNb8wYzlanFDbj
         SSFoHg7rNnIdc5sQEKeCy8f4CeXD8qVcu/un6KJtsW1NUPKZa1xdBLfrYdX1iwd5kGZ8
         cWEA72V2v24cQCQTGq1Ax8oZEUVrqP1k+LBGvrDWsnZhir7JWeg5vmD91su+2nBjSSpl
         dfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689156067; x=1691748067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=scBfE2ojH74ugw2iGKwYRKybXV2n3li+bsa1KFBbvjc=;
        b=dy/tpztvWxdO9PH8FbcH8zEkk1372TP0ik2F+9030L6jP4o9SfseNBdikOrq9Jiusk
         Ccsw3saIb7usrZNE63Zzw2Jlo7mVFIX5/ruLI25HMg/rOrD2cNyh1NpG+PCzBnhBCS4t
         uv0I/HAmataaIWc7Xx8o3HoZ/yAwbSacflljQkGPlbXAD9DO5954sVo2bap7Dm0LodaW
         z3ymbcz+WFbuzcti0Ly96Tbu0hFcyZ1mhy7RlLbcKcxsT2MjcZcpQIT9mo4RYHWW7irc
         tG3nUqWUAth/6NEur2cCGUl69llDi8Fba0EeMQUX4Znxca23/MRnIlqenSLAiVskYajU
         WNZQ==
X-Gm-Message-State: ABy/qLaM9WWqwkoi3PC7sVk8fLdGBmFaULo2oL/mOwH5WVrDwtVCgty1
        nylhORq6cr2hDGnBdrSzN4UNSh0q5neuibcbFWM=
X-Google-Smtp-Source: APBJJlEqNxTmIuqagiiktscyDP9EFVBH83ViwCSk66qZQMat5KucFCt4ROljU8qwz40q/leQXBlyvg==
X-Received: by 2002:a05:600c:221a:b0:3fc:1bd:95a6 with SMTP id z26-20020a05600c221a00b003fc01bd95a6mr12746793wml.31.1689156067389;
        Wed, 12 Jul 2023 03:01:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d866:9edc:5a2d:f498])
        by smtp.gmail.com with ESMTPSA id g23-20020a7bc4d7000000b003fc02a410d0sm12816674wmk.48.2023.07.12.03.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 03:01:06 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: sim: fix a typo in comment
Date:   Wed, 12 Jul 2023 12:01:05 +0200
Message-Id: <20230712100105.105889-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It was supposed to say 'for' not 'fo'.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 8b49b0abacd5..cfbdade841e8 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -488,7 +488,7 @@ struct gpio_sim_device {
 	 * This structure however can be modified by callbacks of different
 	 * attributes so we need another lock.
 	 *
-	 * We use this lock fo protecting all data structures owned by this
+	 * We use this lock for protecting all data structures owned by this
 	 * object too.
 	 */
 	struct mutex lock;
-- 
2.39.2

