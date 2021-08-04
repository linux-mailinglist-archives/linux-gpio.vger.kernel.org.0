Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1F73DFBB3
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Aug 2021 09:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235749AbhHDHFs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Aug 2021 03:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235207AbhHDHFr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Aug 2021 03:05:47 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D29C0C061798
        for <linux-gpio@vger.kernel.org>; Wed,  4 Aug 2021 00:05:34 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id e2-20020a17090a4a02b029016f3020d867so2252588pjh.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Aug 2021 00:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xDSd0Sk7OOVTJLj0Kr0rQVLGfrtRCoQjOaaQ0mH27Zc=;
        b=fxsKekn9JqnpNnefBJPwd6/QD8EB7YVxndmXqB12cVPdkohoFoTF1C6irb1p8woFOV
         YwA1PZQBC5ZtUJGTnXpK8sUfJQcX02ruLcRwjlr/EzK9HG3G1wJ9D7aF5P93Z2kIMaeF
         HueontkvDeYtzD3vFtWkPDBtJ+JTNQLIV8clSzQ41M9svM+XDDAy4QKAbvzdYUerA7Xn
         Yqz5cod5kAdMQ7Uyrpgz0bJoLREjvyiY3sNeY/PfO6U1E3Da6Kf1Q4Do32Ngux8ut9Ol
         WcL/66S4ncTnvw5Co+l6c1CEBFALS2yls/ebtbzTi8ekvFsZqmrqm7wBRWfQeEVVXOn7
         XU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xDSd0Sk7OOVTJLj0Kr0rQVLGfrtRCoQjOaaQ0mH27Zc=;
        b=Dcn7PcD4zElubEVFxLk5B3FyUqyW/WW74asEZo/F5UeBLQGnlzew+AAnBZ/UPIwLLN
         Yzi08ZE/QaoYx8vbAx+EWieJPsQiHErUumvAiSx2lFLKsqQWj2z5EAz73oTIlqWbG+Qo
         8mRHtqcj4iKiWzuobQLFrpgPb1GtGHIkRw6z9zFzuLMjs3x3Vi/TmgEw7U8ccIZjryuy
         kug2iq6jLYXXWxwpQpo1yUB3tVbhHAlGDo7F2VASgsWYMfGfCUvaKjFZoGBt84Uh+PYQ
         5jQQVm3JlTYxuH2QPFYaTxcP+dvmsXaPAuXJKzdFyXqvgSs9Uc9Vd4u8sAU1I4kfUjFh
         xG3g==
X-Gm-Message-State: AOAM533TSDTIMXAVEga/9kiErff9Fb/QE5arOVJUyYepkMegtjxqA9sJ
        GpgbQXLIuEWkWYG7cPcErQHNhg==
X-Google-Smtp-Source: ABdhPJwVg3WujjcjF/nTzPLHSowRjAx5x8su7mXB5PqRTS/R6Pkzz9WKHeu21n3s7YJl987X9va5Zg==
X-Received: by 2002:a17:90a:eb0a:: with SMTP id j10mr26253461pjz.16.1628060734234;
        Wed, 04 Aug 2021 00:05:34 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id n1sm1823083pgt.63.2021.08.04.00.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 00:05:33 -0700 (PDT)
Date:   Wed, 4 Aug 2021 12:35:31 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE" 
        <virtualization@lists.linux-foundation.org>
Subject: Re: [PATCH V4 2/2] gpio: virtio: Add IRQ support
Message-ID: <20210804070531.w3h3jm6rou2hpgqj@vireshk-i7>
References: <cover.1627989586.git.viresh.kumar@linaro.org>
 <75c8e6e5e8dfa1889938f3a6b2d991763c7a3717.1627989586.git.viresh.kumar@linaro.org>
 <CAK8P3a29NfFWwtGHhqos1P8f_SmzPJTXvEY5BZJAEMbV2SKe-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a29NfFWwtGHhqos1P8f_SmzPJTXvEY5BZJAEMbV2SKe-Q@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 03-08-21, 17:01, Arnd Bergmann wrote:
> On Tue, Aug 3, 2021 at 1:36 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > +struct vgpio_irq_line {
> > +       u8 type;
> > +       bool masked;
> > +       bool update_pending;
> > +       bool queued;
> > +
> > +       struct virtio_gpio_irq_request ireq;
> > +       struct virtio_gpio_irq_response ires;
> > +};
> 
> I think the last two members should be marked as __cacheline_aligned,
> since they are transferred separately over DMA.

Right.

