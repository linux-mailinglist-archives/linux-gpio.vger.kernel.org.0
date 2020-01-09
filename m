Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D11DD1362D2
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2020 22:51:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725829AbgAIVvS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jan 2020 16:51:18 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35669 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbgAIVvR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jan 2020 16:51:17 -0500
Received: by mail-lf1-f68.google.com with SMTP id 15so6379298lfr.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jan 2020 13:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=pSJuCv0q0/z1FIFOdOKkUBldJYopo2x6Df2DsyN6P7E=;
        b=ieR+qxqTsANxu9KU5tWvLhl0Mvyhhs134onZh4oxgiuiYnDaI00xsh7R4b8zmrZO7C
         8ISLUpepGZmuHi71A542ASURhzsBRrjZWenRDQuFFx3ZcZfnuv2LQVb8KHEi4NZprJcp
         2iEAW2ufL+CvgdswRTShu6qWP3kYnkIIZh4PTCpIWvMqc7ga4peCC1RcAHSAc7di1Dh0
         MPIe4QLEIs29g9aSugBTsYe2rC3mc/koptJ6bZMKayeriQ6mROz2r5XbkBEJ0JcpZysp
         bdGhnwr9KjVEbLGvdNWPbh3uhrKOZOlRRVYXl3vevQ31CwpbpAZKEbyfVKL9iW9N4abT
         J8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=pSJuCv0q0/z1FIFOdOKkUBldJYopo2x6Df2DsyN6P7E=;
        b=CDtCOlyqqzlXEgO/fUOiRw6bfPE0m1hrLqP5+is+0LtKnENxAWfKdlY6o2idJGj87i
         RFPayRnmQvQShoRsDRTHMrw0V1fhP8sUv/BxSkmja5cufXqjaKkIzbauIq5YebhVUt7Y
         E6bW/CyBlwgWaF7b9tqCMmwJn/1Zty4pK7LedDgqCuwAqaC2+/f9V63kpibqbIytGr8J
         wVT32tbxcw38SioXlpIIQExrcnyVHVZcfpdBkWz0jpOZjvDK8bd26BGuJVd8Lonqp0KF
         DnjkpP4ZRdLXkbv4dySdgzFMpfMUbdYdiQt8lSs9QHtQG1B3PpH81/D8AAZXGAUS4q6v
         eYkQ==
X-Gm-Message-State: APjAAAWRSSzlLEAPHr2wacsZPxfrHyYwJEb56jOCeA/eb1o+ZS2w70vk
        zCeTsUJnnTLu+8/p00OTm4IpgIfnQnSVxFNs0Aj0ag==
X-Google-Smtp-Source: APXvYqww+xa/shqmj3ALY2JAcM4t2Oi9yfUMtjGqluc3+ah50x+EtFXlht3Em5G6Av0vEY0z2OhZ80T5Hgfzp+ShcR4=
X-Received: by 2002:ac2:5c4b:: with SMTP id s11mr7373029lfp.133.1578606675739;
 Thu, 09 Jan 2020 13:51:15 -0800 (PST)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Jan 2020 22:51:04 +0100
Message-ID: <CACRpkdbR2Ssr1WWfS2HZ-jd6XFgEvEsqrjVAcgPsR8RerE-xfQ@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v5.5
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Qianggui Song <qianggui.song@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

some two fixes for pin control, not much to say about
it, it's just regular driver fixes.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit fd6988496e79a6a4bdb514a4655d2920209eb85d:

  Linux 5.5-rc4 (2019-12-29 15:29:16 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.5-4

for you to fetch changes up to 35c60be220572de7d6605c4318f640d133982040:

  pinctrl: meson: Fix wrong shift value when get drive-strength
(2020-01-07 11:21:07 +0100)

----------------------------------------------------------------
Pin control fixes for the v5.5 kernel cycle:

- Fix erroneous shift in the Meson driver

- Make Lochnagar select the GPIOLIB Kconfig symbol

----------------------------------------------------------------
Arnd Bergmann (1):
      pinctrl: lochnagar: select GPIOLIB

Qianggui Song (1):
      pinctrl: meson: Fix wrong shift value when get drive-strength

 drivers/pinctrl/cirrus/Kconfig        | 1 +
 drivers/pinctrl/meson/pinctrl-meson.c | 1 +
 2 files changed, 2 insertions(+)
