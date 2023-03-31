Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A38A6D29B8
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Mar 2023 23:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232327AbjCaVFs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Mar 2023 17:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231879AbjCaVFs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Mar 2023 17:05:48 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 438871D2DD
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 14:05:47 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-53d277c1834so438130007b3.10
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 14:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680296746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aHpsEXh+XpAxCWpr3Cte+htUGysO3Dti3H2d6IAR4mQ=;
        b=Z4ek3ta9kJismkwrHvPkAUPaJCY9tV54tEwL206CX5GwX8XY03fQL3dyFDV44NwdJo
         GEZGbb1ILRyF8xuGH4LZbu+RpdW1dNPvMpnOQVBT5GYxHUoPjOmSubckNC7/LHVRLffR
         PlDgZLYPTjpuruZGXpTMNiw7+kxKNLakEG62NAfogZ4MOW3DUPN1ZsMw9oOeqVgNVRJU
         UzN7FvvQJGrtaQPbxQXCCfrRefH2XMt+efoSlIvi6R/GPrF/4Ai3NdRvdGkwpSVN9dIq
         FRtPCtk4bryAD/BSjqe8tSwN46Q+ia74zr3HWnvj7xJbr8x6JIaHo3z1V6Vp/QkHX9GV
         SzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680296746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aHpsEXh+XpAxCWpr3Cte+htUGysO3Dti3H2d6IAR4mQ=;
        b=5y9T3AFAEYwRCJTox3TEzGdU42vjBw0qopaow+Zf4YYWKtmVKr6oH1h9HufimpLxVJ
         vTQYKg1MSrJ9CWsJxgh27sgOqvVzaxZ62dgt0jeBBt1Ke2wCkUH+zhqC+vSBkyszDIIZ
         Gi0wB+QdI93nmeWNU/ScWVtVNk1CP/NBDXVrgW+1jOdBYmLbIltOG0Zg/0+JWco1Mxic
         L+lsXOLY5Vn7Ubk24Ka/jJsphmEJl5GPtNTbFHqkWpnplChJ/aMLY2cKhfV45oWXeV5f
         0zmHa92n1ol3ho8WmL3wUdRJbm5xIV1r1ezxC385+9t8fabilLdGTds1OD3nym1mDk2f
         bEZQ==
X-Gm-Message-State: AAQBX9dhuPvo40eTzOAnDREr2pnzhkz0hNiwNsByetw+tnO/BwGjpY3l
        g6Roe9xkXsQrsLGtHpjr7MylMQ==
X-Google-Smtp-Source: AKy350YN5/0QR8U4y3y7DiGXsBLHMtG0uEiyh1v8kLneIvF/sW0eOuKrVJrGx1rdFlBmeik8LqiMog==
X-Received: by 2002:a81:5549:0:b0:544:85d9:ae38 with SMTP id j70-20020a815549000000b0054485d9ae38mr10122387ywb.13.1680296746455;
        Fri, 31 Mar 2023 14:05:46 -0700 (PDT)
Received: from fedora.attlocal.net (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id q70-20020a81b249000000b0054601ee157fsm751990ywh.114.2023.03.31.14.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 14:05:45 -0700 (PDT)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        William Breathitt Gray <william.gray@linaro.org>
Subject: [PATCH v4 0/4] Migrate IDIO-16 GPIO drivers to regmap API
Date:   Fri, 31 Mar 2023 17:05:22 -0400
Message-Id: <cover.1680296343.git.william.gray@linaro.org>
X-Mailer: git-send-email 2.39.2
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

Changes in v4:
 - Remove superfluous base check in idio_16_reg_mask_xlate()
 - Format idio_16_names[] to 8 GPIO per line
 - Utilize dev_err_probe() in idio_16_regmap_register()

The regmap API supports IO port accessors so we can take advantage of
regmap abstractions rather than handling access to the device registers
directly in the driver. The 104-idio-16 and pci-idio-16 modules depend
on the IDIO-16 library and are thus updated accordingly.

By leveraging the regmap API, the idio-16 library is reduced to simply a
devm_idio_16_regmap_register() function and a configuration structure
struct idio_16_regmap_config.

This patchset depends on the "Drop map from handle_mask_sync()
parameters" patchset [0].

[0] https://lore.kernel.org/all/cover.1679323449.git.william.gray@linaro.org/

William Breathitt Gray (4):
  gpio: idio-16: Migrate to the regmap API
  gpio: 104-idio-16: Migrate to the regmap API
  gpio: pci-idio-16: Migrate to the regmap API
  gpio: idio-16: Remove unused legacy interface

 drivers/gpio/Kconfig            |   7 +-
 drivers/gpio/gpio-104-idio-16.c | 286 +++++++------------------------
 drivers/gpio/gpio-idio-16.c     | 254 ++++++++++++++-------------
 drivers/gpio/gpio-idio-16.h     |  79 +++------
 drivers/gpio/gpio-pci-idio-16.c | 294 +++++++-------------------------
 5 files changed, 289 insertions(+), 631 deletions(-)


base-commit: 4ea0c97776bf8c63805eb0f8182d9c20072219d9
prerequisite-patch-id: cd19046150b7cff1be4ac7152198777aa960a3df
prerequisite-patch-id: bd3e3830d9ce4f3876a77483364d7190b7fdffa7
-- 
2.39.2

