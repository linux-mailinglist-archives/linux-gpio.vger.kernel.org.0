Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 186C22FF4B9
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 20:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbhAUSuq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 13:50:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728196AbhAUIxA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jan 2021 03:53:00 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D358DC061575
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 00:52:19 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id x23so1578107lji.7
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 00:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=mhbqzC8oGHF0niZK1rgMXU+01W7EQU+NzD5TxB8Ki1g=;
        b=pCq9NAIsvUzUfrQRaMUoPJuJRYJ2sAOYdMYqhIyCyCHBCcwOZCu0UXuIL2kSZbeki9
         rJ6R1PpcK8NsNag9tOdjv00GIiTDhfUvLHdde9BEQFq9C/Mwm5pvaq8W4xhSAd8VKABw
         KAifFPI2pcuWtPmprAAblDMdI/F/6FwhosMiFOvcIbcm6DesaISCaA68id4E6dEv8rx/
         PUBKaDXP6xq8kFuSTODLPZHuSMsCQMngnI0fjviuS6YrrFZdHNuq6YcVnY/RPipVRx+R
         vDHRvJwoB+MuVHjOZqNnb2p8120Dp0TG5f6QMgtNHvx7Wc7Do7iM19/au7n0M9KmosPk
         hVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=mhbqzC8oGHF0niZK1rgMXU+01W7EQU+NzD5TxB8Ki1g=;
        b=sVM36UNefYKo1NWZRO8RVbnmOp0WBixuFRcu/F66/dTp//k85oqYqSuRtb/H/30Xba
         oJzlMVCkpL8M9cf3beRPAAP3jy6c3Zea4zpTNSnyWbgvozUTgADBqayLr5aHm6d/ajLs
         SOI8JSKK7OU64iaa/A4UplPpm5gfnXeud+E+GWDmR3nXm79SOFS1spyYb9V0Y6qbcezC
         XbJ/a96TcsNZ020hBYt67q8SWYJA3VxA5XdIOaasAh3gSzgv39RUypTGQJB8i61pqIQx
         dtHUSl32kP+5qdS/22ztCPXJ+FshxZ+pLZvCOTBUzF3sd9GtwcMkdmg8K5PkuFjsLB98
         bteg==
X-Gm-Message-State: AOAM533Bf58X+1VK9f+f00C9sDZMFqNqreJ78hsG1RojeblTQ8/C1/cO
        gi0C6caAXzV+qe/FQ6tjkR+qamyzse/xtEdEODgMlplFNTXmPxid
X-Google-Smtp-Source: ABdhPJzqOdFiW/IgfLHttw0yRirh0MV/BcjFaDIm2V52etFaAzx6fVHy/968d3beUxryL6+U4WCOHBcXj/Ky18AqTPM=
X-Received: by 2002:a2e:9dc3:: with SMTP id x3mr6380047ljj.326.1611219138394;
 Thu, 21 Jan 2021 00:52:18 -0800 (PST)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Jan 2021 09:52:07 +0100
Message-ID: <CACRpkdYqT+jt=aNt3JN0fak7snCwxvT___QVV8L8Bjr_YSB+0A@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for the v5.11 kernel
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here are some pin control fixes for the v5.11 kernel cycle.
Only driver fixes. The details are in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.11-2

for you to fetch changes up to cf9d052aa6005f1e8dfaf491d83bf37f368af69e:

  pinctrl: qcom: Don't clear pending interrupts when enabling
(2021-01-18 16:07:08 +0100)

----------------------------------------------------------------
Pin control fixes for the v5.11 kernel.

These are all driver fixes, the Qualcomm stuff is the most
widely used and important:

- The main matter is a complicated fixup for the Qualcomm
  deep sleep states. This manifests in how interrupts get
  handled or in some cases not handled in cooperation with
  the PDC (Power Domain Controller). It's one of these really
  hardcore bug fixes that signifies high maturity of the
  platform.

- Fix a register layout problem in the JZ4760 driver.

- Fix a register offset in the Aspeed G6 driver.

- Fix a compiler warning in the Nomadik driver.

- Fix a fallback code path in the mediatek driver.

----------------------------------------------------------------
Billy Tsai (1):
      pinctrl: aspeed: g6: Fix PWMG0 pinctrl setting

Douglas Anderson (4):
      pinctrl: qcom: Allow SoCs to specify a GPIO function that's not 0
      pinctrl: qcom: No need to read-modify-write the interrupt status
      pinctrl: qcom: Properly clear "intr_ack_high" interrupts when unmasking
      pinctrl: qcom: Don't clear pending interrupts when enabling

Hsin-Yi Wang (1):
      pinctrl: mediatek: Fix fallback call path

Nathan Chancellor (1):
      pinctrl: nomadik: Remove unused variable in nmk_gpio_dbg_show_one

Paul Cercueil (2):
      pinctrl: ingenic: Fix JZ4760 support
      pinctrl: ingenic: Rename registers from JZ4760_GPIO_* to JZ4770_GPIO_*

 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c       |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c |  4 +
 drivers/pinctrl/nomadik/pinctrl-nomadik.c        |  1 -
 drivers/pinctrl/pinctrl-ingenic.c                | 80 ++++++++++----------
 drivers/pinctrl/qcom/pinctrl-msm.c               | 96 +++++++++++++++---------
 drivers/pinctrl/qcom/pinctrl-msm.h               |  2 +
 6 files changed, 107 insertions(+), 78 deletions(-)
