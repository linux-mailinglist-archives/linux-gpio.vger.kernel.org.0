Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF602CBF5B
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Dec 2020 15:16:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729078AbgLBOQf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Dec 2020 09:16:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727929AbgLBOQf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Dec 2020 09:16:35 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C64FCC0613D6
        for <linux-gpio@vger.kernel.org>; Wed,  2 Dec 2020 06:15:54 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id jx16so4505497ejb.10
        for <linux-gpio@vger.kernel.org>; Wed, 02 Dec 2020 06:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UYCOtg+s6QFyNZoxQOkJ8A9gRBZ3nCIO0zZsQHVrK0k=;
        b=WLMnKPDmSR4HFxsV/ZPiX+/bB4cg3rwguXHQvgffFWrlk/QQ7yHOliIY5BJ4DrrDQO
         h1hYwdwX9lO81HIwOMA6vLTJ2xqjU0KiI2oJImY+zWjzGJxp+KECY7Jqr22BWkEDckHP
         JUO8dMLHilW5S4s6adAbYcIQPITcumRrF7K08cGtBbZqPcAaneYlOHb3I2mDaYc1ZS0j
         awjW9xk7KftLTAnngTNKvcB2NJusUbUzIfSQCwOGo7jKCmVumzLOjd+I8SF+1DDWGaow
         D4QBizaaJK7MEwNwpf6JWN0frz8dYNfH19BIpVOdpcdtdzHner3eE+eqEpm5Vk3do9EG
         QgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UYCOtg+s6QFyNZoxQOkJ8A9gRBZ3nCIO0zZsQHVrK0k=;
        b=gET8QITUucnEbUrkYyExh+5iyAMD7ko0lBf7fEUT6n3wWxB6GU0j/22B7IR4YHH2aj
         kcCj8FfRFh4v0Caa1Pf4lMYa6Iv9rhhtcoVkoZj/QUFy/rYK7k5n1xCPd0Y0VZeIJdDI
         i/0QWg2fpduyyYkTLegW9Y69vZyGVz3Lp4MjaocH9xzBXM1/JVWDiMbMLZldZZvgvVbT
         2QTwJiMRHBZuOxb4d7DdmxgkzzXn4OsrAhTI4iL63bwCq9xP4tlvzDT/od6wh32WjFiL
         pZEu3r4HyPyvlw6OoK75Yxu94TsvRfLJYX9n/UIcIw4dKEx8R7CU2F4gyjYi6t/TGCC5
         Mdrg==
X-Gm-Message-State: AOAM5300yDhiFS6SdGiBhe8GG2xNoG0rWlHGqu+vygeekz5YoHxo8++C
        /KBunASKpSnCIckkg/FOU5zoUGPfe0yCH7sU/bp1MoC5g9U=
X-Google-Smtp-Source: ABdhPJzDAIuWsCNvzFifQKuSEp0neWwWXG2Mdmgf9yyeK4qmnvTl7r/e86tivbu5Cd0+1yl/b4DKBo2ntWmd58iH0J4=
X-Received: by 2002:a17:907:b09:: with SMTP id h9mr2514612ejl.155.1606918553142;
 Wed, 02 Dec 2020 06:15:53 -0800 (PST)
MIME-Version: 1.0
References: <20201127183003.2849-1-info@metux.net>
In-Reply-To: <20201127183003.2849-1-info@metux.net>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 2 Dec 2020 15:15:42 +0100
Message-ID: <CAMpxmJXJLTzM20xLCoM4spjibXbA-FfdPmOBp1QcV+9cScNNMw@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpio: add virtio-gpio guest driver
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        "Michael S. Tsirkin" <mst@redhat.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Wang <jasowang@redhat.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 27, 2020 at 7:30 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> Introducing new gpio driver for virtual GPIO devices via virtio.
>
> The driver allows routing gpio control into VM guests, eg. brigding
> virtual gpios to specific host gpios, or attaching simulators for
> automatic application testing.
>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> ---
>  MAINTAINERS                      |   6 +
>  drivers/gpio/Kconfig             |   9 ++
>  drivers/gpio/Makefile            |   1 +
>  drivers/gpio/gpio-virtio.c       | 332 +++++++++++++++++++++++++++++++++++++++
>  include/uapi/linux/virtio_gpio.h |  39 +++++
>  include/uapi/linux/virtio_ids.h  |   1 +
>  6 files changed, 388 insertions(+)
>  create mode 100644 drivers/gpio/gpio-virtio.c
>  create mode 100644 include/uapi/linux/virtio_gpio.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a008b70f3c16..dfb8bfe09bbe 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18588,6 +18588,12 @@ F:     Documentation/filesystems/virtiofs.rst
>  F:     fs/fuse/virtio_fs.c
>  F:     include/uapi/linux/virtio_fs.h
>
> +VIRTIO GPIO DRIVER
> +M:     Enrico Weigelt, metux IT consult <info@metux.net>
> +S:     Maintained
> +F:     drivers/gpio/gpio-virtio.c
> +F:     include/uapi/linux/virtio_gpio.h
> +
>  VIRTIO GPU DRIVER
>  M:     David Airlie <airlied@linux.ie>
>  M:     Gerd Hoffmann <kraxel@redhat.com>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 5d4de5cd6759..e8414d82cf75 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1613,4 +1613,13 @@ config GPIO_MOCKUP
>           tools/testing/selftests/gpio/gpio-mockup.sh. Reference the usage in
>           it.
>
> +config GPIO_VIRTIO
> +       tristate "VirtIO GPIO support"
> +       depends on VIRTIO
> +       help
> +         Say Y here to enable guest support for virtio based GPIOs.
> +
> +         These virtual gpios can be routed to real GPIOs or attached to
> +         simulators on the host (qemu).
> +

