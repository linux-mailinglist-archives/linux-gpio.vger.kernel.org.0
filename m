Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FBF13A3DF0
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jun 2021 10:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbhFKIYk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Jun 2021 04:24:40 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50]:33402 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbhFKIYk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Jun 2021 04:24:40 -0400
Received: by mail-ua1-f50.google.com with SMTP id l12so2313320uai.0;
        Fri, 11 Jun 2021 01:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DaNuOXRSxAprVjd9ifIAHGPCmMrvZ/ZSFrIGL+2Y/dE=;
        b=fTUQj10ZAo9qvl5uIFPxOMX2vsjgZfzQz7CS5DfE+hqExwfZCY80PW4rrUu/ZmgnSO
         QUjhntPHjG/RiCcIu/A4iSaJlgQL5PwT5aFlAzA8ATy5vXHtcCn+7cLv/bu0r6U3/IxJ
         mrB81G4RhbKVRZmUU7iaTqjR2JevEX9Kd5zmPTDXEzITnMSANaSVA3VW1UGeabMV7Ht7
         daI5sOe5v9Dzn2dKk6jZ2gaJt0v4WkjjHZZ986CuN2DGwWV50cwL0KrFFlYs3wr65jsB
         R/03gllN0uzQN9qA6D17Zb+t4CIa7qZ0wuozsyo8YVJ66mBlPVfvIKQILqMQIKxKMRjD
         fgZg==
X-Gm-Message-State: AOAM5326Gcu/DaAjHXLSLz/K0KbEf9YE/FHiJRAZmPUM+dAxWz8t1L7Q
        3Xd19+910V+/9RVFdjqaAuPtnS+aZB+OzlR1SU4=
X-Google-Smtp-Source: ABdhPJyq4EqZlgDmCn8qqnGSQ1vrn3RQ/ZL8+yV4kreGJqiceay6WnvbNfvZoUE7c6JDA+lO6bKUsRxnP775QgEyE8M=
X-Received: by 2002:ab0:71d9:: with SMTP id n25mr1885900uao.2.1623399762314;
 Fri, 11 Jun 2021 01:22:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623326176.git.viresh.kumar@linaro.org> <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
 <CACRpkdZV2v2S5z7CZf_8DV=At9-oPSj7RYFH78hWy3ZX37QnDQ@mail.gmail.com>
 <20210611035623.z4f2ynumzozigqnv@vireshk-i7> <CAMuHMdVrtSnFpPbB0P3Wxqm1D6vU1_cnh3ypsZJRNF6ueKdAsw@mail.gmail.com>
 <20210611080122.tlkidv6bowuka6fw@vireshk-i7>
In-Reply-To: <20210611080122.tlkidv6bowuka6fw@vireshk-i7>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Jun 2021 10:22:30 +0200
Message-ID: <CAMuHMdVL4VH09ixPcpqqokNJeYd68Th2Y6Lz4PZTF7h06OOBGw@mail.gmail.com>
Subject: Re: [PATCH V3 1/3] gpio: Add virtio-gpio driver
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Stefano Garzarella --cc virtualization @ lists . linux-foundation . org" 
        <sgarzare@redhat.com>, virtualization@lists.linux-foundation.org,
        Alistair Strachan <astrachan@google.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Viresh,

