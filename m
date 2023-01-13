Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC25A669357
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jan 2023 10:53:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240885AbjAMJxF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Jan 2023 04:53:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232463AbjAMJwW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Jan 2023 04:52:22 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DF7D482BD
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 01:47:53 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id j17so32370513lfr.3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 01:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mMDcJloPPpon31SXRmr+wIniR1v+TNn4h85LvZS+4mw=;
        b=QmSeN2ExkmWtu3Oz6pMG0SU20DjUqjYhgl9Ev7DJvIgzLyC9bafTOBLL90KQtJKaiI
         GMr02PivL8YUkpg7lAN4k/vXYo7Ytr1Lqhv6fpojldy4K5rgKvPsZQkRmcPSqC6/vySj
         XJ6qQ2MlS6k/1KhJZkpHZ5eQTKjoh6PAUL8AUdApPdbrEpOzrl1pSg+j9Hv2RYqC/qTa
         8S94GUbSMRAmOsMcLrajXRao533Gi4w6i6xLVISi5wzDBED1vsqWudrIsSVauqK8nXiV
         pbMcDbV76ApUEvyEpeEhA007B2XlpryB0Shvp17R0pomdbDDYAKXhx2MDXMQr7Swaiw+
         Aiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMDcJloPPpon31SXRmr+wIniR1v+TNn4h85LvZS+4mw=;
        b=Et4kkoNc8Zh+Xdd17jsrta0boQa9Yc164rKMBaItlmPHRQds/5N2dYdAUcRq9wW82u
         oAUTm+0EoYstYXbubJrKGPT1YZqOVSKAOvFKJDpVC9bQ1zxaYgx2gL8dl+zev5l61mTX
         MrbBs4XpVkEqLX3tylxwUHH+HapFPkWAliY41m2s9nCN8bqqUA+oU5jLi6qCRBiXMjN3
         fBWdjTwqo1C8IP9ogYP9B4Vl0OrW+pvoc5fzKnLyRkFWK46kT9aBHFEK+yQWSL6NKfBo
         7h3GuHfdFmyPuh74rBJq++0de0Aiu8KxJZynTvze75Foxxmjv4jiBCu4rKc0Nu1UWNxy
         fkig==
X-Gm-Message-State: AFqh2krjcWrAjRen2HpCBegGLZFvMFBjzxjhZv8aTxgnUQpTIzF9qGzD
        MW2YOocS6UlgHDOw6rNMm9hmRg==
X-Google-Smtp-Source: AMrXdXu2RuvCI+VFyDd5Bv51Td4/kqS8TQuC829IU+u+V+qJS3ZHJ/IW5R4JElAcio9VBrqn8P2o/w==
X-Received: by 2002:a05:6512:3601:b0:4b5:9bfa:801a with SMTP id f1-20020a056512360100b004b59bfa801amr18880493lfs.46.1673603271776;
        Fri, 13 Jan 2023 01:47:51 -0800 (PST)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id w29-20020a0565120b1d00b004b6e9530900sm3726712lfu.110.2023.01.13.01.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 01:47:51 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] hte: tegra-194: Use proper includes
Date:   Fri, 13 Jan 2023 10:47:47 +0100
Message-Id: <20230113094747.247427-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The test driver uses the gpiod consumer API so include the right
<linux/gpio/consumer.h> header. This may cause a problem with
struct of_device_id being implcitly pulled in by the legacy
header <linux/gpio.h> so include <linux/mod_device_table.h>
explicitly as well.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/hte/hte-tegra194-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hte/hte-tegra194-test.c b/drivers/hte/hte-tegra194-test.c
index 5d776a185bd6..a255ec3f8e8d 100644
--- a/drivers/hte/hte-tegra194-test.c
+++ b/drivers/hte/hte-tegra194-test.c
@@ -6,10 +6,11 @@
  */
 
 #include <linux/err.h>
+#include <linux/mod_device_table.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/interrupt.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/timer.h>
 #include <linux/platform_device.h>
 #include <linux/workqueue.h>
-- 
2.34.1

