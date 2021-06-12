Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 515F13A4E20
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Jun 2021 12:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbhFLKKt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Jun 2021 06:10:49 -0400
Received: from mail-lj1-f181.google.com ([209.85.208.181]:40601 "EHLO
        mail-lj1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230459AbhFLKKt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Jun 2021 06:10:49 -0400
Received: by mail-lj1-f181.google.com with SMTP id x14so12991730ljp.7
        for <linux-gpio@vger.kernel.org>; Sat, 12 Jun 2021 03:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=Xzl0iIqqeVxdj8MT95qxMkUrSglWIpxCiubBWZn4sUs=;
        b=pF95mHwsP1/dELqKc7OBQM9sZhYpwkPWk0+8lm0Pv7me3GAiBngRnwXWlnJX7vLfK2
         jw9tdFLX9R1rMdzOUGJQ7ZZR2Sa6fYkwuk2lzW/khYNeuBhDyqSuhMpP3s//zaatpO0G
         MV6d2gIKSdK0OjJfuVzQulWkgzI1wlZnzUFGIQ/hh36Qkm9IaCkkcmib2fGNrf9m5H+8
         VSfxo+SqeySGdoeAN9qlfNhDO2SPMBgz0CL5sBuK7S2wq8gy29mMLA9z+JQiwlLzFzcK
         q1l4+MzxfPnrmmz1d6kSPRQpEGmP5uj6YHibceBbVHY3AumEXYcYCwnre9+YJYoxje9R
         OMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Xzl0iIqqeVxdj8MT95qxMkUrSglWIpxCiubBWZn4sUs=;
        b=hLUN7d/zUa2P4D7ZlJcowVOwlA8FiETB5KDhl1o/i2X/l2nYIZDT0cG2rCUC6j/eV8
         m/ID0vS4QPCMjPWIZ4t/1ReZwiBPTPTBOuZziJdiSIYB8yCFvuX2YD1Iby4VLTwYk3ir
         UG7luG4/A4PBPanpjWLaoBjYyPiWo4InsIFm2yCz5ZdZjGZK36cn1KxKEW1sMMPhYo07
         uGkFBEEvStMfGwwL3ZaKUQA0PkQlS3mwUi5e2T2Mntyq1pj1Ur3ichenM283naV+cqI+
         Ti5I/aW1q2EXqAPrSmuBBlJukq4/xN29QbaYXIMgqWSyNW0yRmq4JQmeX5Okzofvfqoi
         Yp4w==
X-Gm-Message-State: AOAM531nrKI2ziEKg6JaWETn5jUYrDDZWsuUpcK9kKMZ9rUw4076PqcH
        q2rm49J29dEbiBj6m+yJcveAsiUY+hRPhNJPGsKVBA==
X-Google-Smtp-Source: ABdhPJxSQaXzFjbnJtYx0gFYGwk3l4wr1W6+r3EV6lhLPM67i/WPSiPi4sj5QBIZfVmyfj76I6UkPq9Qs2ozj9sYds4=
X-Received: by 2002:a2e:22c3:: with SMTP id i186mr6321985lji.273.1623492456686;
 Sat, 12 Jun 2021 03:07:36 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Jun 2021 12:07:25 +0200
Message-ID: <CACRpkdY+DKx-c+74b2xiGQ2H9+e2yeup+HEqg1+u1nvQoO6pXA@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v5.13
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

these are some pin control fixes for v5.13, not much to
go around but some small driver fixes only. Details in the
signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/pinctrl-v5.13-2

for you to fetch changes up to 30e9857a134905ac0d03ca244b615cc3ff0a076e:

  pinctrl: qcom: Make it possible to select SC8180x TLMM (2021-06-09
13:15:20 +0200)

----------------------------------------------------------------
Pin control fixes for the v5.13 series:

- Fix some documentation warnings for Allwinner
- Fix duplicated GPIO groups on Qualcomm SDX55
- Fix a double enablement bug in the Ralink driver
- Fix the Qualcomm SC8180x Kconfig so the driver can
  be selected.

----------------------------------------------------------------
Bjorn Andersson (1):
      pinctrl: qcom: Make it possible to select SC8180x TLMM

Manivannan Sadhasivam (1):
      pinctrl: qcom: Fix duplication in gpio_groups

Sergio Paracuellos (1):
      pinctrl: ralink: rt2880: avoid to error in calls is pin is already enabled

Souptick Joarder (1):
      pinctrl: aspeed: Fix minor documentation error

 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c |  4 ++--
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c |  4 ++--
 drivers/pinctrl/aspeed/pinctrl-aspeed.c    |  3 ++-
 drivers/pinctrl/aspeed/pinmux-aspeed.c     |  3 ++-
 drivers/pinctrl/qcom/Kconfig               |  2 +-
 drivers/pinctrl/qcom/pinctrl-sdx55.c       | 18 +++++++++---------
 drivers/pinctrl/ralink/pinctrl-rt2880.c    |  2 +-
 7 files changed, 19 insertions(+), 17 deletions(-)
