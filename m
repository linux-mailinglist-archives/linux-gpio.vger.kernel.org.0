Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2F852AEF8E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 12:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgKKLZb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 06:25:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgKKLZa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 06:25:30 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61F94C0613D1;
        Wed, 11 Nov 2020 03:25:30 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id w4so1232243pgg.13;
        Wed, 11 Nov 2020 03:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AmC6zqJnTuERZcKgju96W662jvY6IqjAAXRYJAiZy84=;
        b=DKS0zBZf5A6WZnjlzFnTohk26R3Ke3x/c/7S+5fLlwl1e+Lcy1jebSWUhffsK1ioGu
         5Ngd/Ocz9ElBdWqzFPPXq6m2M1RpHO6sz7mLyMtIbiFp2nD21LLPiJ3rhEUCYxNc4aR8
         PPfjLTGQEFG17k0wPMQXHAMKNQWECorHRT+bu8gkHUC/6SQ/3w5Ej/qevV3UKBH+GTRK
         Y7452bmI6uXM98D7p/hIHdkFSG4A/H+1ytegiezjkyvjzT0yauXVe5/La6ezPokouAty
         fd/lMD6yUkMPpjok8TCxINssqhnqCEIHuoJMyU2LG1Fn3CP57706DJOuFmuQ90eI9QBj
         tSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AmC6zqJnTuERZcKgju96W662jvY6IqjAAXRYJAiZy84=;
        b=V9JT2L2P5PLPGnqx8da+7/XMZvwAvwDv+uUf0jN2p9F8OgZGdv/42oMPQtU0yvCgl4
         7jsG7aLTPKaRnBVftyH4rFpJtofxE2zsEoDQaQtT/5td7l+baXcjMLWWqLqx9/FQd1eH
         khnZnWQQY0tJv553IAaRGN0U/ALb4v6mv9oUfAMYyIZAdQKDwQclp3KX8fv/Oy0fo8KD
         VjxZiwqR5bLVUQTdrLbgmWj3P4t0HPoogqVxj3RGPg3gYa8oqxi8S/gys+Vd5Ndos/jR
         QxnFIvx7qFeWCibECbskJ5fUqrd09nvBQ2SV466TtPw6/bmyf6Rele1R/hozAfoBRlys
         hkCw==
X-Gm-Message-State: AOAM531rbRuuvRB/n0oNgdIp0/Kn3HVQJPnChcRFR1DPlJ4n3/T46jd6
        W8cFNAqIe4t+b3pG4NxoHLyNjDK74D+uquQHElMW+fR9Q5iaeg==
X-Google-Smtp-Source: ABdhPJwLyg6aYFhRMr87O4OBI/F2U+vdfMliFKfXyNEdgYZDynu3xR1JpJY7Q9xdNNpS7gtKFX9Vk7Be5xEqXx84ygs=
X-Received: by 2002:a63:3e05:: with SMTP id l5mr20863250pga.74.1605093929944;
 Wed, 11 Nov 2020 03:25:29 -0800 (PST)
MIME-Version: 1.0
References: <20201109132643.457932-1-lars.povlsen@microchip.com>
 <20201109132643.457932-3-lars.povlsen@microchip.com> <CAHp75Vdfm7A5=Mi-LZ1sHJS5fSngypZQ50-rGQ7A6kD2kmVFTA@mail.gmail.com>
 <87361hfbwu.fsf@microchip.com> <CAHp75VfZ=hJvpYiAOz72yRpJTxLU6ZOo9hEz4BsBcgSwAcjCFA@mail.gmail.com>
 <87zh3oe0nr.fsf@microchip.com>
In-Reply-To: <87zh3oe0nr.fsf@microchip.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 11 Nov 2020 13:26:18 +0200
Message-ID: <CAHp75VfZRJuzvaYs-CKvxitfOxcNc-7j8MZA7FQvN0SQrPK6cw@mail.gmail.com>
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

On Wed, Nov 11, 2020 at 10:52 AM Lars Povlsen
<lars.povlsen@microchip.com> wrote:
> Andy Shevchenko writes:
> > On Tue, Nov 10, 2020 at 5:51 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
> >> > On Mon, Nov 9, 2020 at 3:27 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:

...

> >> >> +               return -EOPNOTSUPP;
> >> >
> >> > Are you sure? IIRC internally we are using ENOTSUPP.
> >> >
> >> > Couple of drivers seem to be wrongly using the other one.
> >>
> >> Checkpatch complains about ENOTSUPP:
> >>
> >> # ENOTSUPP is not a standard error code and should be avoided in new patches.
> >> # Folks usually mean EOPNOTSUPP (also called ENOTSUP), when they type ENOTSUPP.
> >
> > checkpatch is wrong if this is internal code and to me sounds like
> > it's not going out of the kernel.
> >
> > ...
>
> As it appears there are different opinions on this I'll let the pinctrl
> maintainer decide.

There are no other opinions.
Read description of struct pinconf_ops and fix the code.
checkpatch is simply wrong here.

> >> >> +                       err = -EOPNOTSUPP;
> >> >
> >> > Ditto.
> >>
> >> Ditto.
> >
> > Ditto.


-- 
With Best Regards,
Andy Shevchenko
