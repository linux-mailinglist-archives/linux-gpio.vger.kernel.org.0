Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3AF2CE69C
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Dec 2020 04:39:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727463AbgLDDhX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Dec 2020 22:37:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53507 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726080AbgLDDhX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Dec 2020 22:37:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607052954;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+SHlFygzZY7YSv6BaslP2KSyFm5bOqMAODf6huuujZE=;
        b=aYl4407OE50w8i/Ci21KMrV+CWNx6p/7TpwiCOt8f5lTszd7f6rc5tXGRr6QnH6j5aMfGb
        booerGd53a4Av3yXLTiZiOkAjt23ju6ySzlNqac1OkK52dsfBfhFPEOSAk3DUSJZh8Z2E5
        4L5PYhKl4rfgWy+YVDNcGnRJfo1fKDs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-7ik0mQkaPTSTUuwXXojHGw-1; Thu, 03 Dec 2020 22:35:52 -0500
X-MC-Unique: 7ik0mQkaPTSTUuwXXojHGw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5569180A087;
        Fri,  4 Dec 2020 03:35:50 +0000 (UTC)
Received: from [10.72.12.116] (ovpn-12-116.pek2.redhat.com [10.72.12.116])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 554DE5D9CA;
        Fri,  4 Dec 2020 03:35:43 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org
Cc:     corbet@lwn.net, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, mst@redhat.com,
        linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
Date:   Fri, 4 Dec 2020 11:35:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201203191135.21576-2-info@metux.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 2020/12/4 上午3:11, Enrico Weigelt, metux IT consult wrote:
> Introducing new gpio driver for virtual GPIO devices via virtio.
>
> The driver allows routing gpio control into VM guests, eg. brigding
> virtual gpios to specific host gpios, or attaching simulators for
> automatic application testing.
>
> Changes v2:
>      * fixed uapi header license
>      * sorted include's
>      * fixed formatting
>      * fixed unneeded devm allocation - plain kzalloc/kfree is enough
>      * fixed missing devm_kzalloc fail check
>      * use devm_kcalloc() for array allocation
>      * added virtio-gpio protocol specification
>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> ---
>   Documentation/gpio/virtio-gpio.rst | 176 ++++++++++++++++++++
>   MAINTAINERS                        |   6 +
>   drivers/gpio/Kconfig               |   9 +
>   drivers/gpio/Makefile              |   1 +
>   drivers/gpio/gpio-virtio.c         | 332 +++++++++++++++++++++++++++++++++++++
>   include/uapi/linux/virtio_gpio.h   |  39 +++++
>   include/uapi/linux/virtio_ids.h    |   1 +
>   7 files changed, 564 insertions(+)
>   create mode 100644 Documentation/gpio/virtio-gpio.rst
>   create mode 100644 drivers/gpio/gpio-virtio.c
>   create mode 100644 include/uapi/linux/virtio_gpio.h
>
> diff --git a/Documentation/gpio/virtio-gpio.rst b/Documentation/gpio/virtio-gpio.rst
> new file mode 100644
> index 000000000000..04642be07b96
> --- /dev/null
> +++ b/Documentation/gpio/virtio-gpio.rst
> @@ -0,0 +1,176 @@
> +"""""""""""""""""
> +Virtio-GPIO protocol specification
> +"""""""""""""""""
> +...........
> +Specification for virtio-based virtiual GPIO devices
> +...........
> +


Is the plan to keep this doc synced with the one in the virtio 
specification?


> ++------------
> ++Version_ 1.0
> ++------------
> +
> +===================
> +General
> +===================
> +
> +The virtio-gpio protocol provides access to general purpose IO devices
> +to virtual machine guests. These virtualized GPIOs could be either provided
> +by some simulator (eg. virtual HIL), routed to some external device or
> +routed to real GPIOs on the host (eg. virtualized embedded applications).
> +
> +Instead of simulating some existing real GPIO chip within an VMM, this
> +protocol provides an hardware independent interface between host and guest
> +that solely relies on an active virtio connection (no matter which transport
> +actually used), no other buses or additional platform driver logic required.
> +
> +===================
> +Protocol layout
> +===================
> +
> +----------------------
> +Configuration space
> +----------------------
> +
> ++--------+----------+-------------------------------+
> +| Offset | Type     | Description                   |
> ++========+==========+===============================+
> +| 0x00   | uint8    | version                       |
> ++--------+----------+-------------------------------+
> +| 0x02   | uint16   | number of GPIO lines          |
> ++--------+----------+-------------------------------+
> +| 0x04   | uint32   | size of gpio name block       |
> ++--------+----------+-------------------------------+
> +| 0x20   | char[32] | device name (0-terminated)    |
> ++--------+----------+-------------------------------+
> +| 0x40   | char[]   | line names block              |
> ++--------+----------+-------------------------------+
> +


