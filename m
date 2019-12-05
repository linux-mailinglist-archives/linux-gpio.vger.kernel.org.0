Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3477D113DF4
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2019 10:28:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729072AbfLEJ2p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Dec 2019 04:28:45 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36237 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729044AbfLEJ2p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Dec 2019 04:28:45 -0500
Received: by mail-ot1-f66.google.com with SMTP id i4so2023552otr.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Dec 2019 01:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jvkGwJO9wpwmWzb9yFYF8g0IZb78yl4JdpgD9iqbzYo=;
        b=On51OQFWdvIjn8Q3J7N+Tq3YSiDkfSP1sBhnb0QIuJfAxFuDJab1AxvkR2BocBCgDP
         dHZqvUqVxKaUnabdCFbiFQBB1Lp1/nntWzS19cPHJj3zIt6epATT9q8EfZVqVvn1eGPT
         ziWJu3cwExxojl3nIbXHdilO6R5IMkujgFB+h9/y+VHUXpeLjAdT4OPU25bQHA9cXKQp
         iJ448kofN9nG9IzMawFJcHJCjxTdPyfRv1sqE6NDxL+proHg+TNDcD3K/iZetFEjVPs3
         gJyKX/M99cccEcKlgPw5zt/VGH8fuHw9SzVXs/lgLePyYUdmY9Ar7DlJigfjzo46/G6H
         9ZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jvkGwJO9wpwmWzb9yFYF8g0IZb78yl4JdpgD9iqbzYo=;
        b=XxOXM2EGAz0NvVCG1tFmfZPqpZVYOEohR2TE5Tg8wddpBLAlA20vuCyRhu3L1irlvU
         Mxl6tXqxF8mOff5+dcFgOAehTo6Utx2vbnSHmIsbr3qojAG8kB1cKBg32QnH4uONApN9
         fzMKT2Y4BFqHe6VknfNPLGT/irrg6Y5fWpGLLTTb0f/CND9HvfeOdBUlQagsQ9CAisfE
         JMxCmzu6NXw24SP6hEv9rU/0v3m2cBRCLcyxrn2QEA0AvmkYIVtZEP85APq0Lp09NdhE
         dI2itxuL+3tMZBHkRlVF6VuD9NihJGLjbfu9WlU8wR3ELljcm2df3m2D7l9Ju+WgM+QI
         To1w==
X-Gm-Message-State: APjAAAVZtXrfzFnvXnsdYK2L2/Sxpn1LoelQlUH3uKKAV+TcNbLeHpke
        0mjLkIp8cCCzHj93Vscpv1s/ppAf+jafTRkCjy2DvQ==
X-Google-Smtp-Source: APXvYqy+ubC6Uu8h10Qw5Xuv8D18unDenLazP4DmK9vEKViVQ+Vn1OUMHxSxWBMT+ffH7P1Gv0jQeXmObl9sJkKHjWk=
X-Received: by 2002:a9d:7a46:: with SMTP id z6mr5944040otm.194.1575538124736;
 Thu, 05 Dec 2019 01:28:44 -0800 (PST)
MIME-Version: 1.0
References: <20191204155912.17590-1-brgl@bgdev.pl> <20191204155912.17590-10-brgl@bgdev.pl>
 <CAHp75VfbwwDyxoZU2vHo7qo8E0rQdT3czC+Wpe7cqr5uoJVUwQ@mail.gmail.com>
In-Reply-To: <CAHp75VfbwwDyxoZU2vHo7qo8E0rQdT3czC+Wpe7cqr5uoJVUwQ@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 5 Dec 2019 10:28:33 +0100
Message-ID: <CAMpxmJXhEK3Whh8vGfW-TewT7uRgipBOd3hhmSGHYkH=PD_Nfw@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] gpiolib: provide a dedicated function for
 setting lineinfo
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 4 gru 2019 o 23:30 Andy Shevchenko <andy.shevchenko@gmail.com> na=
pisa=C5=82(a):
>
> On Wed, Dec 4, 2019 at 6:02 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > We'll soon be filling out the gpioline_info structure in multiple
> > places. Add a separate function that given a gpio_desc sets all relevan=
t
> > fields.
>
> > +       if (desc->name) {
> > +               strncpy(info->name, desc->name, sizeof(info->name));
> > +               info->name[sizeof(info->name) - 1] =3D '\0';
> > +       } else {
> > +               info->name[0] =3D '\0';
> > +       }
> > +
> > +       if (desc->label) {
> > +               strncpy(info->consumer, desc->label, sizeof(info->consu=
mer));
> > +               info->consumer[sizeof(info->consumer) - 1] =3D '\0';
> > +       } else {
> > +               info->consumer[0] =3D '\0';
> > +       }
>
> I think we have to fix GCC warnings first and then do whatever this patch=
 does.
>

What GCC warnings are you referring to exactly?

Bart

> --
> With Best Regards,
> Andy Shevchenko
