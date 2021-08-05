Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84EC83E13DF
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Aug 2021 13:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241067AbhHEL1K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Aug 2021 07:27:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241064AbhHEL1G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Aug 2021 07:27:06 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4191C06179A
        for <linux-gpio@vger.kernel.org>; Thu,  5 Aug 2021 04:26:49 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id nh14so7933509pjb.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Aug 2021 04:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aJTPpUh6t2Es8y7Iu7RimXwcA3En7rLzswEc/EhXmpU=;
        b=YSkpZre0qFUWOKnFiY6mD1Cfh1gxdhUbV2KEMmeE/TB+fsbO6IC2Gr40mVUf0+K7jw
         +rRHi2t0fXELui3TCNi2aAW/aRLZGj5Fp83Fw71AZI46Hrb5LqC35XoNCPdGmN+OYfkK
         7JVBREinP2hsOhGxW+ch2yMvYujlN2TxFl6IOwjcfFW7npU/dEwXi1zqvovZk5QU7HBz
         uWZ430mPivPU/3iaz1PTlSWKwR5tXF5Il0HRTwqwEG7/2a0w/XfNYb/styG4Beu0q/bt
         7uW5FI48i+2Dx2dTuYsWdBQ7B64wmrUz7UrhZBGTUWPQ886UC09Omontgy6cfHa6q2Q3
         uQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aJTPpUh6t2Es8y7Iu7RimXwcA3En7rLzswEc/EhXmpU=;
        b=DTx+8jGwNfQdaz1+0nDKx9/u79+ipP2Jf9loSoedqQ2CQDQ0pUaFRK5LUfT1n80NQc
         bXrlw3pWkc6U10m7D6rragqZ3LrKA4D1H+FvOwXw41fiAmlopFxFx+JGpf35UnlbEJC/
         uOeEasl3wz3QZZirMSf4Z1qOz0woaqO5oIVsrOnGsQ2PFbvz6nkaNY6/f+mkEzvv3EFy
         19D5Z54+1oYDP04KbuV4x+SEMGvrPFrbU6ocjrbXDVKxpDokf2o3Woj/Aori0UCgN4rO
         3en6RWk36XPYUmBSWHTID/JUPd3aw4xKrf0ASnHAIrPTFJDZB4m/SQ9gZ+uoRf35bFB5
         tfPw==
X-Gm-Message-State: AOAM531alUu8TSpQyzGpwIhcVys1t5J6SSFuFkxUNEhOjF3VUOqvrFag
        0En5RLVJH8v9LfFpFmwKRj5LxA==
X-Google-Smtp-Source: ABdhPJzv+MboVfqPh0q+vDLPaa8pd6outUQJG4TuEMiFxmK76373FG4avjK/7bnF3wpUokDchlHCMQ==
X-Received: by 2002:aa7:8d10:0:b029:303:8d17:7b8d with SMTP id j16-20020aa78d100000b02903038d177b8dmr4836361pfe.26.1628162809328;
        Thu, 05 Aug 2021 04:26:49 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id j16sm6923193pfi.165.2021.08.05.04.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 04:26:48 -0700 (PDT)
Date:   Thu, 5 Aug 2021 16:56:46 +0530
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
Message-ID: <20210805112646.lgkurm3wjilf5xrv@vireshk-i7>
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
> As far as I can tell, the update_irq_type() message would lead to the
> interrupt getting delivered when it was armed and is now getting disabled,
> but I don't see why we would call update_irq_type() as a result of the
> eventq notification.

Based on discussion we had today (offline), I changed the design a bit
and used handle_level_irq() instead, as it provides consistent calls
to mask/unmask(), which simplified the whole thing a bit.

Also I have broken the rule from specs, maybe we should update spec
with that, where the specs said that the buffer must not be queued
before enabling the interrupt. I just queue the buffer unconditionally
now from unmask().

I am not sure but there may be some race around the "queued" flag and
I wonder if we can land in a scenario where the buffer is left
un-queued somehow, while an interrupt is enabled.

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index 199f8ace1e88..114ce2640944 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -28,6 +28,17 @@ struct virtio_gpio_line {
 	unsigned int rxlen;
 };
 
