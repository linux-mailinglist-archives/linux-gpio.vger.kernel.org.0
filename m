Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2021B88A2B
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Aug 2019 11:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725858AbfHJJBO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Aug 2019 05:01:14 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43680 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbfHJJBO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Aug 2019 05:01:14 -0400
Received: by mail-lj1-f195.google.com with SMTP id h15so514706ljg.10
        for <linux-gpio@vger.kernel.org>; Sat, 10 Aug 2019 02:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=oD/Q6G/6W7nTlypRrPNMZQgnb5/E1uytnbBR5dQIk4Q=;
        b=J4fnE0Lcep5KmTR/bSIzJSIUS/cLyiUz2x4KsdUfRK5dB/gjcfCfslOEfBcLw52rgs
         EMviEh1o+yJISGq8uMDk7CV/aA94Xc8NFKmZvsT04xbm7Sv1egPq8EkG8Y+2LLnk1WIp
         IrB/TgtySjNylZf3B+oeGGmCRQ5VJUeeCWEvcwQRkDF/M4UYAzaIyntpdKQgV9cmmOJa
         naPD8MS/fUk0c1RBADmraZ/2TGk45RNDcWb63BjppByRH/TKd1nI3hWIfmdgI9rvv+03
         g+pQxjpAki6ZqDOXULCRgqNYJCi7TMJX7BWhbfllYt1/OR5QjmgVM4VfingW/CpkN85a
         fK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=oD/Q6G/6W7nTlypRrPNMZQgnb5/E1uytnbBR5dQIk4Q=;
        b=Gkbg/T33/l91xdXu6U0xTe0c0jzA3/aGDSoBW7jArqq5FsCFDo1F4vaWR8LMsSMr/Y
         BFem3BU7yJSz8KW4E4r12LpxM9NZyeFF+HkbgX+xGATS4QlmenoXZab1Sr2OWI4kMxjW
         zf+gm2GQu9bBqUE/aI4gHEIHeOBa7bKhT67EJsDJE50sdG7X6Y1/M+bIHw14NQQfhXOg
         PqJviMAvR6TO47sdoN3O0XPp/9lNUG1RieX6BNjXnZf/Xhrf3augtN7uJq37nYv7qduz
         IdhVtI5ASWCGio/owFMfW1ft74DaDfkRZVZJaO+fkdT+vT0mBo03b/Bpw5r4OtoG7OCX
         Qnwg==
X-Gm-Message-State: APjAAAU41g3HWK36vAZRm88v9NzmwJGJzoAXHyy6U8H2+D2dSZ1lj2eg
        mzgv6qy3UgaF3bpSgZkZwNRaIIXdna1yUV82CNza/A==
X-Google-Smtp-Source: APXvYqzAONLPdh4o+NouNG/QFJxb4T9bH5J8zHJQGa7JZySBNXe2HJoRmhj4JGiLvN+pM/qj2zTkv397Dbnvlxzplg4=
X-Received: by 2002:a2e:9048:: with SMTP id n8mr13725271ljg.37.1565427672367;
 Sat, 10 Aug 2019 02:01:12 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 10 Aug 2019 11:01:00 +0200
Message-ID: <CACRpkdaMp16=-NGxOhe_Gz-vvoZrN7S+CE6zVmD+erVU051kmQ@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v5.3
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        YueHaibing <yuehaibing@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here are some pin control fixes for the v5.3 development.

I should have sent earlier, vacation interfered. Thus there
is a syntax fix I would normally not put in as fix at this point in
this set, but I think it is no big deal.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.3-2

for you to fetch changes up to 8c4407de3be44c2a0ec3e316cd3e4a711bc2aaba:

  pinctrl: aspeed: Make aspeed_pinmux_ips static (2019-07-29 23:35:31 +0200)

----------------------------------------------------------------
Some pin control fixes for the v5.4 series:

- Delay acquisition of regmaps in the Aspeed G5 driver.

- Make a symbol static to reduce compiler noise.

----------------------------------------------------------------
Andrew Jeffery (1):
      pinctrl: aspeed-g5: Delay acquisition of regmaps

YueHaibing (1):
      pinctrl: aspeed: Make aspeed_pinmux_ips static

 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c |  2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 92 +++++++++++++++++++++---------
 drivers/pinctrl/aspeed/pinctrl-aspeed.c    | 12 ++--
 drivers/pinctrl/aspeed/pinmux-aspeed.c     |  2 +-
 drivers/pinctrl/aspeed/pinmux-aspeed.h     |  5 +-
 5 files changed, 75 insertions(+), 38 deletions(-)
