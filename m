Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F7692D7255
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 09:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405553AbgLKIyV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 03:54:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390115AbgLKIxr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 03:53:47 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7160CC0613CF
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 00:53:06 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id f11so10050048ljn.2
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 00:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=HD1s+aKQdbe7nprMoMJBtGGyTYIoYf0ZydUBEq9j8IM=;
        b=Bd6RrWFODAeZRHdhYVGsxF/l4p5B3Jzl8ZnCpFrcSA/HyHuSGlmWwTE3HCBiH2uoFY
         0QspMIrwTWy7msZbM1XEewTo6Z2fVZ6ZoNyVyh3+IANVag6KZp7V18Cxe0btWQXezIjy
         AXTnPWQwotqWUyPyXoHqgLOzHdz5y56HLPl5bhhalg/4k3TFAFFgN1gr4SVmydbpuhQ4
         /tUqgd0ooc5f3i5evVoytxS6koFykaWU/+HWMRc5/AqgZQT06gjnK4bNUGWknQsxANaG
         lOJ2MJxqvZXuNVUbWu86csxRc6K036jR+QlEf67NTS6clSRdEmDN4djbWiaAjklAiEeY
         GS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=HD1s+aKQdbe7nprMoMJBtGGyTYIoYf0ZydUBEq9j8IM=;
        b=CfMCzcMEwJcm6IfiHB0Mtre6gnhlyJfcMruPfGTA1yj70gLo16/uw72oOz0WErJjkR
         VCHtX5Iic06e7HdaJF8fYBI2TQGJjcwuzDpiP+WxJzUkxmIXSGbS0W5+HKoI5vHr/DhZ
         gjqL2E8P50s9MWM0i16T+lDrPBjQX1do7E1rgRABYoqmi4jzWZIFJmw2h7ZP8PE7delq
         ET7NqnFVX6u30glKUvyy6MoBzU+hKhPatHIbDg/U8ZSGJCg5ePyf4RH/jrbl1h33/Q2Q
         N9nYg11izU60G9nFpCKnOZq5+s36OBzv9LL73e4WxGeDk8vHQMKf/d/TvK1JCtlKr6ee
         o5Bw==
X-Gm-Message-State: AOAM5310RxdnwrND3nbh2a4JIwfKn+bbxGdqmMWzp1C0MJxrugEhM/2k
        09ZcVTC530Q3kqWztMsNYfy05X18JRd075w4Qb0SEA==
X-Google-Smtp-Source: ABdhPJyfZl9b6Tv5Bgsg4rVl2B5fAoqXDAX0DGkwpu/4mZSzvhH0/zOYTfmM92ZPkYCCO7MW1uC4GyhVHBYm6f0KqKg=
X-Received: by 2002:a2e:b047:: with SMTP id d7mr209711ljl.467.1607676784948;
 Fri, 11 Dec 2020 00:53:04 -0800 (PST)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Dec 2020 09:52:54 +0100
Message-ID: <CACRpkdYD3585mDYKNH2dZhOncpef4WJkm0iEGA7g38aghj7Xvg@mail.gmail.com>
Subject: [GIT PULL] Late pin control fixes for v5.10
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Coiby Xu <coiby.xu@gmail.com>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here is a late set of pin control fixes for v5.10, most concern some
minor and major issues found in the Intel drivers. Some are so hairy
that I have no idea what is going on there, but luckily the maintainer
knows what's up.

We also have an interesting fix for AMD, which makes
AMD-based laptops more stable IIUC.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit 09162bc32c880a791c6c0668ce0745cf7958f576:

  Linux 5.10-rc4 (2020-11-15 16:44:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.10-3

for you to fetch changes up to e8873c0afd34beb67ec492cd648dd0095b911f65:

  pinctrl: intel: Actually disable Tx and Rx buffers on GPIO request
(2020-12-09 09:08:18 +0100)

----------------------------------------------------------------
Pin control fixes for the v5.10 kernel cycle:

- Fix up some SPI group and a register offset on Intel Jasperlake.
- Set default bias on Intel Merrifield.
- Preserve debouncing on Intel Baytrail.
- Stop .set_type() irqchip callback in the AMD driver from fiddling
  with the debounce filter.
- Fix access to GPIO banks that are pass-thru on the Aspeed.
- Fix a fix for the Intel pin control driver to disable Rx/Tx when
  requesting a UART line as GPIO.

----------------------------------------------------------------
Andrew Jeffery (1):
      pinctrl: aspeed: Fix GPIO requests on pass-through banks

Andy Shevchenko (4):
      pinctrl: jasperlake: Unhide SPI group of pins
      pinctrl: merrifield: Set default bias in case no particular value given
      pinctrl: baytrail: Avoid clearing debounce value when turning it off
      pinctrl: intel: Actually disable Tx and Rx buffers on GPIO request

Coiby Xu (1):
      pinctrl: amd: remove debounce filter setting in IRQ type setting

Evan Green (1):
      pinctrl: jasperlake: Fix HOSTSW_OWN offset

Linus Walleij (1):
      Merge tag 'intel-pinctrl-v5.10-3' of
gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel into fixes

 drivers/pinctrl/aspeed/pinctrl-aspeed.c    |  74 ++++-
 drivers/pinctrl/aspeed/pinmux-aspeed.h     |   7 +-
 drivers/pinctrl/intel/pinctrl-baytrail.c   |   8 +-
 drivers/pinctrl/intel/pinctrl-intel.c      |   4 +-
 drivers/pinctrl/intel/pinctrl-jasperlake.c | 452 +++++++++++++++--------------
 drivers/pinctrl/intel/pinctrl-merrifield.c |   8 +
 drivers/pinctrl/pinctrl-amd.c              |   7 -
 7 files changed, 320 insertions(+), 240 deletions(-)
