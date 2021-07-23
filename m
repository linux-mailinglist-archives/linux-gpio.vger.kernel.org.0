Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1253D386D
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 12:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbhGWJd7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 05:33:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbhGWJd7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 05:33:59 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6D5DC061575
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 03:14:31 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id h2so1243058lfu.4
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 03:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MxqY7w7f+1VSQok8W9ikea6rKSkGap4duEivpX9ylqo=;
        b=qXx6SNqvq4jZfq8ol3qK/dApha9//QuJgf1Y7SQYCTt5tLVv+E3ZbKqa7oyuwyqmZO
         xaEtQ6bIJrno49mQCAx/iCf2SXfBJOuuA5wHGoeGzTFmCxf0AdH0xaosr9ZHGoszFc/g
         Vleod1b0rTERq6/IKOcruhYdO9sds/WhCP9uxFtA1qLFxa3x2STna7QDZCKoo8/eZlOW
         paAMbAF82ANSzC+qbl/Rf+6EACCRaNh5svSfzPknaAtJ37hj+VmdudjMagYw6z5s6VWZ
         6F7Ej/+LURc4KX5rXLpzZh9XxU78dsFtgu0j6HTGCLyW3VIbvFIlGW3MZ6hfkpLDzsne
         DTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MxqY7w7f+1VSQok8W9ikea6rKSkGap4duEivpX9ylqo=;
        b=ukWCI2Nbw32UsIYDGmStpqBGEYkRGDzkvXYm1RdvZlbVM1BfcJ/dxPtYHNVQQPJHyL
         6wyKzUeuwbD/DXupkshk1k5xtE8Fo34xmbhzr4eP2Tz56F7feqB5NiUtM9D3o+ZKwpDu
         pHVfMBBx6518C5+p2QLKkg9g+CakyO5NYUPkSxPF1naUIEi8rQhyi3c2wYGhbuLt/nRW
         roSx32a7TB7jRkMd1LH6ArSaOXSLxJrPSW5Q1fLg6keq+Fr0KqldaNWiajB9lASxAX1j
         09WoAGSPgnmmF29OV4RQmBk2/wYERGwrMLd2r5FMA2U2zWfou7nhMmRoW2kxr/rcaYuT
         Uqgw==
X-Gm-Message-State: AOAM530f3ZFP4ta80z8lp/Kx2a36NWuSW91Df9ZssZanglvbcD1u98rF
        +WdgYMLeZ9VwgDvcnX3543YtnHK1ywk7hmWRVZY0/A==
X-Google-Smtp-Source: ABdhPJyxUxmZpQd0I35bRxQIZZMsx2c67ELGW46qkZb7g+BiJ7iOphkbM1uXQ/GLC7zBNgI4rDPgJVIMv8zsTvXxTeE=
X-Received: by 2002:a05:6512:2603:: with SMTP id bt3mr2592484lfb.529.1627035270327;
 Fri, 23 Jul 2021 03:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210618062449.1067106-1-jay.xu@rock-chips.com> <CACRpkdYGyy+tE4_xddJWxWUQpPea0bc5CUTBfp2RtnJfQ-2t_w@mail.gmail.com>
In-Reply-To: <CACRpkdYGyy+tE4_xddJWxWUQpPea0bc5CUTBfp2RtnJfQ-2t_w@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Jul 2021 12:14:19 +0200
Message-ID: <CACRpkdadb0=KD+ZXQGNVDUBDYHUsvP94dSgPzfwhUbwjvw_6Wg@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] gpio-rockchip driver
To:     Jianqun Xu <jay.xu@rock-chips.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kever Yang <kever.yang@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 23, 2021 at 12:07 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Jun 18, 2021 at 8:24 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:
>
> > Separate gpio driver from pinctrl driver, and support gpio v2 controller.
> >
> > Jianqun Xu (8):
> >   pinctrl/rockchip: always enable clock for gpio controller
> >   pinctrl/rockchip: separate struct rockchip_pin_bank to a head file
> >   pinctrl/rockchip: add pinctrl device to gpio bank struct
> >   gpio/rockchip: add driver for rockchip gpio
> >   gpio/rockchip: use struct rockchip_gpio_regs for gpio controller
> >   gpio/rockchip: support next version gpio controller
> >   gpio/rockchip: drop irq_gc_lock/irq_gc_unlock for irq set type
> >   pinctrl/rockchip: drop the gpio related codes
> >
> > Liang Chen (1):
> >   dt-bindings: gpio: change items restriction of clock for
> >     rockchip,gpio-bank
>
> I have applied the series to an immutable branch in the pinctrl tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-rockchip-split
> Then I pulled that into devel.
>
> Bartosz: if you want you can pull this into the GPIO tree as well
> (makes it possible to continue work on drivers/gpio/gpio-rockchip.c
> and avoids clashes in Kconfig and Makefile)

Oops I saw there is still discussion about some of the patches
and found a bug myself. Pulled this out again and deleted the
branch.

See you again in v7 :D

Yours,
Linus Walleij
