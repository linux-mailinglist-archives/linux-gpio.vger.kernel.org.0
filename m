Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67F1C457A9B
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Nov 2021 03:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234792AbhKTC35 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Nov 2021 21:29:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231455AbhKTC35 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Nov 2021 21:29:57 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2ABFC061574
        for <linux-gpio@vger.kernel.org>; Fri, 19 Nov 2021 18:26:54 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id z2-20020a9d71c2000000b0055c6a7d08b8so19537300otj.5
        for <linux-gpio@vger.kernel.org>; Fri, 19 Nov 2021 18:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=QqkiBDchulxEr8/gijnezz7/M5Yq+LHuUwhG/lseFJQ=;
        b=lUGc3lDY52CY5lVGaaEuD0/qO0zQnBREahFM2yNr9GWfX8EMKHCoFJKXFhsjCFHym1
         /LsPRUltLDR5pu88fMtp3vjUDB2UkRn/MIJ4DH3cIP0ixRhjQ8DUbX8s9qjB5XhnIAOf
         8Moi046sqgbvIsSBclKAO4mCjaTIehc/FJBE83I3dqMUXvThuigUZRyVUiKf4zBIWoHZ
         V1TAz8xUsEYX5+70zcxSeVBqTFMU4z4N0nYFiIujd3QOIZRyfdE/vttb3s21tq5KCxFT
         cE0h/vBrJFeKb1OkOJpu39L2gnoi1dcd1d6RS/sBm0BkMWpvLRR5Pwax/N4SkT/07Z74
         gAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=QqkiBDchulxEr8/gijnezz7/M5Yq+LHuUwhG/lseFJQ=;
        b=jN6ul1bI+KxvCNqt6/dx7U5mz3kJUT5iMAEBD82fuQii0iJ+Qqc5SzyEXh+8O/kRz0
         WgMbajlhOCKB2Eq5N1VYeRS29vlTdypjGFjNmcX3dAaR+9SSXl5l7gTSLiv9n+JgI9o4
         E3eFpo3ajTTG8ANzWN5af+mdFn12JucTSwS+Z5GddymytpyFV7jIZVx5VxcTpRbM6GZx
         zPTNlJL1YHj1g3xMzOlfwKwNa63VKP9RZIL2mRg4HDhiUKahmGXDXOcveQ5/P87Byvmy
         PECdtemb3xuIv5cKiLXIvXf3augdeIrUEiAjyskE5Us9D13Qp9A44kqiW+d5OjD561PP
         6zIQ==
X-Gm-Message-State: AOAM533HA/SqWVmjzLt46WAp+1/aKf6J1eUuANtj8MnMXiitx5vIt0DS
        82OJn4Ulm0WGmBOGm2d3fnz+hvLfZpjIRrtacxx/s3dybfCwBw==
X-Google-Smtp-Source: ABdhPJzxYcHuhlhByxb5XGZ4hEAuIXwQAjtcS9BUPXYROpeDHmdTgVcyJCKHXEwhJDQozrz1MdwkrBP4mgLLt5L1Seg=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr8949062otg.179.1637375214069;
 Fri, 19 Nov 2021 18:26:54 -0800 (PST)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 20 Nov 2021 03:26:42 +0100
Message-ID: <CACRpkdb0H0NH4t5iRW6_ba=Mym1vH=yG+decH6O5uo9k2opcXw@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v5.16
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here are some post-mergewindow fixes for the pin control subsystem.

There is an ACPI stubs fix which is ACKed by the ACPI maintainer
for merging through my tree.

One item stand out and that is that I delete the <linux/sdb.h> header
that is used by nothing. I deleted this subsystem (through the GPIO
tree) a while back so I feel responsible for tidying up the floor.

Other than that it is the usual mistakes, a bit noisy around build issue
and Kconfig then driver fixes.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.16-2

for you to fetch changes up to 62209e805b5c68577602a5803a71d8e2e11ee0d3:

  pinctrl: qcom: sm8350: Correct UFS and SDC offsets (2021-11-16 02:19:15 +0100)

----------------------------------------------------------------
Pin control fixes for the v5.16 kernel series:

- Fix some stubs causing compile issues for ACPI.

- Fix some wakeups on AMD IRQs shared between GPIO and SCI.

- Fix a build warning in the Tegra driver.

- Fix a Kconfig issue in the Qualcomm driver.

- Add a missing include the RALink driver.

- Return a valid type for the Apple pinctrl IRQs.

- Implement some Qualcomm SDM845 dual-edge errata.

- Remove the unused <linux/sdb.h> header. (The subsystem was
  once deleted by the pinctrl maintainer...)

- Fix a duplicate initialized in the Tegra driver.

- Fix register offsets for UFS and SDC in the Qualcomm SM8350
  driver.

----------------------------------------------------------------
Arnd Bergmann (1):
      pinctrl: tegra194: remove duplicate initializer again

Bjorn Andersson (2):
      pinctrl: qcom: sdm845: Enable dual edge errata
      pinctrl: qcom: sm8350: Correct UFS and SDC offsets

Jonathan Corbet (1):
      Remove unused header <linux/sdb.h>

Julian Braha (1):
      pinctrl: qcom: fix unmet dependencies on GPIOLIB for GPIOLIB_IRQCHIP

Mario Limonciello (2):
      ACPI: Add stubs for wakeup handler functions
      pinctrl: amd: Fix wakeups when IRQ is shared with SCI

Prathamesh Shete (1):
      pinctrl: tegra: Return const pointer from tegra_pinctrl_get_group()

Sergio Paracuellos (1):
      pinctrl: ralink: include 'ralink_regs.h' in 'pinctrl-mt7620.c'

Sven Peter (1):
      pinctrl: apple: Always return valid type in apple_gpio_irq_type

 drivers/pinctrl/pinctrl-amd.c            |  29 +++++-
 drivers/pinctrl/pinctrl-apple-gpio.c     |  12 +--
 drivers/pinctrl/qcom/Kconfig             |   2 +
 drivers/pinctrl/qcom/pinctrl-sdm845.c    |   1 +
 drivers/pinctrl/qcom/pinctrl-sm8350.c    |   8 +-
 drivers/pinctrl/ralink/pinctrl-mt7620.c  |   1 +
 drivers/pinctrl/tegra/pinctrl-tegra.c    |   4 +-
 drivers/pinctrl/tegra/pinctrl-tegra194.c |   1 -
 include/linux/acpi.h                     |   9 ++
 include/linux/sdb.h                      | 160 -------------------------------
 10 files changed, 51 insertions(+), 176 deletions(-)
 delete mode 100644 include/linux/sdb.h
