Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC10410F99D
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2019 09:18:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbfLCISL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Dec 2019 03:18:11 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39478 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbfLCISK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Dec 2019 03:18:10 -0500
Received: by mail-ot1-f67.google.com with SMTP id 77so2148995oty.6;
        Tue, 03 Dec 2019 00:18:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gBtOE1GdWf2jzATlRbrF8r8Pac6d5nQ4OzH7cwGAR94=;
        b=b+m13b3CkvQfHjFMmIRLCWHuM3weg+qEBDCakTYL5msGW+URm18UNn563N0Kqw0ut0
         xP+lH3/HGq2BMU+spjBBYcC9Cb+78tpW7yy3ySLggmRmVByCMwTFY/4Ucgo7Akiw1A75
         mKq37EDgN3klAjpfcS9hSaEsn9XhutvYasivZbdaNzFibSZb9eIiq/vjmdYT4bGqye72
         69xqvTZx6uZbXcVaAdCu+pl7J5bICfLM9oM9eT7tn7grjfm7cRGDm/txW5VVZiZgdymC
         7cmXLlpLlGXahovpcl0/xVYTkBbjErfggae43lJxfDghOHpRjJJGJmo0ixWOGHuKJ+vc
         ZRPQ==
X-Gm-Message-State: APjAAAVRpMyApozG4Ibe0l5j8+hA7Rzmk6Tvm+WtGxmLkU6Kbl8uBdd3
        jMSNYPA4mZ0hGvW5CIcvZwYnulIG/ppA1P/HhL8=
X-Google-Smtp-Source: APXvYqzBuvWMWrwsEDDhZ2tcNfeX7um84g4QQ5ld7WP0VV8LQtkLVFpjZhnV4oe+jaJ4tYQpo65700XzoJh4+uCOqZU=
X-Received: by 2002:a9d:3a37:: with SMTP id j52mr2353717otc.39.1575361089532;
 Tue, 03 Dec 2019 00:18:09 -0800 (PST)
MIME-Version: 1.0
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20191127084253.16356-6-geert+renesas@glider.be> <585c4ad9-31fc-e87e-07c4-b8d6aa09c7e4@mentor.com>
In-Reply-To: <585c4ad9-31fc-e87e-07c4-b8d6aa09c7e4@mentor.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 3 Dec 2019 09:17:58 +0100
Message-ID: <CAMuHMdW-n8ao7t7156WYxRg7v8+ojXsRgHGUOax=9nBo2F5xOw@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] gpio: Add GPIO Aggregator/Repeater driver
To:     Harish Jenny K N <harish_kandiga@mentor.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Harish,

On Tue, Dec 3, 2019 at 6:42 AM Harish Jenny K N
<harish_kandiga@mentor.com> wrote:
> > +static int gpio_aggregator_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev = &pdev->dev;
> > +     struct gpio_desc **descs;
> > +     struct gpiochip_fwd *fwd;
> > +     int i, n;
> > +
> > +     n = gpiod_count(dev, NULL);
> > +     if (n < 0)
> > +             return n;
> > +
> > +     descs = devm_kmalloc_array(dev, n, sizeof(*descs), GFP_KERNEL);
> > +     if (!descs)
> > +             return -ENOMEM;
> > +
> > +     for (i = 0; i < n; i++) {
> > +             descs[i] = devm_gpiod_get_index(dev, NULL, i, GPIOD_ASIS);
>
> can you please add this check as well as we need to return EPROBE_DEFER.
>
> if (desc[i] == ERR_PTR(-ENOENT))
> <                 return -EPROBE_DEFER;

So gpiod_get_index() nevers return -EPROBE_DEFER, but returns -ENOENT
instead?
How can a driver distinguish between "GPIO not found" and "gpiochip driver
not yet initialized"?
Worse, so the *_optional() variants will return NULL in both cases, too, so
the caller will always fall back to optional GPIO not present?

Or am I missing something?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
