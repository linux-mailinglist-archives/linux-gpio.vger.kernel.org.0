Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 415C52CDE8B
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Dec 2020 20:14:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727432AbgLCTO2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Dec 2020 14:14:28 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:49581 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727309AbgLCTO1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Dec 2020 14:14:27 -0500
Received: from orion.localdomain ([95.118.71.13]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N4yNG-1k4BJY0wvk-010rSb; Thu, 03 Dec 2020 20:11:40 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     corbet@lwn.net, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, info@metux.net, mst@redhat.com,
        jasowang@redhat.com, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
Date:   Thu,  3 Dec 2020 20:11:35 +0100
Message-Id: <20201203191135.21576-2-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201203191135.21576-1-info@metux.net>
References: <20201203191135.21576-1-info@metux.net>
X-Provags-ID: V03:K1:tpKCXfH357jfKbxY7WjP8/MJP0jiJG1jQY4J4DuR2lMsxM5F4mj
 X/hkkLnh/+gIAYFjnieqNAGLuTugkIsHd5ko2hC0UUiPlnrncexHa/272Zcu/3EqWVDOEDy
 tQQdOUmtX5XTirhZm41UeJNiEAYMdBEtw4Ihw+e9glz0GKiG/QpwrXD7aXe0XllU40M9VuU
 7D7xV/Vp+mLQsj2b2bS+g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8g7sp+3aRTQ=:uemnzsc1LWK9ZWvQ2MKZ+V
 3OiEWIL2rDZYjmdDXqBVGux8Vh+LO+UQblyQiPkx087xtgwghqZ1n+pI5ed3s8l8eFHGogV+U
 NTnzXU0XxOBf7ksHcVZiKCFJkcAJe3FQPCY6NyZfubfp5WqP+fULeXf1aHLrmliroyw9nIB/i
 AcFXFQhe7dsRRcEgd8Ts3pQliMLB8xcKZIPQzo6UicsAmfoawggB3UE70CWZz/hUZ3rp/Ssgr
 7NBsdt39RIvgoduFDVPJdFOISDw2wnl7CuvepodOSUA7fPLTRe21urdzAQI10taKgxm8w/6dc
 VrFxjt0IE4G+939WCZEiMjqyoLVwQ9/n3cLcPzWoxQelZrkmX+tVfcJZVxKqDwjakg6iEK6c3
 6931SxOeR79GkaqlHPR40k45/ACi9WHgy3eQkiAxIoWtOOKRRjxoBNwg0NR4F
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Introducing new gpio driver for virtual GPIO devices via virtio.

The driver allows routing gpio control into VM guests, eg. brigding
virtual gpios to specific host gpios, or attaching simulators for
automatic application testing.

Changes v2:
    * fixed uapi header license
    * sorted include's
    * fixed formatting
    * fixed unneeded devm allocation - plain kzalloc/kfree is enough
    * fixed missing devm_kzalloc fail check
    * use devm_kcalloc() for array allocation
    * added virtio-gpio protocol specification

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 Documentation/gpio/virtio-gpio.rst | 176 ++++++++++++++++++++
 MAINTAINERS                        |   6 +
 drivers/gpio/Kconfig               |   9 +
 drivers/gpio/Makefile              |   1 +
 drivers/gpio/gpio-virtio.c         | 332 +++++++++++++++++++++++++++++++++++++
 include/uapi/linux/virtio_gpio.h   |  39 +++++
 include/uapi/linux/virtio_ids.h    |   1 +
 7 files changed, 564 insertions(+)
 create mode 100644 Documentation/gpio/virtio-gpio.rst
 create mode 100644 drivers/gpio/gpio-virtio.c
 create mode 100644 include/uapi/linux/virtio_gpio.h

diff --git a/Documentation/gpio/virtio-gpio.rst b/Documentation/gpio/virtio-gpio.rst
new file mode 100644
index 000000000000..04642be07b96
--- /dev/null
+++ b/Documentation/gpio/virtio-gpio.rst
@@ -0,0 +1,176 @@
+"""""""""""""""""
+Virtio-GPIO protocol specification
+"""""""""""""""""
+...........
+Specification for virtio-based virtiual GPIO devices
+...........
+
++------------
++Version_ 1.0
++------------
+
+===================
+General
+===================
+
+The virtio-gpio protocol provides access to general purpose IO devices
+to virtual machine guests. These virtualized GPIOs could be either provided
+by some simulator (eg. virtual HIL), routed to some external device or
+routed to real GPIOs on the host (eg. virtualized embedded applications).
+
+Instead of simulating some existing real GPIO chip within an VMM, this
+protocol provides an hardware independent interface between host and guest
+that solely relies on an active virtio connection (no matter which transport
+actually used), no other buses or additional platform driver logic required.
+
+===================
+Protocol layout
+===================
+
+----------------------
+Configuration space
+----------------------
+
++--------+----------+-------------------------------+
+| Offset | Type     | Description                   |
++========+==========+===============================+
+| 0x00   | uint8    | version                       |
++--------+----------+-------------------------------+
+| 0x02   | uint16   | number of GPIO lines          |
++--------+----------+-------------------------------+
+| 0x04   | uint32   | size of gpio name block       |
++--------+----------+-------------------------------+
+| 0x20   | char[32] | device name (0-terminated)    |
++--------+----------+-------------------------------+
+| 0x40   | char[]   | line names block              |
++--------+----------+-------------------------------+
+
+- for version field currently only value 1 supported.
+- the line names block holds a stream of zero-terminated strings,
+  holding the individual line names.
+- unspecified fields are reserved for future use and should be zero.
+
+------------------------
+Virtqueues and messages:
+------------------------
+
+- Queue #0: transmission from host to guest
+- Queue #1: transmission from guest to host
+
+The queues transport messages of the struct virtio_gpio_event:
+
+Message format:
+---------------
+
++--------+----------+---------------+
+| Offset | Type     | Description   |
++========+==========+===============+
+| 0x00   | uint16   | event type    |
++--------+----------+---------------+
+| 0x02   | uint16   | line id       |
++--------+----------+---------------+
+| 0x04   | uint32   | value         |
++--------+----------+---------------+
+
+Message types:
+--------------
+
++-------+---------------------------------------+-----------------------------+
+| Code  | Symbol                                |                             |
++=======+=======================================+=============================+
+| 0x01  | VIRTIO_GPIO_EV_GUEST_REQUEST          | request gpio line           |
++-------+---------------------------------------+-----------------------------+
+| 0x02  | VIRTIO_GPIO_EV_GUEST_DIRECTION_INPUT  | set direction to input      |
++-------+---------------------------------------+-----------------------------+
+| 0x03  | VIRTIO_GPIO_EV_GUEST_DIRECTION_OUTPUT | set direction to output     |
++-------+---------------------------------------+-----------------------------+
+| 0x04  | VIRTIO_GPIO_EV_GUEST_GET_DIRECTION    | read current direction      |
++-------+---------------------------------------+-----------------------------+
+| 0x05  | VIRTIO_GPIO_EV_GUEST_GET_VALUE        | read current level          |
++-------+---------------------------------------+-----------------------------+
+| 0x06  | VIRTIO_GPIO_EV_GUEST_SET_VALUE        | set current (out) level     |
++-------+---------------------------------------+-----------------------------+
+| 0x11  | VIRTIO_GPIO_EV_HOST_LEVEL             | state changed (host->guest) |
++-------+---------------------------------------+-----------------------------+
+
+----------------------
+Data flow:
+----------------------
+
+- all operations, except ``VIRTIO_GPIO_EV_HOST_LEVEL``, are guest-initiated
+- host replies ``VIRTIO_GPIO_EV_HOST_LEVEL`` OR'ed to the ``type`` field
+- ``VIRTIO_GPIO_EV_HOST_LEVEL`` is only sent asynchronically from host to guest
+- in replies, a negative ``value`` field denotes an unix-style errno code
+- valid direction values are:
+  * 0 = output
+  * 1 = input
+- valid line state values are:
+  * 0 = inactive
+  * 1 = active
+
+VIRTIO_GPIO_EV_GUEST_REQUEST
+----------------------------
+
+- notify the host that given line# is going to be used
+- request:
+  * ``line`` field: line number
+  * ``value`` field: unused
+- reply:
+  * ``value`` field: errno code (0 = success)
+
+VIRTIO_GPIO_EV_GUEST_DIRECTION_INPUT
+------------------------------------
+
+- set line line direction to input
+- request:
+  * ``line`` field: line number
+  * ``value`` field: unused
+- reply: value field holds errno
+  * ``value`` field: errno code (0 = success)
+
+VIRTIO_GPIO_EV_GUEST_DIRECTION_OUTPUT
+-------------------------------------
+
+- set line direction to output and given line state
+- request:
+  * ``line`` field: line number
+  * ``value`` field: output state (0=inactive, 1=active)
+- reply:
+  * ``value`` field: holds errno
+
+VIRTIO_GPIO_EV_GUEST_GET_DIRECTION
+----------------------------------
+
+- retrieve line direction
+- request:
+  * ``line`` field: line number
+  * ``value`` field: unused
+- reply:
+  * ``value`` field: direction (0=output, 1=input) or errno code
+
+VIRTIO_GPIO_EV_GUEST_GET_VALUE
+------------------------------
+
+- retrieve line state value
+- request:
+  * ``line`` field: line number
+  * ``value`` field: unused
+- reply:
+  * ``value`` field: line state (0=inactive, 1=active) or errno code
+
+VIRTIO_GPIO_EV_GUEST_SET_VALUE
+------------------------------
+
+- set line state value (output only)
+- request:
+  * ``line`` field: line number
+  * ``value`` field: line state (0=inactive, 1=active)
+- reply:
+  * ``value`` field: new line state or errno code
+
+VIRTIO_GPIO_EV_HOST_LEVEL
+-------------------------
+
+- async notification from host to gues: line state changed
+- ``line`` field: line number
+- ``value`` field: new line state (0=inactive, 1=active)
diff --git a/MAINTAINERS b/MAINTAINERS
index 2daa6ee673f7..2b74e39275b3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18592,6 +18592,12 @@ F:	Documentation/filesystems/virtiofs.rst
 F:	fs/fuse/virtio_fs.c
 F:	include/uapi/linux/virtio_fs.h
 
+VIRTIO GPIO DRIVER
+M:	Enrico Weigelt, metux IT consult <info@metux.net>
+S:	Maintained
+F:	drivers/gpio/gpio-virtio.c
+F:	include/uapi/linux/virtio_gpio.h
+
 VIRTIO GPU DRIVER
 M:	David Airlie <airlied@linux.ie>
 M:	Gerd Hoffmann <kraxel@redhat.com>
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 01619eb58396..7a33aa347dfb 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1615,6 +1615,15 @@ config GPIO_MOCKUP
 	  tools/testing/selftests/gpio/gpio-mockup.sh. Reference the usage in
 	  it.
 
+config GPIO_VIRTIO
+	tristate "VirtIO GPIO support"
+	depends on VIRTIO
+	help
+	  Say Y here to enable guest support for virtio-based GPIOs.
+
+	  These virtual GPIOs can be routed to real GPIOs or attached to
+	  simulators on the host (qemu).
+
 endmenu
 
 endif
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 09dada80ac34..2b12e75af123 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -160,6 +160,7 @@ obj-$(CONFIG_GPIO_TWL4030)		+= gpio-twl4030.o
 obj-$(CONFIG_GPIO_TWL6040)		+= gpio-twl6040.o
 obj-$(CONFIG_GPIO_UCB1400)		+= gpio-ucb1400.o
 obj-$(CONFIG_GPIO_UNIPHIER)		+= gpio-uniphier.o
+obj-$(CONFIG_GPIO_VIRTIO)		+= gpio-virtio.o
 obj-$(CONFIG_GPIO_VF610)		+= gpio-vf610.o
 obj-$(CONFIG_GPIO_VIPERBOARD)		+= gpio-viperboard.o
 obj-$(CONFIG_GPIO_VR41XX)		+= gpio-vr41xx.o
diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
new file mode 100644
index 000000000000..f1ac47da26b6
--- /dev/null
+++ b/drivers/gpio/gpio-virtio.c
@@ -0,0 +1,332 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * GPIO driver for virtio-based virtual GPIOs
+ *
+ * Copyright (C) 2018 metux IT consult
+ * Author: Enrico Weigelt, metux IT consult <info@metux.net>
+ *
+ */
+
+#include <linux/err.h>
+#include <linux/gpio/driver.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/spinlock.h>
+#include <linux/virtio_config.h>
+#include <uapi/linux/virtio_ids.h>
+#include <uapi/linux/virtio_gpio.h>
+
+struct virtio_gpio_priv {
+	struct gpio_chip gc;
+	spinlock_t vq_lock;
+	spinlock_t op_lock;
+	struct virtio_device *vdev;
+	int num_gpios;
+	char *name;
+	struct virtqueue *vq_rx;
+	struct virtqueue *vq_tx;
+	struct virtio_gpio_event rcv_buf;
+	struct virtio_gpio_event last;
+	int irq_base;
+	wait_queue_head_t waitq;
+	unsigned long reply_wait;
+};
+
+static void virtio_gpio_prepare_inbuf(struct virtio_gpio_priv *priv)
+{
+	struct scatterlist rcv_sg;
+
+	sg_init_one(&rcv_sg, &priv->rcv_buf, sizeof(priv->rcv_buf));
+	virtqueue_add_inbuf(priv->vq_rx, &rcv_sg, 1, &priv->rcv_buf,
+			    GFP_KERNEL);
+	virtqueue_kick(priv->vq_rx);
+}
+
+static int virtio_gpio_xmit(struct virtio_gpio_priv *priv, int type,
+			    int pin, int value, struct virtio_gpio_event *ev)
+{
+	struct scatterlist sg[1];
+	int ret;
+	unsigned long flags;
+
+	WARN_ON(!ev);
+
+	ev->type = type;
+	ev->pin = pin;
+	ev->value = value;
+
+	sg_init_table(sg, 1);
+	sg_set_buf(&sg[0], ev, sizeof(struct virtio_gpio_event));
+
+	spin_lock_irqsave(&priv->vq_lock, flags);
+	ret = virtqueue_add_outbuf(priv->vq_tx, sg, ARRAY_SIZE(sg),
+				   priv, GFP_KERNEL);
+	if (ret < 0) {
+		dev_err(&priv->vdev->dev,
+			"virtqueue_add_outbuf() failed: %d\n", ret);
+		goto out;
+	}
+	virtqueue_kick(priv->vq_tx);
+
+out:
+	spin_unlock_irqrestore(&priv->vq_lock, flags);
+	return 0;
+}
+
+static inline void wakeup_event(struct virtio_gpio_priv *priv, int id)
+{
+	set_bit(id, &priv->reply_wait);
+}
+
+static inline int check_event(struct virtio_gpio_priv *priv, int id)
+{
+	return test_bit(id, &priv->reply_wait);
+}
+
+static inline void clear_event(struct virtio_gpio_priv *priv, int id)
+{
+	clear_bit(id, &priv->reply_wait);
+}
+
+static int virtio_gpio_req(struct virtio_gpio_priv *priv, int type,
+			   int pin, int value)
+{
+	struct virtio_gpio_event *ev
+		= kzalloc(&priv->vdev->dev, sizeof(struct virtio_gpio_event),
+			  GFP_KERNEL);
+
+	if (!ev)
+		return -ENOMEM;
+
+	clear_event(priv, type);
+	virtio_gpio_xmit(priv, type, pin, value, ev);
+	wait_event_interruptible(priv->waitq, check_event(priv, type));
+
+	kfree(&priv->vdev->dev, ev);
+
+	return priv->last.value;
+}
+
+static int virtio_gpio_direction_input(struct gpio_chip *gc,
+				       unsigned int pin)
+{
+	return virtio_gpio_req(gpiochip_get_data(gc),
+			       VIRTIO_GPIO_EV_GUEST_DIRECTION_INPUT,
+			       pin, 0);
+}
+
+static int virtio_gpio_direction_output(struct gpio_chip *gc,
+					unsigned int pin, int value)
+{
+	return virtio_gpio_req(gpiochip_get_data(gc),
+			       VIRTIO_GPIO_EV_GUEST_DIRECTION_OUTPUT,
+			       pin, value);
+}
+
+static int virtio_gpio_get_direction(struct gpio_chip *gc, unsigned int pin)
+{
+	return virtio_gpio_req(gpiochip_get_data(gc),
+			       VIRTIO_GPIO_EV_GUEST_GET_DIRECTION,
+			       pin, 0);
+}
+
+static void virtio_gpio_set(struct gpio_chip *gc,
+			    unsigned int pin, int value)
+{
+	virtio_gpio_req(gpiochip_get_data(gc),
+			VIRTIO_GPIO_EV_GUEST_SET_VALUE, pin, value);
+}
+
+static int virtio_gpio_get(struct gpio_chip *gc,
+			   unsigned int pin)
+{
+	return virtio_gpio_req(gpiochip_get_data(gc),
+			       VIRTIO_GPIO_EV_GUEST_GET_VALUE, pin, 0);
+}
+
+static int virtio_gpio_request(struct gpio_chip *gc,
+			       unsigned int pin)
+{
+	return virtio_gpio_req(gpiochip_get_data(gc),
+			       VIRTIO_GPIO_EV_GUEST_REQUEST, pin, 0);
+}
+
+static void virtio_gpio_signal(struct virtio_gpio_priv *priv, int event,
+			      int pin, int value)
+{
+	if (pin < priv->num_gpios)
+		generic_handle_irq(priv->irq_base + pin);
+}
+
+static void virtio_gpio_data_rx(struct virtqueue *vq)
+{
+	struct virtio_gpio_priv *priv = vq->vdev->priv;
+	void *data;
+	unsigned int len;
+	struct virtio_gpio_event *ev;
+
+	data = virtqueue_get_buf(priv->vq_rx, &len);
+	if (!data || !len) {
+		dev_warn(&vq->vdev->dev, "RX received no data ! %d\n", len);
+		return;
+	}
+
+	ev = data;
+	WARN_ON(data != &priv->rcv_buf);
+
+	memcpy(&priv->last, &priv->rcv_buf, sizeof(struct virtio_gpio_event));
+
+	switch (ev->type) {
+	case VIRTIO_GPIO_EV_HOST_LEVEL:
+		virtio_gpio_signal(priv, ev->type, ev->pin, ev->value);
+		break;
+	default:
+		wakeup_event(priv, ev->type & ~VIRTIO_GPIO_EV_REPLY);
+		break;
+	}
+	virtio_gpio_prepare_inbuf(priv);
+	wake_up_all(&priv->waitq);
+}
+
+static int virtio_gpio_alloc_vq(struct virtio_gpio_priv *priv)
+{
+	struct virtqueue *vqs[2];
+	vq_callback_t *cbs[] = {
+		NULL,
+		virtio_gpio_data_rx,
+	};
+	static const char * const names[] = { "in", "out", };
+	int ret;
+
+	ret = virtio_find_vqs(priv->vdev, 2, vqs, cbs, names, NULL);
+	if (ret) {
+		dev_err(&priv->vdev->dev, "failed to alloc vqs: %d\n", ret);
+		return ret;
+	}
+
+	priv->vq_rx = vqs[0];
+	priv->vq_tx = vqs[1];
+
+	virtio_gpio_prepare_inbuf(priv);
+
+	virtio_config_enable(priv->vdev);
+	virtqueue_enable_cb(priv->vq_rx);
+	virtio_device_ready(priv->vdev);
+
+	return 0;
+}
+
+static int virtio_gpio_probe(struct virtio_device *vdev)
+{
+	struct virtio_gpio_priv *priv;
+	struct virtio_gpio_config cf = {};
+	char *name_buffer;
+	const char **gpio_names = NULL;
+	struct device *dev = &vdev->dev;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->name = devm_kzalloc(dev, sizeof(cf.name)+1, GFP_KERNEL);
+	if (!priv->name)
+		return -ENOMEM;
+
+	spin_lock_init(&priv->vq_lock);
+	spin_lock_init(&priv->op_lock);
+
+	virtio_cread(vdev, struct virtio_gpio_config, version, &cf.version);
+	virtio_cread(vdev, struct virtio_gpio_config, num_gpios,
+		     &cf.num_gpios);
+	virtio_cread(vdev, struct virtio_gpio_config, names_size,
+		     &cf.names_size);
+	virtio_cread_bytes(vdev, offsetof(struct virtio_gpio_config, name),
+			   priv->name, sizeof(cf.name));
+
+	if (cf.version != 1) {
+		dev_err(dev, "unsupported interface version %d\n", cf.version);
+		return -EINVAL;
+	}
+
+	priv->num_gpios = cf.num_gpios;
+
+	if (cf.names_size) {
+		char *bufwalk;
+		int idx = 0;
+
+		name_buffer = devm_kzalloc(&vdev->dev, cf.names_size,
+					   GFP_KERNEL)+1;
+		virtio_cread_bytes(vdev, sizeof(struct virtio_gpio_config),
+				   name_buffer, cf.names_size);
+		name_buffer[cf.names_size] = 0;
+
+		gpio_names = devm_kcalloc(dev, priv->num_gpios, sizeof(char *),
+					  GFP_KERNEL);
+		bufwalk = name_buffer;
+
+		while (idx < priv->num_gpios &&
+		       bufwalk < (name_buffer+cf.names_size)) {
+			gpio_names[idx] = (strlen(bufwalk) ? bufwalk : NULL);
+			bufwalk += strlen(bufwalk)+1;
+			idx++;
+		}
+	}
+
+	priv->gc.owner			= THIS_MODULE;
+	priv->gc.parent			= dev;
+	priv->gc.label			= (priv->name[0] ? priv->name
+							 : dev_name(dev));
+	priv->gc.ngpio			= priv->num_gpios;
+	priv->gc.names			= gpio_names;
+	priv->gc.base			= -1;
+	priv->gc.request		= virtio_gpio_request;
+	priv->gc.direction_input	= virtio_gpio_direction_input;
+	priv->gc.direction_output	= virtio_gpio_direction_output;
+	priv->gc.get_direction		= virtio_gpio_get_direction;
+	priv->gc.get			= virtio_gpio_get;
+	priv->gc.set			= virtio_gpio_set;
+
+	priv->vdev			= vdev;
+	vdev->priv = priv;
+
+	priv->irq_base = devm_irq_alloc_descs(dev, -1, 0, priv->num_gpios,
+					      NUMA_NO_NODE);
+	if (priv->irq_base < 0) {
+		dev_err(&vdev->dev, "failed to alloc irqs\n");
+		priv->irq_base = -1;
+		return -ENOMEM;
+	}
+
+	init_waitqueue_head(&priv->waitq);
+
+	priv->reply_wait = 0;
+
+	virtio_gpio_alloc_vq(priv);
+
+	return devm_gpiochip_add_data(dev, &priv->gc, priv);
+}
+
+static void virtio_gpio_remove(struct virtio_device *vdev)
+{
+}
+
+static const struct virtio_device_id id_table[] = {
+	{ VIRTIO_ID_GPIO, VIRTIO_DEV_ANY_ID },
+	{ 0 },
+};
+
+static struct virtio_driver virtio_gpio_driver = {
+	.driver.name	= KBUILD_MODNAME,
+	.driver.owner	= THIS_MODULE,
+	.id_table	= id_table,
+	.probe		= virtio_gpio_probe,
+	.remove		= virtio_gpio_remove,
+};
+
+module_virtio_driver(virtio_gpio_driver);
+
+MODULE_AUTHOR("Enrico Weigelt, metux IT consult <info@metux.net>");
+MODULE_DESCRIPTION("VirtIO GPIO driver");
+MODULE_LICENSE("GPL");
diff --git a/include/uapi/linux/virtio_gpio.h b/include/uapi/linux/virtio_gpio.h
new file mode 100644
index 000000000000..438b49f04505
--- /dev/null
+++ b/include/uapi/linux/virtio_gpio.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+#ifndef _LINUX_VIRTIO_GPIO_H
+#define _LINUX_VIRTIO_GPIO_H
+
+#include <linux/types.h>
+
+enum virtio_gpio_event_type {
+	// requests from quest to host
+	VIRTIO_GPIO_EV_GUEST_REQUEST		= 0x01,	// ->request()
+	VIRTIO_GPIO_EV_GUEST_DIRECTION_INPUT	= 0x02,	// ->direction_input()
+	VIRTIO_GPIO_EV_GUEST_DIRECTION_OUTPUT	= 0x03,	// ->direction_output()
+	VIRTIO_GPIO_EV_GUEST_GET_DIRECTION	= 0x04,	// ->get_direction()
+	VIRTIO_GPIO_EV_GUEST_GET_VALUE		= 0x05,	// ->get_value()
+	VIRTIO_GPIO_EV_GUEST_SET_VALUE		= 0x06,	// ->set_value()
+
+	// messages from host to guest
+	VIRTIO_GPIO_EV_HOST_LEVEL		= 0x11,	// gpio state changed
+
+	/* mask bit set on host->guest reply */
+	VIRTIO_GPIO_EV_REPLY			= 0xF000,
+};
+
+struct virtio_gpio_config {
+	__u8    version;
+	__u8    reserved0;
+	__u16   num_gpios;
+	__u32   names_size;
+	__u8    reserved1[24];
+	__u8    name[32];
+};
+
+struct virtio_gpio_event {
+	__le16 type;
+	__le16 pin;
+	__le32 value;
+};
+
+#endif /* _LINUX_VIRTIO_GPIO_H */
diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
index b052355ac7a3..85772c0bcb4b 100644
--- a/include/uapi/linux/virtio_ids.h
+++ b/include/uapi/linux/virtio_ids.h
@@ -48,5 +48,6 @@
 #define VIRTIO_ID_FS           26 /* virtio filesystem */
 #define VIRTIO_ID_PMEM         27 /* virtio pmem */
 #define VIRTIO_ID_MAC80211_HWSIM 29 /* virtio mac80211-hwsim */
+#define VIRTIO_ID_GPIO           30 /* virtio GPIO */
 
 #endif /* _LINUX_VIRTIO_IDS_H */
-- 
2.11.0

