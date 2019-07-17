Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3510F6BEF6
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jul 2019 17:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbfGQPYw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jul 2019 11:24:52 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45447 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbfGQPYw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jul 2019 11:24:52 -0400
Received: by mail-lj1-f193.google.com with SMTP id m23so23998827lje.12
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jul 2019 08:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=RiBxeDla5S+W1dOK7Khr8uPhoGXyMITDyRV+d4Gpttw=;
        b=WaqzP2Oaflu33Wr9zVrugsUqwIcrHOC6d1INoBgDeGzkUUzC6C1UQ5XLpyMA7c1uu0
         Yj8PHMAR69KBRiYNMncEc5F+Y4WjalukgGpDzO8ps/VqVRnZy8+3icmjMzKiRCcbOI/i
         otXJNpfRwoAbHZ6kFyUoXSJidXDiKagyn4x7tQ/xB4e381VNUXbRfH3KUuGJsxDuxGFj
         K/1ce/gafL5dUYRoqzbvgDMouuwkwlvBu+lrTRuoOc449W86vJtgD4KkyeKTE61FmF6Q
         MHjji/RO3xgkV2ehxOPnf7sDpFyHWyIqWa7+ZgehWk8pfhsFvgfH/Ai7u5sNs1J1HehU
         vpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=RiBxeDla5S+W1dOK7Khr8uPhoGXyMITDyRV+d4Gpttw=;
        b=BSVfj0DcolqL+A2LAi3pJXaOFD81jWCvzHVZkBFBGk3g6JjRLudCqWiu30kTU57FME
         oZTY3MK0Cj93/uhf2p+1Xsr/AklNvHnVgReHIZCLZQ9SHIOnB/MGlRtElrRj8swD1YaD
         v5xCj45cJx61bYb33578q8cRQt3JRyMWk8vEELzAQ6xBsQl/HI1ed5/dYlIVTQyUCJhF
         t8alpfhF+oOxLZZXM+G53GV44hhTEGFMF57aQgUJWdSDOUW5BaO3s/UlBhUCl8SS4nnW
         jJza9dS8ueDj3rFyL2/jrUcoJOiAUWWi6lGyTnw1dr7FJP0qYhAnBP+01EAr5ipSt80G
         wbwg==
X-Gm-Message-State: APjAAAULdoYOYCweNzi1k7QBmM1tmVQrQdyXLaWgDumTNn2z5LKGLWNN
        WtfKask3aCJBakBeppJcMxFmH0sQ8gDelbqlLLBoow==
X-Google-Smtp-Source: APXvYqwtOm+KRiLvQOXdvGCwtGiYezXbs0zHjP2TQOlPCu8ncjrv1uFE3puMuifvkG/6TI4TgDJaXgpjY8GJ8Mqin2g=
X-Received: by 2002:a2e:8756:: with SMTP id q22mr21546133ljj.108.1563377090216;
 Wed, 17 Jul 2019 08:24:50 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 17 Jul 2019 17:24:38 +0200
Message-ID: <CACRpkdYOahn84UxZ_-YAQsP+4W+HQCAL7xEJieEDd53xLgaWfw@mail.gmail.com>
Subject: [GIT PULL] GPIO fixes for v5.3 take one
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

some fixes arrived early so let's merge them early so we
have as little problems as possible in -rc1.

This is based on the most recent HEAD commit that day.

Please pull it in, details in the signed tag.

Yours,
Linus Walleij

The following changes since commit 9637d517347e80ee2fe1c5d8ce45ba1b88d8b5cd:

  Merge tag 'for-linus-20190715' of git://git.kernel.dk/linux-block
(2019-07-15 21:20:52 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.3-2

for you to fetch changes up to 88785b7fa74ae2dc52f879140b976984b5374c79:

  Merge tag 'gpio-v5.3-rc1-fixes-for-linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into fixes
(2019-07-16 11:12:14 +0200)

----------------------------------------------------------------
GPIO fixes for the v5.3 merge window:
- Revert a SPIO GPIO fix that didn't fix anything instead created new
  problems.
- Remove the EM GPIO irqdomain in a safe manner.
- Fix a memory leak in the gpio quirks.
- Make the DaVinci error path silent on probe deferral.

----------------------------------------------------------------
Bartosz Golaszewski (1):
      gpio: em: remove the gpiochip before removing the irq domain

Keerthy (1):
      gpio: davinci: silence error prints in case of EPROBE_DEFER

Linus Walleij (2):
      Revert "gpio/spi: Fix spi-gpio regression on active high CS"
      Merge tag 'gpio-v5.3-rc1-fixes-for-linus' of
git://git.kernel.org/.../brgl/linux into fixes

Nishka Dasgupta (1):
      gpiolib: of: fix a memory leak in of_gpio_flags_quirks()

 drivers/gpio/gpio-davinci.c |  5 +++--
 drivers/gpio/gpio-em.c      | 33 +++++++++++++++------------------
 drivers/gpio/gpiolib-of.c   | 10 ++--------
 3 files changed, 20 insertions(+), 28 deletions(-)
