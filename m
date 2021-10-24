Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 271D1438BC5
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Oct 2021 22:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231891AbhJXUTb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 16:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbhJXUTa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 16:19:30 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 852D7C061745
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 13:17:09 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id d13so4402734ljg.0
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 13:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=WDtnAJGpU46SQZqjSlsHD7MRfRSPT/f8zfl1iHNdYtI=;
        b=LjtQPuV6PrpjFGRsCotTV7vqIvnwOj+kopYRsvybW0YkyYU0moLTLdt9o7OwOHWOH3
         PT6FlyHKxcKExnS+a1XcLVgk/EZPKus3pAJkQDMYwa1kSBne63PaYVyKiDGeyzH2mxOW
         HLTIXW6SUJUvzPkioZa4BbU6Gl4VllzLwtemv4PDUN/ffZeFmbnVntMG9qhOP0biBOTp
         LDYvkN3fHQqULZKhEG9GiJwx4/XXoWQ0KVjHckayeu5bmuVA04FBv0Ct+ne+5j8YQlaV
         teYkSTrNppjLsi8L4isMUFl0xsX3eIA8e6MeUeN4KnUZH69gLq/eue2djVkE/x6q1iP1
         84BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=WDtnAJGpU46SQZqjSlsHD7MRfRSPT/f8zfl1iHNdYtI=;
        b=RQagy08y6PF+z9FG3q4KKQ3fl5Z7c4h9PliKcxMreH+e3WDPvdCcvxrdkZ/3OlQI5O
         kM4aFjZcPa3ZSInIHeLKMFam5JHgB2KiC70d5QETJFlvHj6OoBRMW/M0eNAIuiGarTul
         YXQ1d4etjiMdl3JqglE7mcra9Rc+5vkn2P/1nolKx3DRuKWEOn+D7861kb31OlkOA2Q2
         FksgJ1t3/atPpq6XI9adyNjsnF89GOmIUR6XsybAgzbVpe44Fp9ms86sutYZdRGcGgR5
         7pm+6sp0aULHqiqqlgR1b4oGlPpcrjxAEbSAJpPchvflCgvjN5mnVPNo0ui9YZ1M0tF8
         fBWg==
X-Gm-Message-State: AOAM532HRdzMXOXMwVydBPi3U9zEW396RlKDnMTjfZT9fF8za+EU8UX9
        XDvLnAMxZ8JltIZmJ6tVLB/6brTZQ8H8MMkd850lsX6SY3Rw4Q==
X-Google-Smtp-Source: ABdhPJzPtzdaNPiGyNknTLn+DYWFbWh2q5eKDNmvFWsCNNqGsD5sOlq1as+JMN3fv0/k8vB4MgkcKWQozRyoRkMykKQ=
X-Received: by 2002:a2e:9c0b:: with SMTP id s11mr14583624lji.259.1635106627762;
 Sun, 24 Oct 2021 13:17:07 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 24 Oct 2021 22:16:56 +0200
Message-ID: <CACRpkdYY43-Dj=ZQ3brn41-3OZm0_vT+qHmcG9=EsMFy6J_Q_g@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v5.15
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Sachi King <nakato@nakato.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here are some late pin control fixes, the most generally annoying
will probably be the AMD IRQ storm fix affecting the Microsoft
surface.

Details in the signed tag.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit 64570fbc14f8d7cb3fe3995f20e26bc25ce4b2cc=
:

  Linux 5.15-rc5 (2021-10-10 17:01:59 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.15-3

for you to fetch changes up to 4e5a04be88fe335ad5331f4f8c17f4ebd357e065:

  pinctrl: amd: disable and mask interrupts on probe (2021-10-16 23:56:59 +=
0200)

----------------------------------------------------------------
Pin control fixes for the v5.15 series:

- Three fixes pertaining to Broadcom DT bindings. Some stuff
  didn't work out as inteded, we need to back out.

- A resume bug fix in the STM32 driver.

- Disable and mask the interrupts on probe in the AMD pinctrl
  driver, affecting Microsoft surface.

----------------------------------------------------------------
Fabien Dessenne (1):
      pinctrl: stm32: use valid pin identifier in stm32_pinctrl_resume()

Rafa=C5=82 Mi=C5=82ecki (3):
      Revert "dt-bindings: pinctrl: bcm4708-pinmux: rework binding to
use syscon"
      dt-bindings: pinctrl: brcm,ns-pinmux: drop unneeded CRU from example
      Revert "pinctrl: bcm: ns: support updated DT binding as syscon subnod=
e"

Sachi King (1):
      pinctrl: amd: disable and mask interrupts on probe

 .../devicetree/bindings/mfd/brcm,cru.yaml          | 11 ++++----
 .../bindings/pinctrl/brcm,ns-pinmux.yaml           | 33 +++++++++---------=
----
 drivers/pinctrl/bcm/pinctrl-ns.c                   | 29 +++++++-----------=
-
 drivers/pinctrl/pinctrl-amd.c                      | 31 ++++++++++++++++++=
++
 drivers/pinctrl/stm32/pinctrl-stm32.c              |  4 +--
 5 files changed, 63 insertions(+), 45 deletions(-)
