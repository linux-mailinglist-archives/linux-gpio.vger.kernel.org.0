Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B69B2184B3
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 12:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbgGHKLW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 06:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725810AbgGHKLV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 06:11:21 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF257C08C5DC;
        Wed,  8 Jul 2020 03:11:21 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id t11so14904413pfq.11;
        Wed, 08 Jul 2020 03:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rPRazb9qCXSRnZm9QgcqP0YTzEsZc3ztnMyp1yMzbuY=;
        b=KRu2i56kxFofVmJHcbOHEL6nw8b+4DUHLWrVc5EbOMskafMQzlBCZoxO0Kx3o8BjVY
         jTZtwFraVdeHAQe+iEDr1y/coRdGrDoMUALROnsvAdI92im++Gp77g4Zycv14tt2F47C
         hoifeuoVFPiHphShVoz47q7rDam8Z57gTlAhg3K5Fo3ji6fGLq3Boy4e+LL17+CXjrB0
         8J5VdSYghx2BKqXMwI6y6F6ZgJFQNv1mI1fUWfHyEtvq8vNAb3SeLgradVd6bwUbvKPi
         P3BE2taIupLK9mhA68WIcd93xutMtL1XIlqsJEf6SEHQxhdFJLUoi8mnAKT1XLJ4jz9B
         u9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rPRazb9qCXSRnZm9QgcqP0YTzEsZc3ztnMyp1yMzbuY=;
        b=tNHuxgTSjQUZbO6yKsKRKPj72DfomktgPV13SPmwLTV5wJbJQKudK4FyGr7T4MY4EC
         mqsrhQheBXJ25dU7obDV1dQQ6bq1V5WHVp9ZrXtz/5PjT/YonKMiO/CNXLvXLpu3A6eU
         l2RCHYHV2OWxpHEQSE81amMevdCkv/pjIAPR/8Hj0f4UdzUO71J343qa85IYG22pi/+L
         107eF+eqnZhYRggV5pZXNnV4tiXy0kjE6n77avfH+l1nfSIQjRxu1tVY8JTPCQ6SwaI4
         IDMEMpcAzU8YR77qV3504CLJqcRDhU0HNjaGhS3Fmt7bN6UxCcGP/0LEXig1MR7KUHbA
         mSFw==
X-Gm-Message-State: AOAM5330JklbHgy2lmXKwqedZmy4kFBtNSxwRqDC0OEnj3o+JVudeHa2
        ij07N7ShQjvmz79swUiOVpV85SltoHxPfKnWDSQ=
X-Google-Smtp-Source: ABdhPJyUVXJPxPXeHen+b3VMmmh/mm+K2hijrxLMTKPLOWmA/xW6anrd9Ixok33JzQj91QULV4muiEXfTWFY6C0qp38=
X-Received: by 2002:a63:924b:: with SMTP id s11mr47241094pgn.74.1594203079247;
 Wed, 08 Jul 2020 03:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200708082634.30191-1-digetx@gmail.com> <20200708082634.30191-5-digetx@gmail.com>
 <CAHp75VcqkmywShtOVQhEw3qwbDCHjPKeQDYWxZiq+Cvx2_QCwA@mail.gmail.com> <68df4805-daf9-91c5-d755-53abc8823654@gmail.com>
In-Reply-To: <68df4805-daf9-91c5-d755-53abc8823654@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 8 Jul 2020 13:11:02 +0300
Message-ID: <CAHp75VcEqTJxPj1pETC9eUsZCLwpv8tyZ7EjKvzzJTQ4wfKJyg@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] gpio: max77620: Don't handle disabled interrupts
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-tegra@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 8, 2020 at 12:19 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> 08.07.2020 11:46, Andy Shevchenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, Jul 8, 2020 at 11:29 AM Dmitry Osipenko <digetx@gmail.com> wrot=
e:
> >>
> >> Check whether GPIO IRQ is enabled before proceeding with handling the
> >> interrupt request. The interrupt handler now returns IRQ_NONE if none
> >> of interrupts were handled, which is usually a sign of a problem.
> >
> > ...
> >
> >> -       pending =3D value;
> >> +       pending =3D value & gpio->irq_enb_mask;
> >
> >> +       if (!pending)
> >> +               return IRQ_NONE;
> >
> > for_each_set_bit() should take care of it, no?
>
> Do you mean that the handle_nested_irq() takes care of handling
> unrequested interrupts? Actually, looks like it cares. Alright, I'll
> drop this patch since it should be unnecessary. Thank you for the comment=
!

I think it's still good to have reduced IRQs to handle by dropping not
enabled ones, my comment was about the case when pending =3D=3D 0. Sorry
if it was unclear.

> > (and probably return with IRQ_RETVAL() macro)
> >
> >>         for_each_set_bit(offset, &pending, MAX77620_GPIO_NR) {
> >>                 unsigned int virq;

--=20
With Best Regards,
Andy Shevchenko
