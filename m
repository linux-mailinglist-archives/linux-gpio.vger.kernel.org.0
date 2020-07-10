Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3430921B994
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2020 17:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgGJPcZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jul 2020 11:32:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbgGJPcY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jul 2020 11:32:24 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B8B1C08C5CE
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2020 08:32:24 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id u25so3447968lfm.1
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2020 08:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=h+EzuyaG7pqe9JQFDp2JY1TKII7Efe64alDCy7sZwNA=;
        b=mmyiYNAE5+Dzrrg9N9DsL/C7eKT/PwN/EEkkKv5lFBUmrqlZi453hlRHJv9vJQEZOR
         3dTaLuvC5VnCdU3/P7OvM3kDeovLrxAvC/fK85WKtX0/Yp8jQdbQGpR9D9jCX0wapeml
         p2ozANbpXetzS41XnXHyys456g65HnRhnd1eF7FPNjbBCV4R4qEqD6o/qeZ5JuAVYdi1
         jLr2lFi/7uyjofT785xsYHrC3GRXlaqrnxl9B5gYYR1FJexWZWU2IcVb9AIgbmPwpIYR
         gXAfaZTMkXxST4a73YUF7R5RF5GzvbkizGMVJYNfgHjesEaw1ZRvxCfpnKwn0XEVlsjI
         rbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=h+EzuyaG7pqe9JQFDp2JY1TKII7Efe64alDCy7sZwNA=;
        b=GHzDsbQo8UpcNvGmEpCJyXW52oyTOH6cE1ba6IGWn08MPnedyckakeK1nm6rNQzBVL
         NhBXTJ4b3d9QbzV3q5SyduwmI9/437ZaYwusT7qYDM9O3yEiWR/NWCNTvPWY34OZPC5q
         COOXlyQtFYstKcTrKE/+ndvJ6z19CccLRq2hPqHaopQ2fz8LbCEi1JX4pVgscyTC19th
         tmf+BHfmQTZETqU9fGS4lU6XMNdqlfHUr9X8hdFWDZJzAsIwQmMvgYJ8/nwsaTho73mH
         6iej8cQvKYLh97CjjzG6p7KOEHukOd5sFMKU8Q1hbPE9cNVwCAdtzFNfQspEmJF7T32B
         kiig==
X-Gm-Message-State: AOAM531InNcCZ4Q7nzhu20ndDf+DN6jRdv16DdUA7ECUwQ8BK6Ijv03o
        b0NPSSVS5UQXW3XMkDdro4NehryhMN7PODeFdEwQnw==
X-Google-Smtp-Source: ABdhPJwWJ/GqfjO3jgAb65+33v8YXOeL4TD/Q06YlTj9xs51biXiB4VqrEvFR3M/HV4H3xdMYCZscB0G+yfgcGPitQ4=
X-Received: by 2002:a19:f20a:: with SMTP id q10mr44374178lfh.89.1594395142579;
 Fri, 10 Jul 2020 08:32:22 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 10 Jul 2020 17:32:11 +0200
Message-ID: <CACRpkdYXcvN_Sqk=Am_r3uyNEfcnta7ZQuYEmBO8g=Wsp4y27w@mail.gmail.com>
Subject: [GIT PULL] GPIO fixes for the v5.8 series
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Navid Emamdoost <navid.emamdoost@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here are some GPIO fixes, most of them for the PCA953x
that Andy worked hard to fix up.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.8-2

for you to fetch changes up to 93e0272a4395819d51c7501b3cde771863ccecd2:

  Merge tag 'gpio-fixes-for-v5.8-rc3' of
git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into fixes
(2020-06-26 23:53:25 +0200)

----------------------------------------------------------------
GPIO fixes for the v5.8 series:

- Fix two runtime PM errorpath problems in the Arizona
  GPIO driver.

- Fix three interrupt issues in the PCA953x driver.

- Fix the automatic address increment handling in the
  PCA953x driver again.

- Add a quirk to the PCA953x that fixes a problem in
  the Intel Galileo Gen 2.

----------------------------------------------------------------
Andy Shevchenko (5):
      gpio: pca953x: Synchronize interrupt handler properly
      gpio: pca953x: Override IRQ for one of the expanders on Galileo Gen 2
      gpio: pca953x: Fix direction setting when configure an IRQ
      gpio: pca953x: disable regmap locking for automatic address incrementing
      gpio: pca953x: Fix GPIO resource leak on Intel Galileo Gen 2

Linus Walleij (1):
      Merge tag 'gpio-fixes-for-v5.8-rc3' of
git://git.kernel.org/.../brgl/linux into fixes

Navid Emamdoost (2):
      gpio: arizona: handle pm_runtime_get_sync failure case
      gpio: arizona: put pm_runtime in case of failure

 drivers/gpio/gpio-arizona.c |  7 +++-
 drivers/gpio/gpio-pca953x.c | 99 ++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 100 insertions(+), 6 deletions(-)
