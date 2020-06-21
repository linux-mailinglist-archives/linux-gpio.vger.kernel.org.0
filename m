Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 291C8202C00
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jun 2020 20:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729839AbgFUSYy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jun 2020 14:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729550AbgFUSYx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jun 2020 14:24:53 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 818D6C061795
        for <linux-gpio@vger.kernel.org>; Sun, 21 Jun 2020 11:24:53 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id q19so16856815lji.2
        for <linux-gpio@vger.kernel.org>; Sun, 21 Jun 2020 11:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=YBgsvtuV1+FGKsiCwr3BVYB/Gcp58aRuWaU/DnoMIcg=;
        b=EkrN1LKZNMwqOTBRdx0cPhdlbCgUWu6nUUT4RBZigTrqcYvvEPs1OBGy72xFs6Xv3T
         QSi69AOmPIRTEHcR12DxXw+uy5lLmb73+mqdVxpnAoMRclKm+SvibAAAKhqkcPf2b9oz
         GuMMA5QUC8qmClY21eZLHLOsjrW4vui/GC6geS93z2QZimCfS6oXlI8S9CpXVfglMDAc
         fEyTF1BwBticNvWlXJCDVEtOXbEYy+kso1YkQ/rrAyfafslqTQ2yMUCASXIqvLVeqiUG
         /wyr3g7tUIwVF506zDvFUOWA9E8fiCG52qttn43KBpN21rv2foB6ikCrrJbKLVGhvsEv
         Wu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=YBgsvtuV1+FGKsiCwr3BVYB/Gcp58aRuWaU/DnoMIcg=;
        b=TlxzG+5+qp3VOdKHCHS6tcdxczVNlHaj+b1M+OPClavjEEpIGe87PVVRpeGFUth8Rl
         uTtpqcNkV5Gc1bFjBIR9V7hHcY56/X4+opK8mAH1qE7xyk7NwZhtxVseJBm1ShKqVz5a
         cNHO/dP4XrJfsuLue1zyvOnS6mlHSItnLod/pBIOlueFiufmxpsBAcXunr1WGFLwcam4
         RQQeZEz4uIO4+S0fAHryY4nM7+bCWbgJlbjAvNxvn/rHcQFIVvl4cu5hs6mEa/kFA0g7
         LTTgCpbwFQ0nVr9ju7om9GMXwtu2vZL9YxdJZl2BC07jjtmifAEKYCzWuzoNcokUcVQ/
         fFnA==
X-Gm-Message-State: AOAM531yK5EMILC421iiJpEvir8Zu78SzHh5fuAiYdzAOrVhUzzGyz9G
        6BHkjaj5gR/5ZJGW8WSTxqYD2rb6Et6we5M5gAHRBuJ47LoZFQ==
X-Google-Smtp-Source: ABdhPJxLZa8trPAUnCmC8L02O+Nk0zCWm3TEEurkUZceBNWISBjeHa1Igv4FklL/+ZCxx9vuteCBMDkrjby+Gs54Zz4=
X-Received: by 2002:a2e:7303:: with SMTP id o3mr7169685ljc.100.1592763891900;
 Sun, 21 Jun 2020 11:24:51 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 21 Jun 2020 20:24:40 +0200
Message-ID: <CACRpkdasTF7DLFejjC005vuBfcv2upbNjd5Cw9j_d-CUnHOMDg@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v5.8
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

these are some early fixes collected during the first week after the merge
window, all pretty self-evident, with the details in the signed tag. The revert
is the crucial thing.

Please pull them in!

Yours,
Linus Walleij


The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.8-2

for you to fetch changes up to 25fae752156db7253471347df08a2700501eafde:

  pinctrl: single: fix function name in documentation (2020-06-20
22:41:32 +0200)

----------------------------------------------------------------
Pin control fixes for the v5.8 cycle, first take:

- Fix a warning on the Qualcomm SPMI GPIO chip being instatiated
  twice without a unique irqchip struct.
- Use the noirq variants of the suspend and resume callbacks in
  the Tegra driver.
- Clean up the errorpath on the MCP23s08 driver.
- Revert the use of devm_of_iomap() in the Freescale driver as
  it was regressing the platform.
- Add some missing pins in the Qualcomm IPQ6018 driver.
- Fix a simple documentation bug in the pinctrl-single driver.

----------------------------------------------------------------
Dmitry Baryshkov (1):
      pinctrl: qcom: spmi-gpio: fix warning about irq chip reusage

Drew Fustini (1):
      pinctrl: single: fix function name in documentation

Haibo Chen (1):
      Revert "pinctrl: freescale: imx: Use 'devm_of_iomap()' to avoid
a resource leak in case of error in 'imx_pinctrl_probe()'"

Sivaprakash Murugesan (1):
      pinctrl: qcom: ipq6018 Add missing pins in qpic pin group

Vidya Sagar (1):
      pinctrl: tegra: Use noirq suspend/resume callbacks

kernel test robot (1):
      pinctrl: mcp23s08: Split to three parts: fix ptr_ret.cocci warnings

 drivers/pinctrl/freescale/pinctrl-imx.c  |  7 +++----
 drivers/pinctrl/pinctrl-mcp23s08_spi.c   |  5 +----
 drivers/pinctrl/pinctrl-single.c         |  2 +-
 drivers/pinctrl/qcom/pinctrl-ipq6018.c   |  3 ++-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 21 ++++++++++-----------
 drivers/pinctrl/tegra/pinctrl-tegra.c    |  4 ++--
 6 files changed, 19 insertions(+), 23 deletions(-)
