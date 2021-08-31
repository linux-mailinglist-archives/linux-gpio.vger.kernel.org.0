Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C81A53FC2BC
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Aug 2021 08:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbhHaG00 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Aug 2021 02:26:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51471 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232978AbhHaG00 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 31 Aug 2021 02:26:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630391130;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=St1rq/GRTUN1BqWP/sQOT2FcgqysJ21/+gmc2cNwpXE=;
        b=FT6ro3Ch/XH/aPlacXLgGTn1vo/YQn8ArgvlFsL9eLNUaPJ6P/FnZZgpKV80Wb2LfZJQWH
        r3V6LpM3FmN87Gi9P36O4iQcH9YclftJaEHVEfjAI+j5MDFUNAEZ6Y6neuQujUYayO28aA
        twwYjrGtFMbJ/csDxiPfSD4bxQhytZY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-ZBHw_cQ5MpmI1FJdE2qJOQ-1; Tue, 31 Aug 2021 02:25:28 -0400
X-MC-Unique: ZBHw_cQ5MpmI1FJdE2qJOQ-1
Received: by mail-ed1-f70.google.com with SMTP id b8-20020a056402350800b003c5e3d4e2a7so7742870edd.2
        for <linux-gpio@vger.kernel.org>; Mon, 30 Aug 2021 23:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=St1rq/GRTUN1BqWP/sQOT2FcgqysJ21/+gmc2cNwpXE=;
        b=al1HQHcNLKOuqA1ThtxnP2NIWG7gDTdcX+ugex2QdvZE60vqUUtNNk1WA4Dw2Q8X8C
         9Icj2FaONFWQ12x+pBZYC5aF9yNsJwxoFFRBUoSmVQIXVXjVYuM+KH8EGF6pkzH354Q+
         9ZiiBZw+csRxWDPYfsLOKWH4w4/XHQKrJY9VMPJiyV3hTE2/MDuuHxpGa+Ss7bR8ddhg
         Y61oCZKZZa1yVY4VlY8adyHe5ibDavtbfmFZz76K7MoBrY5xPamjj7Ar10RHhiJIRv22
         b0uWoEixJ2LN+zRyrH6EdaxFaxFaUDQZyXRxgi+iaBvYERnIUECpCF17PhqrcVCPLQsH
         ip5w==
X-Gm-Message-State: AOAM532qvX8jl3D8fb4ar6PQhsutLiHCLuY2Aj5W/PaHAPq1+PjWoYUB
        AdPKGhMU7chPePsJAnp2H3CUsdwuU2rRDrB/W1WWu5c62XIe5ZJHdaV+j/G4eY3DuTW8BXSJ2VR
        lDLA9iLNi01ZTlEvwXsv2iw==
X-Received: by 2002:a17:907:6289:: with SMTP id nd9mr29024388ejc.384.1630391127018;
        Mon, 30 Aug 2021 23:25:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvRafOmY6jKU6Si2LSybhJCp5YyAxIJ+xnSN9f6usZ4gHSBOkAZ32XK3mN933PuL0lQsr2BQ==
X-Received: by 2002:a17:907:6289:: with SMTP id nd9mr29024373ejc.384.1630391126827;
        Mon, 30 Aug 2021 23:25:26 -0700 (PDT)
Received: from redhat.com ([2.55.138.60])
        by smtp.gmail.com with ESMTPSA id t24sm7664370ejf.48.2021.08.30.23.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 23:25:26 -0700 (PDT)
Date:   Tue, 31 Aug 2021 02:25:22 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        kernel test robot <lkp@intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH] gpio: virtio: Fix sparse warnings
Message-ID: <20210831022224-mutt-send-email-mst@kernel.org>
References: <32ab7b833743449b21f529cae41f4cbb60dc863c.1630387746.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32ab7b833743449b21f529cae41f4cbb60dc863c.1630387746.git.viresh.kumar@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 31, 2021 at 10:59:25AM +0530, Viresh Kumar wrote:
> Fix warnings reported by sparse, related to type mismatch between u16
> and __le16.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 3a29355a22c0 ("gpio: Add virtio-gpio driver")
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

