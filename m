Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 884063B4381
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jun 2021 14:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbhFYMnd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Jun 2021 08:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbhFYMnc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Jun 2021 08:43:32 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1D73C061574;
        Fri, 25 Jun 2021 05:41:11 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id l8so1677975wry.13;
        Fri, 25 Jun 2021 05:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MMzciWS+DM64YQwDybRbP+L7hkHJskpzRP2883Q5zbk=;
        b=D93b4UHLGgWjY/D5h/7jJuxgjxhOfYuY/fuYHmvBc0BeqvOax4NFKJJNE4Vnr/O4EP
         szeLwR/cR98ebCiXFHMnlNQgs4S7JQ6iNwVWil6qi3+8VkYeR/oyac9ebFbVxfEW+fOJ
         54MZKbcPsyh8ek6GHD6jLkrZIZDNgQ5ncqJY6zyQ1Bo9c5CwbyyJ+5RzpHBFwavXYnzZ
         v/Bik5vjsaCWXjkQj8pdV1NBRYywXHnD8PAkMVe2SWnT9gNZ+fxN+s+thohqMTcb9/ir
         ItRNqYA3uE/B8J0sFUKJjphAsu8ip8S/vWd96EvskGZDR8oSkLYojJ9aFur08xGOLCrI
         WfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MMzciWS+DM64YQwDybRbP+L7hkHJskpzRP2883Q5zbk=;
        b=sx8o6EaJi+PWz+/kG/FDrgR8PqlYxz4pnSUEic0f4aJs/4wMwEBvDMeKjzXfCjlL4s
         No/hLPukcgHkD7EMv9SjHK6Y3TlbKzWPbirml9CcaGPSH4KPcaZKhJnzKnFsQcQ4rT2G
         0ubKodIUSJQh6wEvdvxQEljFmOjlr+jBr5gK+gEsjl9vBqN79PrgF6qXJHi34W4IBiMV
         G6ZfKQwgLI5OJcefOKggMIOihyLL/pLhdjZGRdF7hjAflitvJ5wGijMj/yvOWoUoBNFK
         Mw+fnRWNXTCyq+1kRkWdLZgwnLc3ibur/79MvUuLTdKxns7Gb9gV3dItWl16Sy9YegK2
         Vrzw==
X-Gm-Message-State: AOAM5339PL/HPf2vuxibDLpMF+SWxBrYUWl+uDjH9hBxDRf3TfowM3U1
        gdJhT9Bb3z/HxB0DM6ijBgWBw7FM/8S6rLK2Bpg=
X-Google-Smtp-Source: ABdhPJxdWr+242eUq2MTRnBBjOQ2wEZUEhJg0M1wRbXCJzdfrnQAGNgpmHKs6rVI39BzdpXPX39+BBqZtVBf4StJLQo=
X-Received: by 2002:a5d:6d81:: with SMTP id l1mr10703175wrs.282.1624624870440;
 Fri, 25 Jun 2021 05:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210619073551.13703-1-sergio.paracuellos@gmail.com> <CAMpxmJUvMTevyhkvq0YXg5d=G5qBzhi0mz0w0TjUuWCCvnnRCQ@mail.gmail.com>
In-Reply-To: <CAMpxmJUvMTevyhkvq0YXg5d=G5qBzhi0mz0w0TjUuWCCvnnRCQ@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Fri, 25 Jun 2021 14:40:56 +0200
Message-ID: <CAMhs-H-teyG7OE2cugrGFoxothf_ZQwX_jKR+9mpfu6e_FAgmA@mail.gmail.com>
Subject: Re: [PATCH] gpio: mt7621: support gpio-line-names property
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        John Thomson <git@johnthomson.fastmail.com.au>,
        LKML <linux-kernel@vger.kernel.org>, NeilBrown <neil@brown.name>,
        =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
        Nicholas Mc Guire <hofrat@osadl.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On Fri, Jun 25, 2021 at 1:53 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Sat, Jun 19, 2021 at 9:35 AM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> >