> > +static void virtio_gpio_irq_eoi(struct irq_data *d)
> > +{
> > +       /*
> > +        * Queue buffers, by calling virtio_gpio_irq_prepare(), from
> > +        * virtio_gpio_event_vq() itself, after taking into consideration the
> > +        * masking status of the interrupt.
> > +        */
> > +}
> 
> Shouldn't this just requeue the interrupt? There is no reason to
> defer this, and I think we want the normal operation to not have
> to involve any scheduling.
> 
> > +static void virtio_gpio_irq_unmask(struct irq_data *d)
> > +{
> > +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> > +       struct virtio_gpio *vgpio = gpiochip_get_data(gc);
> > +       struct vgpio_irq_line *irq_line = &vgpio->irq_lines[d->hwirq];
> > +
> > +       irq_line->masked = false;
> > +       irq_line->update_pending = true;
> > +}
> 
> Same here. unmask is probably less important, but it's the
> same operation: if you want interrupts to become active
> again when they are not, just queue the request

We can't because its a slow bus ? And unmask can be called from
irq-context. That's exactly why we had the irq_bus_lock/unlock
discussion earlier.

> > +static void virtio_gpio_irq_mask(struct irq_data *d)
> > +{
> > +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> > +       struct virtio_gpio *vgpio = gpiochip_get_data(gc);
> > +       struct vgpio_irq_line *irq_line = &vgpio->irq_lines[d->hwirq];
> > +
> > +       irq_line->masked = true;
> > +       irq_line->update_pending = true;
> > +}
> 
> This is of course the tricky bit, I was hoping you had found a solution
> based on what I wrote above for eio() and unmask().
> 
> > +static void vgpio_work_handler(struct work_struct *work)
> > +{
> > +       struct virtio_gpio *vgpio = container_of(work, struct virtio_gpio,
> > +                                                work);
> > +       struct device *dev = &vgpio->vdev->dev;
> > +       struct vgpio_irq_line *irq_line;
> > +       int irq, gpio, ret;
> > +       unsigned int len;
> > +
> > +       mutex_lock(&vgpio->irq_lock);
> > +
> > +       while (true) {
> > +               irq_line = virtqueue_get_buf(vgpio->event_vq, &len);
> > +               if (!irq_line)
> > +                       break;
> 
> Related to above, I think all the eventq handling should be moved into the
> virtio_gpio_event_vq() function directly.

You mean without scheduling a work ?

> > +               /* The interrupt may have been disabled by now */
> > +               if (irq_line->update_pending && irq_line->masked)
> > +                       update_irq_type(vgpio, gpio, VIRTIO_GPIO_IRQ_TYPE_NONE);
> 
> This is a part I'm not sure about, and I suppose it's the same part that
> Marc was also confused by.
> 
> As far as I can tell, the update_irq_type() message would lead to the
> interrupt getting delivered when it was armed and is now getting disabled,
> but I don't see why we would call update_irq_type() as a result of the
> eventq notification.

Lemme try to explain answer to all other question together here.

The irq related functions get called in two scenarios:

- request_irq() or irq_set_irq_type(), enable/disable_irq(), etc:

  The call sequence here is like this:

  ->irq_bus_lock()

  ->spin-lock-irqsave
  ->irq_mask()/irq_unmask()/irq_set_type()..
  ->spin-unlock-irqsave

  ->irq_bus_unlock()


  So the mask/unmask/set-type routines can't issue virtio requests and
  we need to do that from irq_bus_unlock(). This shall answer your
  question about mask/unmask, right ? Or maybe I misunderstood them
  then ?


- Interrupt: i.e. buffer sent back by the host over virtio.

  virtio_gpio_event_vq() schedules a work item, which processes the
  items from the eventq virtqueue and eventually calls
  generic_handle_irq(). The irq-core can issue calls to
  ->irq_mask/unmask() here without a prior call to
  irq_bus_lock/unlock(), normally they will balance out by the end,
  but I am not sure if it is guaranteed. Moreover, interrupt should be
  re-enabled only after unmask() is called (for ONESHOT) and not at
  EOI, right ?

  I chose not to queue the buffers back from eoi() as it is possible
  that we won't want to queue them at all, as the interrupt needs to
  be disabled by the time generic_handle_irq() returns. And so I did
  everything from the end of vgpio_work_handler()'s loop, i.e. either
  disable the interrupts with VIRTIO_GPIO_IRQ_TYPE_NONE or enable the
  interrupt again by re-queuing the buffer.

Regarding irq handling using work-item, I had to move to that to take
care of locking for re-queuing the buffers for a GPIO line from
irq-handler and bus-unlock. Nothing else seemed to work, though I am
continuing to look into that to see if there is an alternative here.

-- 
viresh
