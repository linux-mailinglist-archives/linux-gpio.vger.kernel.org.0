Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71C683E4428
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Aug 2021 12:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234344AbhHIKrj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Aug 2021 06:47:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234882AbhHIKrS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Aug 2021 06:47:18 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CC5CC06179C
        for <linux-gpio@vger.kernel.org>; Mon,  9 Aug 2021 03:46:58 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id f3so5271597plg.3
        for <linux-gpio@vger.kernel.org>; Mon, 09 Aug 2021 03:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+lXsAMRVCRHKcw8DLcgU+vSRIUJz4YchWDyat4QT5pI=;
        b=BTWLAgVTp/jZa3QIwowBsSzCo85GoobAVUyd3zHDA2iqXw9p/vjiqIn+Qd5kb9hAcu
         uEFZpT/do4lw70a96ZWS6dCYmzys52dS/ruek9mDdqmOuwhI+idt6EFO08pvMb4GDccE
         c2AQnn/xH385VEJ8vEzD73X08lg2VtKbMZ7ejZbCb8GLURrwtRWwFdek//9fZT5s1PRv
         CRKuWHfL6mXa/TQ6amBAUStkFpna37XHiKISaU8ApzgQE9U7RI4unjr8pcGzOFENcm2+
         oAs0xu/YRL02eISvm6x2UNr2clkFykID56pb4btMISYPJHvWKzSC6dgzGBUZW/Baiq7R
         73hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+lXsAMRVCRHKcw8DLcgU+vSRIUJz4YchWDyat4QT5pI=;
        b=XwBKxpsbfMKhvGVGizvVMYcsTEi+dE3BnjhlGhdbLQ0NxovkLWC6h0pxhjxiDto53S
         ARKf/dH8YhxRwnbHOmEuHIfoHvvPrk9+wqKo2yrRWVfF+AkDnmnfuo8EjjUFDskRttsR
         CEc4PIRxnBipSGg75A9pdOSvyjKdQ8oZtFyYuriq2Ri9qC5lFzrv4r3KNe7H25doidGP
         yMA/F7+oa5pBtMY1h5OfqDCT0+venwUBn0/3UG4VWyJDPDtnBno4Hoyne5X40t6IIouV
         dThhJgek6zQSVy0FOqqlwmktfH8IUEdv9JoDS36Bs/v+aKNAZhaMZpgw33X6mskqO98k
         nvng==
X-Gm-Message-State: AOAM533BYv9vBB6rLrt7nwaiKnRqnjMM6ZfKxZFu67FXOuM7ZjfsP6mT
        BKEN0AhT2wup2nY5ztk5jCAEiw==
X-Google-Smtp-Source: ABdhPJzaU/6cqJUhFI6s4fWBGkwnUqmq+NgsVZQt4Jg0fLiG+SjXI6ltbkxtyoMosuemw+S+Hp4yvw==
X-Received: by 2002:a63:db4b:: with SMTP id x11mr48497pgi.396.1628506017407;
        Mon, 09 Aug 2021 03:46:57 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id c24sm23601851pgj.11.2021.08.09.03.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 03:46:56 -0700 (PDT)
