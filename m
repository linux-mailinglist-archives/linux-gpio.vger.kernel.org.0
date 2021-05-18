Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F030F3876C9
	for <lists+linux-gpio@lfdr.de>; Tue, 18 May 2021 12:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243356AbhERKnD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 May 2021 06:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243564AbhERKnB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 May 2021 06:43:01 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E66C061573;
        Tue, 18 May 2021 03:41:42 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id k19so7090096pfu.5;
        Tue, 18 May 2021 03:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0dETjjh7TkbWq3ZVFxxnWjyFaCDOJycWzGMD8POfb54=;
        b=Gtcm1Jda6GCnjU4NVIhDHVPb/ZWw1BBChjezBTa8D1+H1n9ecPexy6iH58RRQEjXNV
         ONN9fGMmQFqmQmwReVF8CPY2S5cFs5CW6BpOGegPp233Uz2vgMjh/SWTupmDTFasy/vk
         nscG7Up85toO9ckI1m2gJ3rLjK3s2fGbwpI9RuhjubYX1i0btAK13BzeB91E6VVCx+Wc
         4Nep905e6qaEz8fXvPUa08h73gOsr/JBHF8rCzW0MmBx+l+LpW8WVqHpCrddVcXMXT+W
         bOV4MQ2k2jnkIL0hwr9XYUuABApY4/5p+LDk7I3KztM4ppyfp67g9JaLUoj4B3vxgKVG
         wOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0dETjjh7TkbWq3ZVFxxnWjyFaCDOJycWzGMD8POfb54=;
        b=O+9xiZc0RXgjD/8kFQ162V5DbQ3kYFC1b/gaciiGBbwYPywuJfY5T48RqLG7boyJnY
         7GpWkJjeagupIIFPBVqvcGHutB7Gm+w3jxj16yrL3xSX7nIeylNoJbGUBIEHoTidiDDk
         aJ9kG/wDxsHDOhyUgySOVAij5gkB8ePBotwh6h0rs5HqyGK8caYDLd21c2NV11B19Pdw
         ljuVwgT0/lE1Sa5bHApdKGIfD9pM5JZzqwQwtKXyO+H8OqUlJKZ1TebaGWWvuUgalwtQ
         FMkn0toSIVXJXweo2QhOU+DRyLDogx5BhCdiilBQ9sDI/UJo/dA5oeYHMnLxA2jPRbPG
         86fA==
X-Gm-Message-State: AOAM533LbJK17azd0M9ZGDrS7k7PYSE/6mCxCyrrorR4NueIwDja+4QE
        bbhY0ePzhuoBcfMev/WPNZ1He1FRlfMX5ZeRtJw=
X-Google-Smtp-Source: ABdhPJzJScMYIgTZWCK+qIuxZ6z481A62MiI63R4Rri75A6H+wqCDgQECQifjtF0oZJPBlTBbnyL/vo43CKCHNOhlRI=
X-Received: by 2002:aa7:985c:0:b029:2c4:b940:f77b with SMTP id
 n28-20020aa7985c0000b02902c4b940f77bmr4594123pfq.73.1621334502487; Tue, 18
 May 2021 03:41:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210516135531.2203-1-dariobin@libero.it> <20210516135531.2203-2-dariobin@libero.it>
 <CAHp75Vd8875hRNk1JK6gkmfxjqxBSu4cRNE1zJt9TyEW7TvsMg@mail.gmail.com>
 <20210517225713.GB2936462@x1> <960608833.161310.1621330718253@mail1.libero.it>
 <CAPgEAj42Dvb=qHvViEMz4Uy0V0Ted5GCojLua0pVn4hZ850AGQ@mail.gmail.com>
In-Reply-To: <CAPgEAj42Dvb=qHvViEMz4Uy0V0Ted5GCojLua0pVn4hZ850AGQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 18 May 2021 13:41:26 +0300
Message-ID: <CAHp75Vc_RUMEgcHVdS=pxryX9G_EboWcGOjES+quGXThLFRgbQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: core: configure pinmux from pins debug file
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Dario Binacchi <dariobin@libero.it>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 18, 2021 at 1:22 PM Drew Fustini <drew@beagleboard.org> wrote:
> On Tue, May 18, 2021 at 2:38 AM Dario Binacchi <dariobin@libero.it> wrote:
> > > Il 18/05/2021 00:57 Drew Fustini <drew@beagleboard.org> ha scritto:
> > > On Mon, May 17, 2021 at 11:02:00PM +0300, Andy Shevchenko wrote:
> > > > On Sun, May 16, 2021 at 7:43 PM Dario Binacchi <dariobin@libero.it> wrote:

...

> > > > Drew, is it similar to what you are trying to achieve?
> > >
> > > Yes, I would say this similar to what I was trying to accomplish: being
> > > able to change contents of conf_<module>_<pin> register [table 9-60]
> > > from userspace.
> > >
> > > However, I was specifically looking to change bits 2:0 which is mux
> > > mode. My motivation was to allow BeagleBone users to easily switch
> > > between pin functions on the expansion headers during runtime to make
> > > rapid prototyping with a breadboard easier (such as changing header pin
> > > from GPIO to SPI mode). Most of the header pins have 7 different modes.
> > >
> > > Ultimately, the solution I settled on with feedback from this list was
> > > to create pinmux-select debugfs file that can activate desired fucntion:
> > > 6199f6becc86 ("pinctrl: pinmux: Add pinmux-select debugfs file")
> > >
> > > Bits 6:3 are related to what this subsystem would refer to as pin conf
> > > such as slew, input enable and bias. Thus it might make sense to expose
> > > something like a select-pinconf file to activate pin conf settings from
> > > userspace. This would require using 'pinconf-single' compatible.
> > >
> > > I fixed pinctrl-single bug regarding pinconf last year so it should be
> > > possible to use 'pinconf-single' compatible for the am33xx_pinmux node:
> > > f46fe79ff1b6 ("pinctrl-single: fix pcs_parse_pinconf() return value")
> > >
> >
> > In the kernel version 4.1.6 that I am using on my custom board, I have fixed
> > the commit f07512e615dd ("pinctrl/pinconfig: add debug interface"). However,
> > this feature was later removed (https://lore.kernel.org/patchwork/patch/1033755/).
> > Do you think it is better to bring that functionality back to life or the submitted
> > patch could be fine too?
>
> Wow, I had no idea there used to be a pinconf-config debugfs file.  I
> would have been interested in using it if it had still existed.

In Git you may always resurrect the removed feature.

> Regarding your patch, I think it could be helpful to be able to set
> the conf_<module>_<pin> registers directly through debugfs as I can
> imagine situations where it would be useful for testing.  It is a bit
> dangerous as the person using it has to be careful not to change the
> wrong bits, but they would need to have debugfs mounted and
> permissions to write to it.   I suppose it depends on what others
> maintainers like Linus and Tony think about whether that is an
> acceptable solution.



-- 
With Best Regards,
Andy Shevchenko
