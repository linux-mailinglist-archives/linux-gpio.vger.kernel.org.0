Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9B9332A6A
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 16:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231571AbhCIP2e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 10:28:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231410AbhCIP2X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 10:28:23 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0905C06174A
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 07:28:23 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id a4so8997270pgc.11
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 07:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ipCKk9OjzE3SL4cEGjIfn8o5/ZuQlyILAMATKdXh8bs=;
        b=V/FsPGYgZUReqYrCd2vCmxCPg3ga2NCeORQwlilfVPOjKiKO90+gZxVRRWh0lhkuQh
         mg61YObUe7u6AnnUZU7Y2CLCj8uLzOxy3bgGJ1pSwto9DihA513zPKL3GGfGIoCt1CRi
         VNwIoeeeECyBNEh9/pVEoyI9aAcQydSpTJAH74h+OpqtCxP5kkfQCOzGPhosI22Q1y2V
         jrbrnx0dPNhnuDB9dSpfEFcmz5PRuUXjNlPBgNzxVhBFbwgZGJZKqbY/UpuR19N/BIRu
         5JN1g+62GMIY79fwBqeCUtmyLvu/86Au5LuvgnaUiyVLvzIPigoJJmwKqOo7VhVLpERu
         ED8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ipCKk9OjzE3SL4cEGjIfn8o5/ZuQlyILAMATKdXh8bs=;
        b=SLBYiaPwrIGtjPLKTSS/KcCiilcXn/YsHUsoU1dJqwoCKu31xn1+V+g6glTFKzW2B4
         aNeumgZ+RT/jILbM85qRXCab1Tk91kuZjqYPAvpV7gAo4cxEUMdyuKN5zLqnxWSEyhnM
         HUoPRfrS/oPFPYiHgX2xYpAckQDx7MvtSs+c0WFEX/syd707u9lFm9rUa68W/JLGwiE4
         1ul1TLvPyGEKsdyBGpELML1VUxsWvhH55FnDMD7/2o2RWs06q2XaFpfaVKgpS1Frb0o0
         FK05e21UpvMbhmO2Fh5m0fN3M+Ag4catwzNe4wNvwR1wb7ZQ3xvaUDIntdIISLWetjrc
         9lEA==
X-Gm-Message-State: AOAM533DC7jLVNsJDNQpFIbcU4BcPWJGrAPnArmwD/tw5txLeAccFehZ
        G/tNa6vPLWjN/MbwROXWSK0w3O0iUrXcBDZNp94=
X-Google-Smtp-Source: ABdhPJxh3h0545xCYN1Zd6bEEK2nZQtpPu7geEdFm2ZZrsBgHDI2ofo+W8I14jcVRED+dieKsrAEbZaJIHGswLiTAF8=
X-Received: by 2002:a63:ce15:: with SMTP id y21mr25791648pgf.4.1615303703211;
 Tue, 09 Mar 2021 07:28:23 -0800 (PST)
MIME-Version: 1.0
References: <20210309132639.29069-1-brgl@bgdev.pl> <20210309132639.29069-7-brgl@bgdev.pl>
 <YEePMkDDZA2Jxurr@smile.fi.intel.com> <CAMRc=MdmdsQ=gPkOJdcV7OCkvXww6oNx0zgEQM+XYccxpLKLiw@mail.gmail.com>
In-Reply-To: <CAMRc=MdmdsQ=gPkOJdcV7OCkvXww6oNx0zgEQM+XYccxpLKLiw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 9 Mar 2021 17:28:06 +0200
Message-ID: <CAHp75VfcS35=xbYLEiyzc1-jz9Jt8_Uk1Vzzv1Dx6DjiwUTcvA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 6/6] core: hide the GPIOD_API symbol
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 9, 2021 at 5:20 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Tue, Mar 9, 2021 at 4:07 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Tue, Mar 09, 2021 at 02:26:39PM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > GPIOD_API is unneccesarily polluting the user-facing headers. There's=
 no
> > > advantage to having it in public files. Let's make them internal to t=
he
> > > library. Upcoming modifications will also make GPIOD_BIT() redundant =
so
> > > we'll be able to remove all macros unrelated to the main functionalit=
y
> > > from gpiod.h.
> >
> > > -libgpiodcxx_la_SOURCES =3D chip.cpp iter.cpp line.cpp line_bulk.cpp
> > > +libgpiodcxx_la_SOURCES =3D chip.cpp internal.h iter.cpp line.cpp lin=
e_bulk.cpp
> >
> > Don't we have something like _HEADERS ?
> >
>
> _HEADERS is for headers that are installed. Headers for internal use
> should be defined as part of sources in autotools.

TIL :-)

"The noinst_HEADERS variable can be used for such headers. However
when the header actually belongs to a single convenience library or
program, we recommend listing it in the program=E2=80=99s or library=E2=80=
=99s
_SOURCES variable (see Program Sources) instead of in noinst_HEADERS.
This is clearer for the Makefile.am reader. noinst_HEADERS would be
the right variable to use in a directory containing only headers and
no associated library or program."


--=20
With Best Regards,
Andy Shevchenko
