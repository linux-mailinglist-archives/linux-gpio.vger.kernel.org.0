Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBA5463DAE2
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 17:41:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbiK3QlH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 11:41:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbiK3QlC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 11:41:02 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84F768BD27
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 08:40:52 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id h11so20741504wrw.13
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 08:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e0stMIEcV03gNHfzUJA1nfzyWs03vejKMOsqKQ04xZc=;
        b=BiOo2yg86E8eOMnjFPP9PYT+tSSWEOwxmE/2SV4WaoeSx6FmeH6eayWgRY84WFn2lS
         +i8Dnm+GAp2wRvrFUMcuKVjutDJIcAkmW08bjraZxjy9OUdsgS5jbPCA/hQMr35zxZqn
         M39dVeJvRqWPGZDel7apTXndc3Z3PG1F18eBMLkI0aheJVqZhIxXzqV4oR4nMDaGWKqe
         x3Rc8R2pzjqcorIZcOmy4neFSAesnyGPMkV+4Iqq4tJO4QeHyP166dhXeKjWzuQQFa+c
         7ukSmuRjjK+KJqocDsJxPlIyqfWrIkSvAe6nYgcT3EF6R0UTNWX60HG3eBkyeFjcK+Kp
         xHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e0stMIEcV03gNHfzUJA1nfzyWs03vejKMOsqKQ04xZc=;
        b=kQnS/zBoRvk34C1nOXl8DCTSlfNuGDqAJayPlXqhlTgIaTsUYLQPhG0oBEwOFn0++I
         15LBiiYH+kQqBVMCKU4oEaBHEUJlexHZMSJtWnIUYc+5RmoMBd6kULpwb87PygdmtPiY
         n8KvO4Pnfs33Dpq0LVXZkLrpvEhNe7AVy1+wacT4jcWyiW/taG90pT1iewf6k81XkulZ
         F/ASKsyxDI93lPHXjnDo+jXmK17pPuB9YTFpFk4vSBgHXu4eWuRadHmR4qPIN4wzCOMm
         GHpN4nlETcHkSkkIbIi5z9gbxtvxe0f/hHOs6AIWiWJJK34nGt1MzUzWhMz8cSvU3ohw
         ExQg==
X-Gm-Message-State: ANoB5pk7tB3Yhp49iVISFYmS1WRXR2IkJ90ybuUHNYgdrfTdgUKzxjyI
        FiS57uu+k9UsrcSb2EKs+Xh4LnKyRsGOgFAX
X-Google-Smtp-Source: AA0mqf5sWIERO+Km0Cu7StCt1Ph6aHb1KS7WI9VcwQoSRHY/eXuZVUrgfzeQpEwLdOfAuCDv9Rmj3A==
X-Received: by 2002:adf:ea43:0:b0:22e:433a:46ba with SMTP id j3-20020adfea43000000b0022e433a46bamr31729304wrn.575.1669826450914;
        Wed, 30 Nov 2022 08:40:50 -0800 (PST)
Received: from localhost.localdomain ([212.228.7.114])
        by smtp.gmail.com with ESMTPSA id k26-20020a05600c1c9a00b003b47b80cec3sm7003110wms.42.2022.11.30.08.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 08:40:50 -0800 (PST)
From:   Niyas Sait <niyas.sait@linaro.org>
To:     linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, rafael@kernel.org,
        linus.walleij@linaro.org, fugang.duan@linaro.org
Cc:     Niyas Sait <niyas.sait@linaro.org>
Subject: [PATCH v3 0/2] pinctrl: add ACPI support to pin controller
Date:   Wed, 30 Nov 2022 16:40:25 +0000
Message-Id: <20221130164027.682898-1-niyas.sait@linaro.org>
X-Mailer: git-send-email 2.25.1
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

This is a proposal for adding ACPI support to pin controller.

The patch supports following resources introduced in ACPI from v6.2

- PinFunction
- PinConfig
- PinGroupFunction
- PinGroupConfig
- PinGroup

The patch has been tested on NXP I.MX8MP platform with ACPI. Please checkout [1]
and [2] to see prototype driver and firmware implementation.

--
V3: 1, Reworked interface between pinctrl-acpi subsystem and driver
    2, Dropped API to get ACPI pin groups as they are no longer required
    3, Fix styling issues pointed out by Mika Westerberg
    4, Added helper functions and refactored code for simplicity
    5, Added documentation

V2: 1, Fix styling issues pointed out by Mika Westerberg
    2, Added a new interface to free pin group descriptor
    3, Added vendor length to the descriptors
    4, Reworked map_config_acpi_to_general to pass an error value
    5, Few refactoring to keep functions shorter
    6, Dropped new generic pinconf types added in v1

[1] https://github.com/nsait-linaro/linux-patches/blob/main/0001-imx8mp-add-ACPI-support-for-pin-controller.patch
[2] https://github.com/nsait-linaro/linux-patches/blob/main/0001-add-acpi-pinctrl-support-for-i2c-controllers.patch

Niyas Sait (2):
  pinctrl: add support for ACPI pin function and config resources
  pinctrl: add support for ACPI pin groups

 Documentation/driver-api/index.rst            |   1 +
 Documentation/driver-api/pin-control-acpi.rst | 297 ++++++++
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/core.c                        |  18 +-
 drivers/pinctrl/core.h                        |   3 +
 drivers/pinctrl/pinctrl-acpi.c                | 672 ++++++++++++++++++
 drivers/pinctrl/pinctrl-acpi.h                |  77 ++
 include/linux/pinctrl/pinctrl.h               |  15 +
 8 files changed, 1080 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/driver-api/pin-control-acpi.rst
 create mode 100644 drivers/pinctrl/pinctrl-acpi.c
 create mode 100644 drivers/pinctrl/pinctrl-acpi.h

-- 
2.25.1

