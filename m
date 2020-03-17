Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D74C188E72
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2020 20:58:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgCQT6F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Mar 2020 15:58:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:46938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726294AbgCQT6E (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 17 Mar 2020 15:58:04 -0400
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0E51820753;
        Tue, 17 Mar 2020 19:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584475084;
        bh=4ktS7vkXbvWPqEkGLuhwSvTcermavdaiwrVzlyvDMTU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ErekzIionC/I7zFmUNqh7MxcljAySREdp8+XSrVaIt2HsegDI9CUw2Q9Ay+w0gLyW
         6unmLPpaIgjirEHSIzlZ3SpkFSF/a26BjhaOk7/fNMrx1IW8zjF2uatw753SUDT8EN
         Q6W+2DCAe6qxa2Sggc+xveh3nGbdqzVHUNkvlC9g=
Received: by mail-il1-f173.google.com with SMTP id p12so6714315ilm.7;
        Tue, 17 Mar 2020 12:58:04 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1M/FjSa47hg4/gTfzz43nNroPTohAYJv8y/u63lv+L+GF6P08d
        R6MrqQjkDJbdEx3raxqd2d6aWylF4auADMhLF4k=
X-Google-Smtp-Source: ADFU+vskZaQmZn/HUDvAI0R1yO/yTvGjvDEnMeLhFaqNGK4UcwDiZkQLGNE8fGZ58Cs1uMLUqtdXJCc5dza1ryNDO9g=
X-Received: by 2002:a92:4b0d:: with SMTP id m13mr514342ilg.43.1584475083400;
 Tue, 17 Mar 2020 12:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <1583825986-8189-1-git-send-email-light.hsieh@mediatek.com>
 <1583825986-8189-2-git-send-email-light.hsieh@mediatek.com>
 <CAGp9LzpJTYXp9R6SKjauemPYMd9wfoacD_czQBVgWtJoMcPFKg@mail.gmail.com> <1584437292.12211.9.camel@mtkswgap22>
In-Reply-To: <1584437292.12211.9.camel@mtkswgap22>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Tue, 17 Mar 2020 12:57:52 -0700
X-Gmail-Original-Message-ID: <CAGp9LzoQoWyrMSYQaqH=OL9iCeakBvosZO5T3c757x3pBwwMJw@mail.gmail.com>
Message-ID: <CAGp9LzoQoWyrMSYQaqH=OL9iCeakBvosZO5T3c757x3pBwwMJw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] pinctrl: make MediaTek pinctrl v2 driver ready for
 buidling loadable module
To:     Light Hsieh <light.hsieh@mediatek.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, kuohong.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi, Light

