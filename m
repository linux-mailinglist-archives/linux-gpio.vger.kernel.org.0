Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4E003A3263
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jun 2021 19:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbhFJRoG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 13:44:06 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:53184 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230086AbhFJRoF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 13:44:05 -0400
Received: by mail-wm1-f47.google.com with SMTP id f17so6654421wmf.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jun 2021 10:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pM0nGDKYkIAlAyStdsFgVkBk0BheQrtlQf6NUZDyxZc=;
        b=RMpsPJ8bO5z7WShZXYgZ16d5HuTl8pNS52Jfm7re37G6EP3jVZDe69rbLC6jVxkjz9
         9loefUHesBYOQ8LNyQ4abquuwLGVHeYWtaFVkrNlFsZ2wGCNU77bykUI/M3o854L7vuD
         5EAJ2I4mKkJq7w0lhOyX2kG5zIl1GGVW+Nk8EC5F8Mf9ibxITIlF81xwaC5i7hLzsqSv
         OZl/XJFzUAzl2CxPopRZ7GNnG2ydzu+bpHBFPC2qEOyjwoYO5oJvDgoAcfU4myl8ATEk
         xE6bLyfpnQKY/fWmTDFGV9N6UCGsX4Sv3Ye3lvj0ynn8AXcFzOdlhaDo7xTR42uSM79e
         Us/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pM0nGDKYkIAlAyStdsFgVkBk0BheQrtlQf6NUZDyxZc=;
        b=qRodyut+Q/C2sr22Rwwlir4pN78kCJE6FSAoqlFt2MD9tFBSjJZ0Ljd3erAABybsFC
         +I0MGE2ECJStul+bYPSWhQziYlk08FW/EIBxb5MOtyWXeZp5Rbvlef4j1dnS04Q1Y6Wp
         weMkbOffrwbB2/KKazLJnCA7WcNRBL4gdAcTS6IiJ6fIqkeOjPpAOmjqicWDlphtFzuY
         +btSCx9Fum/0e9s+kZ0n4CAGVFp1FQEAeKdEHCSs4emkur/KFibBDPGf76PcDqBN3twT
         Ogker7ZhtdHIx4escazZycDFZXVswLht89kDskhnilhyK35AgVRXgrrwEU4nHjD05sqK
         XIJA==
X-Gm-Message-State: AOAM530EpXskDaYmAiIsfeQlhE584AYUk/uscsQcj95OLRyy6tccdGd4
        0OfHpingUXJIi4BQNssBD6jDtw==
X-Google-Smtp-Source: ABdhPJxFKaPJ/cNP/K6C3Vrm4B+BeTN6H5aOuYQJCi6l9RyqVt+7t5JA+gie06VrmwhuEAuEbml1Fw==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr16323711wmh.69.1623346854910;
        Thu, 10 Jun 2021 10:40:54 -0700 (PDT)
Received: from myrica (adsl-84-226-111-173.adslplus.ch. [84.226.111.173])
        by smtp.gmail.com with ESMTPSA id o18sm9747450wmq.23.2021.06.10.10.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 10:40:54 -0700 (PDT)
Date:   Thu, 10 Jun 2021 19:40:35 +0200
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-gpio@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
        "Stefano Garzarella --cc virtualization @ lists . linux-foundation . org" 
        <sgarzare@redhat.com>, stratos-dev@op-lists.linaro.org
Subject: Re: [PATCH V3 1/3] gpio: Add virtio-gpio driver
Message-ID: <YMJOk6RWuztRNBXO@myrica>
References: <cover.1623326176.git.viresh.kumar@linaro.org>
 <01000179f5da7763-2ea817c6-e176-423a-952e-de02443f71e2-000000@email.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01000179f5da7763-2ea817c6-e176-423a-952e-de02443f71e2-000000@email.amazonses.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Not being very familiar with GPIO, I just have a few general comments and
one on the config space layout

