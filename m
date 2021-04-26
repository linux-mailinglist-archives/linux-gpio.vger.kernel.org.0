Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5409236B477
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Apr 2021 16:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233494AbhDZOFm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Apr 2021 10:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231862AbhDZOFl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Apr 2021 10:05:41 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2EE8C061574;
        Mon, 26 Apr 2021 07:04:59 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id p12so40108405pgj.10;
        Mon, 26 Apr 2021 07:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=diIQNj+fq7cLP/VfK5jIgYyt6WpLRDuOebeyCDenI/4=;
        b=j4D+l4O368V00hvwUHS/SV9UgjCy/89yTiaGqTMxlvnq4FbiOW2JjtBj8ZXjfPrTOc
         a8fvCzu4eoP39BwrscaLwhnu8QZqLLcaCgNo4iOAapzbCdsgmYRmcaBQNxcd3AoqkUYB
         ASD5FxspAH89tKDXM05E5tHT6cr6ivXYtR9lI5ayBKNKt+puF2081DHG/PM3LKLe5vzd
         LGAa8bf7ofvszcUMmLB+yGjov8wMVWjFgExDKQuU8z0jFri6xDXZVq9bW4RcGmEAx8uH
         ta4ygoLjlD+2HpgA2NO3RIfWlgau2JG0hL8gIXPrYjL4fy74Ng1THS70mbtLFYNVpwXZ
         FScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=diIQNj+fq7cLP/VfK5jIgYyt6WpLRDuOebeyCDenI/4=;
        b=s7M1ZlmwVtYZQ12xNq5DcrSDFq96pqF0ttvMcUInOT+b/Enbm2/EA4gqgdCWKfwNkW
         Evs3bL6jqNLYWhUgjXZdk1PzfDmtWFb3/Jq9bi5eoLOPmGUuXwUak7xtQweQ+7xeTpIw
         IsQdF1lOOIQdBIZ8WES0QxxSzrAFXy/fBCN64TcgMGfbIgrcWsl+5iZVrgwIK0yoKrgU
         f7xwYdBzx4lEzW74Hl75OZk5toY7Pphuu2n9+4ZCSLBC+hRdB4RwSSz78bzgdIFKKH4R
         Df3emflawa3NkGljSsolhDmNe92WadFmuRvMY1si3Pebiw/kVWC/KxKE9LON8maQUy/Z
         7vYw==
X-Gm-Message-State: AOAM531YcRVvWRb0yXeS/74+d0B6hBz6cqEAJLTOrQXTACNEeF5Ec0Iv
        k144D0rjmpZrUfOUVHsbGI9qbcBltRFiuPYB95Q=
X-Google-Smtp-Source: ABdhPJxgrQtMKpD4UrsflSNc2WpMuQpgSZBw6j3yc6QFCtWuFYbpSjUJdmOdKxSiY0QC0WVmrYu2AdRC+7PIf6KDJpQ=
X-Received: by 2002:a65:5a4d:: with SMTP id z13mr17064008pgs.4.1619445899049;
 Mon, 26 Apr 2021 07:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <1619080202-31924-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1619080202-31924-4-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <CAHp75VfCbbnN-TBJiYFb=6Rhf30jA-Hz1p1UORsubF7UG6-ATw@mail.gmail.com> <DM5PR02MB3877B234F85F3B4887DF3A95BD429@DM5PR02MB3877.namprd02.prod.outlook.com>
In-Reply-To: <DM5PR02MB3877B234F85F3B4887DF3A95BD429@DM5PR02MB3877.namprd02.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 26 Apr 2021 17:04:42 +0300
Message-ID: <CAHp75VfugGqLNU8LKJ_K3dPr=-eh6LHx75eV=33jH9OnryBoGA@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
To:     Sai Krishna Potthuri <lakshmis@xilinx.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michals@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>,
        "saikrishna12468@gmail.com" <saikrishna12468@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 26, 2021 at 4:20 PM Sai Krishna Potthuri
<lakshmis@xilinx.com> wrote:
> > From: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Sent: Friday, April 23, 2021 9:24 PM
> > On Thu, Apr 22, 2021 at 11:31 AM Sai Krishna Potthuri
> > <lakshmi.sai.krishna.potthuri@xilinx.com> wrote:

...

> > > +config PINCTRL_ZYNQMP
> > > +       tristate "Pinctrl driver for Xilinx ZynqMP"
> > > +       depends on ZYNQMP_FIRMWARE
> > > +       select PINMUX
> > > +       select GENERIC_PINCONF
> > > +       default ZYNQMP_FIRMWARE
> > > +       help
> > > +         This selects the pinctrl driver for Xilinx ZynqMP platform.
> > > +         This driver will query the pin information from the firmware
> > > +         and allow configuring the pins.
> > > +         Configuration can include the mux function to select on those
> > > +         pin(s)/group(s), and various pin configuration parameters
> > > +         such as pull-up, slew rate, etc.
> >
> > Missed module name.
> Is this (module name) a configuration option in Kconfig?

It's a text in a free form that sheds light on how the module will be
named in case the user will choose "m".

...

> > > + * Copyright (C) 2020 Xilinx, Inc.
> >
> > 2021?
> Couple of versions for this patch series sent in 2020, hence maintaining
> the same.
> Is it like we maintain the year when this patch series is applied, which is
> 2021?

2020, 2021 sounds okay as well.

...

> > > +       if (pin >= zynqmp_desc.npins)
> > > +               return -EOPNOTSUPP;
> >
> > Is it possible?
> This is a safe check.

I.o.w. dead code, right?

> Pin information will get from dt files/Xilinx firmware (query pin information
> for a group)/user application and there are chances of getting wrong pin.

I'm not sure I understand this. How comes that pin control core will
ask for a pin higher than npins?

...

> > > +               ret = zynqmp_pm_pinctrl_get_config(pin, param, &arg);
> > > +               if (arg != PM_PINCTRL_BIAS_PULL_UP)
> > > +                       return -EINVAL;
> >
> > Error code being shadowed. Instead check it here properly.

> Are you mentioning the case where ret is also a non-zero?
> If yes, then I will update this check to
> if (!ret && arg != PM_PINCTRL_BIAS_PULL_UP)
>         return -EINVAL;

No, this is wrong in the same way.

> ret non-zero case, we are handling at the end of switch case.

I meant that you need to pass the real return code to the (upper) caller.
Ditto for all other cases (mentioned and not mentioned)

...

> > > +                       ret = -EOPNOTSUPP;
> >
> > Isn't it ENOTSUP for all cases here?
> Giving 'Operation Not Supported (EOPNOTSUPP)' error, when
> driver gets a request for unsupported pin or configuration.
> Can you please elaborate your question if I didn't answer properly.

The pin control subsystem along with the GPIO library are using
-ENOTSUPP error code for internal operations.
EOPNOTSUPP is the one that should be returned to user space. Is it the
case here?

...

> > > +};
> >
> > > +
> >
> > Ditto.
> I see some drivers are maintaining the extra line in above two cases.
> We shouldn't maintain extra line after struct declaration?

What's the point to add more blank lines where they won't add any value?

> > > +module_platform_driver(zynqmp_pinctrl_driver);

-- 
With Best Regards,
Andy Shevchenko
