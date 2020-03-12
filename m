Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50021182D1B
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2020 11:11:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbgCLKLB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 06:11:01 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:45132 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbgCLKLA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2020 06:11:00 -0400
Received: by mail-vs1-f65.google.com with SMTP id x82so3271238vsc.12
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2020 03:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=adPh4l9+vv5vShtienk3OfF5G/fVH1YMeS15E/QDPWk=;
        b=zQatgRIo3o+DI6r1qaQF3rn+YZKydrHsDOz0vyf6+EeuOF9qCWcgJ94jVBrfuLPGT7
         hGQ7UmiDj/PZERjAuLnm3dpal4vSVKfNa6PWaZqhl0Jai634q+hacqQ8pgPR6wBAmzxN
         T9gywaTZ7YhkbQG8hr34jT4nRCLJ+GfHcWCN/1Mm30QC+V9p3mELfi/AGx2CqdIxB3JR
         grEBFKHQcxMLAYIj/UZu1njSnk9ckFcXjRTCIs9p9vTvmu6ILh7kEkbkvLeLsOqIW+fo
         /DKFODZo7eA5R10V7auhKY1DG5YuSU4kQpc0Hf4ObIhBINNk3HzUBDh6B0JIEjWP+0qt
         6Cvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=adPh4l9+vv5vShtienk3OfF5G/fVH1YMeS15E/QDPWk=;
        b=S6VUAMxhcs8RBTXBcEpL7/sEkqrX2wqs/Pe1oZ7H059goYNyH71wPigwx/AuVdYlli
         i8uj9oGaFhxIJehOh7zoilWa8ue4j6OhLqeYSM9m1vgu2RDpKn/2jYNnz69Ov80Jtase
         5lWhuly9o0tzyeV/lghCZUWFM+VCbQLJlv2Ax3bz1CxOYnl5WstMxW/oUSqyFVhq395c
         klmJvAfsAwo8RLldYcx+CQTa0gD7306FPvR69wX7uunqSuBTGLV000SN4/DOFthJaiRJ
         /T7BXK4OdvGgrdP3NbO9svlsBAjQLD4k0LWHfNJGCADvyRA6yt+QhxexVnBix5xj32Pb
         hucA==
X-Gm-Message-State: ANhLgQ0SCaTskKs0iM6VBTGSdXz6bzUbbjSiZp+/aPab4h6K2xLohL01
        Soq1GU53ld3uky7GqUTKOSWgEH0XXOy0TFHjGQhp0w==
X-Google-Smtp-Source: ADFU+vsID1xkY+wFivQLhebvvl7S4nNSSli4/jtofpnQeZHwhbjEhNpZsU5HTdmUCpWuwrS1O7t31ALmdVD09M4HzS8=
X-Received: by 2002:a67:7c8f:: with SMTP id x137mr4177597vsc.99.1584007859291;
 Thu, 12 Mar 2020 03:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200224094158.28761-1-brgl@bgdev.pl> <20200224094158.28761-3-brgl@bgdev.pl>
 <CAMRc=MdbvwQ3Exa2gmY-J0p8UeB-_dKrgqHEBo=S08yU4Uth=A@mail.gmail.com>
In-Reply-To: <CAMRc=MdbvwQ3Exa2gmY-J0p8UeB-_dKrgqHEBo=S08yU4Uth=A@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Mar 2020 11:10:46 +0100
Message-ID: <CACRpkdbBCihyayQ=hPVLY8z4G=n5cxLnUmaPpHRuKedDQPVUyQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpiolib: use kref in gpio_desc
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Khouloud Touil <ktouil@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 5, 2020 at 5:49 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> I refreshed my memory on device links and reference counting. I think
> that device links are not the right tool for the problem I'm trying to
> solve.

OK, just check the below though so we are doing reference
counting in the right place.

> You're right on the other hand about the need for reference
> counting of gpiochip devices. Right now if we remove the chip with
> GPIOs still requested the only thing that happens is a big splat:
> "REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED".
>
> We should probably have a kref on the gpiochip structure which would
> be set to 1 when registering the chip, increased and decreased on
> every operation such as requesting and releasing a GPIO respectively
> and decreased by gpiochip_remove() too. That way if we call
> gpiochip_remove() while some users are still holding GPIO descriptors
> then the only thing that happens is: the reference count for this
> gpiochip is decreased. Once the final consumer calls the appropriate
> release routine and the reference count goes to 0, we'd call the
> actual gpiochip release code. This is similar to what the clock
> framework does IIRC.

I don't think that is consistent with the device model: there is already
a struct device inside struct gpio_device which is what gets
created when the gpio_chip is registered.

The struct device inside struct gpio_device contains a
struct kobject.

The struct kobject contains a struct kref.

This kref is increased and decreased with get_device() and
put_device(). This is why in the gpiolib you have a bunch of
this:
get_device(&gdev->dev);
put_device(&gdev->dev);

This is used when creating any descriptor handle with
[devm_]gpiod_request(), linehandles or lineevents.

So it is already reference counted and there is no need to
introduce another reference counter on gpio_chips.

The reason why gpiochip_remove() right now
enforces removal and only prints a warning if you remove
a gpio_chip with requested GPIOs on it, is historical.

When I created the proper device and char device, the gpiolib
was really just a library (hence the name) not a driver framework.
Thus there was no real reference counting of anything
going on, and it was (as I perceived it) pretty common that misc
platforms just pulled out the GPIO chip underneath the drivers
using the GPIO lines.

If we would just block that, say refuse to perform the .remove
action on the module or platform (boardfile) code implementing
GPIO I was worried that we could cause serious regressions.

But I do not think this is a big problem?

Most drivers these days are using devm_gpiochip_add_data()
and that will not release the gpiochip until exactly this same
kref inside struct device inside gpio_device goes down to
zero.

If we should put effort anywhere I think it should be in
making more drivers use devm_gpiochip_add_data()
even if they are not adding any data, because that will make
sure the gpio_chip is not getting removed as long as there are
active consumers (which includes any kernel-internal
consumers or userspace consumers).

> This patch however addresses a different issue: I'd like to add
> reference counting to descriptors associated with GPIOs requested by
> consumers. The kref release function would not trigger a destruction
> of the gpiochip - just releasing of the requested GPIO. In this
> particular use-case: we can pass an already requested GPIO descriptor
> to nvmem. I'd like the nvmem framework to be able to reference it and
> then drop the reference once it's done with the line, so that the life
> of this resource is not controlled only by the entity that initially
> requested it.
>
> In other words: we could use two kref objects: one for the gpiochip
> and one for GPIO descriptors.

I do not think we need one for the gpiochip.

The other usecase I am somewhat following, but I am still in
a state of confusion on what is the best approach there.
I guess I have to re-read the patch.

Yours,
Linus Walleij
