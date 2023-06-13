Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E28172DABF
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jun 2023 09:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234076AbjFMH1R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jun 2023 03:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238809AbjFMH0t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jun 2023 03:26:49 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53FFDC0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 00:26:48 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f7a8089709so54054035e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 00:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686641207; x=1689233207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LP98y4IZweGqJKVGZoU573tmeNCZH8suO4M0JRT35gI=;
        b=405WpwcmvkCyKI9Qiiky1iwD/YnddJ6iDrKigQ0s3uZkgRCpoIyiQdYE2HjNgwc+RX
         LfEq4UC8njNkj1qTK1SlXWYL7eaPSGywVGGMbCmSwGy3DXaihl/KwxWN1cjjD8I2+eVX
         wpXEyptqOGQuQ53ec7DA6n/xw+3HrJCP2wh5Y9fnrb+x+rFuntFV6GTCM4FrkYZHwCpg
         Y25OwiwQMumizzkY5eV0x3xUihpCAkyutv4nTskRIX5Pa/xSApr39aUJroGnb/7Fsz6Y
         sA54UHOki/HcUvlQlJqWuZB38E8bPV17zTlDyQR2B8tU89qmucWEnTYOJJkHyzV34Lo8
         MtTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686641207; x=1689233207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LP98y4IZweGqJKVGZoU573tmeNCZH8suO4M0JRT35gI=;
        b=W5tYlpTK9TxkemhGJa3EXpEae0vYbQv6j7h7L1hcwINThEqZJEHZX0NJNwmyWLA4Mx
         JK7TJozj+z+Cy0Gm5u+shsjYH4sOKQmQFeh1mtRhS0vBhxzkUaugCkZs3R7e4fCtMij+
         oDDn9HaSfsvHTrdtJWvcKVCKGxWfQ/nXAwyk1LZP3t9hNhiFgwZBPzjAWPWIOqaB5KU9
         9yRWORcb67yY5w+sdHtkxHWQytJg7KGbbINEqVqsCpwKYnZsnhP+rVmrew8yZX66PMYq
         +8rXaB6GgL5FTHMysslDGBBr+kxkeYdzLYfdwuFTml0llZ0K3ioWLNfVn+I9UGA1/9U7
         Vnlw==
X-Gm-Message-State: AC+VfDyH4DdL6/onNYHs7uwKioM48caUD5a9INi3V8JFI56rKN6UFhP2
        7Za0UWqpsBx1HOYWJedG1CnMRw==
X-Google-Smtp-Source: ACHHUZ59l/kRz4M+nTfXz7e9hvOtojkNLk3jlNuBl1GACcCS+KMER7ROTlGskJLhHaYGVrbyiAIR9A==
X-Received: by 2002:a1c:ed15:0:b0:3f7:b1de:f95e with SMTP id l21-20020a1ced15000000b003f7b1def95emr8800172wmh.0.1686641206740;
        Tue, 13 Jun 2023 00:26:46 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:dff5:3901:b252:3f9e])
        by smtp.gmail.com with ESMTPSA id h25-20020a1ccc19000000b003f8c5ceeb77sm1548821wmb.21.2023.06.13.00.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 00:26:46 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] bindings: rust: add missing license and copyright boilerplate
Date:   Tue, 13 Jun 2023 09:26:43 +0200
Message-Id: <20230613072643.105576-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Make reuse happy again by adding appropriate license and copyright info.

Fixes: 1f8085953086 ("bindings: rust: build against pkg-config info")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/libgpiod-sys/wrapper.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/bindings/rust/libgpiod-sys/wrapper.h b/bindings/rust/libgpiod-sys/wrapper.h
index 8a8bd41..e5cdfa0 100644
--- a/bindings/rust/libgpiod-sys/wrapper.h
+++ b/bindings/rust/libgpiod-sys/wrapper.h
@@ -1 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
+// SPDX-FileCopyrightText: 2023 Linaro Ltd.
+// SPDX-FileCopyrightText: 2023 Erik Schilling <erik.schilling@linaro.org>
+
 #include <gpiod.h>
-- 
2.39.2

