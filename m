Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 126C03F1287
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Aug 2021 06:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbhHSEbE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Aug 2021 00:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbhHSEbD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Aug 2021 00:31:03 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32B13C061764
        for <linux-gpio@vger.kernel.org>; Wed, 18 Aug 2021 21:30:28 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id t1so4667975pgv.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Aug 2021 21:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ezel1uJkrVdlsxVO2Ll2nRpoFYtjCFprS2qC0VSLB1o=;
        b=xO4caQgHHVe0HciB6vmGtOGDQSAL2YJcCUulWReScCxo3mvzvRFOHaBtqk4WTNfICk
         2KEGHi0jcid6pKbVpFkJoZt1QbRqiRVjmf/YrRsVdwmWG4VDT39ioLgeL1/OBTCSGv8h
         FqmHDXuyNhByc+gJ4UKaQMhlfy514ooPQfFkl/kQnmnmhr3pec2uKsQpAad/JD6U4wfT
         I+Wbno+CkIZNeBtQ4cWpq4OsYZaz+eV52oaclTQwXBsFj0IB/RLJdOXeCSGtI/huHE18
         r1tNvRqwXdWelxEFTToBFbediy1MxGbOND2HEoFesHCQlaW66TnT6/ACpIVxW23jVLNA
         syqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ezel1uJkrVdlsxVO2Ll2nRpoFYtjCFprS2qC0VSLB1o=;
        b=NhzmUym8agHSHFYajicKfiGVyGS4habr0vnHBdlr8h4R9NcfFDWH9bH5coyEU2rp6u
         5xes2/ZYU9SNbdoSFN4l0kfH6v0NWy4dK4Z89iVb5pX/P8WhJCGSZN/2fUSMPPx5KXki
         USUCYqd1j4zA6R7ebHfidKNEvwpPUct7xKVch5tod4T1vRPmwaK8g36oaQ7fpyMlQffB
         S/aJB1sEWhPD8bXisg7r7SzuKe+1VayxyiAnK82O+2TqMNsFCpudkXpZJslY4y9v56nz
         206MNrz0kSB2b4Ca3sW6mjXEQFleO8l5nXnBlgoGdzPTtU+gvzfH7mbMAGR+mm/jHCAp
         zFIA==
X-Gm-Message-State: AOAM5319yjBJtne8LrA3fH2Fgl9aEHlGQjI1yXDNdpg9ApGn1PHjWfZY
        VVwPMIxPZkJtmKLHPbYtbNZ9Qg==
X-Google-Smtp-Source: ABdhPJyAPAiW+oWSg/gJ+wYcJE4b9+2+UrfUzJ1Nd6lKBQqAL5H/F/iRVyb5JDBOF4OBFMV4Liaccw==
X-Received: by 2002:a63:150e:: with SMTP id v14mr12345789pgl.126.1629347427659;
        Wed, 18 Aug 2021 21:30:27 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id j21sm1418627pfn.75.2021.08.18.21.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 21:30:27 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        stratos-dev@op-lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: [PATCH V7] gpio: Add virtio-gpio driver
Date:   Thu, 19 Aug 2021 10:00:22 +0530
Message-Id: <56ca9b1fc803e393a67e875bed4f900c6a432085.1629347189.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds a new driver for Virtio based GPIO devices.

This allows a guest VM running Linux to access GPIO lines provided by
the host. It supports all basic operations, except interrupts for the
GPIO lines.

Based on the initial work posted by:
"Enrico Weigelt, metux IT consult" <lkml@metux.net>.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
Bartosz,

Can you please pick this up for 5.15, the specification is already merged now:

https://github.com/oasis-tcs/virtio-spec/blob/master/virtio-gpio.tex

I will follow up with the IRQ stuff separately.

V6->V7:
- Fixed a coccinelle warning.

V5->V6:
- Sent separately, without irq-support.
- Include the change for virtio_ids.h.

 MAINTAINERS                      |   7 +
 drivers/gpio/Kconfig             |   9 +
 drivers/gpio/Makefile            |   1 +
 drivers/gpio/gpio-virtio.c       | 375 +++++++++++++++++++++++++++++++
 include/uapi/linux/virtio_gpio.h |  47 ++++
 include/uapi/linux/virtio_ids.h  |   1 +
 6 files changed, 440 insertions(+)
 create mode 100644 drivers/gpio/gpio-virtio.c
 create mode 100644 include/uapi/linux/virtio_gpio.h

