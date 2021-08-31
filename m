Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 332AC3FC227
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Aug 2021 07:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237872AbhHaFa1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Aug 2021 01:30:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235359AbhHaFa1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Aug 2021 01:30:27 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9D62C06175F
        for <linux-gpio@vger.kernel.org>; Mon, 30 Aug 2021 22:29:32 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id g184so15581717pgc.6
        for <linux-gpio@vger.kernel.org>; Mon, 30 Aug 2021 22:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jFcTPdCtyitTZJIxV4LdmuAXMlqcd0E1IFXZnG1zNlc=;
        b=qtuqrUWrX0xG1t+1moMNCudmKDWrljvH+h661ddNymptPT+bedvPZFIhW2u+cLE9rT
         fsbl5TDmqhYHOunrx7JmBaXMyx0y6xscctRtg0abpImTCXnVVi9TSdeQ61shoW586QpN
         MKSiPMr0gYtETNQtabGq98xtmIplvAs4vv1xSWc6D4FBLUyK+f6PuQz7QZUFy7Mlgj40
         aBZDYdU5Pb/zQwDeujPYsOfrzass1O3pXIVoagyAqIS8YZBKHlnpVJoMcF5UMRE0ih3H
         wqmguIQJHwKUVVI7Q3JcOme1zD1ARSJksO/bP6TguDk/9yK2FYXEVmFSpqjxJAUNgGMb
         MPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jFcTPdCtyitTZJIxV4LdmuAXMlqcd0E1IFXZnG1zNlc=;
        b=VekCcKlu3Ix6pEkR10HzPpP3BPz5G6VZQqP9ka4+uqJH+ryhtLnCrR+tdprrUl0qR+
         RJbP/ZGN4mg0kQLqoXeH4pIfB2FaPatW+1pf3YEE1mssSUif6i6KgUkDxorfmbaZqqrv
         y1EebB2qZ9zocD15aJbS8b4sfqS35gn0YZ08zJdPtoT8lL/sY7BnRMg7o3Wccd7Xwo7P
         /GbK8TS4Ls1dpMstCH4uan16APsxyI4zQoVlq8xMRWWEAJ1oAr50KwblC6p4XOekM5lD
         XWJU3yr8pJam85aJvAVTAIGVwmoefcu2OV0CzCGhIOswUxx17jZCzXJUJZAIdDJy4/n7
         XDzA==
X-Gm-Message-State: AOAM533Xs8vsnHYeb0UjJzfISkFUlq0aAn1GJiIieGJ67SHbuiczIPlH
        CjPPH8shBYFaeL50cIbmM6V6Mmt3YpF4Ug==
X-Google-Smtp-Source: ABdhPJzEvCEb7zzZIjZLgHKvGKWo8op/2Aby3r18tLBO9CS1c/y0W2sautmFMxGJTrSbLhSpWBNHmw==
X-Received: by 2002:a62:1453:0:b0:3fd:ffd5:35cf with SMTP id 80-20020a621453000000b003fdffd535cfmr10488051pfu.34.1630387772432;
        Mon, 30 Aug 2021 22:29:32 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id q18sm16584356pfj.46.2021.08.30.22.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 22:29:31 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        kernel test robot <lkp@intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: [PATCH] gpio: virtio: Fix sparse warnings
Date:   Tue, 31 Aug 2021 10:59:25 +0530
Message-Id: <32ab7b833743449b21f529cae41f4cbb60dc863c.1630387746.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix warnings reported by sparse, related to type mismatch between u16
and __le16.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 3a29355a22c0 ("gpio: Add virtio-gpio driver")
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/gpio/gpio-virtio.c       | 41 ++++++++++++++++----------------
 include/uapi/linux/virtio_gpio.h | 10 ++++----
 2 files changed, 25 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index d33eb237c0b9..d24f1c9264bc 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -32,7 +32,6 @@ struct virtio_gpio {
 	struct virtio_device *vdev;
 	struct mutex lock; /* Protects virtqueue operation */
 	struct gpio_chip gc;
-	struct virtio_gpio_config config;
 	struct virtio_gpio_line *lines;
 	struct virtqueue *request_vq;
 };
