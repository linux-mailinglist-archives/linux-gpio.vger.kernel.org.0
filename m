Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E46621B9B0
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2020 17:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgGJPku (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jul 2020 11:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbgGJPkt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jul 2020 11:40:49 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28C31C08C5CE
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2020 08:40:49 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id y13so3455708lfe.9
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2020 08:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=p4c4RaUrI+TqMaMS0f5jfDieCGnmujxFfWD54tCErWQ=;
        b=OpyS5KUSNYXSIZIrtYSYeQlgu/tLNtvlojblx8984l8e5WEC2dkHJocvGoITQHbUKq
         +BPjXsxelcYuKnCn5xoP1A6xLkWC5lsZEsz5BCMD++lE1is5BHxIhV12k6VyxQNZjjYz
         xkBN8CE5hUkcFODrgFTBdempmHI+eJljIybsYgPseGnqcGA7vVY20jsV8xwPmsz55KOp
         n8Db9TddbsaN9V/Jjay5Jt+vlv3S61n1rvHAJjeEd6/bAjGoBqLt6Tu09Jteb5vvhntM
         rYUqAfTddI2UFmWuvOjPBDh8ty6IRPRmt0E+HNnO5JxgC8wwXN956DRiMB9M3uTu3irp
         stjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=p4c4RaUrI+TqMaMS0f5jfDieCGnmujxFfWD54tCErWQ=;
        b=hzJ1/YcacKvq715MzcdDRyoqAUr6HSZcIG3Wh447/1gkFzxxEtvKaBoDYUgLncVgiv
         GBxSh6dJuB0r7Vt7OP3gfSH1vNYfveF8/ruv9dglH7xV9pGq+cZ6Ddc6q2oDdzC9nCZ3
         EeXz/ylgAYMz7R1pit7urUoY1mePfYWrw/okG/3B6P4mh10FRkQrgOfcC8fkBfiugTVB
         21FOY9BP6KwU4xT5TqdYIHyIvYoaKCO4FlcukGoXk7V+yLyHxJXzYfWnjjGXrsR+5nlu
         U+RBKh2fBTsiC4Ap4vByT3CtQxN7ZO5pmTTQtDE3GTBlUWVunY96y6r7tVUoKwoqGOyR
         h/ow==
X-Gm-Message-State: AOAM530GMhgMqYJmFG1rCcxDUcZxXi1x6zVrrwl8Lz4UPoCsypGjh5OK
        mYxg+Cfbxv0GSDP31jqhqiDN7VVCZuiO0CQphQ7y8AMBxCY=
X-Google-Smtp-Source: ABdhPJxBKln6OW5CUh+p8XVdWCrNFIlmaG0qW/jYrglDw2icgQ+C4/nwExMNw/bBptmH18VPUdtZsJCmxrVwZ2fSK1s=
X-Received: by 2002:a05:6512:3150:: with SMTP id s16mr32987083lfi.47.1594395647667;
 Fri, 10 Jul 2020 08:40:47 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 10 Jul 2020 17:40:37 +0200
Message-ID: <CACRpkda48QqW7P9wKghFTk6T9B74drHLSxjQSANgfEFxmgm=Dw@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for the v5.8 series
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here are some two pin control fixes for the v5.8
series.

Nothing special about them, please pull them in!

Yours,
Linus Walleij

The following changes since commit 48778464bb7d346b47157d21ffde2af6b2d39110:

  Linux 5.8-rc2 (2020-06-21 15:45:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.8-3

for you to fetch changes up to f8e99dde21995d185e2379e34ea2b96acf85702b:

  Merge tag 'intel-pinctrl-v5.8-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into fixes
(2020-06-28 01:08:21 +0200)

----------------------------------------------------------------
Pin control fixes for the v5.8 series:

- Fix an issue in the AMD driver for the UART0 group.

- Fix a glitch issue in the Baytrail pin controller.

----------------------------------------------------------------
Hans de Goede (1):
      pinctrl: baytrail: Fix pin being driven low for a while on
gpiod_get(..., GPIOD_OUT_HIGH)

Jacky Hu (1):
      pinctrl: amd: fix npins for uart0 in kerncz_groups

Linus Walleij (1):
      Merge tag 'intel-pinctrl-v5.8-2' of
git://git.kernel.org/.../pinctrl/intel into fixes

 drivers/pinctrl/intel/pinctrl-baytrail.c | 67 +++++++++++++++++++++++++-------
 drivers/pinctrl/pinctrl-amd.h            |  2 +-
 2 files changed, 54 insertions(+), 15 deletions(-)
