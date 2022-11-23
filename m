Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9048B6364B3
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Nov 2022 16:51:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237461AbiKWPvs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Nov 2022 10:51:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237630AbiKWPva (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Nov 2022 10:51:30 -0500
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A8C9C67CB
        for <linux-gpio@vger.kernel.org>; Wed, 23 Nov 2022 07:50:43 -0800 (PST)
Received: by mail-vk1-xa33.google.com with SMTP id v28so2264163vkn.10
        for <linux-gpio@vger.kernel.org>; Wed, 23 Nov 2022 07:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WU4MU4ttwXcYHXBFZ9P5T7WQqBKAboHdg0NRXUDXrsA=;
        b=3RyjLEXpaC9iRKGX9TsCK3o6hXkrNWnpaODYuML+HBwgs9jonVtyM21Jpx2tAPX5IM
         kkjfDfKHfxhnEoFPteg3oKP3IDIk8W6i2AJmCc2JQ5EegacwVnpFZyq9XcCIpBalb6Os
         K4yAP0Qp5ATqiDVWs/yeoLn2JKER//gqB5GWaxJjT6YzI+V/53iqQqECVrSA0JYBzf66
         n/czP7DJsYe2CZBD0G0m36anizvW0FcK7YlSUFOZOct2Y+zFhwg7WEdhOR0JmwijfnXb
         jbO6SAgStwBIW5TMeqMHLtn9PNF7rWIOTKw/0uvM2HRLZsDEQEnKlTCLcisqHxY1KuF0
         e7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WU4MU4ttwXcYHXBFZ9P5T7WQqBKAboHdg0NRXUDXrsA=;
        b=6toZmgMLRfxR3Jf2scshsszS5/GMqnKNB8NMWLgQe1uRwPXdtImgTrZViW8AVJ5vLm
         eCB8saB2aO++7sVddyY0Dq/i8a4+TyK7nDMEFhBPUcrOXbQSHU/cTh5NIr9SJ6wgTMNh
         JOKxGzb+SZ24+BbTkLkVjv+maWzF8p09T7m+y61/zE/sdY8BcTwWLs/6Td/4P91GwzGg
         jRkwHaAbwRyKTOuuRbCD3taHW/j+a9yHR3wAjAtjWgpWpcVyvrdaxAgRPbpnWqurStwv
         N2fLPSgXkUTqtfqRx3Yk9raJLrT7p71rmK2Q5sbVm3Al7AwtRoozMHpOQkbc8NqUQz3w
         2VHA==
X-Gm-Message-State: ANoB5plWv53pbAc114hXzm9oGVksguIMc46Tmj5mtP0wrd6Sxiukgceu
        9/5Ly2o1x/RypanimQX1voWGaX1M9KX/tpdB6B5sgA==
X-Google-Smtp-Source: AA0mqf6YOZ2UMlLjZn/kmjXvs1p3FnFg3qJY0KklFeZEPATLy4J9SfAXdbsg0QbFMiu7XbdDSbnvNlRT7bTlkgW0XW4=
X-Received: by 2002:ac5:c915:0:b0:3b8:7fbd:9554 with SMTP id
 t21-20020ac5c915000000b003b87fbd9554mr5657416vkl.27.1669218642612; Wed, 23
 Nov 2022 07:50:42 -0800 (PST)
MIME-Version: 1.0
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-13-uwe@kleine-koenig.org> <CAMRc=McKJ1NY7Me2UbzaeBU8AAoAXOnOEp61fJjWLhMCuxZP8w@mail.gmail.com>
In-Reply-To: <CAMRc=McKJ1NY7Me2UbzaeBU8AAoAXOnOEp61fJjWLhMCuxZP8w@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 23 Nov 2022 16:50:31 +0100
Message-ID: <CAMRc=McDO8WdgzaBvfecNPv7PK7AutgMkBfn75UbAvkZeHnQjA@mail.gmail.com>
Subject: Re: [PATCH 012/606] gpio: pca953x: Convert to i2c's .probe_new()
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 23, 2022 at 10:48 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Fri, Nov 18, 2022 at 11:46 PM Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig=
.org> wrote:
> >
> > From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> >
> > .probe_new() doesn't get the i2c_device_id * parameter, so determine
> > that explicitly in the probe function.
> >
> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/gpio/gpio-pca953x.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> > index 6e67867e1dcd..a59d61cd44b2 100644
> > --- a/drivers/gpio/gpio-pca953x.c
> > +++ b/drivers/gpio/gpio-pca953x.c
> > @@ -1050,9 +1050,9 @@ static int device_pca957x_init(struct pca953x_chi=
p *chip, u32 invert)
> >         return ret;
> >  }
> >
> > -static int pca953x_probe(struct i2c_client *client,
> > -                        const struct i2c_device_id *i2c_id)
> > +static int pca953x_probe(struct i2c_client *client)
> >  {
> > +       const struct i2c_device_id *i2c_id =3D i2c_client_get_device_id=
(client);
> >         struct pca953x_platform_data *pdata;
> >         struct pca953x_chip *chip;
> >         int irq_base =3D 0;
> > @@ -1376,7 +1376,7 @@ static struct i2c_driver pca953x_driver =3D {
> >                 .of_match_table =3D pca953x_dt_ids,
> >                 .acpi_match_table =3D pca953x_acpi_ids,
> >         },
> > -       .probe          =3D pca953x_probe,
> > +       .probe_new      =3D pca953x_probe,
> >         .remove         =3D pca953x_remove,
> >         .id_table       =3D pca953x_id,
> >  };
> > --
> > 2.38.1
> >
>
> Applied, thanks!
>
> Bartosz

Same story as with the other ones:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
