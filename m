Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B17846DAC55
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Apr 2023 13:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbjDGLuO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Apr 2023 07:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231250AbjDGLuN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Apr 2023 07:50:13 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DC737A83
        for <linux-gpio@vger.kernel.org>; Fri,  7 Apr 2023 04:50:12 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id i20so2163395ybg.10
        for <linux-gpio@vger.kernel.org>; Fri, 07 Apr 2023 04:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680868211; x=1683460211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qGYxOnCO4fdyW1zjZ7kMdbvesDIV9vyeIW/AoUlrSts=;
        b=oVLErXRr/Kmx7HufeKwINH6cuaoaPh1yQw7sbQ+xrknhZtIfbsP1ElfPR6Wm1u4zuN
         gjh3dOb8AKkHOuusNlQ3DPsnJHPZvKyA2z5TzxY1s2C9N2e5mQUt7fDDCc1vOAGEDr47
         PmdCmdTPhOqKQC/hY+4inGbrrSVHliHvvj6Z8PAPhZ1JXpUx1J7YgUxEOCyM4l3RO7Vx
         MgkzugthftV/z4u1ZSQPn1KDcoSGevKn3lXED9hoOQW4Fcs1T0sgEwWu9PMPv6ikreEG
         kUYMT4TLTWfIl3qJ9Qnek21Rzctpdy7OmCVyowJ2ykxd9/so75a/J4dd6NG/bwFQE/RM
         MbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680868211; x=1683460211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGYxOnCO4fdyW1zjZ7kMdbvesDIV9vyeIW/AoUlrSts=;
        b=oWhi07ExFUY6fe2f5b1kYpup06VgFBtJn+ShqanCBYYWlN/BWMpS8YdbtiBsgjRf/9
         oo3Xww2EWYq9KFqeK7eNYQhoyGBD/sQwRJM/83bENMnZ+SDWSpTXTvkiQlMmYky4eTkD
         y6CpshC46unBQyvl8a8gA8iHBtvLJeaN/Bwt79OQ9XrafCAlXqxjc7wvRzXjF+vBUzm8
         WkyTqjp7Li2fuoKCUbjquucdwaQzOhIL0gEbf0Cek3tCqqjWJTZlftD7AE9DIVEbarpl
         9tpEu0yGC1bAnEKsLBnDnj0OqnjfT+i0u0Us/l31GrL6Vfljh14k7fPdy4IWLOalPgwC
         OaKg==
X-Gm-Message-State: AAQBX9ePXhso4mXwesI4RnGZ15HRiZHT32oxCabUlkXO6CwLCBTNB3Jl
        3e/xYSYbgXJJJXiCNYw3g/VKKDk7HRKAu/dCZuiGFA==
X-Google-Smtp-Source: AKy350bEO9spsM3jAp8N9f++M0C4fgFNwevDSTrl4hVHJunpPYmUoIQM7VSwJ1UresJySHkhewo0JQ==
X-Received: by 2002:a25:fc1:0:b0:b3b:88e8:4b89 with SMTP id 184-20020a250fc1000000b00b3b88e84b89mr5566464ybp.15.1680868211590;
        Fri, 07 Apr 2023 04:50:11 -0700 (PDT)
Received: from fedora.attlocal.net (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id bw28-20020a05690c079c00b00545a08184bfsm955644ywb.79.2023.04.07.04.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 04:50:11 -0700 (PDT)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        William Breathitt Gray <william.gray@linaro.org>
Subject: [RESEND PATCH v3 0/2] Drop map from handle_mask_sync() parameters
Date:   Fri,  7 Apr 2023 07:47:31 -0400
Message-Id: <cover.1679323449.git.william.gray@linaro.org>
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

Changes in v3:
 - Inline dio48gpio->map usage in dio48e_handle_mask_sync() to avoid
   redefining map parameter

Remove the map parameter from the struct regmap_irq_chip callback
handle_mask_sync() because it can be passed via the irq_drv_data
parameter instead. The gpio-104-dio-48e driver is the only consumer of
this callback and is thus updated accordingly.

A couple pending patchsets also utilize handle_mask_sync() [0][1], so
it'll be useful to merge the changes in this series first to avoid
subsequent noise adjusting the dependent drivers.

[0] https://lore.kernel.org/r/cover.1677515341.git.william.gray@linaro.org/
[1] https://lore.kernel.org/r/cover.1678106722.git.william.gray@linaro.org/

William Breathitt Gray (2):
  gpio: 104-dio-48e: Implement struct dio48e_gpio
  regmap-irq: Drop map from handle_mask_sync() parameters

 drivers/base/regmap/regmap-irq.c |  5 ++---
 drivers/gpio/gpio-104-dio-48e.c  | 37 +++++++++++++++++++++-----------
 include/linux/regmap.h           |  3 +--
 3 files changed, 28 insertions(+), 17 deletions(-)


base-commit: 03810031c91dfe448cd116ee987d5dc4139006f4
-- 
2.39.2

