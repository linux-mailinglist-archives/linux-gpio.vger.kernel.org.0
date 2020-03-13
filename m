Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72740184A29
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2020 16:04:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgCMPE2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Mar 2020 11:04:28 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:45836 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbgCMPE1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Mar 2020 11:04:27 -0400
Received: by mail-io1-f68.google.com with SMTP id w9so9651017iob.12
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2020 08:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=M6Jf0uhjNuAPqMF3VspTE0dgmMdC4OMsyXdDMOejMew=;
        b=yxjDJTAaD9KoowHgCFaZ1x2oEQyBfiIsydEgOn2qo61jDKzjC4e2vqWvn/Vey7bs5o
         AWKuz+y1buqN6jkTcC2apiJu/INZ5zONHH5UPEz4TZRvaDK3zqeVxO+rT2xr4vuuaIVu
         UREsGewVyGHCsX60wHBHy+19rEJFP+ToCYhIJffn43wy/4OPNQC3gU3PXzVzDHACLFtZ
         DE8KqGAXP3YzSCxhSRTtqQMEoXPgwgT2bWebYX04xqyir9XCA/fYYPYLR2U6qCjLQ1rV
         2K1xvFpDJTkH0yc/NQCergU4H6k54I78vggjkPwFxkW5GorhgTVDRMffon+Uvie5yVvj
         r8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=M6Jf0uhjNuAPqMF3VspTE0dgmMdC4OMsyXdDMOejMew=;
        b=axbZ4IcxeZGu/nIM9ULdM4GdSAtKcwwsJ9sxZT3n40MRdXPBUHGohzCgq/36Gikv2t
         8i8jFbUBXtu/ODQrnJ4E6OWLKyw5EEhhVu+fs07rxARHfCKOzYQFo2D8NX6O7lmAIqaU
         5oPjJwW8b87eEpGtZdKvawyWic9MFbTP6ZeiwK/GC6IYcZDjXShyZkzukCWzPIoMkxua
         /nN/xP1eXevUjd4wx9jrca2eXEGxc4b6ELIRfbszeSMR+nTJIdioi4+SSSWrRaP6k+VW
         SArnqP6rRAF3X3kfOjorcxqcqgmsmGK0nLgH7zFH26YK66mVn7NtLMXR2/2J9kk5okHA
         ivyQ==
X-Gm-Message-State: ANhLgQ074/yqGUJ4JMGH3mJrQhH0XGa5LOOy6QXjP85cXN5XEtSbNl74
        FKxkXf6EoFSytoeqis9NlyUWozU6O6q0FqbW4dTF7g==
X-Google-Smtp-Source: ADFU+vsXjLI03CJpkW+hK4JigvAFi75rrqMy+cMcp23JXRlG3WU58AXh7B8JFc5xSpTdF9t6nrl1HTPcFifXEVp30ow=
X-Received: by 2002:a5e:c70c:: with SMTP id f12mr12943645iop.130.1584111866517;
 Fri, 13 Mar 2020 08:04:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200224094158.28761-1-brgl@bgdev.pl> <20200224094158.28761-3-brgl@bgdev.pl>
 <CAMRc=MdbvwQ3Exa2gmY-J0p8UeB-_dKrgqHEBo=S08yU4Uth=A@mail.gmail.com>
 <CACRpkdbBCihyayQ=hPVLY8z4G=n5cxLnUmaPpHRuKedDQPVUyQ@mail.gmail.com>
 <CAMpxmJX_Jqz97bp-nKtJp7_CgJ=72ZxWkEPN4Y-dpNpqEwa_Mg@mail.gmail.com> <CACRpkdYpers8Zzh9A3T0mFSyZYDcrjfn9iaQn92RkVHWE+GinQ@mail.gmail.com>
In-Reply-To: <CACRpkdYpers8Zzh9A3T0mFSyZYDcrjfn9iaQn92RkVHWE+GinQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 13 Mar 2020 16:04:15 +0100
Message-ID: <CAMRc=MdLYD3CeFtp4jF+-P+4kSmt1sAezrkPFk5rK4=whNEWuA@mail.gmail.com>
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

pt., 13 mar 2020 o 09:44 Linus Walleij <linus.walleij@linaro.org> napisa=C5=
=82(a):
>
> On Thu, Mar 12, 2020 at 7:25 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
>
> > I believe this is not correct. The resources managed by devres are
> > released when the device is detached from a driver, not when the
> > device's reference count goes to 0. When the latter happens, the
> > device's specific (or its device_type's) release callback is called -
> > for gpiolib this is gpiodevice_release().
>
> Yeah you're right, I even point that out in my second letter :/
>
> It's a bit of confusion for everyone (or it's just me).
>

No, it is confusing and I only recently understood it while trying to
fix a memory leak in nvmem.

> > The kref inside struct device will not go down to zero until you call
> > device_del() (if you previously called device_add() that is which
> > increases the reference count by a couple points). But what I'm
> > thinking about is making the call to device_del() depend not on the
> > call to gpiochip_remove() but on the kref on the gpio device going
> > down to zero. As for the protection against module removal - this
> > should be handled by module_get/put().
>
> Right. At the end of gpiochip_remove():
>
>    cdev_device_del(&gdev->chrdev, &gdev->dev);
>    put_device(&gdev->dev);
>
> That last put_device() should in best case bring the refcount
> to zero.
>
> So the actual way we lifecycle GPIO chips is managed
> resources using only devm_* but the reference count does work
> too: reference count should normally land at zero since the
> gpiochip_remove() call is ended with a call to
> put_device() and that should (ideally) bring it to zero.
>
> It's just that this doesn't really trigger anything.
>

Not necessarily - if the new kref for GPIO device would be detached
from device reference counting and what it would trigger at release is
this:

   cdev_device_del(&gdev->chrdev, &gdev->dev);
   put_device(&gdev->dev);

Or to be even more clear: "getting" the gpiodevice would not be the
same as "getting" a device - in fact only when the gpiodevice kref
goes down to 0 do we put the reference to the device object.

> I think there is no way out of the fact that we have to
> forcefully remove the gpio_chip when devm_* destructors
> kicks in: the driver is indeed getting removed at that
> point.
>

There does seem to be a way around that though: the clock framework
does it by creating a clock "core" object which is reference counted
and if the provider is removed while consumers still hold references
to it, then it does a couple things to "numb" the provider (as you
nicely put it) like replacing all ops callbacks with NULL pointers but
keeps the structure alive until the consumers also give up all their
references.

That being said: I'm not saying this is necessary or even useful. I
started the discussion because I was under the impression I wasn't
clear enough when writing about reference counting for descriptors. If
nobody complains about the current implementation then let's not fix
something that's not broken.

Bartosz

> In gpiochip_remove() we "numb" the chip so that any
> gpio_desc:s currently in use will just fail silently and not crash,
> since they are not backed by a driver any more. The descs
> stay around until the consumer releases them, but if we probe the
> same GPIO device again they will certainly not re-attach or
> something.
>
> Arguably it is a bit of policy. Would it make more sense to
> have rmmod fail if the kref inside gdev->dev->kobj->kref
> is !=3D 1? I suppose that is what things like storage
> drivers pretty much have to do.
>
> The problem with that is that as soon as you have a consumer
> that is compiled into the kernel it makes it impossible to
> remove the gpio driver with rmmod.
>
> I really needed to refresh this a bit, so the above is maybe
> a bit therapeutic.
>
> I don't really see how we could do things differently without
> creating some other problem though.
>
> Yours,
> Linus Walleij
