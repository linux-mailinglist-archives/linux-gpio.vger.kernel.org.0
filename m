Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3453016243D
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 11:06:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgBRKF6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 05:05:58 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:37013 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726650AbgBRKF5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 05:05:57 -0500
Received: by mail-il1-f194.google.com with SMTP id v13so16806917iln.4
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2020 02:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bo6pwHsMO3Fl7f+CYI2NiFOFstRv2BITpPEO1O08RVU=;
        b=OX2lL6mUGKvWsONNxNeQhgNsEMx4tDkhQEeAE9Ee8qhkCh0DbNwjGmW7IIk9/AhWBk
         TklebYtsegUDb9Bz8k5n/C99gUKH8OJQkpQUScJeKddcOft8KyABgVEc5OqX2k9aTUY5
         vZjeK34uEmbHAFBdAPPgIl44hRRO559slOre0K9NWGFZuUY+mwMwERxliDSZehVUC3c9
         Ax3+i0lgRnuQTXoqsvy0sboRLyX4koir7/Y3FUJc3OyoyVtMt2EJzFci9+CD1qHiBgux
         TPOY2Nt3bXKARZ9f7t1hq55i8KJ4eoqcF58DekNoNQhWh9y2+wMkc2bZx78sQMg9gZUp
         qPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bo6pwHsMO3Fl7f+CYI2NiFOFstRv2BITpPEO1O08RVU=;
        b=hs94FOURRr6OmwZlBl/5+7vSp6J0TLsUJW/5PnEquVTSaqxnti3BgVmhKAZfcAt+sC
         sF+Y6U8AqhPlc5GicW6K1g9H61Ch+GlZsGqPQpf/ANAnZhgEGNNAGwzOeaSV8U87K5RJ
         BVPN8bZHldWr0zIzTvjMarCtDba7vwCkDk+otuTRA2pO8ZtV3bV4jwGb6Zfm5zpQ1Zdh
         VeurTyMpWEZ7YW55rO1meqHjK3JJje/YdM4dIc5M+VafeB+s9IQcgayzH6+8v9GdBPHz
         RuJmcOV9TVbnr8sFRUwbi/CTTXKjXMZrgTWRcz3yQg1bUuAcsooUTx+JVSzaM7M+hUgP
         nwuA==
X-Gm-Message-State: APjAAAW3YHCyvYjB5Nmm47H0m+RjYKgxq8hFiFpskWrtjcjVTIkLOp+a
        PgbgaECeM7qXsA62wXGAobOgg2B+VUAeESLRvWm6Hg==
X-Google-Smtp-Source: APXvYqyvg6eg+RWs9twX0IINEiLja6rLNo4SBxl81c/FgUf2jd9o+d8pwNRyTCdZ3WeeLlF4te4mreFEWoS6vKlfcGk=
X-Received: by 2002:a92:9c1c:: with SMTP id h28mr17741163ili.189.1582020355566;
 Tue, 18 Feb 2020 02:05:55 -0800 (PST)
MIME-Version: 1.0
References: <20200218094234.23896-1-brgl@bgdev.pl> <20200218094234.23896-3-brgl@bgdev.pl>
 <6e7a5df7-6ded-7777-5552-879934c185ad@linaro.org>
In-Reply-To: <6e7a5df7-6ded-7777-5552-879934c185ad@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 18 Feb 2020 11:05:44 +0100
Message-ID: <CAMRc=McQ4ESq4g82QGjZiM0+NWUBrjUv71Be7UXzZpSsa9xAig@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] nvmem: fix another memory leak in error path
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 18 lut 2020 o 10:56 Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> napisa=C5=82(a):
>
>
>
> On 18/02/2020 09:42, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > The nvmem struct is only freed on the first error check after its
> > allocation and leaked after that. Fix it with a new label.
> >
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >   drivers/nvmem/core.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> > index b0be03d5f240..c9b3f4047154 100644
> > --- a/drivers/nvmem/core.c
> > +++ b/drivers/nvmem/core.c
> > @@ -343,10 +343,8 @@ struct nvmem_device *nvmem_register(const struct n=
vmem_config *config)
> >               return ERR_PTR(-ENOMEM);
> >
> >       rval  =3D ida_simple_get(&nvmem_ida, 0, 0, GFP_KERNEL);
> > -     if (rval < 0) {
> > -             kfree(nvmem);
> > -             return ERR_PTR(rval);
> > -     }
> > +     if (rval < 0)
> > +             goto err_free_nvmem;
> >       if (config->wp_gpio)
> >               nvmem->wp_gpio =3D config->wp_gpio;
> >       else
> > @@ -432,6 +430,8 @@ struct nvmem_device *nvmem_register(const struct nv=
mem_config *config)
> >       put_device(&nvmem->dev);
> >   err_ida_remove:
> >       ida_simple_remove(&nvmem_ida, nvmem->id);
> > +err_free_nvmem:
> > +     kfree(nvmem);
>
> This is not correct fix to start with, if the device has already been
> intialized before jumping here then nvmem would be freed as part of
> nvmem_release().
>
> So the bug was actually introduced by adding err_ida_remove label.
>
> You can free nvmem at that point but not at any point after that as
> device core would be holding a reference to it.
>

OK I see - I missed the release() callback assignment. Frankly: I find
this split of resource management responsibility confusing. Since the
users are expected to call nvmem_unregister() anyway - wouldn't it be
more clear to just free all resources there? What is the advantage of
defining the release() callback for device type here?

Bartosz