@@ -57,7 +56,7 @@ static int _virtio_gpio_req(struct virtio_gpio *vgpio, u16 type, u16 gpio,
 
 	req->type = cpu_to_le16(type);
 	req->gpio = cpu_to_le16(gpio);
-	req->value = txvalue;
+	req->value = cpu_to_le32(txvalue);
 
 	sg_init_one(&req_sg, req, sizeof(*req));
 	sg_init_one(&res_sg, res, rxlen);
@@ -233,19 +232,19 @@ static int virtio_gpio_alloc_vqs(struct virtio_gpio *vgpio,
 	return 0;
 }
 
-static const char **virtio_gpio_get_names(struct virtio_gpio *vgpio)
+static const char **virtio_gpio_get_names(struct virtio_gpio *vgpio,
+					  u32 gpio_names_size, u16 ngpio)
 {
-	struct virtio_gpio_config *config = &vgpio->config;
 	struct virtio_gpio_response_get_names *res;
 	struct device *dev = &vgpio->vdev->dev;
 	u8 *gpio_names, *str;
 	const char **names;
 	int i, ret, len;
 
-	if (!config->gpio_names_size)
+	if (!gpio_names_size)
 		return NULL;
 
-	len = sizeof(*res) + config->gpio_names_size;
+	len = sizeof(*res) + gpio_names_size;
 	res = devm_kzalloc(dev, len, GFP_KERNEL);
 	if (!res)
 		return NULL;
@@ -258,18 +257,18 @@ static const char **virtio_gpio_get_names(struct virtio_gpio *vgpio)
 		return NULL;
 	}
 
-	names = devm_kcalloc(dev, config->ngpio, sizeof(*names), GFP_KERNEL);
+	names = devm_kcalloc(dev, ngpio, sizeof(*names), GFP_KERNEL);
 	if (!names)
 		return NULL;
 
 	/* NULL terminate the string instead of checking it */
-	gpio_names[config->gpio_names_size - 1] = '\0';
+	gpio_names[gpio_names_size - 1] = '\0';
 
-	for (i = 0, str = gpio_names; i < config->ngpio; i++) {
+	for (i = 0, str = gpio_names; i < ngpio; i++) {
 		names[i] = str;
 		str += strlen(str) + 1; /* zero-length strings are allowed */
 
-		if (str > gpio_names + config->gpio_names_size) {
+		if (str > gpio_names + gpio_names_size) {
 			dev_err(dev, "gpio_names block is too short (%d)\n", i);
 			return NULL;
 		}
@@ -280,31 +279,31 @@ static const char **virtio_gpio_get_names(struct virtio_gpio *vgpio)
 
 static int virtio_gpio_probe(struct virtio_device *vdev)
 {
-	struct virtio_gpio_config *config;
+	struct virtio_gpio_config config;
 	struct device *dev = &vdev->dev;
 	struct virtio_gpio *vgpio;
+	u32 gpio_names_size;
+	u16 ngpio;
 	int ret, i;
 
 	vgpio = devm_kzalloc(dev, sizeof(*vgpio), GFP_KERNEL);
 	if (!vgpio)
 		return -ENOMEM;
 
-	config = &vgpio->config;
-
 	/* Read configuration */
-	virtio_cread_bytes(vdev, 0, config, sizeof(*config));
-	config->gpio_names_size = le32_to_cpu(config->gpio_names_size);
-	config->ngpio = le16_to_cpu(config->ngpio);
-	if (!config->ngpio) {
+	virtio_cread_bytes(vdev, 0, &config, sizeof(config));
+	gpio_names_size = le32_to_cpu(config.gpio_names_size);
+	ngpio = le16_to_cpu(config.ngpio);
+	if (!ngpio) {
 		dev_err(dev, "Number of GPIOs can't be zero\n");
 		return -EINVAL;
 	}
 
-	vgpio->lines = devm_kcalloc(dev, config->ngpio, sizeof(*vgpio->lines), GFP_KERNEL);
+	vgpio->lines = devm_kcalloc(dev, ngpio, sizeof(*vgpio->lines), GFP_KERNEL);
 	if (!vgpio->lines)
 		return -ENOMEM;
 
-	for (i = 0; i < config->ngpio; i++) {
+	for (i = 0; i < ngpio; i++) {
 		mutex_init(&vgpio->lines[i].lock);
 		init_completion(&vgpio->lines[i].completion);
 	}
@@ -319,7 +318,7 @@ static int virtio_gpio_probe(struct virtio_device *vdev)
 	vgpio->gc.direction_output	= virtio_gpio_direction_output;
 	vgpio->gc.get			= virtio_gpio_get;
 	vgpio->gc.set			= virtio_gpio_set;
-	vgpio->gc.ngpio			= config->ngpio;
+	vgpio->gc.ngpio			= ngpio;
 	vgpio->gc.base			= -1; /* Allocate base dynamically */
 	vgpio->gc.label			= dev_name(dev);
 	vgpio->gc.parent		= dev;
@@ -333,7 +332,7 @@ static int virtio_gpio_probe(struct virtio_device *vdev)
 	/* Mark the device ready to perform operations from within probe() */
 	virtio_device_ready(vdev);
 
-	vgpio->gc.names = virtio_gpio_get_names(vgpio);
+	vgpio->gc.names = virtio_gpio_get_names(vgpio, gpio_names_size, ngpio);
 
 	ret = gpiochip_add_data(&vgpio->gc, vgpio);
 	if (ret) {
diff --git a/include/uapi/linux/virtio_gpio.h b/include/uapi/linux/virtio_gpio.h
index 844574acf095..0445f905d8cc 100644
--- a/include/uapi/linux/virtio_gpio.h
+++ b/include/uapi/linux/virtio_gpio.h
@@ -22,16 +22,16 @@
 #define VIRTIO_GPIO_DIRECTION_IN		0x02
 
 struct virtio_gpio_config {
-	__u16 ngpio;
+	__le16 ngpio;
 	__u8 padding[2];
-	__u32 gpio_names_size;
+	__le32 gpio_names_size;
 } __packed;
 
 /* Virtio GPIO Request / Response */
 struct virtio_gpio_request {
-	__u16 type;
-	__u16 gpio;
-	__u32 value;
+	__le16 type;
+	__le16 gpio;
+	__le32 value;
 };
 
 struct virtio_gpio_response {
-- 
2.31.1.272.g89b43f80a514

