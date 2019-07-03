Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4805E3FE
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 14:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbfGCMbF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jul 2019 08:31:05 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39699 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbfGCMbF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jul 2019 08:31:05 -0400
Received: by mail-lj1-f195.google.com with SMTP id v18so2211658ljh.6
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jul 2019 05:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=OKyfJtOIrTtrcXiKdrFl82qYRA8oFsDa8OFy//DbwT0=;
        b=vL5qa2AxRk4yNCXYnY2hu3ejEhwEeBXf5U+CTeE+UjFgLrNxFHJ/Z1X6Sj3e7rNnoI
         qb8N7frPLoHAeTW8dgTnS53LdHmHGE9TXRvsGTL0BA/iVqOfIBDwBr2c1owuul1YVOM/
         QKxADvn+5/zOW3olQFu3ygQHl+ekZ8eoqxCRDVGh7Pf1YCSb626YKl4tvtv/oP7howJa
         k2ZkIbcOz4cnBmIfC66vVZkCIzHMSXDQiaWJuIXhkBKg448jomsePGpfR9MDEYH15gp1
         bPfOAi+z2klXIfjzPK2CPYwvcd4nTsG9Sb8JAKejYqijK7wrp9dDSkNDY1hNcevvEKMA
         0TSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=OKyfJtOIrTtrcXiKdrFl82qYRA8oFsDa8OFy//DbwT0=;
        b=ViKqMaG6Jo6+nwTAiYz042yTdaEwbXrKnP1Kpk9qaKCtlYjibq8c0DLTxqP9EGrX8x
         tHL0TF5S8PZitBuTcpJYRokSqGSryR22xYClRQ5TC126EdPRiP12nsgj2kN+VsmEbDIn
         GUvs6+07xkWeD65bvhO2Lr96Zp42aVNIA2pMwlth0p+WaM9flAfP9zrvZZVsZSh77sRE
         ja35qRm3Dt7qqWkscuqRgmKrK13hlsa7YqtEfdzJjq1dVu1iXEEap51ykv5n56//mYZc
         WMESq51lHI9XAzEVNYgtFTxw2wikEHexZaUqbMA0JK2p3LZGMclDc28sQzv1PMsu6fck
         TBdg==
X-Gm-Message-State: APjAAAUv6FiF4s4s/rr0iPYlY99kfPESAN79SHXAo5BDljvhiXhF3wd6
        UJ4je0keRZjqfj9lLIjY+nUJX50dV9/I4mI3aQ20l8USu1c=
X-Google-Smtp-Source: APXvYqz16tXQY7gwwzYAJQ0Io8yONIUhwBcxtZ1TJNjprFJvqYdxFLlUGbX00ke1r99DpVN20uQQMLx0vwcqJuRhSmI=
X-Received: by 2002:a2e:650a:: with SMTP id z10mr21044108ljb.28.1562157062976;
 Wed, 03 Jul 2019 05:31:02 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Jul 2019 14:30:51 +0200
Message-ID: <CACRpkdZBhUF7C_+vPc6tkasBk5DAGh01g3eu8OYQ16QBehUZWw@mail.gmail.com>
Subject: [GIT PULL] GPIO fix for v5.2
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

last minute regressions galore. Here is a fixup for an
issue I found monday when testing unrelated patches.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 4b972a01a7da614b4796475f933094751a295a2f:

  Linux 5.2-rc6 (2019-06-22 16:01:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.2-4

for you to fetch changes up to fbbf145a0e0a0177e089c52275fbfa55763e7d1d:

  gpio/spi: Fix spi-gpio regression on active high CS (2019-07-02
22:31:37 +0200)

----------------------------------------------------------------
A single fixup for the SPI CS gpios that regressed
in the current kernel cycle.

----------------------------------------------------------------
Linus Walleij (1):
      gpio/spi: Fix spi-gpio regression on active high CS

 drivers/gpio/gpiolib-of.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)
