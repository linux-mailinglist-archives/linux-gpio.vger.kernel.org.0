Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57E2E3B931E
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jul 2021 16:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232709AbhGAOYf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jul 2021 10:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231844AbhGAOYf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jul 2021 10:24:35 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCCFCC061762;
        Thu,  1 Jul 2021 07:22:04 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d1so3734249plg.6;
        Thu, 01 Jul 2021 07:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UpqOpHvXEAoDAsxLlnd6pdVYqhQmAQPOcy3HAy0U/pY=;
        b=O07qkQa9wkwvElaSOvZ6827/5/Eg3qIHpLYSK7KUw86iIKrHb1bzDRDwuqo48+7Pto
         gSt00wAhXg6PT6LN6Y0N6yhrzUowRn8WrYiq6g4ho3JhYPM9JAS5clPfBAor1aQNjlM7
         ov3PU1VFAnJXQJk1vNrSVZQjBky7WqsSd3Kbgdhlb5rh1lq0ol4Y1HyRfsBQDaJeNV5T
         ISPTSAuB++G9AImOZVwLYsRS1nFzOSmJ5xdbqLV8uDATnctxRsHad01rQ0Rt7yi/VkpH
         NY6z1ZxdCEJfVQQRoNPx6yd7ME+ZtDz9MqtDFyFeRJGwWGcdf6Tu1F1ITqteTk5hUKzl
         6hbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UpqOpHvXEAoDAsxLlnd6pdVYqhQmAQPOcy3HAy0U/pY=;
        b=Xenubmhsooce0hY4dkWFCq2XbACWtSCvpz9wpAhjx4JIovcdI6QqMMPDdl4nGTU6p/
         n62N+GrbIyjC0aIoUxMGUcJHZGDsgsZaAM8YyAos7zLaKV5Pi4y4fsT27R4Hr2QAsW4I
         1pr8NR3oqrd14ReSdymEJ4Ru6Aj3o3ooHpcGJRGTseM4nV9IK6dlti5dgnqm6sN4Xk5W
         +Br9xAYAyZbG1VutS8K7wP6sj8QctNFBzfb7ffkmgiExT9rXCapcfBVKAB/QK3Vr9gmk
         PdB276CmjpzVAqPS2juDIgi5iTcYbtnRD4EPJ6eMmRxSVt4gGKkBS1WDV4cCgxGrl5Zl
         1hgQ==
X-Gm-Message-State: AOAM530hSaNgJWFU+kuTVMFHPfCHsorWWnDrcX32Hmt89uXdPxgG5VO2
        ev0+uWftVoFaI8NRHEzM/ASzPPzaebv78g==
X-Google-Smtp-Source: ABdhPJx/5OEpzmwmxSob93YROk58y9bD0D+JPRKerDq+DrTK43rME3MwO8wWjj7aF38/h79uWchG8A==
X-Received: by 2002:a17:902:8601:b029:11c:4b4:e967 with SMTP id f1-20020a1709028601b029011c04b4e967mr37844170plo.75.1625149324228;
        Thu, 01 Jul 2021 07:22:04 -0700 (PDT)
Received: from sol (106-69-174-4.dyn.iinet.net.au. [106.69.174.4])
        by smtp.gmail.com with ESMTPSA id m3sm218812pfc.40.2021.07.01.07.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 07:22:03 -0700 (PDT)