Date:   Mon, 9 Aug 2021 16:16:54 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Arnd Bergmann <arnd@kernel.org>
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
Subject: Re: [Stratos-dev] [PATCH V4 2/2] gpio: virtio: Add IRQ support
Message-ID: <20210809104654.7crxtuxswbdbkg5p@vireshk-i7>
References: <75c8e6e5e8dfa1889938f3a6b2d991763c7a3717.1627989586.git.viresh.kumar@linaro.org>
 <CAK8P3a29NfFWwtGHhqos1P8f_SmzPJTXvEY5BZJAEMbV2SKe-Q@mail.gmail.com>
 <0100017b1610f711-c53c79f2-9e28-4c45-bb42-8db09688b18e-000000@email.amazonses.com>
 <CAK8P3a0DWkfQcZpmyfKcdNt1MHf8ha6a9L2LmLt1Tv-j0HDr3w@mail.gmail.com>
 <20210805124922.j7lts7tfmm4t2kpf@vireshk-i7>
 <CAK8P3a0kbmPLGCBrjAv7-dW=JWq-pdSBeGUHCxUFmMKvKhCg7w@mail.gmail.com>
 <0100017b1a6c0a05-e41dc16c-b326-4017-a63d-a24a6c1fde70-000000@email.amazonses.com>
 <CAK8P3a2rrueXJHZxuiiShgVmLD916RaxW7xQHHjQXNFkM3Fpvg@mail.gmail.com>
 <20210809073020.y6ruibdm37xnx7hg@vireshk-i7>
 <CAK8P3a3TabswETDAUec-2rbiNBk_K48-UdpTA5Ckvu5ogOyHjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3TabswETDAUec-2rbiNBk_K48-UdpTA5Ckvu5ogOyHjQ@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09-08-21, 09:55, Arnd Bergmann wrote:
> Ah, right. There is already a flag that gets checked by the caller.
> 
> It does feel odd to have an empty 'irq_mask' callback though, so
> maybe there is still something missing, just not what I thought.
> 
> It's probably the result of calling handle_level_irq(), which as you
> said is closer to what we want, but is not exactly what we need for
> this protocol.

Okay, I have tried to take care of locking as well now and used local
flags only to make sure I can depend on them to get the locking
working properly. Lets see what's broken in this now :)

-- 
viresh

-------------------------8<-------------------------

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index 199f8ace1e88..48dc469cfc64 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -16,6 +16,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/spinlock.h>
 #include <linux/virtio_config.h>
 #include <uapi/linux/virtio_gpio.h>
 #include <uapi/linux/virtio_ids.h>
@@ -28,6 +29,17 @@ struct virtio_gpio_line {
 	unsigned int rxlen;
 };
 
