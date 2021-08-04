Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31CBF3DFCD5
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Aug 2021 10:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236259AbhHDI2X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Aug 2021 04:28:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:54662 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236383AbhHDI2W (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Aug 2021 04:28:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 62F6C61037;
        Wed,  4 Aug 2021 08:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628065690;
        bh=bsnK861s4w9Krqm9zlALXbihT+W3WdDTP8TGkcy3fCE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nqH/2gX/y9YB3XT3R96l3KJ2CC3SEiYPil76yc8zGlzox0iC6Vz/skYhA5Nax+O4a
         WQoVHHQR4Uo2sG60FxrfjU71kWOMU+fim4k0PFANOLlN1mhx81DuDRcLChIWD69NzZ
         nV6Qs541Ts69mRt/SXP78K5JeihRuu6NW1EeZXODtzHcNJQSGucKGz98DuQoM9JMNO
         a1gElqACd+AoXsC+AFfXUcCckBVBRV20nlscfgLumGi+rkAXmig0Vw+ztL5iuC1fnY
         4FEl3O04nKDgI7eedPfG4OTSwt4yZSuWyAb6KKudAGVB/GfDDCRtGbOj/gLShGue3L
         CUfwQj7aIaOhA==
Received: by mail-wm1-f46.google.com with SMTP id n11so696614wmd.2;
        Wed, 04 Aug 2021 01:28:10 -0700 (PDT)
X-Gm-Message-State: AOAM533c+PPVkCZukw8mLLMIILL4+j0YUf1hzTJCmh3AG2437yEhsmJe
        YUOpJI3jHhMLwoquorvkW6eGPxiiKFotJ3Qu0D0=
X-Google-Smtp-Source: ABdhPJz+vnTHHtv/Zv0RaiH+Ss/P3uLHNmCrGCxnB5bx1MtDYAJBdsG1nalFwPiBwSCiXt1+soPXLnilgkosyjM74Zg=
X-Received: by 2002:a7b:ce10:: with SMTP id m16mr8172551wmc.75.1628065688828;
 Wed, 04 Aug 2021 01:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627989586.git.viresh.kumar@linaro.org> <75c8e6e5e8dfa1889938f3a6b2d991763c7a3717.1627989586.git.viresh.kumar@linaro.org>
 <CAK8P3a29NfFWwtGHhqos1P8f_SmzPJTXvEY5BZJAEMbV2SKe-Q@mail.gmail.com> <20210804070531.w3h3jm6rou2hpgqj@vireshk-i7>
In-Reply-To: <20210804070531.w3h3jm6rou2hpgqj@vireshk-i7>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Wed, 4 Aug 2021 10:27:52 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0vBhP6ZJuqCxAUVZG_eAPu1Lk_Nw8FEarnHb286pPPyQ@mail.gmail.com>
Message-ID: <CAK8P3a0vBhP6ZJuqCxAUVZG_eAPu1Lk_Nw8FEarnHb286pPPyQ@mail.gmail.com>
Subject: Re: [PATCH V4 2/2] gpio: virtio: Add IRQ support
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE" 
        <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 4, 2021 at 9:05 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 03-08-21, 17:01, Arnd Bergmann wrote:
> > >
> > > +static void virtio_gpio_irq_unmask(struct irq_data *d)
> > > +{
> > > +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> > > +       struct virtio_gpio *vgpio = gpiochip_get_data(gc);
> > > +       struct vgpio_irq_line *irq_line = &vgpio->irq_lines[d->hwirq];
> > > +
> > > +       irq_line->masked = false;
> > > +       irq_line->update_pending = true;
> > > +}
> >
> > Same here. unmask is probably less important, but it's the
> > same operation: if you want interrupts to become active
> > again when they are not, just queue the request
>
> We can't because its a slow bus ? And unmask can be called from
> irq-context. That's exactly why we had the irq_bus_lock/unlock
> discussion earlier.

I thought only 'mask' is slow, since that has to wait for the completion,
but 'unmask' just involves sending the eventq request without having
to wait for it.

> > > +static void vgpio_work_handler(struct work_struct *work)
> > > +{
> > > +       struct virtio_gpio *vgpio = container_of(work, struct virtio_gpio,
> > > +                                                work);
> > > +       struct device *dev = &vgpio->vdev->dev;
> > > +       struct vgpio_irq_line *irq_line;
> > > +       int irq, gpio, ret;
> > > +       unsigned int len;
> > > +
> > > +       mutex_lock(&vgpio->irq_lock);
> > > +
> > > +       while (true) {
> > > +               irq_line = virtqueue_get_buf(vgpio->event_vq, &len);
> > > +               if (!irq_line)
> > > +                       break;
> >
> > Related to above, I think all the eventq handling should be moved into the
> > virtio_gpio_event_vq() function directly.
>
> You mean without scheduling a work ?

Yes.

> > > +               /* The interrupt may have been disabled by now */
> > > +               if (irq_line->update_pending && irq_line->masked)
> > > +                       update_irq_type(vgpio, gpio, VIRTIO_GPIO_IRQ_TYPE_NONE);
> >
> > This is a part I'm not sure about, and I suppose it's the same part that
> > Marc was also confused by.
> >
> > As far as I can tell, the update_irq_type() message would lead to the
> > interrupt getting delivered when it was armed and is now getting disabled,
> > but I don't see why we would call update_irq_type() as a result of the
> > eventq notification.
>
> Lemme try to explain answer to all other question together here.
>
> The irq related functions get called in two scenarios:
>
> - request_irq() or irq_set_irq_type(), enable/disable_irq(), etc:
>
>   The call sequence here is like this:
>
>   ->irq_bus_lock()
>
>   ->spin-lock-irqsave
>   ->irq_mask()/irq_unmask()/irq_set_type()..
>   ->spin-unlock-irqsave
>
>   ->irq_bus_unlock()
>
>
>   So the mask/unmask/set-type routines can't issue virtio requests and
>   we need to do that from irq_bus_unlock(). This shall answer your
>   question about mask/unmask, right ? Or maybe I misunderstood them
>   then ?

I don't think it is correct that you cannot issue virtio requests from
atomic context, only that you cannot wait for the reply.

For 'unmask', there is no waiting, since the reply is the actual IRQ
event. For the others, the sequence makes sense.

> - Interrupt: i.e. buffer sent back by the host over virtio.
>
>   virtio_gpio_event_vq() schedules a work item, which processes the
>   items from the eventq virtqueue and eventually calls
>   generic_handle_irq(). The irq-core can issue calls to
>   ->irq_mask/unmask() here without a prior call to
>   irq_bus_lock/unlock(), normally they will balance out by the end,
>   but I am not sure if it is guaranteed. Moreover, interrupt should be
>   re-enabled only after unmask() is called (for ONESHOT) and not at
>   EOI, right ?
>
>   I chose not to queue the buffers back from eoi() as it is possible
>   that we won't want to queue them at all, as the interrupt needs to
>   be disabled by the time generic_handle_irq() returns. And so I did
>   everything from the end of vgpio_work_handler()'s loop, i.e. either
>   disable the interrupts with VIRTIO_GPIO_IRQ_TYPE_NONE or enable the
>   interrupt again by re-queuing the buffer.
>
> Regarding irq handling using work-item, I had to move to that to take
> care of locking for re-queuing the buffers for a GPIO line from
> irq-handler and bus-unlock. Nothing else seemed to work, though I am
> continuing to look into that to see if there is an alternative here.

I don't think it makes sense to optimize for the rare case that the
irq handler disables the irq, when that makes the common case
(irq remains unmasked and enabled) much slower.

       Arnd
