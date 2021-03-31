Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 064A9350064
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 14:32:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235513AbhCaMb5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 08:31:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235536AbhCaMbs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Mar 2021 08:31:48 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F5EC061574
        for <linux-gpio@vger.kernel.org>; Wed, 31 Mar 2021 05:31:48 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id b14so28872224lfv.8
        for <linux-gpio@vger.kernel.org>; Wed, 31 Mar 2021 05:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=S6EU2YnOpdkBtjQGKeotICcap66rhKHJa003CpMwvsc=;
        b=NMSrUSVupyaOh9cd4emHPeGipu/j7X2gWfOhsL2kEl3GrOaQM4rCxOQ/ZFBZPyKsmP
         vHt69Jn4kH51ZPYe+xRKlgpSkP6R5K2aeGQZ86f9VHFD3VQFy3caHGLvwkRDEEHBfBod
         qbyEo+efvrJKTfLanB1l/C++xwcZwLlKAYwurbth4ymdQVpqxd6CyMJivGs7+8JOnAUx
         oKw+QKpcDVqbTRc/RB9DvIam0CUllJPYrLHPRW/zIPGrxdmWJVRk3lt67RbQM4eC/uWs
         fbUPXWAOeNo5w49l/gPSjOdmwszwVGNgB+w0dEj59Ck5VztiLhc8BEWFbcvQmSS62BNT
         w/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=S6EU2YnOpdkBtjQGKeotICcap66rhKHJa003CpMwvsc=;
        b=bKoeuAVqpt5DopTfdFRzpSXfDwF6bze37r39fTXzNxiqvJx4OjNm3joOlwI3zI7uv3
         R5JPnFhUD9Rq40rNLit9Pz0oTa0/nSS8i3Bhvdm28doeQWpPsyak3yog5NIngJg/mxgJ
         SCfm/fg7cj1XQEUZYMo/ASGbwfYnWmEyhJ65NBBSC3CrmGvIR9CBviaFVVSE7mlyfZ3C
         /2E7slORLX3hrBK7A1zTBILtp1s3STSUGgLM/RbEx10NAWpYpyR3IElaC5snJSrCon/C
         pxY9r4P4i3J3ZWLRn7mgbtsdo8XkCn+LspoEzKlx9kXx4BBaL9hrFnrCrXXyuCCaTChA
         /Mdg==
X-Gm-Message-State: AOAM531s7H/wCpybbmf7Q03IQEzYWq4t/eVpezM0Kba9rIZ/cbrue+Ry
        JapHZ8hSfZSIwhiiUqb1P720dRq9sk3J13IJjFQ4Ig==
X-Google-Smtp-Source: ABdhPJzgNGDqwWJ0zqQx8Ru8esLLNouGO90hnzko0scZwHQnRkLnOlZhCOMa/zz2I7pmU7SzXhXxRPZ7oh17nTDgH6c=
X-Received: by 2002:a19:4c08:: with SMTP id z8mr1996596lfa.157.1617193906617;
 Wed, 31 Mar 2021 05:31:46 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 31 Mar 2021 14:31:36 +0200
Message-ID: <CACRpkdazjQ0jPdXYPNsC6BmYEHZgf7_zUObHTEa+B9LZCmaT8g@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for the v5.12 kernel
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lars Povlsen <lars.povlsen@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here are some overly ripe fixes for the v5.12 kernel. I should
have sent earlier but had my head stuck in GDB.

All are driver fixes. Details in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.12-2

for you to fetch changes up to ba845907b23a6584e5944f6fbffda3efb010c28b:

  Merge tag 'intel-pinctrl-v5.12-3' of
gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel into fixes
(2021-03-30 00:46:49 +0200)

----------------------------------------------------------------
Pin control fixes for the v5.12 kernel cycle:

- Fix up some Intel GPIO base calculations.
- Fix a register offset in the Microchip driver.
- Fix suspend/resume bug in the Rockchip driver.
- Default pull up strength in the Qualcomm LPASS
  driver.
- Fix two pingroup offsets in the Qualcomm SC7280
  driver.
- Fix SDC1 register offset in the Qualcomm SC7280
  driver.
- Fix a nasty string concatenation in the
  Qualcomm SDX55 driver.
- Check the REVID register to see if the device is
  real or virtualized during virtualization in the
  Intel driver.

----------------------------------------------------------------
Andy Shevchenko (1):
      pinctrl: intel: Show the GPIO base calculation explicitly

Arnd Bergmann (1):
      pinctrl: qcom: fix unintentional string concatenation

Jonathan Marek (1):
      pinctrl: qcom: lpass lpi: use default pullup/strength values

Lars Povlsen (1):
      pinctrl: microchip-sgpio: Fix wrong register offset for IRQ trigger

Linus Walleij (2):
      Merge tag 'intel-pinctrl-v5.12-2' of
gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel into fixes
      Merge tag 'intel-pinctrl-v5.12-3' of
gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel into fixes

Rajendra Nayak (2):
      pinctrl: qcom: sc7280: Fix SDC_QDSD_PINGROUP and UFS_RESET offsets
      pinctrl: qcom: sc7280: Fix SDC1_RCLK configurations

Roger Pau Monne (1):
      pinctrl: intel: check REVID register value for device presence

Wang Panzhenzhuan (1):
      pinctrl: rockchip: fix restore error in resume

 drivers/pinctrl/intel/pinctrl-intel.c     |  9 ++++++++-
 drivers/pinctrl/pinctrl-microchip-sgpio.c |  2 +-
 drivers/pinctrl/pinctrl-rockchip.c        | 13 ++++++++-----
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c  |  2 +-
 drivers/pinctrl/qcom/pinctrl-sc7280.c     | 16 ++++++++--------
 drivers/pinctrl/qcom/pinctrl-sdx55.c      |  2 +-
 6 files changed, 27 insertions(+), 17 deletions(-)