I think it's better to use u8 ot uint8_t here.Git grep told me the 
former is more popular under Documentation/.


> +- for version field currently only value 1 supported.
> +- the line names block holds a stream of zero-terminated strings,
> +  holding the individual line names.


I'm not sure but does this mean we don't have a fixed length of config 
space? Need to check whether it can bring any trouble to 
migration(compatibility).


> +- unspecified fields are reserved for future use and should be zero.
> +
> +------------------------
> +Virtqueues and messages:
> +------------------------
> +
> +- Queue #0: transmission from host to guest
> +- Queue #1: transmission from guest to host


Virtio became more a popular in the area without virtualization. So I 
think it's better to use "device/driver" instead of "host/guest" here.


> +
> +The queues transport messages of the struct virtio_gpio_event:
> +
> +Message format:
> +---------------
> +
> ++--------+----------+---------------+
> +| Offset | Type     | Description   |
> ++========+==========+===============+
> +| 0x00   | uint16   | event type    |
> ++--------+----------+---------------+
> +| 0x02   | uint16   | line id       |
> ++--------+----------+---------------+
> +| 0x04   | uint32   | value         |
> ++--------+----------+---------------+


Not a native speaker but event sounds like something driver read from 
device. Looking at the below lists, most of them except for 
VIRTIO_GPIO_EV_HOST_LEVEL looks more like a command.

Another question is, what's the benefit of unifying the message format 
of the two queues. E.g VIRTIO_GPIO_EV_HOST_LEVEL can only works fro rxq.


> +
> +Message types:
> +--------------
> +
> ++-------+---------------------------------------+-----------------------------+
> +| Code  | Symbol                                |                             |
> ++=======+=======================================+=============================+
> +| 0x01  | VIRTIO_GPIO_EV_GUEST_REQUEST          | request gpio line           |
> ++-------+---------------------------------------+-----------------------------+
> +| 0x02  | VIRTIO_GPIO_EV_GUEST_DIRECTION_INPUT  | set direction to input      |
> ++-------+---------------------------------------+-----------------------------+
> +| 0x03  | VIRTIO_GPIO_EV_GUEST_DIRECTION_OUTPUT | set direction to output     |
> ++-------+---------------------------------------+-----------------------------+
> +| 0x04  | VIRTIO_GPIO_EV_GUEST_GET_DIRECTION    | read current direction      |
> ++-------+---------------------------------------+-----------------------------+
> +| 0x05  | VIRTIO_GPIO_EV_GUEST_GET_VALUE        | read current level          |
> ++-------+---------------------------------------+-----------------------------+
> +| 0x06  | VIRTIO_GPIO_EV_GUEST_SET_VALUE        | set current (out) level     |
> ++-------+---------------------------------------+-----------------------------+
> +| 0x11  | VIRTIO_GPIO_EV_HOST_LEVEL             | state changed (host->guest) |
> ++-------+---------------------------------------+-----------------------------+
> +


Not familiar with GPIO but I wonder the value of a standalone 
VIRTIO_GPIO_EV_GUEST_DIRECTION_INPUT/OUTPUT. Can we simply imply them in 
SET/GET_VALUE?


> +----------------------
> +Data flow:
> +----------------------
> +
> +- all operations, except ``VIRTIO_GPIO_EV_HOST_LEVEL``, are guest-initiated
> +- host replies ``VIRTIO_GPIO_EV_HOST_LEVEL`` OR'ed to the ``type`` field
> +- ``VIRTIO_GPIO_EV_HOST_LEVEL`` is only sent asynchronically from host to guest
> +- in replies, a negative ``value`` field denotes an unix-style errno code


Virtio is in a different scope, so we need to define the error code on 
our own.

E.g for virtio-net we define:


#define VIRTIO_NET_OK     0
#define VIRTIO_NET_ERR    1