On Fri, Jun 11, 2021 at 10:01 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 11-06-21, 09:42, Geert Uytterhoeven wrote:
> > On Fri, Jun 11, 2021 at 5:56 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > On 10-06-21, 22:46, Linus Walleij wrote:
> > > > thanks for working on this, it's a really interesting driver.
> > > >
> > > > My first question is conceptual:
> > > >
> > > > We previously have Geerts driver for virtualization:
> > > > drivers/gpio/gpio-aggregator.c
> > > >
> > > > The idea with the aggregator is that a host script sets up a
> > > > unique gpiochip for the virtualized instance using some poking
> > > > in sysfs and pass that to the virtual machine.
> > > > So this is Linux acting as virtualization host by definition.
> >
> > The gpio-aggregator is running on the host...
> >
> > > > I think virtio is more abstract and intended for the usecase
> > > > where the hypervisor is not Linux, so this should be mentioned
> > > > in the commit, possibly also in Kconfig so users immediately
> > > > know what usecases the two different drivers are for.
> >
> > ... while the virtio-gpio driver is meant for the guest kernel.
> >
> > I my PoC "[PATCH QEMU v2 0/5] Add a GPIO backend"[1], I didn't have
> > a virtio transport, but just hooked into the PL061 GPIO emulation
> > in QEMU.  The PL061 QEMU driver talked to the GPIO backend, which
> > talked to /dev/gpiochipN on the host.
>
> Hmm, interesting.
>
> > > Well, not actually.
> > >
> > > The host can actually be anything. It can be a Xen based dom0, which
> > > runs some proprietary firmware, or Qemu running over Linux.
> > >
> > > It is left for the host to decide how it wants to club together the
> > > GPIO pins from host and access them, with Linux host userspace it
> > > would be playing with /dev/gpiochipN, while for a raw one it may
> > > be accessing registers directly.
> > >
> > > And so the backend running at host, needs to pass the gpiochip
> > > configurations and only the host understand it.
> >
> > So QEMU has to translate the virtio-gpio communication to e.g.
> > /dev/gpiochipN on the host (or a different backend on non-Linux or
> > bare-metal HV).
>
> No, QEMU passes the raw messages to the backend daemon running in host
> userspace (which shares a socket with qemu). The backend understands
> the virtio/vhost protocols and so won't be required to change at all
> if we move from Qemu to something else. And that's what we (Linaro)
> are looking to do here with Project Stratos.
>
> Create virtio based hypervisor agnostic backends.

OK, IC.

> > > The way I test it for now is by running this with Qemu over my x86
> > > box, so my host side is indeed playing with sysfs Linux.
> >
> > Can you please share a link to the QEMU patches?
>
> Unfortunately, they aren't in good shape right now and the backend is
> a bit hacky (Just checking the data paths, but not touching
> /dev/gpiochipN at all for now).
>
> I didn't implement one as I am going to implement the backend in Rust
> and not Qemu. So it doesn't depend on Qemu at all.

OK.

> To give you an idea of the whole thing, here is what we have done for
> I2c for example, GPIO one will look very similar.

Oh, you also have i2c. Nice!

> The Qemu patches:
>
> https://yhbt.net/lore/all/cover.1617278395.git.viresh.kumar@linaro.org/T/
>
> The stuff from tools/vhost-user-i2c/ directory (or patch 4/6) isn't
> used anymore and the following Rust implementation replaces it:
>
> https://github.com/vireshk/vhost-device/tree/master/src/i2c

Thanks for the links!

> > The GPIO aggregator came into play after talking to Alexander Graf and
> > Peter Maydell.  To reduce the attack surface, they didn't want QEMU
> > to be responsible for exporting to the guest a subset of all GPIOs of
> > a gpiochip, only a full gpiochip.  However, the full gpiochip may
> > contain critical GPIOs you do not want the guest to tamper with.
> > Hence the GPIO aggregator was born, to take care of aggregating all
> > GPIOs you want to export to a guest into a new virtual gpiochip.
> >
> > You can find more information about the GPIO Aggregator's use cases in
> > "[PATCH v7 0/6] gpio: Add GPIO Aggregator"[2].
>
> So I was actually looking to do some kind of aggregation on the host
> side's backend daemon to share only a subset of GPIO pins, I will see
> if that is something I can reuse. Thanks for sharing details.

The same reasoning can apply to your backend daemon, so when using
the GPIO aggregator, you can just control a full gpiochip, without
having to implement access control on individual GPIO lines.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
