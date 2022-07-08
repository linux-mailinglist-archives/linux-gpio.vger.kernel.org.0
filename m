Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 987E956BB99
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 16:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236808AbiGHOTB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 10:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236547AbiGHOTB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 10:19:01 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC4E222A6;
        Fri,  8 Jul 2022 07:19:00 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id g4so38049243ybg.9;
        Fri, 08 Jul 2022 07:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uZeUkOUfjwvKba9A+T76G5aOzlLwQACY9yD56IUeySA=;
        b=Xi6DLedoGGbKoSmL8unEscC2KuLaZnV93ZuueMyQHxaaWdLxXOHfx+QQy9ls/VaB+/
         8qnfQKIV6hPBmm7FwyXfkEWiOxYvCqG72sx7ABOR1l+aHIxb463xt954ydUlVsUVuify
         o7ZGtNW3KaeBfd5oZIWuVotqfmS7quwu5NZiMz37YDgvr38NDWhf52OxhuXOJqPWnuld
         yFHF7Mv7AmN5sn86Q2EdDuTBXELpWjkonVhXmZQMGevMvhRf86dBtPW/D4hqC0Ynyste
         AGmCMxC6jf8VTX1y7OADGcfaHyYGz5OJlPuaccBiXiC5eR6+w1qR7pkz0Ns4ETZpgG/e
         msVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uZeUkOUfjwvKba9A+T76G5aOzlLwQACY9yD56IUeySA=;
        b=zoGhEh+WPKCC0EZHqNcnwizyOdIEfR6i6/7izA+3sXKBdljJGzMmvAQvejuB0qoAsM
         Tf/DcrAK2tDNjrClBd9F9agaFlrvgu3N0vk01NkW51O29n3hbRSYqJk7ytzXLSwor1Fy
         IX+YMH3318pMWEgXkIEKEYGZrMZHsW0uQuaw6ycfS+oTlCJQlNgz8+C79KVnaQCLxtC1
         YiSBFgCy6uUXOxUQzrvdUjuA/srHhfmhthzMdunYM4Q4W32KZ/ZJQgiHFFvkQ48UrrQ8
         TPquEWaCkJ2H9pILkVdC7HzQj+2gVbiqNYBsagdv6XiBA9x52OsoAgito8yOH6429Fsv
         qtwQ==
X-Gm-Message-State: AJIora9zLfzNQiTxN+yG4fzbGCPjzZnCqeNmvwr7xzfPrfw5JcR9QpfB
        WYQQkULs0Hqu/axU0aE5HnApyU6TMzTEgAwpPuA=
X-Google-Smtp-Source: AGRyM1uanGfioDlH+joftvHrYTRttD4wwNoaCHWFVXjMBQCJPHRyYXU+RZvwMbJBDv3vnRfmdjS+uVSQaZmRk2AH+5U=
X-Received: by 2002:a05:6902:c4:b0:64b:4677:331b with SMTP id
 i4-20020a05690200c400b0064b4677331bmr3764863ybs.93.1657289939122; Fri, 08 Jul
 2022 07:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220708093448.42617-1-nuno.sa@analog.com> <20220708093448.42617-2-nuno.sa@analog.com>
In-Reply-To: <20220708093448.42617-2-nuno.sa@analog.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 8 Jul 2022 16:18:22 +0200
Message-ID: <CAHp75VcJErVteT0P7=HhHB+c0UWFP8R5rc6u==Zf4p5JS4c=6A@mail.gmail.com>
Subject: Re: [PATCH 01/10] input: keyboard: adp5588-keys: support gpi key
 events as 'gpio keys'
To:     =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 8, 2022 at 11:36 AM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
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

>         u8 dat_out[3];
>         u8 dir[3];

> +       u8 int_en[3];
> +       u8 irq_mask[3];

Wondering why these can't be converted to natural bitmaps. (See
gpio-pca953x as an example).

...

