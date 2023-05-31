Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64129717C6F
	for <lists+linux-gpio@lfdr.de>; Wed, 31 May 2023 11:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234371AbjEaJvz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 May 2023 05:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232261AbjEaJvy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2023 05:51:54 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6DA6E8
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 02:51:52 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-62614f2eee1so22822116d6.0
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 02:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685526712; x=1688118712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0L/ubhIxKcYKrZuH7yhnKxB1rt/RD4DkwEkLw7cCuw=;
        b=YHUOlebsn5IidwmRWBnzzluxOxmMUsO536n/ZHpd2wj2N0GdZSAtzdfbvEAS3NY/1e
         1nZ9Sk3O45lEttS3s1fS0jdAlc6Lfg+s8IyCDjR6OgIDiUB/t0KUXQ8rvFxblTu7hdOF
         KnkJYyAdQDgpfipRa+kpfVEyG4uo+4mcPolxqgHm43YkzfHvlYxo7HwCY+2MRcLE7Edz
         so18iRbTKp1zjdd1mfvoT3FHqfyKK5hiLH9IdrfNa5lnArpMWt3FYw9yllmFijgDzg6P
         Ku+kW1O+aQyIO4XDy9TQDotPOavkty8HxmiWZjgDleK/JxB2NjOQTfyI7OHuNlDYvRGL
         9tcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685526712; x=1688118712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K0L/ubhIxKcYKrZuH7yhnKxB1rt/RD4DkwEkLw7cCuw=;
        b=O/YKmeYbX7+ipMGXMxzQkz/IF/lR/sutkHKMX0ATKw2+Ac+H/4YDuvSJ66RZp5Nm21
         CM4vWXN3SI4av67Sx4/kQ1mJviIVC39qB3JGqiSV/WEOq5nKTrhRkWWKijYdICRttyMe
         2ApNl9AN3b9Fez1IbAxSh0kMQ4rBc5KEZIeFceIl16v9eG5Gud4gwXkm0BfyhxrNCzqQ
         bYMiwW3FDcS4A8LrCL4jR+i3IOdFt2JuZt46KPQXtE+1ykIsAlnmuh2J+mdQ1+Gmw4PL
         etD4eIUrEhIpfxNb+D39EqGfSdV2hknc/utp0ohCp2zey58JJNnDoMcYrW7PW8J3o8GW
         RfNQ==
X-Gm-Message-State: AC+VfDx8/9W/f/D3w6egAV32g6dDfq8EoL+GuH58RtsrNzFZetKMEi+Q
        PIVsfZDHms//LCzpfMc34+wC+AYaJoItgFTS/lA=
X-Google-Smtp-Source: ACHHUZ6bEWXBJ0E0GHSX+aVupRsCZhFNCupEC/f5jtDcuKRXJ4O+tAtPPykvW28RMNx1uRCTFMEtuBRsGB3VfYl2qN8=
X-Received: by 2002:a05:6214:5017:b0:626:1589:68e4 with SMTP id
 jo23-20020a056214501700b00626158968e4mr5747623qvb.43.1685526711782; Wed, 31
 May 2023 02:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230530151946.2317748-1-u.kleine-koenig@pengutronix.de>
 <20230530151946.2317748-3-u.kleine-koenig@pengutronix.de> <CAHp75VegyUL6J-s4W4fHhKu4cNeBA=4J4CmDHmtAfCUr9qGHQg@mail.gmail.com>
 <20230531065829.7qrkv2ivs57aymcz@pengutronix.de>
In-Reply-To: <20230531065829.7qrkv2ivs57aymcz@pengutronix.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 31 May 2023 12:51:15 +0300
Message-ID: <CAHp75VeNTuQWLqieSyh0djyrBApoZRwKOAnMRd80fVGzfJAnbw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: use "active" and "inactive" instead of
 "high" and "low" for output hogs
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, kernel@pengutronix.de,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 31, 2023 at 9:58=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Wed, May 31, 2023 at 12:51:34AM +0300, Andy Shevchenko wrote:
> > On Tue, May 30, 2023 at 6:19=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> wrote:

...

> > As I said before, this does not cover the ACPI case. Consider
>
> I don't understand that concern. Currently there is nothing for ACPI
> that parses "output-high" et al.

This is not true.

> So you want me to introduce support for
> hogs defined by ACPI to fix the strange semantic for dt-defined hogs?
> What am I missing?

https://elixir.bootlin.com/linux/v6.4-rc4/source/drivers/gpio/gpiolib-acpi.=
c#L1262

...

> > > +       GPIOD_OUT_LOW_OPEN_DRAIN =3D GPIOD_OUT_INACTIVE_OPEN_DRAIN,
> > > +       GPIOD_OUT_HIGH_OPEN_DRAIN =3D GPIOD_OUT_ACTIVE_OPEN_DRAIN,
> >
> > This one is an interesting case, because depending on the transistor
> > polarity this may be active GND or VDD. All the same for OPEN_SOURCE
> > which seems not defined (but should be equivalent to the opposite to
> > the _DRAIN cases).
>
> This is (also) orthogonal to my change, right?

Maybe yes, maybe no. Depends on what we want with this semantics
regarding OS/OD/OC/OE.
Strictly speaking all four should be defined. But it brings a lot of
duplication. I dunno.

--=20
With Best Regards,
Andy Shevchenko
