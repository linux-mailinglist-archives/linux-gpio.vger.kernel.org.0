Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B22766D86B
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jan 2023 09:42:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235651AbjAQImI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Jan 2023 03:42:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235828AbjAQImH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Jan 2023 03:42:07 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A61D27D7C
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jan 2023 00:42:05 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id y19so10432749edc.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jan 2023 00:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=axxUz7RvaHoSoTKwEQa6sNYkdRJbp4GwjwN1pCfVis0=;
        b=USB2qdVFWqwTenuTM3ziGb0uhKZMKDXcc4ci5aJNTIjRWAQ+Ir3V5QpxgGIbxBrES6
         lmRX6pzfZMphF5R803J3OYhUB0A3WGrAcB9ToZX4kG6zwmLgsKtfjQHEn1FIdlSooUrG
         1IFdekZHewqeMWhNa5q+hLPEgU8axUImMqz3TRSzI76g0SWVKX2lzjRwCyvrhIs49s5d
         Q6ydE4xu4lelTnR44qYUlYp5pVecdP8VyaMapRF7fVRXolsqW+NrZcUe7N10ulMyfT7C
         uArzgaYp80U7CqjJn1yAzEQq6llZZ9jEhI/iwXM11YkynTZsHMHuapoPuGodm5/2+3kI
         BD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=axxUz7RvaHoSoTKwEQa6sNYkdRJbp4GwjwN1pCfVis0=;
        b=DYXGOb7zBZWwu+I6xFW22tb0yb1vE2XCi8mZMb/XujRn4gRpKPNa/ENFndrH3m/4hr
         922BQE5VRKJl3HDpyH17UZocJ/dl+HW3Nn2+3d4Tm04KR1/8VgRnBqjX1RsF6CAaC7Qq
         FnzpRY1bC0lyacG6XgNZmFBcTL2/1sG3L2FSneEDESs9rpRU6oU8v4lOOZCZFtIW7xnT
         TuH/ELWjo9KXzgHQ3+SzcPrpPR87NktLc688lCP9VJTOv+9Hq3cA5ywlNG4+HjwueEze
         WPC8iIMB83OxPu8jiaakz3wpsVkiUbGHT8+7hxO47gNWkUFJ7LkLL1Jl5ZB1JKB3HVLA
         hvjQ==
X-Gm-Message-State: AFqh2koIt+irNdImiUg7U5oOQbY+8x0uR8VFEON01AoWvEpSIKd5CRQv
        hC5ZV2G5+BS3wtRyXKn5KDgw0g==
X-Google-Smtp-Source: AMrXdXsCAoyL92QQjslRbGg8t2b1P7ik0eFUW8sEhSjsm6fqUp4YAEQJ7YE8WNCglkf1/QOaAkYTLQ==
X-Received: by 2002:a05:6402:548f:b0:49c:1fe4:9efc with SMTP id fg15-20020a056402548f00b0049c1fe49efcmr2378229edb.40.1673944923968;
        Tue, 17 Jan 2023 00:42:03 -0800 (PST)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id ec49-20020a0564020d7100b0049e249c0e56sm1508833edb.56.2023.01.17.00.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 00:42:03 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2] hte: tegra-194: Use proper includes
Date:   Tue, 17 Jan 2023 09:41:59 +0100
Message-Id: <20230117084159.485234-1-linus.walleij@linaro.org>
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
header <linux/gpio.h> so include <linux/mod_devicetable.h>
explicitly as well.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Its mod_devicetable not mod_device_table oops.
---
 drivers/hte/hte-tegra194-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hte/hte-tegra194-test.c b/drivers/hte/hte-tegra194-test.c
index 5d776a185bd6..79eb866558d3 100644
--- a/drivers/hte/hte-tegra194-test.c
+++ b/drivers/hte/hte-tegra194-test.c
@@ -6,10 +6,11 @@
  */
 
 #include <linux/err.h>
+#include <linux/mod_devicetable.h>
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

