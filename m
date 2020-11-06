Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDCB22A94EE
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 12:00:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgKFLAN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 06:00:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbgKFLAM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Nov 2020 06:00:12 -0500
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87CAAC0613D2
        for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2020 03:00:12 -0800 (PST)
Received: by mail-qk1-x744.google.com with SMTP id b18so633024qkc.9
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2020 03:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5scwP+FH/3TvdU9cRBPIGfL9OLQBWnAyRxebsQvYQJw=;
        b=K3GEevu5XTiJFobdS3WdtKWhU/wb279WC0tnyvUS0zrqS+1hRZU39kLzr6Rs2Rs4Ct
         RnA0QI/duInuNOTC8svzJEUEgB+Zy/BsCor7akvZoBtUE5sACyi9u5NFoHdi30UnIM7q
         zaZ0izVo/c09fKHF4D/7D6TWLdSZ3YT99RFC5TF0OVrbzY8mNmAYKhmnbDOc9Wm+JITd
         TKUC8zR9IakSoFyRx8uXTFhEOT4hyPv7p7IbpwDVvLZ0O31a4BDmyGxXLApCEI0fA4Tc
         cRkT8DhvvKS6XCVkl15e2vE37m6na9YhMXtGgvYchipGxSTryUijvuK32I7bIg1y26g5
         EUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5scwP+FH/3TvdU9cRBPIGfL9OLQBWnAyRxebsQvYQJw=;
        b=ui07MW/6rSe6k9l/PPq7We03A8246TahZExQNZ64+i9iPYVeSU5A8b+8lp3F7zlYaW
         DLPyjwNBbyjKAzqj/uM6gZgfOqXX33+b1mTGg24BHGNxbasD7uYxKgr3vUw78Kh48l2e
         1uKLYHyHuLJytCshcHgK/1p0LvD/avujKDrCVivAeySkgN+Dxk7Ki3jlenQV+PPZWsks
         23KiSvm9uzRXEXYUBx9JLMhH+r1fKnjyYtWPHWjtkJKxCmHdavc5g5oBwJ3B3VvvQvXy
         sEEwwzrU5fhZ+S2ko5/GWtOOj0kTlAHOpMagFkxxPTUHOVbPcZWMfGJBq9yJB8uWZlsN
         rvlQ==
X-Gm-Message-State: AOAM5309Eoj5asSm0OSwpnoS7ZtObVJFBgOI4QnygR8K5vMtPFUvPdz7
        nWptChB6JaSJn0EKnWYcH1W6jZY+4+jBMo/OEQN9BQ==
X-Google-Smtp-Source: ABdhPJxmBJPFRCR+nFRfwqYH/BeX2Cb8nVliVSyYYIlw2cTORTY+RQImlwv64qv/wrg8lt7wtPkrBioMM43NnhfAjSI=
X-Received: by 2002:a05:620a:697:: with SMTP id f23mr831545qkh.374.1604660411776;
 Fri, 06 Nov 2020 03:00:11 -0800 (PST)
MIME-Version: 1.0
References: <802c8865b70c3bdf70e44d37f14e7767b6495e88.1604631371.git.greentime.hu@sifive.com>
 <CAHp75VdHuZc43Oe8vp-Xtb2+vsEoV2FY-W_dAifuh4Un0BveSA@mail.gmail.com>
In-Reply-To: <CAHp75VdHuZc43Oe8vp-Xtb2+vsEoV2FY-W_dAifuh4Un0BveSA@mail.gmail.com>
From:   Greentime Hu <greentime.hu@sifive.com>
Date:   Fri, 6 Nov 2020 19:00:00 +0800
Message-ID: <CAHCEehKfnUtuzoHQ=XSAzm5n0JqUHmYmjMCyLo2uRvYXc=GwYA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] gpio: sifive: To get gpio irq offset from device
 tree data
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Yash Shah <yash.shah@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2020=E5=B9=B411=E6=9C=
=886=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:25=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Fri, Nov 6, 2020 at 4:59 AM Greentime Hu <greentime.hu@sifive.com> wro=
te:
> >
> > We can get hwirq number of the gpio by its irq_data->hwirq so that we d=
on't
> > need to add more macros for different platforms. This patch is tested i=
n
> > SiFive Unleashed board and SiFive Unmatched board.
>
> ...
>
> > +       struct sifive_gpio *chip =3D gpiochip_get_data(gc);
> > +       struct irq_data *d =3D irq_get_irq_data(chip->irq_number[child]=
);
>
> > +       *parent =3D d->hwirq;
>
> There is an API to get hwirq.
>
> ...
>
> > +       for (i =3D 0; i < ngpio; i++)
> > +               chip->irq_number[i] =3D irq_of_parse_and_map(node, i);
>
> Can't you use platform_get_irq_optional()?
>

Thank you for reviewing.
I would change it like this.

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index e8cd8741dbae..bfb915bf5d78 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -145,7 +145,7 @@ static int
sifive_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
 {
        struct sifive_gpio *chip =3D gpiochip_get_data(gc);
        struct irq_data *d =3D irq_get_irq_data(chip->irq_number[child]);
-       *parent =3D d->hwirq;
+       *parent =3D irqd_to_hwirq(d);
        *parent_type =3D IRQ_TYPE_NONE;
        return 0;
 }
@@ -202,7 +202,7 @@ static int sifive_gpio_probe(struct platform_device *pd=
ev)
        }

        for (i =3D 0; i < ngpio; i++)
-               chip->irq_number[i] =3D irq_of_parse_and_map(node, i);
+               chip->irq_number[i] =3D platform_get_irq(pdev, i);

        ret =3D bgpio_init(&chip->gc, dev, 4,
                         chip->base + SIFIVE_GPIO_INPUT_VAL,