With a third entry (after gpio-mockup and gpio-aggregator) I think
these deserve a separate submenu for "virtual GPIO drivers" or
something like that.

>  endif
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 09dada80ac34..2b12e75af123 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -160,6 +160,7 @@ obj-$(CONFIG_GPIO_TWL4030)          += gpio-twl4030.o
>  obj-$(CONFIG_GPIO_TWL6040)             += gpio-twl6040.o
>  obj-$(CONFIG_GPIO_UCB1400)             += gpio-ucb1400.o
>  obj-$(CONFIG_GPIO_UNIPHIER)            += gpio-uniphier.o
> +obj-$(CONFIG_GPIO_VIRTIO)              += gpio-virtio.o
>  obj-$(CONFIG_GPIO_VF610)               += gpio-vf610.o
>  obj-$(CONFIG_GPIO_VIPERBOARD)          += gpio-viperboard.o
>  obj-$(CONFIG_GPIO_VR41XX)              += gpio-vr41xx.o
> diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
> new file mode 100644
> index 000000000000..61e183cc26bf
> --- /dev/null
> +++ b/drivers/gpio/gpio-virtio.c
> @@ -0,0 +1,332 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * GPIO driver for virtio-based virtual GPIOs
> + *
> + * Copyright (C) 2018 metux IT consult
> + * Author: Enrico Weigelt, metux IT consult <info@metux.net>
> + *
> + */
> +
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/spinlock.h>
> +#include <linux/virtio_config.h>
> +#include <uapi/linux/virtio_ids.h>
> +#include <uapi/linux/virtio_gpio.h>
> +

Please keep headers ordered alphabetically.

> +struct virtio_gpio_priv {
> +       struct gpio_chip                gc;
> +       spinlock_t                      vq_lock;
> +       spinlock_t                      op_lock;
> +       struct virtio_device            *vdev;
> +       int                             num_gpios;
> +       char                            *name;
> +       struct virtqueue                *vq_rx;
> +       struct virtqueue                *vq_tx;
> +       struct virtio_gpio_event        rcv_buf;
> +       struct virtio_gpio_event        last;
> +       int                             irq_base;
> +       wait_queue_head_t               waitq;
> +
> +       unsigned long reply_wait;
> +};

Don't use tabs here - not only doesn't it improve readability but
you're not even consistent.

