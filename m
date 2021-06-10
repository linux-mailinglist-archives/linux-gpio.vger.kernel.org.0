Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B2933A35F5
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jun 2021 23:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbhFJVc1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 17:32:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbhFJVc1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 17:32:27 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B61F7C0617A6
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jun 2021 14:30:20 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id d2so6818403ljj.11
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jun 2021 14:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mc0t7dqVDGu20ZDgp1J77BZzzR8pf6dBx6PMN3sIo8c=;
        b=aOEIplv0pyoO+2D1enYzTH7rRMUM5qf5y/qVUZMMn97grwASNtzDCe6NqISGYiZMo/
         ukksvEVMwqEiLXlOk7Xqes3HVR1NjBClrE1UmSQ+glzsnFi3+RbYzGF78dSlKpLFU0JZ
         fdTr/eSTmYpuSXZulL5tGXRJG/I0jBiZbkhkcpdSROdkYtLEck/4uALoj6p0onaq315m
         JtShyX4vbRX1kL2eW4pFO5ne3PKIMIIoI3VPqWTXEo3+d3M4W6uXg7lVNw/lt/VjhUrE
         6A8O8GSKAnoiX+g/msiwrr/WSJCOVPblDBUfbeD3OI0es+O8CDxB3CEA+scJZ1LWc7dI
         gSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mc0t7dqVDGu20ZDgp1J77BZzzR8pf6dBx6PMN3sIo8c=;
        b=CI4mmUJU+zuB4jSqt0prVqmsbYVFHDupqu7Qh5bF5fW82v6LuyTNKN/UVCbTVCMKDS
         86l/57y+d10IsqWBMdX04fnaCJwzFIhCq7ANOxabwKaW1Emf8grYCcQT7+YqY61XCwHY
         wSXcM8Ah9XUx777idQiHLYXj9OD82pUuiiEFFn9q8kKC8ghPXLv+FfV0bvOrCn/Ash38
         pDWy4rcVnLFBnDlNQl6BW334J4f66POw2bsFSSTU8MmYwduFo2cpimN8LDu1AfGsMNxk
         rfBgw/vcQh5NtII3D/QlFLCw/4qSXDDlXAdliYDGOzHAYkCMivW0PfP1nku3oNYcRBmJ
         VWNA==
X-Gm-Message-State: AOAM531cGvBYESEOTK/5uQ/XQtDJiJo1pp0LgztJBqE5F4EKjLj1w/0g
        lvdhBPn5URritgqyKZIuDSao1gYcgMFGjaZh8OjGjw==
X-Google-Smtp-Source: ABdhPJwLHL8jOR3WGl2QJnT+GPWUrRqLDv/5Ut16hTcM8MfJaU0MmKihHfxqkHVnSdiiDFsReGTpITxPhKmBolVuFZo=
X-Received: by 2002:a2e:22c3:: with SMTP id i186mr433222lji.273.1623360618946;
 Thu, 10 Jun 2021 14:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623326176.git.viresh.kumar@linaro.org> <911941d4bf19f18abdc9700abca9f26b3c04c343.1623326176.git.viresh.kumar@linaro.org>
In-Reply-To: <911941d4bf19f18abdc9700abca9f26b3c04c343.1623326176.git.viresh.kumar@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 10 Jun 2021 23:30:07 +0200
Message-ID: <CACRpkdYHMtG_X3FgiArbQW49kTwJwOGn90peDvAV5Bs5oDiC7A@mail.gmail.com>
Subject: Re: [PATCH V3 2/3] gpio: virtio: Add IRQ support
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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
        <sgarzare@redhat.com>, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Viresh!

thanks for this interesting patch!

On Thu, Jun 10, 2021 at 2:16 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:

> This patch adds IRQ support for the virtio GPIO driver. Note that this
> uses the irq_bus_lock/unlock() callbacks since the operations over
> virtio can sleep.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

>  drivers/gpio/gpio-virtio.c       | 256 ++++++++++++++++++++++++++++++-
>  include/uapi/linux/virtio_gpio.h |  15 ++

You also need to
select GPIOLIB_IRQCHIP
in the Kconfig entry for the gpio-virtio driver, because you make
use of it.

> +static void virtio_gpio_irq_mask(struct irq_data *d)
> +{
> +       struct gpio_chip *gc = irq_data_to_gpio_chip(d);
> +       struct virtio_gpio *vgpio = gpio_chip_to_vgpio(gc);
> +       struct vgpio_line *line = &vgpio->lines[d->hwirq];
> +
> +       line->masked = true;
> +       line->masked_pending = true;
> +}
> +
> +static void virtio_gpio_irq_unmask(struct irq_data *d)
> +{
> +       struct gpio_chip *gc = irq_data_to_gpio_chip(d);
> +       struct virtio_gpio *vgpio = gpio_chip_to_vgpio(gc);
> +       struct vgpio_line *line = &vgpio->lines[d->hwirq];
> +
> +       line->masked = false;
> +       line->masked_pending = true;
> +}

This looks dangerous in combination with this:

> +static void virtio_gpio_interrupt(struct virtqueue *vq)
> +{
(...)
> +       local_irq_disable();
> +       ret = generic_handle_irq(irq);
> +       local_irq_enable();

Nominally slow IRQs like those being marshalled over
virtio should be nested, handle_nested_irq(irq);
but are they? Or are they just quite slow not super slow?

If a threaded IRQF_ONESHOT was requested the
IRQ core will kick the thread and *MASK* this IRQ,
which means it will call back to your .irq_mask() function
and expect it to be masked from this
point.

But the IRQ will not actually be masked until you issue
your callbacks in the .irq_bus_sync_unlock() callback
right?

So from this point until .irq_bus_sync_unlock()
get called and actually mask the IRQ, it could be
fired again? I suppose the IRQ handler is reentrant?
This would violate the API.

I would say that from this point and until you sync
you need a spinlock or other locking primitive to
stop this IRQ from fireing again, and a spinlock will
imply local_irq_disable() so this gets really complex.

I would say only using nesting IRQs or guarantee this
some other way, one way would be to specify that
whatever is at the other side of virtio cannot send another
GPIO IRQ message before the last one is handled,
so you would need to send a specific (new)
VIRTIO_GPIO_REQ_IRQ_ACK after all other messages
have been sent in .irq_bus_sync_unlock()
so that the next GPIO IRQ can be dispatched after that.

(Is this how messaged signalled interrupts work? No idea.
When in doubt ask the IRQ maintainers.)

Thanks,
Linus Walleij