+struct vgpio_irq_line {
+	u8 type;
+	bool disabled;
+	bool update_pending;
+	bool masked;
+	bool queued;
+
+	struct virtio_gpio_irq_request ireq ____cacheline_aligned;
+	struct virtio_gpio_irq_response ires ____cacheline_aligned;
+};
+
 struct virtio_gpio {
 	struct virtio_device *vdev;
 	struct mutex lock; /* Protects virtqueue operation */
@@ -35,6 +47,12 @@ struct virtio_gpio {
 	struct virtio_gpio_config config;
 	struct virtio_gpio_line *lines;
 	struct virtqueue *request_vq;
+
+	/* irq support */
+	struct virtqueue *event_vq;
+	struct mutex irq_lock; /* Protects irq operation */
+	spinlock_t eventq_lock; /* Protects queuing of the buffer */
+	struct vgpio_irq_line *irq_lines;
 };
 
 static int _virtio_gpio_req(struct virtio_gpio *vgpio, u16 type, u16 gpio,
@@ -187,6 +205,240 @@ static void virtio_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 	virtio_gpio_req(vgpio, VIRTIO_GPIO_MSG_SET_VALUE, gpio, value, NULL);
 }
 
+/* Interrupt handling */
+static void virtio_gpio_irq_prepare(struct virtio_gpio *vgpio, u16 gpio)
+{
+	struct vgpio_irq_line *irq_line = &vgpio->irq_lines[gpio];
+	struct virtio_gpio_irq_request *ireq = &irq_line->ireq;
+	struct virtio_gpio_irq_response *ires = &irq_line->ires;
+	struct scatterlist *sgs[2], req_sg, res_sg;
+	int ret;
+
+	if (WARN_ON(irq_line->queued || irq_line->masked || irq_line->disabled))
+		return;
+
+	ireq->gpio = cpu_to_le16(gpio);
+	sg_init_one(&req_sg, ireq, sizeof(*ireq));
+	sg_init_one(&res_sg, ires, sizeof(*ires));
+	sgs[0] = &req_sg;
+	sgs[1] = &res_sg;
+
+	ret = virtqueue_add_sgs(vgpio->event_vq, sgs, 1, 1, irq_line, GFP_ATOMIC);
+	if (ret) {
+		dev_err(&vgpio->vdev->dev, "failed to add request to eventq\n");
+		return;
+	}
+
+	irq_line->queued = true;
+	virtqueue_kick(vgpio->event_vq);
+}
+
+static void virtio_gpio_irq_enable(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct virtio_gpio *vgpio = gpiochip_get_data(gc);
+	struct vgpio_irq_line *irq_line = &vgpio->irq_lines[d->hwirq];
+
+	spin_lock(&vgpio->eventq_lock);
+	irq_line->disabled = false;
+	irq_line->masked = false;
+
+	/* Queue the buffer unconditionally on enable */
+	virtio_gpio_irq_prepare(vgpio, d->hwirq);
+	spin_unlock(&vgpio->eventq_lock);
+
+	irq_line->update_pending = true;
+}
+
+static void virtio_gpio_irq_disable(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct virtio_gpio *vgpio = gpiochip_get_data(gc);
+	struct vgpio_irq_line *irq_line = &vgpio->irq_lines[d->hwirq];
+
+	spin_lock(&vgpio->eventq_lock);
+	irq_line->disabled = true;
+	irq_line->masked = true;
+	spin_unlock(&vgpio->eventq_lock);
+
+	irq_line->update_pending = true;
+}
+
+static void virtio_gpio_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct virtio_gpio *vgpio = gpiochip_get_data(gc);
+	struct vgpio_irq_line *irq_line = &vgpio->irq_lines[d->hwirq];
+
+	spin_lock(&vgpio->eventq_lock);
+	irq_line->masked = true;
+	spin_unlock(&vgpio->eventq_lock);
+}
+
+static void virtio_gpio_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct virtio_gpio *vgpio = gpiochip_get_data(gc);
+	struct vgpio_irq_line *irq_line = &vgpio->irq_lines[d->hwirq];
+
+	spin_lock(&vgpio->eventq_lock);
+	irq_line->masked = false;
+
+	/* Queue the buffer unconditionally on unmask */
+	virtio_gpio_irq_prepare(vgpio, d->hwirq);
+	spin_unlock(&vgpio->eventq_lock);
+}
+
+static int virtio_gpio_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct virtio_gpio *vgpio = gpiochip_get_data(gc);
+	struct vgpio_irq_line *irq_line = &vgpio->irq_lines[d->hwirq];
+
+	switch (type) {
+	case IRQ_TYPE_NONE:
+		type = VIRTIO_GPIO_IRQ_TYPE_NONE;
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		type = VIRTIO_GPIO_IRQ_TYPE_EDGE_RISING;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		type = VIRTIO_GPIO_IRQ_TYPE_EDGE_FALLING;
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		type = VIRTIO_GPIO_IRQ_TYPE_EDGE_BOTH;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		type = VIRTIO_GPIO_IRQ_TYPE_LEVEL_LOW;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		type = VIRTIO_GPIO_IRQ_TYPE_LEVEL_HIGH;
+		break;
+	default:
+		dev_err(&vgpio->vdev->dev, "unsupported irq type: %u\n", type);
+		return -EINVAL;
+	}
+
+	irq_line->type = type;
+	irq_line->update_pending = true;
+
+	return 0;
+}
+
+static void update_irq_type(struct virtio_gpio *vgpio, u16 gpio, u8 type)
+{
+	virtio_gpio_req(vgpio, VIRTIO_GPIO_MSG_IRQ_TYPE, gpio, type, NULL);
+}
+
+static void virtio_gpio_irq_bus_lock(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct virtio_gpio *vgpio = gpiochip_get_data(gc);
+
+	mutex_lock(&vgpio->irq_lock);
+}
+
+static void virtio_gpio_irq_bus_sync_unlock(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct virtio_gpio *vgpio = gpiochip_get_data(gc);
+	struct vgpio_irq_line *irq_line = &vgpio->irq_lines[d->hwirq];
+	u8 type = irq_line->disabled ? VIRTIO_GPIO_IRQ_TYPE_NONE : irq_line->type;
+
+	if (irq_line->update_pending) {
+		irq_line->update_pending = false;
+		update_irq_type(vgpio, d->hwirq, type);
+	}
+
+	mutex_unlock(&vgpio->irq_lock);
+}
+
+static struct irq_chip vgpio_irq_chip = {
+	.name			= "virtio-gpio",
+	.irq_enable		= virtio_gpio_irq_enable,
+	.irq_disable		= virtio_gpio_irq_disable,
+	.irq_mask		= virtio_gpio_irq_mask,
+	.irq_unmask		= virtio_gpio_irq_unmask,
+	.irq_set_type		= virtio_gpio_irq_set_type,
+
+	/* These are required to implement irqchip for slow busses */
+	.irq_bus_lock		= virtio_gpio_irq_bus_lock,
+	.irq_bus_sync_unlock	= virtio_gpio_irq_bus_sync_unlock,
+};
+
+static bool skip_irq_event(struct virtio_gpio *vgpio, int gpio,
+			   struct vgpio_irq_line *irq_line)
+{
+	bool skip = false;
+
+	spin_lock(&vgpio->eventq_lock);
+	irq_line->queued = false;
+
+	/* Interrupt is disabled currently */
+	if (irq_line->masked || irq_line->disabled) {
+		skip = true;
+		goto unlock;
+	}
+
+	/*
+	 * Buffer is returned after the interrupt is masked. The interrupt is
+	 * already enabled again now, requeue the buffers.
+	 */
+	if (irq_line->ires.status == VIRTIO_GPIO_IRQ_STATUS_INVALID) {
+		virtio_gpio_irq_prepare(vgpio, gpio);
+		skip = true;
+		goto unlock;
+	}
+
+	if (WARN_ON(irq_line->ires.status != VIRTIO_GPIO_IRQ_STATUS_VALID))
+		skip = true;
+
+unlock:
+	spin_unlock(&vgpio->eventq_lock);
+
+	return skip;
+}
+
+static void virtio_gpio_event_vq(struct virtqueue *vq)
+{
+	struct virtio_gpio *vgpio = vq->vdev->priv;
+	struct device *dev = &vgpio->vdev->dev;
+	struct vgpio_irq_line *irq_line;
+	int irq, gpio, ret;
+	unsigned int len;
+
+	while (true) {
+		irq_line = virtqueue_get_buf(vgpio->event_vq, &len);
+		if (!irq_line)
+			break;
+
+		if (len != sizeof(irq_line->ires)) {
+			dev_err(dev, "irq with incorrect length (%u : %u)\n",
+				len, (unsigned)sizeof(irq_line->ires));
+			continue;
+		}
+
+		/*
+		 * Find GPIO line number from the offset of irq_line within the
+		 * irq_lines block. We can also get GPIO number from
+		 * irq-request, but better not rely on a value returned by
+		 * remote.
+		 */
+		gpio = irq_line - vgpio->irq_lines;
+		WARN_ON(gpio >= vgpio->config.ngpio);
+
+		if (skip_irq_event(vgpio, gpio, irq_line))
+			continue;
+
+		irq = irq_find_mapping(vgpio->gc.irq.domain, gpio);
+		WARN_ON(!irq);
+
+		ret = generic_handle_irq(irq);
+		if (ret)
+			dev_err(dev, "failed to handle interrupt: %d\n", ret);
+	};
+}
+
 static void virtio_gpio_request_vq(struct virtqueue *vq)
 {
 	struct virtio_gpio_line *line;
@@ -211,14 +463,15 @@ static void virtio_gpio_free_vqs(struct virtio_device *vdev)
 static int virtio_gpio_alloc_vqs(struct virtio_gpio *vgpio,
 				 struct virtio_device *vdev)
 {
-	const char * const names[] = { "requestq" };
+	const char * const names[] = { "requestq", "eventq" };
 	vq_callback_t *cbs[] = {
 		virtio_gpio_request_vq,
+		virtio_gpio_event_vq,
 	};
-	struct virtqueue *vqs[1] = { NULL };
+	struct virtqueue *vqs[2] = { NULL, NULL };
 	int ret;
 
-	ret = virtio_find_vqs(vdev, 1, vqs, cbs, names, NULL);
+	ret = virtio_find_vqs(vdev, vgpio->irq_lines ? 2 : 1, vqs, cbs, names, NULL);
 	if (ret) {
 		dev_err(&vdev->dev, "failed to find vqs: %d\n", ret);
 		return ret;
@@ -226,11 +479,23 @@ static int virtio_gpio_alloc_vqs(struct virtio_gpio *vgpio,
 
 	if (!vqs[0]) {
 		dev_err(&vdev->dev, "failed to find requestq vq\n");
-		return -ENODEV;
+		goto out;
 	}
 	vgpio->request_vq = vqs[0];
 
+	if (vgpio->irq_lines && !vqs[1]) {
+		dev_err(&vdev->dev, "failed to find eventq vq\n");
+		goto out;
+	}
+	vgpio->event_vq = vqs[1];
+
 	return 0;
+
+out:
+	if (vqs[0] || vqs[1])
+		virtio_gpio_free_vqs(vdev);
+
+	return -ENODEV;
 }
 
 static const char **virtio_gpio_get_names(struct virtio_gpio *vgpio)
@@ -326,6 +591,32 @@ static int virtio_gpio_probe(struct virtio_device *vdev)
 	vgpio->gc.owner			= THIS_MODULE;
 	vgpio->gc.can_sleep		= true;
 
+	/* Interrupt support */
+	if (virtio_has_feature(vdev, VIRTIO_GPIO_F_IRQ)) {
+		vgpio->irq_lines = devm_kcalloc(dev, config->ngpio,
+						sizeof(*vgpio->irq_lines),
+						GFP_KERNEL);
+		if (!vgpio->irq_lines)
+			return -ENOMEM;
+
+		/* The event comes from the outside so no parent handler */
+		vgpio->gc.irq.parent_handler	= NULL;
+		vgpio->gc.irq.num_parents	= 0;
+		vgpio->gc.irq.parents		= NULL;
+		vgpio->gc.irq.default_type	= IRQ_TYPE_NONE;
+		vgpio->gc.irq.handler		= handle_level_irq;
+		vgpio->gc.irq.chip		= &vgpio_irq_chip;
+
+		for (i = 0; i < config->ngpio; i++) {
+			vgpio->irq_lines[i].type = VIRTIO_GPIO_IRQ_TYPE_NONE;
+			vgpio->irq_lines[i].disabled = true;
+			vgpio->irq_lines[i].masked = true;
+		}
+
+		mutex_init(&vgpio->irq_lock);
+		spin_lock_init(&vgpio->eventq_lock);
+	}
+
 	ret = virtio_gpio_alloc_vqs(vgpio, vdev);
 	if (ret)
 		return ret;
@@ -358,7 +649,13 @@ static const struct virtio_device_id id_table[] = {
 };
 MODULE_DEVICE_TABLE(virtio, id_table);
 
+static const unsigned int features[] = {
+	VIRTIO_GPIO_F_IRQ,
+};
+
 static struct virtio_driver virtio_gpio_driver = {
+	.feature_table		= features,
+	.feature_table_size	= ARRAY_SIZE(features),
 	.id_table		= id_table,
 	.probe			= virtio_gpio_probe,
 	.remove			= virtio_gpio_remove,
