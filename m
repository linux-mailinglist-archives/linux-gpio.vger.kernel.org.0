Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1E17402781
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Sep 2021 13:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243934AbhIGLDR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Sep 2021 07:03:17 -0400
Received: from mail-vk1-f171.google.com ([209.85.221.171]:36832 "EHLO
        mail-vk1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233669AbhIGLDQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Sep 2021 07:03:16 -0400
Received: by mail-vk1-f171.google.com with SMTP id s126so3153177vkd.3;
        Tue, 07 Sep 2021 04:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=thOJQb3/w47iDmpu71x0KX+1BIUNFnNwW6CY9Btcpmw=;
        b=YWYVFcX+B9uSLLtUnClSO4/8xw0aOT/mFumXRfUjGG0K4iA7lvagEVDMpq2FiKPAIZ
         6CPzOG7TLlejC25UbU09n56BD+/zAG72QjI5EaNj2a4ki483S/cuitm81wQB9Js2Uvnn
         hBAvSfJtD9fzP14l47SB0QuQPpysMcLNZc+67Tn+ntgHeLzrBGfC1cc+4wxLFxSph8BZ
         w1X7w7gDdw3805Zxe3fcaKWzHORhfhS+fqTX4rvClxe3zbZPG0X0oUkvUSsgpsEgsnyV
         zCfut2lZnYiC1QAbWI57xLxKPxsVqiqL0/KzuTTVHhGtQhyCn2VDDX5zSGoVzpI5RS9J
         dU2w==
X-Gm-Message-State: AOAM532zmrnVTF4fT3bQkwjBxIqH3Qrj/9+bnKt/1y1jnbONG88WEqwN
        uC01D3+6wF+l1JuFV8iAPYpuK7HMFaznsbCTvOyAQhqE
X-Google-Smtp-Source: ABdhPJxoxSxZC7+MCNKpE6Lhu7Bx9DoYrGBA9Iw2FRNpnbHs5vD0cbAkh4Lt95bTKc349pEvB+1lYy37QIaWF+DPDZs=
X-Received: by 2002:a1f:d247:: with SMTP id j68mr7330206vkg.7.1631012529742;
 Tue, 07 Sep 2021 04:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210906134040.96642-1-wangborong@cdjrlc.com> <CAMuHMdXq-ACdy8C7Efamnwz_h=h8_C4-3y14O8-S61EnB7pWmQ@mail.gmail.com>
 <CAK8P3a03pYn3RvayqxWhHYbS9qcp13B3Mj29iS0hsrD3cpCi6w@mail.gmail.com>
In-Reply-To: <CAK8P3a03pYn3RvayqxWhHYbS9qcp13B3Mj29iS0hsrD3cpCi6w@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Sep 2021 13:01:58 +0200
Message-ID: <CAMuHMdWPSofFJcSQHwvGy=E-T74QK2v3L60+feLJ-kEfB3GY5A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: no need to initialise global statics
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Jason Wang <wangborong@cdjrlc.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 6, 2021 at 5:18 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Sep 6, 2021 at 4:36 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > --- a/drivers/pinctrl/renesas/core.c
> > > +++ b/drivers/pinctrl/renesas/core.c
> > > @@ -741,12 +741,12 @@ static int sh_pfc_suspend_init(struct sh_pfc *pfc) { return 0; }
> > >  #define SH_PFC_MAX_REGS                300
> > >  #define SH_PFC_MAX_ENUMS       3000
> > >
> > > -static unsigned int sh_pfc_errors __initdata = 0;
> > > -static unsigned int sh_pfc_warnings __initdata = 0;
> > > -static u32 *sh_pfc_regs __initdata = NULL;
> > > -static u32 sh_pfc_num_regs __initdata = 0;
> > > -static u16 *sh_pfc_enums __initdata = NULL;
> > > -static u32 sh_pfc_num_enums __initdata = 0;
> > > +static unsigned int sh_pfc_errors __initdata;
> > > +static unsigned int sh_pfc_warnings __initdata;
> > > +static u32 *sh_pfc_regs __initdata;
> > > +static u32 sh_pfc_num_regs __initdata;
> > > +static u16 *sh_pfc_enums __initdata;
> > > +static u32 sh_pfc_num_enums __initdata;
> >
> > These are special, as they use __initdata.
> > While dropping the initializers seems to work fine with e.g. gcc 9,
> > I'm quite sure that would fail with older compiler versions, where
> > the variable would be put in bss instead of initdata.
> >
> > See the example in include/linux/init.h, which explicitly
> > initializes a variable with zero:
> >
> >     static int init_variable __initdata = 0;
> >
> > Arnd: do you know in which version of gcc this was fixed?
> > It seems at least 6.5.0 and later are fine (I don't have all required
> > shared libs to run e.g. 5.5.0).
>
> I think you mixed up what happens: As far as I know, older compilers
> would put variables without the =0 into .bss, but those with the explicit
> =0 would end up in .data. Newer compilers treat them exactly the
> same, and these variables all get put into .bss by default. This seems
> to already be the case with gcc-4.1, which is the oldest one I could
> easily try.
>
> I'm rather sure that regardless of the compiler version, adding an
> explicit section attribute like the __initdata would force the section
> even on the pre-4.1 compilers.

I must be misremembering...

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
