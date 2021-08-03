Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52F323DEC31
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Aug 2021 13:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235705AbhHCLhi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 07:37:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235669AbhHCLha (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Aug 2021 07:37:30 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41B6CC0617A2
        for <linux-gpio@vger.kernel.org>; Tue,  3 Aug 2021 04:37:19 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id t3so21244229plg.9
        for <linux-gpio@vger.kernel.org>; Tue, 03 Aug 2021 04:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lyHPGnrDqtjmesKnhAqm7ap8dmXtrIEAp5hauUQrxIg=;
        b=yIbKAhAQb5ITTaZWHl5XueJVHbzOPOD7c0swK8JDs6HfDU4sVhK7fWZh/xFgxYYggk
         QK49KQ46ZmDc9IXDnM3yJpitU05jEi9yL9rBXz24tx6/llAuRGPgh7tbI1D+6271/wea
         MC6mt9DaSc0GyNILRlSWrLYd6xD0Uy5C1iy3gnL3FHgytiSG3Wxn2EmjbEl1IDwtu55F
         W+vQeA1xN+ALI2cQuHIxkVODcd7RjUq7zqlmRRASsKFbJn5VPhl8+I/tIM81CMhBmKcK
         gOYyqrR8tciDzwVvklhiG1OZRMH8yqRe5zA7neGMc6OoX6O/GW1a3xVZXW514j6+75z2
         1S2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lyHPGnrDqtjmesKnhAqm7ap8dmXtrIEAp5hauUQrxIg=;
        b=bqvJdkN/jfUjxEUR1zhSa702BRD6hfNla9jSTFTNUJiw1MYTG8F0B4LAhr9DH50SLg
         Z7JhAu+hkHqHooF3D8C/S62QyK5UQ49eFlypZ96Nvr/3Cb1n3xKKDiqdsRftLfV8eAZf
         +s51Twc3/EhFwGElxy9fhxVbhQHTbOR1sFKxXybPcJAUrEVl1azbdhMpyYDYCaS5Ps++
         aNaPBBI93XHGmosC7gYr18KTyWVz5SDfKj2iuxjh0f0ktWbeE2vqoqcPL6E9Crdn0zR7
         XkyvkpCYqZ6VjaOamfGR/MvMrBoj8eAA2meMAdLsJw0+y3WnDOPQ6oDXvCxXSTQPwZBC
         Uqpg==
X-Gm-Message-State: AOAM531Kx6MWNXqoc+TLI9N2UXINQispiBY4p16NlXj/jCnL2DpyTSOv
        12SuOsqseetMmoImlG+cL8klbw==
X-Google-Smtp-Source: ABdhPJzk/HKT1QqpIOv0teFh+F2fwM7w3ipgn+FFVfMcJFQ78YWZXYR0V3mygUzfqI3x7afQZSaveg==
X-Received: by 2002:a17:90a:aa05:: with SMTP id k5mr21855090pjq.47.1627990638742;
        Tue, 03 Aug 2021 04:37:18 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id t37sm15390085pfg.14.2021.08.03.04.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 04:37:18 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        stratos-dev@op-lists.linaro.org, linux-kernel@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: [PATCH V4 2/2] gpio: virtio: Add IRQ support
Date:   Tue,  3 Aug 2021 17:06:56 +0530
Message-Id: <75c8e6e5e8dfa1889938f3a6b2d991763c7a3717.1627989586.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1627989586.git.viresh.kumar@linaro.org>
References: <cover.1627989586.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds IRQ support for the virtio GPIO driver. Note that this
uses the irq_bus_lock/unlock() callbacks, since those operations over
virtio may sleep. Also the notifications for the eventq are processed
using a work item to allow sleep-able operations.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/gpio/Kconfig             |   1 +
 drivers/gpio/gpio-virtio.c       | 281 ++++++++++++++++++++++++++++++-
 include/uapi/linux/virtio_gpio.h |  25 +++
 3 files changed, 303 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e5993d6864fb..222f4ae98a35 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1672,6 +1672,7 @@ config GPIO_MOCKUP
 config GPIO_VIRTIO
 	tristate "VirtIO GPIO support"
 	depends on VIRTIO
+	select GPIOLIB_IRQCHIP
 	help
 	  Say Y here to enable guest support for virtio-based GPIO controllers.
 
diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index 3ed4240fe670..0be132d75396 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/virtio_config.h>
+#include <linux/workqueue.h>
 #include <uapi/linux/virtio_gpio.h>
 #include <uapi/linux/virtio_ids.h>
 
@@ -28,6 +29,16 @@ struct virtio_gpio_line {
 	unsigned int rxlen;
 };
 
+struct vgpio_irq_line {
+	u8 type;
+	bool masked;
+	bool update_pending;
+	bool queued;
+
+	struct virtio_gpio_irq_request ireq;
+	struct virtio_gpio_irq_response ires;
+};
+
 struct virtio_gpio {
 	struct virtio_device *vdev;
 	struct mutex lock; /* Protects virtqueue operation */
@@ -35,6 +46,12 @@ struct virtio_gpio {
 	struct virtio_gpio_config config;
 	struct virtio_gpio_line *lines;
 	struct virtqueue *request_vq;
+
+	/* fields for irq support */
+	struct virtqueue *event_vq;
+	struct mutex irq_lock; /* Protects irq operation */
+	struct work_struct work;
+	struct vgpio_irq_line *irq_lines;
 };
 
 static int _virtio_gpio_req(struct virtio_gpio *vgpio, u16 type, u16 gpio,
@@ -187,6 +204,220 @@ static void virtio_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
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
+	ireq->gpio = cpu_to_le16(gpio);
+	sg_init_one(&req_sg, ireq, sizeof(*ireq));
+	sg_init_one(&res_sg, ires, sizeof(*ires));
+	sgs[0] = &req_sg;
+	sgs[1] = &res_sg;
+
+	ret = virtqueue_add_sgs(vgpio->event_vq, sgs, 1, 1, irq_line, GFP_KERNEL);
+	if (ret) {
+		dev_err(&vgpio->vdev->dev, "failed to add request to eventq\n");
+		return;
+	}
+
+	WARN_ON(irq_line->queued);
+
+	irq_line->queued = true;
+	virtqueue_kick(vgpio->event_vq);
+}
+
+static void virtio_gpio_irq_eoi(struct irq_data *d)
+{
+	/*
+	 * Queue buffers, by calling virtio_gpio_irq_prepare(), from
+	 * virtio_gpio_event_vq() itself, after taking into consideration the
+	 * masking status of the interrupt.
+	 */
+}
+
+static void virtio_gpio_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct virtio_gpio *vgpio = gpiochip_get_data(gc);
+	struct vgpio_irq_line *irq_line = &vgpio->irq_lines[d->hwirq];
+
+	irq_line->masked = true;
+	irq_line->update_pending = true;
+}
+
+static void virtio_gpio_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct virtio_gpio *vgpio = gpiochip_get_data(gc);
+	struct vgpio_irq_line *irq_line = &vgpio->irq_lines[d->hwirq];
+
+	irq_line->masked = false;
+	irq_line->update_pending = true;
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
+	int gpio = d->hwirq;
+	struct vgpio_irq_line *irq_line = &vgpio->irq_lines[gpio];
+
+	if (unlikely(!irq_line->update_pending))
+		goto out;
+
+	if (irq_line->masked) {
+		update_irq_type(vgpio, gpio, VIRTIO_GPIO_IRQ_TYPE_NONE);
+	} else {
+		update_irq_type(vgpio, gpio, irq_line->type);
+		virtio_gpio_irq_prepare(vgpio, gpio);
+	}
+
+	irq_line->update_pending = false;
+
+out:
+	mutex_unlock(&vgpio->irq_lock);
+}
+
+static struct irq_chip vgpio_irq_chip = {
+	.name			= "virtio-gpio",
+	.irq_eoi		= virtio_gpio_irq_eoi,
+	.irq_mask		= virtio_gpio_irq_mask,
+	.irq_unmask		= virtio_gpio_irq_unmask,
+	.irq_set_type		= virtio_gpio_irq_set_type,
+
+	/* These are required to implement irqchip for slow busses */
+	.irq_bus_lock		= virtio_gpio_irq_bus_lock,
+	.irq_bus_sync_unlock	= virtio_gpio_irq_bus_sync_unlock,
+};
+
+static void vgpio_work_handler(struct work_struct *work)
+{
+	struct virtio_gpio *vgpio = container_of(work, struct virtio_gpio,
+						 work);
+	struct device *dev = &vgpio->vdev->dev;
+	struct vgpio_irq_line *irq_line;
+	int irq, gpio, ret;
+	unsigned int len;
+
+	mutex_lock(&vgpio->irq_lock);
+
+	while (true) {
+		irq_line = virtqueue_get_buf(vgpio->event_vq, &len);
+		if (!irq_line)
+			break;
+
+		if (len != sizeof(irq_line->ires)) {
+			dev_err(dev, "irq with incorrect length (%u : %lu)\n",
+				len, sizeof(irq_line->ires));
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
+		local_irq_disable();
+		ret = generic_handle_irq(irq);
+		local_irq_enable();
+
+		if (ret)
+			dev_err(dev, "failed to handle interrupt: %d\n", ret);
+
+		/* The interrupt may have been disabled by now */
+		if (irq_line->update_pending && irq_line->masked)
+			update_irq_type(vgpio, gpio, VIRTIO_GPIO_IRQ_TYPE_NONE);
+		else
+			virtio_gpio_irq_prepare(vgpio, gpio);
+
+		irq_line->update_pending = false;
+	};
+
+	mutex_unlock(&vgpio->irq_lock);
+}
+
+static void virtio_gpio_event_vq(struct virtqueue *vq)
+{
+	struct virtio_gpio *vgpio = vq->vdev->priv;
+
+	/*
+	 * We can't initiate virtio-gpio operations from hard irq context, as
+	 * they need sleep-able context.
+	 */
+	schedule_work(&vgpio->work);
+}
+
 static void virtio_gpio_request_vq(struct virtqueue *vq)
 {
 	struct virtio_gpio_line *line;
@@ -211,14 +442,15 @@ static void virtio_gpio_free_vqs(struct virtio_device *vdev)
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
@@ -226,11 +458,23 @@ static int virtio_gpio_alloc_vqs(struct virtio_gpio *vgpio,
 
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
@@ -326,6 +570,29 @@ static int virtio_gpio_probe(struct virtio_device *vdev)
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
+		vgpio->gc.irq.handler		= handle_fasteoi_irq;
+		vgpio->gc.irq.chip		= &vgpio_irq_chip;
+
+		for (i = 0; i < config->ngpio; i++)
+			vgpio->irq_lines[i].type = VIRTIO_GPIO_IRQ_TYPE_NONE;
+
+		mutex_init(&vgpio->irq_lock);
+		INIT_WORK(&vgpio->work, vgpio_work_handler);
+	}
+
 	ret = virtio_gpio_alloc_vqs(vgpio, vdev);
 	if (ret)
 		return ret;
@@ -358,7 +625,13 @@ static const struct virtio_device_id id_table[] = {
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
diff --git a/include/uapi/linux/virtio_gpio.h b/include/uapi/linux/virtio_gpio.h
index 844574acf095..297ffdae1a5d 100644
--- a/include/uapi/linux/virtio_gpio.h
+++ b/include/uapi/linux/virtio_gpio.h
@@ -5,12 +5,16 @@
 
 #include <linux/types.h>
 
+/* Virtio GPIO Feature bits */
+#define VIRTIO_GPIO_F_IRQ			0
+
 /* Virtio GPIO request types */
 #define VIRTIO_GPIO_MSG_GET_NAMES		0x0001
 #define VIRTIO_GPIO_MSG_GET_DIRECTION		0x0002
 #define VIRTIO_GPIO_MSG_SET_DIRECTION		0x0003
 #define VIRTIO_GPIO_MSG_GET_VALUE		0x0004
 #define VIRTIO_GPIO_MSG_SET_VALUE		0x0005
+#define VIRTIO_GPIO_MSG_IRQ_TYPE		0x0006
 
 /* Possible values of the status field */
 #define VIRTIO_GPIO_STATUS_OK			0x0
@@ -21,6 +25,14 @@
 #define VIRTIO_GPIO_DIRECTION_OUT		0x01
 #define VIRTIO_GPIO_DIRECTION_IN		0x02
 
+/* Virtio GPIO IRQ types */
+#define VIRTIO_GPIO_IRQ_TYPE_NONE		0x00
+#define VIRTIO_GPIO_IRQ_TYPE_EDGE_RISING	0x01
+#define VIRTIO_GPIO_IRQ_TYPE_EDGE_FALLING	0x02
+#define VIRTIO_GPIO_IRQ_TYPE_EDGE_BOTH		0x03
+#define VIRTIO_GPIO_IRQ_TYPE_LEVEL_HIGH		0x04
+#define VIRTIO_GPIO_IRQ_TYPE_LEVEL_LOW		0x08
+
 struct virtio_gpio_config {
 	__u16 ngpio;
 	__u8 padding[2];
@@ -44,4 +56,17 @@ struct virtio_gpio_response_get_names {
 	__u8 value[];
 };
 
+/* Virtio GPIO IRQ Request / Response */
+struct virtio_gpio_irq_request {
+	__u16 gpio;
+};
+
+struct virtio_gpio_irq_response {
+	__u8 status;
+};
+
+/* Possible values of the interrupt status field */
+#define VIRTIO_GPIO_IRQ_STATUS_INVALID		0x0
+#define VIRTIO_GPIO_IRQ_STATUS_VALID		0x1
+
 #endif /* _LINUX_VIRTIO_GPIO_H */
-- 
2.31.1.272.g89b43f80a514

