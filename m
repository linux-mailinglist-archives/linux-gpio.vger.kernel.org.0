Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03B5F57670A
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jul 2022 21:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbiGOTAj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jul 2022 15:00:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230395AbiGOTAi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Jul 2022 15:00:38 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25A3A509E4;
        Fri, 15 Jul 2022 12:00:37 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-31d7db3e6e5so55467587b3.11;
        Fri, 15 Jul 2022 12:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LSGYIWeSSCO085bPC4DkTjeA04Gpnvqi55NkID81Qow=;
        b=nXM286l0mrdDwNRH9hUxXBi3lihtF2KGYema6h3qU9hTtDlkCnD92fDDtGhvdLbgE8
         Ftd1hZWxbMk6zQ4YHfPw1NB7BMDsA6cOJPfoJklZ+k6UEwPizkewmMH9RAI7N8JN5cvu
         U4/RwYDeuUEajEIUxTnNRT+HSOr7MBbrIl+JlmF1/IyktAX+fUrm1stWCMmYRRyvxlaj
         xplQZWTZWYE2eFdei9kpl3g44LnkrjJGrtTWlr3d89ihXeYPEXKhJbKZjUV/q3wzXxtZ
         FX5uuVTsqeVOaGj8MW0wSX1wAQXuWhC6JAMOIqhfzZFuevAAbXx4XrcERs2b5730pWfv
         xO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LSGYIWeSSCO085bPC4DkTjeA04Gpnvqi55NkID81Qow=;
        b=8PuuoLub6tohBdIO2dYKYldz5WFgb/xPFm/fHH957u+ze9pbY140gOW7O8fO+78POT
         oqioHtQPBPp1FqsnFYYnV9iG6yIrRGA4fiHE8GujJosFAalO3EnKL1PzrGhUbLCi3nNm
         tK+8cvEPjyQDsCazNpx7tEphEo9HgOjsNBth9kWyUxh3HMQ0qe896ekE0oH69RzEk04g
         +zzyPqXTNnOBPG0UrctZPomyADrBddUFqwcpkG4X/lidS+SLp4V9CcSYl+2eBxfutFi6
         UlbwjPV5+oOjbTA7RDOHmqwK4pH/8DlRgIhpGGoG4V/gN86WS5jp4U13eRKErV/t0zs7
         qOBw==
X-Gm-Message-State: AJIora+8sp24VbXOhAMyOOxIdk/V+85xAM8qPmmtTzSCO/gS95IvrPKn
        N0GRRri8RhPNw7AvCGA0GKpwRKNZS1Em4o4oiPQ=
X-Google-Smtp-Source: AGRyM1smVkp8G2PBYT8iJRVvRGTm7wtFBemRGoxhHC8Mj29Dz7gwmqVRtN0lxOyDPT9iRReNi5YBZItDIyDjXGf8Vbw=
X-Received: by 2002:a81:54c1:0:b0:31d:ec18:fd5d with SMTP id
 i184-20020a8154c1000000b0031dec18fd5dmr7720291ywb.277.1657911635968; Fri, 15
 Jul 2022 12:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220715125138.378632-1-nuno.sa@analog.com> <20220715125138.378632-2-nuno.sa@analog.com>
In-Reply-To: <20220715125138.378632-2-nuno.sa@analog.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 15 Jul 2022 20:59:59 +0200
Message-ID: <CAHp75VfWWP__yyWhG2urwu=k9V1_afiOwD-hynOjSa0LUHg9Tg@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] input: keyboard: adp5588-keys: support gpi key
 events as 'gpio keys'
To:     =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 15, 2022 at 2:50 PM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
>
> This change replaces the support for GPIs as key event generators.
> Instead of reporting the events directly, we add a gpio based irqchip
> so that these events can be consumed by keys defined in the gpio-keys
> driver (as it's goal is indeed for keys on GPIOs capable of generating
> interrupts). With this, the gpio-adp5588 driver can also be dropped.
>
> The basic idea is that all the pins that are not being used as part of
> the keymap matrix can be possibly requested as GPIOs by gpio-keys
> (it's also fine to use these pins as plain interrupts though that's not
> really the point).
>
> Since the gpiochip now also has irqchip capabilities, we should only
> remove it after we free the device interrupt (otherwise we could, in
> theory, be handling GPIs interrupts while the gpiochip is concurrently
> removed). Thus the call 'adp5588_gpio_add()' is moved and since the
> setup phase also needs to come before making the gpios visible, we also
> need to move 'adp5588_setup()'.
>
> While at it, always select GPIOLIB so that we don't need to use #ifdef
> guards.

...

> +static void adp5588_irq_mask(struct irq_data *d)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct adp5588_kpad *kpad =3D gpiochip_get_data(gc);

> +       unsigned long real_irq =3D kpad->gpiomap[d->hwirq];

There is a helper to retrieve hwirq from the IRQ chip data.

> +       kpad->irq_mask[ADP5588_BANK(real_irq)] &=3D ~ADP5588_BIT(real_irq=
);
> +       gpiochip_disable_irq(gc, d->hwirq);
> +}

...

> +static void adp5588_irq_unmask(struct irq_data *d)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct adp5588_kpad *kpad =3D gpiochip_get_data(gc);
> +       unsigned long real_irq =3D kpad->gpiomap[d->hwirq];

Ditto.

> +       gpiochip_enable_irq(gc, d->hwirq);
> +       kpad->irq_mask[ADP5588_BANK(real_irq)] |=3D ADP5588_BIT(real_irq)=
;
> +}

...

> +static int adp5588_gpiomap_get_hwirq(struct device *dev, const u8 *map,
> +                                    unsigned int gpio, unsigned int ngpi=
os)
>  {

> +       unsigned int hwirq;
> +
> +       for (hwirq =3D 0; hwirq < ngpios; hwirq++)
> +               if (map[hwirq] =3D=3D gpio)
> +                       return hwirq;

I'm sorry if I already asked, but can irq_valid_mask be helpful here?

> +       /* should never happen */
> +       dev_warn_ratelimited(dev, "could not find the hwirq for gpio(%u)\=
n", gpio);
> +
> +       return -ENOENT;
> +}

...

> +       int hwirq;
> +
> +       hwirq =3D adp5588_gpiomap_get_hwirq(&client->dev, kpad->gpiomap,
> +                                         gpio, kpad->gc.ngpio);
> +       if (hwirq < 0) {
> +               dev_err(&client->dev, "Could not get hwirq for key(%u)\n"=
, key_val);
> +               return;
> +       }

Instead of having it signed, can you use INVALID_HWIRQ definition?

...

> +       irq =3D irq_find_mapping(kpad->gc.irq.domain, hwirq);
> +       if (irq <=3D 0)

'<' ? How is it possible?

> +               return;
> +
> +       desc =3D irq_get_irq_data(irq);
> +       if (!desc) {
> +               dev_err(&client->dev, "Could not get irq(%u) data\n", irq=
);
> +               return;
> +       }
> +
> +       irq_type =3D irqd_get_trigger_type(desc);

'desc' is quite a confusing name for IRQ chip data! Please rename (we
have IRQ descriptor and it's not the IRQ chip data).

--=20
With Best Regards,
Andy Shevchenko
