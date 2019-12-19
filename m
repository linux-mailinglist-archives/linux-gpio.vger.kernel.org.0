Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2E5F126FBD
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 22:33:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbfLSVdv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 16:33:51 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35676 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbfLSVdu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 16:33:50 -0500
Received: by mail-lj1-f196.google.com with SMTP id j1so450941lja.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 13:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=PqR4x8+f9h2Qn/e8Pu7yo3KcXeRHhFv38n6yorLO0Ug=;
        b=CBz77i1+cO1ZzfRyHCuPs2lWQc8MNXKOd8UnR8KIwv2ButzuSX5Q0Uzg6RhYpOT7bO
         SmlbQw3On2pYwbmZ8S4scNa7Z4sJNUvFJXLAqmdCn+jWmeM30PoQ4Ux3+ulVxH8OI/6K
         +3ljNBvOX1mcnfDdt3Al4YIeK5xhztrwh6y9efzjtZNYO8AqnmSIqUc0Vo1jXQ+3+3aE
         2cu9W9RWEAA6hfhjxUXH6Rn6KunkxwQRKujnDSJWLiny69Am3KNmIvrS/Ef3kXm2gEZ3
         c5i/kiGuY9EUmmP4+84E1+I7tmWZxeXPdIN3SlhWquC9YPHiu96rOwG5cc30LzmKuIot
         L9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=PqR4x8+f9h2Qn/e8Pu7yo3KcXeRHhFv38n6yorLO0Ug=;
        b=cLZOCOMhXP4KB+sxPD4UOO5JdLHhLDQUbISbs6yXT06c3CvnW/YAxgke6G2xYyyQvH
         9Bp/wI3RtwSMBrsQ4OHSz3mM4cPTN5UtVKp81JHi4LMpoPcE2hu2ioLVpUVEpclU8uD5
         Ji+1eDZsY0L+HUIBUmcMi/HvVjZrXtsiby+2doFZhIVl5vOOxmhLgt5WzPeLE2jtlyEX
         3wcJM3HEPxjblfD7gP5dXHbkaHC3iqM/YE8NNTinRF0p1DNlsQFSWGKJp1i1DNKZ2bAi
         CMvM4lb0rsHzvsep3yPSTrYQFlFg9ApktoAaFtOMRm/mekUh+hxaH1vVlBEl7fOr7ZCZ
         a1JQ==
X-Gm-Message-State: APjAAAXiMS8bwHF1O2MRkQ279repUbcoJ2cQrCpa15lQqiBSZm6lTnxc
        mk3a6E0bMge8TKHqxMLH5+dDg/qhRQ3sGNv8Ns1YXA==
X-Google-Smtp-Source: APXvYqz19W2owPoKz+mA6kiWEUSTR8sk4af5EkB2e/vEhQHVrVOyBFIZCzLq8fe6Xg5K9N/ABY3tBHpcKTz1BD2FN4I=
X-Received: by 2002:a2e:a490:: with SMTP id h16mr5702791lji.251.1576791228697;
 Thu, 19 Dec 2019 13:33:48 -0800 (PST)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 19 Dec 2019 22:33:37 +0100
Message-ID: <CACRpkdbY1XBspR0rrXVvCW2LwnRfA_DnA0YzwFy-dHCVhQSr0A@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for the v5.5 series
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

sorry that this fixes pull request took a while. Too much christmas
business going on.

This contains a few really important Intel fixes and some odd fixes.

Details in the signed tag as usual.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.5-3

for you to fetch changes up to 9e65527ac3bab5480529d1ad07d4d228cc0295cd:

  pinctrl: ingenic: Fixup PIN_CONFIG_OUTPUT config (2019-12-16 11:38:20 +0100)

----------------------------------------------------------------
Pin control fixes for the v5.5 kernel cycle:

- A host of fixes for the Intel baytrail and cherryview:
  properly serialize all register accesses and add the irqchip
  with the gpiochip as we need to, fix some pin lists and
  initialize the hardware in the right order.
- Fix the Aspeed G6 LPC configuration.
- Handle a possible NULL pointer exception in the core.
- Fix the Kconfig dependencies for the Equilibrium driver.

----------------------------------------------------------------
Alexandre Torgue (1):
      pinctrl: pinmux: fix a possible null pointer in
pinmux_can_be_used_for_gpio

Andrew Jeffery (1):
      pinctrl: aspeed-g6: Fix LPC/eSPI mux configuration

Andy Shevchenko (3):
      pinctrl: baytrail: Update North Community pin list
      pinctrl: baytrail: Add GPIO <-> pin mapping ranges via callback
      pinctrl: baytrail: Pass irqchip when adding gpiochip

Hans de Goede (4):
      pinctrl: baytrail: Really serialize all register accesses
      pinctrl: cherryview: Split out irq hw-init into a separate helper function
      pinctrl: cherryview: Add GPIO <-> pin mapping ranges via callback
      pinctrl: cherryview: Pass irqchip when adding gpiochip

Linus Walleij (1):
      Merge tag 'intel-pinctrl-v5.5-2' of
git://git.kernel.org/.../pinctrl/intel into fixes

Paul Cercueil (1):
      pinctrl: ingenic: Fixup PIN_CONFIG_OUTPUT config

Rahul Tanwar (1):
      pinctrl: Modify Kconfig to fix linker error

 drivers/pinctrl/Kconfig                    |   1 +
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c |  24 ++--
 drivers/pinctrl/intel/pinctrl-baytrail.c   | 200 ++++++++++++++++-------------
 drivers/pinctrl/intel/pinctrl-cherryview.c | 107 ++++++++-------
 drivers/pinctrl/pinctrl-ingenic.c          |   2 +-
 drivers/pinctrl/pinmux.c                   |   2 +-
 6 files changed, 184 insertions(+), 152 deletions(-)
