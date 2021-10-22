Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3FE1437546
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 12:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232535AbhJVKNr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 06:13:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55308 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232520AbhJVKNq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 Oct 2021 06:13:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634897489;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CT9AhMVst8Rb0tJG5wx2cbFsfJSfVLJq2inhwjhnf3I=;
        b=WKoT+DKiD5N/X5QP5z+yjTUImjVBQwRQ+vHt7u0jRJtSHxjlzC1jcbPACf+xh4NJ8umU3k
        bWFA9lmLGYSDxzBJArUFKx09uvFskayXMmsh9+Wmw8mm+Lv2OsX2vzJnQEAy/zAz0gEdOX
        sqZXRhHXeuDb5CYDmuzjpjmdaP8gcmQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-SrmvdaEkM9aUKBzdXXsARQ-1; Fri, 22 Oct 2021 06:11:27 -0400
X-MC-Unique: SrmvdaEkM9aUKBzdXXsARQ-1
Received: by mail-wm1-f69.google.com with SMTP id u14-20020a05600c19ce00b0030d8549d49aso4144250wmq.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 Oct 2021 03:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CT9AhMVst8Rb0tJG5wx2cbFsfJSfVLJq2inhwjhnf3I=;
        b=XdMGx2OKhfmsIoF7MtKacNtGwRbfJkXhcZeVMsAnOkzKiZWmWnakRb+V3SgHsn8sc8
         tZAvNBBOY0+Qg0vbrFHKNnBipYFZS2aM2l7YPQxfvubKzQubq3nCMOPbQOAWXQ/d3cF2
         ckLh8HKIoY5AygaStoSZNwK6vXXK2LEDWHZRWHgUlLsMUiZQzs3lemgm08Y3BIbTgAUD
         p4487WmY3X/5AVtmYh80MAbZTC5yREwvgDMIpL03PN5kiL4ST7RCRkgdDj6SqGRiZUcF
         wbVVdEEEK+OVfUdpfWnokupNGSYUuP+P+kc9q3I4mgx2YqIsU5j7S36wGhw+aI1rUr4x
         f5rA==
X-Gm-Message-State: AOAM532wGi9XaOytSs9kwdkSIdhud4vEtyp8584SFm87rnZJQWeHVjD7
        XmnsoIOhFifiaelkCLDbFT/SgRnY7l5N7+GuM2ISl4pNzS5CTsMt/lSE5R22F+PXVGYGW9GtcYP
        KLvIstuMmFq9lpSHyvKgZ4w==
X-Received: by 2002:adf:b348:: with SMTP id k8mr14229632wrd.435.1634897486372;
        Fri, 22 Oct 2021 03:11:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywC3K8m71GWCYmISDFdW9jxEo8hX1P48wGi2RgQXx4MCi5Aozd0ACDSuNDcf6IbJDuA97IpQ==
X-Received: by 2002:adf:b348:: with SMTP id k8mr14229579wrd.435.1634897486096;
        Fri, 22 Oct 2021 03:11:26 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
        by smtp.gmail.com with ESMTPSA id a127sm10537961wme.40.2021.10.22.03.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 03:11:25 -0700 (PDT)
Date:   Fri, 22 Oct 2021 06:11:20 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        stratos-dev@op-lists.linaro.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH V7] gpio: virtio: Add IRQ support
Message-ID: <20211022060746-mutt-send-email-mst@kernel.org>
References: <ae639da42050ee0ffd9ba1fffc2c86a38d66cec4.1634813977.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae639da42050ee0ffd9ba1fffc2c86a38d66cec4.1634813977.git.viresh.kumar@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 21, 2021 at 04:34:19PM +0530, Viresh Kumar wrote:
> This patch adds IRQ support for the virtio GPIO driver. Note that this
> uses the irq_bus_lock/unlock() callbacks, since those operations over
> virtio may sleep.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

I think this can be merged - while ballot did not close yet
you already have a majority vote Yes. Worst case we'll revert
but I don't expect that.


