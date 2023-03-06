Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA21E6AC00B
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 14:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbjCFNAH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 08:00:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230307AbjCFNAG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 08:00:06 -0500
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD2328849
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 05:00:05 -0800 (PST)
Received: by mail-qv1-xf35.google.com with SMTP id bo10so6467197qvb.12
        for <linux-gpio@vger.kernel.org>; Mon, 06 Mar 2023 05:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678107604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jEHTLMmujJHBFvBaZCO0u2PeOg0NT5TkLoWfy/fOSX0=;
        b=r3tcugG5pU/ghMBTbRo47hxsGBCaCcDSCOQztrjJNDCuHD49b2qr08Mz4q4Hl3Nazi
         yuBAsUl5twFUrbhQ+t3Pf6cXke7gksQeAVABTBT2PhJpid62g/cvjto/I65786jmDoL4
         UjDRHcSNC0x1jJtuX1taptcJkaYjY5Aerg1cl9vt2WZSnb46iKOhYt/695XJmcJnDgbY
         3Vuww5KqdIx9PIP7gKbZbgyWFfzpNU9W/QsSuQjX8k3QcGQpkQ6s8rgzkCs3M54RurRK
         mr8wXdX0xgEHo9QwbTQnQ8Z5lC6fg8xDVfz3ZqTt9u7B3OHcAgIzKeJA69GHQS4N9Y99
         tvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678107604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jEHTLMmujJHBFvBaZCO0u2PeOg0NT5TkLoWfy/fOSX0=;
        b=VzQ8jxPzqcN5KeKYhEtGz0u5Wy4Db5vw2QuD8H9bxutEVs+TOo32XG306MO/wv8Shm
         ddgBJBj1j2nVRlMQxjIvbn4YHrMCvRlqlENVv5C2Dv7Xnx96Vfu5aPnWtFTgCRB1PSYS
         9i1cu5Rvlkn+2J+RiL447Y2675KZLKl1ZvoexWxARI1UiuUz6o/plUlATCVJEZjV48lr
         LPe6tThzUdtduaClQmuYBniKXrwexr8wzYN76EbK7xyFyeg8snQX+MNiUnGZOFdm2PtD
         8XWvMH4oxmsURSHn0A4+soPxdBdyq2q92M1zxixMsUyfJYnIBVFovEwZQkkMz4db/mR6
         42yA==
X-Gm-Message-State: AO0yUKWUHwZXyOX80okdpRVl1BKK8cjgQpF1xbVo3ib/AAH1m5etO9qf
        6NKpJw6g6Ln778EwBp2tcL2K+w==
X-Google-Smtp-Source: AK7set99ljkA7CMz7p4udBuSdxVuWUjt5wiCeogATTDEVpN8VO8mU8mnjAA9jiyw6elKiBubljLT2g==
X-Received: by 2002:a05:6214:300b:b0:573:179:3caf with SMTP id ke11-20020a056214300b00b0057301793cafmr16634281qvb.2.1678107604178;
        Mon, 06 Mar 2023 05:00:04 -0800 (PST)
Received: from fedora.attlocal.net (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id w19-20020ac843d3000000b003bfbf3afe51sm7419187qtn.93.2023.03.06.05.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 05:00:03 -0800 (PST)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     linus.walleij@linaro.org, brgl@bgdev.pl
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        broonie@kernel.org, andriy.shevchenko@linux.intel.com,
        William Breathitt Gray <william.gray@linaro.org>,
        techsupport@winsystems.com, pdemetrotion@winsystems.com,
        quarium@gmail.com, jhentges@accesio.com, jay.dolan@accesio.com
Subject: [PATCH v4 0/3] Migrate the PCIe-IDIO-24 and WS16C48 GPIO drivers to the regmap API
Date:   Mon,  6 Mar 2023 07:59:50 -0500
Message-Id: <cover.1678106722.git.william.gray@linaro.org>
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

Changes in v4:
 - Allocate idio24gpio before using it in idio_24_probe()
Changes in v3:
 - Drop map from set_type_config() parameter list; regmap can be passed
   by irq_drv_data instead
 - Adjust idio_24_set_type_config() for parameter list
 - Add mutex to prevent clobbering the COS_ENABLE register when masking
   IRQ and setting their type configuration
Changes in v2:
 - Simplify PCIe-IDIO-24 register offset defines to remove superfluous
   arithmetic
 - Check for NULL pointer after chip->irq_drv_data allocation
 - Set gpio_regmap drvdata and use gpio_regmap_get_drvdata() to get the
   regmap in idio_24_reg_map_xlate()

The regmap API supports IO port accessors so we can take advantage of
regmap abstractions rather than handling access to the device registers
directly in the driver.

A patch to pass irq_drv_data as a parameter for struct regmap_irq_chip
set_type_config() is included. This is needed by the
idio_24_set_type_config() and ws16c48_set_type_config() callbacks in
order to update the type configuration on their respective devices.

A patch to migrate the WS16C48 GPIO driver to the regmap API is included
in this series due to its dependence on the struct regmap_irq_chip
set_type_config() change.

William Breathitt Gray (3):
  regmap: Pass irq_drv_data as a parameter for set_type_config()
  gpio: pcie-idio-24: Migrate to the regmap API
  gpio: ws16c48: Migrate to the regmap API

 drivers/base/regmap/regmap-irq.c |   8 +-
 drivers/gpio/Kconfig             |   6 +
 drivers/gpio/gpio-pcie-idio-24.c | 710 ++++++++++++-------------------
 drivers/gpio/gpio-ws16c48.c      | 566 +++++++++---------------
 include/linux/regmap.h           |   6 +-
 5 files changed, 497 insertions(+), 799 deletions(-)


base-commit: 0d8b4049bb4792da225e2c908282bb9ed1024ac7
-- 
2.39.2

