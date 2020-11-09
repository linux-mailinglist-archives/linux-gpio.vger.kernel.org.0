Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9626D2ABE69
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 15:16:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729848AbgKIOQw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 09:16:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729776AbgKIOQw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 09:16:52 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1889CC0613CF;
        Mon,  9 Nov 2020 06:16:52 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id v12so8271123pfm.13;
        Mon, 09 Nov 2020 06:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OY3GShCv/GIiZrSWGxzeCb9TldPMc/fjpu5kyT3p5iI=;
        b=LN1HW4MpaG1ZX3dHpeBg2ZJNBU/OWXN4fB+TJSlha+uB0BXv+HmxQUQ+JCkH+VaVBe
         NTq5lqZ3suuGEuPam/mm4IUfEHYciufY2YmVLpEDmzrtxdLAToLYVYQoLlXvew97ooEy
         ybVDQs3BW/T9RCLoWWpaQOC3+XG8dA86rLiypl63/kKfxVkhZmGIvzvzK5MBAmqF05Gi
         kHFREyHR2E2Oiy9bdp1Jm+BtnR4rQlJng+zd4EK+MOb2iF4lmdLYb1wYH/tBHEiq/0Kx
         8/thBNlBKarCt7IZN/BHczO34q35nDC5SXpfNGPmQNkPZzWL9O+ZXWTW3tkIYqdrSm30
         kWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OY3GShCv/GIiZrSWGxzeCb9TldPMc/fjpu5kyT3p5iI=;
        b=JNgBJooJEwE3mCKovfT35r+h7ljhWHprQj4lIsE4GfHodqMRM2FadhXMljpTtvS8xV
         UzQvpIZc3SsNMyLilpVtxWJZ8RHsKI/jC5WJKxXPmA+520xbn7g9thOdm1vIT2OLnjEI
         z0/hVc6TyIynqjO9zQI5tJs0GtLZuFBKzeJrZzCsFHbWNjZl87MLjH0Gb6Mm/pDLgzJr
         MgbDqK9BQ4AbLNon3RTgNQrtD+Osg7TyWTgGN7zNakTcl36C50SXLlRnzU3bwdpGT9P0
         E7J3dvcIBEagqxdkYiH3/5A7n9MVSPfa2cefzpdhVuOK0Smzlg1hcfrPuGjvUuVf8rcP
         hfvQ==
X-Gm-Message-State: AOAM533Qugztb8evxv42l0suSVqjX62v3PF5BQ4/iIHE1UmEBbEHQzMn
        CAJCiKVYVD97NEZjWGRKi6gqAYcu94udzkkDmuA=
X-Google-Smtp-Source: ABdhPJxjccFXpvt+qUGlhERrgi1QZvqYqDmEuQkhFQXXcObfyxZGdk80+Q15OoBw3otBVfB0TWWFXkCiptbXqW+NGfg=
X-Received: by 2002:a62:343:0:b029:15c:e33c:faff with SMTP id
 64-20020a6203430000b029015ce33cfaffmr13554996pfd.7.1604931411511; Mon, 09 Nov
 2020 06:16:51 -0800 (PST)
MIME-Version: 1.0
References: <20201109132643.457932-1-lars.povlsen@microchip.com> <20201109132643.457932-3-lars.povlsen@microchip.com>
In-Reply-To: <20201109132643.457932-3-lars.povlsen@microchip.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 9 Nov 2020 16:17:40 +0200
Message-ID: <CAHp75Vdfm7A5=Mi-LZ1sHJS5fSngypZQ50-rGQ7A6kD2kmVFTA@mail.gmail.com>
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

On Mon, Nov 9, 2020 at 3:27 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>
> This adds a pinctrl driver for the Microsemi/Microchip Serial GPIO
> (SGPIO) device used in various SoC's.

Please, elaborate what you said previously, because now it has no
justification to be a pin control driver.

...

> +#define __shf(x)               (__builtin_ffs(x) - 1)
> +#define __BF_PREP(bf, x)       (bf & ((x) << __shf(bf)))
> +#define __BF_GET(bf, x)                (((x & bf) >> __shf(bf)))

I answered the old thread that it probably makes sense to make
something like field_get() / field_prep() available for everybody.

...

