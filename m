Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 539E934A829
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Mar 2021 14:34:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbhCZNdx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Mar 2021 09:33:53 -0400
Received: from mail-lf1-f42.google.com ([209.85.167.42]:35381 "EHLO
        mail-lf1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbhCZNdq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Mar 2021 09:33:46 -0400
Received: by mail-lf1-f42.google.com with SMTP id 75so7724390lfa.2;
        Fri, 26 Mar 2021 06:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=6L0iVFEX9yO7pm5mzQ9o4ynjIkd8dmTYsKzvYFQIVDE=;
        b=M+gbP8GivEID9prYajARFo60euvB4TyX5km71cDWNZn90jt91po/JaslLRUOQtWDE2
         S/RCvCTfdQPYJzO4M1v2Q6OERR4+Dj2UQvAQAQtuEyHn6FxzMhfeNwk3gc786gL4oca3
         29a+xLirjV9iwHV1/OeY6ufZZuMBVR3MEEyPfU/ub35x7MxNXluKiSgTSriCiFprLagG
         UoSOAeIn24OaOj0fuOg99DymBcMlrK2QCSAJwa+MI2SfPibV8NjhsuTnml4mpWCN+lFr
         3ne4jgFgiEuNhuUP1lr953Okya8HLkzpsYd24rOfMF98MuKSMST+rcrT4rAcWHyVS574
         yugQ==
X-Gm-Message-State: AOAM530DICB9lQPYbhR3YfbYsIeGkU2kbCyEqJJrvVXUP+fHVWxv3zS3
        5H1n4nsDfg2nEEEfib9GsO8=
X-Google-Smtp-Source: ABdhPJzRiqdsfCtduyTTdqTzpFlCY4a7efT17ikR11p9/C77PAl86stoXG4xK7TbsoSzO0AzapLOmA==
X-Received: by 2002:a05:6512:1191:: with SMTP id g17mr8081119lfr.87.1616765624254;
        Fri, 26 Mar 2021 06:33:44 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id l12sm1168804ljg.39.2021.03.26.06.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 06:33:43 -0700 (PDT)
Message-ID: <8853471c798ce3dbbbd939c05a58fa5ce40be605.camel@fi.rohmeurope.com>
Subject: Re: [PATCH v4 09/16] gpio: support ROHM BD71815 GPOs
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
In-Reply-To: <CAHp75VdxRkX15Ts+L1UJdXbpoaTu3Ue6o9o=Yh2cRCXCEi1jwA@mail.gmail.com>
References: <cover.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
         <b2164e5965218f270e17bf29e00ad5c5a0b54bcf.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
         <CAHp75VdxRkX15Ts+L1UJdXbpoaTu3Ue6o9o=Yh2cRCXCEi1jwA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Fri, 26 Mar 2021 15:33:29 +0200
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Fri, 2021-03-26 at 13:26 +0200, Andy Shevchenko wrote:
> On Wed, Mar 24, 2021 at 12:20 PM Matti Vaittinen
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
> Below my comments independently on the fact if this driver will be
> completely rewritten, consider them as a good practice for your new
> contribution.

Thank you for the review. I appreciate your help although I don't
always agree necessity regarding all of the styling suggestions :) I
did not respond here to the suggestions I agreed with.

As Linus pointed out, few of the ROHM drivers should be revised for
regmap_gpio usage in near future. I will definitely go through all the
comments at that point if there is no reason to respin series earlier.


> +       int val;
> > +
> > +       ret = regmap_read(bd71815->regmap, BD71815_REG_GPO, &val);
> > +       if (ret)
> > +               return ret;
> > +       return (val >> offset) & 1;
> 
> !!(val & BIT(offset)) can also work and be in alignment with the
> below code.

This is an opinion, but to me !!(val & BIT(offset)) looks more
confusing. I don't see the benefit from the change.

> 
> ...
> 
> > +       if (!bd71815->e5_pin_is_gpo && offset)
> > +               return;
> 
> I wonder if you can use valid_mask instead of this.

Do you mean re-naming the e5_pin_is_gpo to valid_mask? Or do you mean
some GPIO framework internal feature allowing to define valid pins? (If
my memory serves me right one can set invalid pins from DT - but by
default all pins are valid and here we want to invalidate a pin by
default). For renaming I don't see the value - if internal feature can
be used then there may be value. Thanks for the pointer, I'll look what
I find.

