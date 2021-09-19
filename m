Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56579410D21
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Sep 2021 21:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231828AbhISTkh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Sep 2021 15:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231805AbhISTkh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Sep 2021 15:40:37 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A72FFC06175F
        for <linux-gpio@vger.kernel.org>; Sun, 19 Sep 2021 12:39:11 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id e15so19532618lfr.10
        for <linux-gpio@vger.kernel.org>; Sun, 19 Sep 2021 12:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bIadyDkpE6/316LTUnCC0TidBZ9oY71WMCqOc1yZgNY=;
        b=O9f2iQI2X3s1wDFqyFd0sJX49hp282luX4LbypgppHKUptIf/KBZ70MYkrGGgHK+93
         uyl4BFoIrEIMeKOczO7/web1DyzdrB0Kliu7nlmQNIwl45FDvOWlAyWzJVXwQedfp9ri
         0dhF+4SjmVnwgK5Gmh5Ez3mv/npNqZ2vCftH4UPufVAP0pV+tPZzvUd/x1snzJlreLAa
         ywTmDwEAApVKvg8nECIW52/OgdI5vet7wcaun7vXQry+ut65hNUDShjEB2d/7zVsmdPR
         yuz8jWG3V9D9bBalcudTmz7lShE8W83WUqdTU2zUJrmHm0KPIQHAtbW7Cs8+V1+ew+HP
         /LFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bIadyDkpE6/316LTUnCC0TidBZ9oY71WMCqOc1yZgNY=;
        b=dJ/eBM6gpSo1/2Nx7lHBKNdDZin/CDi8brNtJz99ZWy9hPiEF7JplMqI50KSu7TwUp
         JJbH3vlcIuvxmv4YM8VFXlhly8GGiDZsz81PM6dW1RMKwZowTVdry0NRR5vE/7vtKzpH
         9oaWK6IvQ4ezW3ycfUotXBKUVFXLp5u5pu4+TlyIL114t0dqIsLTRMOwHP6VBUQcEZy/
         MSjpJzSLzIhw8p+/5RvMrvLTMGLh7QrOKqkpjHCERl0JY7v0ZtajD2icjeIQEelaBbA4
         4JnzlsAqE7Qzm7ZBAxKfEvbXpSQTZZxOITc3MpV4psdQ0cMzkRcLq+hQDE2O/Ed8RYGX
         iSfw==
X-Gm-Message-State: AOAM531propgdLHMeuyAdbI2Uvouh+5R/vQvOVIHh5rRn400xIo+RjqM
        QDNNhkn4k7DP3ttJEgZEwQRerKWBKhkOVW8F/wP1jA==
X-Google-Smtp-Source: ABdhPJyz4cky0jxoPTuDxUR8dY9mZOd7WkP1nRGWzE0e0eTJJnP9izQDD7Qpnp3dqnTK/tfvTuy545H9s8yRoFlbTx0=
X-Received: by 2002:a05:6512:3c92:: with SMTP id h18mr15954960lfv.656.1632080349911;
 Sun, 19 Sep 2021 12:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
 <20210824164801.28896-8-lakshmi.sowjanya.d@intel.com> <CACRpkdYJkPgaz-BvQ1X0PHRCCbn0hrMDabouDwHkn+pr9d-dSQ@mail.gmail.com>
 <20210917072755.d4ynxkp4scxrk6rq@pengutronix.de>
In-Reply-To: <20210917072755.d4ynxkp4scxrk6rq@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 19 Sep 2021 21:38:58 +0200
Message-ID: <CACRpkdZmjWQ_mNw_JOZnkvvU15qS26gB3GL_9k=Vao3m=w_N9w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 07/20] gpio: Add output event generation method to
 GPIOLIB and PMC Driver
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        "open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Saha, Tamal" <tamal.saha@intel.com>, bala.senthil@intel.com,
        Dipen Patel <dipenp@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 17, 2021 at 9:27 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Thu, Sep 16, 2021 at 11:42:04PM +0200, Linus Walleij wrote:
> > On Tue, Aug 24, 2021 at 6:48 PM <lakshmi.sowjanya.d@intel.com> wrote:
> >
> > > From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
> > >
> > > Intel Timed I/O hardware supports output scheduled in hardware. Enabl=
e
> > > this functionality using GPIOlib
> > >
> > > Adds GPIOlib generate_output() hook into the driver. The driver is
> > > supplied with a timestamp in terms of realtime system clock (the same
> > > used for input timestamping). The driver must know how to translate t=
his
> > > into a timebase meaningful for the hardware.
> > >
> > > Adds userspace write() interface. Output can be selected using the li=
ne
> > > event create ioctl. The write() interface takes a single timestamp
> > > event request parameter. An output edge rising or falling is generate=
d
> > > for each event request.
> > >
> > > The user application supplies a trigger time in terms of the realtime
> > > clock the driver converts this into the corresponding ART clock value
> > > that is used to 'arm' the output.
> > >
> > > Work around device quirk that doesn't allow the output to be explicit=
ly
> > > set. Instead, count the output edges and insert an additional edge as
> > > needed to reset the output to zero.
> > >
> > > Co-developed-by: Christopher Hall <christopher.s.hall@intel.com>
> > > Signed-off-by: Christopher Hall <christopher.s.hall@intel.com>
> > > Signed-off-by: Tamal Saha <tamal.saha@intel.com>
> > > Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
> > > Reviewed-by: Mark Gross <mgross@linux.intel.com>
> >
> > So this is some street organ machine that generates sequences
> > with determined timing between positive and negative edges
> > right?
> >
> > I can't see how this hardware is different from a PWM, or well
> > I do to some extent, you can control the period of several
> > subsequent waves, but that is really just an elaborate version
> > of PWM in my book.
>
> From looking in the patch I think this is more versatile than the PWM
> framework abstracts. I wonder if there is a usecase for the
> functionality that cannot be expressed using pwm_apply_state?!
>
> I remember we had approaches before that implemented repeating patterns
> (something like: active for 5ms, inactive for 10 ms, active for 30 ms,
> inactive for 10 ms, repeat) and limiting the number of periods
> (something like: .duty_cycle =3D 5ms, .period =3D 20ms, after 5 periods g=
o
> into inactive state). These were considered to be too special to be
> abstracted in drivers/pwm.
>
> > It seems to me that this part of the functionality belongs in the
> > PWM subsystem which already has interfaces for similar
> > things, and you should probably extend PWM to handle
> > random waveforms rather than trying to shoehorn this
> > into the GPIO subsystem.
>
> I agree that GPIO is a worse candidate than PWM to abstract that. But
> I'm not convinced (yet?) that it's a good idea to extend PWM
> accordingly.

Yeah it is a bit unfortunate.

I think we need to fully understand the intended usecase before
we can deal with this: exactly what was this hardware constructed
to handle? Sound? Robotic stepper motors? It must be something
and apparently there are users.

Maybe even a new subsystem is needed, like a
drivers/gpio-patterns or drivers/stepper-motor or whatever this
is supposed to drive.

Yours,
Linus Walleij
