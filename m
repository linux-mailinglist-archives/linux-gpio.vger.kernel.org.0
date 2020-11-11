Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9848A2AF3BB
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 15:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgKKOhm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 09:37:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726516AbgKKOhl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 09:37:41 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B75C0613D1;
        Wed, 11 Nov 2020 06:37:41 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id h6so1571729pgk.4;
        Wed, 11 Nov 2020 06:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DFHi4NGTKU9ELDbvh+pwmAFaCNYJWfBtMcvSeODhncw=;
        b=UARSzOj6v4Nv6uO3EQCNIi4ZruO2xf4X48v7pbw0dK2LR6Iq/SJyx4r3LT5UF/+aVR
         E/EupPyCf8tIHGavCap+a+jGw3NF963qXlft+5fq+pFoAYN803OOsP724su7MNCwpkLy
         b/sp/DbL9zHD9N1bE5ZqXBgvX6w7jAVCk7/UPP65A7zgFYrHPI46AUsI9fX2Ea+mz3qU
         i1vn190ICL1sYF2NEC54vzmulTorrKEGnjl12UOE1IRToq0M2aXF7td3v9IOVJx1R8ig
         vt7pjBSDJ1ylvCNVGYVBDzqnmAvB72UbqIjcYC/lDT/2SXc1GydGFys+RdSOZAoCAr4L
         0b/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DFHi4NGTKU9ELDbvh+pwmAFaCNYJWfBtMcvSeODhncw=;
        b=rkd4WE1HmuhSzRrxuTIBlSaxJmivvQEwiRuIFdggQMrRk7U8nY2ilfjAgIQlMc1iGK
         Zg1kvp7Nacj+AfaBof4S+lYJaOnYASNLUOKnloiHuWtI6XpFnD/QS0ZRTmc+tmMW0u6X
         En23/GZcVLF2EG3M0d2OvDAInjYqpLJaCIi7H1HozIneob5fRdIgcWWx6huSaKEh4REu
         Y+xMj2UNLcPyK8Us0u3RttdCKKJ6k6rldRXSiBkxGxxHltAM7mrWB90fy2wSh3yiJo6n
         9/uL7P3RWWE+VOEGYSDZa1QgvvoLKwnYTlpMdGt6qLa/N7Tj0uhHMHJaRpYOpiYsn1Ia
         DS8A==
X-Gm-Message-State: AOAM532aR9nK1L/Djcso1jjUe5XXtssizUm9/s0nIrGnsuF2CQlGr9qY
        QxUa/3mgAkLZzAKHR1jzgmB9TUuBwBpmyov+zis=
X-Google-Smtp-Source: ABdhPJyg/b3LwQrE3CAfhzmyLfx1/SvF6ZZLpJGISGn++LetXJv8PFRpfeKONiQjzMxhGICWdIFaVIAdSIWTLFw0a8E=
X-Received: by 2002:a63:3e05:: with SMTP id l5mr21541487pga.74.1605105460542;
 Wed, 11 Nov 2020 06:37:40 -0800 (PST)
MIME-Version: 1.0
References: <20201111122454.6240-1-lars.povlsen@microchip.com> <20201111122454.6240-3-lars.povlsen@microchip.com>
In-Reply-To: <20201111122454.6240-3-lars.povlsen@microchip.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 11 Nov 2020 16:38:29 +0200
Message-ID: <CAHp75VfJ7T-ODiyKiMqK-oq5nO3776poSCJag9gvB-aqD3hoMg@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] pinctrl: pinctrl-microchip-sgpio: Add pinctrl
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

On Wed, Nov 11, 2020 at 2:25 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>
> This adds a pinctrl driver for the Microsemi/Microchip Serial GPIO
> (SGPIO) device used in various SoC's.
>
> The driver is added as a pinctrl driver, albeit only having just GPIO
> support currently. The hardware supports other functions that will be
> added following.

Thanks for an update!
Seems closer to the final. My comments below.

...

> + * Author: <lars.povlsen@microchip.com>

No First Name Last Name?

...

> +static int sgpio_output_get(struct sgpio_priv *priv,
> +                           struct sgpio_port_addr *addr)
> +{
> +       u32 val, portval = sgpio_readl(priv, REG_PORT_CONFIG, addr->port);
> +       unsigned int bit = SGPIO_SRC_BITS * addr->bit;
> +
> +       switch (priv->properties->arch) {
> +       case SGPIO_ARCH_LUTON:
> +               val = FIELD_GET(SGPIO_LUTON_BIT_SOURCE, portval);
> +               break;
> +       case SGPIO_ARCH_OCELOT:
> +               val = FIELD_GET(SGPIO_OCELOT_BIT_SOURCE, portval);
> +               break;
> +       case SGPIO_ARCH_SPARX5:
> +               val = FIELD_GET(SGPIO_SPARX5_BIT_SOURCE, portval);
> +               break;
> +       default:
> +               val = 0;

Missed break; statement.

> +       }
> +       return !!(val & BIT(bit));
> +}

...

> +static const struct pinconf_ops sgpio_confops = {
> +       .is_generic = true,
> +       .pin_config_get = sgpio_pinconf_get,
> +       .pin_config_set = sgpio_pinconf_set,

> +       .pin_config_config_dbg_show = pinconf_generic_dump_config,

Do you need this? I mean isn't it default by pin core?

> +};

...

> +static int sgpio_gpio_request_enable(struct pinctrl_dev *pctldev,
> +                                    struct pinctrl_gpio_range *range,
> +                                    unsigned int offset)
> +{
> +       struct sgpio_bank *bank = pinctrl_dev_get_drvdata(pctldev);
> +       struct sgpio_priv *priv = bank->priv;
> +       struct sgpio_port_addr addr;
> +
> +       sgpio_pin_to_addr(priv, offset, &addr);
> +
> +       if ((priv->ports & BIT(addr.port)) == 0) {
> +               dev_warn(priv->dev, "Request port %d.%d: Port is not enabled\n",
> +                        addr.port, addr.bit);
> +       }
> +
> +       return 0;

I believe this function also does some sanity checks. Perhaps you need
to call a generic one.
Hence check what should be done in the tear down case.

> +}

...

> +       if (priv->in.gpio.ngpio != priv->out.gpio.ngpio) {
> +               dev_err(dev, "Banks must have same GPIO count\n");
> +               return -EINVAL;

-ERANGE?

> +       }

-- 
With Best Regards,
Andy Shevchenko
