Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA58B15BE3B
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2020 13:06:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729588AbgBMMGw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Feb 2020 07:06:52 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40953 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729572AbgBMMGw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Feb 2020 07:06:52 -0500
Received: by mail-lf1-f65.google.com with SMTP id c23so4093578lfi.7
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2020 04:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=ljvL+q1ehc9hcE8Oh6338oPVKNyNzPigaFIhZmlb+Cs=;
        b=US+h7OU2xjwHrGXOZLNbcqFfh7PtP17QjpNUpr1Zxeo+kxdLcA+dSzVzpxTaFOXdeR
         D7pXkDHwPNRgqOhSk1rFin0CybhKGqoZExKn+2W6zYxarf1ey4uMf4wcQr7AGNIjuiHI
         ADLeNeNL8NOIoY2rmNOukzhjj0quf9PbsLng5/61NjOTw169NMuu/2gijfzk5cA4Y9aw
         IajwPpByAh+Kl9NDdllXgRJs/UjVKNgkuE932syk3ghweiLlwYUm5sYjC3oW60VUQ1bh
         adqt32gTps9AAp8WJ9lYLe/gTKhf8hYQTqj6XeaHtZusjvz1ksCi+YCZEkxsVIQUGcdl
         nxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=ljvL+q1ehc9hcE8Oh6338oPVKNyNzPigaFIhZmlb+Cs=;
        b=DW/2cuwjanIfiXrQs+7v7wrtAha753OKSptW5QXRQG7dVzVZi705BIZpLgTtTxSP9O
         ymM8Jbo/6dHv32eXjI+HPqLwjJh6G+58fFqyHqrxuCzlTx8oCslf3N98Y3Y2MUp0ejx3
         NmMELo8WTAuHJhWS1nAVkMmj4zLcHUB+qYWLiAQTP+I3OfP5O6kMPJsgHj/HvGHzh7ZS
         LUUlAtj5I16I/0ykx0Nnti6m/7YG9uAbNWNfbbcSwaGs9ihFUk31dI3tt0xJ+IjCNV10
         DT6Ozxgc5589MhIxxJ7A0ab7W+XPJF5IHrHEorD0hHnNcoIUiCbZcuyj8Lu7+ZwQFeoH
         RY2g==
X-Gm-Message-State: APjAAAXkl8D5DjFFOxI3X/lmlkCQzcRMPkNzQSmBKFjCfSJNr0pd9ZhV
        g+JyWcTICA9LVveVtFZFUs0TxB4kvA+bC+2vcxTlKg==
X-Google-Smtp-Source: APXvYqxZZB/dm8iMvpxBPdSJ2kZNU7WeYdkBQdcBSkHpR7kUR1w/ligMgKO0gpyYcYtaPGrfKAUDXJNUGin/c3PPVGI=
X-Received: by 2002:ac2:4d04:: with SMTP id r4mr9398235lfi.77.1581595609457;
 Thu, 13 Feb 2020 04:06:49 -0800 (PST)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 13 Feb 2020 13:06:38 +0100
Message-ID: <CACRpkdYAtMeqYaBGF__6dP7tOc_oh573Xtrxza-qcT7TtFNmSw@mail.gmail.com>
Subject: [GIT PULL] GPIO fixes for v5.6
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here are some first fixes for GPIO, evening out some bumps
in the merge window and making everything generally nice
early in the cycle.

One patch hits the drivers/spmi subsystem, the maintainer
of that subsystem explicitly asked me to merge this patch
through the GPIO tree.

Details in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.6-2

for you to fetch changes up to a924eae75106258c0797706a0578c5af499c9ff5:

  gpio: sifive: fix static checker warning (2020-02-10 13:54:17 +0100)

----------------------------------------------------------------
GPIO fixes for the v5.6 kernel cycle:

- Revert two patches to gpio_do_set_config() and implement
  the proper solution that works, also drop an unecessary
  call in set_config()

- Fix up the lockdep class for hierarchical IRQ domains.

- Remove some bridge code for line directions.

- Fix a register access bug in the Xilinx driver.

----------------------------------------------------------------
Andy Shevchenko (1):
      MAINTAINERS: Sort entries in database for GPIO

Axel Lin (1):
      gpio: bd71828: Remove unneeded defines for GPIO_LINE_DIRECTION_IN/OUT

Bartosz Golaszewski (3):
      Revert "gpiolib: Remove duplicated function gpio_do_set_config()"
      Revert "gpiolib: remove set but not used variable 'config'"
      gpiolib: fix gpio_do_set_config()

Kent Gibson (1):
      gpiolib: remove unnecessary argument from set_config call

Linus Walleij (1):
      Merge tag 'gpio-fixes-for-v5.6-rc2' of
git://git.kernel.org/.../brgl/linux into fixes

Paul Thomas (1):
      gpio: xilinx: Fix bug where the wrong GPIO register is written to

Stephen Boyd (1):
      spmi: pmic-arb: Set lockdep class for hierarchical irq domains

Yash Shah (1):
      gpio: sifive: fix static checker warning

 MAINTAINERS                  | 28 ++++++++++++++--------------
 drivers/gpio/gpio-bd71828.c  | 10 ----------
 drivers/gpio/gpio-sifive.c   |  6 +++---
 drivers/gpio/gpio-xilinx.c   |  5 +++--
 drivers/gpio/gpiolib.c       | 30 +++++++++++++++++++++++++-----
 drivers/spmi/spmi-pmic-arb.c |  4 ++++
 6 files changed, 49 insertions(+), 34 deletions(-)