diff --git a/MAINTAINERS b/MAINTAINERS
index a61f4f3b78a9..f632acd7d98c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19647,6 +19647,13 @@ F:	Documentation/filesystems/virtiofs.rst
 F:	fs/fuse/virtio_fs.c
 F:	include/uapi/linux/virtio_fs.h
 
+VIRTIO GPIO DRIVER
+M:	Enrico Weigelt, metux IT consult <info@metux.net>
+M:	Viresh Kumar <vireshk@kernel.org>
+S:	Maintained
+F:	drivers/gpio/gpio-virtio.c
+F:	include/uapi/linux/virtio_gpio.h
+
 VIRTIO GPU DRIVER
 M:	David Airlie <airlied@linux.ie>
 M:	Gerd Hoffmann <kraxel@redhat.com>
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index fab571016adf..e5993d6864fb 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1669,6 +1669,15 @@ config GPIO_MOCKUP
 	  tools/testing/selftests/gpio/gpio-mockup.sh. Reference the usage in
 	  it.
 
+config GPIO_VIRTIO
+	tristate "VirtIO GPIO support"
+	depends on VIRTIO
+	help
+	  Say Y here to enable guest support for virtio-based GPIO controllers.
+
+	  These virtual GPIOs can be routed to real GPIOs or attached to
+	  simulators on the host (like QEMU).
+
 endmenu
 
 endif
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 32a32659866a..e0301cfedd8d 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -165,6 +165,7 @@ obj-$(CONFIG_GPIO_UCB1400)		+= gpio-ucb1400.o
 obj-$(CONFIG_GPIO_UNIPHIER)		+= gpio-uniphier.o
 obj-$(CONFIG_GPIO_VF610)		+= gpio-vf610.o
 obj-$(CONFIG_GPIO_VIPERBOARD)		+= gpio-viperboard.o
+obj-$(CONFIG_GPIO_VIRTIO)		+= gpio-virtio.o
 obj-$(CONFIG_GPIO_VISCONTI)		+= gpio-visconti.o
 obj-$(CONFIG_GPIO_VR41XX)		+= gpio-vr41xx.o
 obj-$(CONFIG_GPIO_VX855)		+= gpio-vx855.o
diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
new file mode 100644
index 000000000000..d33eb237c0b9
--- /dev/null
+++ b/drivers/gpio/gpio-virtio.c
@@ -0,0 +1,375 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * GPIO driver for virtio-based virtual GPIO controllers
+ *
+ * Copyright (C) 2021 metux IT consult
+ * Enrico Weigelt, metux IT consult <info@metux.net>
+ *
+ * Copyright (C) 2021 Linaro.
+ * Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+#include <linux/completion.h>
+#include <linux/err.h>
+#include <linux/gpio/driver.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/virtio_config.h>
+#include <uapi/linux/virtio_gpio.h>
+#include <uapi/linux/virtio_ids.h>
+
+struct virtio_gpio_line {
+	struct mutex lock; /* Protects line operation */
+	struct completion completion;
+	struct virtio_gpio_request req ____cacheline_aligned;
+	struct virtio_gpio_response res ____cacheline_aligned;
+	unsigned int rxlen;
+};
+
+struct virtio_gpio {
+	struct virtio_device *vdev;
+	struct mutex lock; /* Protects virtqueue operation */
+	struct gpio_chip gc;
+	struct virtio_gpio_config config;
+	struct virtio_gpio_line *lines;
+	struct virtqueue *request_vq;
+};
+
+static int _virtio_gpio_req(struct virtio_gpio *vgpio, u16 type, u16 gpio,
+			    u8 txvalue, u8 *rxvalue, void *response, u32 rxlen)
+{
+	struct virtio_gpio_line *line = &vgpio->lines[gpio];
+	struct virtio_gpio_request *req = &line->req;
+	struct virtio_gpio_response *res = response;
+	struct scatterlist *sgs[2], req_sg, res_sg;
+	struct device *dev = &vgpio->vdev->dev;
+	int ret;
+
+	/*
+	 * Prevent concurrent requests for the same line since we have
+	 * pre-allocated request/response buffers for each GPIO line. Moreover
+	 * Linux always accesses a GPIO line sequentially, so this locking shall
+	 * always go through without any delays.
+	 */
+	mutex_lock(&line->lock);
+
+	req->type = cpu_to_le16(type);
+	req->gpio = cpu_to_le16(gpio);
+	req->value = txvalue;
+
+	sg_init_one(&req_sg, req, sizeof(*req));
+	sg_init_one(&res_sg, res, rxlen);
+	sgs[0] = &req_sg;
+	sgs[1] = &res_sg;
+
+	line->rxlen = 0;
+	reinit_completion(&line->completion);
+
+	/*
+	 * Virtqueue callers need to ensure they don't call its APIs with other
+	 * virtqueue operations at the same time.
+	 */
+	mutex_lock(&vgpio->lock);
+	ret = virtqueue_add_sgs(vgpio->request_vq, sgs, 1, 1, line, GFP_KERNEL);
+	if (ret) {
+		dev_err(dev, "failed to add request to vq\n");
+		mutex_unlock(&vgpio->lock);
+		goto out;
+	}
+
+	virtqueue_kick(vgpio->request_vq);
+	mutex_unlock(&vgpio->lock);
+
+	if (!wait_for_completion_timeout(&line->completion, HZ)) {
+		dev_err(dev, "GPIO operation timed out\n");
+		ret = -ETIMEDOUT;
+		goto out;
+	}
+
+	if (unlikely(res->status != VIRTIO_GPIO_STATUS_OK)) {
+		dev_err(dev, "GPIO request failed: %d\n", gpio);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (unlikely(line->rxlen != rxlen)) {
+		dev_err(dev, "GPIO operation returned incorrect len (%u : %u)\n",
+			rxlen, line->rxlen);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (rxvalue)
+		*rxvalue = res->value;
+
+out:
+	mutex_unlock(&line->lock);
+	return ret;
+}
+
+static int virtio_gpio_req(struct virtio_gpio *vgpio, u16 type, u16 gpio,
+			   u8 txvalue, u8 *rxvalue)
+{
+	struct virtio_gpio_line *line = &vgpio->lines[gpio];
+	struct virtio_gpio_response *res = &line->res;
+
+	return _virtio_gpio_req(vgpio, type, gpio, txvalue, rxvalue, res,
+				sizeof(*res));
+}
+
+static void virtio_gpio_free(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct virtio_gpio *vgpio = gpiochip_get_data(gc);
+
+	virtio_gpio_req(vgpio, VIRTIO_GPIO_MSG_SET_DIRECTION, gpio,
+			VIRTIO_GPIO_DIRECTION_NONE, NULL);
+}
+
+static int virtio_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct virtio_gpio *vgpio = gpiochip_get_data(gc);
+	u8 direction;
+	int ret;
+
+	ret = virtio_gpio_req(vgpio, VIRTIO_GPIO_MSG_GET_DIRECTION, gpio, 0,
+			      &direction);
+	if (ret)
+		return ret;
+
+	switch (direction) {
+	case VIRTIO_GPIO_DIRECTION_IN:
+		return GPIO_LINE_DIRECTION_IN;
+	case VIRTIO_GPIO_DIRECTION_OUT:
+		return GPIO_LINE_DIRECTION_OUT;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int virtio_gpio_direction_input(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct virtio_gpio *vgpio = gpiochip_get_data(gc);
+
+	return virtio_gpio_req(vgpio, VIRTIO_GPIO_MSG_SET_DIRECTION, gpio,
+			       VIRTIO_GPIO_DIRECTION_IN, NULL);
+}
+
+static int virtio_gpio_direction_output(struct gpio_chip *gc, unsigned int gpio,
+					int value)
+{
+	struct virtio_gpio *vgpio = gpiochip_get_data(gc);
+	int ret;
+
+	ret = virtio_gpio_req(vgpio, VIRTIO_GPIO_MSG_SET_VALUE, gpio, value, NULL);
+	if (ret)
+		return ret;
+
+	return virtio_gpio_req(vgpio, VIRTIO_GPIO_MSG_SET_DIRECTION, gpio,
+			       VIRTIO_GPIO_DIRECTION_OUT, NULL);
+}
+
+static int virtio_gpio_get(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct virtio_gpio *vgpio = gpiochip_get_data(gc);
+	u8 value;
+	int ret;
+
+	ret = virtio_gpio_req(vgpio, VIRTIO_GPIO_MSG_GET_VALUE, gpio, 0, &value);
+	return ret ? ret : value;
+}
+
+static void virtio_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
+{
+	struct virtio_gpio *vgpio = gpiochip_get_data(gc);
+
+	virtio_gpio_req(vgpio, VIRTIO_GPIO_MSG_SET_VALUE, gpio, value, NULL);
+}
+
+static void virtio_gpio_request_vq(struct virtqueue *vq)
+{
+	struct virtio_gpio_line *line;
+	unsigned int len;
+
+	do {
+		line = virtqueue_get_buf(vq, &len);
+		if (!line)
+			return;
+
+		line->rxlen = len;
+		complete(&line->completion);
+	} while (1);
+}
+
+static void virtio_gpio_free_vqs(struct virtio_device *vdev)
+{
+	vdev->config->reset(vdev);
+	vdev->config->del_vqs(vdev);
+}
+
+static int virtio_gpio_alloc_vqs(struct virtio_gpio *vgpio,
+				 struct virtio_device *vdev)
+{
+	const char * const names[] = { "requestq" };
+	vq_callback_t *cbs[] = {
+		virtio_gpio_request_vq,
+	};
+	struct virtqueue *vqs[1] = { NULL };
+	int ret;
+
+	ret = virtio_find_vqs(vdev, 1, vqs, cbs, names, NULL);
+	if (ret) {
+		dev_err(&vdev->dev, "failed to find vqs: %d\n", ret);
+		return ret;
+	}
+
+	if (!vqs[0]) {
+		dev_err(&vdev->dev, "failed to find requestq vq\n");
+		return -ENODEV;
+	}
+	vgpio->request_vq = vqs[0];
+
+	return 0;
+}
+
+static const char **virtio_gpio_get_names(struct virtio_gpio *vgpio)
+{
+	struct virtio_gpio_config *config = &vgpio->config;
+	struct virtio_gpio_response_get_names *res;
+	struct device *dev = &vgpio->vdev->dev;
+	u8 *gpio_names, *str;
+	const char **names;
+	int i, ret, len;
+
+	if (!config->gpio_names_size)
+		return NULL;
+
+	len = sizeof(*res) + config->gpio_names_size;
+	res = devm_kzalloc(dev, len, GFP_KERNEL);
+	if (!res)
+		return NULL;
+	gpio_names = res->value;
+
+	ret = _virtio_gpio_req(vgpio, VIRTIO_GPIO_MSG_GET_NAMES, 0, 0, NULL,
+			       res, len);
+	if (ret) {
+		dev_err(dev, "Failed to get GPIO names: %d\n", ret);
+		return NULL;
+	}
+
+	names = devm_kcalloc(dev, config->ngpio, sizeof(*names), GFP_KERNEL);
+	if (!names)
+		return NULL;
+
+	/* NULL terminate the string instead of checking it */
+	gpio_names[config->gpio_names_size - 1] = '\0';
+
+	for (i = 0, str = gpio_names; i < config->ngpio; i++) {
+		names[i] = str;
+		str += strlen(str) + 1; /* zero-length strings are allowed */
+
+		if (str > gpio_names + config->gpio_names_size) {
+			dev_err(dev, "gpio_names block is too short (%d)\n", i);
+			return NULL;
+		}
+	}
+
+	return names;
+}
+
+static int virtio_gpio_probe(struct virtio_device *vdev)
+{
+	struct virtio_gpio_config *config;
+	struct device *dev = &vdev->dev;
+	struct virtio_gpio *vgpio;
+	int ret, i;
+
+	vgpio = devm_kzalloc(dev, sizeof(*vgpio), GFP_KERNEL);
+	if (!vgpio)
+		return -ENOMEM;
+
+	config = &vgpio->config;
+
+	/* Read configuration */
+	virtio_cread_bytes(vdev, 0, config, sizeof(*config));
+	config->gpio_names_size = le32_to_cpu(config->gpio_names_size);
+	config->ngpio = le16_to_cpu(config->ngpio);
+	if (!config->ngpio) {
+		dev_err(dev, "Number of GPIOs can't be zero\n");
+		return -EINVAL;
+	}
+
+	vgpio->lines = devm_kcalloc(dev, config->ngpio, sizeof(*vgpio->lines), GFP_KERNEL);
+	if (!vgpio->lines)
+		return -ENOMEM;
+
+	for (i = 0; i < config->ngpio; i++) {
+		mutex_init(&vgpio->lines[i].lock);
+		init_completion(&vgpio->lines[i].completion);
+	}
+
+	mutex_init(&vgpio->lock);
+	vdev->priv = vgpio;
+
+	vgpio->vdev			= vdev;
+	vgpio->gc.free			= virtio_gpio_free;
+	vgpio->gc.get_direction		= virtio_gpio_get_direction;
+	vgpio->gc.direction_input	= virtio_gpio_direction_input;
+	vgpio->gc.direction_output	= virtio_gpio_direction_output;
+	vgpio->gc.get			= virtio_gpio_get;
+	vgpio->gc.set			= virtio_gpio_set;
+	vgpio->gc.ngpio			= config->ngpio;
+	vgpio->gc.base			= -1; /* Allocate base dynamically */
+	vgpio->gc.label			= dev_name(dev);
+	vgpio->gc.parent		= dev;
+	vgpio->gc.owner			= THIS_MODULE;
+	vgpio->gc.can_sleep		= true;
+
+	ret = virtio_gpio_alloc_vqs(vgpio, vdev);
+	if (ret)
+		return ret;
+
+	/* Mark the device ready to perform operations from within probe() */
+	virtio_device_ready(vdev);
+
+	vgpio->gc.names = virtio_gpio_get_names(vgpio);
+
+	ret = gpiochip_add_data(&vgpio->gc, vgpio);
+	if (ret) {
+		virtio_gpio_free_vqs(vdev);
+		dev_err(dev, "Failed to add virtio-gpio controller\n");
+	}
+
+	return ret;
+}
+
+static void virtio_gpio_remove(struct virtio_device *vdev)
+{
+	struct virtio_gpio *vgpio = vdev->priv;
+
+	gpiochip_remove(&vgpio->gc);
+	virtio_gpio_free_vqs(vdev);
+}
+
+static const struct virtio_device_id id_table[] = {
+	{ VIRTIO_ID_GPIO, VIRTIO_DEV_ANY_ID },
+	{},
+};
+MODULE_DEVICE_TABLE(virtio, id_table);
+
+static struct virtio_driver virtio_gpio_driver = {
+	.id_table		= id_table,
+	.probe			= virtio_gpio_probe,
+	.remove			= virtio_gpio_remove,
+	.driver			= {
+		.name		= KBUILD_MODNAME,
+		.owner		= THIS_MODULE,
+	},
+};
+module_virtio_driver(virtio_gpio_driver);
+
+MODULE_AUTHOR("Enrico Weigelt, metux IT consult <info@metux.net>");
+MODULE_AUTHOR("Viresh Kumar <viresh.kumar@linaro.org>");
+MODULE_DESCRIPTION("VirtIO GPIO driver");
+MODULE_LICENSE("GPL");
diff --git a/include/uapi/linux/virtio_gpio.h b/include/uapi/linux/virtio_gpio.h
new file mode 100644
index 000000000000..844574acf095
--- /dev/null
+++ b/include/uapi/linux/virtio_gpio.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+#ifndef _LINUX_VIRTIO_GPIO_H
+#define _LINUX_VIRTIO_GPIO_H
+
+#include <linux/types.h>
+
+/* Virtio GPIO request types */
+#define VIRTIO_GPIO_MSG_GET_NAMES		0x0001
+#define VIRTIO_GPIO_MSG_GET_DIRECTION		0x0002
+#define VIRTIO_GPIO_MSG_SET_DIRECTION		0x0003
+#define VIRTIO_GPIO_MSG_GET_VALUE		0x0004
+#define VIRTIO_GPIO_MSG_SET_VALUE		0x0005
+
+/* Possible values of the status field */
+#define VIRTIO_GPIO_STATUS_OK			0x0
+#define VIRTIO_GPIO_STATUS_ERR			0x1
+
+/* Direction types */
+#define VIRTIO_GPIO_DIRECTION_NONE		0x00
+#define VIRTIO_GPIO_DIRECTION_OUT		0x01
+#define VIRTIO_GPIO_DIRECTION_IN		0x02
+
+struct virtio_gpio_config {
+	__u16 ngpio;
+	__u8 padding[2];
+	__u32 gpio_names_size;
+} __packed;
+
+/* Virtio GPIO Request / Response */
+struct virtio_gpio_request {
+	__u16 type;
+	__u16 gpio;
+	__u32 value;
+};
+
+struct virtio_gpio_response {
+	__u8 status;
+	__u8 value;
+};
+
+struct virtio_gpio_response_get_names {
+	__u8 status;
+	__u8 value[];
+};
+
+#endif /* _LINUX_VIRTIO_GPIO_H */
diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
index 70a8057ad4bb..e04fa2bfc0eb 100644
--- a/include/uapi/linux/virtio_ids.h
+++ b/include/uapi/linux/virtio_ids.h
@@ -56,6 +56,7 @@
 #define VIRTIO_ID_PMEM			27 /* virtio pmem */
 #define VIRTIO_ID_MAC80211_HWSIM	29 /* virtio mac80211-hwsim */
 #define VIRTIO_ID_BT			40 /* virtio bluetooth */
+#define VIRTIO_ID_GPIO			41 /* virtio gpio */
 
 /*
  * Virtio Transitional IDs
-- 
2.31.1.272.g89b43f80a514

