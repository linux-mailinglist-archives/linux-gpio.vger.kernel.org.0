Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4C243A5D65
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jun 2021 09:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232384AbhFNHKI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Jun 2021 03:10:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232096AbhFNHKI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Jun 2021 03:10:08 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDC22C061574
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jun 2021 00:08:05 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id p13so9880462pfw.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jun 2021 00:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cE3BItc0etFTtT3DKKS6LEXcYghKEYuPi31YretVNcI=;
        b=hWGT7pC/nY1a2nMRch8iUAFWwQsjRaVi4BiGQljxV/RwRoCWJ01uKjH5GmCBiGtGkB
         GLLf/GjcUX7EgxD5tTYCyHuRD4t0QfSopGKWadTOWw8aSoO4NC+U2JYiiIsvzVkqqozS
         2PI1oTA4Y3K+cj2SqXFa2JzN3fvJZVJylNsG4UttFA6yYMP2ViTnkFWBGvZE2yqmZmqT
         gUsKmEBGP7NGyTCPge1i5aQHj5dCqzRCVjV/hBavRvjBgLI4wfnCpSrhiyyMKW6Nqmj9
         PD0v6gSlTaAhbmmz+VUpIQ/0IEapL5qUYbW9GBTULD78lJ2JPu/MkHHPvIZjPMKelz2u
         mpEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cE3BItc0etFTtT3DKKS6LEXcYghKEYuPi31YretVNcI=;
        b=bLkaGib7iwKmm1eZNdJA6c8qPks1EkD5Za9iIUocj26sye51sX+9RpOmIaQ/GwfL1S
         CTJfo23AWYtqsPHSve3bc0ZIY9BoaFMXJFw6FKIGBpJ/U/m3UfDuIFwKyzlNgXvlHTmk
         1tsGXVxd9EpRweRxP/V2hHqdk/Vob2kJmuGxi+8aGXilIFtt7qPK27WRJySn0hlz4EzG
         BtrWQpiHYcvVmt4AndIUxIHv3UN3hqxRAt9njif7QGzM7gvLGVayOhQ4zMkc4/2W73Rp
         K7Dr7a0A5/74nhHC7/8WXcsUKwhXM99AwAbcZKMRPPM1Qlrwu9Y3p5DpgER3griFygd8
         XbtQ==
X-Gm-Message-State: AOAM5304I3l4vfo5HneNOu8jXZCwAeCjAtHxSI0+x0Wj9bHtI6TSkC45
        8/20l+oZ0KSARn4YtP09hl/PBg==
X-Google-Smtp-Source: ABdhPJwv8FULBhRjCLmONqNqPjUMDKsZ3zKpN+cND2VwYFv5+MAD8+DlWsZbZGvBVCHy0VZ4Wi3A0g==
X-Received: by 2002:aa7:949c:0:b029:2fa:c881:dd0 with SMTP id z28-20020aa7949c0000b02902fac8810dd0mr639470pfk.9.1623654484468;
        Mon, 14 Jun 2021 00:08:04 -0700 (PDT)
Received: from localhost ([136.185.134.182])
        by smtp.gmail.com with ESMTPSA id t143sm13203696pgb.93.2021.06.14.00.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 00:08:03 -0700 (PDT)
Date:   Mon, 14 Jun 2021 12:38:01 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Stefano Garzarella --cc virtualization @ lists . linux-foundation . org" 
        <sgarzare@redhat.com>, virtualization@lists.linux-foundation.org
Subject: Re: [PATCH V3 2/3] gpio: virtio: Add IRQ support
Message-ID: <20210614070801.5tbkebxmz4gvcpai@vireshk-i7>
References: <cover.1623326176.git.viresh.kumar@linaro.org>
 <911941d4bf19f18abdc9700abca9f26b3c04c343.1623326176.git.viresh.kumar@linaro.org>
 <CACRpkdYHMtG_X3FgiArbQW49kTwJwOGn90peDvAV5Bs5oDiC7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYHMtG_X3FgiArbQW49kTwJwOGn90peDvAV5Bs5oDiC7A@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10-06-21, 23:30, Linus Walleij wrote:
> On Thu, Jun 10, 2021 at 2:16 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > +static void virtio_gpio_irq_unmask(struct irq_data *d)
> > +{
> > +       struct gpio_chip *gc = irq_data_to_gpio_chip(d);
> > +       struct virtio_gpio *vgpio = gpio_chip_to_vgpio(gc);
> > +       struct vgpio_line *line = &vgpio->lines[d->hwirq];
> > +
> > +       line->masked = false;
> > +       line->masked_pending = true;
> > +}
> 
> This looks dangerous in combination with this:
> 
> > +static void virtio_gpio_interrupt(struct virtqueue *vq)
> > +{
> (...)
> > +       local_irq_disable();
> > +       ret = generic_handle_irq(irq);
> > +       local_irq_enable();
> 
> Nominally slow IRQs like those being marshalled over
> virtio should be nested, handle_nested_irq(irq);
> but are they?

Hmm, this is the call trace:

Call trace:
 virtio_gpio_interrupt+0x34/0x168
 vring_interrupt+0x64/0x98
 vp_vring_interrupt+0x5c/0xa8
 vp_interrupt+0x40/0x78
 __handle_irq_event_percpu+0x5c/0x180
 handle_irq_event_percpu+0x38/0x90
 handle_irq_event+0x48/0xe0
 handle_fasteoi_irq+0xb0/0x138
 generic_handle_irq+0x30/0x48
 __handle_domain_irq+0x60/0xb8
 gic_handle_irq+0x58/0x128
 el1_irq+0xb0/0x180
 arch_cpu_idle+0x18/0x28
 default_idle_call+0x24/0x5c
 do_idle+0x1ec/0x288
 cpu_startup_entry+0x28/0x68
 rest_init+0xd8/0xe8
 arch_call_rest_init+0x10/0x1c
 start_kernel+0x508/0x540

I don't see a threaded interrupt in the path and vp_vring_interrupt()
already takes spin_lock_irqsave().

This is what handle_nested_irq() says:

 *	Handle interrupts which are nested into a threaded interrupt
 *	handler. The handler function is called inside the calling
 *	threads context.

So AFAICT, handle_nested_irq() is relevant if the irq-chip's handler
is called in threaded context instead of hard one. In this case it is
called from hard-irq context and so calling generic_handle_irq() looks
to be the right thing.

Right ?

> Or are they just quite slow not super slow?

It doesn't use another slow bus like I2C, but this should be slow
anyway.

> If a threaded IRQF_ONESHOT was requested the
> IRQ core will kick the thread and *MASK* this IRQ,
> which means it will call back to your .irq_mask() function
> and expect it to be masked from this
> point.
> 
> But the IRQ will not actually be masked until you issue
> your callbacks in the .irq_bus_sync_unlock() callback
> right?

Yes.

> So from this point until .irq_bus_sync_unlock()
> get called and actually mask the IRQ, it could be
> fired again?

Since we are defining the spec right now, this is up to us to decide
how we want to do it.

> I suppose the IRQ handler is reentrant?

It shouldn't happen because of the locking in place in the virtqueue
core (vp_vring_interrupt()).

> This would violate the API.
> 
> I would say that from this point and until you sync
> you need a spinlock or other locking primitive to
> stop this IRQ from fireing again, and a spinlock will
> imply local_irq_disable() so this gets really complex.
> 
> I would say only using nesting IRQs or guarantee this
> some other way, one way would be to specify that
> whatever is at the other side of virtio cannot send another
> GPIO IRQ message before the last one is handled,
> so you would need to send a specific (new)
> VIRTIO_GPIO_REQ_IRQ_ACK after all other messages
> have been sent in .irq_bus_sync_unlock()
> so that the next GPIO IRQ can be dispatched after that.

I was thinking of mentioning this clearly in the spec at first, but
now after checking the sequence of things it looks like Linux will do
it anyway. Though adding this clearly in the spec can be better. We
should just send a response message here instead of another message
type VIRTIO_GPIO_REQ_IRQ_ACK.

> (Is this how messaged signalled interrupts work? No idea.
> When in doubt ask the IRQ maintainers.)

-- 
viresh