> > The default handling of the gpio-line-names property by the
> > gpiolib-of implementation does not work with the multiple
> > gpiochip banks per device structure used by the gpio-mt7621
> > driver.
> >
> > This commit adds driver level support for the device tree
> > property so that GPIO lines can be assigned friendly names.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> > Hi,
> >
> > This driver has three gpiochips with 32 gpios each. Core implmentation
> > got gpio's repeated along each gpio chip if chip.names is not assigned.
> > To avoid this behaviour driver will set this names as empty or
> > with desired friendly line names. Consider the following sample with
> > minimal entries for the first chip with this patch changes applied:
> >
> > &gpio {
> >     gpio-line-names = "", "", "", "",
> >                       "", "", "SFP LOS", "extcon port5 PoE compat",
> >                       "SFP module def0", "LED blue SFP", "SFP tx disable", "",
> >                       "switch USB power", "mode", "", "buzzer",
> >                       "LED blue pwr", "switch port5 PoE out", "reset";
> > };
> >
> > gpioinfo
> > gpiochip0 - 32 lines:
> >   line   0:      unnamed       unused  output  active-high
> >   line   1:      unnamed       unused   input  active-high
> >   line   2:      unnamed       unused   input  active-high
> >   line   3:      unnamed       unused   input  active-high
> >   line   4:      unnamed       unused   input  active-high
> >   line   5:      unnamed       unused   input  active-high
> >   line   6:    "SFP LOS"        "los"   input  active-high [used]
> >   line   7: "extcon port5 PoE compat" unused input active-high
> >   line   8: "SFP module def0" "mod-def0" input active-low [used]
> >   line   9: "LED blue SFP" "blue:sfp" output active-high [used]
> >   line  10: "SFP tx disable" "tx-disable" output active-high [used]
> >   line  11:      unnamed       unused  output  active-high
> >   line  12: "switch USB power" "usb_power" output active-high [used]
> >   line  13:       "mode"       "mode"   input  active-high [used]
> >   line  14:      unnamed       unused   input  active-high
> >   line  15:     "buzzer"     "buzzer"  output  active-high [used]
> >   line  16: "LED blue pwr" "blue:pwr" output active-high [used]
> >   line  17: "switch port5 PoE out" "sysfs" input active-high [used]
> >   line  18:      "reset"      "reset"   input  active-high [used]
> >   line  19:      unnamed       unused   input  active-high
> >   line  20:      unnamed       unused   input  active-high
> >   line  21:      unnamed       unused   input  active-high
> >   line  22:      unnamed       unused   input  active-high
> >   line  23:      unnamed       unused   input  active-high
> >   line  24:      unnamed       unused   input  active-high
> >   line  25:      unnamed       unused   input  active-high
> >   line  26:      unnamed       unused   input  active-high
> >   line  27:      unnamed       unused   input  active-high
> >   line  28:      unnamed       unused   input  active-high
> >   line  29:      unnamed       unused   input  active-high
> >   line  30:      unnamed       unused   input  active-high
> >   line  31:      unnamed       unused   input  active-high
> > gpiochip1 - 32 lines:
> >   line   0:      unnamed       unused   input  active-high
> >   line   1:      unnamed       unused   input  active-high
> >   ...
> >   line  31:      unnamed       unused   input  active-high
> > gpiochip2 - 32 lines:
> >   line   0:      unnamed       unused   input  active-high
> >   line   1:      unnamed       unused   input  active-high
> >   ...
> >   line  31:      unnamed       unused   input  active-high
> >
> > To avoid gpiochip1 and gpiochip2 entries repeated with this
> > minimal lines definition change, we assign empty reserved
> > 'names' in driver code.
> >
> > Note that we also don't want to to prevent the driver from
> > succeeding at probe due to an error in the gpio-line-names
> > property and the ENODATA error is considered a valid result
> > to terminate any further labeling so there is no need for
> > an error message in that case. Other error results are
> > unexpected so an error message indicating the consequence
> > of the error is appropriate here.
> >
> > Thanks in advance for your time.
> >
> > Best regards,
> >     Sergio Paracuellos
> >
> >  drivers/gpio/gpio-mt7621.c | 41 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >
> > diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
> > index 82fb20dca53a..b5f8fd8e928a 100644
> > --- a/drivers/gpio/gpio-mt7621.c
> > +++ b/drivers/gpio/gpio-mt7621.c
> > @@ -206,6 +206,45 @@ mediatek_gpio_xlate(struct gpio_chip *chip,
> >         return gpio % MTK_BANK_WIDTH;
> >  }
> >
> > +static void
> > +mediatek_gpio_set_names(struct device *dev, struct mtk_gc *rg)
> > +{
> > +       struct device_node *np = dev->of_node;
> > +       const char **names;
> > +       int nstrings, base;
> > +       unsigned int i;
> > +
> > +       names = devm_kcalloc(dev, MTK_BANK_WIDTH, sizeof(*names),
> > +                            GFP_KERNEL);
> > +       if (!names)
> > +               return;
>
> While the ENODATA bit makes sense, not failing after an OOM in a
> driver is wrong. Please return the error code here.

Ok, I see your point. I didn't want the driver to fail in its setup
completion because of this property being failing but what you are
saying makes sense, so I will return -ENOMEM for this case and check
for it in 'mediatek_gpio_bank_probe'. Will send v2 with these changes
hopefully tomorrow.

Thanks,
    Sergio Paracuellos

>
> Bartosz
>
> > +
> > +       base = rg->bank * MTK_BANK_WIDTH;
> > +       nstrings = of_property_count_strings(np, "gpio-line-names");
> > +       if (nstrings <= base)
> > +               goto assign_names;
> > +
> > +       for (i = 0; i < MTK_BANK_WIDTH; i++) {
> > +               const char *name;
> > +               int ret;
> > +
> > +               ret = of_property_read_string_index(np, "gpio-line-names",
> > +                                                   base + i, &name);
> > +               if (ret) {
> > +                       if (ret != -ENODATA)
> > +                               dev_err(dev, "unable to name line %d: %d\n",
> > +                                       base + i, ret);
> > +                       break;
> > +               }
> > +
> > +               if (*name)
> > +                       names[i] = name;
> > +       }
> > +
> > +assign_names:
> > +       rg->chip.names = names;
> > +}
> > +
> >  static int
> >  mediatek_gpio_bank_probe(struct device *dev,
> >                          struct device_node *node, int bank)
> > @@ -241,6 +280,8 @@ mediatek_gpio_bank_probe(struct device *dev,
> >         if (!rg->chip.label)
> >                 return -ENOMEM;
> >
> > +       mediatek_gpio_set_names(dev, rg);
> > +
> >         rg->irq_chip.name = dev_name(dev);
> >         rg->irq_chip.parent_device = dev;
> >         rg->irq_chip.irq_unmask = mediatek_gpio_irq_unmask;
> > --
> > 2.25.1
> >
