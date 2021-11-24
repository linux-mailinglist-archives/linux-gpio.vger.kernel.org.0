Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5737D45B0D5
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Nov 2021 01:45:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231542AbhKXAst (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 19:48:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230490AbhKXAss (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Nov 2021 19:48:48 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55712C061574;
        Tue, 23 Nov 2021 16:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
        Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=xB27hI0vcoK0X7IUXCx/Mp5AQPjXWuTvs7bAHhqYjwA=; b=XTfJCm0fQIqtp31k/uUvMW2enX
        jA95MI5dUEwQC9pe//yZqS3E1T1g7cUDEFO9Yv0oY8NoVn/3HwHoQsdTguxQkrWVF8AhtgW9pC3tA
        IGNVE1C+jfYBu5wHvXIZAzSxkdXrHO4JjF+tgX29Yfs7I9/vrlqXdIyozlKFP/i74SjTGIIJW7LQA
        KrglDy6gWneibZzAAu0onNDNEq6xsHDL4IhXwE7YUlb9VWNTg2lWcjyTqOqV42IB9vr2MkZHbE5FV
        d4FaUkwXrQEy8UgUGee4IscwFRQ53ZKTfuh+IGuFy0WQwCTJs2Vn78fNPQnp9qiIkwYg7c16ChR3t
        oRqoycFQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mpgPr-003ksM-9T; Wed, 24 Nov 2021 00:45:39 +0000
Subject: Re: [RFC v3 03/12] hte: Add tegra194 HTE kernel provider
To:     Dipen Patel <dipenp@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        warthog618@gmail.com, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org
References: <20211123193039.25154-1-dipenp@nvidia.com>
 <20211123193039.25154-4-dipenp@nvidia.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a47ccdf7-0d35-feea-0015-526f65bfffac@infradead.org>
Date:   Tue, 23 Nov 2021 16:45:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211123193039.25154-4-dipenp@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi--

On 11/23/21 11:30 AM, Dipen Patel wrote:
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
> Changes in v3:
> - Addressed grammatical/spelling errors.
> 
>   Documentation/hte/index.rst        |  22 ++
>   Documentation/hte/tegra194-hte.rst |  57 +++
>   Documentation/index.rst            |   1 +
>   drivers/hte/Kconfig                |  12 +
>   drivers/hte/Makefile               |   1 +
>   drivers/hte/hte-tegra194.c         | 545 +++++++++++++++++++++++++++++
>   6 files changed, 638 insertions(+)
>   create mode 100644 Documentation/hte/index.rst
>   create mode 100644 Documentation/hte/tegra194-hte.rst
>   create mode 100644 drivers/hte/hte-tegra194.c
> 

> diff --git a/Documentation/hte/tegra194-hte.rst b/Documentation/hte/tegra194-hte.rst
> new file mode 100644
> index 000000000000..3bebcbac5847
> --- /dev/null
> +++ b/Documentation/hte/tegra194-hte.rst
> @@ -0,0 +1,57 @@
> +HTE Kernel provider driver
> +==========================
> +
> +Description
> +-----------
> +The Nvidia tegra194 HTE provider driver implements two GTE
> +(Generic Timestamping Engine) instances: 1) GPIO GTE and 2) LIC
> +(Legacy Interrupt Controller) IRQ GTE. Both GTEs instances get the

                                           Both GTE instances

> +timestamp from the system counter TSC which has 31.25MHz clock rate, and the
> +driver converts clock tick rate to nanoseconds before storing it as timestamp
> +value.
> +
> +GPIO GTE
> +--------
> +
> +This GTE instance timestamps GPIO in real time. For that to happen GPIO
> +needs to be configured as input and IRQ needs to be enabled. The only always on

                         Is "only" supposed to be here? ----------- ^^^^^^

> +(AON) GPIO controller instance supports timestamping GPIOs in real time and it
> +has 39 GPIO lines. The GPIO GTE and AON GPIO controller are tightly coupled as
> +it requires very specific bits to be set in GPIO config register before GPIO
> +GTE can be used. The GPIO GTE functionality is accessed from the GPIOLIB
> +framework for the in-kernel and userspace consumers. In the latter case,
> +requests go through GPIOLIB CDEV framework. The below APIs are added in GPIOLIB
> +framework to access HTE subsystem and GPIO GTE.
> +
> +.. kernel-doc:: drivers/gpio/gpiolib.c
> +   :functions: gpiod_req_hw_timestamp_ns gpiod_rel_hw_timestamp_ns
> +
> +There is hte-tegra194-gpio-test.c, located in ``drivers/hte/`` directory, test
> +driver which demonstrates above APIs for the Jetson AGX platform.
> +
> +For userspace consumers, GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE flag must be
> +specified during IOCTL calls. Refer to ``tools/gpio/gpio-event-mon.c``, which
> +returns the timestamp in nanoseconds.
> +
> +LIC (Legacy Interrupt Controller) IRQ GTE
> +-----------------------------------------
> +
> +This GTE instance timestamps LIC IRQ lines in real time. There are 352 IRQ
> +lines which this instance can add timestamps to in real time. The hte
> +devicetree binding described at ``Documentation/devicetree/bindings/hte/``
> +provides an example of how a consumer can request an IRQ line. Since it is a
> +one-to-one mapping, consumers can simply specify the IRQ number that they are
> +interested in. There is no userspace consumer support for this GTE instance in
> +the hte framework. The sample test code hte-tegra194-irq-test.c, located in
> +the ``drivers/hte/`` directory, demonstrates how to use an IRQ GTE instance.
> +The below is sample device tree snippet code for the test driver::
> +
> + tegra_hte_irq_test {
> +        compatible = "nvidia,tegra194-hte-irq-test";
> +        htes = <&tegra_hte_lic 0x19>;
> +        hte-names = "hte-lic";
> + };
> +
> +The provider source code of both IRQ and GPIO GTE instances is located at
> +``drivers/hte/hte-tegra194.c``.
> +
> diff --git a/Documentation/index.rst b/Documentation/index.rst
> index 1b13c2445e87..b41118577fe6 100644
> --- a/Documentation/index.rst
> +++ b/Documentation/index.rst
> @@ -138,6 +138,7 @@ needed).
>      misc-devices/index
>      scheduler/index
>      mhi/index
> +   hte/index

Looks like a text alignment problem there.

>   
>   Architecture-agnostic documentation
>   -----------------------------------


-- 
~Randy
