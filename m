Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D04214D546
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2020 03:44:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgA3CoW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jan 2020 21:44:22 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:32902 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbgA3CoW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jan 2020 21:44:22 -0500
Received: by mail-qt1-f193.google.com with SMTP id d5so1324575qto.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jan 2020 18:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ingics-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1ldbZmM/LJRIfohkn+krQIomTo8ZPijk5FCZVd8mScc=;
        b=f9zUS3jvmliKjvpb0u2IoiWuhvKc9svgdBVl4DIdVv8OZyjdOJ88UQnyCWKpkX26Wu
         adxEVG6iEC5heGgMb1ZNlrbws4wGEYJYoq6uyFYItL7xqFziP5Q1KRPqM9blDtkco92D
         9KhUNrh3wvcFSjK6p6kToQO/+Ut9ARdst7P8Ldrlxg2/TkWBfDlC9qULeME3D5Nie7rj
         PtHyYRivVz+Wt+ZNS37cDs7VYa/06eZnkdWv8t2SuhJQOCB21l3N20TiiM0Hg0WPdPvl
         14IsNM8WQiSxao3sJ2XoSvHSp85djgV+DIianXYYfymmOU5Cz1pDklnZGe/LxK9s8iWS
         iABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1ldbZmM/LJRIfohkn+krQIomTo8ZPijk5FCZVd8mScc=;
        b=XNJH4h98AnAAnRD27ASCH1QdMatD7O26A9Xm5pilY/oNk67AK4eIu6UWIA3MuG5WrO
         K4mBbgPh5H6JUrnspRwSTxaI2itByAMEf4onvpfCXf01CRKvvQUjldu6GaSa8ysnIKRW
         /JuwB12HQwmRjgrG8HolWaYiipGKz3JLWK2uFSOwUvnEYdy/Y3d8EdaISmRrAnScSpTG
         qbUlaQNB9j6hV/rrLGNb5DNjgYJ/lOAZsHrJBBNciAkm5Bh9ffy1AWYQGBlhPTygldap
         4bwl2eh+uEqSTHuASzxZ9llz0RA6Poclj/dtMds/QOVHKB5INjhubdnMmDzyWluTnDTi
         J3eA==
X-Gm-Message-State: APjAAAX7WT6DclSVnuAOhE+b/9mUd7xDPxngYKrH1Qm5caSdc2z8xk0v
        BV+33xnwD5f7moc/is+7uBStvaSa5UrisnGKRKDT/pcn
X-Google-Smtp-Source: APXvYqz6MJw3tIv91oOWWQ5w5qVH0Ffu0Fu3pT1eMf/ACZqATAuuqDCyTKuBzqKKno77aphNr4JcE7WnuTyQ1skJrVQ=
X-Received: by 2002:ac8:1385:: with SMTP id h5mr2558947qtj.59.1580352260900;
 Wed, 29 Jan 2020 18:44:20 -0800 (PST)
MIME-Version: 1.0
References: <20200129123021.26200-1-axel.lin@ingics.com> <ff66b882b9eba908d3293854ac1535b13b0b4c51.camel@fi.rohmeurope.com>
In-Reply-To: <ff66b882b9eba908d3293854ac1535b13b0b4c51.camel@fi.rohmeurope.com>
From:   Axel Lin <axel.lin@ingics.com>
Date:   Thu, 30 Jan 2020 10:44:09 +0800
Message-ID: <CAFRkauAePczgaOaWGPoozkJcngtif5tbt_ezCgBEFR68Oretiw@mail.gmail.com>
Subject: Re: [PATCH] gpio: bd71828: Remove unneeded defines for GPIO_LINE_DIRECTION_IN/OUT
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Vaittinen, Matti <Matti.Vaittinen@fi.rohmeurope.com> =E6=96=BC 2020=E5=B9=
=B41=E6=9C=8829=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8811:06=E5=AF=
=AB=E9=81=93=EF=BC=9A
>
>
> On Wed, 2020-01-29 at 20:30 +0800, Axel Lin wrote:
> > They are defined in gpio/driver.h now.
> >
> > Signed-off-by: Axel Lin <axel.lin@ingics.com>
> > ---
> >  drivers/gpio/gpio-bd71828.c | 10 ----------
> >  1 file changed, 10 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-bd71828.c b/drivers/gpio/gpio-
> > bd71828.c
> > index 04aade9e0a4d..3dbbc638e9a9 100644
> > --- a/drivers/gpio/gpio-bd71828.c
> > +++ b/drivers/gpio/gpio-bd71828.c
> > @@ -10,16 +10,6 @@
> >  #define GPIO_OUT_REG(off) (BD71828_REG_GPIO_CTRL1 + (off))
> >  #define HALL_GPIO_OFFSET 3
> >
> > -/*
> > - * These defines can be removed when
> > - * "gpio: Add definition for GPIO direction"
> > - * (9208b1e77d6e8e9776f34f46ef4079ecac9c3c25 in GPIO tree) gets
> > merged,
> > - */
> > -#ifndef GPIO_LINE_DIRECTION_IN
> > -     #define GPIO_LINE_DIRECTION_IN 1
> > -     #define GPIO_LINE_DIRECTION_OUT 0
> > -#endif
> >
>
> Thanks once again for doing the cleanup! :)
Hi Matti,
Can you reply with your Ack?
It would be easier for maintainers to pick up the patch with Ack.

Thanks,
Axel
