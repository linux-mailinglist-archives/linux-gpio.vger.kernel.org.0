Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB2E401D83
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Sep 2021 17:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231841AbhIFPTs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Sep 2021 11:19:48 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:37521 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhIFPTo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Sep 2021 11:19:44 -0400
Received: from mail-wm1-f48.google.com ([209.85.128.48]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MK3mS-1mfUnL2mly-00LUiJ; Mon, 06 Sep 2021 17:18:37 +0200
Received: by mail-wm1-f48.google.com with SMTP id u26-20020a05600c441a00b002f66b2d8603so5257727wmn.4;
        Mon, 06 Sep 2021 08:18:37 -0700 (PDT)
X-Gm-Message-State: AOAM530BqXq2/fIzlWxE6383hv64bnPUbL5M4ZwvBplz5n+EWD275bIe
        HXggC7AhcnfzzXSNky3wB031MVfeTe6u3FpAocU=
X-Google-Smtp-Source: ABdhPJyUmcqlSXXDo6N5xidc4owjAr9mq6VnGYegss8BqCjEoHDJDIGQSX81vWKqdKbgR3AuSKJGRRdG3vRKY6C0l/U=
X-Received: by 2002:a1c:a9ce:: with SMTP id s197mr11919353wme.173.1630941517194;
 Mon, 06 Sep 2021 08:18:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210906134040.96642-1-wangborong@cdjrlc.com> <CAMuHMdXq-ACdy8C7Efamnwz_h=h8_C4-3y14O8-S61EnB7pWmQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXq-ACdy8C7Efamnwz_h=h8_C4-3y14O8-S61EnB7pWmQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 6 Sep 2021 17:18:21 +0200
X-Gmail-Original-Message-ID: <CAK8P3a03pYn3RvayqxWhHYbS9qcp13B3Mj29iS0hsrD3cpCi6w@mail.gmail.com>
Message-ID: <CAK8P3a03pYn3RvayqxWhHYbS9qcp13B3Mj29iS0hsrD3cpCi6w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: no need to initialise global statics
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Jason Wang <wangborong@cdjrlc.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:MDau2A3ITdVaKwn/eUO9FoEXzsR/ztjrl5xQOna+foyVY8KydV2
 voiN+1Sf1AYfH8fbv4KHEuA6wvxZ+FY6u3v83rfUjIkNbPIXlGetNRjgsTPcnoNiYqCoUUb
 HRE2d//rJSOsILah+pVhHj4gHaSfVxrbLqGOAA9xhp/V0t5acJmy1CGrxZBFyi4TsadnDXF
 LJsgP/e3zWuwZyd+TwnLQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vafXHZNZbmk=:+GPJ0Q9Tb02Lx0FPcEEyxm
 Iu9foELLjNIQfxZipii8KJVG4kPsLT2Q0bXbmlWaObLqECnDruNC1baBQdwbKyh3k6N9U4Z38
 szpd9ZlWSi/un1MgTxJLNeqvJqzMmAid/Utt1Dh/u78cYFnhBDrCihgUlJlkQnSxysASk/LxB
 fQn3EvcBZiCXn8d5B3/QvNzc+IDOH9Ztv51wLWOYSkd/n0L3DNZSRJuoPx6z2P5jG1hVVIid2
 nRX3ozBxeRKri4gkfdWAQufaZ0Xe2aFwwDhI5045GaV1oD4jxw3bAF3b+T8iqVceVMk4i+ga0
 t7ZcTxZi0NQuM8WxkTC12XDnLxawnvTEBlsi9O6ZRGd32Xdb2Gl3BcpsPzkgrEL4boLVX7yqS
 s3njH0DulHGrF5jYRs1uFo7qXfGPWckVoCf9/F9HeQDVvKajN3bvrKEl9aofwhuuEJziWcvv2
 Vuk/tempMe0EUAXZp7YCMV5EqXKHJHb6CcJ0+4b2RBBmhumgyGik6H5A6ppovBDw5a0jFaUGF
 iwM9KXwRjs31wAsJjIBe2R0YAs3w+s9bufPP0D9jisD+Bm5qLiPo9awWSnoZ5THlHNp5ZcLQq
 OyKPWgphauLfAblPCrsERyUz3lHaDrq+JASse6GuKBdZ3hviU8v7cJSH/4A7BEW/z12GTAfKH
 1XAVIFkqCOuS5s6iq1M/+EuZjeNlMVq9/BIL5eLl9mtO+ri93n4wxkVa5ez1jE2pm+QdLu5lf
 AL7Htp/y+wDvrmsB25T+sMlXeW6FiugcVwaSoA==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 6, 2021 at 4:36 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > --- a/drivers/pinctrl/renesas/core.c
> > +++ b/drivers/pinctrl/renesas/core.c
> > @@ -741,12 +741,12 @@ static int sh_pfc_suspend_init(struct sh_pfc *pfc) { return 0; }
> >  #define SH_PFC_MAX_REGS                300
> >  #define SH_PFC_MAX_ENUMS       3000
> >
> > -static unsigned int sh_pfc_errors __initdata = 0;
> > -static unsigned int sh_pfc_warnings __initdata = 0;
> > -static u32 *sh_pfc_regs __initdata = NULL;
> > -static u32 sh_pfc_num_regs __initdata = 0;
> > -static u16 *sh_pfc_enums __initdata = NULL;
> > -static u32 sh_pfc_num_enums __initdata = 0;
> > +static unsigned int sh_pfc_errors __initdata;
> > +static unsigned int sh_pfc_warnings __initdata;
> > +static u32 *sh_pfc_regs __initdata;
> > +static u32 sh_pfc_num_regs __initdata;
> > +static u16 *sh_pfc_enums __initdata;
> > +static u32 sh_pfc_num_enums __initdata;
>
> These are special, as they use __initdata.
> While dropping the initializers seems to work fine with e.g. gcc 9,
> I'm quite sure that would fail with older compiler versions, where
> the variable would be put in bss instead of initdata.
>
> See the example in include/linux/init.h, which explicitly
> initializes a variable with zero:
>
>     static int init_variable __initdata = 0;
>
> Arnd: do you know in which version of gcc this was fixed?
> It seems at least 6.5.0 and later are fine (I don't have all required
> shared libs to run e.g. 5.5.0).

I think you mixed up what happens: As far as I know, older compilers
would put variables without the =0 into .bss, but those with the explicit
=0 would end up in .data. Newer compilers treat them exactly the
same, and these variables all get put into .bss by default. This seems
to already be the case with gcc-4.1, which is the oldest one I could
easily try.

I'm rather sure that regardless of the compiler version, adding an
explicit section attribute like the __initdata would force the section
even on the pre-4.1 compilers.

        Arnd