I'm not sure which tree has the above commit - can this be squashed?

Also, the driver lacks a MAINTAINERS entry - we want at least
L:      virtualization@lists.linux-foundation.org
on all virtio drivers.


> ---
>  drivers/gpio/gpio-virtio.c       | 41 ++++++++++++++++----------------
>  include/uapi/linux/virtio_gpio.h | 10 ++++----
>  2 files changed, 25 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
> index d33eb237c0b9..d24f1c9264bc 100644
> --- a/drivers/gpio/gpio-virtio.c
> +++ b/drivers/gpio/gpio-virtio.c
> @@ -32,7 +32,6 @@ struct virtio_gpio {
>  	struct virtio_device *vdev;
>  	struct mutex lock; /* Protects virtqueue operation */
>  	struct gpio_chip gc;
> -	struct virtio_gpio_config config;
>  	struct virtio_gpio_line *lines;
>  	struct virtqueue *request_vq;
>  };
> @@ -57,7 +56,7 @@ static int _virtio_gpio_req(struct virtio_gpio *vgpio, u16 type, u16 gpio,
>  
>  	req->type = cpu_to_le16(type);
>  	req->gpio = cpu_to_le16(gpio);
> -	req->value = txvalue;
> +	req->value = cpu_to_le32(txvalue);
>  
>  	sg_init_one(&req_sg, req, sizeof(*req));
>  	sg_init_one(&res_sg, res, rxlen);
> @@ -233,19 +232,19 @@ static int virtio_gpio_alloc_vqs(struct virtio_gpio *vgpio,
>  	return 0;
>  }
>  
> -static const char **virtio_gpio_get_names(struct virtio_gpio *vgpio)
> +static const char **virtio_gpio_get_names(struct virtio_gpio *vgpio,
> +					  u32 gpio_names_size, u16 ngpio)
>  {
> -	struct virtio_gpio_config *config = &vgpio->config;
>  	struct virtio_gpio_response_get_names *res;
>  	struct device *dev = &vgpio->vdev->dev;
>  	u8 *gpio_names, *str;
>  	const char **names;
>  	int i, ret, len;
>  
> -	if (!config->gpio_names_size)
> +	if (!gpio_names_size)
>  		return NULL;
>  
> -	len = sizeof(*res) + config->gpio_names_size;
> +	len = sizeof(*res) + gpio_names_size;
>  	res = devm_kzalloc(dev, len, GFP_KERNEL);
>  	if (!res)
>  		return NULL;
> @@ -258,18 +257,18 @@ static const char **virtio_gpio_get_names(struct virtio_gpio *vgpio)
>  		return NULL;
>  	}
>  
> -	names = devm_kcalloc(dev, config->ngpio, sizeof(*names), GFP_KERNEL);
> +	names = devm_kcalloc(dev, ngpio, sizeof(*names), GFP_KERNEL);
>  	if (!names)
>  		return NULL;
>  
>  	/* NULL terminate the string instead of checking it */
> -	gpio_names[config->gpio_names_size - 1] = '\0';
> +	gpio_names[gpio_names_size - 1] = '\0';
>  
> -	for (i = 0, str = gpio_names; i < config->ngpio; i++) {
> +	for (i = 0, str = gpio_names; i < ngpio; i++) {
>  		names[i] = str;
>  		str += strlen(str) + 1; /* zero-length strings are allowed */
>  
> -		if (str > gpio_names + config->gpio_names_size) {
> +		if (str > gpio_names + gpio_names_size) {
>  			dev_err(dev, "gpio_names block is too short (%d)\n", i);
>  			return NULL;
>  		}
> @@ -280,31 +279,31 @@ static const char **virtio_gpio_get_names(struct virtio_gpio *vgpio)
>  
>  static int virtio_gpio_probe(struct virtio_device *vdev)
>  {
> -	struct virtio_gpio_config *config;
> +	struct virtio_gpio_config config;
>  	struct device *dev = &vdev->dev;
>  	struct virtio_gpio *vgpio;
> +	u32 gpio_names_size;
> +	u16 ngpio;
>  	int ret, i;
>  
>  	vgpio = devm_kzalloc(dev, sizeof(*vgpio), GFP_KERNEL);
>  	if (!vgpio)
>  		return -ENOMEM;
>  
> -	config = &vgpio->config;
> -
>  	/* Read configuration */
> -	virtio_cread_bytes(vdev, 0, config, sizeof(*config));
> -	config->gpio_names_size = le32_to_cpu(config->gpio_names_size);
> -	config->ngpio = le16_to_cpu(config->ngpio);
> -	if (!config->ngpio) {
> +	virtio_cread_bytes(vdev, 0, &config, sizeof(config));
> +	gpio_names_size = le32_to_cpu(config.gpio_names_size);
> +	ngpio = le16_to_cpu(config.ngpio);
> +	if (!ngpio) {
>  		dev_err(dev, "Number of GPIOs can't be zero\n");
>  		return -EINVAL;
>  	}
>  
> -	vgpio->lines = devm_kcalloc(dev, config->ngpio, sizeof(*vgpio->lines), GFP_KERNEL);
> +	vgpio->lines = devm_kcalloc(dev, ngpio, sizeof(*vgpio->lines), GFP_KERNEL);
>  	if (!vgpio->lines)
>  		return -ENOMEM;
>  
> -	for (i = 0; i < config->ngpio; i++) {
> +	for (i = 0; i < ngpio; i++) {
>  		mutex_init(&vgpio->lines[i].lock);
>  		init_completion(&vgpio->lines[i].completion);
>  	}
> @@ -319,7 +318,7 @@ static int virtio_gpio_probe(struct virtio_device *vdev)
>  	vgpio->gc.direction_output	= virtio_gpio_direction_output;
>  	vgpio->gc.get			= virtio_gpio_get;
>  	vgpio->gc.set			= virtio_gpio_set;
> -	vgpio->gc.ngpio			= config->ngpio;
> +	vgpio->gc.ngpio			= ngpio;
>  	vgpio->gc.base			= -1; /* Allocate base dynamically */
>  	vgpio->gc.label			= dev_name(dev);
>  	vgpio->gc.parent		= dev;
> @@ -333,7 +332,7 @@ static int virtio_gpio_probe(struct virtio_device *vdev)
>  	/* Mark the device ready to perform operations from within probe() */
>  	virtio_device_ready(vdev);
>  
> -	vgpio->gc.names = virtio_gpio_get_names(vgpio);
> +	vgpio->gc.names = virtio_gpio_get_names(vgpio, gpio_names_size, ngpio);
>  
>  	ret = gpiochip_add_data(&vgpio->gc, vgpio);
>  	if (ret) {
> diff --git a/include/uapi/linux/virtio_gpio.h b/include/uapi/linux/virtio_gpio.h
> index 844574acf095..0445f905d8cc 100644
> --- a/include/uapi/linux/virtio_gpio.h
> +++ b/include/uapi/linux/virtio_gpio.h
> @@ -22,16 +22,16 @@
>  #define VIRTIO_GPIO_DIRECTION_IN		0x02
>  
>  struct virtio_gpio_config {
> -	__u16 ngpio;
> +	__le16 ngpio;
>  	__u8 padding[2];
> -	__u32 gpio_names_size;
> +	__le32 gpio_names_size;
>  } __packed;
>  
>  /* Virtio GPIO Request / Response */
>  struct virtio_gpio_request {
> -	__u16 type;
> -	__u16 gpio;
> -	__u32 value;
> +	__le16 type;
> +	__le16 gpio;
> +	__le32 value;
>  };
>  
>  struct virtio_gpio_response {
> -- 
> 2.31.1.272.g89b43f80a514

