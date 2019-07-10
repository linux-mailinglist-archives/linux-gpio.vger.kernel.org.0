Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F68C6449D
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2019 11:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727222AbfGJJra (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jul 2019 05:47:30 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39399 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbfGJJra (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jul 2019 05:47:30 -0400
Received: by mail-oi1-f196.google.com with SMTP id m202so1126447oig.6
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jul 2019 02:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bzV97ZdiERZ42rZWsWCb0hOAee1RiY7/NGaFmcVPNbo=;
        b=mstsLCtHadyks31Z9lCGNHdmPIycOBkJOxqQ5UkKwFgG9lMmu0w9BPn9D0HPMZ3pm2
         mOjKgMR7/aBkKvMue+fDtVvZYHlidhvGfkYHFnNv8JbHIDL5t29vnLkw/TU63aMhrzXq
         z4SWpOhnjBibihvBajL0LC4cl0UnpJ5h+2c8nvhq48ZSb/yalpK5eo6iE0iX/P/LRfPg
         aDPSZMxdnHc9KgzwPR8tGtKJG6JpPAodrmvGicGP2c6tdC37mwqj4OYZZN5WarddV1RO
         Hi6yP3DlQFxeF/y6paTYMsVxwo0f32bmcDJ+vTDTBth1O8khr/viW7UXy21EXlknraqO
         jbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bzV97ZdiERZ42rZWsWCb0hOAee1RiY7/NGaFmcVPNbo=;
        b=TWspqa7K09kbJeeU4LwVLF0dBhXjNdsInzqTkE+VKM0uklagDLRG6sOCA6Lvdu0gH+
         QOX39qKwFRJK/KW9wqXcD1XD+dKbO7MAAvnZYC/+gpjZgTFJSoG3NcgzCyaY+hsn3EMg
         lZq6nP/neWi2alScvfVTouZ9fyBE2MmHCm0XbPmqJhYtjSJL7TAm9HBEcfsdNZ+yJ01Z
         m+4IcRdMDiSAt9DKIgmn9XvVL2v8ABPrDp9d1/4ST4nGY0iU91IjZvzsNAjH0mXjVMLT
         ZrrNzdei/AobROcU4g8D15++EySU5KQEg81PxbYgdfp+1ksrO4kXjQqx+LEVm60osAEK
         9JTQ==
X-Gm-Message-State: APjAAAWLrXoTyc9B4nlAoCDP952wyGOOh1dtOXUv2W004ZZg6iCBQ9CD
        kSE9PE4rdc4ABe+/8b45q2yKxaKNj2NIukPE++UvKw==
X-Google-Smtp-Source: APXvYqznfFks6r5S5buZ9JmChEVpkgAFdEaVMCeevNK+H6vq3wW6vKxhG9d1P9GI7IKoNPDDVwjFdqGtsDhlz2syNG4=
X-Received: by 2002:aca:b06:: with SMTP id 6mr2926203oil.175.1562752049415;
 Wed, 10 Jul 2019 02:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190710090852.9239-1-brgl@bgdev.pl> <510f14c9-fc3b-734c-53ff-cbf4a7579e32@electromag.com.au>
In-Reply-To: <510f14c9-fc3b-734c-53ff-cbf4a7579e32@electromag.com.au>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 10 Jul 2019 11:47:18 +0200
Message-ID: <CAMpxmJUFEoVZOL++SxshUr3rH0pCzML_at0dji8smqVtpGpqsw@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: em: remove the gpiochip before removing the irq domain
To:     Phil Reid <preid@electromag.com.au>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "Stable # 4 . 20+" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 10 lip 2019 o 11:37 Phil Reid <preid@electromag.com.au> napisa=C5=
=82(a):
>
> G'day Bartosz,
>
> One comment below
>
> On 10/07/2019 17:08, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > In commit 8764c4ca5049 ("gpio: em: use the managed version of
> > gpiochip_add_data()") we implicitly altered the ordering of resource
> > freeing: since gpiochip_remove() calls gpiochip_irqchip_remove()
> > internally, we now can potentially use the irq_domain after it was
> > destroyed in the remove() callback (as devm resources are freed after
> > remove() has returned).
> >
> > Use devm_add_action() to keep the ordering right and entirely kill
> > the remove() callback in the driver.
> >
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Fixes: 8764c4ca5049 ("gpio: em: use the managed version of gpiochip_add=
_data()")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >   drivers/gpio/gpio-em.c | 35 +++++++++++++++++------------------
> >   1 file changed, 17 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
> > index b6af705a4e5f..c88028ac66f2 100644
> > --- a/drivers/gpio/gpio-em.c
> > +++ b/drivers/gpio/gpio-em.c
> > @@ -259,6 +259,13 @@ static const struct irq_domain_ops em_gio_irq_doma=
in_ops =3D {
> >       .xlate  =3D irq_domain_xlate_twocell,
> >   };
> >
> > +static void em_gio_irq_domain_remove(void *data)
> > +{
> > +     struct irq_domain *domain =3D data;
> > +
> > +     irq_domain_remove(domain);
> > +}
> > +
> >   static int em_gio_probe(struct platform_device *pdev)
> >   {
> >       struct em_gio_priv *p;
> > @@ -333,39 +340,32 @@ static int em_gio_probe(struct platform_device *p=
dev)
> >               return -ENXIO;
> >       }
> >
> > +     ret =3D devm_add_action(&pdev->dev,
> > +                           em_gio_irq_domain_remove, p->irq_domain);
>
> Could devm_add_action_or_reset be used?
>

Of course it could and it should. :)

I'll resend tomorrow to not spam the mailing list.

Thanks,
Bart

> > +     if (ret) {
> > +             irq_domain_remove(p->irq_domain);
> > +             return ret;
> > +     }
> > +
> >       if (devm_request_irq(&pdev->dev, irq[0]->start,
> >                            em_gio_irq_handler, 0, name, p)) {
> >               dev_err(&pdev->dev, "failed to request low IRQ\n");
> > -             ret =3D -ENOENT;
> > -             goto err1;
> > +             return -ENOENT;
> >       }
> >
> >       if (devm_request_irq(&pdev->dev, irq[1]->start,
> >                            em_gio_irq_handler, 0, name, p)) {
> >               dev_err(&pdev->dev, "failed to request high IRQ\n");
> > -             ret =3D -ENOENT;
> > -             goto err1;
> > +             return -ENOENT;
> >       }
> >
> >       ret =3D devm_gpiochip_add_data(&pdev->dev, gpio_chip, p);
> >       if (ret) {
> >               dev_err(&pdev->dev, "failed to add GPIO controller\n");
> > -             goto err1;
> > +             return ret;
> >       }
> >
> >       return 0;
> > -
> > -err1:
> > -     irq_domain_remove(p->irq_domain);
> > -     return ret;
> > -}
> > -
> > -static int em_gio_remove(struct platform_device *pdev)
> > -{
> > -     struct em_gio_priv *p =3D platform_get_drvdata(pdev);
> > -
> > -     irq_domain_remove(p->irq_domain);
> > -     return 0;
> >   }
> >
> >   static const struct of_device_id em_gio_dt_ids[] =3D {
> > @@ -376,7 +376,6 @@ MODULE_DEVICE_TABLE(of, em_gio_dt_ids);
> >
> >   static struct platform_driver em_gio_device_driver =3D {
> >       .probe          =3D em_gio_probe,
> > -     .remove         =3D em_gio_remove,
> >       .driver         =3D {
> >               .name   =3D "em_gio",
> >               .of_match_table =3D em_gio_dt_ids,
> >
>
>
> --
> Regards
> Phil Reid
>
