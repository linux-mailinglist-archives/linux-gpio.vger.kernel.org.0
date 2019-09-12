Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74E94B09EC
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 10:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbfILIK0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 04:10:26 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46891 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729903AbfILIKZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Sep 2019 04:10:25 -0400
Received: by mail-lf1-f68.google.com with SMTP id t8so18531821lfc.13
        for <linux-gpio@vger.kernel.org>; Thu, 12 Sep 2019 01:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=P7NzzGg11L1WgkGhr271SvCX8f/Rsb9hDudwdwT0fCA=;
        b=ajTDMmdfwn5UX+d5ejQBWK28wtYqlhBqiZBhyyo1d7EH4QnVlSGSthpPF94JG1ts1u
         4AKBxKZnZoc2yguzP8SwFqFnEf7kZThvviTT4yARFn6IW3KOoxTJIP+KBETzzcVCE20X
         lRqOilUcIEi1rbYoyMDOmpFzRW94FQd9IBGOuE2r7jeIn+yHruPy/3UDpI9iXsDRT5qs
         ojPUxfYujzU4BAdjvtfk6dXQttk6r7g8dzEDFEcUJ8bgDDBFL3v1/h1ZgFec1bp7iUvv
         JJ1LKyVMbUFXNG5piF2UMuPPEStF1dKu6KzRRISxvaIIs3cTB/UixJgrtNgWpWbmvxBk
         iFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=P7NzzGg11L1WgkGhr271SvCX8f/Rsb9hDudwdwT0fCA=;
        b=UV3pVjzoodfsQ1fzndsnddgk7fVr/yuZUjfnv0XnoyefPJVzzI8aZbaIyguNzRIH6W
         GP6ELcPAvOsUK1VkvoCN8k7gN83JKIui6IF/HlqavMl5jzBYi46NXNRKmy5tGJudvmGJ
         2kOIyHHOE+HBW3nims3l98NpK3rp/+Vj0nauNbm7TXzM9eZiobhE/S98oag/xWCbEQ0m
         B7Z7Oha+lKi+IQoLwRxARAd7wEqSmJlwDEsEUIWehANxKio4/zRuFU1TypLlJTbHt2xg
         TsDjFoRzsE3pLd0tuvSGKQ/7WbwqMHG7htrldPaTeACgw22XPD5z4yqn+zKvHtnBFhdT
         UFjQ==
X-Gm-Message-State: APjAAAWlXfMe5eMWEOauBooHmfqeJ4wotaSx66drq2AqTjC54xLW5YeG
        fBHTGprpgZWFxXSD/kdO27lfI1tORKs5TI26InMTUA==
X-Google-Smtp-Source: APXvYqwyEw+nwxXxUdrq0Oo0KcwsWs9CUJUX5FHdQpSJ5n0/6fskRV5YuggZ49ndyydr6NdwgqdefbOCuuQr3ymB+WY=
X-Received: by 2002:ac2:5c11:: with SMTP id r17mr27289496lfp.61.1568275822130;
 Thu, 12 Sep 2019 01:10:22 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Sep 2019 09:10:10 +0100
Message-ID: <CACRpkdbZE2dwmaE2-NF_p6XQodBb=34tOxyDgfbAWjiirTgj+Q@mail.gmail.com>
Subject: [GIT PULL] final GPIO fixes for v5.3
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

I don't really like to send so many fixes at the very last minute,
but the bug-sport activity is unpredictable.

Four out of three are -stable material that will go everywhere,
one is for the current cycle.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit f74c2bb98776e2de508f4d607cd519873065118e:

  Linux 5.3-rc8 (2019-09-08 13:33:15 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.3-6

for you to fetch changes up to 61f7f7c8f978b1c0d80e43c83b7d110ca0496eb4:

  gpiolib: acpi: Add gpiolib_acpi_run_edge_events_on_boot option and
blacklist (2019-09-11 10:46:54 +0100)

----------------------------------------------------------------
GPIO fixes for v5.3:
- An ACPI DSDT error fixup of the type we always see and
  Hans invariably gets to fix.
- A OF quirk fix for the current release (v5.3)
- Some consistency checks on the userspace ABI.
- A memory leak.

----------------------------------------------------------------
Dmitry Torokhov (1):
      gpiolib: of: fix fallback quirks handling

Hans de Goede (1):
      gpiolib: acpi: Add gpiolib_acpi_run_edge_events_on_boot option
and blacklist

Kent Gibson (2):
      gpio: fix line flag validation in linehandle_create
      gpio: fix line flag validation in lineevent_create

Linus Walleij (1):
      Merge tag 'gpio-v5.4-fixes-for-linus' of
git://git.kernel.org/.../brgl/linux into fixes

Wei Yongjun (1):
      gpio: mockup: add missing single_release()

 drivers/gpio/gpio-mockup.c  |  1 +
 drivers/gpio/gpiolib-acpi.c | 42 ++++++++++++++++++++++++++++++++++++++----
 drivers/gpio/gpiolib-of.c   | 27 +++++++++------------------
 drivers/gpio/gpiolib.c      | 16 +++++++++++-----
 4 files changed, 59 insertions(+), 27 deletions(-)
