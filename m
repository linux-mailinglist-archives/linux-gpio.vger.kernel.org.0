Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B928B2DB486
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Dec 2020 20:36:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgLOTg0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Dec 2020 14:36:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbgLOTg0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2020 14:36:26 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBEB6C0617A6;
        Tue, 15 Dec 2020 11:35:45 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id c79so15109654pfc.2;
        Tue, 15 Dec 2020 11:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rIUIK9INOglYEzmX/Zz+55Q7G2LAk+CSP61LkLziHqA=;
        b=VQY9TAJ7DAX0eQxmJacQ6m9PqU1dnF85l77LpcIGDBdqYVZOhFPLRa4CyFlTEo++aI
         wQ1X00XUWSaQRn6apwW9MnX1XCaT01LkBQa1n0gEfaIRCFMZBTjVY5FryyNLakbBO49/
         J1JJgN87a9rmjlBM48reuRwsLNqj0gLT9Te7sfqEwaCjkccklD1CWp5NytMcnV1gzJk8
         dYdCkRSXbDi4tBjVOwiJfNDBmnOrLzz08dEwx/W1zNs6kFyObkoTh7IcybfXT/tpwFfY
         Wmu2S84Z3UFjZp/tE/zIzQ1K4ZVx+fV6S/LZRA2UNGAtJmhNP7+PN/T3aEvAgP/bdVVI
         vacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rIUIK9INOglYEzmX/Zz+55Q7G2LAk+CSP61LkLziHqA=;
        b=JV1X7pk2leo3uS6wbYhXllum7Ou+YJaqpuUPamZZgWg73F8y/12Ci0ieYkCrYR++Xu
         zmc5qwFLMIDETa6Shz6qp29eeWQhNo63GmTgcwKgoQH7U4O1Ugs7fa3ZEI0hzqseKxTl
         HikJL2RwVPdFkaqRpKzNTleRxocHj7PwFooTUHtOPNhrpMwhQuz4IWXXcPY54cSZQjNm
         vUQ+EKd2zcAZJQlZKD1Fy2T3cHW3N6khDVf1c2Z39mzdpa71QI1YefuwNzyeaCV9UHnd
         VpWFjRzEY3NNvGihdhLY3SPrfj9ffgpho4dnIyM64/+C5G8fIyK/qTLtdutM6f29fHaN
         P17A==
X-Gm-Message-State: AOAM532dLmEIXrimohrvlthWw6kACTVwM+0r/NMiylhoFoZEiwG7qv9Y
        ZaL5kIkZACn5PMGdHu1Chnemp5GkitkAkr8hk8U=
X-Google-Smtp-Source: ABdhPJy3DfdAQETUz7knHlF2dUZ3lq9KcFbWDfLpycxarRn0iyyFGP+IPIFOPaoix8NbP5ynq/i5TI76NzWyzOzaj1Q=
X-Received: by 2002:a62:19cc:0:b029:19e:321b:a22e with SMTP id
 195-20020a6219cc0000b029019e321ba22emr22730420pfz.73.1608060945226; Tue, 15
 Dec 2020 11:35:45 -0800 (PST)
MIME-Version: 1.0
References: <20201211042625.129255-1-drew@beagleboard.org> <CAHp75VcAbdrSnb_ag9Rc0tny3Vtqjs1if+ahk7U36V2eaKMpSw@mail.gmail.com>
 <20201211234304.GA189853@x1> <CAHp75Vf-=nM-M2K-v_8iyME4t6ZF-gvSZ5ePsxQFhObJ_0YHsw@mail.gmail.com>
 <20201214214419.GA1196223@x1>
