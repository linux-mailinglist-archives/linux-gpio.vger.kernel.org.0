Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CBD42ADC1E
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 17:26:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730542AbgKJQZ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 11:25:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729674AbgKJQZ6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 11:25:58 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EF91C0613D1;
        Tue, 10 Nov 2020 08:25:58 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id x15so5906312pll.2;
        Tue, 10 Nov 2020 08:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5O4s8BL9ywl7ZsGognmWKnG6sDyMl8Xw+WZ9e3T1IIA=;
        b=bPs9zH699DF1Siu5O9absy+Kuq0HrKfELJ1ksIWoHFUhXFNIfXZv7GRJl767J3DLip
         r0b5N+hY/3L4bOL2iRaVW5dU5W7A54XPyJmrd4WEDVMNXvHUW0U6HKrFhWioFXVEK9p8
         HOwKask5FOqTtEct756aF8BD1AGhUuzI/nn8tCL4P17KoY4B3c/LPDfDWKCbFwLIpKRg
         gZCuthMLJBvsa+bT2FJqWQ3DckqNyeW2kv2ArkPkJoYU+1VV0hZhfuj6nDDGcoBeJUvT
         nrKBA/c2bClDI5RzmazOhz6oxW1LFGmDAixCIBp7YeHekGgip3YpFcZ5EpJXOuowru1I
         lYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5O4s8BL9ywl7ZsGognmWKnG6sDyMl8Xw+WZ9e3T1IIA=;
        b=PC5lBRoS6svJeCYZrCwzNt+a9qGqr35l+H/O+1damCmVem+irNsg09An94b5xJMM21
         R2jO6CzJcjTquiZ64ks9Zl59VhuAJYVGEsEfyTaCAEtkduZOg+dCTF7HHhO2JLHTnR0+
         dCCOUz3N3G9MXbnLrGudW308GlcC/5vnvfWNYscHOKOoUFy9VuAWIPF3Si3D53S6TOvf
         0beBvD5apVOLHvBmOfZaI3eZDchEy/cfZQGtBLdTfKz55FJa2YRUF664fhTtFxgRvAuR
         89CzISnddUFjwzJtV7mdYiWSSFdd4UCBGUqgh/JMUT1frTUcTWxdCzu8V5d5MMn7/4vI
         Tl6w==
X-Gm-Message-State: AOAM531iWiLV2YfuOAYNJizwQMBByYWg9a/4izep55v4ZxiH+hTqXhnZ
        LApgwC1pyqX8eYAp5GY232inr+0arvXqVDdq5ek=
X-Google-Smtp-Source: ABdhPJz/EiLvvYT1guTS3uZDBbfc/aFjk+4N5P2ZeATb+keF7p3jJxlYAyhkpEPKBD4J3hZZ9gBmAmmbxrPheu9QSAo=
X-Received: by 2002:a17:902:aa8a:b029:d3:c9dd:77d1 with SMTP id
 d10-20020a170902aa8ab02900d3c9dd77d1mr17502695plr.0.1605025557907; Tue, 10
 Nov 2020 08:25:57 -0800 (PST)
MIME-Version: 1.0
References: <20201109132643.457932-1-lars.povlsen@microchip.com>
 <20201109132643.457932-3-lars.povlsen@microchip.com> <CAHp75Vdfm7A5=Mi-LZ1sHJS5fSngypZQ50-rGQ7A6kD2kmVFTA@mail.gmail.com>
 <87361hfbwu.fsf@microchip.com>
In-Reply-To: <87361hfbwu.fsf@microchip.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 10 Nov 2020 18:26:46 +0200
Message-ID: <CAHp75VfZ=hJvpYiAOz72yRpJTxLU6ZOo9hEz4BsBcgSwAcjCFA@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] pinctrl: pinctrl-microchip-sgpio: Add pinctrl
 driver for Microsemi Serial GPIO
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 5:51 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
> > On Mon, Nov 9, 2020 at 3:27 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:

> >> This adds a pinctrl driver for the Microsemi/Microchip Serial GPIO
> >> (SGPIO) device used in various SoC's.
> >
> > Please, elaborate what you said previously, because now it has no
> > justification to be a pin control driver.
>
> As previously stated, the individual pins have possible other functions
> than GPIO. When these functions are added, the driver will need pinctrl
> functinality. This was accepted by Linux Walleij.

Yes, I understand that. What I meant is to update the commit message
to tell this to the reviewers / readers / anthropologists.

...

> >> +               return -EOPNOTSUPP;
> >
> > Are you sure? IIRC internally we are using ENOTSUPP.
> >
> > Couple of drivers seem to be wrongly using the other one.
>
> Checkpatch complains about ENOTSUPP:
>
> # ENOTSUPP is not a standard error code and should be avoided in new patches.
> # Folks usually mean EOPNOTSUPP (also called ENOTSUP), when they type ENOTSUPP.

checkpatch is wrong if this is internal code and to me sounds like
it's not going out of the kernel.

...

> >> +                       err = -EOPNOTSUPP;
> >
> > Ditto.
>
> Ditto.

Ditto.

...

> >> +               dev_err(pctldev->dev, "Pin %d direction as %s is not possible\n",
> >> +                       pin, input ? "input" : "output");
> >
> > Do we need this noise? Isn't user space getting a proper error code as
> > per doc and can handle this?
> >
>
> This need not go to user space, as one use-case is using the pin as a
> i2c mux. In this case no signs of the error condition is recorded, it
> just doesn't work. So I concur it is not noise, it is sign of an
> erroneous situation which should be fixed, IMHO.
>
> The message makes it easy to locate the issue, if any. The message will
> not occur on a properly configured system.

It's noise. As we discussed with Alexandre (and I guess came to the
same page) that its consumer's business how to treat the error.

> Lets have the maintainer make the call.

...

> >> +static int microchip_sgpio_get_ports(struct sgpio_priv *priv)
> >> +{

> >> +}
> >
> > As per previous version comment, i.e. perhaps find an existing API for
> > this kind of parser or introduce a generic one.
>
> I fixed the use of OF api's - that was surely an oversight.
>
> I have searched for a suitable API without finding one. The closest
> thing was the parsing of "gpio-reserved-ranges" in gpiolib-of.c, but
> that was coded directly. So I think this might not be of general use.
>
> If it is, lets do that after the driver is merged.

I guess it will be a lot of benefit to have such API earlier than later.

-- 
With Best Regards,
Andy Shevchenko
