Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 586453A5FF3
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jun 2021 12:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232804AbhFNKYZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Jun 2021 06:24:25 -0400
Received: from mail-pg1-f177.google.com ([209.85.215.177]:38713 "EHLO
        mail-pg1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232796AbhFNKYY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Jun 2021 06:24:24 -0400
Received: by mail-pg1-f177.google.com with SMTP id t17so8250426pga.5
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jun 2021 03:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YZpft7OI/68AkdpRkEG65YPdqz6N6jjlPeJBBm/DAcc=;
        b=ZEy9JljT0S7v4JKqlZp2tbrvTcXn7OssJFRLOCaLdsngU1E0T6hHlKfSOiLofzz+Qd
         CYD89wjmQkJ5qg24VB+qPG1CnGLkXuNVaRjZBqMFxJaq/qlIrixiP8M7mzSgo4aunXgX
         uaYZReiLfSn/RF8T5pFp5dg577Aj4ePvKGNXgtLNhY8SJF2CSwV8F4wLY1rH66F7Bf8V
         aMW6O23psUcC5KK3Z4bqR0a2fUmCTqtHdn1hopGeMV45XRZRBqg8ZEsYR0Ri60IiODOv
         Y9QGP+Tgn3YheWVxFMqjQdkb8ga4uJ1eUqNycNFbG5579Ztpkw2Po4hruC9fiShU+8nY
         6Ygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YZpft7OI/68AkdpRkEG65YPdqz6N6jjlPeJBBm/DAcc=;
        b=CEMqGpXUe5jyj3xa/G7lqAay9Rjbn+Woz/rI0Xlz/rshQjWTJC1Tp3DSq/EXCB9tS7
         dFXojXDid8nxqRm5GTrvOtL/3DqXJj+M2jWIOic0YARYTsHcaYgVePCcGaby8IjBvdoL
         /oEm84zwK70q7eoVhq/F9xBxj1tO/Hob3+w2WYxuXyIQZZh5o4IQVCcIDYxssMRuoBi8
         2vVpjAWXsGzkYCRrwqxOfqgnwbdeP/m1g7mtdhSaIGGsD3Oqg3jBsbpwFamvNI3Czw15
         M665tvCJIIXic7RKkcsr0F2igjNtG/y5zUX3U/AokoPtMUkxBnCTWFHEEYKWloYjORnn
         4pOQ==
X-Gm-Message-State: AOAM530rA2yJY05L8z/M5SeUu0TU0fxXoGREjs59bLqLsA68hL0nYZZH
        UybNfUi8h8Zx+14Gv8n64AnINw==
X-Google-Smtp-Source: ABdhPJxqBUAdifrUMvs2Xcf/ymaxIYCbX+e1eFh0GE+mXpPaQBN6YqQMBz8f9vC6UKEwRGT9SoikIA==
X-Received: by 2002:a65:42c3:: with SMTP id l3mr16224536pgp.259.1623666082072;
        Mon, 14 Jun 2021 03:21:22 -0700 (PDT)
Received: from localhost ([136.185.134.182])
        by smtp.gmail.com with ESMTPSA id k25sm12058962pfa.213.2021.06.14.03.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 03:21:21 -0700 (PDT)
Date:   Mon, 14 Jun 2021 15:51:19 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Stefano Garzarella --cc virtualization @ lists . linux-foundation . org" 
        <sgarzare@redhat.com>, virtualization@lists.linux-foundation.org
Subject: Re: [PATCH V3 1/3] gpio: Add virtio-gpio driver
Message-ID: <20210614102119.qifm5sj7fpg54iqo@vireshk-i7>
References: <cover.1623326176.git.viresh.kumar@linaro.org>
 <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
 <CAK8P3a11YhcEOjauWc872BQv+SO-E5+gnz7Lk6UK42iVw7Oyfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a11YhcEOjauWc872BQv+SO-E5+gnz7Lk6UK42iVw7Oyfg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10-06-21, 15:22, Arnd Bergmann wrote:
> Can you give an example of how this would be hooked up to other drivers
> using those gpios. Can you give an example of how using the "gpio-keys" or
> "gpio-leds" drivers in combination with virtio-gpio looks like in the DT?
> 
> Would qemu simply add the required DT properties to the device node that
> corresponds to the virtio device in this case?
> 
> From what I can tell, both the mmio and pci variants of virtio can have their
> dev->of_node populated, but I don't see the logic in register_virtio_device()
> that looks up the of_node of the virtio_device that the of_gpio code then
> tries to refer to.

To be honest, I haven't tried this yet and I was expecting it to be
already taken care of. I was relying on the DTB automatically
generated by Qemu to get the driver probed and didn't have a look at
it as well.

I now understand that it won't be that straight forward. The same must
be true for adding an i2c device to an i2c bus over virtio (The way I
tested that earlier was by using the sysfs file to add a device to a
bus).

This may be something lacking generally for virtio-pci thing, not
sure though.

-- 
viresh
