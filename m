Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3CC812A949
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Dec 2019 00:07:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbfLYXHx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Dec 2019 18:07:53 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40510 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726776AbfLYXHx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Dec 2019 18:07:53 -0500
Received: by mail-lf1-f66.google.com with SMTP id i23so17397850lfo.7
        for <linux-gpio@vger.kernel.org>; Wed, 25 Dec 2019 15:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=+tSSA6VWqaa29D/81Kxz1W67EXFx2P3VO41Ty+etGfw=;
        b=KqqZ7APU5SNZMRD+NMez/fMGThMzF+/JpzAxfiPKLv23K/MQDwa5l5qBUO/ljmAQDf
         IAPa6pOYDk55ZZ4HT9YSU4SmjHCQkmxAvOH1GKeRJRLTN0Lk39DioUNvgQyGOZJWOnel
         7tcgqd9ivDONDIcVpCRRF+r91XUTzLbf/yaV0vZKiylAXDhp0C3VK0IRWW1Zbs9IUJ5/
         aSUcOLLDm0JF2dQkyrayhDHrAGVaJntFW9MjZ835NmOmJ97Ifq1jWsg+7wf5/9jrPq1w
         QfmAxD4BYHpccCJbqHGFVeC7907UxKWJkEG7PC6Nk0mL96asYanby5MFY8YLMfyMqvn8
         G8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=+tSSA6VWqaa29D/81Kxz1W67EXFx2P3VO41Ty+etGfw=;
        b=XCrHCjTIj9JDKvo4vU2V/inRwzoM8n8qDh4dgnAcBEI1Nll+u7RbHZpPsiYcRUrZxb
         7aSiqELlmjxXi8xgj5BYc2tdowjVXhAo0wjY2SwOMdOX/o+kiIMMdCZMSqh9FEQEWs+o
         E0BYtpRK5KvLbJIyowVYTevFFsnSWphlySl29vbGIYzUO6lXamB9XnDDaud5hS7hlPSB
         XjjGmC4qCQfOo7TOvPx4cwm+/QaSMO5YT8o+0Q2SzVE3nM3Ylwyegdhar5g6JkRrU8x4
         kx5NSkwlXsK2zYDKHT/UmKAOIRqe5S9c7sgQLTcJsAQ2Cej1AIri4T6w1SV1k1XcUOwq
         aXWg==
X-Gm-Message-State: APjAAAW1KsZdtTYEPQ02fhb7uPSkX9MPJQG+R5Da6R+Za+89iBB94k4h
        cFL2cb8+4qL1mjUmvLzu+UPwEyySLxtg7ojwGtT+ecJI8hI=
X-Google-Smtp-Source: APXvYqz404A72Js0dpvRqj99Gvt3aoSkNTXfa2TY2YLXQtMxzTK6SrbXy2CgiuwEfmDKtGU0GZJdoAmqKFjnjBg7aHg=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr23696873lfi.93.1577315270809;
 Wed, 25 Dec 2019 15:07:50 -0800 (PST)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 26 Dec 2019 00:07:39 +0100
Message-ID: <CACRpkdZucwZNrUo3=WPM-utorFaqOn4AyhxMnX4xM_wvhP8SXg@mail.gmail.com>
Subject: [GIT PULL] gpio fixes for the v5.5 series
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here are some slightly overly ripe first GPIO fixes for the v5.5
series. A bit late and too many because christmas stress.
Not too many lines though.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a=
:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.5-2

for you to fetch changes up to 286e7beaa4cc7734894ee214569de4669ed9891e:

  gpio: tegra186: Allow building on Tegra194-only configurations
(2019-12-16 11:16:57 +0100)

----------------------------------------------------------------
A set of fixes for the v5.5 series:

- Fix the build for the Xtensa driver.

- Make sure to set up the parent device for mpc8xxx.

- Clarify the look-up error message.

- Fix the usage of the line direction in the mockup device.

- Fix a type warning on the Aspeed driver.

- Remove the pointless __exit annotation on the xgs-iproc which
  is causing a compilation problem.

- Fix up emultation of open drain outputs .get_direction()

- Fix the IRQ callbacks on the PCA953xx to use bitops and
  work properly.

- Fix the Kconfig on the Tegra driver.

----------------------------------------------------------------
Andy Shevchenko (2):
      MAINTAINERS: Append missed file to the database
      gpio: pca953x: Switch to bitops in IRQ callbacks

Arnd Bergmann (2):
      gpio: aspeed: avoid return type warning
      gpio: xgs-iproc: remove __exit annotation for iproc_gpio_remove

Geert Uytterhoeven (1):
      gpio: Fix error message on out-of-range GPIO in lookup table

Johnson CH Chen (=E9=99=B3=E6=98=AD=E5=8B=B3) (1):
      gpio: mpc8xxx: Add platform device to gpiochip->parent

Kent Gibson (1):
      gpio: mockup: Fix usage of new GPIO_LINE_DIRECTION

Linus Walleij (1):
      Merge tag 'gpio-v5.5-rc2-fixes-for-linus' of
git://git.kernel.org/.../brgl/linux into fixes

Max Filippov (1):
      gpio: xtensa: fix driver build

Russell King (1):
      gpiolib: fix up emulated open drain outputs

Thierry Reding (1):
      gpio: tegra186: Allow building on Tegra194-only configurations

 MAINTAINERS                      |  1 +
 drivers/gpio/Kconfig             |  4 ++--
 drivers/gpio/gpio-aspeed-sgpio.c |  2 +-
 drivers/gpio/gpio-mockup.c       |  7 +++++--
 drivers/gpio/gpio-mpc8xxx.c      |  1 +
 drivers/gpio/gpio-pca953x.c      | 26 ++++++++++----------------
 drivers/gpio/gpio-xgs-iproc.c    |  2 +-
 drivers/gpio/gpio-xtensa.c       |  7 +++----
 drivers/gpio/gpiolib.c           | 13 +++++++++++--
 9 files changed, 35 insertions(+), 28 deletions(-)
