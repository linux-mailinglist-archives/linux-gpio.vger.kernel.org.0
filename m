Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE855197E9A
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2020 16:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728658AbgC3OhN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Mar 2020 10:37:13 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:37084 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728356AbgC3OhK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Mar 2020 10:37:10 -0400
Received: by mail-il1-f195.google.com with SMTP id a6so15990805ilr.4
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2020 07:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IxNXeVA0jabTfxB9gROOjT1JF+nYiIiBsZtSPXsvX+M=;
        b=SEsGSlAkAq7kvJS1VYZJcqR4AJhsJuoPUhgMbkk3JafHzHF66EL0seoHaeWlH568uq
         tDgaJ9vtCmFxUubE+xYdeRDUi4KTo+faDPsQod4ocxH/EoG0Xj7AE2NzSY+K43lWfcrL
         6iL3uwdP3OnOIkBcZnfq5xSNFS42Vm2niEeVRe/SVNDx/1jX6Aa0yTmtmWUYhHurquPw
         Jh/RQ8K+rNUUnuFwPhcHcSJc2cNcXDL8d325U44pr6emflT0qtirCS82i7XM8phDpt5v
         mINUJZiGPyOxp63818+WfYSioBtWE+02kbP6O4WMNe0Aki0DyXJ3N9d+e6ShBmXD7oHG
         Awhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IxNXeVA0jabTfxB9gROOjT1JF+nYiIiBsZtSPXsvX+M=;
        b=jn/188SP8AVbaKu6TFMMGklbnhF6RsKnJth8Joz7QL9M6s1Vxit/l7UA59fELBqy1O
         EHF7yADZqpHUS2H/FgZCu0emmNYgYmFO5tMUbCVUzx21kScom7LImOiq4r1TGTHSkOnJ
         /lly7+AnPDDMQT2RDZ7cbLG6SKvvZzutk14V2+/cA/8yoV5T4Rrk4yIAcsnwKrTElDOL
         KCDYfknHFp6EobADLVGyyE/GhWv9O3NNWiCs5TjA08UQbSc3BOIx+ymbkOF0nakMriM+
         Y63E30Qi86iICRpXtDuZcLiDsX+RaRJ4JdYyyxgluTYUe5ukDnML4Y5S8VPvBHX+ICQl
         HCUg==
X-Gm-Message-State: ANhLgQ3CroyqAHSTbTMTyTVe3VZCMNiEXFd26ZNzmUFMT4SasnqezKSQ
        p77K43Sew5m0tMYuAh71XVztZpCm8/36aePvs1xDBw==
X-Google-Smtp-Source: ADFU+vtCRUcet9Ol6edmtrTgiJaQqxlFSOniI6lnjEMLFkkPk3juAcB8HwPik3oLpwdOg4O05KtVRU/chRQsAOCgdes=
X-Received: by 2002:a92:bbd8:: with SMTP id x85mr11862710ilk.40.1585579027952;
 Mon, 30 Mar 2020 07:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200224094158.28761-1-brgl@bgdev.pl> <20200224094158.28761-3-brgl@bgdev.pl>
 <CACRpkdZSooH+mXbimgT-hnaC2gO1nTi+rY7UmUhVg9bk1j+Eow@mail.gmail.com>
 <CAMRc=Mf2Mx+rB7du8D66WP=Js0wuK8x44aT9H2q6JhLJvrOcVQ@mail.gmail.com> <CACRpkdaPwfpfDJ2CjGCVFbMvXaSnCXaisvb2N-edeZO0Tbkssw@mail.gmail.com>
In-Reply-To: <CACRpkdaPwfpfDJ2CjGCVFbMvXaSnCXaisvb2N-edeZO0Tbkssw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 30 Mar 2020 16:36:57 +0200
Message-ID: <CAMRc=Mf5cYtWxAVeMQmxwyoi9oxtVSidBQsdRV9H2E52H1TqKQ@mail.gmail.com>
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

czw., 26 mar 2020 o 21:50 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):
>
> On Fri, Mar 13, 2020 at 3:47 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
> > czw., 12 mar 2020 o 11:35 Linus Walleij <linus.walleij@linaro.org> napi=
sa=C5=82(a):
>
> > In this case I was thinking about a situation where we pass a
> > requested descriptor to some other framework (nvmem in this case)
> > which internally doesn't know anything about who manages this resource
> > externally. Now we can of course simply not do anything about it and
> > expect the user (who passed us the descriptor) to handle the resources
> > correctly. But what happens if the user releases the descriptor not on
> > driver detach but somewhere else for whatever reason while nvmem
> > doesn't know about it? It may try to use the descriptor which will now
> > be invalid. Reference counting in this case would help IMHO.
>
> I'm so confused because I keep believing it is reference counted
> elsewhere.
>
> struct gpio_desc *d always comes from the corresponding
> struct gpio_device *descs array. This:
>
> struct gpio_device {
>         int                     id;
>         struct device           dev;
> (...)
>         struct gpio_desc        *descs;
> (...)
>
> This array is allocated in gpiochip_add_data_with_key() like this:
>
>         gdev->descs =3D kcalloc(chip->ngpio, sizeof(gdev->descs[0]), GFP_=
KERNEL);
>
> Then it gets free:d in gpiodevice_release():
>
> static void gpiodevice_release(struct device *dev)
> {
>         struct gpio_device *gdev =3D dev_get_drvdata(dev);
> (...)
>         kfree(gdev->descs);
>         kfree(gdev);
> }
>
> This is the .release function for the gdev->dev, the device inside
> struct gpio_device,
> i.e. the same device that contains the descs in the first place. So it
> is just living
> and dying with the struct gpio_device.
>
> struct gpio_device does *NOT* die in the devm_* destructor that gets call=
ed
> when someone has e.g. added a gpiochip using devm_gpiochip_add_data().
>
> I think the above observation is crucial: the lifetime of struct gpio_chi=
p and
> struct gpio_device are decoupled. When the struct gpio_chip dies, that
> just "numbs" all gpio descriptors but they stay around along with the
> struct gpio_device that contain them until the last
> user is gone.
>
> The struct gpio_device reference counted with the call to get_device(&gde=
v->dev)
> in gpiod_request() which is on the path of gpiod_get_[index]().
>
> If a consumer gets a gpio_desc using any gpiod_get* API this gets
> increased and it gets decreased at every gpiod_put() or by the
> managed resources.
>
> So should you not rather exploit this fact and just add something
> like:
>
> void gpiod_reference(struct gpio_desc *desc)
> {
>     struct gpio_device *gdev;
>
>     VALIDATE_DESC(desc);
>     gdev =3D desc->gdev;
>     get_device(&gdev->dev);
> }
>
> void gpiod_unreference(struct gpio_desc *desc)
> {
>     struct gpio_device *gdev;
>
>     VALIDATE_DESC(desc);
>     gdev =3D desc->gdev;
>     put_device(&gdev->dev);
> }
>
> This should make sure the desc and the backing gpio_device
> stays around until all references are gone.
>
> NB: We also issue try_module_get() on the module that drives the
> GPIO, which will make it impossible to unload that module while it
> has active GPIOs. I think maybe the whole logic inside gpiod_request()
> is needed to properly add an extra reference to a gpiod else someone
> can (theoretically) pull out the module from below.
>

Thanks a lot for the detailed explanation. I'll make some time
(hopefully soon) to actually test this path and let you know if it
works as expected.

Best regards,
Bartosz Golaszewski
