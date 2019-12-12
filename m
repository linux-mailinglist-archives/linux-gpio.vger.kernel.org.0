Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6978611CE8B
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 14:40:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729460AbfLLNks (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 08:40:48 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35033 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729457AbfLLNks (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 08:40:48 -0500
Received: by mail-lj1-f194.google.com with SMTP id j6so2351585lja.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2019 05:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7PbHPLSXQGj0yJrSH192TMtAaxNo5rw41NetJ/dcUfw=;
        b=DRzJQiVQg/nQ/ASUfL3q6cDwUxWJ56eQnZWGgR+JOoveYSxcv7+j9kjbi9XlxA1AEO
         A02/XOPXYlK843ecHoWeaRH53jfl/cx5u3XSjbfE6QXM6s9uUsm05zfWWRKxADesDQaV
         PnpOe4EYjBF5MZNs5FNBPAYxERQpmPL1TeloXm3jpv3+AB/lT3PvU4ZBj/VaARR4vYaR
         uJAZHSCgQIgMRkQV60ebT26TmXAs0cOXjT+DYySEPkfd4IKU4kJpTPp6/Mka/ayB4hXZ
         fNwhN8IIW0TkBhIE6JdShsrKJP3KtegCAZBZzOcTXVPJ7RuZIJLfrFV04K8VZIFI/qoI
         sOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7PbHPLSXQGj0yJrSH192TMtAaxNo5rw41NetJ/dcUfw=;
        b=sogVm77wFFrwQq38WXAZxVnaWjahlhE2sRQhwqe9xNQpvG4YYB5X8QcSQJVMLX98fb
         IzJTTjqU2SjSPjW8ErQt5fON+7v69T/kd7jLGgpWcC8NwxyP3AmjIf1K04gzjZLo0MNo
         oHeH5IG7C3DcDWk+DEBaWwcnaM//VHB8IG9samTL/CPO/0rqabgIRaHEFNhx1f9cpUCe
         2ucPBmXca24PMWaZ2160yTssjB6CHOIPI0Op0L3DM4JQZHFbgcap8wBoS9EY4JOkIzUv
         CEeBvgz9IfmiDOjVFQyu0H7ovw2T271bpqd8Ck7EKzjJSAGecjKxFA3X4FLfH0mLvog6
         +dIQ==
X-Gm-Message-State: APjAAAUM/xGvkOmTGti33zh/2WSihEqYr/daUbEjOqkREEGCUd6GpBsw
        u+36URuLCJBCMVSoFFHiUjqjN7glTRMbSiK+9eBlAg==
X-Google-Smtp-Source: APXvYqz4WIPVD6RaEfzhjt2nRL8Q3ReinXWMfS2taUKWfU1ppqbKjrPvuAhDEVOow4IVqRo34vof7KNX/xH9rfQS/Dc=
X-Received: by 2002:a2e:9ec4:: with SMTP id h4mr6024597ljk.77.1576158044254;
 Thu, 12 Dec 2019 05:40:44 -0800 (PST)
MIME-Version: 1.0
References: <20191127084253.16356-1-geert+renesas@glider.be> <20191127084253.16356-4-geert+renesas@glider.be>
In-Reply-To: <20191127084253.16356-4-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Dec 2019 14:40:29 +0100
Message-ID: <CACRpkdZs0_VvfpE34bgrMtBVeamCsq6BaqfyJc1tyvWCornSUw@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] gpiolib: Add support for GPIO line table lookup
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 27, 2019 at 9:43 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Currently GPIOs can only be referred to by GPIO controller and offset in
> GPIO lookup tables.
>
> Add support for looking them up by line name.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

OK I see what you want to do...

> +               if (p->chip_hwnum == (u16)-1) {

If you want to use this then use:

if (p->chip_hwnum == U16_MAX)

from <linux/limits.h>

> +                       desc = gpio_name_to_desc(p->chip_label);
> +                       if (desc) {
> +                               *flags = p->flags;
> +                               return desc;
> +                       }
> +
> +                       dev_warn(dev, "cannot find GPIO line %s, deferring\n",
> +                                p->chip_label);
> +                       return ERR_PTR(-EPROBE_DEFER);
> +               }
> +
>                 chip = find_chip_by_name(p->chip_label);
>
>                 if (!chip) {
> diff --git a/include/linux/gpio/machine.h b/include/linux/gpio/machine.h
> index 1ebe5be05d5f81fa..84c1c097e55eefaf 100644
> --- a/include/linux/gpio/machine.h
> +++ b/include/linux/gpio/machine.h
> @@ -31,7 +31,7 @@ enum gpio_lookup_flags {
>   */
>  struct gpiod_lookup {
>         const char *chip_label;
> -       u16 chip_hwnum;
> +       u16 chip_hwnum;                 /* if -1, chip_label is named line */

/* if U16_MAX then chip_label is the named line we are looking for */

But the member name "chip_label" is completely abused with this
setup, it should then be renamed as part of the patch set to something
like chip_label_or_line_name so it is clear what it is or
just name it "const char *key".

But I'm not entirely convinced about reusing the existing
struct gpio_lookup for this.

What about constructing a new lookup struct specifically for this?
I understand it is more work, but will that not be more
maintainable and readable?

Yours,
Linus Walleij
