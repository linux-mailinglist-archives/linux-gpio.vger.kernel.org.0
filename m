Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87630B0A4E
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 10:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730166AbfILI3K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 04:29:10 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45347 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730049AbfILI3K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Sep 2019 04:29:10 -0400
Received: by mail-lj1-f193.google.com with SMTP id q64so12213403ljb.12
        for <linux-gpio@vger.kernel.org>; Thu, 12 Sep 2019 01:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=AWT+r6/NgVobzeH1u98/3A5yGwSecklVJ9rqaQzylB0=;
        b=m/JOEZTjFPzWHbSmnr5nr/Tdgu6cFmzrYLIQjyCa8sXFWKn83drTTd91g4MK0HMczx
         EvdRww1VzMqHz/p7Edx5K68PlE+PVc0zjg+Zv3xjzcgIcnvB6dse9FWjUe65gHNQ5ijr
         EyaMfYC9QxuPnjjawE+EJrQMn+3n6H6qiyvli3aL7caP+QsYDBGaj+0nAUYA00YwsPNC
         Vuho4SzqP7gYxBshamH3wbEZ9iVSQSf85AOi68fbcH+xtZvuf6SvjqjFJCJ1OufRVlNR
         rFDT0EYKdP3Em06q/O1d+bF2DE4doCj94737U4FTZnNhBhBIer+FKhx02qkLDLl51qcQ
         RZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=AWT+r6/NgVobzeH1u98/3A5yGwSecklVJ9rqaQzylB0=;
        b=b6BzEwLEqw59EpKqcF9wHfPcgA4dBnuzSIEwnEWEKR/y7POzA1hXW0V+yKZMkVXwkd
         YF5msNGJbLQxL9Dlsz+UoqfIHyrW3T6U77GpzBV/SlUQyg8XfVsZ/pQdu+ROJEuW8ytz
         KLK+1cb9Ni082AJoJ+0BLit42WsVB9FJvV4dxQQY7hYTRUq/OxyA87JXx9iv6TmJKcgr
         lTPso8HTHaCcJdy8lHZabVpCF4x5tdDZV3DWqfIry9j2ep5LlCNzFz2w26qZoyWWDoOe
         ww3fuG/wv3rpvJABg1AyjxjK2pOfV1ZFelDQOQ8fNnFe2Yg1ge1hjIIqgF/9Mq+i7lAT
         3dkg==
X-Gm-Message-State: APjAAAUgfl/yEhDgXiDGnvuMc23lvSJWWrt3P2TMSfTjfm+7jzMjfsLO
        2SUr1RY6iv3fRMcTnVXkQFL+GFRXiM0I+GcrKT4/oQ==
X-Google-Smtp-Source: APXvYqwAI869nyytO0eJsd4fc6BSdITrx5GuQ64geJL29p/gUUY6gSER0UCDyqE6Bdh0ZZgyOvEhIFWATYfZ660KXQI=
X-Received: by 2002:a2e:8056:: with SMTP id p22mr20686035ljg.69.1568276948342;
 Thu, 12 Sep 2019 01:29:08 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Sep 2019 09:28:57 +0100
Message-ID: <CACRpkdaF8PNXBR2+d7OBWmR7wqRy=iP3OOCJDAFV0rf_e5PaZQ@mail.gmail.com>
Subject: [GIT PULL] last pin control fix for v5.3
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here is a hopefully last pin control fix for the Aspeed.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit d45331b00ddb179e291766617259261c112db872:

  Linux 5.3-rc4 (2019-08-11 13:26:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.3-3

for you to fetch changes up to c1432423a16825ef94e019808ed7330ee33ffc69:

  pinctrl: aspeed: Fix spurious mux failures on the AST2500
(2019-09-12 00:08:27 +0100)

----------------------------------------------------------------
Pin control fixes for v5.3:
- A single patch for some Aspeed problems. The BMCs are much
  happier now.

----------------------------------------------------------------
Andrew Jeffery (1):
      pinctrl: aspeed: Fix spurious mux failures on the AST2500

 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 30 +++++++++++++++++++++++++++++-
 drivers/pinctrl/aspeed/pinmux-aspeed.c     |  7 +++++--
 drivers/pinctrl/aspeed/pinmux-aspeed.h     |  7 ++++---
 3 files changed, 38 insertions(+), 6 deletions(-)
