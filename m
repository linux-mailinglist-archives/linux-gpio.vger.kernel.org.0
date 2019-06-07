Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2EF39900
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2019 00:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730959AbfFGWib (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 18:38:31 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41601 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731776AbfFGWiV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 18:38:21 -0400
Received: by mail-lf1-f68.google.com with SMTP id 136so2730168lfa.8
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2019 15:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ET3CFvRFkI0MF/L2BngZV7pHB0kqkmb+NPPDszDMmzE=;
        b=la+kAQw+qsaiVBk6+KatB7XKgUOQshyAywGFIAIvLnyWbM44AQD3zDX3pKapxSYt4a
         u3GUBtfj6P/Oxxl9QWxXPWRsdxguE7S0o4s8Giuqu9SGAndIJjiOwd5ua0slHTTM79z7
         dAcF+wCHd8q02R92tR4Yq0NCf8O479vhO78iKhl2OrWl2Y1o5XqX+/GXiYb2D1b8dmuo
         H9tcj2OjLjotzInGGsDpWbD9WBl6JAipNBNP8VhjZVU8eFX5ucB5BFad8ny5ZpIjgz8x
         ZZvgDibFSGEH9KqtYipA4wh+CJFtECjt2WUaZDyqwHr95wNMA8xxcd+iBLre6Wf5gTAq
         El2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ET3CFvRFkI0MF/L2BngZV7pHB0kqkmb+NPPDszDMmzE=;
        b=pYe9kUGkU82jzDV0+miAOAssUXFG7CyPpi2GmIyje7MHumTmq83RUfZF8JXoEUmgK0
         2BLKo47IQJsGCWcSN2py04riAatENu/b6pOZ7ZYHsAwJnvXCFA0rjt6uI7Ar8cgIlKF8
         +e9nGEDTZof6wVtLBX/nZOMM9eQvgu+0Lp2vB0Ydixo7nwQZhB7XfN7D9OPiDI2ADlYh
         HycFFLi42AVFfM6KBaummdd8MHXvaOGAlgPf5hf0t5itF+52EtxVyp+ayJVRllUXI1OI
         kR1bug1+i1z/h1nqjYUDVsvzYn3LLpwxOwnQsWUAJt50Lh30WIX014SPKrd+2eev/2mS
         EVfg==
X-Gm-Message-State: APjAAAXtjCejxmSDSsCBDdSQTCR1GOJV6gNF7HKoOHcCILK5GWyHekhC
        YT9YENwtMzvUiTjHM7CYbgUceNwmX/yZEaeqDiTHg1Ni
X-Google-Smtp-Source: APXvYqwU6tE2vqZEcO3A/q6LuYfqSxDoBrcVt4WBoMI4WPwbOyt15dI+odVEiKCLsZ0yFS2STPMXWyGJ1aaCxj2Iziw=
X-Received: by 2002:ac2:4891:: with SMTP id x17mr16073289lfc.60.1559947100366;
 Fri, 07 Jun 2019 15:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190605080259.2462-1-j-keerthy@ti.com> <20190605080259.2462-3-j-keerthy@ti.com>
 <CAMpxmJXjMX20TAEsfEa7pqZx5-aW_rMKwS+6g9NTvRNEfuAyeA@mail.gmail.com>
 <96dbfd50-2a45-e3dc-3928-47fbc52f9269@ti.com> <CAMRc=Mfe+K=s4OZp7VWRik7JtSU6Fpufx0yDZtYCMNh5+LSJuQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mfe+K=s4OZp7VWRik7JtSU6Fpufx0yDZtYCMNh5+LSJuQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 8 Jun 2019 00:38:12 +0200
Message-ID: <CACRpkda_YmWoatVEt6OO+enYVfbZ6wvP5gmRG5+h5k=DVbPi+A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] gpio: davinci: Add new compatible for K3 AM654 SoCs
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Keerthy <j-keerthy@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 6, 2019 at 9:49 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> =C5=9Br., 5 cze 2019 o 17:12 Keerthy <j-keerthy@ti.com> napisa=C5=82(a):

> > >>   static const struct of_device_id davinci_gpio_ids[] =3D {
> > >>          { .compatible =3D "ti,keystone-gpio", keystone_gpio_get_irq=
_chip},
> > >> +       { .compatible =3D "ti,am654-gpio", keystone_gpio_get_irq_chi=
p},
> > >
> > > Please add a patch adding this compatible to the binding document as =
well.
> >
> > https://patchwork.kernel.org/patch/10976445/
> >
> > Posted but did not add you in Cc. Sorry about that.
>
> I don't see it on GPIO patchwork either. Please resend it as part of
> this series.

I see the whole other series got resent as RFC, I'll just apply these
three and the binding patch so we don't have to pingpong these
patches too much around :)

Yours,
Linus Walleij