Date:   Thu, 1 Jul 2021 22:21:56 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [RFC 03/11] hte: Add tegra194 HTE kernel provider
Message-ID: <20210701142156.GA34285@sol>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-4-dipenp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210625235532.19575-4-dipenp@nvidia.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 25, 2021 at 04:55:24PM -0700, Dipen Patel wrote:
> Tegra194 device has multiple HTE instances also known as GTE
> (Generic hardware Timestamping Engine) which can timestamp subset of
> SoC lines/signals. This provider driver focuses on IRQ and GPIO lines
> and exposes timestamping ability on those lines to the consumers
> through HTE subsystem.
> 
> Also, with this patch, added:
> - documentation about this provider and its capabilities at
> Documentation/hte.
> - Compilation support in Makefile and Kconfig
> 
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> ---
>  Documentation/hte/index.rst        |  21 ++
>  Documentation/hte/tegra194-hte.rst |  65 ++++
>  Documentation/index.rst            |   1 +
>  drivers/hte/Kconfig                |  12 +
>  drivers/hte/Makefile               |   1 +
>  drivers/hte/hte-tegra194.c         | 554 +++++++++++++++++++++++++++++
>  6 files changed, 654 insertions(+)
>  create mode 100644 Documentation/hte/index.rst
>  create mode 100644 Documentation/hte/tegra194-hte.rst
>  create mode 100644 drivers/hte/hte-tegra194.c
> 
> diff --git a/Documentation/hte/index.rst b/Documentation/hte/index.rst
> new file mode 100644
> index 000000000000..f311ebec6b47
> --- /dev/null
> +++ b/Documentation/hte/index.rst
> @@ -0,0 +1,21 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +============================================
> +The Linux Hardware Timestamping Engine (HTE)
> +============================================
> +
> +The HTE Subsystem
> +=================
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   hte
> +
> +HTE Tegra Provider
> +==================
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   tegra194-hte
> \ No newline at end of file
> diff --git a/Documentation/hte/tegra194-hte.rst b/Documentation/hte/tegra194-hte.rst
> new file mode 100644
> index 000000000000..c23eaafcf080
> --- /dev/null
> +++ b/Documentation/hte/tegra194-hte.rst
> @@ -0,0 +1,65 @@
> +HTE Kernel provider driver
> +==========================
> +
> +Description
> +-----------
> +The Nvidia tegra194 chip has many hardware timestamping engine (HTE) instances
> +known as generic timestamping engine (GTE). This provider driver implements
> +two GTE instances 1) GPIO GTE and 2) IRQ GTE. The both GTEs instances get the
> +timestamp from the system counter TSC which has 31.25MHz clock rate, and the
> +driver converts clock tick rate to nano seconds before storing it as timestamp
> +value.
> +
> +GPIO GTE
> +--------
> +
> +This GTE instance help timestamps GPIO in real time, for that to happen GPIO
> +needs to be configured as input and IRQ needs to ba enabled as well. The only
> +always on (AON) gpio controller instance supports timestamping GPIOs in
> +realtime and it has 39 GPIO lines. There is also a dependency on AON GPIO
> +controller as it requires very specific bits to be set in GPIO config register.
> +It in a way creates cyclic dependency between GTE and GPIO controller. The GTE
> +GPIO functionality is accessed from the GPIOLIB. It can support both the in
> +kernel and userspace consumers. In the later case, requests go through GPIOLIB
> +CDEV framework. The below APIs are added in GPIOLIB framework to access HTE
> +subsystem and GPIO GTE for in kernel consumers.
> +
> +.. c:function:: int gpiod_hw_timestamp_control( struct gpio_desc *desc, bool enable )
> +
> +	To enable HTE on given GPIO line.
> +
> +.. c:function:: u64 gpiod_get_hw_timestamp( struct gpio_desc *desc, bool block )
> +
> +	To retrieve hardwre timestamp in nano seconds.
> +
> +.. c:function:: bool gpiod_is_hw_timestamp_enabled( const struct gpio_desc *desc )
> +
> +	To query if HTE is enabled on the given GPIO.
> +
> +There is hte-tegra194-gpio-test.c, located in ``drivers/hte/`` directory, test
> +driver which demonstrates above APIs for the Jetson AGX platform. For userspace
> +consumers, GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE flag must be specifed during
> +IOCTL calls, refer ``tools/gpio/gpio-event-mon.c``, which returns the timestamp
> +in nano second.
> +

<snip>

> +
> +static void tegra_hte_read_fifo(struct tegra_hte_soc *gs)
> +{
> +	u32 tsh, tsl, src, pv, cv, acv, slice, bit_index, line_id;
> +	u64 tsc;
> +	int dir;
> +	struct hte_ts_data el;
> +
> +	while ((tegra_hte_readl(gs, HTE_TESTATUS) >>
> +		HTE_TESTATUS_OCCUPANCY_SHIFT) &
> +		HTE_TESTATUS_OCCUPANCY_MASK) {
> +		tsh = tegra_hte_readl(gs, HTE_TETSCH);
> +		tsl = tegra_hte_readl(gs, HTE_TETSCL);
> +		tsc = (((u64)tsh << 32) | tsl);
> +
> +		src = tegra_hte_readl(gs, HTE_TESRC);
> +		slice = (src >> HTE_TESRC_SLICE_SHIFT) &
> +			    HTE_TESRC_SLICE_DEFAULT_MASK;
> +
> +		pv = tegra_hte_readl(gs, HTE_TEPCV);
> +		cv = tegra_hte_readl(gs, HTE_TECCV);
> +		acv = pv ^ cv;
> +		while (acv) {
> +			bit_index = __builtin_ctz(acv);
> +			if ((pv >> bit_index) & BIT(0))
> +				dir = HTE_EVENT_RISING_EDGE;
> +			else
> +				dir = HTE_EVENT_FALLING_EDGE;
> +
> +			line_id = bit_index + (slice << 5);
> +			el.dir = dir;
> +			el.tsc = tsc << HTE_TS_NS_SHIFT;
> +			hte_push_ts_ns_atomic(gs->chip, line_id, &el,
> +					      sizeof(el));
> +			acv &= ~BIT(bit_index);
> +		}
> +		tegra_hte_writel(gs, HTE_TECMD, HTE_TECMD_CMD_POP);
> +	}
> +}

What happens when the hte_push_ts_ns_atomic() fails?
The timestamp will be quietly dropped?
What happens when the interrupt corresponding to that dropped timestamp
asks for it?  The irq handler thread will block until it can get a
timestamp from the subsequent interrupt?

Which brings me back to the concern I have with the approach used in
the hte/gpiolib integration - how do you guarantee that the timestamp
returned by gpiod_get_hw_timestamp() corresponds to the irq interrupt
being handled, particularly in the face of errors such as:
 - overflows of the timestamp FIFO in the chip
 - overflows of software FIFOs as here
 - lost interupts (if the hw generates interrupts faster than the CPU
   can service them)
?

Cheers,
Kent.

