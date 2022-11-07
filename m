Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78FA161F74E
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Nov 2022 16:14:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232741AbiKGPOV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Nov 2022 10:14:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232689AbiKGPOV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Nov 2022 10:14:21 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8637D12618
        for <linux-gpio@vger.kernel.org>; Mon,  7 Nov 2022 07:14:19 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id 131so9570912ybl.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Nov 2022 07:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJyu92WZZbDaoQSrBib4kOIXTx2m8Pl0N0pfQ3F15qo=;
        b=YmaqIjy3rjqlN8gqbQV5RFr95bNsv468/uD3jRnpknMeEdSXMAfPkjGbeoHjj/2Y+w
         frtrNFWeEL5A+bTgUq5zgoMn1nzZaAtfCFV1AOVQEN/wJqHjGnC5EdiID9y/ctYL8JKK
         D5OhldQThFIbbnf7p98S8UUJl4Em7mDHxIW1TMBnHnaqqYBteyPj1V4ODjOHu11EyTuR
         TGU+LrK8KXDLIdfAQ2A1KPEK1ha2/8mAgNlxRbfKLrRlGjRRg8g7zdogqq6XEoq9Wi+N
         p15fMa3z5XnWTS85S75/2buIcRf/802mlLP141Z0qIPaa97fnMY5p5ldZsZE+JQ7xQ5y
         q8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJyu92WZZbDaoQSrBib4kOIXTx2m8Pl0N0pfQ3F15qo=;
        b=Trxk97mS9Rf0Cz+smX/HKxql+d/n+IzNZuvS73IEM4SsZ9omtfphpFQ4yx6G7cCL7b
         D7MkSSI9eoPJo8BZp9qJHL9F/QousyY7Ie+Gmp6YFbgcAvp1Dj/sK9BDyudhLGNeksb5
         /vAo51/GGBSAXhwNBi421aP3T/DpCdY/HkHc5nijd6eWnpfrreJkQM2GzicLdBJWv3OU
         VXM/AskWARoB5byAu8/WG4pFUMRWWq6Gnzx6gnNiqgJnNSRZwGXWlp60QFCvIgXDP6iO
         zzN7PECS0h1ApFB4YCW4CFS3PoggY6TGcK2ZROuNeklUgj0eyxtdQTU+xs9fa0GH73Oh
         jzJg==
X-Gm-Message-State: ACrzQf1ZGN9JLqawBt1Zd1fX2HiBBsRXIQPxmejpwp0qTNYxFDgXhmFT
        SpQRUJ2h87ErN2pZDkpjW+Cw4ilgkw/JI78xbq5Fs12/mIo=
X-Google-Smtp-Source: AMsMyM7zLuZ18DNIAU6GXhONnkH47m6L+NRV4z89rYYQQc3AS/LpuWP1U0k7odf4Ig7J0PNoNXGY+kYKkknD64y+h1I=
X-Received: by 2002:a25:3005:0:b0:6cb:7f63:c664 with SMTP id
 w5-20020a253005000000b006cb7f63c664mr716850ybw.263.1667834058775; Mon, 07 Nov
 2022 07:14:18 -0800 (PST)
MIME-Version: 1.0
References: <20221026203539.517886-1-nfrayer@baylibre.com> <CAMRc=MfVqBVv9byXvimpYUtvs1OXqh5608AZ0_L=zw7q6rOo9A@mail.gmail.com>
In-Reply-To: <CAMRc=MfVqBVv9byXvimpYUtvs1OXqh5608AZ0_L=zw7q6rOo9A@mail.gmail.com>
From:   Nicolas Frayer <nfrayer@baylibre.com>
Date:   Mon, 7 Nov 2022 16:14:08 +0100
Message-ID: <CANyCTtRpOaBUU36XfK-MiDTQ0NvqUb-ezV6jySGZRixx7CMQmQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: davinci: add support of module build
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     j-keerthy@ti.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        khilman@baylibre.com, glaroque@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Le lun. 7 nov. 2022 =C3=A0 10:14, Bartosz Golaszewski <brgl@bgdev.pl> a =C3=
=A9crit :
>
> On Wed, Oct 26, 2022 at 10:35 PM Nicolas Frayer <nfrayer@baylibre.com> wr=
ote:
> >
> > From: Guillaume La Roque <glaroque@baylibre.com>
> >
> > Added module build support for the davinci gpio driver
> >
> > Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> > Signed-off-by: Nicolas Frayer <nfrayer@baylibre.com>
> > ---
> >  drivers/gpio/Kconfig        |  2 +-
> >  drivers/gpio/gpio-davinci.c | 15 ++++++---------
> >  2 files changed, 7 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index a01af1180616..f8bace51c2d0 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -219,7 +219,7 @@ config GPIO_CLPS711X
> >           Say yes here to support GPIO on CLPS711X SoCs.
> >
> >  config GPIO_DAVINCI
> > -       bool "TI Davinci/Keystone GPIO support"
> > +       tristate "TI Davinci/Keystone GPIO support"
> >         default y if ARCH_DAVINCI
> >         depends on (ARM || ARM64) && (ARCH_DAVINCI || ARCH_KEYSTONE || =
ARCH_K3)
> >         help
> > diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> > index 59c4c48d8296..def87b99691f 100644
> > --- a/drivers/gpio/gpio-davinci.c
> > +++ b/drivers/gpio/gpio-davinci.c
> > @@ -721,12 +721,9 @@ static struct platform_driver davinci_gpio_driver =
=3D {
> >         },
> >  };
> >
> > -/**
> > - * GPIO driver registration needs to be done before machine_init funct=
ions
> > - * access GPIO. Hence davinci_gpio_drv_reg() is a postcore_initcall.
> > - */
> > -static int __init davinci_gpio_drv_reg(void)
> > -{
> > -       return platform_driver_register(&davinci_gpio_driver);
> > -}
> > -postcore_initcall(davinci_gpio_drv_reg);
> > +module_platform_driver(davinci_gpio_driver);
>
> I'm sure there was a reason to register the driver early (at postcore)
> for some platforms. This moves the registration to module_init which
> is the last initcall to call. What HW did you test this on?
>
> Bart
>

You are right, I'll send a v2 keeping postcore_initcall.
I've tested on a AM62x SK EVM.

Thanks.

> > +
> > +MODULE_AUTHOR("Jan Kotas <jank@cadence.com>");
> > +MODULE_DESCRIPTION("DAVINCI GPIO driver");
> > +MODULE_LICENSE("GPL");
> > +MODULE_ALIAS("platform:gpio-davinci");
> > --
> > 2.25.1
> >
