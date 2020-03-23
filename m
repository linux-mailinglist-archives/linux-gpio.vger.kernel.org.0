Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2B8D18F112
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2020 09:45:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727587AbgCWIo6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Mar 2020 04:44:58 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:43560 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727572AbgCWIo6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Mar 2020 04:44:58 -0400
Received: by mail-io1-f68.google.com with SMTP id n21so13190364ioo.10
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2020 01:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8zPLvGcYQo1o0IQb+SkUkD1MBg65ZhQ3XSlCwhyWfpI=;
        b=Ua25DunDi0MeBVuRXcr6VxR75Zm8tN3mOIgQLv7SVFyOMiQTGlLwB2NhjD5hHMyGh0
         jgbJY8Kv2wMMvllY/0rD5aG71MJobqW61gI5zuPRyiYBq6RN9RhoFIEInxws/vuFougT
         m/FLLRIBW1noWeJQ+8SFmGYFFLbrveNGrvdotyOtaM840t/6npJwkZvNMkqWP6Eo12Q4
         P7lpEQYGPmYNJisG/Rb/DbJraeU/vv11KnJDPi+LCNrWQiUE9eEr56RXwk27WCP2e5V1
         QI1E06abQhbNtKpYYxUUwilUbd9UGJyPYuxk4wDHfg5Llgh8rTn7ZE4Ft/eMN5uLy3oV
         nuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8zPLvGcYQo1o0IQb+SkUkD1MBg65ZhQ3XSlCwhyWfpI=;
        b=IYyAEc4rtcQ9C6uqP/gCzyqINlIZs9A8WLrMC6u9OT56f7f2wE1z15+aTclQDWKUg7
         quEB2/pQbhubtjFytguQ3UqxXw4zhSXE0y4LFpg0EaCw7tyjRrjBYr1DvPvFpfbpK4td
         pzgD+tt/ATIvQtdCqGtBduw1EtnEk8sbpLXlR48eNpwwq6TAZm6CN4SuKmFlsBpBFQdB
         N+Gx4s79UN+xnarA44l0NjuOBrN3lmkGrtKJx4uoFGqYAU+9Z1rgpUl+v0SS3zrQIGmc
         rPc2STxQP50tYLzmbN2z+Va6tvCwjK1dwbOPieHZAtNhR2ywVl7XgBs/oQ/00TH/7uJJ
         NYRw==
X-Gm-Message-State: ANhLgQ3aZs9J2bDzSnRUSvv1e6jwcWwQxUnD0OsncGVv1ZwRMK0YgwuI
        dO1x1ous14TfHyY+qD39QXeQk0Oc1X+w7vVF5tXqeQ==
X-Google-Smtp-Source: ADFU+vuAXHIndZOUmHZ6KwtgPOsJUB4ijygt/ruRcg/bBmcsWhpC3fPPMJnSyb8rsa9k9SR7V6O+b/KvIzcm+1LqfdA=
X-Received: by 2002:a5e:8204:: with SMTP id l4mr18406002iom.31.1584953095899;
 Mon, 23 Mar 2020 01:44:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200224094158.28761-1-brgl@bgdev.pl> <20200224094158.28761-3-brgl@bgdev.pl>
 <CAMRc=MdbvwQ3Exa2gmY-J0p8UeB-_dKrgqHEBo=S08yU4Uth=A@mail.gmail.com>
 <CACRpkdbBCihyayQ=hPVLY8z4G=n5cxLnUmaPpHRuKedDQPVUyQ@mail.gmail.com>
 <CAMpxmJX_Jqz97bp-nKtJp7_CgJ=72ZxWkEPN4Y-dpNpqEwa_Mg@mail.gmail.com>
 <CACRpkdYpers8Zzh9A3T0mFSyZYDcrjfn9iaQn92RkVHWE+GinQ@mail.gmail.com> <CAMRc=MdLYD3CeFtp4jF+-P+4kSmt1sAezrkPFk5rK4=whNEWuA@mail.gmail.com>
