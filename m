Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9108F397013
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jun 2021 11:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233272AbhFAJOW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 05:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233193AbhFAJOW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Jun 2021 05:14:22 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 797FFC061756
        for <linux-gpio@vger.kernel.org>; Tue,  1 Jun 2021 02:12:40 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id b9so4580700ilr.2
        for <linux-gpio@vger.kernel.org>; Tue, 01 Jun 2021 02:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5FoR+/eYb1rW21TlVo03buGAHHZWH5nyI7fk4owKFw8=;
        b=Q+y3UEj3vKJFXJatB22lace3r1DqAhxxlJnOUiNPpCMVdFiihQwbSclNksvYgPknVn
         wWKtTlCRlR35CHraJjtopEY8OjG2taAz49NM6UO59Q+fy7Z2NGM7q1aTJJwD1Tfnqw/6
         vDAKRnEx+4a7noLaj+QRve8bfzf5lTh+msAEeEUn/rwpIHFhjxjkpx7bI5GbWceteNi2
         Jcs51rLtnhaucnCFzwJJPbxUGS5mZY5NjO9K3e65kiERXqntYW0gPFfZnEMPfMHyzSlD
         pb6PaLatsheO7hWtr1xF41N7jc2XYonhvtmLOikqD6xv680NMnTaQ4mCHDiKHG7Te4/T
         3rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5FoR+/eYb1rW21TlVo03buGAHHZWH5nyI7fk4owKFw8=;
        b=CUUEhFif9cDqPxeBdxlQ7j+2PkuTtcl6xDz/BlXtlyEawI3nAudsyiFtUXmbgTvWGX
         FegPV3T7UwGY62Eaak4bZQvTm7mvI6lIy6QiJiOUlJzufilJcSousoThZVk6qxVHJdZw
         OKrFuQ7i8CLlx428rNaSkZuIJeDNf40Q1ugs3tHPUPzULQzsuhXoTVmdVMYzefpvPkU0
         1bsINCXEsJiFvkVRHywBB05kwaKcdG6ndzQ4OOE6czKfXWJyPX9J6RgShJ9n0iiENEuh
         NaYqnV50l7/d2vNwlh4xUGiIbl5WcnHwiIAR9oj/nkJ0I9mUzd626SrPkEqb4NZFRIu1
         3etw==
X-Gm-Message-State: AOAM53343bgseik92snSV8iPB3KaYQ4yHPKmSBj0Dx0yXxigRgwPgd4B
        nX8DgoTR5DFzjwbC8kYnkQoVAm7gCuuQ8SLMKOqyyw==
X-Google-Smtp-Source: ABdhPJyHNALIOZuxxUGxFb2JVTyybRwvwpNRTHiq+qY9id22UNLQVvoJcvwKrLFDlMmyeYA0DuVPEjy8beUimMpW94A=
X-Received: by 2002:a05:6e02:216b:: with SMTP id s11mr21076167ilv.267.1622538759785;
 Tue, 01 Jun 2021 02:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210531125143.257622-1-robert.marko@sartura.hr> <20210601083944.GW543307@dell>
In-Reply-To: <20210601083944.GW543307@dell>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Tue, 1 Jun 2021 11:12:29 +0200
Message-ID: <CA+HBbNHXSv7xMQB268HZtdHr+vMF_3OnxYBfJ8aBUtqbbLhoXA@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] mfd: simple-mfd-i2c: Add Delta TN48M CPLD support
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        p.zabel@pengutronix.de, robh+dt@kernel.org,
        devicetree@vger.kernel.org, Luka Perkov <luka.perkov@sartura.hr>,
        jmp@epiphyte.org, Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 1, 2021 at 10:39 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Mon, 31 May 2021, Robert Marko wrote:
>
> > Delta TN48M switches have a Lattice CPLD that serves
> > multiple purposes including being a GPIO expander.
> >
> > So, lets use the simple I2C MFD driver to provide the MFD core.
> >
> > Also add a virtual symbol which pulls in the simple-mfd-i2c driver and
> > provide a common symbol on which the subdevice drivers can depend on.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> > Changes in v2:
> > * Drop the custom MFD driver and header
> > * Use simple I2C MFD driver
> >
> >  drivers/mfd/Kconfig          | 10 ++++++++++
> >  drivers/mfd/simple-mfd-i2c.c |  1 +
> >  2 files changed, 11 insertions(+)
>
> I responded to a previous version of this.
>
> The question still remains - why do you need one single Regmap
> encompassing all functionality.  The register banks look separated to
> me at first glance.

Hi Lee,
In the end, I replied to your v2 comments as well.
It's quite extensive so I don't want to copy the replies here again.

Is that okay, or should I copy the answers here as well?

Regards,
Robert
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Senior Technical Lead - Developer Services
> Linaro.org =E2=94=82 Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
