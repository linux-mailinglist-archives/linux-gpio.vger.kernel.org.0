Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 279E09C054
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2019 23:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727879AbfHXVSJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Aug 2019 17:18:09 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46311 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727823AbfHXVSI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Aug 2019 17:18:08 -0400
Received: by mail-lf1-f65.google.com with SMTP id n19so9527154lfe.13
        for <linux-gpio@vger.kernel.org>; Sat, 24 Aug 2019 14:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=buG8rS1mJF0qAnzC4CPBok3txDbgd1yDUZD/dbaM0ZI=;
        b=BE85dBJbTx/kCV/K61eeXdfzfnJ2mys1pqTCzNLN+29ZHQOyNl4I0MC0JtYtksN+3/
         ThtcLUKmJQRpyc+FwTr/Xs7fOvgEwJrDE/O9EvdkhQoVPENqR2+P6dBQAyzfvnhdiQ5h
         aY1OBBncu7vycqpujXGWqpvbtcr4L5vCSuvcNu+X+a/KDIDDkoz/iyWyUnl64/ulJ7/i
         Sh1ZO7XNNbGhgltOWHB5Mhaw5U5fHU1foQY12xa2gvnlySrqB6YITMnNQgEMHndh+jH6
         gY/ZaCu3wvWUE0/wwCAs3IBaMO4l1eWkftuXLIDGNZCaHTBSetOwtlhu0vLIA4ljEvth
         JpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=buG8rS1mJF0qAnzC4CPBok3txDbgd1yDUZD/dbaM0ZI=;
        b=l3FaGo3NNtIO7eJR6jDyPRv0yEY+KpOK6iIBIk+oP5BPVKNzleKeHbTJ6yNqiseqqX
         HmZW1MbT7yNY2DgaBKySV6pds2jhI2Ld07F899ezh3hXz5rzUC2XX7bquoPaYK1Howrw
         y59BKDYsSnGXENyuCCdi8iN/ER4+6AC1rRCo+7QqypNllGEPNUbdyjw3U9iNeiI+3jK5
         LGGWzqXzH0b/eT4QVT+QerHWzuyONpKBXSePE0N3twub6/aK0fhU3eBduH1rBKlbxGhP
         aaxlfQIwB3PFXU+YLugZ8MtSogeIHh3q0ZPRLRSsLaziV3Sz4OfhF+J6DK3UuDEX2jIZ
         JCrA==
X-Gm-Message-State: APjAAAVfpebb/LsMrRB/0v2ExXscLPVKiH+OnIKahKIErloJojDpm8lt
        V/tr7cA68aFWVuDSuJeqYst3EQJxjmB2FPC5JDZySvIw5C5LHw==
X-Google-Smtp-Source: APXvYqytYBob1ysBJFACFwD27yhpXuh79le74ImOIBK9fnFXYOfsrqZBUWF/nbQVDk6NXB+PhLckDQnRms6L+zoHv0A=
X-Received: by 2002:ac2:5939:: with SMTP id v25mr6513387lfi.115.1566681486625;
 Sat, 24 Aug 2019 14:18:06 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 24 Aug 2019 23:17:54 +0200
Message-ID: <CACRpkdaWR9GZ0Hem4h-jdGcYc_Uwx29XvsHuEgvXiebRG6DCwA@mail.gmail.com>
Subject: [GIT PULL] GPIO fixes for v5.3
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here is a (hopefully last) set of GPIO fixes for the v5.3 kernel
cycle. Two are pretty core.

Please pull them in! Details in the signed tag.

Yours,
Linus Walleij

The following changes since commit d45331b00ddb179e291766617259261c112db872:

  Linux 5.3-rc4 (2019-08-11 13:26:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.3-4

for you to fetch changes up to 48057ed1840fde9239b1e000bea1a0a1f07c5e99:

  gpio: Fix irqchip initialization order (2019-08-23 11:00:43 +0200)

----------------------------------------------------------------
GPIO fixes for the v5.3 kernel:

- Fix not reporting open drain/source lines to userspace as "input"
- Fix a minor build error found in randconfigs
- Fix a chip select quirk on the Freescale SPI
- Fix the irqchip initialization semantic order to reflect what
  it was using the old API

----------------------------------------------------------------
Andreas Kemnade (1):
      gpio: of: fix Freescale SPI CS quirk handling

Bartosz Golaszewski (1):
      gpiolib: never report open-drain/source lines as 'input' to user-space

Linus Walleij (1):
      gpio: Fix irqchip initialization order

YueHaibing (1):
      gpio: Fix build error of function redefinition

 drivers/gpio/gpiolib-of.c |  2 +-
 drivers/gpio/gpiolib.c    | 36 +++++++++++++++++++-----------------
 include/linux/gpio.h      | 24 ------------------------
 3 files changed, 20 insertions(+), 42 deletions(-)
