Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA9C01BD4C0
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 08:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgD2GkQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Apr 2020 02:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726158AbgD2GkP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Apr 2020 02:40:15 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F9ADC03C1AD
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 23:40:15 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id c23so969082qtp.11
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 23:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yG9vpPKDzpfRJJCk2llJaWFnWsJYaiICHL0xvUKSsXA=;
        b=Bs7BV2nsK5MflmzjP5qR1H1SKL2RyWuvjV5dRy4PwylwWd2puZuGbhRmxG2Tjfc7pK
         6v1lAYPstBsxTH7gSPFHpwMI9kd5ppsETqxsuEkfbeNJu84FZXDqKGejIE50RbaBS1p8
         YV+SxL9CDCR+XMf6lga3L5RTanyFYXyJ4Vk4RMYqZ1N9kgb//Wt0YHItFB79+qWRXg68
         SHQhvxi088v7r8mtiNy4+ld8CCovMYlh0RezNiduUHlfZuF7sXVQrwUkSlGj3tlpiiOu
         zgYHvkt3wJw9UKbX8z2TDmXDcP0iWw9qnLHv6Fj/qnNbRyE3x82dH6Q9D/hREX60J0Ug
         5vag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yG9vpPKDzpfRJJCk2llJaWFnWsJYaiICHL0xvUKSsXA=;
        b=BAk39/PuMpSqFbX2lD/7t6b5HN1mX7RrJ16zyXBm2Ovk+0iUnvpnXzV6XuVrRGsq2i
         O/7qFA/tVQs890nw/agtjtfKyqrxHSvriOU3NCepq1xY9Iz9KF14jGn45CIyP6UOZAha
         oKfPYV6fI5gotBHK85DqCM0tF8sg3lOZejg1P4qz9uFxpjYcUZGIRg7smKe/rc9YUOAZ
         p1r1GVkyJ0B+N+XCL9zOFwiuJQY3ip8EG/irthujl4AzLwkyU7ca52bku+gKptuQJ2d+
         BIYF46LjCdrXlhGxy8TDAKmVIqrpgmcrfxDAt+4VRuv+/do2DyHwzbeUnw3quwA59XuU
         1cIQ==
X-Gm-Message-State: AGi0PuaFBJCkZaWVkGdfegAqzEkPHVh6NgKCzHE/vatyA1EDB7B9sehD
        OPpHIjAtwcOlCvNda8R+RRrc3MT069VhDzKXHESgXnqn
X-Google-Smtp-Source: APiQypLel6yd42EX4hCUgJ2g2Y4ZLCLoCH0juyg1zdK4uk7xQQ8uHZN/7SJaLSvNB3C9dIMq2LoGdqu106l9KFNjX6k=
X-Received: by 2002:aed:2a43:: with SMTP id k3mr32657429qtf.208.1588142414184;
 Tue, 28 Apr 2020 23:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200320093125.23092-1-brgl@bgdev.pl> <CACRpkdZgWUwmmuXn12DS3TsQS0yQxcweqK6HGxBm=V_2LBLBMw@mail.gmail.com>
 <CAMpxmJUb09KGreHw6Bdz79rbnQE7oZnWg_5qN_FhzoS2-XccFA@mail.gmail.com> <CAHp75Vdpb=hNiR3c7G_yTeSt70Vcy3DWHin0B5+WYV1hbRMBJQ@mail.gmail.com>
In-Reply-To: <CAHp75Vdpb=hNiR3c7G_yTeSt70Vcy3DWHin0B5+WYV1hbRMBJQ@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 29 Apr 2020 08:40:03 +0200
Message-ID: <CAMpxmJVT4wm26hQB-_BV73tC5_nqH5JG9KmDuNQ2OJe+tE+gLg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: don't call sleeping functions with a spinlock taken
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 28 kwi 2020 o 17:53 Andy Shevchenko <andy.shevchenko@gmail.com> napisa=
=C5=82(a):
>
> On Tue, Apr 14, 2020 at 6:35 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> >
> > wt., 14 kwi 2020 o 14:00 Linus Walleij <linus.walleij@linaro.org> napis=
a=C5=82(a):
> > >
> > > On Fri, Mar 20, 2020 at 10:31 AM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
> > >
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > >
> > > > We must not call pinctrl_gpio_can_use_line() with the gpio_lock tak=
en
> > > > as it takes a mutex internally. Let's move the call before taking t=
he
> > > > spinlock and store the return value.
> > > >
> > > > This isn't perfect - there's a moment between calling
> > > > pinctrl_gpio_can_use_line() and taking the spinlock where the situa=
tion
> > > > can change but it isn't a regression either: previously this part w=
asn't
> > > > protected at all and it only affects the information user-space is
> > > > seeing.
>
> It seems I have no original at hand, so, commenting here.
>
> It looks like we need a mutex less function which can be used here and
> in the call you are considering racy.

The thing is this mutex is in pinctrl - we'd need to export it too so
that gpio can use it.

Bart
