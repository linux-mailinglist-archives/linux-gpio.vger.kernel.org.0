Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7F23A2B4D
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jun 2021 14:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbhFJMTf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 08:19:35 -0400
Received: from mail-pl1-f180.google.com ([209.85.214.180]:35463 "EHLO
        mail-pl1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbhFJMTe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 08:19:34 -0400
Received: by mail-pl1-f180.google.com with SMTP id x19so917431pln.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jun 2021 05:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wOu3fDG+mFoQYcon/7H3S12nd7R/QAMh1wpiZegcxiw=;
        b=rRdA3EI31LXvnOC+g6aCM6DuO0S2PmQp7rld4OmfNnfkRQYt5aXM5niEdn4EuLPn4/
         CazA3pRWpK7Mp4DFm3IhRJHyhVGPTG+pjfstJyxs2bfcQQ2qKV1Rj8iPUgAek0gWNnqX
         nAsQVH5Y/FUtRGKLScrhSsA17hbYgMsmDOZH7wwNBlY3asySna88wdc1VPv8gAZ19hAf
         RDb0R0BFQhonAN31caUKp9BjXMcWGN690vFEXEJMtxiPB95XXatF1V7s6GLVQ2JnqWu5
         Bn6hEd6o6kfjTM+/Lpd1pvuCWEfT4KMIF55SQa3/rlJfHTxdB2bTHy6DA1rMV4eHnt4D
         U6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wOu3fDG+mFoQYcon/7H3S12nd7R/QAMh1wpiZegcxiw=;
        b=n3d5lrfS/N3qW8NOyDBjVF4obwD2Pz8Talh2uU6KU5ldljm6jxfy5LQOzJxTKSUh37
         FuVahvWhjvLp2PeEB09MRI4S36TmqnIDZIyuY03P8DI9C0f3YJC+l2NSoT56qXGlxKRT
         nBzWPYTTwDfuQZd9LyomR4eqbfaLoZxBsDTKpRNsyWcr2AKqnRaUpBSdlpdsqEqUQXPt
         oNtFP2BdBUfgzwqe8PYv4gCFdYOXMv15V70Zoq2VDkzTg6QFEZHsqXSu3d3RgVRxxwSv
         S1YapZlup1xbh6biMfJZ3I07D7n/u6uu0C7rOucAZPo8eSwVQdixJbNICycL9cwrTChB
         +cEg==
X-Gm-Message-State: AOAM530CYZ42LfhMieiQKOzoROUnlQWVcAjbP9KY0joU0fy4T0/35vd9
        7m284wqj14b5UWRu1+4qGsSDfg==
X-Google-Smtp-Source: ABdhPJyCSGKmtTnZqbuXMjPjzsWE3+hnB+b0w2VauqA1bWDMsis5W3vEtGjU9EKzYfZVIE/WfAN4cw==
X-Received: by 2002:a17:90b:4f44:: with SMTP id pj4mr3029377pjb.97.1623327398442;
        Thu, 10 Jun 2021 05:16:38 -0700 (PDT)
Received: from localhost ([136.185.169.128])
        by smtp.gmail.com with ESMTPSA id kb14sm1720723pjb.2.2021.06.10.05.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 05:16:37 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Stefano Garzarella --cc virtualization @ lists . linux-foundation . org" 
        <sgarzare@redhat.com>, virtualization@lists.linux-foundation.org
Subject: [PATCH V3 1/3] gpio: Add virtio-gpio driver
Date:   Thu, 10 Jun 2021 17:46:32 +0530
Message-Id: <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1623326176.git.viresh.kumar@linaro.org>
References: <cover.1623326176.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: "Enrico Weigelt, metux IT consult" <info@metux.net>

This patch adds a new driver for Virtio based GPIO devices.

This allows a guest VM running Linux to access GPIO device provided by
the host. It supports all basic operations for now, except interrupts
for the GPIO lines.

Signed-off-by: "Enrico Weigelt, metux IT consult" <info@metux.net>
Co-developed-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/gpio/Kconfig             |   9 +
 drivers/gpio/Makefile            |   1 +
 drivers/gpio/gpio-virtio.c       | 326 +++++++++++++++++++++++++++++++
 include/uapi/linux/virtio_gpio.h |  41 ++++
 include/uapi/linux/virtio_ids.h  |   1 +
 5 files changed, 378 insertions(+)
 create mode 100644 drivers/gpio/gpio-virtio.c
 create mode 100644 include/uapi/linux/virtio_gpio.h

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e3607ec4c2e8..7f12fb65d130 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1633,6 +1633,15 @@ config GPIO_MOCKUP
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
index c58a90a3c3b1..ace004c80871 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -162,6 +162,7 @@ obj-$(CONFIG_GPIO_UCB1400)		+= gpio-ucb1400.o
 obj-$(CONFIG_GPIO_UNIPHIER)		+= gpio-uniphier.o
 obj-$(CONFIG_GPIO_VF610)		+= gpio-vf610.o
 obj-$(CONFIG_GPIO_VIPERBOARD)		+= gpio-viperboard.o
+obj-$(CONFIG_GPIO_VIRTIO)		+= gpio-virtio.o
 obj-$(CONFIG_GPIO_VISCONTI)		+= gpio-visconti.o
 obj-$(CONFIG_GPIO_VR41XX)		+= gpio-vr41xx.o
 obj-$(CONFIG_GPIO_VX855)		+= gpio-vx855.o
diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
new file mode 100644
index 000000000000..1ba8ddf4693a
--- /dev/null
+++ b/drivers/gpio/gpio-virtio.c
@@ -0,0 +1,326 @@
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
+struct virtio_gpio {
+	struct virtio_device *vdev;
+	struct mutex lock;
+	struct gpio_chip gc;
+
+	struct completion completion;
+	struct virtqueue *command_vq;
+	struct virtio_gpio_request creq;
+	struct virtio_gpio_response cres;
+
+	/* This must be kept as the last entry here, hint: gpio_names[0] */
+	struct virtio_gpio_config config;
+};
+
+#define gpio_chip_to_vgpio(chip) container_of(chip, struct virtio_gpio, gc)
+
+static int virtio_gpio_req(struct virtio_gpio *vgpio, u16 type, u16 gpio,
+			   u8 txdata, u8 *rxdata)
+{
+	struct virtio_gpio_response *res = &vgpio->cres;
+	struct virtio_gpio_request *req = &vgpio->creq;
+	struct scatterlist *sgs[2], req_sg, res_sg;
+	struct device *dev = &vgpio->vdev->dev;
+	unsigned long time_left;
+	unsigned int len;
+	int ret;
+
+	req->type = cpu_to_le16(type);
+	req->gpio = cpu_to_le16(gpio);
+	req->data = txdata;
+
+	sg_init_one(&req_sg, req, sizeof(*req));
+	sg_init_one(&res_sg, res, sizeof(*res));
+	sgs[0] = &req_sg;
+	sgs[1] = &res_sg;
+
+	mutex_lock(&vgpio->lock);
+	ret = virtqueue_add_sgs(vgpio->command_vq, sgs, 1, 1, res, GFP_KERNEL);
+	if (ret) {
+		dev_err(dev, "failed to add request to vq\n");
+		goto out;
+	}
+
+	reinit_completion(&vgpio->completion);
+	virtqueue_kick(vgpio->command_vq);
+
+	time_left = wait_for_completion_timeout(&vgpio->completion, HZ / 10);
+	if (!time_left) {
+		dev_err(dev, "virtio GPIO backend timeout\n");
+		return -ETIMEDOUT;
+	}
+
+	WARN_ON(res != virtqueue_get_buf(vgpio->command_vq, &len));
+	if (unlikely(res->status != VIRTIO_GPIO_STATUS_OK)) {
+		dev_err(dev, "virtio GPIO request failed: %d\n", gpio);
+		return -EINVAL;
+	}
+
+	if (rxdata)
+		*rxdata = res->data;
+
+out:
+	mutex_unlock(&vgpio->lock);
+
+	return ret;
+}
+
+static int virtio_gpio_request(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct virtio_gpio *vgpio = gpio_chip_to_vgpio(gc);
+
+	return virtio_gpio_req(vgpio, VIRTIO_GPIO_REQ_ACTIVATE, gpio, 0, NULL);
+}
+
+static void virtio_gpio_free(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct virtio_gpio *vgpio = gpio_chip_to_vgpio(gc);
+
+	virtio_gpio_req(vgpio, VIRTIO_GPIO_REQ_DEACTIVATE, gpio, 0, NULL);
+}
+
+static int virtio_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct virtio_gpio *vgpio = gpio_chip_to_vgpio(gc);
+	u8 direction;
+	int ret;
+
+	ret = virtio_gpio_req(vgpio, VIRTIO_GPIO_REQ_GET_DIRECTION, gpio, 0,
+			      &direction);
+	if (ret)
+		return ret;
+
+	return direction;
+}
+
+static int virtio_gpio_direction_input(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct virtio_gpio *vgpio = gpio_chip_to_vgpio(gc);
+
+	return virtio_gpio_req(vgpio, VIRTIO_GPIO_REQ_DIRECTION_IN, gpio, 0,
+			       NULL);
+}
+
+static int virtio_gpio_direction_output(struct gpio_chip *gc, unsigned int gpio,
+					int value)
+{
+	struct virtio_gpio *vgpio = gpio_chip_to_vgpio(gc);
+
+	return virtio_gpio_req(vgpio, VIRTIO_GPIO_REQ_DIRECTION_OUT, gpio, (u8)
+			       value, NULL);
+}
+
+static int virtio_gpio_get(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct virtio_gpio *vgpio = gpio_chip_to_vgpio(gc);
+	u8 value;
+	int ret;
+
+	ret = virtio_gpio_req(vgpio, VIRTIO_GPIO_REQ_GET_VALUE, gpio, 0, &value);
+	if (ret)
+		return ret;
+
+	return value;
+}
+
+static void virtio_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
+{
+	struct virtio_gpio *vgpio = gpio_chip_to_vgpio(gc);
+
+	virtio_gpio_req(vgpio, VIRTIO_GPIO_REQ_SET_VALUE, gpio, value, NULL);
+}
+
+static void virtio_gpio_command(struct virtqueue *vq)
+{
+	struct virtio_gpio *vgpio = vq->vdev->priv;
+
+	complete(&vgpio->completion);
+}
+
+static int virtio_gpio_alloc_vqs(struct virtio_device *vdev)
+{
+	struct virtio_gpio *vgpio = vdev->priv;
+	const char * const names[] = { "command" };
+	vq_callback_t *cbs[] = {
+		virtio_gpio_command,
+	};
+	struct virtqueue *vqs[1] = {NULL};
+	int ret;
+
+	ret = virtio_find_vqs(vdev, 1, vqs, cbs, names, NULL);
+	if (ret) {
+		dev_err(&vdev->dev, "failed to allocate vqs: %d\n", ret);
+		return ret;
+	}
+
+	vgpio->command_vq = vqs[0];
+
+	/* Mark the device ready to perform operations from within probe() */
+	virtio_device_ready(vgpio->vdev);
+	return 0;
+}
+
+static void virtio_gpio_free_vqs(struct virtio_device *vdev)
+{
+	vdev->config->reset(vdev);
+	vdev->config->del_vqs(vdev);
+}
+
+static const char **parse_gpio_names(struct virtio_device *vdev,
+			       struct virtio_gpio_config *config)
+{
+	struct device *dev = &vdev->dev;
+	char *str = config->gpio_names;
+	const char **names;
+	int i, len;
+
+	if (!config->gpio_names_size)
+		return NULL;
+
+	names = devm_kcalloc(dev, config->ngpio, sizeof(names), GFP_KERNEL);
+	if (!names)
+		return ERR_PTR(-ENOMEM);
+
+	/* NULL terminate the string instead of checking it */
+	config->gpio_names[config->gpio_names_size - 1] = '\0';
+
+	for (i = 0; i < config->ngpio; i++) {
+		/*
+		 * We have already marked the last byte with '\0'
+		 * earlier, this shall be enough here.
+		 */
+		if (str == config->gpio_names + config->gpio_names_size) {
+			dev_err(dev, "Invalid gpio_names\n");
+			return ERR_PTR(-EINVAL);
+		}
+
+		len = strlen(str);
+		if (!len) {
+			dev_err(dev, "Missing GPIO name: %d\n", i);
+			return ERR_PTR(-EINVAL);
+		}
+
+		names[i] = str;
+		str += len + 1;
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
+	u32 size;
+	int ret;
+
+	virtio_cread(vdev, struct virtio_gpio_config, gpio_names_size, &size);
+	size = cpu_to_le32(size);
+
+	vgpio = devm_kzalloc(dev, sizeof(*vgpio) + size, GFP_KERNEL);
+	if (!vgpio)
+		return -ENOMEM;
+
+	config = &vgpio->config;
+
+	/* Read configuration */
+	virtio_cread_bytes(vdev, 0, config, sizeof(*config) + size);
+
+	/* NULL terminate the string instead of checking it */
+	config->name[sizeof(config->name) - 1] = '\0';
+	config->ngpio = cpu_to_le16(config->ngpio);
+	config->gpio_names_size = cpu_to_le32(config->gpio_names_size);
+
+	if (!config->ngpio) {
+		dev_err(dev, "Number of GPIOs can't be zero\n");
+		return -EINVAL;
+	}
+
+	vgpio->vdev			= vdev;
+	vgpio->gc.request		= virtio_gpio_request;
+	vgpio->gc.free			= virtio_gpio_free;
+	vgpio->gc.get_direction		= virtio_gpio_get_direction;
+	vgpio->gc.direction_input	= virtio_gpio_direction_input;
+	vgpio->gc.direction_output	= virtio_gpio_direction_output;
+	vgpio->gc.get			= virtio_gpio_get;
+	vgpio->gc.set			= virtio_gpio_set;
+	vgpio->gc.ngpio			= config->ngpio;
+	vgpio->gc.base			= -1; /* Allocate base dynamically */
+	vgpio->gc.label			= config->name[0] ?
+					  config->name : dev_name(dev);
+	vgpio->gc.parent		= dev;
+	vgpio->gc.owner			= THIS_MODULE;
+	vgpio->gc.can_sleep		= true;
+	vgpio->gc.names			= parse_gpio_names(vdev, config);
+	if (IS_ERR(vgpio->gc.names))
+		return PTR_ERR(vgpio->gc.names);
+
+	vdev->priv = vgpio;
+	mutex_init(&vgpio->lock);
+	init_completion(&vgpio->completion);
+
+	ret = virtio_gpio_alloc_vqs(vdev);
+	if (ret)
+		return ret;
+
+	ret = gpiochip_add(&vgpio->gc);
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
index 000000000000..e805e33a79cb
--- /dev/null
+++ b/include/uapi/linux/virtio_gpio.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+#ifndef _LINUX_VIRTIO_GPIO_H
+#define _LINUX_VIRTIO_GPIO_H
+
+#include <linux/types.h>
+
+/* Virtio GPIO request types */
+#define VIRTIO_GPIO_REQ_ACTIVATE		0x01
+#define VIRTIO_GPIO_REQ_DEACTIVATE		0x02
+#define VIRTIO_GPIO_REQ_GET_DIRECTION		0x03
+#define VIRTIO_GPIO_REQ_DIRECTION_IN		0x04
+#define VIRTIO_GPIO_REQ_DIRECTION_OUT		0x05
+#define VIRTIO_GPIO_REQ_GET_VALUE		0x06
+#define VIRTIO_GPIO_REQ_SET_VALUE		0x07
+
+/* Possible values of the status field */
+#define VIRTIO_GPIO_STATUS_OK			0x0
+#define VIRTIO_GPIO_STATUS_ERR			0x1
+
+struct virtio_gpio_config {
+	char name[32];
+	__u16 ngpio;
+	__u16 padding;
+	__u32 gpio_names_size;
+	char gpio_names[0];
+} __packed;
+
+/* Virtio GPIO Request / Response */
+struct virtio_gpio_request {
+	__u16 type;
+	__u16 gpio;
+	__u8 data;
+};
+
+struct virtio_gpio_response {
+	__u8 status;
+	__u8 data;
+};
+
+#endif /* _LINUX_VIRTIO_GPIO_H */
diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
index b89391dff6c9..0c24e8ae2499 100644
--- a/include/uapi/linux/virtio_ids.h
+++ b/include/uapi/linux/virtio_ids.h
@@ -55,5 +55,6 @@
 #define VIRTIO_ID_PMEM			27 /* virtio pmem */
 #define VIRTIO_ID_MAC80211_HWSIM	29 /* virtio mac80211-hwsim */
 #define VIRTIO_ID_I2C_ADAPTER		34 /* virtio i2c adapter */
+#define VIRTIO_ID_GPIO			41 /* virtio GPIO */
 
 #endif /* _LINUX_VIRTIO_IDS_H */
-- 
2.31.1.272.g89b43f80a514

