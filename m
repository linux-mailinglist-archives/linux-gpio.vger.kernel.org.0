Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD8CD7BB9B3
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Oct 2023 15:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232496AbjJFNro (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Oct 2023 09:47:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232598AbjJFNrJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2023 09:47:09 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C61071717
        for <linux-gpio@vger.kernel.org>; Fri,  6 Oct 2023 06:46:36 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50435a9f800so2794157e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 06 Oct 2023 06:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696599995; x=1697204795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LbIwSXH6FjrGWEWkB8T6Lc3o+IPSoQUzJoJygEsVP2Q=;
        b=M3oq6ZOROeph8Fv7ppj+U8piGVvV7XaktM+MOxQLPx9B0paNEapfFjo6X1QC6xuPtT
         wLE1Pv0qcPaDAXQ+V0lSGptIZk4iytMdr797zl26RmNgEaN+dVfLJZQGmkgovakbJnLH
         sP9iaC1/ueQXN35ckC5i0MWiEucemFCAs9Dp4m2eSXSEe50qCRDbdfcnkn4Z9JaV6UBe
         tSmKFLnlHgoudfzKLeRdiRZG6Dpz1MeykVxQ8ESOIMq5S57qnbM3W5qH5WAJWfWeOP9j
         QkznC7bBgxBvxgONArYT3LX2owneRc/FHO61znAEtPn9fEVzo179I0kpAvdyBvapMP96
         ApkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696599995; x=1697204795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LbIwSXH6FjrGWEWkB8T6Lc3o+IPSoQUzJoJygEsVP2Q=;
        b=GsDVnzDt/tegwtWKRB6WvLQAo4z7f1nW2ykWjTrvKGPB0QCqd/kU4KsR3UXreX3Ih+
         jQXNW1Dc5LN0Dhgvvbp5usT6bMC3aQ3SBT8LFP40YjBm+fUTZKKpGWMH7SJNUnYe42iu
         hbf5c1f8Ntb2IO250mqDX/jOOUIMnK2QZ/n17fF0JmcgguzwKcGeyzsXXE2b0nDtkvp6
         sLQDxs4DmbN4c7t4gv51VW45PHdxPzsL4jFLggZuggzCphcpeYit2u/NfoBjKi+ramqN
         SnkkwFl98YxKxJn4uCHDExB4s9lFjlegd5QYL6QF7+wu7kYBFG6+tJ/o0AV2KUqpr09z
         5s8w==
X-Gm-Message-State: AOJu0Yx3D99qDxijgJTg9KiO8Jq+1lTF+zDBU0OiH+V3yDYkAWk8kwC3
        3NOKqrMEFE4DQg3jQsFC9CYW8w==
X-Google-Smtp-Source: AGHT+IFoek3UspuoDg2fClJUEjov1EeEFdmzeEDd5y8Kje8woAv95XAU2HD1vvAKiP/TapL6Jc3a7g==
X-Received: by 2002:a19:5e06:0:b0:504:4165:54c1 with SMTP id s6-20020a195e06000000b00504416554c1mr6124350lfb.7.1696599994954;
        Fri, 06 Oct 2023 06:46:34 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id v25-20020a197419000000b004fe37199b87sm308733lfe.156.2023.10.06.06.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:46:34 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 06 Oct 2023 15:46:31 +0200
Subject: [PATCH 8/8] ASoC: mt8192-afe-gpio: Drop unused include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231006-descriptors-asoc-mediatek-v1-8-07fe79f337f5@linaro.org>
References: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
In-Reply-To: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver includes the legacy GPIO header <linux/gpio.h> but
is not using any symbols from it. AFE has a custom GPIO
implementation that is not using the kernel GPIO framework.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
index 165663a78e36..de5e1deaa167 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
@@ -6,7 +6,6 @@
 // Author: Shane Chien <shane.chien@mediatek.com>
 //
 
-#include <linux/gpio.h>
 #include <linux/pinctrl/consumer.h>
 
 #include "mt8192-afe-common.h"

-- 
2.34.1