> +static void adp5588_irq_mask(struct irq_data *d)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct adp5588_kpad *kpad =3D gpiochip_get_data(gc);
> +       unsigned long real_irq =3D kpad->gpiomap[d->hwirq];
> +
> +       kpad->irq_mask[ADP5588_BANK(real_irq)] &=3D ~ADP5588_BIT(real_irq=
);
> +}
> +
> +static void adp5588_irq_unmask(struct irq_data *d)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct adp5588_kpad *kpad =3D gpiochip_get_data(gc);
> +       unsigned long real_irq =3D kpad->gpiomap[d->hwirq];
> +
> +       kpad->irq_mask[ADP5588_BANK(real_irq)] |=3D ADP5588_BIT(real_irq)=
;
> +}

Please follow the suitable example from here:
https://www.kernel.org/doc/html/latest/driver-api/gpio/driver.html#infrastr=
ucture-helpers-for-gpio-irqchips

...

> +       kpad->gc.parent =3D &kpad->client->dev;

> +       kpad->gc.of_node =3D kpad->client->dev.of_node;

We are going to remove of_node from GPIO. Moreover the parent device
and its node is a duplication, just drop the latter and GPIO library
will take care of it.

...

> +       irq_chip->name =3D "adp5588";
> +       irq_chip->irq_mask =3D adp5588_irq_mask;
> +       irq_chip->irq_unmask =3D adp5588_irq_unmask;
> +       irq_chip->irq_bus_lock =3D adp5588_irq_bus_lock;
> +       irq_chip->irq_bus_sync_unlock =3D adp5588_irq_bus_sync_unlock;
> +       irq_chip->irq_set_type =3D adp5588_irq_set_type;
> +       irq_chip->flags =3D IRQCHIP_SKIP_SET_WAKE;
> +       girq =3D &kpad->gc.irq;
> +       girq->chip =3D irq_chip;

> +       girq->handler =3D handle_simple_irq;

By default it should be handle_bad_irq() and locked in the ->irq_set_type()=
.

> +       girq->threaded =3D true;

See documentation above.

...

> +static int adp5588_gpiomap_get_hwirq(const u8 *map, unsigned int gpio,
> +                                    unsigned int ngpios)
>  {
> -       return 0;
> +       unsigned int hwirq;
> +
> +       for (hwirq =3D 0; hwirq < ngpios; hwirq++)
> +               if (map[hwirq] =3D=3D gpio)
> +                       return hwirq;

> +       /* should never happen */

Then why it's here?

> +       WARN_ON_ONCE(hwirq =3D=3D ngpios);
> +
> +       return -ENOENT;
> +}

I don't know this code, can you summarize why this additional mapping is ne=
eded?

...

> +static void adp5588_gpio_irq_handle(struct adp5588_kpad *kpad, int key_v=
al,
> +                                   int key_press)
> +{
> +       unsigned int irq, gpio =3D key_val - GPI_PIN_BASE, irq_type, hwir=
q;
> +       struct i2c_client *client =3D kpad->client;
> +       struct irq_data *desc;
> +
> +       hwirq =3D adp5588_gpiomap_get_hwirq(kpad->gpiomap, gpio, kpad->gc=
.ngpio);
> +       if (hwirq < 0) {
> +               dev_err(&client->dev, "Could not get hwirq for key(%u)\n"=
, key_val);
> +               return;
> +       }
> +
> +       irq =3D irq_find_mapping(kpad->gc.irq.domain, hwirq);
> +       if (irq <=3D 0)
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
> +
> +       /*
> +        * Default is active low which means key_press is asserted on
> +        * the falling edge.
> +        */
> +       if ((irq_type & IRQ_TYPE_EDGE_RISING && !key_press) ||
> +           (irq_type & IRQ_TYPE_EDGE_FALLING && key_press))

This is dup from ->irq_set_type(). Or how this can be not like this?

> +               handle_nested_irq(irq);

There is new helpers I believe for getting domain and handle an IRQ.
Grep for the recent (one-two last cycles) changes in the GPIO drivers.

>  }

--=20
With Best Regards,
Andy Shevchenko
