Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63292183892
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2020 19:25:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgCLSZL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 14:25:11 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:45288 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbgCLSZK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2020 14:25:10 -0400
Received: by mail-qt1-f194.google.com with SMTP id z8so1821592qto.12
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2020 11:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Jf7CCJlaBzBWuwy+AxN+gg+jjj5mPJjuMgQyXl2F5To=;
        b=dMld6cRIv553ZXuXvnx1/9oXxRUJQVhYQt01RJrga16eD9ADF5ho5x7vzM4Db/aHdG
         +DmeShswgIdAanewpRonn6j3yBEUUSoTOlfx4iMa3nFX8Prgqh15+5c/CDgKro1CFjZ3
         Aj+Nm1GSCTqfhSJKnlpdPUBzKbhgzr+h3YbEEYjiY3y26sbAQqPxfp1Z2wjmNVyFvwsC
         jyxDjn/wZ1pGXSVD7ByXmgAkhFdX3NdyskFUfArocC35/y+7OMb2J0O6fiamvjFnGUms
         cQ/DJ2LHDmuuG5YNQ1Q3lRIGIBddWrY+pL7rv+drHVDkU5yfhF/CPbw66l54yhxNL2OG
         LvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Jf7CCJlaBzBWuwy+AxN+gg+jjj5mPJjuMgQyXl2F5To=;
        b=t1+EYvdqIj4e0M/2ECTfiub3VriFbYkmaTIAFOavSa1d0eTwe2SAZFPcYAHxSCfVIJ
         OfgloNpO/Y0Skah7GlHUrI15WTyN3aQOzpWVFzActVDW8VAPoAangj6KyFwzb7wVzQEh
         BB0Xe/++3Y/FmKe9AuIN1quI6f+syV3BO82KRWWipT7Uu/TB7EPl/Ba3sAlvtCkWLbPf
         3JwsPMmUbLz5Z3sONdFjK6p9GY7elmgS+yWbmTDpAv/zvO7I1JzWIo+qnCsHY9kGm+ER
         dBDZeVuXnXiG5wXLLNMISvFcKH4weOti4P2OloIJAq13ItBgCFrETSoeRzODMz91YKeN
         IaTA==
X-Gm-Message-State: ANhLgQ0ce6ynJ+wLHUNj5lVoWiHJK02GZ3FnHbBZUDIfR7VkCShJinyP
        qo3PRSto89zRvnVCA/WQFDpwrXZfm1eC3h1ucMHhwQ==
X-Google-Smtp-Source: ADFU+vsD3ZKdVJ0pPILwz7IOX2CSRr5vAuzW2yjE2tDAXBhQjc9fBMy9k9lWMN+DWil/TsgvNDIRF44f7yqjpKG8/Qc=
X-Received: by 2002:ac8:5208:: with SMTP id r8mr8806874qtn.131.1584037508177;
 Thu, 12 Mar 2020 11:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200224094158.28761-1-brgl@bgdev.pl> <20200224094158.28761-3-brgl@bgdev.pl>
 <CAMRc=MdbvwQ3Exa2gmY-J0p8UeB-_dKrgqHEBo=S08yU4Uth=A@mail.gmail.com> <CACRpkdbBCihyayQ=hPVLY8z4G=n5cxLnUmaPpHRuKedDQPVUyQ@mail.gmail.com>
In-Reply-To: <CACRpkdbBCihyayQ=hPVLY8z4G=n5cxLnUmaPpHRuKedDQPVUyQ@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 12 Mar 2020 19:24:54 +0100
Message-ID: <CAMpxmJX_Jqz97bp-nKtJp7_CgJ=72ZxWkEPN4Y-dpNpqEwa_Mg@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpiolib: use kref in gpio_desc
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Khouloud Touil <ktouil@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 12 mar 2020 o 11:11 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):
>
> On Thu, Mar 5, 2020 at 5:49 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> > I refreshed my memory on device links and reference counting. I think
> > that device links are not the right tool for the problem I'm trying to
> > solve.
>
> OK, just check the below though so we are doing reference
> counting in the right place.
>
> > You're right on the other hand about the need for reference
> > counting of gpiochip devices. Right now if we remove the chip with
> > GPIOs still requested the only thing that happens is a big splat:
> > "REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED".
> >
> > We should probably have a kref on the gpiochip structure which would
> > be set to 1 when registering the chip, increased and decreased on
> > every operation such as requesting and releasing a GPIO respectively
> > and decreased by gpiochip_remove() too. That way if we call
> > gpiochip_remove() while some users are still holding GPIO descriptors
> > then the only thing that happens is: the reference count for this
> > gpiochip is decreased. Once the final consumer calls the appropriate
> > release routine and the reference count goes to 0, we'd call the
> > actual gpiochip release code. This is similar to what the clock
> > framework does IIRC.
>
> I don't think that is consistent with the device model: there is already
> a struct device inside struct gpio_device which is what gets
> created when the gpio_chip is registered.
>
> The struct device inside struct gpio_device contains a
> struct kobject.
>
> The struct kobject contains a struct kref.
>
> This kref is increased and decreased with get_device() and
> put_device(). This is why in the gpiolib you have a bunch of
> this:
> get_device(&gdev->dev);
> put_device(&gdev->dev);
>
> This is used when creating any descriptor handle with
> [devm_]gpiod_request(), linehandles or lineevents.
>
> So it is already reference counted and there is no need to
> introduce another reference counter on gpio_chips.
>

I think there's one significant detail missing here. While it's true
that the life-time of a device object is controlled by its reference
count, its registration with the driver model is not ie.
device_add/del() are called once per device as opposed to
get/put_device().

> The reason why gpiochip_remove() right now
> enforces removal and only prints a warning if you remove
> a gpio_chip with requested GPIOs on it, is historical.
>

Given the above I think that it wouldn't be possible to add reference
counting to gpio devices without a new kref if the task of the release
callback would be to call device_del() once the provider called its
unregister function and all consumers released requested resources.

> When I created the proper device and char device, the gpiolib
> was really just a library (hence the name) not a driver framework.
> Thus there was no real reference counting of anything
> going on, and it was (as I perceived it) pretty common that misc
> platforms just pulled out the GPIO chip underneath the drivers
> using the GPIO lines.
>
> If we would just block that, say refuse to perform the .remove
> action on the module or platform (boardfile) code implementing
> GPIO I was worried that we could cause serious regressions.
>
> But I do not think this is a big problem?
>
> Most drivers these days are using devm_gpiochip_add_data()
> and that will not release the gpiochip until exactly this same
> kref inside struct device inside gpio_device goes down to
> zero.
>

I believe this is not correct. The resources managed by devres are
released when the device is detached from a driver, not when the
device's reference count goes to 0. When the latter happens, the
device's specific (or its device_type's) release callback is called -
for gpiolib this is gpiodevice_release().

The kref inside struct device will not go down to zero until you call
device_del() (if you previously called device_add() that is which
increases the reference count by a couple points). But what I'm
thinking about is making the call to device_del() depend not on the
call to gpiochip_remove() but on the kref on the gpio device going
down to zero. As for the protection against module removal - this
should be handled by module_get/put().

I may be wrong of course but when looking at the code, this is what I
understand. Please let me know what you think.

Best regards
Bartosz Golaszewski