> ---
> Bartosz,
> 
> The spec changes are close to merging now, I will let you know once the ballot
> is closed and the spec changes are merged. You can then pick this patch for
> 5.16.
> 
> V6->V7:
> - Use generic_handle_domain_irq.
> - Drop check for IRQ_TYPE_NONE, dead code.
> - Avoid breaking line to fit into 80 columns.
> 
> V5->V6:
> - Sent it separately as the other patches are already merged.
> - Queue the buffers only after enabling the irq (as per latest spec).
> - Migrate to raw_spinlock_t.
> 
>  drivers/gpio/Kconfig             |   1 +
>  drivers/gpio/gpio-virtio.c       | 302 ++++++++++++++++++++++++++++++-
>  include/uapi/linux/virtio_gpio.h |  25 +++
>  3 files changed, 324 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index fae5141251e5..bfa723ff8e7c 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1674,6 +1674,7 @@ config GPIO_MOCKUP
>  config GPIO_VIRTIO
>  	tristate "VirtIO GPIO support"
>  	depends on VIRTIO
> +	select GPIOLIB_IRQCHIP
>  	help
>  	  Say Y here to enable guest support for virtio-based GPIO controllers.
>  
> diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
> index d24f1c9264bc..aeec4bf0b625 100644
> --- a/drivers/gpio/gpio-virtio.c
> +++ b/drivers/gpio/gpio-virtio.c
> @@ -16,6 +16,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/spinlock.h>
>  #include <linux/virtio_config.h>
>  #include <uapi/linux/virtio_gpio.h>
>  #include <uapi/linux/virtio_ids.h>
> @@ -28,12 +29,30 @@ struct virtio_gpio_line {
>  	unsigned int rxlen;
>  };
>  
> +struct vgpio_irq_line {
> +	u8 type;
> +	bool disabled;
> +	bool masked;
> +	bool queued;
> +	bool update_pending;
> +	bool queue_pending;
> +
> +	struct virtio_gpio_irq_request ireq ____cacheline_aligned;
> +	struct virtio_gpio_irq_response ires ____cacheline_aligned;
> +};
> +
>  struct virtio_gpio {
>  	struct virtio_device *vdev;
>  	struct mutex lock; /* Protects virtqueue operation */
>  	struct gpio_chip gc;
>  	struct virtio_gpio_line *lines;
>  	struct virtqueue *request_vq;
> +
> +	/* irq support */
> +	struct virtqueue *event_vq;
> +	struct mutex irq_lock; /* Protects irq operation */
> +	raw_spinlock_t eventq_lock; /* Protects queuing of the buffer */
> +	struct vgpio_irq_line *irq_lines;
>  };
>  
>  static int _virtio_gpio_req(struct virtio_gpio *vgpio, u16 type, u16 gpio,
> @@ -186,6 +205,238 @@ static void virtio_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
>  	virtio_gpio_req(vgpio, VIRTIO_GPIO_MSG_SET_VALUE, gpio, value, NULL);
>  }
>  
> +/* Interrupt handling */
> +static void virtio_gpio_irq_prepare(struct virtio_gpio *vgpio, u16 gpio)
> +{
> +	struct vgpio_irq_line *irq_line = &vgpio->irq_lines[gpio];
> +	struct virtio_gpio_irq_request *ireq = &irq_line->ireq;
> +	struct virtio_gpio_irq_response *ires = &irq_line->ires;
> +	struct scatterlist *sgs[2], req_sg, res_sg;
> +	int ret;
> +
> +	if (WARN_ON(irq_line->queued || irq_line->masked || irq_line->disabled))
> +		return;
> +
> +	ireq->gpio = cpu_to_le16(gpio);
> +	sg_init_one(&req_sg, ireq, sizeof(*ireq));
> +	sg_init_one(&res_sg, ires, sizeof(*ires));
> +	sgs[0] = &req_sg;
> +	sgs[1] = &res_sg;
> +
> +	ret = virtqueue_add_sgs(vgpio->event_vq, sgs, 1, 1, irq_line, GFP_ATOMIC);
> +	if (ret) {
> +		dev_err(&vgpio->vdev->dev, "failed to add request to eventq\n");
> +		return;
> +	}
> +
> +	irq_line->queued = true;
> +	virtqueue_kick(vgpio->event_vq);
> +}
> +
> +static void virtio_gpio_irq_enable(struct irq_data *d)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct virtio_gpio *vgpio = gpiochip_get_data(gc);
> +	struct vgpio_irq_line *irq_line = &vgpio->irq_lines[d->hwirq];
> +
> +	raw_spin_lock(&vgpio->eventq_lock);
> +	irq_line->disabled = false;
> +	irq_line->masked = false;
> +	irq_line->queue_pending = true;
> +	raw_spin_unlock(&vgpio->eventq_lock);
> +
> +	irq_line->update_pending = true;
> +}
> +
> +static void virtio_gpio_irq_disable(struct irq_data *d)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct virtio_gpio *vgpio = gpiochip_get_data(gc);
> +	struct vgpio_irq_line *irq_line = &vgpio->irq_lines[d->hwirq];
> +
> +	raw_spin_lock(&vgpio->eventq_lock);
> +	irq_line->disabled = true;
> +	irq_line->masked = true;
> +	irq_line->queue_pending = false;
> +	raw_spin_unlock(&vgpio->eventq_lock);
> +
> +	irq_line->update_pending = true;
> +}
> +
> +static void virtio_gpio_irq_mask(struct irq_data *d)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct virtio_gpio *vgpio = gpiochip_get_data(gc);
> +	struct vgpio_irq_line *irq_line = &vgpio->irq_lines[d->hwirq];
> +
> +	raw_spin_lock(&vgpio->eventq_lock);
> +	irq_line->masked = true;
> +	raw_spin_unlock(&vgpio->eventq_lock);
> +}
> +
> +static void virtio_gpio_irq_unmask(struct irq_data *d)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct virtio_gpio *vgpio = gpiochip_get_data(gc);
> +	struct vgpio_irq_line *irq_line = &vgpio->irq_lines[d->hwirq];
> +
> +	raw_spin_lock(&vgpio->eventq_lock);
> +	irq_line->masked = false;
> +
> +	/* Queue the buffer unconditionally on unmask */
> +	virtio_gpio_irq_prepare(vgpio, d->hwirq);
> +	raw_spin_unlock(&vgpio->eventq_lock);
> +}
> +
> +static int virtio_gpio_irq_set_type(struct irq_data *d, unsigned int type)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct virtio_gpio *vgpio = gpiochip_get_data(gc);
> +	struct vgpio_irq_line *irq_line = &vgpio->irq_lines[d->hwirq];
> +
> +	switch (type) {
> +	case IRQ_TYPE_EDGE_RISING:
> +		type = VIRTIO_GPIO_IRQ_TYPE_EDGE_RISING;
> +		break;
> +	case IRQ_TYPE_EDGE_FALLING:
> +		type = VIRTIO_GPIO_IRQ_TYPE_EDGE_FALLING;
> +		break;
> +	case IRQ_TYPE_EDGE_BOTH:
> +		type = VIRTIO_GPIO_IRQ_TYPE_EDGE_BOTH;
> +		break;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		type = VIRTIO_GPIO_IRQ_TYPE_LEVEL_LOW;
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		type = VIRTIO_GPIO_IRQ_TYPE_LEVEL_HIGH;
> +		break;
> +	default:
> +		dev_err(&vgpio->vdev->dev, "unsupported irq type: %u\n", type);
> +		return -EINVAL;
> +	}
> +
> +	irq_line->type = type;
> +	irq_line->update_pending = true;
> +
> +	return 0;
> +}
> +
> +static void virtio_gpio_irq_bus_lock(struct irq_data *d)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct virtio_gpio *vgpio = gpiochip_get_data(gc);
> +
> +	mutex_lock(&vgpio->irq_lock);
> +}
> +
> +static void virtio_gpio_irq_bus_sync_unlock(struct irq_data *d)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct virtio_gpio *vgpio = gpiochip_get_data(gc);
> +	struct vgpio_irq_line *irq_line = &vgpio->irq_lines[d->hwirq];
> +	u8 type = irq_line->disabled ? VIRTIO_GPIO_IRQ_TYPE_NONE : irq_line->type;
> +	unsigned long flags;
> +
> +	if (irq_line->update_pending) {
> +		irq_line->update_pending = false;
> +		virtio_gpio_req(vgpio, VIRTIO_GPIO_MSG_IRQ_TYPE, d->hwirq, type,
> +				NULL);
> +
> +		/* Queue the buffer only after interrupt is enabled */
> +		raw_spin_lock_irqsave(&vgpio->eventq_lock, flags);
> +		if (irq_line->queue_pending) {
> +			irq_line->queue_pending = false;
> +			virtio_gpio_irq_prepare(vgpio, d->hwirq);
> +		}
> +		raw_spin_unlock_irqrestore(&vgpio->eventq_lock, flags);
> +	}
> +
> +	mutex_unlock(&vgpio->irq_lock);
> +}
> +
> +static struct irq_chip vgpio_irq_chip = {
> +	.name			= "virtio-gpio",
> +	.irq_enable		= virtio_gpio_irq_enable,
> +	.irq_disable		= virtio_gpio_irq_disable,
> +	.irq_mask		= virtio_gpio_irq_mask,
> +	.irq_unmask		= virtio_gpio_irq_unmask,
> +	.irq_set_type		= virtio_gpio_irq_set_type,
> +
> +	/* These are required to implement irqchip for slow busses */
> +	.irq_bus_lock		= virtio_gpio_irq_bus_lock,
> +	.irq_bus_sync_unlock	= virtio_gpio_irq_bus_sync_unlock,
> +};
> +
> +static bool ignore_irq(struct virtio_gpio *vgpio, int gpio,
> +		       struct vgpio_irq_line *irq_line)
> +{
> +	bool ignore = false;
> +
> +	raw_spin_lock(&vgpio->eventq_lock);
> +	irq_line->queued = false;
> +
> +	/* Interrupt is disabled currently */
> +	if (irq_line->masked || irq_line->disabled) {
> +		ignore = true;
> +		goto unlock;
> +	}
> +
> +	/*
> +	 * Buffer is returned as the interrupt was disabled earlier, but is
> +	 * enabled again now. Requeue the buffers.
> +	 */
> +	if (irq_line->ires.status == VIRTIO_GPIO_IRQ_STATUS_INVALID) {
> +		virtio_gpio_irq_prepare(vgpio, gpio);
> +		ignore = true;
> +		goto unlock;
> +	}
> +
> +	if (WARN_ON(irq_line->ires.status != VIRTIO_GPIO_IRQ_STATUS_VALID))
> +		ignore = true;
> +
> +unlock:
> +	raw_spin_unlock(&vgpio->eventq_lock);
> +
> +	return ignore;
> +}
> +
> +static void virtio_gpio_event_vq(struct virtqueue *vq)
> +{
> +	struct virtio_gpio *vgpio = vq->vdev->priv;
> +	struct device *dev = &vgpio->vdev->dev;
> +	struct vgpio_irq_line *irq_line;
> +	int gpio, ret;
> +	unsigned int len;
> +
> +	while (true) {
> +		irq_line = virtqueue_get_buf(vgpio->event_vq, &len);
> +		if (!irq_line)
> +			break;
> +
> +		if (len != sizeof(irq_line->ires)) {
> +			dev_err(dev, "irq with incorrect length (%u : %u)\n",
> +				len, (unsigned int)sizeof(irq_line->ires));
> +			continue;
> +		}
> +
> +		/*
> +		 * Find GPIO line number from the offset of irq_line within the
> +		 * irq_lines block. We can also get GPIO number from
> +		 * irq-request, but better not to rely on a buffer returned by
> +		 * remote.
> +		 */
> +		gpio = irq_line - vgpio->irq_lines;
> +		WARN_ON(gpio >= vgpio->gc.ngpio);
> +
> +		if (unlikely(ignore_irq(vgpio, gpio, irq_line)))
> +			continue;
> +
> +		ret = generic_handle_domain_irq(vgpio->gc.irq.domain, gpio);
> +		if (ret)
> +			dev_err(dev, "failed to handle interrupt: %d\n", ret);
> +	};
> +}
> +
>  static void virtio_gpio_request_vq(struct virtqueue *vq)
>  {
>  	struct virtio_gpio_line *line;
> @@ -210,14 +461,15 @@ static void virtio_gpio_free_vqs(struct virtio_device *vdev)
>  static int virtio_gpio_alloc_vqs(struct virtio_gpio *vgpio,
>  				 struct virtio_device *vdev)
>  {
> -	const char * const names[] = { "requestq" };
> +	const char * const names[] = { "requestq", "eventq" };
>  	vq_callback_t *cbs[] = {
>  		virtio_gpio_request_vq,
> +		virtio_gpio_event_vq,
>  	};
> -	struct virtqueue *vqs[1] = { NULL };
> +	struct virtqueue *vqs[2] = { NULL, NULL };
>  	int ret;
>  
> -	ret = virtio_find_vqs(vdev, 1, vqs, cbs, names, NULL);
> +	ret = virtio_find_vqs(vdev, vgpio->irq_lines ? 2 : 1, vqs, cbs, names, NULL);
>  	if (ret) {
>  		dev_err(&vdev->dev, "failed to find vqs: %d\n", ret);
>  		return ret;
> @@ -225,11 +477,23 @@ static int virtio_gpio_alloc_vqs(struct virtio_gpio *vgpio,
>  
>  	if (!vqs[0]) {
>  		dev_err(&vdev->dev, "failed to find requestq vq\n");
> -		return -ENODEV;
> +		goto out;
>  	}
>  	vgpio->request_vq = vqs[0];
>  
> +	if (vgpio->irq_lines && !vqs[1]) {
> +		dev_err(&vdev->dev, "failed to find eventq vq\n");
> +		goto out;
> +	}
> +	vgpio->event_vq = vqs[1];
> +
>  	return 0;
> +
> +out:
> +	if (vqs[0] || vqs[1])
> +		virtio_gpio_free_vqs(vdev);
> +
> +	return -ENODEV;
>  }
>  
>  static const char **virtio_gpio_get_names(struct virtio_gpio *vgpio,
> @@ -325,6 +589,30 @@ static int virtio_gpio_probe(struct virtio_device *vdev)
>  	vgpio->gc.owner			= THIS_MODULE;
>  	vgpio->gc.can_sleep		= true;
>  
> +	/* Interrupt support */
> +	if (virtio_has_feature(vdev, VIRTIO_GPIO_F_IRQ)) {
> +		vgpio->irq_lines = devm_kcalloc(dev, ngpio, sizeof(*vgpio->irq_lines), GFP_KERNEL);
> +		if (!vgpio->irq_lines)
> +			return -ENOMEM;
> +
> +		/* The event comes from the outside so no parent handler */
> +		vgpio->gc.irq.parent_handler	= NULL;
> +		vgpio->gc.irq.num_parents	= 0;
> +		vgpio->gc.irq.parents		= NULL;
> +		vgpio->gc.irq.default_type	= IRQ_TYPE_NONE;
> +		vgpio->gc.irq.handler		= handle_level_irq;
> +		vgpio->gc.irq.chip		= &vgpio_irq_chip;
> +
> +		for (i = 0; i < ngpio; i++) {
> +			vgpio->irq_lines[i].type = VIRTIO_GPIO_IRQ_TYPE_NONE;
> +			vgpio->irq_lines[i].disabled = true;
> +			vgpio->irq_lines[i].masked = true;
> +		}
> +
> +		mutex_init(&vgpio->irq_lock);
> +		raw_spin_lock_init(&vgpio->eventq_lock);
> +	}
> +
>  	ret = virtio_gpio_alloc_vqs(vgpio, vdev);
>  	if (ret)
>  		return ret;
> @@ -357,7 +645,13 @@ static const struct virtio_device_id id_table[] = {
>  };
>  MODULE_DEVICE_TABLE(virtio, id_table);
>  
> +static const unsigned int features[] = {
> +	VIRTIO_GPIO_F_IRQ,
> +};
> +
>  static struct virtio_driver virtio_gpio_driver = {
> +	.feature_table		= features,
> +	.feature_table_size	= ARRAY_SIZE(features),
>  	.id_table		= id_table,
>  	.probe			= virtio_gpio_probe,
>  	.remove			= virtio_gpio_remove,
> diff --git a/include/uapi/linux/virtio_gpio.h b/include/uapi/linux/virtio_gpio.h
> index 0445f905d8cc..d04af9c5f0de 100644
> --- a/include/uapi/linux/virtio_gpio.h
> +++ b/include/uapi/linux/virtio_gpio.h
> @@ -5,12 +5,16 @@
>  
>  #include <linux/types.h>
>  
> +/* Virtio GPIO Feature bits */
> +#define VIRTIO_GPIO_F_IRQ			0
> +
>  /* Virtio GPIO request types */
>  #define VIRTIO_GPIO_MSG_GET_NAMES		0x0001
>  #define VIRTIO_GPIO_MSG_GET_DIRECTION		0x0002
>  #define VIRTIO_GPIO_MSG_SET_DIRECTION		0x0003
>  #define VIRTIO_GPIO_MSG_GET_VALUE		0x0004
>  #define VIRTIO_GPIO_MSG_SET_VALUE		0x0005
> +#define VIRTIO_GPIO_MSG_IRQ_TYPE		0x0006
>  
>  /* Possible values of the status field */
>  #define VIRTIO_GPIO_STATUS_OK			0x0
> @@ -21,6 +25,14 @@
>  #define VIRTIO_GPIO_DIRECTION_OUT		0x01
>  #define VIRTIO_GPIO_DIRECTION_IN		0x02
>  
> +/* Virtio GPIO IRQ types */
> +#define VIRTIO_GPIO_IRQ_TYPE_NONE		0x00
> +#define VIRTIO_GPIO_IRQ_TYPE_EDGE_RISING	0x01
> +#define VIRTIO_GPIO_IRQ_TYPE_EDGE_FALLING	0x02
> +#define VIRTIO_GPIO_IRQ_TYPE_EDGE_BOTH		0x03
> +#define VIRTIO_GPIO_IRQ_TYPE_LEVEL_HIGH		0x04
> +#define VIRTIO_GPIO_IRQ_TYPE_LEVEL_LOW		0x08
> +
>  struct virtio_gpio_config {
>  	__le16 ngpio;
>  	__u8 padding[2];
> @@ -44,4 +56,17 @@ struct virtio_gpio_response_get_names {
>  	__u8 value[];
>  };
>  
> +/* Virtio GPIO IRQ Request / Response */
> +struct virtio_gpio_irq_request {
> +	__le16 gpio;
> +};
> +
> +struct virtio_gpio_irq_response {
> +	__u8 status;
> +};
> +
> +/* Possible values of the interrupt status field */
> +#define VIRTIO_GPIO_IRQ_STATUS_INVALID		0x0
> +#define VIRTIO_GPIO_IRQ_STATUS_VALID		0x1
> +
>  #endif /* _LINUX_VIRTIO_GPIO_H */
> -- 
> 2.31.1.272.g89b43f80a514

