Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17A11181C58
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2020 16:32:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729838AbgCKPcn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Mar 2020 11:32:43 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34474 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729680AbgCKPcm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Mar 2020 11:32:42 -0400
Received: by mail-lf1-f67.google.com with SMTP id i19so2117197lfl.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2020 08:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=igM2VI1+T7dAbedLoTNIOOP15/c1U1XVsx0x9BZ/myo=;
        b=lqKirzdAID+58xNJrnXODfhsEXd+1XT0hsWptXnIiKCSXD1oliJSkWtAwCkpP3KrZf
         SE6YQSRwhSLJfEbhVMD4MwVd9nNP0tZ52T8Mycl7CZLNWJ3gt0A2U+QyEYclzo2QkdbQ
         Fve9KCp1rSO0UDKQFJKaatHNck9DLeVRM5AnpkgBgPElw2wSM4IXVuVN2RiSOP4y9GNX
         nCtP7K7TvgnWifrF9goHJpM8ApwrdpPWJQh2qIJ48+eM+keiYOOVZwb6yVAufb+kdtKz
         L6otsOtmKHsA61SdlexWzQXwmlKGdBc7RHB0Vz0VERYQi35yGYKHy46esvnWsLWFUL5/
         1XBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=igM2VI1+T7dAbedLoTNIOOP15/c1U1XVsx0x9BZ/myo=;
        b=Ob+mWQpuF8ayP/5Dnqc15AZ+wyJP3yIJN7NuRjz2d+if1Swfj3kneYL6sAhBIlKBd2
         D5Y1JoYMPxNKpCfYppmozeCd6Gj9utWTEyoNrrsWApn5LyAIKb7vRxTJUOX5IVM+Rn/l
         jdLvaco2Y7NmS77BWEULnIIpJMich+lyNQZEbJvZOEMjEAbTsgIDOm3siKYf3KB1gKq+
         RwajHhctlbjZnYzTxH2gQvXSTNxTJeFdIQNhMfw7mHopGCHym+h/5bVKGynCNuBFeC3J
         5QqK8Q56sbsnRRJucp5yPENaIGlrJ6L8Okw6VgIIYqNNNPo43M3yzibh6XN0C7mvxCLX
         lbIg==
X-Gm-Message-State: ANhLgQ3UrYunuBRQiqBFohkEpWSoqBLmZGcAY19C2fKKu9URDc3/cJik
        3dkEVFRI7LV7YR1T51cJgd4sLUMRhZpMxrdQS+oc9A==
X-Google-Smtp-Source: ADFU+vtDV8z5iYek9wUa00dmO4NFp1uTESLKgQiJai5A22kehORhROonLF6FHU/ZKUeB4tZ0MB4HucdTPznvOI+3gRc=
X-Received: by 2002:ac2:4a76:: with SMTP id q22mr2396492lfp.217.1583940760278;
 Wed, 11 Mar 2020 08:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <1583780521-45702-1-git-send-email-opendmb@gmail.com>
In-Reply-To: <1583780521-45702-1-git-send-email-opendmb@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Mar 2020 16:32:29 +0100
Message-ID: <CACRpkdZ1p3_U_yth-rCEKdPsuFNFnxsE3kTeP7krf-xHuSGkFw@mail.gmail.com>
Subject: Re: [PATCH V2] gpio: brcmstb: support gpio-line-names property
To:     Doug Berger <opendmb@gmail.com>
Cc:     Gregory Fong <gregory.0xf0@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 9, 2020 at 8:02 PM Doug Berger <opendmb@gmail.com> wrote:

> The default handling of the gpio-line-names property by the
> gpiolib-of implementation does not work with the multiple
> gpiochip banks per device structure used by the gpio-brcmstb
> driver.
>
> This commit adds driver level support for the device tree
> property so that GPIO lines can be assigned friendly names.
>


> Signed-off-by: Doug Berger <opendmb@gmail.com>
> +static void brcmstb_gpio_set_names(struct device *dev,
> +                                  struct brcmstb_gpio_bank *bank)
> +{
> +       struct device_node *np = dev->of_node;
> +       const char **names;
> +       int nstrings, base;

I don't understand why that thing is named "base".

> +       unsigned int i;
> +
> +       base = bank->id * MAX_GPIO_PER_BANK;

That would be ngpios or something.

But you alread have what you need in bank->gc.ngpio, right?

So why calculate it?

> +       nstrings = of_property_count_strings(np, "gpio-line-names");
> +       if (nstrings <= base)
> +               /* Line names not present */
> +               return;
> +
> +       names = devm_kcalloc(dev, MAX_GPIO_PER_BANK, sizeof(*names),
> +                            GFP_KERNEL);
> +       if (!names)
> +               return;
> +
> +       /*
> +        * Make sure to not index beyond the end of the number of descriptors
> +        * of the GPIO device.
> +        */
> +       for (i = 0; i < bank->width; i++) {
> +               const char *name;
> +               int ret;
> +
> +               ret = of_property_read_string_index(np, "gpio-line-names",
> +                                                   base + i, &name);
> +               if (ret) {
> +                       if (ret != -ENODATA)
> +                               dev_err(dev, "unable to name line %d: %d\n",
> +                                       base + i, ret);
> +                       break;
> +               }
> +               if (*name)
> +                       names[i] = name;
> +       }
> +
> +       bank->gc.names = names;
> +}

Why can't you just make the function
devprop_gpiochip_set_names() public, (line in <linux/gpio/driver.h>)
and convert your np to a fwnode and call that &bank->gc ?

Yours,
Linus Walleij
