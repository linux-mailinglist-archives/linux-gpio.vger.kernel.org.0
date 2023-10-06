Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 965D27BB9BA
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Oct 2023 15:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232571AbjJFNra (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Oct 2023 09:47:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232604AbjJFNrI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2023 09:47:08 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E03EA125
        for <linux-gpio@vger.kernel.org>; Fri,  6 Oct 2023 06:46:35 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c1886777d9so25664831fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Oct 2023 06:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696599994; x=1697204794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Asgb8OAKdQDCRC4VclzbwAu62WhyUIsTAbJjeqQexwE=;
        b=r3Drxtynyg9sU5uEO1LyIP1bt9R6q4O1eVXJ7hWMsiV4c0r+3/TIvZRgfpFmJpDYJm
         Kpg+G5ogDH6T0WU0O/Z2UrqZhLoSk8O1Y2X2J6N/rZKoMRRkIugvsDwkGqKLHSLztEU7
         100YXqhjktRPItWwgUQAgomhHobeo1GUsP7CTB78/k8j5G16ieoUW+gJmujqJCAzbnck
         mvZtUW4B6BH1V5i5vOO9IJs19AidI3SkLNGOZpE0GM5b7IBAtEA1qyhuHBudTKbmopcd
         5H/8u5B74dMkmbVB7Hoe8SvYOVljO0/MrraPepVe378AY4GJj3bIMcHOLW4OXd+9Og52
         6+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696599994; x=1697204794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Asgb8OAKdQDCRC4VclzbwAu62WhyUIsTAbJjeqQexwE=;
        b=qcF0Ldkxy2feBxUwCmH0CEc353lTpToHpuVsVoWrH54jvQ8tc7gpTKxZOzOkjhA9eo
         2tEELQ85Dvf5ug5ubKtwVWhGSI97FW0avZtRyPQ2O78IYk1LkfEvyc7/D741YwI/OqAp
         9xpFnr0ScmduCXcxGLqRJqrSgGLPwRPzbd91XR56zE7sDPAXYT68/eynP2vXZQTWyZkk
         Lx/TydQUAuBrYfKFQASkC1bNjoNct6mw7sm89fSauSEXRqm7UpA/+QlHgpYkMNfGNwX8
         gaFY9PHEeQQKYzAsPuXvlo04zkATM2zBRwA4tBd1v9oKS58jntcisc1DXhzTDlfzth55
         DJ5g==
X-Gm-Message-State: AOJu0YyGwZiVB5PNJpy/9TUiAsjTAYr9a4oDewqIJWDSIeKZdoEBigIh
        Vs63nrEKxZDIr4cvSi+a+7wDuwPTcH1Yl/lBzGw=
X-Google-Smtp-Source: AGHT+IGQ+oeljBRtveNq+5wlJ3DdWNUKKe6FvbxRXepDt1efr2ZvhVToivpHhLNanf/lPPVIIHZ25g==
X-Received: by 2002:ac2:5b02:0:b0:500:bb99:69a7 with SMTP id v2-20020ac25b02000000b00500bb9969a7mr6257290lfn.14.1696599994019;
        Fri, 06 Oct 2023 06:46:34 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id v25-20020a197419000000b004fe37199b87sm308733lfe.156.2023.10.06.06.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:46:33 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 06 Oct 2023 15:46:30 +0200
Subject: [PATCH 7/8] ASoC: mt8186-mt6366-rt1019-rt5682s: Drop unused
 include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231006-descriptors-asoc-mediatek-v1-7-07fe79f337f5@linaro.org>
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
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver includes the legacy GPIO header <linux/gpio.h> but
is not using any symbols from it. AFE has a custom GPIO
implementation that is not using the kernel GPIO framework,
so it need not include it either.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c              | 1 -
 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
index f12e91cc4fcf..9e86e7079718 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
@@ -5,7 +5,6 @@
 // Copyright (c) 2022 MediaTek Inc.
 // Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
 
-#include <linux/gpio.h>
 #include <linux/pinctrl/consumer.h>
 
 #include "mt8186-afe-common.h"
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index 9c11016f032c..87ec39a5e1f4 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -7,7 +7,6 @@
 // Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
 //
 
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/input.h>
 #include <linux/module.h>

-- 
2.34.1