On Thu, Jun 10, 2021 at 12:16:46PM +0000, Viresh Kumar via Stratos-dev wrote:
> +static int virtio_gpio_req(struct virtio_gpio *vgpio, u16 type, u16 gpio,
> +			   u8 txdata, u8 *rxdata)
> +{
> +	struct virtio_gpio_response *res = &vgpio->cres;
> +	struct virtio_gpio_request *req = &vgpio->creq;
> +	struct scatterlist *sgs[2], req_sg, res_sg;
> +	struct device *dev = &vgpio->vdev->dev;
> +	unsigned long time_left;
> +	unsigned int len;
> +	int ret;
> +
> +	req->type = cpu_to_le16(type);
> +	req->gpio = cpu_to_le16(gpio);
> +	req->data = txdata;
> +
> +	sg_init_one(&req_sg, req, sizeof(*req));
> +	sg_init_one(&res_sg, res, sizeof(*res));
> +	sgs[0] = &req_sg;
> +	sgs[1] = &res_sg;
> +
> +	mutex_lock(&vgpio->lock);
> +	ret = virtqueue_add_sgs(vgpio->command_vq, sgs, 1, 1, res, GFP_KERNEL);
> +	if (ret) {
> +		dev_err(dev, "failed to add request to vq\n");
> +		goto out;
> +	}
> +
> +	reinit_completion(&vgpio->completion);
> +	virtqueue_kick(vgpio->command_vq);
> +
> +	time_left = wait_for_completion_timeout(&vgpio->completion, HZ / 10);
> +	if (!time_left) {
> +		dev_err(dev, "virtio GPIO backend timeout\n");
> +		return -ETIMEDOUT;

mutex is still held

> +	}
> +
> +	WARN_ON(res != virtqueue_get_buf(vgpio->command_vq, &len));
> +	if (unlikely(res->status != VIRTIO_GPIO_STATUS_OK)) {
> +		dev_err(dev, "virtio GPIO request failed: %d\n", gpio);
> +		return -EINVAL;

and here

> +	}
> +
> +	if (rxdata)
> +		*rxdata = res->data;
> +
> +out:
> +	mutex_unlock(&vgpio->lock);
> +
> +	return ret;
> +}
> +
> +static int virtio_gpio_request(struct gpio_chip *gc, unsigned int gpio)
> +{
> +	struct virtio_gpio *vgpio = gpio_chip_to_vgpio(gc);
> +
> +	return virtio_gpio_req(vgpio, VIRTIO_GPIO_REQ_ACTIVATE, gpio, 0, NULL);
> +}
> +
> +static void virtio_gpio_free(struct gpio_chip *gc, unsigned int gpio)
> +{
> +	struct virtio_gpio *vgpio = gpio_chip_to_vgpio(gc);
> +
> +	virtio_gpio_req(vgpio, VIRTIO_GPIO_REQ_DEACTIVATE, gpio, 0, NULL);
> +}
> +
> +static int virtio_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
> +{
> +	struct virtio_gpio *vgpio = gpio_chip_to_vgpio(gc);
> +	u8 direction;
> +	int ret;
> +
> +	ret = virtio_gpio_req(vgpio, VIRTIO_GPIO_REQ_GET_DIRECTION, gpio, 0,
> +			      &direction);
> +	if (ret)
> +		return ret;
> +
> +	return direction;
> +}
> +
> +static int virtio_gpio_direction_input(struct gpio_chip *gc, unsigned int gpio)
> +{
> +	struct virtio_gpio *vgpio = gpio_chip_to_vgpio(gc);
> +
> +	return virtio_gpio_req(vgpio, VIRTIO_GPIO_REQ_DIRECTION_IN, gpio, 0,
> +			       NULL);
> +}
> +
> +static int virtio_gpio_direction_output(struct gpio_chip *gc, unsigned int gpio,
> +					int value)
> +{
> +	struct virtio_gpio *vgpio = gpio_chip_to_vgpio(gc);
> +
> +	return virtio_gpio_req(vgpio, VIRTIO_GPIO_REQ_DIRECTION_OUT, gpio, (u8)

(that dangling cast looks a bit odd to me)

> +			       value, NULL);
> +}
> +
> +static int virtio_gpio_get(struct gpio_chip *gc, unsigned int gpio)
> +{
> +	struct virtio_gpio *vgpio = gpio_chip_to_vgpio(gc);
> +	u8 value;
> +	int ret;
> +
> +	ret = virtio_gpio_req(vgpio, VIRTIO_GPIO_REQ_GET_VALUE, gpio, 0, &value);
> +	if (ret)
> +		return ret;
> +
> +	return value;
> +}
> +
> +static void virtio_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
> +{
> +	struct virtio_gpio *vgpio = gpio_chip_to_vgpio(gc);
> +
> +	virtio_gpio_req(vgpio, VIRTIO_GPIO_REQ_SET_VALUE, gpio, value, NULL);
> +}
> +
> +static void virtio_gpio_command(struct virtqueue *vq)
> +{
> +	struct virtio_gpio *vgpio = vq->vdev->priv;
> +
> +	complete(&vgpio->completion);
> +}
> +
> +static int virtio_gpio_alloc_vqs(struct virtio_device *vdev)
> +{
> +	struct virtio_gpio *vgpio = vdev->priv;
> +	const char * const names[] = { "command" };
> +	vq_callback_t *cbs[] = {
> +		virtio_gpio_command,
> +	};
> +	struct virtqueue *vqs[1] = {NULL};
> +	int ret;
> +
> +	ret = virtio_find_vqs(vdev, 1, vqs, cbs, names, NULL);
> +	if (ret) {
> +		dev_err(&vdev->dev, "failed to allocate vqs: %d\n", ret);
> +		return ret;
> +	}
> +
> +	vgpio->command_vq = vqs[0];
> +
> +	/* Mark the device ready to perform operations from within probe() */
> +	virtio_device_ready(vgpio->vdev);

May fit better in the parent function

> +	return 0;
> +}
> +
> +static void virtio_gpio_free_vqs(struct virtio_device *vdev)
> +{
> +	vdev->config->reset(vdev);
> +	vdev->config->del_vqs(vdev);
> +}
> +
> +static const char **parse_gpio_names(struct virtio_device *vdev,
> +			       struct virtio_gpio_config *config)
> +{
> +	struct device *dev = &vdev->dev;
> +	char *str = config->gpio_names;
> +	const char **names;
> +	int i, len;
> +
> +	if (!config->gpio_names_size)
> +		return NULL;
> +
> +	names = devm_kcalloc(dev, config->ngpio, sizeof(names), GFP_KERNEL);
> +	if (!names)
> +		return ERR_PTR(-ENOMEM);
> +
> +	/* NULL terminate the string instead of checking it */
> +	config->gpio_names[config->gpio_names_size - 1] = '\0';
> +
> +	for (i = 0; i < config->ngpio; i++) {
> +		/*
> +		 * We have already marked the last byte with '\0'
> +		 * earlier, this shall be enough here.
> +		 */
> +		if (str == config->gpio_names + config->gpio_names_size) {
> +			dev_err(dev, "Invalid gpio_names\n");
> +			return ERR_PTR(-EINVAL);
> +		}
> +
> +		len = strlen(str);
> +		if (!len) {
> +			dev_err(dev, "Missing GPIO name: %d\n", i);
> +			return ERR_PTR(-EINVAL);
> +		}
> +
> +		names[i] = str;
> +		str += len + 1;
> +	}
> +
> +	return names;
> +}
> +
> +static int virtio_gpio_probe(struct virtio_device *vdev)
> +{
> +	struct virtio_gpio_config *config;
> +	struct device *dev = &vdev->dev;
> +	struct virtio_gpio *vgpio;
> +	u32 size;
> +	int ret;
> +
> +	virtio_cread(vdev, struct virtio_gpio_config, gpio_names_size, &size);
> +	size = cpu_to_le32(size);

le32_to_cpu()? 
> +
> +	vgpio = devm_kzalloc(dev, sizeof(*vgpio) + size, GFP_KERNEL);
> +	if (!vgpio)
> +		return -ENOMEM;
> +
> +	config = &vgpio->config;
> +
> +	/* Read configuration */
> +	virtio_cread_bytes(vdev, 0, config, sizeof(*config) + size);
> +
> +	/* NULL terminate the string instead of checking it */
> +	config->name[sizeof(config->name) - 1] = '\0';
> +	config->ngpio = cpu_to_le16(config->ngpio);
> +	config->gpio_names_size = cpu_to_le32(config->gpio_names_size);

leXX_to_cpu()?

> +
> +	if (!config->ngpio) {
> +		dev_err(dev, "Number of GPIOs can't be zero\n");
> +		return -EINVAL;
> +	}
> +
> +	vgpio->vdev			= vdev;
> +	vgpio->gc.request		= virtio_gpio_request;
> +	vgpio->gc.free			= virtio_gpio_free;
> +	vgpio->gc.get_direction		= virtio_gpio_get_direction;
> +	vgpio->gc.direction_input	= virtio_gpio_direction_input;
> +	vgpio->gc.direction_output	= virtio_gpio_direction_output;
> +	vgpio->gc.get			= virtio_gpio_get;
> +	vgpio->gc.set			= virtio_gpio_set;
> +	vgpio->gc.ngpio			= config->ngpio;
> +	vgpio->gc.base			= -1; /* Allocate base dynamically */
> +	vgpio->gc.label			= config->name[0] ?
> +					  config->name : dev_name(dev);
> +	vgpio->gc.parent		= dev;
> +	vgpio->gc.owner			= THIS_MODULE;
> +	vgpio->gc.can_sleep		= true;
> +	vgpio->gc.names			= parse_gpio_names(vdev, config);
> +	if (IS_ERR(vgpio->gc.names))
> +		return PTR_ERR(vgpio->gc.names);
> +
> +	vdev->priv = vgpio;
> +	mutex_init(&vgpio->lock);
> +	init_completion(&vgpio->completion);
> +
> +	ret = virtio_gpio_alloc_vqs(vdev);
> +	if (ret)
> +		return ret;
> +
> +	ret = gpiochip_add(&vgpio->gc);
> +	if (ret) {
> +		virtio_gpio_free_vqs(vdev);
> +		dev_err(dev, "Failed to add virtio-gpio controller\n");
> +	}
> +
> +	return ret;
> +}
> +
> +static void virtio_gpio_remove(struct virtio_device *vdev)
> +{
> +	struct virtio_gpio *vgpio = vdev->priv;
> +
> +	gpiochip_remove(&vgpio->gc);
> +	virtio_gpio_free_vqs(vdev);
> +}
> +
> +static const struct virtio_device_id id_table[] = {
> +	{ VIRTIO_ID_GPIO, VIRTIO_DEV_ANY_ID },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(virtio, id_table);
> +
> +static struct virtio_driver virtio_gpio_driver = {
> +	.id_table		= id_table,
> +	.probe			= virtio_gpio_probe,
> +	.remove			= virtio_gpio_remove,
> +	.driver			= {
> +		.name		= KBUILD_MODNAME,
> +		.owner		= THIS_MODULE,
> +	},
> +};
> +module_virtio_driver(virtio_gpio_driver);
> +
> +MODULE_AUTHOR("Enrico Weigelt, metux IT consult <info@metux.net>");
> +MODULE_AUTHOR("Viresh Kumar <viresh.kumar@linaro.org>");
> +MODULE_DESCRIPTION("VirtIO GPIO driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/uapi/linux/virtio_gpio.h b/include/uapi/linux/virtio_gpio.h
> new file mode 100644
> index 000000000000..e805e33a79cb
> --- /dev/null
> +++ b/include/uapi/linux/virtio_gpio.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +
> +#ifndef _LINUX_VIRTIO_GPIO_H
> +#define _LINUX_VIRTIO_GPIO_H
> +
> +#include <linux/types.h>
> +
> +/* Virtio GPIO request types */
> +#define VIRTIO_GPIO_REQ_ACTIVATE		0x01
> +#define VIRTIO_GPIO_REQ_DEACTIVATE		0x02
> +#define VIRTIO_GPIO_REQ_GET_DIRECTION		0x03
> +#define VIRTIO_GPIO_REQ_DIRECTION_IN		0x04
> +#define VIRTIO_GPIO_REQ_DIRECTION_OUT		0x05
> +#define VIRTIO_GPIO_REQ_GET_VALUE		0x06
> +#define VIRTIO_GPIO_REQ_SET_VALUE		0x07
> +
> +/* Possible values of the status field */
> +#define VIRTIO_GPIO_STATUS_OK			0x0
> +#define VIRTIO_GPIO_STATUS_ERR			0x1
> +
> +struct virtio_gpio_config {
> +	char name[32];
> +	__u16 ngpio;
> +	__u16 padding;
> +	__u32 gpio_names_size;
> +	char gpio_names[0];

A variable-size array here will make it very difficult to append new
fields to virtio_gpio_config, when adding new features to the device. (New
fields cannot be inserted in between, since older drivers will expect
existing fields at a specific offset.)

You could replace it with a reference to the string array, for example
"__u16 gpio_names_offset" declaring the offset between the beginning of
device-specific config and the string array. The 'name' field could also
be indirect to avoid setting a fixed 32-char size, but that's not as
important.

> +} __packed;

No need for __packed, because the fields are naturally aligned (as
required by the virtio spec)

Thanks,
Jean

> +
> +/* Virtio GPIO Request / Response */
> +struct virtio_gpio_request {
> +	__u16 type;
> +	__u16 gpio;
> +	__u8 data;
> +};
> +
> +struct virtio_gpio_response {
> +	__u8 status;
> +	__u8 data;
> +};
> +
> +#endif /* _LINUX_VIRTIO_GPIO_H */
> diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
> index b89391dff6c9..0c24e8ae2499 100644
> --- a/include/uapi/linux/virtio_ids.h
> +++ b/include/uapi/linux/virtio_ids.h
> @@ -55,5 +55,6 @@
>  #define VIRTIO_ID_PMEM			27 /* virtio pmem */
>  #define VIRTIO_ID_MAC80211_HWSIM	29 /* virtio mac80211-hwsim */
>  #define VIRTIO_ID_I2C_ADAPTER		34 /* virtio i2c adapter */
> +#define VIRTIO_ID_GPIO			41 /* virtio GPIO */
>  
>  #endif /* _LINUX_VIRTIO_IDS_H */
> -- 
> 2.31.1.272.g89b43f80a514
> 
> -- 
> Stratos-dev mailing list
> Stratos-dev@op-lists.linaro.org
> https://op-lists.linaro.org/mailman/listinfo/stratos-dev