> +       unsigned int bit = 3 * addr->bit;

> +       unsigned int bit = 3 * addr->bit;

Magic number. Perhaps a defined constant?

...

> +               return -EOPNOTSUPP;

Are you sure? IIRC internally we are using ENOTSUPP.

Couple of drivers seem to be wrongly using the other one.

...

> +                       err = -EOPNOTSUPP;

Ditto.

...

> +       if (input != bank->is_input) {

> +               dev_err(pctldev->dev, "Pin %d direction as %s is not possible\n",
> +                       pin, input ? "input" : "output");

Do we need this noise? Isn't user space getting a proper error code as
per doc and can handle this?

> +               return -EINVAL;
> +       }

...

> +       if ((priv->ports & BIT(addr.port)) == 0) {

'!' is equivalent to ' == 0', but it's up to you.

> +               dev_warn(priv->dev, "Request port %d for pin %d is not activated\n",
> +                        addr.port, offset);
> +       }

...

> +       return bank->is_input ?
> +               sgpio_input_get(priv, &addr) : sgpio_output_get(priv, &addr);

I would leave it on one line.

...

> +       pin = gpiospec->args[1] + (gpiospec->args[0] * priv->bitcount);

Redundant parentheses.

...

> +static int microchip_sgpio_get_ports(struct sgpio_priv *priv)
> +{
> +       struct device *dev = priv->dev;
> +       struct device_node *np = dev->of_node;
> +       u32 range_params[64];
> +       int i, ret;
> +
> +       /* Calculate port mask */
> +       ret = of_property_read_variable_u32_array(np,
> +                                                 "microchip,sgpio-port-ranges",
> +                                                 range_params,
> +                                                 2,
> +                                                 ARRAY_SIZE(range_params));
> +       if (ret < 0 || ret % 2) {
> +               dev_err(dev, "%s port range\n",
> +                       ret == -EINVAL ? "Missing" : "Invalid");
> +               return ret;
> +       }
> +       for (i = 0; i < ret; i += 2) {
> +               int start, end;
> +
> +               start = range_params[i];
> +               end = range_params[i + 1];
> +               if (start > end || end >= SGPIO_BITS_PER_WORD) {
> +                       dev_err(dev, "Ill-formed port-range [%d:%d]\n",
> +                               start, end);
> +               }
> +               priv->ports |= GENMASK(end, start);
> +       }
> +
> +       return 0;
> +}

As per previous version comment, i.e. perhaps find an existing API for
this kind of parser or introduce a generic one.

...

> +       bool is_input = (bankno == 0);

Now I'm not sure why you need this variable here and in the structure.
Can't you use the above check directly?
If you want to have flexible settings (i.e. not all generations of hw
have it like this) I would rather recommend to do it via DT.

...

> +       for (i = 0; i < ngpios; i++) {
> +               char name[sizeof("SGPIO_D_pXXbY\0")];
> +               struct sgpio_port_addr addr;
> +
> +               sgpio_pin_to_addr(priv, i, &addr);
> +               snprintf(name, sizeof(name), "SGPIO_%c_p%db%d",
> +                        is_input ? 'I' : 'O',
> +                        addr.port, addr.bit);
> +
> +               pins[i].number = i;
> +               pins[i].name = devm_kstrdup(dev, name, GFP_KERNEL);

Above with this is a NIH of devm_kasprintf().

> +               if (!pins[i].name)
> +                       return -ENOMEM;
> +       }

...

> +       /* Get clock */

Useless comment.

...

> +       div_clock = clk_get_rate(clk);
> +       if (of_property_read_u32(dev->of_node, "bus-frequency", &priv->clock))

Again, choose one API, no need to spread among several.

As I have told you already: if any comment is given against one
location in the code, check the entire contribution for similar places
and address accordingly.

> +               priv->clock = 12500000;
> +       if (priv->clock <= 0 || priv->clock > (div_clock / 2)) {

How can an unsigned value be possible less than 0?

> +               dev_err(dev, "Invalid frequency %d\n", priv->clock);
> +               return -EINVAL;

> +       }

...

> +       /* Get register map */

Useless.

...

> +       /* Get rest of device properties */

This one though may be left.

-- 
With Best Regards,
Andy Shevchenko
