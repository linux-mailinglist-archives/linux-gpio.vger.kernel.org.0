Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3FCE785359
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Aug 2023 11:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232297AbjHWJAK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Aug 2023 05:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232898AbjHWI5D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Aug 2023 04:57:03 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20AF210C7
        for <linux-gpio@vger.kernel.org>; Wed, 23 Aug 2023 01:53:02 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-529fb2c6583so4763589a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Aug 2023 01:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692780780; x=1693385580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JPDqlhL7SqWh5OD2s6BTW2qXTk0yC8xjXaptcVcfI+Q=;
        b=G+7G8iJ2hjjvh057ZBnfSygXELgCVSfRVVI6/UYJ0AWwdKEbXxqCn9kkueTBRrw5oj
         ZVgBCcj75haBqEiygWs1uHMg2VI0SPyuBUfl5w8728DFY47Y+MhT09xvebjXY/V9Ugpk
         EzkOLgr2qunjSTcN/81S8+tBCbS9FmONBWTBx+9XGGu25+DUe7NSNFivCk+lXKSGHkDd
         wCU9RSOBLmJ4GqfXXHApnTMSjDfVF16eME+70GOORbyp2IQD28EmZNvGYJo0w/gPdWDz
         6Ai9FHY0NoXNcsX6sWRu2V2K1w8a6VO1KWK+1BboaPhX7y2ZhVx1CVta713n/XSMExso
         GaqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692780780; x=1693385580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPDqlhL7SqWh5OD2s6BTW2qXTk0yC8xjXaptcVcfI+Q=;
        b=jEG372RAZs2uPSZ26lyiXtrNG6UigO2qERC23LZJEhM/6ffUIkoxlPakuaQblgK4xi
         lWhwLJemEnsu+IpVetr3EQ1X7MNEwcEiLHteC+nRBTN8Uj3UWTLNmgf5VHd6vxIxD42L
         6BZ9vqAInzGllS9wQg9tVaVu4W29hmlpU8uOFiRm6pcNOHyWtZBFywlkTnSU/QEqX9cd
         j8ageysypgOFzKseoZnrD5a5vXn5IU0cQ0yryI+Lnv7NTsa4DzUd+SKfqJkrpcGRfCEU
         5M8bdz2Ta+e1uJVIStn64VSeu3+UimbX9jCQVqfDQbWiP4akSISCxvP8xWlkEIXg7RLn
         /mow==
X-Gm-Message-State: AOJu0YyWfEsCjVamqx3JGcNEl1hkwLj08BFZV912AF31cYoVXlkvrYKZ
        5LyNnvT8H630o4SdaOAQznyq/1uKbRUDOAojoCo=
X-Google-Smtp-Source: AGHT+IEg/AvIcQnDhVZEum6VipSbr4A70qUPnWTvRe3f1c5XnDm3V99GA71QI9qIVJ5PoMreoszobA==
X-Received: by 2002:a05:6402:164e:b0:522:cef7:83c3 with SMTP id s14-20020a056402164e00b00522cef783c3mr8991313edx.8.1692780780572;
        Wed, 23 Aug 2023 01:53:00 -0700 (PDT)
Received: from krzk-bin.. ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id t8-20020aa7d4c8000000b0052a1d98618bsm1718748edr.54.2023.08.23.01.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 01:53:00 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] gpio: mlxbf3: use capital "OR" for multiple licenses in SPDX
Date:   Wed, 23 Aug 2023 10:52:58 +0200
Message-Id: <20230823085258.113701-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Documentation/process/license-rules.rst and checkpatch expect the SPDX
identifier syntax for multiple licenses to use capital "OR".  Correct it
to keep consistent format and avoid copy-paste issues.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Rebased on next-20230822, so might not apply cleanly.  What does not
apply, can be skipped and I will fix it after next RC.
---
 drivers/gpio/gpio-mlxbf3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mlxbf3.c b/drivers/gpio/gpio-mlxbf3.c
index 0a5f241a8352..7a3e1760fc5b 100644
--- a/drivers/gpio/gpio-mlxbf3.c
+++ b/drivers/gpio/gpio-mlxbf3.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0-only or BSD-3-Clause
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
 /* Copyright (C) 2022 NVIDIA CORPORATION & AFFILIATES */
 
 #include <linux/bitfield.h>
-- 
2.34.1