On Tue, Mar 17, 2020 at 2:28 AM Light Hsieh <light.hsieh@mediatek.com> wrote:
>
> On Sun, 2020-03-15 at 14:35 -0700, Sean Wang wrote:
> > Hi, Light
> >
> > On Tue, Mar 10, 2020 at 12:39 AM <light.hsieh@mediatek.com> wrote:
> > >
> > > From: Light Hsieh <light.hsieh@mediatek.com>
> > >
> >
> > Correct the prefix of the subject with "pinctrl: mediatek".
> >
> > > In the future we want to be able to build the MediaTek pinctrl driver,
> > > based on paris, as kernel module. This patch allows pinctrl-paris.c, the
> > > external interrupt controller mtk-eint.c, and pinctrl-mtk-common-v2.c to
> > > be loadable as module.
> > >
> > > Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
> > > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> > > ---
> > >  drivers/pinctrl/mediatek/Kconfig                 | 13 +++++++++++--
> > >  drivers/pinctrl/mediatek/Makefile                |  5 +++--
> > >  drivers/pinctrl/mediatek/mtk-eint.c              |  9 +++++++++
> > >  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 24 ++++++++++++++++++++++++
> > >  drivers/pinctrl/mediatek/pinctrl-paris.c         |  6 ++++++
> > >  drivers/pinctrl/pinconf-generic.c                |  1 +
> >
> > Separate the patches for the device driver and for the core respectively.
>
> Since the patch for pinconf-generic.c had been done in  b88d145191ad
> ("pinctrl: Export some needed symbols at module load time").
> I will remove patch for pinconf-generic.c.
>
> > >  6 files changed, 54 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> > > index 701f9af..4cd1109 100644
> > > --- a/drivers/pinctrl/mediatek/Kconfig
> > > +++ b/drivers/pinctrl/mediatek/Kconfig
> > > @@ -3,10 +3,12 @@ menu "MediaTek pinctrl drivers"
> > >         depends on ARCH_MEDIATEK || COMPILE_TEST
> > >
> > >  config EINT_MTK
> > > -       bool "MediaTek External Interrupt Support"
> > > +       tristate "MediaTek External Interrupt Support"
> > >         depends on PINCTRL_MTK || PINCTRL_MTK_MOORE || PINCTRL_MTK_PARIS || COMPILE_TEST
> > >         select GPIOLIB
> > >         select IRQ_DOMAIN
> > > +       default y if PINCTRL_MTK || PINCTRL_MTK_MOORE
> > > +       default PINCTRL_MTK_PARIS
> > >
> > >  config PINCTRL_MTK
> > >         bool
> > > @@ -17,23 +19,30 @@ config PINCTRL_MTK
> > >         select EINT_MTK
> > >         select OF_GPIO
> > >
> > > +config PINCTRL_MTK_V2
> > > +       tristate
> > > +       depends on PINCTRL_MTK_MOORE || PINCTRL_MTK_PARIS
> >
> > PINCTRL_MTK_V2 doesn't have to depend on PINCTRL_MTK_MOORE or
> > PINCTRL_MTK_PARIS to work and it can build on it own so that lets us
> > remove the dependency.
> >
> The usage of PINCTRL_MTK had been describe in cover letter:
>
> 1.4 PINCTRL_MTK_V2: add this tristate config which depends on
>         PINCTRL_MTK_PARIS and PINCTRL_MTK_MOORE. No need to specify in
>         defconfig file.
>       * PINCTRL_MTK_V2 will be y if either PINCTRL_MTK_PARIS or
>         PINCTRL_MTK_MOORE is y.
>       * PINCTRL_MTK_V2 will be n if both PINCTRL_MTK_PARIS and
>         PINCTRL_MTK_MOORE are n.
>       * PINCTRL_MTK_V2 will be m if PINCTRL_MTK_PARIS is m and
>         PINCTRL_MTK_MOORE is n.
>
>
> Without PINCTRL_MTK_V2, we cannot specify whether
> pinctrl-mtk-common-v2.c is built-in or loadable kernel module.
>

What I was actually meaning is

config PINCTRL_MTK_V2
          tristate

with that should work for your case.

> > > +
> > >  config PINCTRL_MTK_MOORE
> > >         bool
> > >         depends on OF
> > >         select GENERIC_PINCONF
> > >         select GENERIC_PINCTRL_GROUPS
> > >         select GENERIC_PINMUX_FUNCTIONS
> > > +       select EINT_MTK
> >
> > The original design of PINCTRL_MTK_MOORE doesn't have to work with
> > EINT_MTK coupled tightly so that let us remove the reverse dependency.
> >
>
> Actually, PINCTRL_MTK_MOORE use EINT_MTK in the following call flow:
> mtk_moore_pinctrl_probe() -> mtk_build_eint() -> mtk_eint_do_init().
> mtk_eint_do_init() is defined in mtk-eint.c.

CONFIG_EINT_MTK is actually an option to Moore pinctrl since Moore
pinctrl has already carefully considered the condition with
CONFIG_EINT_MTK=n in mtk_build_eint.

>
> > >         select GPIOLIB
> > >         select OF_GPIO
> > > +       select PINCTRL_MTK_V2
