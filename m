Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A66191E90BC
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2020 13:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728923AbgE3LKK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 May 2020 07:10:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728071AbgE3LKJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 May 2020 07:10:09 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73CA2C08C5C9
        for <linux-gpio@vger.kernel.org>; Sat, 30 May 2020 04:10:09 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id 202so1203255lfe.5
        for <linux-gpio@vger.kernel.org>; Sat, 30 May 2020 04:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=3zCIMZZqOkqtw8tYA7qkkVDOJkyv5YdgBPoC2XudPdo=;
        b=it9ROSDwskKiDLT8YE6GR5gmZO8qRiITGXfHU/8Y/YtDR7zpIqW1zmT4HHgCbW5Ie2
         1h/HhNqlM5Bqmz2fpdSjaY/gkamEIHk9ZvO+Mb+tUW9xg3Fe+tYEcemsUhJ/Ub7cOGtP
         y/zwwUE0tfGTOGFgrEHUeJlWcBrt8U/da/UUe2e5m3QiTkkoFasegdc4ropGuJuD+tF2
         hZCGg+x3jRWtEPrflfgbKKQibvxKc/vLFoe8rEaD5pHqGeiP6mC7VCp3ohKmV5G4OEyG
         ACwkC2iPHiVU2P9o0PymSyVZbtn84lAzUv2hH9N4jiRQRZNewCPfgrLKHRbzL+WekjHg
         80xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=3zCIMZZqOkqtw8tYA7qkkVDOJkyv5YdgBPoC2XudPdo=;
        b=U5gcxAm0qTK4osI5ihFbHAnlk+MTDK8NjSJqYWVk1NKgEsXgkHdYJE8IeQoNFb4Gee
         hzStjOyY38/8GML68PxZ6Brxdb8Yoa+gC6Rz+qPKExji3+9WfBctpKL9GlFDpOdtXcd+
         zSyaofSximx8fHnh++gS3V3wHtuG65NCGNmAJX7YASVqYAwfCFTZjUwf9+PY2Bk+4HUP
         yW8Bw3sNLUGwfCvHEjzkzAcAsXIY7QUbkO+BfBsI1GTulUu2zbMGFv/yUD0wuPGlcwHg
         daAHW6issq4ilk6bC5wgig0qKqy9DIT/K+1EX0eaUwjZE79tqHRgZ+Naoe+gyKilbDC5
         k7ew==
X-Gm-Message-State: AOAM530RirQJ+nLOM/R44gbBXI/iCp9K5dKTeE9862ZhExOyeCu4cEzk
        xYjLhBPVK6YtkMpNVAXLZcGrov+D87gpIZJz0xEtZw==
X-Google-Smtp-Source: ABdhPJzOXC4tWnBw9pLoCQCIx1Vcb9BdODA2t/626/hppIuTdlPL29VLS4IMkMnbcyrZJXuTlrDQ2EfFj6hbHa+qmcI=
X-Received: by 2002:ac2:4823:: with SMTP id 3mr6557879lft.194.1590837007857;
 Sat, 30 May 2020 04:10:07 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 30 May 2020 13:09:56 +0200
Message-ID: <CACRpkdY0are=TC79q_4vP9R1tzSjRU4aiqOGd1-5CXDbhpMj0A@mail.gmail.com>
Subject: [GIT PULL] GPIO fixes for v5.7
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

here are some (very) late fixes for GPIO, none of them very
serious except the one tagged for stable for enabling IRQ on
open drain lines.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit b9bbe6ed63b2b9f2c9ee5cbd0f2c946a2723f4ce:

  Linux 5.7-rc6 (2020-05-17 16:48:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.7-3

for you to fetch changes up to e9bdf7e655b9ee81ee912fae1d59df48ce7311b6:

  gpio: fix locking open drain IRQ lines (2020-05-29 14:01:49 +0200)

----------------------------------------------------------------
GPIO fixes for the v5.7 series:
- Fix proving of mvebu chips without PWM
- Fix errorpath on ida_get_simple() on the exar driver
- Notify userspace properly about line status changes
  when flags are changed on lines.
- Fix a sleeping while holding spinlock in the mellanox
  driver.
- Fix return value of the PXA and Kona probe calls.
- Fix IRQ locking of open drain lines, it is fine to
  have IRQs on open drain lines flagged for output.

----------------------------------------------------------------
Axel Lin (1):
      gpio: mlxbf2: Fix sleeping while holding spinlock

Bartosz Golaszewski (1):
      gpiolib: notify user-space about line status changes after flags are set

Linus Walleij (3):
      Merge tag 'gpio-fixes-for-v5.7-rc6' of
git://git.kernel.org/.../brgl/linux into fixes
      Merge tag 'gpio-fixes-for-v5.7' of
git://git.kernel.org/.../brgl/linux into fixes
      gpio: fix locking open drain IRQ lines

Sascha Hauer (1):
      gpio: mvebu: Fix probing for chips without PWM

Takashi Iwai (1):
      gpio: exar: Fix bad handling for ida_simple_get error path

Tiezhu Yang (2):
      gpio: pxa: Fix return value of pxa_gpio_probe()
      gpio: bcm-kona: Fix return value of bcm_kona_gpio_probe()

 drivers/gpio/gpio-bcm-kona.c |  2 +-
 drivers/gpio/gpio-exar.c     |  7 +++++--
 drivers/gpio/gpio-mlxbf2.c   |  6 +++---
 drivers/gpio/gpio-mvebu.c    | 15 +++++++++------
 drivers/gpio/gpio-pxa.c      |  4 ++--
 drivers/gpio/gpiolib.c       | 26 ++++++++++++++++++++++----
 6 files changed, 42 insertions(+), 18 deletions(-)