> +- valid direction values are:
> +  * 0 = output
> +  * 1 = input
> +- valid line state values are:
> +  * 0 = inactive
> +  * 1 = active
> +
> +VIRTIO_GPIO_EV_GUEST_REQUEST
> +----------------------------
> +
> +- notify the host that given line# is going to be used
> +- request:
> +  * ``line`` field: line number
> +  * ``value`` field: unused
> +- reply:
> +  * ``value`` field: errno code (0 = success)
> +
> +VIRTIO_GPIO_EV_GUEST_DIRECTION_INPUT
> +------------------------------------
> +
> +- set line line direction to input
> +- request:
> +  * ``line`` field: line number
> +  * ``value`` field: unused
> +- reply: value field holds errno
> +  * ``value`` field: errno code (0 = success)
> +
> +VIRTIO_GPIO_EV_GUEST_DIRECTION_OUTPUT
> +-------------------------------------
> +
> +- set line direction to output and given line state
> +- request:
> +  * ``line`` field: line number
> +  * ``value`` field: output state (0=inactive, 1=active)
> +- reply:
> +  * ``value`` field: holds errno
> +
> +VIRTIO_GPIO_EV_GUEST_GET_DIRECTION
> +----------------------------------
> +
> +- retrieve line direction
> +- request:
> +  * ``line`` field: line number
> +  * ``value`` field: unused
> +- reply:
> +  * ``value`` field: direction (0=output, 1=input) or errno code
> +
> +VIRTIO_GPIO_EV_GUEST_GET_VALUE
> +------------------------------
> +
> +- retrieve line state value
> +- request:
> +  * ``line`` field: line number
> +  * ``value`` field: unused
> +- reply:
> +  * ``value`` field: line state (0=inactive, 1=active) or errno code
> +
> +VIRTIO_GPIO_EV_GUEST_SET_VALUE
> +------------------------------
> +
> +- set line state value (output only)
> +- request:
> +  * ``line`` field: line number
> +  * ``value`` field: line state (0=inactive, 1=active)
> +- reply:
> +  * ``value`` field: new line state or errno code
> +
> +VIRTIO_GPIO_EV_HOST_LEVEL
> +-------------------------
> +
> +- async notification from host to gues: line state changed
> +- ``line`` field: line number
> +- ``value`` field: new line state (0=inactive, 1=active)
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2daa6ee673f7..2b74e39275b3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18592,6 +18592,12 @@ F:	Documentation/filesystems/virtiofs.rst
>   F:	fs/fuse/virtio_fs.c
>   F:	include/uapi/linux/virtio_fs.h
>   
> +VIRTIO GPIO DRIVER
> +M:	Enrico Weigelt, metux IT consult <info@metux.net>
> +S:	Maintained
> +F:	drivers/gpio/gpio-virtio.c
> +F:	include/uapi/linux/virtio_gpio.h
> +
>   VIRTIO GPU DRIVER
>   M:	David Airlie <airlied@linux.ie>
>   M:	Gerd Hoffmann <kraxel@redhat.com>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 01619eb58396..7a33aa347dfb 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1615,6 +1615,15 @@ config GPIO_MOCKUP
>   	  tools/testing/selftests/gpio/gpio-mockup.sh. Reference the usage in
>   	  it.
>   
> +config GPIO_VIRTIO
> +	tristate "VirtIO GPIO support"
> +	depends on VIRTIO


Let's use select, since there's no prompt for VIRTIO and it doesn't have 
any dependencies.


> +	help
> +	  Say Y here to enable guest support for virtio-based GPIOs.
> +
> +	  These virtual GPIOs can be routed to real GPIOs or attached to
> +	  simulators on the host (qemu).


It's better to avoid talking host and qemu here for new virtio devices.