> 
> ...
> 
> > +       bit = BIT(offset);
> 
> Can be moved to the definition block.

I don't like doing the assignment before we check if the operation is
valid. And, making assignments which are not plain constants in
declaration make reading the declaration much harder.

> ...
> 
> > +       default:
> > +               break;
> > +       }
> > +       return -EOPNOTSUPP;
> 
> You may return directly from default.

I think there used to be compilers which didn't like having the return
inside a block - even if the block was a default. I also prefer seeing
return at the end of function which should return a value.

> 
> ...
> 
> > +       int ret;
> > +       struct bd71815_gpio *g;
> > +       struct device *dev;
> > +       struct device *parent;
> 
> Reversed xmas tree order.

What is the added value here? I understand alphabetical sorting - it
helps looking if particular entry is included. I also understand type-
based sorting. But reverse Xmas tree? I thin I have heard it eases
reading declarations - which is questionable in this case. Double so
when you also suggest moving assignments to declaration block which
makes it _much_ harder to read? I won't change this unless it is
mandated by the maintainers.

> 
> ...
> 
> > +       /*
> > +        * Bind devm lifetime to this platform device => use dev
> > for devm.
> > +        * also the prints should originate from this device.
> > +        */
> 
> Why is this comment needed?
> 
> 
> > +       /* The device-tree and regmap come from MFD => use parent
> > for that */
> 
> Why do you need this comment?
> 
> > +       parent = dev->parent;

It is not always obvious (especially for someone not reading MFD driver
code frequently) why we use parent device for some things and the
device being probed to some other stuff. Typically this is not needed
if the device is not MFD sub-device. And again, the comments in the
middle of declaration block look confusing to me. I think removing
comments and moving these to declaration make readability _much_ worse.

> ...
> 
> > +       g->e5_pin_is_gpo = of_property_read_bool(parent->of_node,
> > +                                                "rohm,enable-
> > hidden-gpo");
> 
> You may use device_property_read_bool().

Out of the curiosity - is there any other reason but ACPI? ACPI support
can be added later if needed. I still think you're correct. This is
definitely one of the points that fall in the category of things "I
must consider as a good practice for (my) new contribution". So I try
to keep this in mind in the future.

> > +       g->chip.of_node = parent->of_node;
> 
> Redundant. GPIO library does it for you and even better.

So I can nowadays just omit this? Thanks!

> > +       ret = devm_gpiochip_add_data(dev, &g->chip, g);
> > +       if (ret < 0) {
> > +               dev_err(dev, "could not register gpiochip, %d\n",
> > ret);
> > +               return ret;
> > +       }
> > +
> > +       return ret;
> 
> It's as simply as
> return devm_gpiochip_add_data(...);

Hm. I think you're right. The print does not add much value here.
Thanks.

> 
> ...
> 
> > +static const struct platform_device_id bd7181x_gpo_id[] = {
> > +       { "bd71815-gpo" },
> > +       { },
> 
> No comma for the terminator line.
> 
> > +};
> > +MODULE_DEVICE_TABLE(platform, bd7181x_gpo_id);
> 
> Why do you need this ID table exactly?
> You have the same name as in the platform driver structure below.

This driver was also supporting another IC (BD71817) - but as far as I
know the BD71817 is no longer used too much so I dropped it. The ID
table was left with this one entry only. I will see if this is any more
needed. Thanks.

> 
> > +static struct platform_driver gpo_bd71815_driver = {
> > +       .driver = {
> > +               .name   = "bd71815-gpo",
> > +               .owner  = THIS_MODULE,
> 
> This is done by module_*_driver() macros, drop it.
> 
> > +       },
> > +       .probe          = gpo_bd71815_probe,
> > +       .id_table       = bd7181x_gpo_id,
> > +};
> > +
> 
> > +MODULE_AUTHOR("Peter Yang <yanglsh@embest-tech.com>");
> 
> And I don't see a match with a committer/submitter/co-developer/etc.
> Please, make corresponding fields and this macro (or macros, you may
> have as many MODULE_AUTHOR() entries as developers of the code)
> aligned to each other.

I never knew there could be many MODULE_AUTHOR() entries. Thanks for
pointing it out.

> 
> > +MODULE_DESCRIPTION("GPO interface for BD71815");
> > +MODULE_LICENSE("GPL");

Best Regards
	--Matti

