Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C64032B1BA3
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Nov 2020 14:11:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgKMNLo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Nov 2020 08:11:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbgKMNLo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Nov 2020 08:11:44 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2679BC0613D1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2020 05:11:28 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id r17so10590400ljg.5
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2020 05:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=YlQeaH5/KcevoKEl51vDAlqU6fywoh7neaxZiZXvzYM=;
        b=Ba/CkSxyepWxIeclWEnqYQ1AbWeF8sMwCXhKtZQNwmRJa6tNC+IryeKrUAtPa4MToy
         QcA+BrdasMjnGNhEBrhsEMTogz0Xrr/dY3auqpFom1mwSt8dK54gcyt8o5+2KOCS4bs6
         xn4jz36FaH4OnAqBxcefaFKl/9Sgtim3s0QclHfoLceoihTsVbT6we6Sykqtocifd3X3
         zhAsRT/BNpWvynkpBthNzh0Q1jc5jOr8IBtY9b+XECe2zt1JmX9F5KcsHPI8HVoOB/gk
         KbKUcd9BieEcVzHknqzrQ91xaUSAqYb45YvOJdPfDIWLFRMEmS+QLd8SOF0vQQlO7t2P
         I0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=YlQeaH5/KcevoKEl51vDAlqU6fywoh7neaxZiZXvzYM=;
        b=cdbZPiAF9IissumwLgBOCC+05Y3oxegn/UsUv7XYlZfLCovyr72THyjBwVjAdtygWu
         5h0vttEQA2jukH6kOGoQvpOJa1MEwqJerI4wau/8nCQ+Khc4Qrc7rKK2Q//4O4r8laif
         DW9m4p0epr/VCR0HEWJ97wQMBd+KRbRwRlifxpKBXp/nB+Kr/7VhyuobtGu7/rzqoSMZ
         H8tA0oc4Ow9tGPyEBNpPiTRGWzHBqXxnHV1QCmpBMt0aQCEK6iDYNif7ygSt2rUIQnFp
         6NVHrcWHW1wlf3S+3qsl4dU2FDIbaWi9jsWrmzE+z3D9JsZ8Lbo74muCw2uJ7M+DO+KX
         WKkA==
X-Gm-Message-State: AOAM5303oVb49ruYyo367Y2xkjEkHgjh600ETgBH3kA5xIg6n8Rur9av
        X09E4Sv2lD7H+N3ECNTt232b2GmvL5kl+/ferz0Q5Q==
X-Google-Smtp-Source: ABdhPJwpS3LA0Wy7sKqk8ysxk0a+ukPmDWlwckuHShWHBjsztS9qHAGQ4HLGGUuUw3YYY+xaxE4GjIDaOvJElLjK1bg=
X-Received: by 2002:a2e:9a0c:: with SMTP id o12mr986613lji.104.1605273086649;
 Fri, 13 Nov 2020 05:11:26 -0800 (PST)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Nov 2020 14:11:15 +0100
Message-ID: <CACRpkdZMomW2zVepq6y6P-EjHjN9xMJvVFm0n3WAsPKS3-QgYw@mail.gmail.com>
Subject: [GIT PULL] GPIO fixes for the v5.10 series
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here are some GPIO fixes I've collected with the help
of Bartosz.

Nothing special about them: all are driver and kbuild
fixes + some documentation fixes.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.10-2

for you to fetch changes up to b72de3ff19fdc4bbe4d4bb3f4483c7e46e00bac3:

  gpio: sifive: Fix SiFive gpio probe (2020-11-11 09:53:09 +0100)

----------------------------------------------------------------
GPIO fixes for the v5.10 series:

- Tidy up a missed function call in the designware driver
  when converting to gpiolib irqchip.

- Fix some bitmasks in the Aspeed driver.

- Fix some kerneldoc warnings and minor bugs in the improved
  userspace API documentation.

- Revert the revert of the OMAP fix for lost edge wakeup
  interrupts: the fix needs to stay in.

- Fix a compile error when deselecting the character
  device.

- A bunch of IRQ fixes on the idio GPIO drivers.

- Fix an off-by-one error in the SiFive GPIO driver.

----------------------------------------------------------------
Arnaud de Turckheim (3):
      gpio: pcie-idio-24: Fix irq mask when masking
      gpio: pcie-idio-24: Fix IRQ Enable Register value
      gpio: pcie-idio-24: Enable PEX8311 interrupts

Billy Tsai (1):
      gpio: aspeed: fix ast2600 bank properties

Damien Le Moal (1):
      gpio: sifive: Fix SiFive gpio probe

Jia He (1):
      gpio: dwapb: Fix missing conversion to GPIO-lib-based IRQ-chip

Kent Gibson (6):
      gpio: uapi: fix kernel-doc warnings
      gpio: uapi: comment consistency
      gpio: uapi: kernel-doc formatting improvements
      gpio: uapi: remove whitespace
      gpio: uapi: clarify the meaning of 'empty' char arrays
      gpiolib: fix sysfs when cdev is not selected

Linus Walleij (1):
      Merge tag 'gpio-fixes-for-v5.10-rc3' of
git://git.kernel.org/.../brgl/linux into fixes

Tony Lindgren (1):
      Revert "Revert "gpio: omap: Fix lost edge wake-up interrupts""

 drivers/gpio/gpio-aspeed.c       |   1 +
 drivers/gpio/gpio-dwapb.c        |   4 +-
 drivers/gpio/gpio-omap.c         |  12 ++++-
 drivers/gpio/gpio-pcie-idio-24.c |  62 ++++++++++++++++++++---
 drivers/gpio/gpio-sifive.c       |   2 +-
 drivers/gpio/gpiolib-cdev.h      |  15 ------
 drivers/gpio/gpiolib.c           |  18 +++++--
 include/uapi/linux/gpio.h        | 106 ++++++++++++++++++++-------------------
 8 files changed, 140 insertions(+), 80 deletions(-)