> +
>   endmenu
>   
>   endif
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 09dada80ac34..2b12e75af123 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -160,6 +160,7 @@ obj-$(CONFIG_GPIO_TWL4030)		+= gpio-twl4030.o
>   obj-$(CONFIG_GPIO_TWL6040)		+= gpio-twl6040.o
>   obj-$(CONFIG_GPIO_UCB1400)		+= gpio-ucb1400.o
>   obj-$(CONFIG_GPIO_UNIPHIER)		+= gpio-uniphier.o
> +obj-$(CONFIG_GPIO_VIRTIO)		+= gpio-virtio.o
>   obj-$(CONFIG_GPIO_VF610)		+= gpio-vf610.o
>   obj-$(CONFIG_GPIO_VIPERBOARD)		+= gpio-viperboard.o
>   obj-$(CONFIG_GPIO_VR41XX)		+= gpio-vr41xx.o
> diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
> new file mode 100644
> index 000000000000..f1ac47da26b6
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
> +#include <linux/gpio/driver.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/spinlock.h>
> +#include <linux/virtio_config.h>
> +#include <uapi/linux/virtio_ids.h>
> +#include <uapi/linux/virtio_gpio.h>
> +
> +struct virtio_gpio_priv {
> +	struct gpio_chip gc;
> +	spinlock_t vq_lock;
> +	spinlock_t op_lock;
> +	struct virtio_device *vdev;
> +	int num_gpios;
> +	char *name;
> +	struct virtqueue *vq_rx;
> +	struct virtqueue *vq_tx;
> +	struct virtio_gpio_event rcv_buf;
> +	struct virtio_gpio_event last;
> +	int irq_base;
> +	wait_queue_head_t waitq;
> +	unsigned long reply_wait;
> +};
> +
> +static void virtio_gpio_prepare_inbuf(struct virtio_gpio_priv *priv)
> +{
> +	struct scatterlist rcv_sg;
> +
> +	sg_init_one(&rcv_sg, &priv->rcv_buf, sizeof(priv->rcv_buf));
> +	virtqueue_add_inbuf(priv->vq_rx, &rcv_sg, 1, &priv->rcv_buf,
> +			    GFP_KERNEL);
> +	virtqueue_kick(priv->vq_rx);
> +}
> +
> +static int virtio_gpio_xmit(struct virtio_gpio_priv *priv, int type,
> +			    int pin, int value, struct virtio_gpio_event *ev)
> +{
> +	struct scatterlist sg[1];
> +	int ret;
> +	unsigned long flags;
> +
> +	WARN_ON(!ev);
> +
> +	ev->type = type;
> +	ev->pin = pin;
> +	ev->value = value;
> +
> +	sg_init_table(sg, 1);
> +	sg_set_buf(&sg[0], ev, sizeof(struct virtio_gpio_event));
> +
> +	spin_lock_irqsave(&priv->vq_lock, flags);
> +	ret = virtqueue_add_outbuf(priv->vq_tx, sg, ARRAY_SIZE(sg),
> +				   priv, GFP_KERNEL);
> +	if (ret < 0) {
> +		dev_err(&priv->vdev->dev,
> +			"virtqueue_add_outbuf() failed: %d\n", ret);
> +		goto out;


So except for the error log, the failure is silently ignored by the 
caller. Is this intended?


> +	}
> +	virtqueue_kick(priv->vq_tx);
> +
> +out:
> +	spin_unlock_irqrestore(&priv->vq_lock, flags);
> +	return 0;
> +}
> +
> +static inline void wakeup_event(struct virtio_gpio_priv *priv, int id)
> +{
> +	set_bit(id, &priv->reply_wait);
> +}
> +
> +static inline int check_event(struct virtio_gpio_priv *priv, int id)
> +{
> +	return test_bit(id, &priv->reply_wait);
> +}
> +
> +static inline void clear_event(struct virtio_gpio_priv *priv, int id)
> +{
> +	clear_bit(id, &priv->reply_wait);
> +}
> +
> +static int virtio_gpio_req(struct virtio_gpio_priv *priv, int type,
> +			   int pin, int value)
> +{
> +	struct virtio_gpio_event *ev
> +		= kzalloc(&priv->vdev->dev, sizeof(struct virtio_gpio_event),
> +			  GFP_KERNEL);
> +
> +	if (!ev)
> +		return -ENOMEM;
> +
> +	clear_event(priv, type);
> +	virtio_gpio_xmit(priv, type, pin, value, ev);
> +	wait_event_interruptible(priv->waitq, check_event(priv, type));


If I read the code correctly, this expects there will be at most a 
single type of event that can be processed at the same time. E.g can 
upper layer want to read from different lines in parallel? If yes, we 
need to deal with that.


> +
> +	kfree(&priv->vdev->dev, ev);
> +
> +	return priv->last.value;
> +}
> +
> +static int virtio_gpio_direction_input(struct gpio_chip *gc,
> +				       unsigned int pin)
> +{
> +	return virtio_gpio_req(gpiochip_get_data(gc),
> +			       VIRTIO_GPIO_EV_GUEST_DIRECTION_INPUT,
> +			       pin, 0);
> +}
> +
> +static int virtio_gpio_direction_output(struct gpio_chip *gc,
> +					unsigned int pin, int value)
> +{
> +	return virtio_gpio_req(gpiochip_get_data(gc),
> +			       VIRTIO_GPIO_EV_GUEST_DIRECTION_OUTPUT,
> +			       pin, value);
> +}
> +
> +static int virtio_gpio_get_direction(struct gpio_chip *gc, unsigned int pin)
> +{
> +	return virtio_gpio_req(gpiochip_get_data(gc),
> +			       VIRTIO_GPIO_EV_GUEST_GET_DIRECTION,
> +			       pin, 0);
> +}
> +
> +static void virtio_gpio_set(struct gpio_chip *gc,
> +			    unsigned int pin, int value)
> +{
> +	virtio_gpio_req(gpiochip_get_data(gc),
> +			VIRTIO_GPIO_EV_GUEST_SET_VALUE, pin, value);
> +}
> +
> +static int virtio_gpio_get(struct gpio_chip *gc,
> +			   unsigned int pin)
> +{
> +	return virtio_gpio_req(gpiochip_get_data(gc),
> +			       VIRTIO_GPIO_EV_GUEST_GET_VALUE, pin, 0);
> +}
> +
> +static int virtio_gpio_request(struct gpio_chip *gc,
> +			       unsigned int pin)
> +{
> +	return virtio_gpio_req(gpiochip_get_data(gc),
> +			       VIRTIO_GPIO_EV_GUEST_REQUEST, pin, 0);
> +}
> +
> +static void virtio_gpio_signal(struct virtio_gpio_priv *priv, int event,
> +			      int pin, int value)
> +{
> +	if (pin < priv->num_gpios)
> +		generic_handle_irq(priv->irq_base + pin);
> +}
> +
> +static void virtio_gpio_data_rx(struct virtqueue *vq)
> +{
> +	struct virtio_gpio_priv *priv = vq->vdev->priv;
> +	void *data;
> +	unsigned int len;
> +	struct virtio_gpio_event *ev;
> +
> +	data = virtqueue_get_buf(priv->vq_rx, &len);
> +	if (!data || !len) {
> +		dev_warn(&vq->vdev->dev, "RX received no data ! %d\n", len);
> +		return;
> +	}
> +
> +	ev = data;
> +	WARN_ON(data != &priv->rcv_buf);
> +
> +	memcpy(&priv->last, &priv->rcv_buf, sizeof(struct virtio_gpio_event));
> +
> +	switch (ev->type) {
> +	case VIRTIO_GPIO_EV_HOST_LEVEL:
> +		virtio_gpio_signal(priv, ev->type, ev->pin, ev->value);
> +		break;
> +	default:
> +		wakeup_event(priv, ev->type & ~VIRTIO_GPIO_EV_REPLY);


This looks suspicious, it looks to me what is done here is, consider we 
want to do VIRTIO_GPIO_EV_GUEST_SET_VALUE

1) put the event in txq, wait
2) the result is returned from rxq, wakeup