In-Reply-To: <CAMRc=MdLYD3CeFtp4jF+-P+4kSmt1sAezrkPFk5rK4=whNEWuA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 23 Mar 2020 09:44:45 +0100
Message-ID: <CAMRc=MfEo6=im5EPHYtht3xN83k+rcRgQDSOB=Ucs52M8RWirg@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpiolib: use kref in gpio_desc
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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

pt., 13 mar 2020 o 16:04 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(a=
):
>
> pt., 13 mar 2020 o 09:44 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):
> >
> > On Thu, Mar 12, 2020 at 7:25 PM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:
> >
> > > I believe this is not correct. The resources managed by devres are
> > > released when the device is detached from a driver, not when the
> > > device's reference count goes to 0. When the latter happens, the
> > > device's specific (or its device_type's) release callback is called -
> > > for gpiolib this is gpiodevice_release().
> >
> > Yeah you're right, I even point that out in my second letter :/
> >
> > It's a bit of confusion for everyone (or it's just me).
> >
>
> No, it is confusing and I only recently understood it while trying to
> fix a memory leak in nvmem.
>
> > > The kref inside struct device will not go down to zero until you call
> > > device_del() (if you previously called device_add() that is which
> > > increases the reference count by a couple points). But what I'm
> > > thinking about is making the call to device_del() depend not on the
> > > call to gpiochip_remove() but on the kref on the gpio device going
> > > down to zero. As for the protection against module removal - this
> > > should be handled by module_get/put().
> >
> > Right. At the end of gpiochip_remove():
> >
> >    cdev_device_del(&gdev->chrdev, &gdev->dev);
> >    put_device(&gdev->dev);
> >
> > That last put_device() should in best case bring the refcount
> > to zero.
> >
> > So the actual way we lifecycle GPIO chips is managed
> > resources using only devm_* but the reference count does work
> > too: reference count should normally land at zero since the
> > gpiochip_remove() call is ended with a call to
> > put_device() and that should (ideally) bring it to zero.
> >
> > It's just that this doesn't really trigger anything.
> >
>
> Not necessarily - if the new kref for GPIO device would be detached
> from device reference counting and what it would trigger at release is
> this:
>
>    cdev_device_del(&gdev->chrdev, &gdev->dev);
>    put_device(&gdev->dev);
>
> Or to be even more clear: "getting" the gpiodevice would not be the
> same as "getting" a device - in fact only when the gpiodevice kref
> goes down to 0 do we put the reference to the device object.
>
> > I think there is no way out of the fact that we have to
> > forcefully remove the gpio_chip when devm_* destructors
> > kicks in: the driver is indeed getting removed at that
> > point.
> >
>
> There does seem to be a way around that though: the clock framework
> does it by creating a clock "core" object which is reference counted
> and if the provider is removed while consumers still hold references
> to it, then it does a couple things to "numb" the provider (as you
> nicely put it) like replacing all ops callbacks with NULL pointers but
> keeps the structure alive until the consumers also give up all their
> references.
>
> That being said: I'm not saying this is necessary or even useful. I
> started the discussion because I was under the impression I wasn't
> clear enough when writing about reference counting for descriptors. If
> nobody complains about the current implementation then let's not fix
> something that's not broken.
>
> Bartosz
>
> > In gpiochip_remove() we "numb" the chip so that any
> > gpio_desc:s currently in use will just fail silently and not crash,
> > since they are not backed by a driver any more. The descs
> > stay around until the consumer releases them, but if we probe the
> > same GPIO device again they will certainly not re-attach or
> > something.
> >
> > Arguably it is a bit of policy. Would it make more sense to
> > have rmmod fail if the kref inside gdev->dev->kobj->kref
> > is !=3D 1? I suppose that is what things like storage
> > drivers pretty much have to do.
> >
> > The problem with that is that as soon as you have a consumer
> > that is compiled into the kernel it makes it impossible to
> > remove the gpio driver with rmmod.
> >
> > I really needed to refresh this a bit, so the above is maybe
> > a bit therapeutic.
> >
> > I don't really see how we could do things differently without
> > creating some other problem though.
> >
> > Yours,
> > Linus Walleij

Hi Linus,

what is your decision on this? Because if we don't merge this, then we
need to make sure nvmem doesn't call gpiod_put() for descriptors it
didn't obtain itself and we should probably fix it this week.

Bart