> +
> +static void virtio_gpio_prepare_inbuf(struct virtio_gpio_priv *priv)
> +{
> +       struct scatterlist rcv_sg;
> +
> +       sg_init_one(&rcv_sg, &priv->rcv_buf, sizeof(priv->rcv_buf));
> +       virtqueue_add_inbuf(priv->vq_rx, &rcv_sg, 1, &priv->rcv_buf,
> +                           GFP_KERNEL);
> +       virtqueue_kick(priv->vq_rx);
> +}
> +
> +static int virtio_gpio_xmit(struct virtio_gpio_priv *priv, int type,
> +                           int pin, int value, struct virtio_gpio_event *ev)
> +{
> +       struct scatterlist sg[1];
> +       int ret;
> +       unsigned long flags;
> +
> +       WARN_ON(!ev);
> +
> +       ev->type = type;
> +       ev->pin = pin;
> +       ev->value = value;
> +
> +       sg_init_table(sg, 1);
> +       sg_set_buf(&sg[0], ev, sizeof(struct virtio_gpio_event));
> +
> +       spin_lock_irqsave(&priv->vq_lock, flags);
> +       ret = virtqueue_add_outbuf(priv->vq_tx, sg, ARRAY_SIZE(sg),
> +                                  priv, GFP_KERNEL);
> +       if (ret < 0) {
> +               dev_err(&priv->vdev->dev,
> +                       "virtqueue_add_outbuf() failed: %d\n", ret);
> +               goto out;
> +       }
> +       virtqueue_kick(priv->vq_tx);
> +
> +out:
> +       spin_unlock_irqrestore(&priv->vq_lock, flags);
> +       return 0;
> +}
> +
> +static inline void wakeup_event(struct virtio_gpio_priv *priv, int id)
> +{
> +       set_bit(id, &priv->reply_wait);
> +}
> +
> +static inline int check_event(struct virtio_gpio_priv *priv, int id)
> +{
> +       return test_bit(id, &priv->reply_wait);
> +}
> +
> +static inline void clear_event(struct virtio_gpio_priv *priv, int id)
> +{
> +       clear_bit(id, &priv->reply_wait);
> +}
> +
> +static int virtio_gpio_req(struct virtio_gpio_priv *priv, int type,
> +                          int pin, int value)
> +{
> +       struct virtio_gpio_event *ev
> +               = devm_kzalloc(&priv->vdev->dev,
> +                              sizeof(struct virtio_gpio_event), GFP_KERNEL);

Just move the allocation to a separate line because this is super ugly.

> +
> +       if (!ev)
> +               return -ENOMEM;
> +
> +       clear_event(priv, type);
> +       virtio_gpio_xmit(priv, type, pin, value, ev);
> +       wait_event_interruptible(priv->waitq, check_event(priv, type));
> +
> +       devm_kfree(&priv->vdev->dev, ev);

In fact you don't need the managed variant if you're freeing it in the
same function. Managed resources should live as long as a device is
attached to a driver.

> +
> +       return priv->last.value;
> +}
> +
> +static int virtio_gpio_direction_input(struct gpio_chip *gc,
> +                                      unsigned int pin)
> +{
> +       return virtio_gpio_req(gpiochip_get_data(gc),
> +                              VIRTIO_GPIO_EV_GUEST_DIRECTION_INPUT,
> +                              pin, 0);
> +}
> +
> +static int virtio_gpio_direction_output(struct gpio_chip *gc,
> +                                       unsigned int pin, int value)
> +{
> +       return virtio_gpio_req(gpiochip_get_data(gc),
> +                              VIRTIO_GPIO_EV_GUEST_DIRECTION_OUTPUT,
> +                              pin, value);
> +}
> +
> +static int virtio_gpio_get_direction(struct gpio_chip *gc, unsigned int pin)
> +{
> +       return virtio_gpio_req(gpiochip_get_data(gc),
> +                              VIRTIO_GPIO_EV_GUEST_GET_DIRECTION,
> +                              pin, 0);
> +}
> +
> +static void virtio_gpio_set(struct gpio_chip *gc,
> +                           unsigned int pin, int value)
> +{
> +       virtio_gpio_req(gpiochip_get_data(gc),
> +                       VIRTIO_GPIO_EV_GUEST_SET_VALUE, pin, value);
> +}
> +
> +static int virtio_gpio_get(struct gpio_chip *gc,
> +                          unsigned int pin)
> +{
> +       return virtio_gpio_req(gpiochip_get_data(gc),
> +                              VIRTIO_GPIO_EV_GUEST_GET_VALUE, pin, 0);
> +}
> +
> +static int virtio_gpio_request(struct gpio_chip *gc,
> +                              unsigned int pin)
> +{
> +       return virtio_gpio_req(gpiochip_get_data(gc),
> +                              VIRTIO_GPIO_EV_GUEST_REQUEST, pin, 0);
> +}
> +
> +static void virtio_gpio_signal(struct virtio_gpio_priv *priv, int event,
> +                             int pin, int value)
> +{
> +       if (pin < priv->num_gpios)
> +               generic_handle_irq(priv->irq_base + pin);
> +}
> +
> +static void virtio_gpio_data_rx(struct virtqueue *vq)
> +{
> +       struct virtio_gpio_priv *priv = vq->vdev->priv;
> +       void *data;
> +       unsigned int len;
> +       struct virtio_gpio_event *ev;
> +
> +       data = virtqueue_get_buf(priv->vq_rx, &len);
> +       if (!data || !len) {
> +               dev_warn(&vq->vdev->dev, "RX received no data ! %d\n", len);
> +               return;
> +       }
> +
> +       ev = data;
> +       WARN_ON(data != &priv->rcv_buf);

Is it fine to proceed if this is the case?

> +
> +       memcpy(&priv->last, &priv->rcv_buf, sizeof(struct virtio_gpio_event));
> +
> +       switch (ev->type) {
> +       case VIRTIO_GPIO_EV_HOST_LEVEL:
> +               virtio_gpio_signal(priv, ev->type, ev->pin, ev->value);
> +       break;

Break should be one tab farther.

> +       default:
> +               wakeup_event(priv, ev->type & ~VIRTIO_GPIO_EV_REPLY);
> +       break;
> +       }
> +       virtio_gpio_prepare_inbuf(priv);
> +       wake_up_all(&priv->waitq);
> +}
> +
> +static int virtio_gpio_alloc_vq(struct virtio_gpio_priv *priv)
> +{
> +       struct virtqueue *vqs[2];
> +       vq_callback_t *cbs[] = {
> +               NULL,
> +               virtio_gpio_data_rx,
> +       };
> +       static const char * const names[] = { "in", "out", };
> +       int ret;
> +
> +       ret = virtio_find_vqs(priv->vdev, 2, vqs, cbs, names, NULL);
> +       if (ret) {
> +               dev_err(&priv->vdev->dev, "failed to alloc vqs: %d\n", ret);
> +               return ret;
> +       }
> +
> +       priv->vq_rx = vqs[0];
> +       priv->vq_tx = vqs[1];
> +
> +       virtio_gpio_prepare_inbuf(priv);
> +
> +       virtio_config_enable(priv->vdev);
> +       virtqueue_enable_cb(priv->vq_rx);
> +       virtio_device_ready(priv->vdev);
> +
> +       return 0;
> +}
> +
> +static int virtio_gpio_probe(struct virtio_device *vdev)
> +{
> +       struct virtio_gpio_priv *priv;
> +       struct virtio_gpio_config cf = {};
> +       char *name_buffer;
> +       const char **gpio_names = NULL;
> +       struct device *dev = &vdev->dev;
> +
> +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->name = devm_kzalloc(dev, sizeof(cf.name)+1, GFP_KERNEL);

This can fail.

> +
> +       spin_lock_init(&priv->vq_lock);
> +       spin_lock_init(&priv->op_lock);
> +
> +       virtio_cread(vdev, struct virtio_gpio_config, version, &cf.version);
> +       virtio_cread(vdev, struct virtio_gpio_config, num_gpios,
> +                    &cf.num_gpios);
> +       virtio_cread(vdev, struct virtio_gpio_config, names_size,
> +                    &cf.names_size);
> +       virtio_cread_bytes(vdev, offsetof(struct virtio_gpio_config, name),
> +                          priv->name, sizeof(cf.name));
> +
> +       if (cf.version != 1) {
> +               dev_err(dev, "unsupported interface version %d\n", cf.version);
> +               return -EINVAL;
> +       }
> +
> +       priv->num_gpios = cf.num_gpios;
> +
> +       if (cf.names_size) {
> +               char *bufwalk;
> +               int idx = 0;
> +
> +               name_buffer = devm_kzalloc(&vdev->dev, cf.names_size,
> +                                          GFP_KERNEL)+1;
> +               virtio_cread_bytes(vdev, sizeof(struct virtio_gpio_config),
> +                                  name_buffer, cf.names_size);
> +               name_buffer[cf.names_size] = 0;
> +
> +               gpio_names = devm_kzalloc(dev,
> +                                         sizeof(char *) * priv->num_gpios,
> +                                         GFP_KERNEL);

Use devm_kcalloc() for arrays.

> +               bufwalk = name_buffer;
> +
> +               while (idx < priv->num_gpios &&
> +                      bufwalk < (name_buffer+cf.names_size)) {
> +                       gpio_names[idx] = (strlen(bufwalk) ? bufwalk : NULL);
> +                       bufwalk += strlen(bufwalk)+1;
> +                       idx++;


Something's wrong with indentation here.

> +               }
> +       }
> +
> +       priv->gc.owner                  = THIS_MODULE;
> +       priv->gc.parent                 = dev;
> +       priv->gc.label                  = (priv->name[0] ? priv->name
> +                                                        : dev_name(dev));
> +       priv->gc.ngpio                  = priv->num_gpios;
> +       priv->gc.names                  = gpio_names;
> +       priv->gc.base                   = -1;
> +       priv->gc.request                = virtio_gpio_request;
> +       priv->gc.direction_input        = virtio_gpio_direction_input;
> +       priv->gc.direction_output       = virtio_gpio_direction_output;
> +       priv->gc.get_direction          = virtio_gpio_get_direction;
> +       priv->gc.get                    = virtio_gpio_get;
> +       priv->gc.set                    = virtio_gpio_set;
> +
> +       priv->vdev                      = vdev;
> +       vdev->priv = priv;
> +
> +       priv->irq_base = devm_irq_alloc_descs(dev, -1, 0, priv->num_gpios,
> +                                             NUMA_NO_NODE);
> +       if (priv->irq_base < 0) {
> +               dev_err(&vdev->dev, "failed to alloc irqs\n");
> +               priv->irq_base = -1;
> +               return -ENOMEM;
> +       }
> +
> +       init_waitqueue_head(&priv->waitq);
> +
> +       priv->reply_wait = 0;
> +
> +       virtio_gpio_alloc_vq(priv);
> +
> +       return devm_gpiochip_add_data(dev, &priv->gc, priv);
> +}

