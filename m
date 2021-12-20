Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6109947B063
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Dec 2021 16:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235890AbhLTPfw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Dec 2021 10:35:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59737 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235730AbhLTPfv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 20 Dec 2021 10:35:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640014551;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=s0lGMD0pC7skWIYrRhVwKOPgTmBx4KUrBkR78qYxnqw=;
        b=aE2i3fF0gSE/adNGT206nyHGT8EhTXs7q1HrG0O79BvhT2NKrH4EPqerfl8okbrGH3O6NE
        3MEEFqvdns8wzb/MhNbNPYR4CmVPkpXjUnyifa41Vu5011cUIGTmhB0FhO5Ql5p95o5VO0
        U2JtZ+D7umP95nYjp6aaGZh/BN0bgUA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-P95eD9JRNrSIZ-LR6jiXNQ-1; Mon, 20 Dec 2021 10:35:50 -0500
X-MC-Unique: P95eD9JRNrSIZ-LR6jiXNQ-1
Received: by mail-wm1-f70.google.com with SMTP id 138-20020a1c0090000000b00338bb803204so2045647wma.1
        for <linux-gpio@vger.kernel.org>; Mon, 20 Dec 2021 07:35:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=s0lGMD0pC7skWIYrRhVwKOPgTmBx4KUrBkR78qYxnqw=;
        b=iwF/CS5VEZqP49dqwxLc6xNiahjmHkjENr5DnWoaISX2OmC105PxzsPL8/O+x/NlxF
         sZJqOTVF9ri6ToMQfpzOBCyMDVe2jF7SAJZEKC2OSXTjLcIX+DQgx/M3LwMfzdx+EkHj
         7H2IZAePoPNcD0hNnXvoXgqLDvgDFWjdE/uKhzPARnwyjuvMqPU6kWvQLsbjK6iCa1dT
         gN2OVpUdD1pLIFuo0H7HPr1EAEvxYjy3lyHGs6RlFiQ/Ve80Fh6ZfaKVdeTEHA+xMNSH
         zni7miexUsvb+PZFOsNQEwouYyl1cpY6CT1tXPmsL6NA38f0Yb+LGOnalyJoiz2pBlBV
         CTXA==
X-Gm-Message-State: AOAM531WPPeSj3NWaYBwUmsT0IaUHvzqqtNquF3YX4phEU87PIJm/cwj
        zdtVHhNjGG2dj801gqbqAZEGGxYa48HvWJVw4Maq6hCrnFB/avOfL2wuJ/CUrOwvu7xghQeg/ad
        F7UBSLx7LApGdQCwrS1ZwPg==
X-Received: by 2002:a05:600c:1da3:: with SMTP id p35mr2388568wms.9.1640014549025;
        Mon, 20 Dec 2021 07:35:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxlGp7cXs8bcGDDTJ9A4ThRV7yXkHYo3y8iw5DiCoay9PJOvjvzhVsl1lQ5A8vn6i0apYrFCQ==
X-Received: by 2002:a05:600c:1da3:: with SMTP id p35mr2388548wms.9.1640014548781;
        Mon, 20 Dec 2021 07:35:48 -0800 (PST)
Received: from redhat.com ([2.55.19.224])
        by smtp.gmail.com with ESMTPSA id b2sm7974828wrd.35.2021.12.20.07.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 07:35:48 -0800 (PST)
Date:   Mon, 20 Dec 2021 10:35:43 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, kernel@axis.com,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: virtio: remove timeout
Message-ID: <20211220103537-mutt-send-email-mst@kernel.org>
References: <20211220130656.16900-1-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211220130656.16900-1-vincent.whitchurch@axis.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 20, 2021 at 02:06:56PM +0100, Vincent Whitchurch wrote:
> The driver imposes an arbitrary one second timeout on virtio requests,
> but the specification doesn't prevent the virtio device from taking
> longer to process requests, so remove this timeout to support all
> systems and device implementations.
> 
> Fixes: 3a29355a22c0275fe86 ("gpio: Add virtio-gpio driver")
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  drivers/gpio/gpio-virtio.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
> index 84f96b78f32a..9f4941bc5760 100644
> --- a/drivers/gpio/gpio-virtio.c
> +++ b/drivers/gpio/gpio-virtio.c
> @@ -100,11 +100,7 @@ static int _virtio_gpio_req(struct virtio_gpio *vgpio, u16 type, u16 gpio,
>  	virtqueue_kick(vgpio->request_vq);
>  	mutex_unlock(&vgpio->lock);
>  
> -	if (!wait_for_completion_timeout(&line->completion, HZ)) {
> -		dev_err(dev, "GPIO operation timed out\n");
> -		ret = -ETIMEDOUT;
> -		goto out;
> -	}
> +	wait_for_completion(&line->completion);
>  
>  	if (unlikely(res->status != VIRTIO_GPIO_STATUS_OK)) {
>  		dev_err(dev, "GPIO request failed: %d\n", gpio);
> -- 
> 2.33.1

