Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 029D410FC0B
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2019 11:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbfLCKvW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Dec 2019 05:51:22 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36051 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfLCKvV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Dec 2019 05:51:21 -0500
Received: by mail-wr1-f67.google.com with SMTP id z3so3091028wru.3;
        Tue, 03 Dec 2019 02:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aVH1wKqnS/0tpLzx3r/GAf1NKCehOyA/BPLaY/A9mZw=;
        b=bcu1flX4c17aWB0jdh6P6lZDIp/SLk/qdtJsKK+v1cgpyZysw5D8BZTfLyywHxESb/
         VbPx8AvNhzB4UezAY9fDA6YZEIwwIbWLpRUT7ffXDaeqnOU+vtIbypDjkrn9knnOeTKC
         lTKLKrvjcaTIsswNVoEAvjFcdX+t6BmlifXBAfwXCH9u4CLrNKNuFISMAOfA/L5bdHWy
         /9jY3s23Uwo3yZJSAuqrE1qGmH7CgWfGkf+C1i0/V4a9wAiblr4Msd4W2DkxhHoWYHcM
         7wdRPGB4fmqEulF7xyADd4vTG0DwEFv/aLwoThA10b2vKiINmT+yKPM/SJ6cmpjyUKkC
         X1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aVH1wKqnS/0tpLzx3r/GAf1NKCehOyA/BPLaY/A9mZw=;
        b=e04dAZJCrx9mjPP0+eI9a687aclqvH3XgEM/NJiODUtOiwnc7VI2QLSeaqWeWcyt9K
         Z8JuZuEUB/85FcYZPk4kTymmU0nnUUkfpn5Nnw0vjJnYaWnNGo4MfPTnxQitDqp4Tw66
         oTb8nvmEfYqsJebhNvQ+qv4tONnTaRC/jv7DW5K5EofDdYKaTBwRR/UvE+Q6s337IEo8
         O1/jKB5XWn7bYS0PPbSvNHcD9Pmv0DHYLu7gWVZGVJmj+r56E19tu5iWcPOCMoApBE31
         1+yBXd+6pX/Es+usqYHWKWp9DY3lBKybSV0puWW3vJNp2JNXU/GEkIsToOETkD8QjRPB
         N2Zg==
X-Gm-Message-State: APjAAAXKByzlHccUxAJTnC6KCrBN6ynRC0k88U7+nPU/lzqM8UfpFvUB
        l06zx9FFmaqmKqmg19d02/A=
X-Google-Smtp-Source: APXvYqwmQ0zWTmSyqUGQ+uwoCR4ldO/zmwY8wc11jDimSnmv1YmHJBk/u09q6d+wdYGUiW8KtCogYA==
X-Received: by 2002:adf:ef10:: with SMTP id e16mr4196456wro.336.1575370278677;
        Tue, 03 Dec 2019 02:51:18 -0800 (PST)
Received: from x230 (ipb218f57a.dynamic.kabel-deutschland.de. [178.24.245.122])
        by smtp.gmail.com with ESMTPSA id m8sm2618228wmf.8.2019.12.03.02.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 02:51:17 -0800 (PST)
From:   Eugeniu Rosca <roscaeugeniu@gmail.com>
X-Google-Original-From: Eugeniu Rosca <erosca@de.adit-jv.com>
Date:   Tue, 3 Dec 2019 11:51:03 +0100
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, qemu-devel@nongnu.org,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v3 5/7] gpio: Add GPIO Aggregator/Repeater driver
Message-ID: <20191203105103.GA20470@x230>
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20191127084253.16356-6-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191127084253.16356-6-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

On Wed, Nov 27, 2019 at 09:42:51AM +0100, Geert Uytterhoeven wrote:
> +static int gpio_aggregator_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct gpio_desc **descs;
> +	struct gpiochip_fwd *fwd;
> +	int i, n;

FWIW/FTR, doing some blind creation and deletion of gpio aggregator
chips [1] on R-Car H3ULCB overnight, kmemleak reported once [2]. Not
sure this is something 100% reproducible.

[1] while true; do \
   echo e6055400.gpio 12,13 > /sys/bus/platform/drivers/gpio-aggregator/new_device; \
   echo gpio-aggregator.0 > /sys/bus/platform/drivers/gpio-aggregator/delete_device; \
   done 

[2] unreferenced object 0xffff0006d2c2e000 (size 128):
  comm "kworker/3:1", pid 55, jiffies 4294676978 (age 38546.676s)
  hex dump (first 32 bytes):
    00 d9 d2 d3 06 00 ff ff 0c 00 e0 0f ff ff ff ff  ................
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000a8e18c13>] slab_post_alloc_hook+0x8c/0x94
    [<000000006f419a4f>] __kmalloc+0x170/0x218
    [<0000000060d185ea>] kobj_map+0x78/0x1c0
    [<00000000c96645f3>] cdev_add+0x68/0x94
    [<00000000a7a5a8ac>] cdev_device_add+0x74/0x90
    [<00000000497871d3>] gpiochip_setup_dev+0x84/0x1f0
    [<00000000b993f95f>] gpiochip_add_data_with_key+0xbcc/0x11f0
    [<00000000fd728c0e>] devm_gpiochip_add_data+0x60/0xa8
    [<00000000442e34c1>] gpio_aggregator_probe+0x210/0x3c8
    [<00000000076e13fb>] platform_drv_probe+0x70/0xe4
    [<00000000de84b58b>] really_probe+0x2d8/0x434
    [<00000000c95c9784>] driver_probe_device+0x15c/0x16c
    [<00000000afb7dd4f>] __device_attach_driver+0xdc/0x120
    [<00000000efa40cae>] bus_for_each_drv+0x12c/0x154
    [<00000000c149acef>] __device_attach+0x148/0x1e0
    [<00000000a74fd158>] device_initial_probe+0x24/0x30

-- 
Best Regards,
Eugeniu
