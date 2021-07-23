Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4716D3D3B65
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 15:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235127AbhGWNHM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 09:07:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233486AbhGWNHH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 09:07:07 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D052C061575
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 06:47:40 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id f26so2415441ybj.5
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 06:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AclrNr9DriONd9uxnMokdBW1rOGOgyBR/Fi4Kz2y6rY=;
        b=SaV31Lrli/1acnfLkCpI6k9LxZX/0RCIysvoX6qtwA8lSWc1/nbOJ84tgsW/H6qKQY
         N37UjrVL4Z2a/aSoykdxaHZTsI4aEcAVBE1JkDwkphBFEPJFtwEYJA03ZEXjJAxxbISp
         SNVde+TuZexYyp5BgXi5VRs3zfmC15bGC/y2i1iQakMFrhyBrL/HR0r2nFvVH0Dex1Th
         TuImrn70HPSC0BQ7vHPDkSBgqIZEoiaAYJaBV1/5LbBXonuhoTvNUaYW9o+j7mvLzO0A
         oMUyfNOjyrtRYjWNLt7K6e2gdh6y+AMopqOLxrM55HwslDlKObktA5guQlt/iMYt6lJP
         tXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AclrNr9DriONd9uxnMokdBW1rOGOgyBR/Fi4Kz2y6rY=;
        b=o6FC7XBq1DwR9RMzB83jd3kjTeLT1BCK5jzGfm5tZ/t0ZxduYYoILPtIzgVb+XjASQ
         M+ZMP83B2pj07ZlNjhg2SPoRWA40NoJuyAZspL7osDHSfv6eECbcB4dZdET9b9lTF5zi
         MBkSpKMbDZKZ+D/RwY+1rwpY7mHi9DP2kdI5+hU18h0elunb0AWmiBTNINGdG/kDI9l3
         gHRZTBrsb4mIzqu9a6v2rDxAQqHP7uomKGVS1ecihJNEPpX+FE/N9UIwp2766NQ04Mrr
         XKaLlioFBXCe0WvjI8r2P6d/EN0vnKbE0+3fToJZ9M5MNyppZmNJ35sUd0/Q7yCHB5ps
         GIWA==
X-Gm-Message-State: AOAM533iJ2vSGuMOnmzYwSFbiRplsF7PdqzOy3ZJCyb7TiNIHLQ9MeBh
        vJiCU72+8fGoccyY0S5GgYYZUfMnHUnC7MDw1w4=
X-Google-Smtp-Source: ABdhPJzYZJSPB0k1FaivnOBEYX+lKQSvu0AiuyqhCs6NJX5j7HTyd+efsHOu4YQKP45BUt6yV8tGGtChtcjaoW2EwSs=
X-Received: by 2002:a25:ad62:: with SMTP id l34mr6580499ybe.457.1627048059209;
 Fri, 23 Jul 2021 06:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210618062449.1067106-1-jay.xu@rock-chips.com>
 <CACRpkdYGyy+tE4_xddJWxWUQpPea0bc5CUTBfp2RtnJfQ-2t_w@mail.gmail.com> <CACRpkdadb0=KD+ZXQGNVDUBDYHUsvP94dSgPzfwhUbwjvw_6Wg@mail.gmail.com>
In-Reply-To: <CACRpkdadb0=KD+ZXQGNVDUBDYHUsvP94dSgPzfwhUbwjvw_6Wg@mail.gmail.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Fri, 23 Jul 2021 09:47:28 -0400
Message-ID: <CAMdYzYrG0mKJmnox8EK2T=KS2t=V+-LxDCX4rpDF_vkspWingw@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] gpio-rockchip driver
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jianqun Xu <jay.xu@rock-chips.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kever Yang <kever.yang@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 23, 2021 at 6:15 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Jul 23, 2021 at 12:07 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Fri, Jun 18, 2021 at 8:24 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:
> >
> > > Separate gpio driver from pinctrl driver, and support gpio v2 controller.
> > >
> > > Jianqun Xu (8):
> > >   pinctrl/rockchip: always enable clock for gpio controller
> > >   pinctrl/rockchip: separate struct rockchip_pin_bank to a head file
> > >   pinctrl/rockchip: add pinctrl device to gpio bank struct
> > >   gpio/rockchip: add driver for rockchip gpio
> > >   gpio/rockchip: use struct rockchip_gpio_regs for gpio controller
> > >   gpio/rockchip: support next version gpio controller
> > >   gpio/rockchip: drop irq_gc_lock/irq_gc_unlock for irq set type
> > >   pinctrl/rockchip: drop the gpio related codes
> > >
> > > Liang Chen (1):
> > >   dt-bindings: gpio: change items restriction of clock for
> > >     rockchip,gpio-bank
> >
> > I have applied the series to an immutable branch in the pinctrl tree:
> > https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-rockchip-split
> > Then I pulled that into devel.
> >
> > Bartosz: if you want you can pull this into the GPIO tree as well
> > (makes it possible to continue work on drivers/gpio/gpio-rockchip.c
> > and avoids clashes in Kconfig and Makefile)
>
> Oops I saw there is still discussion about some of the patches
> and found a bug myself. Pulled this out again and deleted the
> branch.
>
> See you again in v7 :D

Good Morning,

I have a patch ready to fix loading the new gpio driver with new
device trees that are missing the named gpio banks.
This also fixes loading on the rk3568, which need this driver for gpio support.
I will rebase it to the v7 when it drops (hopefully soon).

Very Respectfully,
Peter Geis

>
> Yours,
> Linus Walleij
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
