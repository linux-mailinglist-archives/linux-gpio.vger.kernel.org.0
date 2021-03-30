Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0B1434E5A6
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 12:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbhC3KoJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 06:44:09 -0400
Received: from mail-lj1-f181.google.com ([209.85.208.181]:41639 "EHLO
        mail-lj1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231799AbhC3Knp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Mar 2021 06:43:45 -0400
Received: by mail-lj1-f181.google.com with SMTP id f26so19325952ljp.8;
        Tue, 30 Mar 2021 03:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=HqTyV9XHBTv3QvRJDRFCOrDcx5XVNhZVXJeUt2BzmEI=;
        b=j4oRRg66IVldA9GYY64pcz+xFC9trmXDztNaMzNmFuAT6WmQUfTAo6uNIqyxqRRt4g
         gnFCRL6d/QDbJlcHKZUTMXhmmzwZDm1XS6anYrTnmbp6Sl0yCQ6h8saiH285s3PeYXgv
         OMaGRkubsYrr/AyvqCZwB6Z1lTxpcre03HLdSYOnKYXmkC7w8CqV8WOHE+FJcSsvqfuw
         5+mHtRj1sqOUCEVw8OkPUP/O5NmsctbdbKibfLeXAAal2Sc7U0ITwh+IC84ctBd0wxz1
         sxDsZ96dCln+dAh5XAm03Rl7dWgDTLvVHzzxVRxPfwmfl8vD8QE89OVbFqsE4vgcDHzs
         G6Cw==
X-Gm-Message-State: AOAM530eAWOo/E12DkRCxXETs11Tgc3wGx5P9AoC4IRBevDL+7E4lvpY
        sZkWTGtZzUog/Z0lCRTBuT0=
X-Google-Smtp-Source: ABdhPJz8bIm9ChCGHvliotntoZpXjKgHYjcpRUuUGu4jj2VZvDhRcW5QHWe4lw4TJ3iYFCfuq5Gwkg==
X-Received: by 2002:a2e:3016:: with SMTP id w22mr21370133ljw.354.1617101023402;
        Tue, 30 Mar 2021 03:43:43 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id t13sm2753426ljk.47.2021.03.30.03.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 03:43:42 -0700 (PDT)
Message-ID: <d4e78b93a62d2882492b46942a927293bad81d66.camel@fi.rohmeurope.com>
Subject: Re: [PATCH v5 09/19] gpio: support ROHM BD71815 GPOs
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
In-Reply-To: <CAHp75VdRobc6jpFzAkd3U65BhiiNPLrF4qsnCKmsQBKMYbG4sg@mail.gmail.com>
References: <cover.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
         <118a6160880a212d20d0251f763cad295c741b4d.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
         <CAHp75VdRobc6jpFzAkd3U65BhiiNPLrF4qsnCKmsQBKMYbG4sg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Tue, 30 Mar 2021 13:43:38 +0300
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Tue, 2021-03-30 at 13:11 +0300, Andy Shevchenko wrote:
> On Mon, Mar 29, 2021 at 3:58 PM Matti Vaittinen
> <matti.vaittinen@fi.rohmeurope.com> wrote:
> > Support GPO(s) found from ROHM BD71815 power management IC. The IC
> > has two
> > GPO pins but only one is properly documented in data-sheet. The
> > driver
> 
> in the datasheet
> 
> > exposes by default only the documented GPO. The second GPO is
> > connected to
> > E5 pin and is marked as GND in data-sheet. Control for this
> > undocumented
> 
> in the datasheet
> 
> > pin can be enabled using a special DT property.
> > 
> > This driver is derived from work by Peter Yang <
> > yanglsh@embest-tech.com>
> > although not so much of original is left.
> 
> of the original
> 
> It seems you ignored my comments about the commit message. :-(

Sorry. I didn't do that by purpose. I forgot to reword commit.
Completely my bad.

> > +struct bd71815_gpio {
> > +       struct gpio_chip chip;
> > +       struct device *dev;
> 
> Wondering why you need this. Is it the same as chip.parent?
> 
> > +       struct regmap *regmap;
> > +};
> 
> ...
> 
> > +       int ret, bit;
> > +
> > +       bit = BIT(offset);
> 
> I prefer
>   int bit = BIT(offset);
>   int ret;
> but I think we already discussed that. OK.

Yes, we did.

> ...
> 
> > +       default:
> > +               break;
> > +       }
> > +       return -ENOTSUPP;
> 
> Here is a waste of line. Why break instead of direct return?

As we discussed last time, I do prefer functions which are supposed to
return a value, do so at the end of function. It's easier to read and
does not cause issues if someone changes switch to if-else or does
other modifications. IMO original is safer, reads better and does not
cause issues even with old compilers.

> ...
> 
> > +/* Template for GPIO chip */
> > +static const struct gpio_chip bd71815gpo_chip = {
> > +       .label                  = "bd71815",
> > +       .owner                  = THIS_MODULE,
> > +       .get                    = bd71815gpo_get,
> > +       .get_direction          = bd71815gpo_direction_get,
> > +       .set                    = bd71815gpo_set,
> > +       .set_config             = bd71815_gpio_set_config,
> > +       .can_sleep              = 1,
> 
> Strictly speaking this should be true (boolean type value).

true.

> 
> > +};
> 
> ...
> 
> > +#define BD71815_TWO_GPIOS      0x3UL
> > +#define BD71815_ONE_GPIO       0x1UL
> 
> Are they masks? Can you use BIT() and GENMASK()?

Yes and yes. I personally prefer 0x3 over GENMASK() as for me the value
3 as bitmask is perfectly readable. But I know others may prefer using
GENMASK(). So yes, your comment is valid.

> > +/*
> > + * Sigh. The BD71815 and BD71817 were originally designed to
> > support two GPO
> > + * pins. At some point it was noticed the second GPO pin which is
> > the E5 pin
> > + * located at the center of IC is hard to use on PCB (due to the
> > location). It
> > + * was decided to not promote this second GPO and pin is marked as
> > GND in the
> 
> and the pin
> 
> > + * datasheet. The functionality is still there though! I guess
> > driving a GPO
> > + * connected to the ground is a bad idea. Thus we do not support
> > it by default.
> > + * OTOH - the original driver written by colleagues at Embest did
> > support
> > + * controlling this second GPO. It is thus possible this is used
> > in some of the
> > + * products.
> > + *
> > + * This driver does not by default support configuring this second
> > GPO
> > + * but allows using it by providing the DT property
> > + * "rohm,enable-hidden-gpo".
> > + */
> 

I am sorry. I think I missed this one too.

> ...
> 
> > +       /*
> > +        * As writing of this the sysfs interface for GPIO control
> > does not
> > +        * respect the valid_mask. Do not trust it but rather set
> > the ngpios
> > +        * to 1 if "rohm,enable-hidden-gpo" is not given.
> > +        *
> > +        * This check can be removed later if the sysfs export is
> > fixed and
> > +        * if the fix is backported.
> 
> So, mark this comment with the TODO/FIXME keyword?

I haven't used to use keywords like TODO/FIXME. Now that I think of it
I've seen a few FIXME comments in sources so perhaps I should start
using them where appropriate. I don't think it makes a big difference
here though as I expect to be reworking this in near future (I'll
revise ROHM PMIC GPIO drivers for regmap_gpio usage during this
spring). I added this comment so I can revise this at that point.

> 
> > +        *
> > +        * For now it is safest to just set the ngpios though.
> > +        */
> 
> ...
> 
> > +       ret = devm_gpiochip_add_data(dev, &g->chip, g);
> > +       if (ret < 0) {
> > +               dev_err(dev, "could not register gpiochip, %d\n",
> > ret);
> > +               return ret;
> > +       }
> > +
> > +       return ret;
> 
> 

Sorry again. I somehow overlooked this comment as well.

> ...
> 
> > +static struct platform_driver gpo_bd71815_driver = {
> > +       .driver = {
> > +               .name   = "bd71815-gpo",
> > +               .owner  = THIS_MODULE,
> 
> Seems I commented on this. The module_*_driver() macro(s) will take
> care of it.

Yes you did. I missed this too. Sorry.

Andy, how fatal do you think these issues are? I did put these comments
on my 'things to clean-up' list.

If you don't see them as fatal, then I rather not resend whole series
of 19 patches just for these. I am anyway going to rework the ROHM PMIC
GPIO drivers which I have authored during the next couple of months for
regmap_gpio usage. This series has most of the acks except for the
regulator part - so I was about to suggest to Lee that perhaps he could
apply other but regulator stuff to MFD so I could squeeze the recipient
list and amount of patches in series. 

Best Regards
	Matti Vaittinen


