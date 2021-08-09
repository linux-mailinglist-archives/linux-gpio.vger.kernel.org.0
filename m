Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFAD03E412E
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Aug 2021 09:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233550AbhHIHzq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Aug 2021 03:55:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:46022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233605AbhHIHzo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Aug 2021 03:55:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8FF056105A;
        Mon,  9 Aug 2021 07:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628495724;
        bh=ySbGgGfzqBAEJSratUSjhe+L3/0DiQlQC21ixFHniJs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bokvUlouuBYaecUg9mjkN7kVKqM4Ne+L4MB9WrBfcNkS52PGq4SeNeHgIybnElMPf
         7f9mpfPSv0ccYy9EBCX0/P7zuxpueOVqplPQPhlsVlj3IN8cm5orUkrYUjGercUIA9
         r0VP0Hz/xGMFP0fZgkmb17emo679NtTRo0MxZ0LLS6h6JtZ96BBnRb9hFbQ2wt3CPk
         MVUwqlIJwT9vyNY7EafhEgq5kSen72z6UPZM1Iszg8DBhBL7ZGnRfDqKSpBDJZQkjk
         6VYGrY+pnJ87byXORLkkwbSVks9RRg3Lyve3ZAdK9+oNjgXWLYPpnF6nEqYbyzgEH0
         ZPLKtDmtcl55A==
Received: by mail-wm1-f46.google.com with SMTP id f9-20020a05600c1549b029025b0f5d8c6cso13818047wmg.4;
        Mon, 09 Aug 2021 00:55:24 -0700 (PDT)
X-Gm-Message-State: AOAM5314ihqiQdazj/ao4qWgIayW7liDHfdknJF6fxI4NodM5RICRGPa
        g5AKlbgNxRU2CpoNVBhxm2ebD7+QpfAWwCx1MUc=
X-Google-Smtp-Source: ABdhPJwsHCGJweUWTaO/pnRagqo6mk9Ys2poZ+HUYdQPTlaYEGh/x99mdZSs5F4drrQlZ4IykGD39tpMoLMC+pA/62s=
X-Received: by 2002:a05:600c:3b08:: with SMTP id m8mr32513254wms.84.1628495723088;
 Mon, 09 Aug 2021 00:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627989586.git.viresh.kumar@linaro.org> <75c8e6e5e8dfa1889938f3a6b2d991763c7a3717.1627989586.git.viresh.kumar@linaro.org>
 <CAK8P3a29NfFWwtGHhqos1P8f_SmzPJTXvEY5BZJAEMbV2SKe-Q@mail.gmail.com>
 <0100017b1610f711-c53c79f2-9e28-4c45-bb42-8db09688b18e-000000@email.amazonses.com>
 <CAK8P3a0DWkfQcZpmyfKcdNt1MHf8ha6a9L2LmLt1Tv-j0HDr3w@mail.gmail.com>
 <20210805124922.j7lts7tfmm4t2kpf@vireshk-i7> <CAK8P3a0kbmPLGCBrjAv7-dW=JWq-pdSBeGUHCxUFmMKvKhCg7w@mail.gmail.com>
 <0100017b1a6c0a05-e41dc16c-b326-4017-a63d-a24a6c1fde70-000000@email.amazonses.com>
 <CAK8P3a2rrueXJHZxuiiShgVmLD916RaxW7xQHHjQXNFkM3Fpvg@mail.gmail.com> <20210809073020.y6ruibdm37xnx7hg@vireshk-i7>
In-Reply-To: <20210809073020.y6ruibdm37xnx7hg@vireshk-i7>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 9 Aug 2021 09:55:07 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3TabswETDAUec-2rbiNBk_K48-UdpTA5Ckvu5ogOyHjQ@mail.gmail.com>
Message-ID: <CAK8P3a3TabswETDAUec-2rbiNBk_K48-UdpTA5Ckvu5ogOyHjQ@mail.gmail.com>
Subject: Re: [Stratos-dev] [PATCH V4 2/2] gpio: virtio: Add IRQ support
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE" 
        <virtualization@lists.linux-foundation.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Jason Wang <jasowang@redhat.com>,
        Stratos Mailing List <stratos-dev@op-lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 9, 2021 at 9:30 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 06-08-21, 10:00, Arnd Bergmann wrote:
> > On Fri, Aug 6, 2021 at 9:44 AM Viresh Kumar via Stratos-dev
> > <stratos-dev@op-lists.linaro.org> wrote:
> > >
> > > On 05-08-21, 15:10, Arnd Bergmann wrote:
> > > > I hope this can still be simplified by working out better which state
> > > > transitions are needed exactly. In particular, I would expect that we
> > > > can get away with not sending a VIRTIO_GPIO_MSG_IRQ_TYPE
> > > > for 'mask' state changes at all, but use that only for forcing 'enabled'
> > > > state changes.
> > >
> > > Something like this ?
> >
> > > static void virtio_gpio_irq_mask(struct irq_data *d)
> > > {
> > >         /* Nothing to do here */
> > > }
> >
> > You'd have to do /something/ here I think, if only setting the flag
> > that we don't want to deliver the next interrupt.
> >
> > > static void virtio_gpio_irq_unmask(struct irq_data *d)
> > > {
> > >         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> > >         struct virtio_gpio *vgpio = gpiochip_get_data(gc);
> > >
> > >         /* Queue the buffer unconditionally on unmask */
> > >         virtio_gpio_irq_prepare(vgpio, d->hwirq);
> > > }
> >
> > And check the flag here to not requeue it if it's masked.
>
> I am not sure I understand why this would be required. If the
> interrupt is getting disabled, then unmask will not get called here
> and so we won't requeue anything. Same will happen with threaded
> handlers where the interrupt gets unmasked at a later point of time.

Ah, right. There is already a flag that gets checked by the caller.

It does feel odd to have an empty 'irq_mask' callback though, so
maybe there is still something missing, just not what I thought.

It's probably the result of calling handle_level_irq(), which as you
said is closer to what we want, but is not exactly what we need for
this protocol.

        Arnd
