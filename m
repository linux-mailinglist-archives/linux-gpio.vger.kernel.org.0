Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E27AF1D3182
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2020 15:42:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgENNmQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 May 2020 09:42:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726050AbgENNmP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 14 May 2020 09:42:15 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B27EC061A0C
        for <linux-gpio@vger.kernel.org>; Thu, 14 May 2020 06:42:15 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id h10so1374477iob.10
        for <linux-gpio@vger.kernel.org>; Thu, 14 May 2020 06:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DM0Zs84M3D3yBZL6gmeRktgTLyCvswcVEW/o+2IetiQ=;
        b=S6H0m/q8FaOxTVnRA4V0fdlecEihAQWgDKQBmaekqtPVE7nKwbQqF/5qtwpvWdfURl
         vaY5QgXbrtLhk2eZjjhEmh1W/1GFO5SlObEWGUpRVazjB5w6/Pqt1dQAw+08XQPU7NvT
         WyjGYCA9F2RSwPIuuSgKAUSplik5Of+SMF3QJzVZoDS6roKO5bpWf/0gw6VgAlsn4PYC
         QVnHgEU320coOlk+DxIbmKH6ZCo9PH5yYbj8+H61MdL+kvE4a5ZQyl7YcvDMuacO86TH
         W9TxKMvsQO9oWNf9yvPop2jPD55oupeqA3Gf8wUcw06Oh3Jx7vkBg8uZJkB4mgwcdXbi
         xAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DM0Zs84M3D3yBZL6gmeRktgTLyCvswcVEW/o+2IetiQ=;
        b=q1l66gqtDirGCu2cEYbLAwb74mBmQLa+/KAx1t7e1NWA3FHFN3q9kpSJ4RjcmbNSD1
         LVqr98zrGoVrhYMWOrbR0NFnlP6QF8CCCF1iMwYnzXFflikHVryNj34PQ/W9A0DokoCH
         2BSYIIsGOVT8SUFaQGLj49NQCZ5ztS/J9wqfG9hvTvOcYuioE2DBd8d9JWGJn4cTAZ17
         l7DvKZbLRELCKWaCFwr1BRHGNQlhExhRCA4iffhmvOcHbb04SagR/U+aCl4mqglYndh8
         v0+TQWwXcis0bMniaSjRCVsT+CqdT0zYeTOnJFtWf8c8sv/mdECOoPf26bWGXnmU+CT7
         +cPg==
X-Gm-Message-State: AOAM5305Nuck7bKAqY0BucTIAzvbXhF+0XZPW3+jW9lsk+Og5Bg1uaJY
        NEGKWHe8dM8hlnwh9wkgFyz7/HgbA7PHBbp84PJqpQ==
X-Google-Smtp-Source: ABdhPJxVJV4nI+0VRTUxY0yMVPyDO/77CFg9hDKghSOEAnDlawFSoU1d4OhchN7u8vFmkq1llk71u4F7L9UIi1TrxYw=
X-Received: by 2002:a6b:7c45:: with SMTP id b5mr4162917ioq.31.1589463734956;
 Thu, 14 May 2020 06:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200224094158.28761-1-brgl@bgdev.pl> <20200224094158.28761-3-brgl@bgdev.pl>
 <CACRpkdZSooH+mXbimgT-hnaC2gO1nTi+rY7UmUhVg9bk1j+Eow@mail.gmail.com>
 <CAMRc=Mf2Mx+rB7du8D66WP=Js0wuK8x44aT9H2q6JhLJvrOcVQ@mail.gmail.com>
 <CACRpkdaPwfpfDJ2CjGCVFbMvXaSnCXaisvb2N-edeZO0Tbkssw@mail.gmail.com> <CAMRc=Mf5cYtWxAVeMQmxwyoi9oxtVSidBQsdRV9H2E52H1TqKQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mf5cYtWxAVeMQmxwyoi9oxtVSidBQsdRV9H2E52H1TqKQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 14 May 2020 15:42:03 +0200
