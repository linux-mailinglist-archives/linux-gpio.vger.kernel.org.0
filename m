Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4B153A8813
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jun 2021 19:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbhFORvp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Jun 2021 13:51:45 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:46819 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231168AbhFORvo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Jun 2021 13:51:44 -0400
Received: from orion.localdomain ([95.115.9.120]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MTOZQ-1ljCn02TGe-00TiL5; Tue, 15 Jun 2021 19:49:14 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     corbet@lwn.net, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, info@metux.net, mst@redhat.com,
        jasowang@redhat.com, keescook@chromium.org, anton@enomsg.org,
        ccross@android.com, tony.luck@intel.com, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org
Subject: [PATCH] drivers: gpio: add virtio-gpio guest driver
Date:   Tue, 15 Jun 2021 19:49:11 +0200
Message-Id: <20210615174911.973-1-info@metux.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HxLh+DzCcaVDG4GfWoFlaSa7t9Hyw5Dz5eltszv7bOkrrV4v8lF
 PgRwv4omQG6dRJ7aE5tGOuf2GQQcqWJ2Hh6MKTYVpALqHzKwcML6EW87U145/PY1ebtFhHl
 QpT5uihZvLqMalJ8FUCnA4JJvoTDUa8OGG2SkMMK09jTOd+doBZIHjy5eqVrgopiCML6Z8W
 FUGzVWl3vUH8fmS3RlzqQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UgAZxsZq3OE=:rdo3I7XXpjtQV++JJm6UYd
 /QA1kJeJpXT1HDTmTkkyN3sEESaWKqfSl43jVEi8hDFhXXCkDqT4WTUNQN1aiFLQ1E8MqGDsq
 iiIIRdhWnCtUcruiUeOzGeVtqjcd/It140IeD1Msc7YGgvs9gx3nzzVr9SgLwZeNuh4S/OETO
 TFugCW+dFgRt4zOo3NJmNFVxb3hwCgzuVSbMVHsx6ABOTWjwv0Jdqwmzlq0qYPvHw/jWT43BT
 7wWwTzXXRpC8MVXQSZ34pYnR/JzjtICQuY49TAsH6sLEKC8yU8hgf6/CLAGCtGlEiYOY7oDJd
 KTALHIz3u0tXvfjXBf4ZC62iY3pYoqAa/Mo/r+e8+cPgzrsxe8jjT3h/wotsBfxTw/PT6jJAY
 Bjv8K8T9329U3iZV5DSubZ2WWRMxaGj5zmJuhhs/WR9YDsrijYYKvSRCfwgDJlKoOsroYPkH4
 DJ7cqlRxPgGoSb8xKDWWTPCnrz6CEVPIx2ToffkQOYmRC94quVACx1+WCVeAHK7DzSnDYFPLH
 6cHSey0T9jhRG2l9jQIAqo=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Introduce new GPIO driver for virtual GPIO devices via virtio.

The driver implements the virtio-gpio protocol (ID 41), which can be
used by either VM guests (e.g. bridging virtual gpios from the guest
to real gpios in the host or attaching simulators for automatic
application testing), as well as virtio-gpio hardware devices.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

---

Status:
    * this driver is now field tested for about 6 month
      (against KVM+Qemu as well as some HW/FPGA implementation)
    * virtio device ID officially allocated
    * virtio spec has been submitted to virtio TC

Changes v4:
    * fixed spelling and formatting as pointed out by Randy
    * fixed virtio terminology: device/CPU instead of host/guest
    * spec: add clarification on versions and concurrency
    * driver: add endianess conversions
    * driver: rebased on mainline and fixed some little breaks
    * uapi: fixed device ID to now offically allocated: #41

Changes v3:
    * spec: fixed type names
    * spec: replace "host"/"guest" by "device"/"cpu"
    * spec: change terminology from "events" to "messages"
    * driver: fixed missing can_sleep flag
    * driver: select VIRTIO instead of depends on
    * driver: drop references to qemu in Kconfig
    * driver: fixed incomplete error handling and possible deadlock
              in case of sending buf failed
    * driver: dropped unneeded WARN_ON
    * driver: fixed retval of virtio_gpio_xmit()
    * driver: dynamically allocate virtio buffers
    * driver: added locking on gpio operations
    * driver: added irq_chip functions

Changes v2:
    * uapi: fixed header license
    * driver: sorted include's
    * driver: fixed formatting
    * driver: fixed unneeded devm allocation - plain kzalloc/kfree is enough
    * driver: fixed missing devm_kzalloc fail check
    * driver: use devm_kcalloc() for array allocation
    * spec: added virtio-gpio protocol specification
---
 Documentation/gpio/virtio-gpio.rst | 195 +++++++++++++++
 MAINTAINERS                        |   6 +
 drivers/gpio/Kconfig               |   7 +
 drivers/gpio/Makefile              |   1 +
 drivers/gpio/gpio-virtio.c         | 384 +++++++++++++++++++++++++++++
 include/uapi/linux/virtio_gpio.h   |  39 +++
 include/uapi/linux/virtio_ids.h    |   1 +
 7 files changed, 633 insertions(+)
 create mode 100644 Documentation/gpio/virtio-gpio.rst
 create mode 100644 drivers/gpio/gpio-virtio.c
 create mode 100644 include/uapi/linux/virtio_gpio.h

diff --git a/Documentation/gpio/virtio-gpio.rst b/Documentation/gpio/virtio-gpio.rst
new file mode 100644
index 000000000000..5fcc93f51174
--- /dev/null
+++ b/Documentation/gpio/virtio-gpio.rst
@@ -0,0 +1,195 @@
+===================
+Virtio-GPIO protocol specification
+===================
+...........
+Specification for virtio-based GPIO devices
+...........
+
++------------
++Version_ 1.0
++------------
+
+General
+===================
+
+The virtio-gpio protocol provides access to general purpose IO devices via
+virtio interfaces, used by many virtual machine monitors as well as hardware
+fabrics. In VM setups, these GPIOs could be either provided by some simulator
+(e.g. virtual HIL), routed to some external device or routed to real GPIOs on
+the host (e.g. virtualized embedded applications).
+
+Instead of simulating some existing real GPIO chip within an VMM, this
+protocol provides a hardware independent interface between CPU and device
+that solely relies on an active virtio connection (no matter which transport
+actually used), no other buses or additional platform driver logic required.
+
+At the same time, this protocol be implemented directly in virtio attached
+hardware, FPGAs or tiny MCUs.
+
+Protocol layout
+===================
+
+Configuration space
+----------------------
+
++--------+----------+-------------------------------+
+| Offset | Type     | Description                   |
++========+==========+===============================+
+| 0x00   | u8       | version                       |
++--------+----------+-------------------------------+
+| 0x02   | u16      | number of GPIO lines          |
++--------+----------+-------------------------------+
+| 0x04   | u32      | size of gpio name block       |
++--------+----------+-------------------------------+
+| 0x20   | char[32] | device name (0-terminated)    |
++--------+----------+-------------------------------+
+| 0x40   | char[]   | line names block              |
++--------+----------+-------------------------------+
+
+- for version field currently only value 1 supported.
+- the line names block holds a stream of zero-terminated strings,
+  containing the individual line names in ASCII. line names must unique.
+- unspecified fields are reserved for future use and should be zero.
+
+Virtqueues and messages:
+------------------------
+
+- Queue #0: transmission from device to CPU
+- Queue #1: transmission from CPU to device
+
+The queues transport messages of the struct virtio_gpio_msg:
+
+Message format:
+~~~~~~~~~~~~~~~
+
++--------+----------+---------------+
+| Offset | Type     | Description   |
++========+==========+===============+
+| 0x00   | uint16   | message type  |
++--------+----------+---------------+
+| 0x02   | uint16   | line id       |
++--------+----------+---------------+
+| 0x04   | uint32   | value         |
++--------+----------+---------------+
+
+Message types:
+~~~~~~~~~~~~~~
+
++---------+----------------------------------------+-----------------------------+
+| Code    | Symbol                                 |                             |
++=========+========================================+=============================+
+| 0x0001  | VIRTIO_GPIO_MSG_CPU_REQUEST            | request gpio line           |
++---------+----------------------------------------+-----------------------------+
+| 0x0002  | VIRTIO_GPIO_MSG_CPU_DIRECTION_INPUT    | set direction to input      |
++---------+----------------------------------------+-----------------------------+
+| 0x0003  | VIRTIO_GPIO_MSG_CPU_DIRECTION_OUTPUT   | set direction to output     |
++---------+----------------------------------------+-----------------------------+
+| 0x0004  | VIRTIO_GPIO_MSG_CPU_GET_DIRECTION      | read current direction      |
++---------+----------------------------------------+-----------------------------+
+| 0x0005  | VIRTIO_GPIO_MSG_CPU_GET_LEVEL          | read current level          |
++---------+----------------------------------------+-----------------------------+
+| 0x0006  | VIRTIO_GPIO_MSG_CPU_SET_LEVEL          | set current (out) level     |
++---------+----------------------------------------+-----------------------------+
+| 0x0011  | VIRTIO_GPIO_MSG_DEVICE_LEVEL           | state changed (device->CPU) |
++---------+----------------------------------------+-----------------------------+
+| 0x8000  | VIRTIO_GPIO_MSG_REPLY                  | device reply mask           |
++---------+----------------------------------------+-----------------------------+
+
+Data flow:
+----------------------
+
+- all operations, except ``VIRTIO_GPIO_MSG_DEVICE_LEVEL``, are initiated by CPU
+- device replies with the orinal ``type`` value OR'ed with ``VIRTIO_GPIO_MSG_REPLY``
+- ``VIRTIO_GPIO_MSG_DEVICE_LEVEL`` is only sent asynchronously from device to CPU
+- in replies, a negative ``value`` field denotes an Unix-style / POSIX errno code
+- valid direction values are:
+  * 0 = output
+  * 1 = input
+- valid line state values are:
+  * 0 = inactive
+  * 1 = active
+
+VIRTIO_GPIO_MSG_CPU_REQUEST
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- notify the device that given line# is going to be used
+- request:
+  * ``line`` field: line number
+  * ``value`` field: unused
+- reply:
+  * ``value`` field: errno code (0 = success)
+
+VIRTIO_GPIO_MSG_CPU_DIRECTION_INPUT
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- set line line direction to input
+- request:
+  * ``line`` field: line number
+  * ``value`` field: unused
+- reply: value field holds errno
+  * ``value`` field: errno code (0 = success)
+
+VIRTIO_GPIO_MSG_CPU_DIRECTION_OUTPUT
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- set line direction to output and given line state
+- request:
+  * ``line`` field: line number
+  * ``value`` field: output state (0=inactive, 1=active)
+- reply:
+  * ``value`` field: holds errno
+
+VIRTIO_GPIO_MSG_CPU_GET_DIRECTION
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- retrieve line direction
+- request:
+  * ``line`` field: line number
+  * ``value`` field: unused
+- reply:
+  * ``value`` field: direction (0=output, 1=input) or errno code
+
+VIRTIO_GPIO_MSG_CPU_GET_LEVEL
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- retrieve line state value
+- request:
+  * ``line`` field: line number
+  * ``value`` field: unused
+- reply:
+  * ``value`` field: line state (0=inactive, 1=active) or errno code
+
+VIRTIO_GPIO_MSG_CPU_SET_LEVEL
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- set line state value (output only)
+- request:
+  * ``line`` field: line number
+  * ``value`` field: line state (0=inactive, 1=active)
+- reply:
+  * ``value`` field: new line state or errno code
+
+VIRTIO_GPIO_MSG_DEVICE_LEVEL
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- async notification from device to CPU: line state changed
+- ``line`` field: line number
+- ``value`` field: new line state (0=inactive, 1=active)
+
+Request concurrency
+===================
+
+- CPU may send multiple request in serial, as long as the virtio queue
+  is not exceeded
+- device replies must be sent in the same order than the CPU requests
+- CPU should process asynchronous messages from device as soon as possible,
+  in order to avoid missing messages due to queue overrun
+
+Future versions
+===================
+
+- future versions must increment the ``version`` value
+- the basic data structures (config space, message format) should remain
+  backwards compatible, but may increased in size or use reserved fields
+- device needs to support commands in older versions
+- CPU should not send commands of newer versions that the device doesn't support
diff --git a/MAINTAINERS b/MAINTAINERS
index bc0ceef87b73..1189ae5b442b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19397,6 +19397,12 @@ F:	Documentation/filesystems/virtiofs.rst
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
index 1dd0ec6727fd..b9871e5b3c74 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1655,6 +1655,13 @@ config GPIO_MOCKUP
 	  tools/testing/selftests/gpio/gpio-mockup.sh. Reference the usage in
 	  it.
 
+config GPIO_VIRTIO
+	tristate "VirtIO GPIO support"
+	select VIRTIO
+	select GPIOLIB_IRQCHIP
+	help
+	  Say Y here to enable guest support for virtio-based GPIOs.
+
 endmenu
 
 endif
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index d7c81e1611a4..ba42e6549c87 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -162,6 +162,7 @@ obj-$(CONFIG_GPIO_TWL4030)		+= gpio-twl4030.o
 obj-$(CONFIG_GPIO_TWL6040)		+= gpio-twl6040.o
 obj-$(CONFIG_GPIO_UCB1400)		+= gpio-ucb1400.o
 obj-$(CONFIG_GPIO_UNIPHIER)		+= gpio-uniphier.o
+obj-$(CONFIG_GPIO_VIRTIO)		+= gpio-virtio.o
 obj-$(CONFIG_GPIO_VF610)		+= gpio-vf610.o
 obj-$(CONFIG_GPIO_VIPERBOARD)		+= gpio-viperboard.o
 obj-$(CONFIG_GPIO_VISCONTI)		+= gpio-visconti.o
diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
new file mode 100644
index 000000000000..4938cd0350ff
--- /dev/null
+++ b/drivers/gpio/gpio-virtio.c
@@ -0,0 +1,384 @@
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
+#define CONFIG_VIRTIO_GPIO_MAX_IRQ		256
+
+#define MSG_BUF_SZ	(sizeof(struct virtio_gpio_msg))
+
+struct virtio_gpio_priv {
+	struct gpio_chip gc;
+	spinlock_t vq_lock;
+	struct virtio_device *vdev;
+	int num_gpios;
+	char *name;
+	struct virtqueue *vq_rx;
+	struct virtqueue *vq_tx;
+	struct virtio_gpio_msg last;
+	wait_queue_head_t waitq;
+	unsigned long reply_wait;
+	struct irq_chip irq_chip;
+	DECLARE_BITMAP(irq_mask, CONFIG_VIRTIO_GPIO_MAX_IRQ);
+	unsigned int irq_parents;
+	struct mutex rpc_mutex;
+};
+
+static int virtio_gpio_prepare_inbuf(struct virtio_gpio_priv *priv)
+{
+	struct scatterlist rcv_sg;
+	struct virtio_gpio_msg *buf;
+
+	buf = devm_kzalloc(&priv->vdev->dev, MSG_BUF_SZ, GFP_KERNEL);
+	if (!buf) {
+		dev_err(&priv->vdev->dev, "failed to allocate input buffer\n");
+		return -ENOMEM;
+	}
+
+	sg_init_one(&rcv_sg, buf, sizeof(struct virtio_gpio_priv));
+	virtqueue_add_inbuf(priv->vq_rx, &rcv_sg, 1, buf, GFP_KERNEL);
+	virtqueue_kick(priv->vq_rx);
+
+	return 0;
+}
+
+static int virtio_gpio_xmit(struct virtio_gpio_priv *priv, int type,
+			    int pin, int value, struct virtio_gpio_msg *ev)
+{
+	struct scatterlist xmit_sg;
+	int ret;
+	unsigned long flags;
+
+	ev->type = cpu_to_le16(type);
+	ev->pin = cpu_to_le16(pin);
+	ev->value = cpu_to_le32(value);
+
+	sg_init_one(&xmit_sg, ev, MSG_BUF_SZ);
+	spin_lock_irqsave(&priv->vq_lock, flags);
+	ret = virtqueue_add_outbuf(priv->vq_tx, &xmit_sg, 1, priv, GFP_KERNEL);
+	if (ret < 0) {
+		dev_err(&priv->vdev->dev,
+			"virtqueue_add_outbuf() failed: %d\n", ret);
+		goto out;
+	}
+	virtqueue_kick(priv->vq_tx);
+
+out:
+	spin_unlock_irqrestore(&priv->vq_lock, flags);
+	return ret;
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
+static int virtio_gpio_rpc(struct virtio_gpio_priv *priv, int type,
+			   int pin, int value)
+{
+	int ret;
+	struct virtio_gpio_msg *buf = kzalloc(MSG_BUF_SZ, GFP_KERNEL);
+
+	if (!buf)
+		return -ENOMEM;
+
+	mutex_lock(&priv->rpc_mutex);
+	virtio_gpio_prepare_inbuf(priv);
+	clear_event(priv, type);
+
+	ret = virtio_gpio_xmit(priv, type, pin, value, buf);
+	if (ret)
+		goto out;
+
+	wait_event_interruptible(priv->waitq, check_event(priv, type));
+	ret = priv->last.value;
+
+out:
+	mutex_unlock(&priv->rpc_mutex);
+	kfree(buf);
+	return ret;
+}
+
+static int virtio_gpio_direction_input(struct gpio_chip *gc,
+				       unsigned int pin)
+{
+	return virtio_gpio_rpc(gpiochip_get_data(gc),
+			       VIRTIO_GPIO_MSG_CPU_DIRECTION_INPUT,
+			       pin, 0);
+}
+
+static int virtio_gpio_direction_output(struct gpio_chip *gc,
+					unsigned int pin, int value)
+{
+	return virtio_gpio_rpc(gpiochip_get_data(gc),
+			       VIRTIO_GPIO_MSG_CPU_DIRECTION_OUTPUT,
+			       pin, value);
+}
+
+static int virtio_gpio_get_direction(struct gpio_chip *gc, unsigned int pin)
+{
+	return virtio_gpio_rpc(gpiochip_get_data(gc),
+			       VIRTIO_GPIO_MSG_CPU_GET_DIRECTION,
+			       pin, 0);
+}
+
+static void virtio_gpio_set(struct gpio_chip *gc,
+			    unsigned int pin, int value)
+{
+	virtio_gpio_rpc(gpiochip_get_data(gc),
+			VIRTIO_GPIO_MSG_CPU_SET_LEVEL, pin, value);
+}
+
+static int virtio_gpio_get(struct gpio_chip *gc,
+			   unsigned int pin)
+{
+	return virtio_gpio_rpc(gpiochip_get_data(gc),
+			       VIRTIO_GPIO_MSG_CPU_GET_LEVEL, pin, 0);
+}
+
+static int virtio_gpio_request(struct gpio_chip *gc,
+			       unsigned int pin)
+{
+	return virtio_gpio_rpc(gpiochip_get_data(gc),
+			       VIRTIO_GPIO_MSG_CPU_REQUEST, pin, 0);
+}
+
+static void virtio_gpio_signal(struct virtio_gpio_priv *priv, int event,
+			       int pin, int value)
+{
+	int mapped_irq = irq_find_mapping(priv->gc.irq.domain, pin);
+
+	if ((pin < priv->num_gpios) && test_bit(pin, priv->irq_mask))
+		generic_handle_irq(mapped_irq);
+}
+
+static void virtio_gpio_data_rx(struct virtqueue *vq)
+{
+	struct virtio_gpio_priv *priv = vq->vdev->priv;
+	void *data;
+	unsigned int len;
+	struct virtio_gpio_msg *ev;
+
+	data = virtqueue_get_buf(priv->vq_rx, &len);
+	if (!data || !len) {
+		dev_warn(&vq->vdev->dev, "RX received no data ! %d\n", len);
+		return;
+	}
+
+	ev = data;
+
+	memcpy(&priv->last, data, MSG_BUF_SZ);
+
+	ev->type  = le16_to_cpu(ev->type);
+	ev->pin   = le16_to_cpu(ev->pin);
+	ev->value = le32_to_cpu(ev->value);
+
+	switch (ev->type) {
+	case VIRTIO_GPIO_MSG_DEVICE_LEVEL:
+		virtio_gpio_prepare_inbuf(priv);
+		virtio_gpio_signal(priv, ev->type, ev->pin, ev->value);
+		break;
+	default:
+		wakeup_event(priv, ev->type & ~VIRTIO_GPIO_MSG_REPLY);
+		break;
+	}
+
+	wake_up_all(&priv->waitq);
+
+	devm_kfree(&priv->vdev->dev, data);
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
+	ret = virtio_gpio_prepare_inbuf(priv);
+	if (ret) {
+		dev_err(&priv->vdev->dev, "preparing inbuf failed\n");
+		return ret;
+	}
+
+	virtqueue_enable_cb(priv->vq_rx);
+	virtio_device_ready(priv->vdev);
+
+	return 0;
+}
+
+static void virtio_gpio_irq_unmask(struct irq_data *irq)
+{
+	int hwirq = irqd_to_hwirq(irq);
+	struct virtio_gpio_priv *priv
+		= gpiochip_get_data(irq_data_get_irq_chip_data(irq));
+	if (hwirq < CONFIG_VIRTIO_GPIO_MAX_IRQ)
+		set_bit(hwirq, priv->irq_mask);
+}
+
+static void virtio_gpio_irq_mask(struct irq_data *irq)
+{
+	int hwirq = irqd_to_hwirq(irq);
+	struct virtio_gpio_priv *priv
+		= gpiochip_get_data(irq_data_get_irq_chip_data(irq));
+	if (hwirq < CONFIG_VIRTIO_GPIO_MAX_IRQ)
+		clear_bit(hwirq, priv->irq_mask);
+}
+
+static int virtio_gpio_probe(struct virtio_device *vdev)
+{
+	struct virtio_gpio_priv *priv;
+	struct virtio_gpio_config cf = {};
+	char *name_buffer;
+	const char **gpio_names = NULL;
+	struct device *dev = &vdev->dev;
+	struct gpio_irq_chip *girq;
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
+	mutex_init(&priv->rpc_mutex);
+
+	virtio_cread_le(vdev, struct virtio_gpio_config, version, &cf.version);
+	virtio_cread_le(vdev, struct virtio_gpio_config, num_gpios,
+			&cf.num_gpios);
+	virtio_cread_le(vdev, struct virtio_gpio_config, names_size,
+			&cf.names_size);
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
+	priv->vdev			= vdev;
+	vdev->priv = priv;
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
+	priv->gc.can_sleep		= true;
+
+	priv->irq_chip.name		= "virtio-gpio-irq";
+	priv->irq_chip.irq_mask		= virtio_gpio_irq_mask;
+	priv->irq_chip.irq_unmask	= virtio_gpio_irq_unmask;
+
+	girq = &priv->gc.irq;
+
+	priv->gc.irq.chip		= &priv->irq_chip;
+	priv->gc.irq.num_parents	= 1;
+	priv->gc.irq.default_type	= IRQ_TYPE_NONE;
+	priv->gc.irq.handler		= handle_simple_irq;
+	priv->gc.irq.parents		= &priv->irq_parents;
+	priv->irq_parents		= 0;
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
+	/* just dummy, virtio subsys can't cope w/ NULL vector */
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
index 000000000000..5b90acae6c85
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
+enum virtio_gpio_msg_type {
+	// requests from cpu to device
+	VIRTIO_GPIO_MSG_CPU_REQUEST		= 0x01,
+	VIRTIO_GPIO_MSG_CPU_DIRECTION_INPUT	= 0x02,
+	VIRTIO_GPIO_MSG_CPU_DIRECTION_OUTPUT	= 0x03,
+	VIRTIO_GPIO_MSG_CPU_GET_DIRECTION	= 0x04,
+	VIRTIO_GPIO_MSG_CPU_GET_LEVEL		= 0x05,
+	VIRTIO_GPIO_MSG_CPU_SET_LEVEL		= 0x06,
+
+	// messages from host to guest
+	VIRTIO_GPIO_MSG_DEVICE_LEVEL		= 0x11,	// gpio state changed
+
+	/* mask bit set on host->guest reply */
+	VIRTIO_GPIO_MSG_REPLY			= 0x8000,
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
+struct virtio_gpio_msg {
+	__le16 type;
+	__le16 pin;
+	__le32 value;
+};
+
+#endif /* _LINUX_VIRTIO_GPIO_H */
diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
index 4fe842c3a3a9..0c9bac389ce0 100644
--- a/include/uapi/linux/virtio_ids.h
+++ b/include/uapi/linux/virtio_ids.h
@@ -56,5 +56,6 @@
 #define VIRTIO_ID_PMEM			27 /* virtio pmem */
 #define VIRTIO_ID_MAC80211_HWSIM	29 /* virtio mac80211-hwsim */
 #define VIRTIO_ID_BT			40 /* virtio bluetooth */
+#define VIRTIO_ID_GPIO			41 /* virtio GPIO */
 
 #endif /* _LINUX_VIRTIO_IDS_H */
-- 
2.20.1

