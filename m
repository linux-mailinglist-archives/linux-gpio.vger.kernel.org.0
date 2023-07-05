Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3088B747E69
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jul 2023 09:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231823AbjGEHm3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jul 2023 03:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjGEHm2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jul 2023 03:42:28 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78307E6B
        for <linux-gpio@vger.kernel.org>; Wed,  5 Jul 2023 00:42:27 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31297125334so319568f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 05 Jul 2023 00:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688542946; x=1691134946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7dk9ce0jXjFa0TFArGQim00ZSqvMhXbYqLFgOD0fpTU=;
        b=cMuM8Ejwpg/67aF81APkttwEHy64RXXWTro51GWL5oJzbt2YI6kDNfqqniJ+RcUXKT
         HlbWcqubMVkljX0RBnzJXSt4ULmTnnxnsQSKTBISL6NtmKIby6KaPBB0oZVlaN97oJhk
         wbBC6uxYFobMDzs0jpFYu2BPlX4mGEObPEHPjYCwsuN4Xewt8IpqDrYlPfWA67kweG2U
         NOgtrXcg/T4R1habnOAXYI2+PvXN+UxHec8m00mE6d5m/913ykZ1qfJL/iidL5VPvwev
         6VIOUvUTuyvMXJYkl3t3GvX0Zv68W2w0LV9g0FuVXemyK2t+7av+QBJmVos5gmh9uDoa
         4zYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688542946; x=1691134946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dk9ce0jXjFa0TFArGQim00ZSqvMhXbYqLFgOD0fpTU=;
        b=MvLupLB483mDBBRlkRxZUBPKzdtviupiTcBZQXRq42VTK5Oye6DmpPNHV30cC/cmip
         EzAFT3BjC/+pr/NpUKEhGi4yjWZP0nXOq5JJgJXI0SZlLB5Ozir0C01Ql+Ug47QIxRQr
         YPsncAcPiMe6wObsy9Sn9Qhk+BQT0JRYNGMb0L4tti5qzsaMcVQtWrEq9yY+jJ7nlrdy
         5iBTmEOdVkz7rkG23Pld32nHNDABJROpJtdMA/sFdy12FLgqKjgRW3R+wiEN5IduOtxP
         Bj79pHpLrvsDK3Lb0JESEsIOgjkmY+vWL/cXExrN5/vkGrcaoKW4WvSVSXfEs3dD3C5y
         j6Jg==
X-Gm-Message-State: ABy/qLaaAiaLLfcLouz+X+t4+s9D8V+TaXSweFYU64oubQOIIyaSJ4SJ
        /xjQ+f//ahp5TUWB2svyA8kEBb2ShsU82SB1dxI=
X-Google-Smtp-Source: APBJJlHxXAZ5yCI9x3BSLdbfuHbEbV1vjlS2IasMhG3L3OGKzvATge8TLbhsKdmnNGRhUTc0duT/QA==
X-Received: by 2002:adf:f589:0:b0:314:3a9a:d70e with SMTP id f9-20020adff589000000b003143a9ad70emr1350174wro.11.1688542945856;
        Wed, 05 Jul 2023 00:42:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:65b1:7d95:6bda:249e])
        by smtp.gmail.com with ESMTPSA id d13-20020a5d4f8d000000b003063db8f45bsm30254122wru.23.2023.07.05.00.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 00:42:25 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpiolib: add missing include
Date:   Wed,  5 Jul 2023 09:42:19 +0200
Message-Id: <20230705074219.8321-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

gpiolib.h uses notifiers but doesn't include <linux/notifier.h>.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index cca81375f127..1409d52487c0 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -14,6 +14,7 @@
 #include <linux/err.h>
 #include <linux/device.h>
 #include <linux/module.h>
+#include <linux/notifier.h>
 #include <linux/cdev.h>
 #include <linux/rwsem.h>
 
-- 
2.39.2

