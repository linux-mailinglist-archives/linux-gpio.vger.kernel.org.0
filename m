Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40429165DE1
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 13:51:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727747AbgBTMva (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 07:51:30 -0500
Received: from mail-qv1-f66.google.com ([209.85.219.66]:42626 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727088AbgBTMva (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Feb 2020 07:51:30 -0500
Received: by mail-qv1-f66.google.com with SMTP id dc14so1796132qvb.9
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2020 04:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EYcNKr/N3Y8JXsfApAPcA0o8C1pFsDDtiwpZriI6bFA=;
        b=tGoj+zJjCFlZ9bhdUn+7m0AmuqV1txOsHJRJBnEg6KA2fyVq+zz/iELWJgMTM24R+J
         XatNmnPWbmev9wW0oX1X8qPc1uyytzGERnz+7t+htuv8OhQzlaT/mEP180ZemvSlUqTc
         DYtkKQ8qAfkshrVXLAj9HR6UMkjPQus/rQ6ChK8lkcaX0+nrZQ7KoXewU+Nwva72Pl6n
         a7OydZO/RoLaPMPYG7+T5OiQGt4kAWA9AshfOVz3jOURd5D4K1AFFR+Z1JUCkworJiz9
         lvH0Nc5SPZ8m7Ouh9OP1JwUSDVLPgQtH93yYB/x3fQ0DT7dK8OX8QyV/rmWYqfxmNZcJ
         SLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EYcNKr/N3Y8JXsfApAPcA0o8C1pFsDDtiwpZriI6bFA=;
        b=P2mmznEjE/Wejxb1+9bsSoIQli8XV4UyDyk1bDReMu1J9+cT8DIJcbG4dK4M4CxkKT
         cvCNYNN5vbemh6Lx7Kek7vKouhSBpibdhnkxUPabLXM32JlHE8GNwHiECYkCBoWo+qVG
         cKIreN/RY3IDIzQ05ny0cIL6GVVGXxIluCZcDQjWBzg5e8NbpGTwSgy074XxM8DYZmZ3
         3SPXy6CuCr3ewQbE17+cFoG27wU5FpOVKx3DEUOZ6GGm7Qh+rAIQt7e4oqZSunOQq1RY
         FFq+W5XrQqsG7STLELxjwj+Xk16qDUXCvO7UHBNXjmg55YdXqllxY1m5NQkN7rokN3TH
         f5kw==
X-Gm-Message-State: APjAAAVkcIA+CCbhIsn+723IGxGVFpttIOxuXpMBjaQ/HpeqnIjHNN3O
        KDF1WcJtX8OIqph+9iYSBJCiNrfiIlChGhrUpskw2tYZ
X-Google-Smtp-Source: APXvYqzt3/u4sLm+8a7c12Ru7REntLJGkgoZmt8TgpKEmEX2TJZHyXdbu5hruKsC4N7eHkriHdxricWluVN6/oEXbJs=
X-Received: by 2002:ad4:446b:: with SMTP id s11mr25036775qvt.148.1582203089373;
 Thu, 20 Feb 2020 04:51:29 -0800 (PST)
MIME-Version: 1.0
References: <20200220100141.5905-1-brgl@bgdev.pl> <20200220100141.5905-3-brgl@bgdev.pl>
 <5970b17a-b29b-154f-033e-6da007d6a289@linaro.org>
In-Reply-To: <5970b17a-b29b-154f-033e-6da007d6a289@linaro.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 20 Feb 2020 13:51:18 +0100
Message-ID: <CAMpxmJX5673AmGDwrb=DMUu7=8Xi2VTtWE72F2hgitK9QUt-RA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] gpiolib: use kref in gpio_desc
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 20 lut 2020 o 13:05 Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> napisa=C5=82(a):
>
>
>
> On 20/02/2020 10:01, Bartosz Golaszewski wrote:
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -2798,6 +2798,8 @@ static int gpiod_request_commit(struct gpio_desc =
*desc, const char *label)
> >               goto done;
> >       }
> >
> > +     kref_init(&desc->ref);
> > +
>
> Should we not decrement refcount on the error path of this function?
>

On error the descriptor will still be unrequested so there's no point
in potentially calling gpiod_free(). Also: the next time someone
requests it and succeeds, we'll set it back to 1.

Bartosz
