Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49C951D5FEB
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2020 11:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbgEPJQe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 May 2020 05:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbgEPJQe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 16 May 2020 05:16:34 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B02DC061A0C
        for <linux-gpio@vger.kernel.org>; Sat, 16 May 2020 02:16:33 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id g1so4725994ljk.7
        for <linux-gpio@vger.kernel.org>; Sat, 16 May 2020 02:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=3OMzvoIzOVMGXlSU32P6AgStJJg7OOz1afav8/9GlUI=;
        b=wJVu792vI3DxogDPuooiWiSSa6AzfDSXnXw6AxYsrK+Tm1hEGefCbJxazgd0unWGBa
         BBO1CzX25E0UO2wY7vpPtE1PEY+SB1uP6nR1aRNpmqmeJkgSLOxmV1CCayO0pifkGenB
         wDBv9JXICVOaEyzNNT1vPqbU7kHNZR4/5KTCizUg+NCo2KbpWfL/Be6uvXQ/pHJLEtrK
         Tvvu2NvDorPAbX5VDi4yovRtMK4EYMW2co6pOG38J2qgkHnEW1GO4c9LHVyBBXQIekes
         Io0gYvCWt4hOv91BVkbK5e/FM6ChdtG8qjye196FqX6yCz4/msbujDSsp92YMCF66KDv
         CE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=3OMzvoIzOVMGXlSU32P6AgStJJg7OOz1afav8/9GlUI=;
        b=hYJCQBzcO4JKia5IgzPbmXS0bVz5muLx1d0UHnLMSZ7fU4qGUtsFCf05C7JdWkqqXj
         PBJjgUqkFv6jR8WgVdKpdhqCUZpK5sVNA7Gcia25DkmWEdUrx+iTto1KdRlk3EtzNxGN
         FhXO5128vw5fOOhfR+QHZXMBSDUs9nngXdadkVuBxCx4A5rXUqJhWe8nHC27jUh2cTI3
         oneRwXauHzEVByUj7xgMpqszXmObFrFnKLg/hGQn8QJVBe/BjVGo2DS5/uTuG6vAlvNZ
         Vwj2YZJsseLl+jgYLI4f+sEvkvvee6zRMAkrA+4q58R3QVXQTQXmonR7uwA4d1Q4hKAd
         ySmw==
X-Gm-Message-State: AOAM532X/1bFDxX/zfX8Lo7nULNoklGadgIbcSOz+Yps2JT1EZETSSyM
        FvjiTVz7UVq5wSnuurjCS5314ZdClGCR//C18EiGXdisSpU=
X-Google-Smtp-Source: ABdhPJy8VvW1xMAskKNAns4f8nl5TxuiYq/93NQMcuuJDMpjpLMD4eYhZI5ZCzPWBzPCvAWHKxlpTYcMgz32a+4BLDM=
X-Received: by 2002:a2e:a209:: with SMTP id h9mr4983504ljm.39.1589620591858;
 Sat, 16 May 2020 02:16:31 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 16 May 2020 11:16:21 +0200
Message-ID: <CACRpkdbpt9GGegm1TZSQ1-ohDB6682cLpQbipHT24dpuKHLBvQ@mail.gmail.com>
Subject: [GIT PULL] Pin control fixes for the v5.7 series
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here is a bunch of pin control fixes, some a bit overly ripe,
sorry about that. We have important systems like Intel
laptops and Qualcomm mobile chips covered.

Details in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.7-2

for you to fetch changes up to dca4f40742e09ec5d908a7fc2862498e6cf9d911:

  pinctrl: qcom: Add affinity callbacks to msmgpio IRQ chip
(2020-05-12 14:29:29 +0200)

----------------------------------------------------------------
Pin control fixes for the v5.7 series:

- Pad lock register on Intel Sunrisepoint had the wrong offset.
- Fix pin config setting for the Baytrail GPIO chip.
- Fix a compilation warning in the Mediatek driver.
- Fix a function group name in the Actions driver.
- Fix a behaviour bug in the edge polarity code in the Qualcomm
  driver.
- Add a missing spinlock in the Intel Cherryview driver.
- Add affinity callbacks to the Qualcomm MSMGPIO chip.

----------------------------------------------------------------
Amit Singh Tomar (1):
      pinctrl: actions: fix function group name for i2c0_group

Andy Shevchenko (2):
      pinctrl: sunrisepoint: Fix PAD lock register offset for SPT-H
      pinctrl: baytrail: Enable pin configuration setting for GPIO chip

Ansuel Smith (1):
      pinctrl: qcom: fix wrong write in update_dual_edge

Grace Kao (1):
      pinctrl: cherryview: Add missing spinlock usage in chv_gpio_irq_handler

Light Hsieh (1):
      pinctrl: mediatek: remove shadow variable declaration

Linus Walleij (1):
      Merge tag 'intel-pinctrl-v5.7-2' of
git://git.kernel.org/.../pinctrl/intel into fixes

Venkata Narendra Kumar Gutta (1):
      pinctrl: qcom: Add affinity callbacks to msmgpio IRQ chip

 drivers/pinctrl/actions/pinctrl-s700.c       |  2 +-
 drivers/pinctrl/intel/pinctrl-baytrail.c     |  1 +
 drivers/pinctrl/intel/pinctrl-cherryview.c   |  4 ++++
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c | 15 ++++++++-------
 drivers/pinctrl/mediatek/pinctrl-paris.c     |  2 --
 drivers/pinctrl/qcom/pinctrl-msm.c           | 27 ++++++++++++++++++++++++++-
 6 files changed, 40 insertions(+), 11 deletions(-)
