Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B61077B7C5C
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Oct 2023 11:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241780AbjJDJjR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Oct 2023 05:39:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232966AbjJDJjR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Oct 2023 05:39:17 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98A80AF
        for <linux-gpio@vger.kernel.org>; Wed,  4 Oct 2023 02:39:12 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-452749f6c47so974062137.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Oct 2023 02:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696412351; x=1697017151; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZIppNZc8WtckvOq4XHwl7wWpDkGe48vm+frvcoMRE0=;
        b=oywUPUMUCHnPRhT+CKik9GL4nPbSniV2Y2uDtnk+0SQdwA04Ey/qCPSJ5IVc2Ff6uR
         XWfxrEDKXVVmu8n8b/1AGd06fX2ciBBvH28eRmnkIjpb6agZZt9IND1YXGRq5Lw2d2t2
         nIMAYtdkj4JaHeTnQq70u4c3BBj9tZMLl2zN0Mr2COmY7/u3MaKocutj+Y9VuvglxTws
         lx5PzCgvTKjuL1lY9lFlO+xXTh0xXJ0iIf6thSmfhav6uTLKTfMDo2S+7JZmLTvuW2ky
         LpugL8hlVkOjhQhkdqpzo0htE/anPxKZ6RvTX+64EpqdyMcGVOfa1EDUa5+m2Wr1GghX
         pC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696412351; x=1697017151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZIppNZc8WtckvOq4XHwl7wWpDkGe48vm+frvcoMRE0=;
        b=JdXq/JwRraCzZ1MRVjyTB41bnqMQFObcDekhWjncgAHDkZ8JIjVGr0JfhPJQgxQyI5
         pTPj6bJG2j45MeT8PxieJGhQ7/5GdQpS+zLPp1dEja9F7ZKb7+KF5wahTe69Qg4SezrK
         XMBD9tjx1+6bAX9fd6pX4NnIP5EZaYD8jht+5JGaMODLMl1xvkfXcL/26umnYI3LFrfS
         /WwdrWi0UQKD7gt37ODkdrudqa4YxdoNaD85du3KPoJiua+deTRUAIHtEStZORsdhgCO
         lldPHNyI6oBsWFiduZGo+kvt0t3Q2lTdZ+8eQ74bvIII1MGClQSW4APz4j+ezOe48b8Q
         gl8Q==
X-Gm-Message-State: AOJu0Yw3hyXR0aD9LbuAjdynX/wVcQmD1FafX2SzEqBQ1XP+nULXijtc
        QHdol8Ww29C2eP1FJ0mHFtvysoLuFTZyzpk3snippA==
X-Google-Smtp-Source: AGHT+IEBbSFgRD3egaNvVX6F9D/Pu3JQtH65YLzuTkw3ULEH94k0aQ44z2vNlfxJuboKh3EeYfBRh42T0UVLWx1zTrc=
X-Received: by 2002:a67:ee48:0:b0:44e:a9b6:5290 with SMTP id
 g8-20020a67ee48000000b0044ea9b65290mr1624229vsp.19.1696412351698; Wed, 04 Oct
 2023 02:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20231003145114.21637-1-brgl@bgdev.pl> <20231003145114.21637-19-brgl@bgdev.pl>
 <CAJM55Z8S_4OGM_-iEACLzZgwt6_KoYr56RbPn+4kx7Beu2WjUg@mail.gmail.com>
In-Reply-To: <CAJM55Z8S_4OGM_-iEACLzZgwt6_KoYr56RbPn+4kx7Beu2WjUg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 4 Oct 2023 11:39:00 +0200
Message-ID: <CAMRc=MeEKuSDRs2GjgFFYH2fAqr2KGhnoEGq7Jgh0S1DdqaoTg@mail.gmail.com>
Subject: Re: [PATCH 18/36] pinctrl: starfive: use new pinctrl GPIO helpers
To:     Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Jianlong Huang <jianlong.huang@starfivetech.com>,
        Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 4, 2023 at 11:37=E2=80=AFAM Emil Renner Berthing
<emil.renner.berthing@canonical.com> wrote:
>
> Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Replace the pinctrl helpers taking the global GPIO number as argument
> > with the improved variants that instead take a pointer to the GPIO chip
> > and the controller-relative offset.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 4 ++--
> >  drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drive=
rs/pinctrl/starfive/pinctrl-starfive-jh7100.c
> > index 530fe340a9a1..22a2db8fa315 100644
> > --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> > +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> > @@ -918,12 +918,12 @@ static struct pinctrl_desc starfive_desc =3D {
> >
> >  static int starfive_gpio_request(struct gpio_chip *gc, unsigned int gp=
io)
> >  {
> > -     return pinctrl_gpio_request(gc->base + gpio);
> > +     return pinctrl_gpio_request_new(gc, gpio);
> >  }
> >
> >  static void starfive_gpio_free(struct gpio_chip *gc, unsigned int gpio=
)
> >  {
> > -     pinctrl_gpio_free(gc->base + gpio);
> > +     pinctrl_gpio_free_new(gc, gpio);
>
> Hi Bartosz,
>
> Thank you for the patch. These new pinctrl_gpio_*_new() functions now see=
m to
> have the same signature as the starfive_gpio_*() functions. Is there a re=
ason
> they can't be used as callbacks directly so we could just delete the
> starfive_gpio_*() wrapppers?

Ha! Make sense and it'll probably apply to more users.

>
> Also it'd be great to be to be CC'd on at least the first generic patches=
 where
> the new functions are introduced to have some context without having to l=
ook it
> up on lore.
>

I wanted to reduce noise for maintainers but ended up introducing
confusion. I will probably just send the v2 to everyone so proper
context.

Bart

> /Emil
>
> >  }
> >
> >  static int starfive_gpio_get_direction(struct gpio_chip *gc, unsigned =
int gpio)
> > diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drive=
rs/pinctrl/starfive/pinctrl-starfive-jh7110.c
> > index 640f827a9b2c..5557ef3fbeb2 100644
> > --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> > +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> > @@ -547,12 +547,12 @@ static const struct pinconf_ops jh7110_pinconf_op=
s =3D {
> >
> >  static int jh7110_gpio_request(struct gpio_chip *gc, unsigned int gpio=
)
> >  {
> > -     return pinctrl_gpio_request(gc->base + gpio);
> > +     return pinctrl_gpio_request_new(gc, gpio);
> >  }
> >
> >  static void jh7110_gpio_free(struct gpio_chip *gc, unsigned int gpio)
> >  {
> > -     pinctrl_gpio_free(gc->base + gpio);
> > +     pinctrl_gpio_free_new(gc, gpio);
> >  }
> >
> >  static int jh7110_gpio_get_direction(struct gpio_chip *gc,
> > --
> > 2.39.2