In-Reply-To: <20201214214419.GA1196223@x1>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 15 Dec 2020 21:36:33 +0200
Message-ID: <CAHp75VeN9xLUKFBXZfo=XzNkdv=BSRJW59=cUjyY0TekF1JONA@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: add helper to expose pinctrl state in debugfs
To:     Drew Fustini <drew@beagleboard.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 14, 2020 at 11:44 PM Drew Fustini <drew@beagleboard.org> wrote:
> On Mon, Dec 14, 2020 at 07:55:12PM +0200, Andy Shevchenko wrote:
> > On Sat, Dec 12, 2020 at 1:43 AM Drew Fustini <drew@beagleboard.org> wrote:
> > > On Fri, Dec 11, 2020 at 11:15:21PM +0200, Andy Shevchenko wrote:
> > > > On Fri, Dec 11, 2020 at 1:54 PM Drew Fustini <drew@beagleboard.org> wrote:

...

> > > > But I'm wondering, why it requires this kind of thing and can't be
> > > > simply always part of the kernel based on configuration option?
> > >
> > > Do you mean not having a new CONFIG option for this driver and just have
> > > it be enabled by CONFIG_PINCTRL?
> >
> > No, configuration option stays, but no compatible strings no nothing
> > like that. Just probed always when loaded.
>
> I first started down the route of implementing this inside of
> pinctrl-single.  I found it didn't work because devm_pinctrl_get() would
> fail.  I think was because it was happening too early for pinctrl to be
> ready.
>
> I do think it seems awkward to have to add this to dts and have the
> driver get probed for each entry:
>
>         P1_04_pinmux {
>                 compatible = "pinctrl,state-helper";
>                 status = "okay";
>                 pinctrl-names = "default", "gpio", "gpio_pu", "gpio_pd", "gpio_input", "pruout", "pruin";
>                 pinctrl-0 = <&P1_04_default_pin>;
>                 pinctrl-1 = <&P1_04_gpio_pin>;
>                 pinctrl-2 = <&P1_04_gpio_pu_pin>;
>                 pinctrl-3 = <&P1_04_gpio_pd_pin>;
>                 pinctrl-4 = <&P1_04_gpio_input_pin>;
>                 pinctrl-5 = <&P1_04_pruout_pin>;
>                 pinctrl-6 = <&P1_04_pruin_pin>;
>         };
>
> But I am having a hard time figuring out another way of doing it.

I'm not a DT expert and I have no clue why you need all this. To me it
looks over engineered to engage DT for debugging things. OTOH, you may
add a property to allow debug mux (but it prevent ACPI enabled
platforms to utilize this).

...

> Any ideas as to what would trigger the probe() if there was not a match
> on a compatible like "pinctrl,state-helper"?
>
> > Actually not even sure we want to have it as a module.
>
> And have just be a part of one of the existing pinctrl files like core.c?

Separate file, but in conjunction with core.c and pinmux and so on.

...

> > > > Shouldn't it be rather a part of a certain pin control folder:
> > > > debug/pinctrl/.../mux/...
> > > > ?
> > >
> > > Yes, I think that would make sense, but I was struggling to figure out
> > > how to do that. pinctrl_init_debugfs() in pinctrl/core.c does create the
> > > "pinctrl" directory, but I could not figure out how to use this as the
> > > parent dir when calling debugfs_create_dir() in this driver's probe().
> > >
> > > I thought there might be a way in debugfs API to use existing directory
> > > path as a parent but I couldn't figure anything like that. I would
> > > appreciate any advice.
> >
> > If the option is boolean from the beginning then you just call it from
> > the corresponding pin control instantiation chain.
>
> Sorry, I am not sure I understand what you mean here.  What does
> "option" mean in this context?  I don't think there is any value that is
> boolean invovled.  The pinctrl states are strings.

config PINMUX_DEBUG
 bool "..."
 depends on PINMUX



>
> With regards to parent directory, I did discover there is
> debugfs_lookup(), so I can get the dentry for "pinctrl" and create new
> subdirectory inside of it.  This is the structure now:
>
> /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P2_35_pinmux/state
> /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P2_34_pinmux/state
> /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P2_33_pinmux/state
> /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P2_32_pinmux/state
> etc..


--
With Best Regards,
Andy Shevchenko
