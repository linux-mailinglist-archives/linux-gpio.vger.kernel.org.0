Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD9063DF0FD
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Aug 2021 17:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236058AbhHCPC2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 11:02:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:37136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235368AbhHCPC2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 3 Aug 2021 11:02:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D14660F9C;
        Tue,  3 Aug 2021 15:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628002937;
        bh=mXVvXDhGXzXUi3QF9xmCNfSlb7DuCuB741GzAYjFqjk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZuiP7u+U41WUMlR+KfiDIdgup/J+3L3shKj/7BWgzMqoyiCz3zKtW/WhiScKvs3Ly
         mi2hk+IPgYXtvFZBybwGKwly60OQLeORWDyd65Pklikq4f/C2iP/9FxRQjRe6eSaXh
         saEyPxp2jV45AoXBD5jvwGKgQorYADHRSOSlXj7OPyvCRNiCgTW+gRRT8kipDTsHhN
         nPoXNovvwAcYcdkE0sD0rLSJ/sKgShimGW1byJOnG4gWsZXkM4YLFjIm53ivSSX5Nn
         U+EpaS1Vh2m3+OJYZxSipe67qgB9tt6lH8CrxWdb03dCguXHf6w1Z13vrYTW+fqG0B
         d/taMMsrgLuSg==
Received: by mail-wr1-f41.google.com with SMTP id h13so12192457wrp.1;
        Tue, 03 Aug 2021 08:02:16 -0700 (PDT)
X-Gm-Message-State: AOAM533FopGQ+QrIei71rRXcTvDPHG3qOZmWxjQTUeC2Hv61ClmC3oFQ
        muDMb6vtl8WYj9NolmiSioo6maLJCFCfSjHBMr0=
X-Google-Smtp-Source: ABdhPJwelqY/j9frzGUsQDn9CDyhI7WD/w5swSH8ILHGDPmRnx3aVlarlPBsIvYgSm0tTjGo+s18o2jmXTd5NkXG8CU=
X-Received: by 2002:adf:fd90:: with SMTP id d16mr24877442wrr.105.1628002935497;
 Tue, 03 Aug 2021 08:02:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627989586.git.viresh.kumar@linaro.org> <75c8e6e5e8dfa1889938f3a6b2d991763c7a3717.1627989586.git.viresh.kumar@linaro.org>
In-Reply-To: <75c8e6e5e8dfa1889938f3a6b2d991763c7a3717.1627989586.git.viresh.kumar@linaro.org>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 3 Aug 2021 17:01:59 +0200
X-Gmail-Original-Message-ID: <CAK8P3a29NfFWwtGHhqos1P8f_SmzPJTXvEY5BZJAEMbV2SKe-Q@mail.gmail.com>
Message-ID: <CAK8P3a29NfFWwtGHhqos1P8f_SmzPJTXvEY5BZJAEMbV2SKe-Q@mail.gmail.com>
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

On Tue, Aug 3, 2021 at 1:36 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> This patch adds IRQ support for the virtio GPIO driver. Note that this
> uses the irq_bus_lock/unlock() callbacks, since those operations over
> virtio may sleep. Also the notifications for the eventq are processed
> using a work item to allow sleep-able operations.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  drivers/gpio/Kconfig             |   1 +
>  drivers/gpio/gpio-virtio.c       | 281 ++++++++++++++++++++++++++++++-
>  include/uapi/linux/virtio_gpio.h |  25 +++
>  3 files changed, 303 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index e5993d6864fb..222f4ae98a35 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1672,6 +1672,7 @@ config GPIO_MOCKUP
>  config GPIO_VIRTIO
>         tristate "VirtIO GPIO support"
>         depends on VIRTIO
> +       select GPIOLIB_IRQCHIP
>         help
>           Say Y here to enable guest support for virtio-based GPIO controllers.
>

> +struct vgpio_irq_line {
> +       u8 type;
> +       bool masked;
> +       bool update_pending;
> +       bool queued;
> +
> +       struct virtio_gpio_irq_request ireq;
> +       struct virtio_gpio_irq_response ires;
> +};

I think the last two members should be marked as __cacheline_aligned,
since they are transferred separately over DMA.

> +static void virtio_gpio_irq_eoi(struct irq_data *d)
> +{
> +       /*
> +        * Queue buffers, by calling virtio_gpio_irq_prepare(), from
> +        * virtio_gpio_event_vq() itself, after taking into consideration the
> +        * masking status of the interrupt.
> +        */
> +}

Shouldn't this just requeue the interrupt? There is no reason to
defer this, and I think we want the normal operation to not have
to involve any scheduling.

> +static void virtio_gpio_irq_unmask(struct irq_data *d)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct virtio_gpio *vgpio = gpiochip_get_data(gc);
> +       struct vgpio_irq_line *irq_line = &vgpio->irq_lines[d->hwirq];
> +
> +       irq_line->masked = false;
> +       irq_line->update_pending = true;
> +}

Same here. unmask is probably less important, but it's the
same operation: if you want interrupts to become active
again when they are not, just queue the request

> +static void virtio_gpio_irq_mask(struct irq_data *d)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct virtio_gpio *vgpio = gpiochip_get_data(gc);
> +       struct vgpio_irq_line *irq_line = &vgpio->irq_lines[d->hwirq];
> +
> +       irq_line->masked = true;
> +       irq_line->update_pending = true;
> +}

This is of course the tricky bit, I was hoping you had found a solution
based on what I wrote above for eio() and unmask().

> +static void vgpio_work_handler(struct work_struct *work)
> +{
> +       struct virtio_gpio *vgpio = container_of(work, struct virtio_gpio,
> +                                                work);
> +       struct device *dev = &vgpio->vdev->dev;
> +       struct vgpio_irq_line *irq_line;
> +       int irq, gpio, ret;
> +       unsigned int len;
> +
> +       mutex_lock(&vgpio->irq_lock);
> +
> +       while (true) {
> +               irq_line = virtqueue_get_buf(vgpio->event_vq, &len);
> +               if (!irq_line)
> +                       break;

Related to above, I think all the eventq handling should be moved into the
virtio_gpio_event_vq() function directly.

> +               /* The interrupt may have been disabled by now */
> +               if (irq_line->update_pending && irq_line->masked)
> +                       update_irq_type(vgpio, gpio, VIRTIO_GPIO_IRQ_TYPE_NONE);

This is a part I'm not sure about, and I suppose it's the same part that
Marc was also confused by.

As far as I can tell, the update_irq_type() message would lead to the
interrupt getting delivered when it was armed and is now getting disabled,
but I don't see why we would call update_irq_type() as a result of the
eventq notification.

      Arnd