Message-ID: <CAMRc=MenC3i-jQYPMdnOfpvNvs1GzCo-B5oem3osdaZZ9mULag@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpiolib: use kref in gpio_desc
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 30 mar 2020 o 16:36 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(=
a):
>
> czw., 26 mar 2020 o 21:50 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):
> >
> > On Fri, Mar 13, 2020 at 3:47 PM Bartosz Golaszewski <brgl@bgdev.pl> wro=
te:
> > > czw., 12 mar 2020 o 11:35 Linus Walleij <linus.walleij@linaro.org> na=
pisa=C5=82(a):
> >
> > > In this case I was thinking about a situation where we pass a
> > > requested descriptor to some other framework (nvmem in this case)
> > > which internally doesn't know anything about who manages this resourc=
e
> > > externally. Now we can of course simply not do anything about it and
> > > expect the user (who passed us the descriptor) to handle the resource=
s
> > > correctly. But what happens if the user releases the descriptor not o=
n
> > > driver detach but somewhere else for whatever reason while nvmem
> > > doesn't know about it? It may try to use the descriptor which will no=
w
> > > be invalid. Reference counting in this case would help IMHO.
> >
> > I'm so confused because I keep believing it is reference counted
> > elsewhere.
> >
> > struct gpio_desc *d always comes from the corresponding
> > struct gpio_device *descs array. This:
> >
> > struct gpio_device {
> >         int                     id;
> >         struct device           dev;
> > (...)
> >         struct gpio_desc        *descs;
> > (...)
> >
> > This array is allocated in gpiochip_add_data_with_key() like this:
> >
> >         gdev->descs =3D kcalloc(chip->ngpio, sizeof(gdev->descs[0]), GF=
P_KERNEL);
> >
> > Then it gets free:d in gpiodevice_release():
> >
> > static void gpiodevice_release(struct device *dev)
> > {
> >         struct gpio_device *gdev =3D dev_get_drvdata(dev);
> > (...)
> >         kfree(gdev->descs);
> >         kfree(gdev);
> > }
> >
> > This is the .release function for the gdev->dev, the device inside
> > struct gpio_device,
> > i.e. the same device that contains the descs in the first place. So it
> > is just living
> > and dying with the struct gpio_device.
> >
> > struct gpio_device does *NOT* die in the devm_* destructor that gets ca=
lled
> > when someone has e.g. added a gpiochip using devm_gpiochip_add_data().
> >
> > I think the above observation is crucial: the lifetime of struct gpio_c=
hip and
> > struct gpio_device are decoupled. When the struct gpio_chip dies, that
> > just "numbs" all gpio descriptors but they stay around along with the
> > struct gpio_device that contain them until the last
> > user is gone.
> >
> > The struct gpio_device reference counted with the call to get_device(&g=
dev->dev)
> > in gpiod_request() which is on the path of gpiod_get_[index]().
> >
> > If a consumer gets a gpio_desc using any gpiod_get* API this gets
> > increased and it gets decreased at every gpiod_put() or by the
> > managed resources.
> >
> > So should you not rather exploit this fact and just add something
> > like:
> >
> > void gpiod_reference(struct gpio_desc *desc)
> > {
> >     struct gpio_device *gdev;
> >
> >     VALIDATE_DESC(desc);
> >     gdev =3D desc->gdev;
> >     get_device(&gdev->dev);
> > }
> >
> > void gpiod_unreference(struct gpio_desc *desc)
> > {
> >     struct gpio_device *gdev;
> >
> >     VALIDATE_DESC(desc);
> >     gdev =3D desc->gdev;
> >     put_device(&gdev->dev);
> > }
> >
> > This should make sure the desc and the backing gpio_device
> > stays around until all references are gone.
> >
> > NB: We also issue try_module_get() on the module that drives the
> > GPIO, which will make it impossible to unload that module while it
> > has active GPIOs. I think maybe the whole logic inside gpiod_request()
> > is needed to properly add an extra reference to a gpiod else someone
> > can (theoretically) pull out the module from below.
> >
>
> Thanks a lot for the detailed explanation. I'll make some time
> (hopefully soon) to actually test this path and let you know if it
> works as expected.
>
> Best regards,
> Bartosz Golaszewski

Hi Linus,

So this "numbing down" of the chip works - in that I don't see any
splat in the above use-case but right now if nvmem takes an existing
GPIO descriptor over nvmem_config, then it will call gpiod_put() on it
and we'll do the same in the provider driver leading to the following
warning:

[  109.191755] ------------[ cut here ]------------
[  109.191787] WARNING: CPU: 0 PID: 207 at drivers/gpio/gpiolib.c:3097
release_nodes+0x1ac/0x1f8
[  109.191794] Modules linked in: at24
[  109.191975] CPU: 0 PID: 207 Comm: rmmod Not tainted
5.7.0-rc5-00001-g8c4cd0ae52ce-dirty #12
[  109.191982] Hardware name: Generic AM33XX (Flattened Device Tree)
[  109.192028] [<c01119ec>] (unwind_backtrace) from [<c010b9c0>]
(show_stack+0x10/0x14)
[  109.192050] [<c010b9c0>] (show_stack) from [<c05456b4>]
(dump_stack+0xc0/0xe0)
[  109.192076] [<c05456b4>] (dump_stack) from [<c0138b30>] (__warn+0xc0/0xf=
8)
[  109.192095] [<c0138b30>] (__warn) from [<c0138ec4>]
(warn_slowpath_fmt+0x58/0xb8)
[  109.192112] [<c0138ec4>] (warn_slowpath_fmt) from [<c0635938>]
(release_nodes+0x1ac/0x1f8)
[  109.192136] [<c0635938>] (release_nodes) from [<c0631d7c>]
(device_release_driver_internal+0xf8/0x1b8)
[  109.192154] [<c0631d7c>] (device_release_driver_internal) from
[<c0631eac>] (driver_detach+0x58/0xa8)
[  109.192172] [<c0631eac>] (driver_detach) from [<c0630ae0>]
(bus_remove_driver+0x4c/0xa4)
[  109.192191] [<c0630ae0>] (bus_remove_driver) from [<c01d80e0>]
(sys_delete_module+0x1bc/0x240)
[  109.192211] [<c01d80e0>] (sys_delete_module) from [<c0100260>]
(__sys_trace_return+0x0/0x20)

I'm not sure how to go about fixing it though. We could check in nvmem
if the descriptor was retrieved locally or passed from the nvmem
provider and the either put it or not respectively but this isn't very
clean.

Bart