+struct vgpio_irq_line {
+	u8 type;
+	bool type_pending;
+	bool masked;
+	bool mask_pending;
+	bool queued;
+
+	struct virtio_gpio_irq_request ireq ____cacheline_aligned;
+	struct virtio_gpio_irq_response ires ____cacheline_aligned;
+};
+
 struct virtio_gpio {
 	struct virtio_device *vdev;
 	struct mutex lock; /* Protects virtqueue operation */
@@ -35,6 +46,11 @@ struct virtio_gpio {
 	struct virtio_gpio_config config;
 	struct virtio_gpio_line *lines;
 	struct virtqueue *request_vq;
+
+	/* irq support */
+	struct virtqueue *event_vq;
+	struct mutex irq_lock; /* Protects irq operation */
+	struct vgpio_irq_line *irq_lines;
 };
 
 static int _virtio_gpio_req(struct virtio_gpio *vgpio, u16 type, u16 gpio,
@@ -187,6 +203,186 @@ static void virtio_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
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
+	if (unlikely(irq_line->queued))
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
+static void virtio_gpio_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct virtio_gpio *vgpio = gpiochip_get_data(gc);
+	struct vgpio_irq_line *irq_line = &vgpio->irq_lines[d->hwirq];
+
+	if (irq_line->masked)
+		return;
+
+	irq_line->masked = true;
+	irq_line->mask_pending = !irq_line->mask_pending;
+}
+
+static void virtio_gpio_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct virtio_gpio *vgpio = gpiochip_get_data(gc);
+	struct vgpio_irq_line *irq_line = &vgpio->irq_lines[d->hwirq];
+
+	/* Queue the buffer unconditionally on unmask */
+	virtio_gpio_irq_prepare(vgpio, d->hwirq);
+
+	if (!irq_line->masked)
+		return;
+
+	irq_line->masked = false;
+	irq_line->mask_pending = !irq_line->mask_pending;
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
+	irq_line->type_pending = true;
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
+	u8 type = irq_line->masked ? VIRTIO_GPIO_IRQ_TYPE_NONE : irq_line->type;
+
+	if (irq_line->mask_pending || irq_line->type_pending) {
+		irq_line->mask_pending = false;
+		irq_line->type_pending = false;
+		update_irq_type(vgpio, d->hwirq, type);
+	}
+
+	mutex_unlock(&vgpio->irq_lock);
+}
+
+static struct irq_chip vgpio_irq_chip = {
+	.name			= "virtio-gpio",
+	.irq_mask		= virtio_gpio_irq_mask,
+	.irq_unmask		= virtio_gpio_irq_unmask,
+	.irq_set_type		= virtio_gpio_irq_set_type,
+
+	/* These are required to implement irqchip for slow busses */
+	.irq_bus_lock		= virtio_gpio_irq_bus_lock,
+	.irq_bus_sync_unlock	= virtio_gpio_irq_bus_sync_unlock,
+};
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
+		WARN_ON(!irq_line->queued);
+		irq_line->queued = false;
+
+		/* Buffer is returned after interrupt is masked */
+		if (irq_line->ires.status == VIRTIO_GPIO_IRQ_STATUS_INVALID)
+			continue;
+
+		if (WARN_ON(irq_line->ires.status != VIRTIO_GPIO_IRQ_STATUS_VALID))
+			continue;
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
@@ -211,14 +407,15 @@ static void virtio_gpio_free_vqs(struct virtio_device *vdev)
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
@@ -226,11 +423,23 @@ static int virtio_gpio_alloc_vqs(struct virtio_gpio *vgpio,
 
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
@@ -326,6 +535,30 @@ static int virtio_gpio_probe(struct virtio_device *vdev)
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
+			vgpio->irq_lines[i].masked = true;
+		}
+
+		mutex_init(&vgpio->irq_lock);
+	}
+
 	ret = virtio_gpio_alloc_vqs(vgpio, vdev);
 	if (ret)
 		return ret;
@@ -358,7 +591,13 @@ static const struct virtio_device_id id_table[] = {
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
