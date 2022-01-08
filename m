Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0FC9488300
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jan 2022 10:59:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231378AbiAHJ7w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 8 Jan 2022 04:59:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55464 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232554AbiAHJ7w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 8 Jan 2022 04:59:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641635990;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IG4BI1HCMmtDKqkztVagfn8epfWLMLfFaFS/CWFZclg=;
        b=OUu0hsDo+VXbdqXDDG3B6XKZwN5ag49RQ6iim6brMb0mMs8ohqv42/n9WQlq9Evgk303rt
        ljELwohGUHUz9DTNCW6Wug13NOPRoZBJJh+dxkeNkP5BkeNq7kX/RuYA8yk29HXdoIXNBw
        UtvWIbrrIAMH9awmRznyVPK5tmFpJ0w=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-4SCNlZhXNCecQ4RwfELD9Q-1; Sat, 08 Jan 2022 04:59:49 -0500
X-MC-Unique: 4SCNlZhXNCecQ4RwfELD9Q-1
Received: by mail-ed1-f72.google.com with SMTP id q15-20020a056402518f00b003f87abf9c37so6568547edd.15
        for <linux-gpio@vger.kernel.org>; Sat, 08 Jan 2022 01:59:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IG4BI1HCMmtDKqkztVagfn8epfWLMLfFaFS/CWFZclg=;
        b=zN7UzGfXC3VqIS3sjxsSLfC8uEAxpJ6AImL1bXapmNzEXXoVdgJUsLEABlqWb/7Crl
         Ajkp+fPNnCMRGRJn4mGgR4KtnBvqsNzvL5XBNpqkB2kl5BWYJp0+QeBYBrdeP/pllQ2c
         GdwxDfZIin4TqGmAHI9TPdYM08RmUBbjyfVGR0MZfUp4pV3KBABvOsPKNYjIzSF3/J6I
         Exx9KFXk/rjI3lDDRMaY7EiPJbEIJmkd+ImgS36szqc6ZgyuNI6B10JpBOpczWNHpalR
         yK3nvlYo/k8ayGO/0vT6Vo6TIN93mtdp3i08JiyxtOzVaAdLNYEIGI3NZZ0pWVz4PTOX
         iQ3w==
X-Gm-Message-State: AOAM5330xShPklv/A6TGt2kLkOXl6s72xZYro91EU1Gn5H/RzUfnFvpC
        lVpJYadUdNFKfQygCjWhx0ctAHnq4ktaQ675caRjISngIkh53+06mv8MqmnVnzNwa4QyBuzb2/r
        kXyZ9yfxM917p2xwGVJR5uw==
X-Received: by 2002:aa7:dc4c:: with SMTP id g12mr8639650edu.126.1641635988251;
        Sat, 08 Jan 2022 01:59:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCPBadjH7g+MaQsoASzh8+nWt/gbSU4Hzjrk8Ypz/mgwDp6K4G+tfOmDvA4Smg7CX2wOy2kQ==
X-Received: by 2002:aa7:dc4c:: with SMTP id g12mr8639639edu.126.1641635988076;
        Sat, 08 Jan 2022 01:59:48 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id u21sm519920eds.8.2022.01.08.01.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jan 2022 01:59:47 -0800 (PST)
Message-ID: <ba1e407a-76e4-5a81-1cf2-45766be35b2a@redhat.com>
Date:   Sat, 8 Jan 2022 10:59:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] pinctrl: baytrail: Clear direct_irq_en flag on broken
 configs
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <20220107234456.148389-1-hdegoede@redhat.com>
 <CAHp75Vfgpm7sROw_Ay8+tK0bhu-kCbS=O_kwax+i_vaH7H4wXA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vfgpm7sROw_Ay8+tK0bhu-kCbS=O_kwax+i_vaH7H4wXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 1/8/22 01:04, Andy Shevchenko wrote:
> 
> 
> On Saturday, January 8, 2022, Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> wrote:
> 
>     Some boards set the direct_irq_en flag in the conf0 register without
>     setting any of the trigger bits. The direct_irq_en flag just means that
>     the GPIO will send IRQs directly to the APIC instead of going through
>     the shared interrupt for the GPIO controller, in order for the pin to
>     be able to actually generate IRQs the trigger flags must still be set.
> 
>     So having the direct_irq_en flag set without any trigger flags is
>     non-sense, log a FW_BUG warning when encountering this and clear the flag
>     so that a driver can actually use the pin as IRQ through gpiod_to_irq().
> 
>     Specifically this allows the edt-ft5x06 touchscreen driver to use
>     INT33FC:02 pin 3 as touchscreen IRQ on the Nextbook Ares 8 tablet,
>     accompanied by the following new log message:
> 
>     byt_gpio INT33FC:02: [Firmware Bug]: pin 3: direct_irq_en set without trigger, clearing
> 
>     The new byt_direct_irq_sanity_check() function also checks that the
>     pin is actually appointed to one of the 16 direct-IRQs which the GPIO
>     controller supports and on success prints debug messages like these:
> 
>     byt_gpio INT33FC:02: Pin 0: uses direct IRQ 0 (APIC 67)
>     byt_gpio INT33FC:02: Pin 15: uses direct IRQ 2 (APIC 69)
> 
> 
> Should be these updated?

