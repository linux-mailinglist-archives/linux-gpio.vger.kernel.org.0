Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C59D5597A5
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2019 11:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbfF1Jf7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jun 2019 05:35:59 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41962 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726681AbfF1Jf7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jun 2019 05:35:59 -0400
Received: by mail-lj1-f194.google.com with SMTP id 205so5302248ljj.8
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2019 02:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=gm81eQXirqjQ8ir5W1mh/MO4CE2jStCNfLLn6pKP+mE=;
        b=Me3TL758RRm+ZooMTytttUvmF+hc1jb8D/jfkVz9b19dkkWHYgqnW/mBLcgiA7cYZS
         zuuhJ0sMQCj72GTTK24NETz6bIwj26Rc8pCfxLv2x2AohpOZPbmyP6mOlpZ6YWBEmily
         DkS6bSFQQRVKcNGEC6fRJrTSKvftsC1zCyWjQ9ftXCLA8c2EDkLitxNMHKZ1fHgab2lE
         HE72Zcqo9zWv6tU1LFarRIsNHQ8rumMUh61EDaioegjaLOuc9HKiU04ZWkD1G73vO8lf
         n+0ITHbfacSkxycFTRUgAZY0h78QHmguLFgMvurVVFSlCWhqA6+Ghrf2fqFTbojmrVw0
         2PZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=gm81eQXirqjQ8ir5W1mh/MO4CE2jStCNfLLn6pKP+mE=;
        b=cGmpp3ZiIcvjM6LogGFVOyv/g2yJeo8zqVBik0CCqzrNuDh3lcXajD1NyvaFOyuV3B
         4N6anRwADMR0GzWDjZbRCOaIoUv3A2Za48aJG0KH9Fwn6dP02+j+gqoTc15ppn/mDnvG
         od/4DxbaKR1tNQVK6/QnA2NAgO4Ck3sOcyUd+J/u8JSxN/X2pFJgcgdjGbSxfipL6nIf
         8Aya0KAW4D1pkIUij7mNHdvYSmauo1XdoIYfmWnqXRRXsZP+7k3llLtDzpFImqM9WBxV
         pxdgb1TRY1Isf0fArKnS0gMyCAxbnP1e19RBCLn3M49C3w7H+8zyIXe3YnCZM+BO3E/a
         GgBA==
X-Gm-Message-State: APjAAAVbuqk8sQ1nZrzTK2+p2A7OVfYjjVX9SHkGG0eQDkM+N+cboGIL
        rDU7zd2qzCzw0z3UHC5zSHwottOEmFhkxwVya4uq4w==
X-Google-Smtp-Source: APXvYqyCRplnbdfueknv2w+rIqQfd/hR36KbMNU3YvRG5O2rZ8mWhRYuIhtOKpoEiLQn/QiwaIWlheLq5Fd/Jb/KPHQ=
X-Received: by 2002:a2e:8756:: with SMTP id q22mr5727021ljj.108.1561714556904;
 Fri, 28 Jun 2019 02:35:56 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Jun 2019 10:35:45 +0100
Message-ID: <CACRpkdaiMrQyaxrLhy=Az5SCoz_C3NWRSYiQFqr=_BsD+qugMQ@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v5.2
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Phil Reid <preid@electromag.com.au>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nicolas Boichat <drinkcat@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

sorry to bomb in fixes this late. Maybe I can comfort you
by saying it is only driver fixes, and mostly IRQ handling
which is something GPIO and pin control drivers never get
right. You think it works and then it doesn't.

It also took some time because we smoked out commit
message syntax issues in linux-next.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit f2c7c76c5d0a443053e94adb9f0918fa2fb85c3a:

  Linux 5.2-rc3 (2019-06-02 13:55:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.2-3

for you to fetch changes up to 9d957a959bc8c3dfe37572ac8e99affb5a885965:

  pinctrl: mediatek: Update cur_mask in mask/mask ops (2019-06-27
12:22:11 +0100)

----------------------------------------------------------------
Pin control fixes for the v5.2 cycle:
- Fix IRQ setup in the MCP23s08.
- Fix pin setup on pins > 31 in the Ocelot driver.
- Fix IRQs in the Mediatek driver.

----------------------------------------------------------------
Alexandre Belloni (2):
      pinctrl: ocelot: fix gpio direction for pins after 31
      pinctrl: ocelot: fix pinmuxing for pins after 31

Nicolas Boichat (2):
      pinctrl: mediatek: Ignore interrupts that are wake only during resume
      pinctrl: mediatek: Update cur_mask in mask/mask ops

Phil Reid (1):
      pinctrl: mcp23s08: Fix add_data and irqchip_add_nested call order

 drivers/pinctrl/mediatek/mtk-eint.c | 34 +++++++++++++++++++---------------
 drivers/pinctrl/pinctrl-mcp23s08.c  |  8 ++++----
 drivers/pinctrl/pinctrl-ocelot.c    | 18 ++++++++++--------
 3 files changed, 33 insertions(+), 27 deletions(-)
