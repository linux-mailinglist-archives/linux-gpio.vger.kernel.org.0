Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B83FB50C8C3
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Apr 2022 11:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234567AbiDWJoq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Apr 2022 05:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234556AbiDWJop (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Apr 2022 05:44:45 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F3F38119A
        for <linux-gpio@vger.kernel.org>; Sat, 23 Apr 2022 02:41:49 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id g20so13124697edw.6
        for <linux-gpio@vger.kernel.org>; Sat, 23 Apr 2022 02:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sK7viN9i4JPJxxDkjaX4q/MfNzJTh2SbB8y6IKJ+NA8=;
        b=JVeDryIHYCcT9M56JgZSY/aCTKMph4y/FS8U42oGwCUEh3tgOiMcg9eTnLb/FAWorJ
         bx2OXT3EHxoOHt7Ih8hsM6/IMsED5VqJOEoIGDWhTLFTFI0BcbNu8EHQrT9KmE2TKib9
         m7q+EMVMYTiM1ZsmnTwyGMG+YTlkfinfnrBu7PGUKJgIgmSUlKL6B959UPm1GInA3iY8
         izITflS7m46K/vTYp9DZt/mGLXm9gjeur23r4HrGVBnhgG8uR+8QdgUkIPfG00ZBtAv9
         oDiyhY/1BH0JbLqoUKZrY+8qfGveJ3fKoc6Att8AIpcYrYwSTi6AVAVb2sUNEv+PWB5p
         9rFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sK7viN9i4JPJxxDkjaX4q/MfNzJTh2SbB8y6IKJ+NA8=;
        b=wxHU4NCWX+MExP2ETxnbraEtwjP0Tu4lMZjZ5xS1flXZ6oUir+sVv52savEPpH5Hs8
         LH63bZvhwIK7emJ/7KXtl4jiM7zpYA5ES2O3bITuo0dApBvcuufA8O/lq6wZBPZk4UkB
         x6p+cgq72XAE2Y+msPWHhCweHSeIhHMRiLSyPsStuLLDdtpfOc9zkMSbIajft9gLTdTX
         0WoyqNu1co0ZzBE6e4bfXMrAc5Tfjg+hrcnsz8aF+zb5O/DEa5V+rojRe2j/MemubfgE
         rf827N3xf40Cf2tVlwC0uNkp/TO+sLpFQQY2jswXWdrlxg4rGEBLjBXncO853dYMdthq
         3ANQ==
X-Gm-Message-State: AOAM5312QoDITtVpONtJLW7/pMCi/3sRCHhrdPK/e2fooqfR8ds3//Vb
        m1hyzcp+xDQvaPGlF4o1nI/i+g==
X-Google-Smtp-Source: ABdhPJwCfMFt6+BgEzOcYsahEfprSVl7EeW4ENwCe2bhADBkOkjvnR4alfE2hwR4svmCgkB32YexjA==
X-Received: by 2002:a05:6402:3324:b0:41c:c4e6:2988 with SMTP id e36-20020a056402332400b0041cc4e62988mr9401481eda.157.1650706907574;
        Sat, 23 Apr 2022 02:41:47 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id 22-20020a508e16000000b00425c9d1704bsm975910edw.4.2022.04.23.02.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 02:41:47 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/2] pinctrl: nuvoton: Fix irq_of_parse_and_map() return value
Date:   Sat, 23 Apr 2022 11:41:42 +0200
Message-Id: <20220423094142.33013-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220423094142.33013-1-krzysztof.kozlowski@linaro.org>
References: <20220423094142.33013-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The irq_of_parse_and_map() returns 0 on failure, not a negative ERRNO.

Fixes: 3b588e43ee5c ("pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Correct the return value passed further.
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 3cf0f8a43c37..cc085ba2d7e4 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -1898,9 +1898,9 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 		}
 
 		ret = irq_of_parse_and_map(np, 0);
-		if (ret < 0) {
+		if (!ret) {
 			dev_err(dev, "No IRQ for GPIO bank %u\n", id);
-			return ret;
+			return -EINVAL;
 		}
 		pctrl->gpio_bank[id].irq = ret;
 		pctrl->gpio_bank[id].irq_chip = npcmgpio_irqchip;
-- 
2.32.0

