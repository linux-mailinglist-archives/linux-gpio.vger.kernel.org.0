Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D66996A53E9
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Feb 2023 08:51:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbjB1HvN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Feb 2023 02:51:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjB1HvM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Feb 2023 02:51:12 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1055221944
        for <linux-gpio@vger.kernel.org>; Mon, 27 Feb 2023 23:51:11 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id d30so36170035eda.4
        for <linux-gpio@vger.kernel.org>; Mon, 27 Feb 2023 23:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1677570669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rs/ZVlAbIvyRpyoU7SPCAUn/F4d7uzw5N+CTKxN3IJc=;
        b=TALBz3loFyjDnuvvLQFvi9dYtfR9+RRrAhr69Gaps6GHUU1iQpM8GICEHieGnW168g
         91Fzu3+LBQSt3GRfft/K2/dLI/j2ll84iyXLx/oQT/+OzWTZbhCGssTFYStuOe5R2QO1
         T05RnCoftobu8P5uvf16KYLaeMjHjxPMSQvSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677570669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rs/ZVlAbIvyRpyoU7SPCAUn/F4d7uzw5N+CTKxN3IJc=;
        b=REfNMSGvnfZ2NsR+dG7rBio7drHV0wq4xvC0fWqRTKKB+F71j/Vx5/hTNH8bhJGk7+
         43rJDgAtkSXlvVPWdWal63VLwQHvFIPXD66JfQhi9cEvlEh6ft3ibwdBVXRPv9RTibjA
         Y6nx1xwE8HxLwV8G14RrzzDS8zE4TCl294EebtFN1BOSDT0HCOx0z8JtS+WHFmMtTTjg
         NnFIfDxGbx/1x1Hq0ZYEuCCArPU/yMW4BogygkU6tmtpPdLdX+VsNYQO2Ndn3JlQDfMy
         P5zaJPQcJ/NgOnZhZt/xJmlKFbPeSYwJ7hLL/AMaeIoeJWJTyN/8v5igv2x1wbmOio4I
         j2Eg==
X-Gm-Message-State: AO0yUKVL4jy2TDi9BGC9TPymDx3S+t6Pr19fqd/8capAx7TRGHeJweNj
        DgA6SEBvD7DhGBd4yvuH+891pdfVZnJaHNAYdjt9Hw==
X-Google-Smtp-Source: AK7set+UPqQ3W7hX9gBzwu1pqs1eHN/crucwFvOU1kTi+oAzRGnPAs7ASHCWalojiwzvDNElIs5u0n6OtKg+JdGtIR4=
X-Received: by 2002:a50:9f05:0:b0:4ac:cdd8:fbb5 with SMTP id
 b5-20020a509f05000000b004accdd8fbb5mr1189859edf.3.1677570669305; Mon, 27 Feb
 2023 23:51:09 -0800 (PST)
MIME-Version: 1.0
References: <20230226205357.1013504-1-dario.binacchi@amarulasolutions.com> <33714d4c-31a9-527c-f80a-1f51c9a37f98@i2se.com>
In-Reply-To: <33714d4c-31a9-527c-f80a-1f51c9a37f98@i2se.com>
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date:   Tue, 28 Feb 2023 08:50:58 +0100
Message-ID: <CABGWkvo=Qnfi+fciQXZ2NWCW2tyMCctaBsYc=VTo_HjYHphkKQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: mxs: use dynamic allocation of base
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Fabio Estevam <festevam@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Stefan,

On Mon, Feb 27, 2023 at 6:52=E2=80=AFPM Stefan Wahren <stefan.wahren@i2se.c=
om> wrote:
>
> Hi Dario,
>
> Am 26.02.23 um 21:53 schrieb Dario Binacchi:
> > Since commit 502df79b860563d7 ("gpiolib: Warn on drivers still using st=
atic
> > gpiobase allocation"), one or more warnings are printed during boot on
> > systems where static allocation of GPIO base is used:
> >
> > [    0.136834] gpio gpiochip0: Static allocation of GPIO base is deprec=
ated, use dynamic allocation.
> > [    0.142753] gpio gpiochip1: Static allocation of GPIO base is deprec=
ated, use dynamic allocation.
> > [    0.148452] gpio gpiochip2: Static allocation of GPIO base is deprec=
ated, use dynamic allocation.
> > [    0.154341] gpio gpiochip3: Static allocation of GPIO base is deprec=
ated, use dynamic allocation.
> > [    0.160097] gpio gpiochip4: Static allocation of GPIO base is deprec=
ated, use dynamic allocation.
> >
> > So let's follow the suggestion and use dynamic allocation.
>
> i understand the motivation of avoiding these warnings.
>
> AFAIK the MXS platform is older than the dynamic allocation of GPIO
> base. In the perfect world all applications has been migrated to
> libgpiod / chardev GPIO. But i'm really concerned this hasn't happend
> yet, at least for this platform. So i believe this change break
> applications, since it affects userspace.

Thanks for your explanations.

Do you think it makes sense to use a Kconfig option to enable/disable
the dynamic allocation of GPIO base?
As done, if I'm not mistaken, in commit 80d34260f36c6 ("pinctrl:
renesas: gpio: Use dynamic GPIO base if no function GPIOs")?
With legacy support enabled by default, but the ability to try out the
latest dynamic allocation functionality.

Thanks and regards,
Dario

>
> Best regards
>
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >
> >   drivers/gpio/gpio-mxs.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
> > index 7f59e5d936c2..b48a7c1fb7c1 100644
> > --- a/drivers/gpio/gpio-mxs.c
> > +++ b/drivers/gpio/gpio-mxs.c
> > @@ -330,7 +330,7 @@ static int mxs_gpio_probe(struct platform_device *p=
dev)
> >
> >       port->gc.to_irq =3D mxs_gpio_to_irq;
> >       port->gc.get_direction =3D mxs_gpio_get_direction;
> > -     port->gc.base =3D port->id * 32;
> > +     port->gc.base =3D -1;
> >
> >       err =3D gpiochip_add_data(&port->gc, port);
> >       if (err)



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