It looks to me this is racy since the device should be able to process a 
batch of descriptors and there's no guarantee that the descriptor is 
processed in order from the virtio level.

I wonder why not introduce two virtqueues:

1) command vq
2) event vq

All commands were sent via command vq and then device can write back to 
the command buffer as other virtio device did. Then there's no worries 
of batching or out of order completion.


> +		break;
> +	}
> +	virtio_gpio_prepare_inbuf(priv);


This assumes at most one event could be generated, is this how GPIO 
device expect to behave? I think level could change several times.


> +	wake_up_all(&priv->waitq);
> +}
> +
> +static int virtio_gpio_alloc_vq(struct virtio_gpio_priv *priv)
> +{
> +	struct virtqueue *vqs[2];
> +	vq_callback_t *cbs[] = {
> +		NULL,
> +		virtio_gpio_data_rx,
> +	};
> +	static const char * const names[] = { "in", "out", };
> +	int ret;
> +
> +	ret = virtio_find_vqs(priv->vdev, 2, vqs, cbs, names, NULL);
> +	if (ret) {
> +		dev_err(&priv->vdev->dev, "failed to alloc vqs: %d\n", ret);
> +		return ret;
> +	}
> +
> +	priv->vq_rx = vqs[0];
> +	priv->vq_tx = vqs[1];
> +
> +	virtio_gpio_prepare_inbuf(priv);
> +
> +	virtio_config_enable(priv->vdev);
> +	virtqueue_enable_cb(priv->vq_rx);
> +	virtio_device_ready(priv->vdev);
> +
> +	return 0;
> +}
> +
> +static int virtio_gpio_probe(struct virtio_device *vdev)
> +{
> +	struct virtio_gpio_priv *priv;
> +	struct virtio_gpio_config cf = {};
> +	char *name_buffer;
> +	const char **gpio_names = NULL;
> +	struct device *dev = &vdev->dev;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;


Is devres guaranteed to be enabled here?

Thanks