I don't know virtio at all - Michael: could you take a look at the
code here and see if it looks good to you?

> +
> +static void virtio_gpio_remove(struct virtio_device *vdev)
> +{
> +}

Just don't implement it. Or does virtio actually require the remove() callback?

Bartosz

> +
> +static const struct virtio_device_id id_table[] = {
> +       { VIRTIO_ID_GPIO, VIRTIO_DEV_ANY_ID },
> +       { 0 },
> +};
> +
> +static struct virtio_driver virtio_gpio_driver = {
> +       .driver.name    = KBUILD_MODNAME,
> +       .driver.owner   = THIS_MODULE,
> +       .id_table       = id_table,
> +       .probe          = virtio_gpio_probe,
> +       .remove         = virtio_gpio_remove,
> +};
> +
> +module_virtio_driver(virtio_gpio_driver);
> +
> +MODULE_AUTHOR("Enrico Weigelt, metux IT consult <info@metux.net>");
> +MODULE_DESCRIPTION("VirtIO GPIO driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/uapi/linux/virtio_gpio.h b/include/uapi/linux/virtio_gpio.h
> new file mode 100644
> index 000000000000..5a48b975bc7a
> --- /dev/null
> +++ b/include/uapi/linux/virtio_gpio.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#ifndef _LINUX_VIRTIO_GPIO_H
> +#define _LINUX_VIRTIO_GPIO_H
> +
> +#include <linux/types.h>
> +
> +enum virtio_gpio_event_type {
> +       // requests from quest to host
> +       VIRTIO_GPIO_EV_GUEST_REQUEST            = 0x01, // ->request()
> +       VIRTIO_GPIO_EV_GUEST_DIRECTION_INPUT    = 0x02, // ->direction_input()
> +       VIRTIO_GPIO_EV_GUEST_DIRECTION_OUTPUT   = 0x03, // ->direction_output()
> +       VIRTIO_GPIO_EV_GUEST_GET_DIRECTION      = 0x04, // ->get_direction()
> +       VIRTIO_GPIO_EV_GUEST_GET_VALUE          = 0x05, // ->get_value()
> +       VIRTIO_GPIO_EV_GUEST_SET_VALUE          = 0x06, // ->set_value()
> +
> +       // messages from host to guest
> +       VIRTIO_GPIO_EV_HOST_LEVEL               = 0x11, // gpio state changed
> +
> +       /* mask bit set on host->guest reply */
> +       VIRTIO_GPIO_EV_REPLY                    = 0xF000,
> +};
> +
> +struct virtio_gpio_config {
> +       __u8    version;
> +       __u8    reserved0;
> +       __u16   num_gpios;
> +       __u32   names_size;
> +       __u8    reserved1[24];
> +       __u8    name[32];
> +};
> +
> +struct virtio_gpio_event {
> +       __le16 type;
> +       __le16 pin;
> +       __le32 value;
> +};
> +
> +#endif /* _LINUX_VIRTIO_GPIO_H */
> diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
> index b052355ac7a3..85772c0bcb4b 100644
> --- a/include/uapi/linux/virtio_ids.h
> +++ b/include/uapi/linux/virtio_ids.h
> @@ -48,5 +48,6 @@
>  #define VIRTIO_ID_FS           26 /* virtio filesystem */
>  #define VIRTIO_ID_PMEM         27 /* virtio pmem */
>  #define VIRTIO_ID_MAC80211_HWSIM 29 /* virtio mac80211-hwsim */
> +#define VIRTIO_ID_GPIO           30 /* virtio GPIO */
>
>  #endif /* _LINUX_VIRTIO_IDS_H */
> --
> 2.11.0
>
