Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57D9F3A3D6F
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jun 2021 09:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbhFKHor (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Jun 2021 03:44:47 -0400
Received: from mail-ua1-f49.google.com ([209.85.222.49]:42624 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230467AbhFKHor (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Jun 2021 03:44:47 -0400
Received: by mail-ua1-f49.google.com with SMTP id w5so2250881uaq.9;
        Fri, 11 Jun 2021 00:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=38AX8dJKliZcm5SjDtUlGVi/FFnBmE/O/3FCvxTZd8o=;
        b=e/c8wmnOG85MLUh0MrDxoC5JNqYtaoac35MMXV2adhStyJhooDuykAap/BV25pJo2p
         tAeAo/nMG0bQqBQEDEPP7ENen4I45xokCcdZE1ks9OinXK/pyEMJ3paxSBc5Qd5yxjaj
         1Garf9AfeFJA4CJV26GK1jPQJQEZQITNYfo/Uo47QyKXvQAGqSqpIyVR3VZSQvy3Pqv+
         U+0pxCykyOwWWrunifFd7jdbVogX5gcl6dxal6lF17Tqo6U8yF8sBU/Y94rf1EbkagZC
         4/e3cIzFIDVJJxCeCRUZvyP58joLOxU2LLDIxROPiu1eDygLz/pvxswapI6rqWp9snzK
         diNQ==
X-Gm-Message-State: AOAM533OtCAcGVQMAb7+UuV60cB0t9yxoQuLUJOMwSiwHnLneGL1AJPt
        6Slykho5zff1Y1Is16LodHNK/TSzMSoXJ6mUJPQ=
X-Google-Smtp-Source: ABdhPJyC0lhpoHIsnRTYb/jBHTXjzOjCm5sNgTxgszrrtuP+35/7N0zzkKE5Xb0wL4kG5xU1+tZftlhPDtoDlti9U/0=
X-Received: by 2002:ab0:63d9:: with SMTP id i25mr1758952uap.106.1623397353672;
 Fri, 11 Jun 2021 00:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623326176.git.viresh.kumar@linaro.org> <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
 <CACRpkdZV2v2S5z7CZf_8DV=At9-oPSj7RYFH78hWy3ZX37QnDQ@mail.gmail.com> <20210611035623.z4f2ynumzozigqnv@vireshk-i7>
In-Reply-To: <20210611035623.z4f2ynumzozigqnv@vireshk-i7>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Jun 2021 09:42:22 +0200
Message-ID: <CAMuHMdVrtSnFpPbB0P3Wxqm1D6vU1_cnh3ypsZJRNF6ueKdAsw@mail.gmail.com>
Subject: Re: [PATCH V3 1/3] gpio: Add virtio-gpio driver
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
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
        Alistair Strachan <astrachan@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Viresh, Linus,

On Fri, Jun 11, 2021 at 5:56 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 10-06-21, 22:46, Linus Walleij wrote:
> > thanks for working on this, it's a really interesting driver.
> >
> > My first question is conceptual:
> >
> > We previously have Geerts driver for virtualization:
> > drivers/gpio/gpio-aggregator.c
> >
> > The idea with the aggregator is that a host script sets up a
> > unique gpiochip for the virtualized instance using some poking
> > in sysfs and pass that to the virtual machine.
> > So this is Linux acting as virtualization host by definition.

The gpio-aggregator is running on the host...

> > I think virtio is more abstract and intended for the usecase
> > where the hypervisor is not Linux, so this should be mentioned
> > in the commit, possibly also in Kconfig so users immediately
> > know what usecases the two different drivers are for.

... while the virtio-gpio driver is meant for the guest kernel.

I my PoC "[PATCH QEMU v2 0/5] Add a GPIO backend"[1], I didn't have
a virtio transport, but just hooked into the PL061 GPIO emulation
in QEMU.  The PL061 QEMU driver talked to the GPIO backend, which
talked to /dev/gpiochipN on the host.

> Well, not actually.
>
> The host can actually be anything. It can be a Xen based dom0, which
> runs some proprietary firmware, or Qemu running over Linux.
>
> It is left for the host to decide how it wants to club together the
> GPIO pins from host and access them, with Linux host userspace it
> would be playing with /dev/gpiochipN, while for a raw one it may
> be accessing registers directly.
>
> And so the backend running at host, needs to pass the gpiochip
> configurations and only the host understand it.

So QEMU has to translate the virtio-gpio communication to e.g.
/dev/gpiochipN on the host (or a different backend on non-Linux or
bare-metal HV).

> The way I test it for now is by running this with Qemu over my x86
> box, so my host side is indeed playing with sysfs Linux.

Can you please share a link to the QEMU patches?

> > Possibly both could be used: aggregator to pick out the GPIOs
> > you want into a synthetic GPIO chip, and the actual talk
> > between the hypervisor/host and the guest using virtio, even
> > with linux-on-linux.
>
> Not sure if I understand the aggregator thing for now, but we see the
> backend running at host (which talks to this Linux driver at guest) as
> a userspace thing and not a kernel driver. Not sure if aggregator can
> be used like that, but anyway..

The GPIO aggregator came into play after talking to Alexander Graf and
Peter Maydell.  To reduce the attack surface, they didn't want QEMU
to be responsible for exporting to the guest a subset of all GPIOs of
a gpiochip, only a full gpiochip.  However, the full gpiochip may
contain critical GPIOs you do not want the guest to tamper with.
Hence the GPIO aggregator was born, to take care of aggregating all
GPIOs you want to export to a guest into a new virtual gpiochip.

You can find more information about the GPIO Aggregator's use cases in
"[PATCH v7 0/6] gpio: Add GPIO Aggregator"[2].

[1] https://lore.kernel.org/linux-gpio/20200423090118.11199-1-geert+renesas@glider.be
[2] https://lore.kernel.org/linux-doc/20200511145257.22970-1-geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
