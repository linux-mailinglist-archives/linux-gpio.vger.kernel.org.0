Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F44A280FE9
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Oct 2020 11:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbgJBJcJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Oct 2020 05:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbgJBJcJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2020 05:32:09 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5FA2C0613D0
        for <linux-gpio@vger.kernel.org>; Fri,  2 Oct 2020 02:32:08 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id q8so1052114lfb.6
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2020 02:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=cHvxUpBX/Ex7gaAWP6DAAZok4HqUt/n+52o4OhqQm34=;
        b=dqhNZrsyoGQXeJcvKSrKaAmifPO60OKvjK3mWaZwK8ieVzST+7oiPWCS46NFLzoOP4
         kvP7IUMOwrPAVhvHjOiIo53CWGsn3kk+D5/o2xV3BXML53OTQxLeX39jIRX0MOAlbhg1
         wyC6RFt/w/hVf5qHOzLfR/q2l3QGDlldh3Z714JM+XQUgcX537u4v2l0dOmPoKtTtQ7v
         IxGC0hKvBjCJV7z3lx2u5LC3h8ckWLcCOTGQ2gmsqyrW+WuwyMOkyHpBSqCwWAcphDM1
         c9tzQDLyqew3MHiRxidpXL9H09E91wvfFw3Bd55v1gYUZC/+Ao4+Uf/cm3LtrDkYMQhu
         bboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=cHvxUpBX/Ex7gaAWP6DAAZok4HqUt/n+52o4OhqQm34=;
        b=nG7BWNOeQdlzWz0w6ieQBWTif3Uu7lMOIZPtz3vSyyiZ3e7vdi/A34JNDkaVK2OpH+
         Xq0g0ID8swR5gEArg+3GQEPIXiIhvDQ/3y1rnwjcylrhAnPjM6wc5aPL90nX0vG/0bKk
         346RLn9dgUqzmqd66j+38FUuaUSleJ/Cdwigp99EyHhncOpdERm5vf6WbBB7cl87eKZB
         VCDQ/RK5sfAtEh7kSOVsaAMvfdBWI6YaIjwFYMPDhLJ+a7wOakzYmDOoqBO59B2/ea43
         YvhKdjyzcbLD0OBkD+slC6oGx2fYDr/Kl0SppzqRQKJwYg/C+fUOoFffA1uTHJrRJ0+V
         NdPQ==
X-Gm-Message-State: AOAM530AjectixO8ti0nxnXN0Do/n8JXGPDVoe1ibZtg5Q0YRF9+SCfs
        UU4Csl+VJ6DL9fYhL4GpF8RKXZgW/KYvhsBJYTYexQ==
X-Google-Smtp-Source: ABdhPJxyDNjru0fi8Ui0H16Zchkrjal9WGvcn+nOms6PSaZuEFh66mvkAhvRO0WJb9oc8j3+zZ1FVuvok5A5Y3nzMgM=
X-Received: by 2002:a19:1c8:: with SMTP id 191mr510225lfb.585.1601631126486;
 Fri, 02 Oct 2020 02:32:06 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 2 Oct 2020 11:31:55 +0200
Message-ID: <CACRpkdbpo65JS6fQjrnb21RSiSG6wbGGYs0R60_vPaa=6WVbag@mail.gmail.com>
Subject: [GIT PULL] late GPIO fixes for v5.9
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here is a batch of GPIO fixes for the v5.9 series.

I'm not entirely happy with myself over this, it is too much
and too late. New bugs kept popping up, in hindsight I
should have sent smaller installments, earlier of course.

I blame stuff like stress and weltschmertz and trying to
grok KASan and a few more things on my plate.

Please pull it in.

Yours,
Linus Walleij


The following changes since commit d012a7190fc1fd72ed48911e77ca97ba4521bccd:

  Linux 5.9-rc2 (2020-08-23 14:08:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.9-2

for you to fetch changes up to 8c1f1c34777bddb633d4a068a9c812d29974c6bd:

  gpio: pca953x: Correctly initialize registers 6 and 7 for PCA957x
(2020-10-01 10:00:18 +0200)

----------------------------------------------------------------
Some late GPIO fixes for the v5.9 series:

- Fix compiler warnings on the OMAP when PM is disabled

- Clear the interrupt when setting edge sensitivity on the
  Spreadtrum driver.

- Fix up spurious interrupts on the TC35894.

- Support threaded interrupts on the Siox controller.

- Fix resource leaks on the mockup driver.

- Fix line event handling in syscall compatible mode
  for the character device.

- Fix an unitialized variable in the PCA953A driver.

- Fix access to all GPIO IRQs on the Aspeed AST2600.

- Fix line direction on the AMD FCH driver.

- Use the bitmap API instead of compiler intrinsics for
  bit manipulation in the PCA953x driver.

----------------------------------------------------------------
Ahmad Fatoum (1):
      gpio: siox: explicitly support only threaded irqs

Andy Shevchenko (3):
      gpiolib: Fix line event handling in syscall compatible mode
      gpio: pca953x: Use bitmap API over implicit GCC extension
      gpio: pca953x: Correctly initialize registers 6 and 7 for PCA957x

Bartosz Golaszewski (1):
      gpio: mockup: fix resource leak in error path

Ed Wildgoose (1):
      gpio: amd-fch: correct logic of GPIO_LINE_DIRECTION

Jeremy Kerr (2):
      gpio/aspeed-sgpio: enable access to all 80 input & output sgpios
      gpio/aspeed-sgpio: don't enable all interrupts by default

Linus Walleij (4):
      Merge tag 'gpio-fixes-for-v5.9-rc4' of
git://git.kernel.org/.../brgl/linux into fixes
      Merge tag 'gpio-fixes-for-v5.9-rc6' of
git://git.kernel.org/.../brgl/linux into fixes
      Merge tag 'gpio-fixes-for-v5.9-rc7' of
git://git.kernel.org/.../brgl/linux into fixes
      Merge tag 'gpio-fixes-for-v5.9' of
git://git.kernel.org/.../brgl/linux into fixes

Taiping Lai (1):
      gpio: sprd: Clear interrupt when setting the type as edge

Tao Ren (1):
      gpio: aspeed: fix ast2600 bank properties

Tony Lindgren (1):
      gpio: omap: Fix warnings if PM is disabled

Ye Li (1):
      gpio: pca953x: Fix uninitialized pending variable

dillon min (1):
      gpio: tc35894: fix up tc35894 interrupt configuration

 .../devicetree/bindings/gpio/sgpio-aspeed.txt      |   5 +-
 drivers/gpio/gpio-amd-fch.c                        |   2 +-
 drivers/gpio/gpio-aspeed-sgpio.c                   | 134 +++++++++++++--------
 drivers/gpio/gpio-aspeed.c                         |   4 +-
 drivers/gpio/gpio-mockup.c                         |   2 +
 drivers/gpio/gpio-omap.c                           |   4 +-
 drivers/gpio/gpio-pca953x.c                        |   7 +-
 drivers/gpio/gpio-siox.c                           |   1 +
 drivers/gpio/gpio-sprd.c                           |   3 +
 drivers/gpio/gpio-tc3589x.c                        |   2 +-
 drivers/gpio/gpiolib-cdev.c                        |  34 +++++-
 11 files changed, 138 insertions(+), 60 deletions(-)
