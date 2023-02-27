Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 782686A4750
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Feb 2023 17:54:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbjB0QyY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Feb 2023 11:54:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbjB0QyX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Feb 2023 11:54:23 -0500
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B07CCE060
        for <linux-gpio@vger.kernel.org>; Mon, 27 Feb 2023 08:54:22 -0800 (PST)
Received: by mail-qv1-xf35.google.com with SMTP id ks17so4860559qvb.6
        for <linux-gpio@vger.kernel.org>; Mon, 27 Feb 2023 08:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GT3yo27/iyE3ftjpK15xUq/iHGuU57UV8rMJUk1iNQ0=;
        b=SAqUtWg4esO0p5lR3DNw3c4nbEBdN992nHx2Jnq5U9w6sCJ8s0Aurn/0Do9NPKbr59
         /vJm87yamx2d/HrUW7n5kfDv6NgmMFPr4W7eQxbBQEkthc0IlbWWSPQPp6Is4Kx4DKzQ
         d5vICWrMAT0Vat/J/rRQoU8LilJ5g3llJGM+BU49wk5/BX+KKHT3ABRJX0ixUqToNCem
         39/juYL5OjwL9olcMS7MjzKTsHBaxTzHnxbYEJUH6Pzng/DjUNnwWhClttTOoCQvrSRG
         UEof1HPD89QXEcpeGZ9O6yCSyQezXZYWNrlolvRJMz6BojZrgHNjXtkT0C3MngAfKbM8
         flIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GT3yo27/iyE3ftjpK15xUq/iHGuU57UV8rMJUk1iNQ0=;
        b=MU1rl2qff3XymhD8WeRgjKBaYqWhiNRPfWv+FXxVruG9nkC1uhzq7nw486ldsc2wqS
         qt/bbPOlxjoFe7//ROcVHjpy2cn4DW055VrlpfZi7idkZRxJgKoFNll4O0Bp/F2OEvXR
         m+pJrzEqhSkBFx3rmePP+KM2grbQDRh2j/8d25MT+ddGQIRFwmFYhNg/Tdf04PfwCfxr
         0kauDNgwdclAlRrcG0lEpQNt/YWmOyW98GXE7843iKtpzUT3o7cZkAMUCttA2cOdI9he
         wT875H3JpKBPoZm3tqEdPiaMNvh6o49f2t4Pf18VN4WMIkOZ1w0uvchjHmTmyZ3CP/kZ
         J4vw==
X-Gm-Message-State: AO0yUKUvI0BJCYcTiJm/7aw547ZGc7/gg13Jc1ElpdxPCCHafMKJTQjs
        B4hZGroIYaWNNbMNmFs4UXn9kuyn7IyL/YxK
X-Google-Smtp-Source: AK7set++VU1WC9yFaHijSjPiurX1b4Z8rM7F+BGe/P7jJ4cmC9STViwfFQ9PvosfNrBCahKvgC/ciw==
X-Received: by 2002:ad4:5d61:0:b0:56f:d8:dbb4 with SMTP id fn1-20020ad45d61000000b0056f00d8dbb4mr333401qvb.2.1677516861818;
        Mon, 27 Feb 2023 08:54:21 -0800 (PST)
Received: from fedora.attlocal.net (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id x15-20020a05620a098f00b0073b929d0371sm5238714qkx.4.2023.02.27.08.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 08:54:21 -0800 (PST)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     linus.walleij@linaro.org, brgl@bgdev.pl
Cc:     broonie@kernel.org, andriy.shevchenko@linux.intel.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        William Breathitt Gray <william.gray@linaro.org>
Subject: [PATCH v2 0/6] Migrate IDIO-16 GPIO drivers to regmap API
Date:   Mon, 27 Feb 2023 11:45:21 -0500
Message-Id: <cover.1677515341.git.william.gray@linaro.org>
X-Mailer: git-send-email 2.39.2
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

Changes in v2:
 - Utilize memset32() to set status_buf for no_status case
 - Utilize GENMASK() to generate status_buf mask
 - Move no_status kernel doc line under runtime_pm line
 - Add comma to end of idio_16_names initialization list
 - Set io_port to true in idio_16_regmap_config

The regmap API supports IO port accessors so we can take advantage of
regmap abstractions rather than handling access to the device registers
directly in the driver. The 104-idio-16 and pci-idio-16 modules depend
on the IDIO-16 library and are thus updated accordingly.

The 104-IDIO-16 lacks a status register (as does the 104-DIO-48E), so a
no_status flag is introduced to the regmap-irq API to properly handle
such cases and avoid hacks. The 104-dio-48e module is updated in a
subsequent patch to take advantage of this new no_status flag.

By leveraging the regmap API, the idio-16 library is reduced to simply a
devm_idio_16_regmap_register() function and a configuration structure
struct idio_16_regmap_config.

William Breathitt Gray (6):
  regmap-irq: Add no_status support
  gpio: 104-dio-48e: Utilize no_status regmap-irq flag
  gpio: idio-16: Migrate to the regmap API
  gpio: 104-idio-16: Migrate to the regmap API
  gpio: pci-idio-16: Migrate to the regmap API
  gpio: idio-16: Remove unused legacy interface

 drivers/base/regmap/regmap-irq.c |  22 ++-
 drivers/gpio/Kconfig             |   7 +-
 drivers/gpio/gpio-104-dio-48e.c  |   6 +-
 drivers/gpio/gpio-104-idio-16.c  | 294 ++++++++----------------------
 drivers/gpio/gpio-idio-16.c      | 255 ++++++++++++++------------
 drivers/gpio/gpio-idio-16.h      |  80 +++------
 drivers/gpio/gpio-pci-idio-16.c  | 296 +++++++------------------------
 include/linux/regmap.h           |   2 +
 8 files changed, 326 insertions(+), 636 deletions(-)


base-commit: 4827aae061337251bb91801b316157a78b845ec7
-- 
2.39.2

