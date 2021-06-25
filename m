Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4608D3B4AF3
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jun 2021 01:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbhFYXgi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Jun 2021 19:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbhFYXgi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Jun 2021 19:36:38 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72D09C061766
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jun 2021 16:34:14 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id d25so14730944lji.7
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jun 2021 16:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=nbwN286/f2tgx7HnIyRwNiSzfszBKdsaXIOOZleXegQ=;
        b=COTO6xK6XXzLj7QCuClwaJRAPiK+9eCHV3HNL+Y/ld2D3Xd90IgfXqbGgcrtNT+rsJ
         rkAIzNNivnFrLIXiydzLgrU/h86zq0d3C8XeMW2xwTrG26BUCfvPtLPlw2xmRuhwZslq
         Bjvy5/bUip9gjz2NDuU7EBpBoF0R3+mRdz2MKs/g3GK7zkhLZ1f0ayS9jQdyas2I8lMs
         WvudoOTIZ1UQLuRtBOJktFORJlW9emVliYMLHmjNPbq27/CxzIOFz6JMY8x1jbRieMkf
         eK8y1jsHyxLI7Qq8P/4agetfSATt+W+s21Vo313vskFd6FlSMSAiNdEaeP9NEdnmd0YO
         S59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=nbwN286/f2tgx7HnIyRwNiSzfszBKdsaXIOOZleXegQ=;
        b=bAglG7OEu+mhr08gfBPA0pDhG/niFQuqGD33IryyoU0QjS67vt3VBt9sgiQEsCBLd1
         BgvkIbBkZuJ1iY750yX7T5NAEN074rW4LtAKlLwfornmKBiyF+c5kCEHCilJl07s/V33
         OmqVAGDtJw3ZLXlLL2E9GpUFg7iCDFKQz+angODx9B/3zrSEFQRg7ExEZtcn14vqqk/s
         S1x3kStNobuvmBj8/3+AqkXgMWATMzMvMqKoV69Jl/ASdW6eNc9bAyTRLYlm0igtflPB
         9wJfWivbVN8M2+zWDKexnh8xRwXuwheHwN7oF2S3k2lPN+HPA2GL0aJY9zMvLquE8irO
         ASyA==
X-Gm-Message-State: AOAM533x1SEpRHRr1pagnbvGcIsbXGJPSo2Y1qHqUR/qC5hTmNEcj808
        6wdhyjtKQPHf2pmIRRWKi7Tmo3LQ+EtIWw83h3Kh9c3Wx1+09w==
X-Google-Smtp-Source: ABdhPJxcM7kT2apTAfxoGcZV8wqZQjXu4w+udp8r9dPXO/OseyIYAyQI7Ri4AMx8mrA3H0WE27jDQtxukgjXXcy+uKc=
X-Received: by 2002:a2e:9003:: with SMTP id h3mr10034672ljg.467.1624664052021;
 Fri, 25 Jun 2021 16:34:12 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 26 Jun 2021 01:34:01 +0200
Message-ID: <CACRpkdaVqdFPKTxOuhFt=auFYjxCivRmRz7mQ7ank6rbcVQsQw@mail.gmail.com>
Subject: [GIT PULL] Last pin control fixes for v5.13
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

some last minute pin control fixes. A bit late because
I have some vacation and midsommar. Two driver fixes,
details in the signed tag.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit 009c9aa5be652675a06d5211e1640e02bbb1c33d:

  Linux 5.13-rc6 (2021-06-13 14:43:10 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.13-3

for you to fetch changes up to 67e2996f72c71ebe4ac2fcbcf77e54479bb7aa11:

  pinctrl: stm32: fix the reported number of GPIO lines per bank
(2021-06-18 14:56:54 +0200)

----------------------------------------------------------------
Two fixes in the last minute:

- Put an fwnode in the errorpath in the SGPIO driver

- Fix the number of GPIO lines per bank in the STM32 driver

----------------------------------------------------------------
Andy Shevchenko (1):
      pinctrl: microchip-sgpio: Put fwnode in error case during ->probe()

Fabien Dessenne (1):
      pinctrl: stm32: fix the reported number of GPIO lines per bank

 drivers/pinctrl/pinctrl-microchip-sgpio.c | 4 +++-
 drivers/pinctrl/stm32/pinctrl-stm32.c     | 9 +++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)