Yes the " (APIC 6x)" part is gone now. I will fix this for v4.

>     This is useful to figure out the GPIO pin belonging to ACPI
>     resources like this one: "Interrupt () { 0x00000043 }" or
>     the other way around.
> 
>     Suggested-by: Andy Shevchenko <andy@kernel.org <mailto:andy@kernel.org>>
>     Signed-off-by: Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>>
>     ---
>     Changes in v3:
>     - Rework code to check if the pin is assigned one of the 16 direct IRQs
>       (new code suggested-by Andy)
>     - Drop dev_dbg of the (likely?) APIC IRQ, only log the direct IRQ index
> 
> 
> Thinking about direct IRQ mappings I will look into the Datasheet next week.

Ok, I will wait for you to get back to me then before posting a v4.

>  
> 
>     Changes in v2:
>     - Add "FW_BUG pin %i: direct_irq_en set but no IRQ assigned, clearing" warning
>     ---
>      drivers/pinctrl/intel/pinctrl-baytrail.c | 31 ++++++++++++++++++++++--
>      1 file changed, 29 insertions(+), 2 deletions(-)
> 
>     diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
>     index 4c01333e1406..508b8a1cad1f 100644
>     --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
>     +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
>     @@ -32,6 +32,7 @@
>      #define BYT_VAL_REG            0x008
>      #define BYT_DFT_REG            0x00c
>      #define BYT_INT_STAT_REG       0x800
>     +#define BYT_DIRECT_IRQ_REG     0x980
>      #define BYT_DEBOUNCE_REG       0x9d0
> 
>      /* BYT_CONF0_REG register bits */
>     @@ -1465,6 +1466,27 @@ static void byt_gpio_irq_handler(struct irq_desc *desc)
>             chip->irq_eoi(data);
>      }
> 
>     +static bool byt_direct_irq_sanity_check(struct intel_pinctrl *vg, int pin, u32 value)
>     +{
>     +       u8 *match, direct_irq[16];
> 
> 
> Oops, I thought it’ 16 u32 you need to read and in u8 it’s 64, which one is correct?

There are 4 32 bit registers, the original code before your suggested
refactoring did 4 readl()s . And each register holds 4 pin-numbers, for
a total of maximum 16 direct IRQs.

This is in the public datasheets, except that the public datasheet does
not explain the meaning the byte (7 bits really, the 8th bit is reserved /
always 0). The datasheet simply calls the 7 bits per direct IRQ "Direct0" /
"Direct1", etc.

That these 7 bits are actually the pin number of the pin triggering the
direct IRQ is something which I figured out by looking at a number of
cases where both the APIC IRQ number as well as the used pin were known,
allowing me to figure out the mapping.

Regards,

Hans







>  
> 
>     +
>     +       if (!(value & (BYT_TRIG_POS | BYT_TRIG_NEG))) {
>     +               dev_warn(vg->dev,
>     +                        FW_BUG "pin %i: direct_irq_en set without trigger, clearing\n", pin);
>     +               return false;
>     +       }
>     +
>     +       memcpy_fromio(direct_irq, vg->communities->pad_regs + BYT_DIRECT_IRQ_REG,
>     +                     sizeof(direct_irq));
>     +       match = memchr(direct_irq, pin, sizeof(direct_irq));
>     +       if (match)
>     +               dev_dbg(vg->dev, "Pin %i: uses direct IRQ %ld\n", pin, match - direct_irq);
>     +       else
>     +               dev_warn(vg->dev, FW_BUG "pin %i: direct_irq_en set but no IRQ assigned, clearing\n", pin);
>     +
>     +       return match;
>     +}
>     +
>      static void byt_init_irq_valid_mask(struct gpio_chip *chip,
>                                         unsigned long *valid_mask,
>                                         unsigned int ngpios)
>     @@ -1492,8 +1514,13 @@ static void byt_init_irq_valid_mask(struct gpio_chip *chip,
>      
>                     value = readl(reg);
>                     if (value & BYT_DIRECT_IRQ_EN) {
>     -                       clear_bit(i, valid_mask);
>     -                       dev_dbg(vg->dev, "excluding GPIO %d from IRQ domain\n", i);
>     +                       if (byt_direct_irq_sanity_check(vg, i, value)) {
>     +                               clear_bit(i, valid_mask);
>     +                       } else {
>     +                               value &= ~(BYT_DIRECT_IRQ_EN | BYT_TRIG_POS |
>     +                                          BYT_TRIG_NEG | BYT_TRIG_LVL);
>     +                               writel(value, reg);
>     +                       }
>                     } else if ((value & BYT_PIN_MUX) == byt_get_gpio_mux(vg, i)) {
>                             byt_gpio_clear_triggering(vg, i);
>                             dev_dbg(vg->dev, "disabling GPIO %d\n", i);
>     -- 
>     2.33.1
> 
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

