Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2544541F876
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Oct 2021 02:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232081AbhJBAIu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 20:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbhJBAIt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Oct 2021 20:08:49 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CABBC061775;
        Fri,  1 Oct 2021 17:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
        Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=GgvZMbZiiu0lk+dxyG+9TnZUIh1qpuRGDiuiezF4wiA=; b=BNJWCR9c6YTky7PWSrT5obSE/i
        Xmet09MmTbIsIQH/ey0OTZgUz6a/jYHkaSVGsWLRlVYkKqDLQEW+D1VVjZnPFmRddbDP031mLM1j8
        qdxteNc+oZclAHdBI5fvM10Bsyly7Alo0+V18AVjtqi6oNDNu4AgMDzSDqxAzFmmjVJJFjB2REwyk
        sLmnYnYF3z7WRwc2CzJzgvdeMwpuyAocS7poMPqhx+eGPirVUtfB3ZJ2yj6dIyaFMP5rKAPPX8k4z
        q5u2557wlmxZtAdq+IY64eBB6sl1fRWgERUsvadOCwPvIVi9/QGhja+DEWLcTO5OkeD5i6UufTVol
        IXFQpvlw==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mWSYS-001VJe-3e; Sat, 02 Oct 2021 00:07:04 +0000
Subject: Re: [RFC v2 03/11] hte: Add tegra194 HTE kernel provider
To:     Dipen Patel <dipenp@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        warthog618@gmail.com, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org
References: <20210930232617.6396-1-dipenp@nvidia.com>
 <20210930232617.6396-4-dipenp@nvidia.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c86597f6-495f-5fa1-d7ff-9bd05c8d2788@infradead.org>
Date:   Fri, 1 Oct 2021 17:07:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930232617.6396-4-dipenp@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 9/30/21 4:26 PM, Dipen Patel wrote:
> diff --git a/Documentation/hte/tegra194-hte.rst b/Documentation/hte/tegra194-hte.rst
> new file mode 100644
> index 000000000000..fb229bda2408
> --- /dev/null
> +++ b/Documentation/hte/tegra194-hte.rst
> @@ -0,0 +1,56 @@
> +HTE Kernel provider driver
> +==========================
> +
> +Description
> +-----------
> +The Nvidia tegra194 HTE provider driver implements two GTE
> +(Generic Timestamping Engine) instances 1) GPIO GTE and 2) LIC IRQ GTE. The

                                  instances:                                ^^Drop "The"

> +both GTEs instances get the timestamp from the system counter TSC which has

    Both

> +31.25MHz clock rate, and the driver converts clock tick rate to nano seconds

                                                                    nanoseconds

> +before storing it as timestamp value.
> +
> +GPIO GTE
> +--------
> +
> +This GTE instance timestamps GPIO in real time, for that to happen GPIO

                                              time. For

> +needs to be configured as input and IRQ needs to ba enabled. The only always on

                                                     be

> +(AON) gpio controller instance supports timestamping GPIOs in realtime and it

          GPIO                                                    real time {or change
                            the instance 3 lines above to be "realtime"}

> +has 39 GPIO lines. The GPIO GTE and AON GPIO controller are tightly coupled as
> +it requires very specific bits to be set in GPIO config register before GPIO> +GTE can be used. The GPIO GTE functionality is accessed from the GPIOLIB
> +framework for the in kernel and userspace consumers. In the later case,

                      in-kernel                                 latter

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
> +specifed during IOCTL calls, refer ``tools/gpio/gpio-event-mon.c``, which

    specified             calls. Refer to

> +returns the timestamp in nano second.

                             nanoseconds.

> +
> +LIC IRQ GTE
> +-----------
> +
> +This GTE instance timestamp LIC IRQ lines in real time. There are 352 IRQ

                      timestamps                 ^^^^^^^^^ {be consistent}
   (also (repeating a prior email) define "LIC")

> +lines which this instance can help timestamp realtime. The hte devicetree

                              can add timestamps to in realtime.

> +binding described at ``Documentation/devicetree/bindings/hte/`` gives out

                                                                    provides an

> +example how consumer can request IRQ line, since it is one to one mapping,

    example of how a consumer can request an IRQ line. Since it is a one-to-one mapping,

> +consumers can simply specify IRQ number that they are interested in. There is

                         specify the IRQ number

> +no userspace consumer support for this GTE instance. The sample test code
> +hte-tegra194-irq-test.c, located in ``drivers/hte/`` directory,

                                     in the

> +demonstrates how to use IRQ GTE instance. The below is sample device tree

                 how to use an IRQ GTE instance.

> +snippet code for the test driver::
> +
> + tegra_hte_irq_test {
> +        compatible = "nvidia,tegra194-hte-irq-test";
> +        htes = <&tegra_hte_lic 0x19>;
> +        hte-names = "hte-lic";
> + };
> +
> +The provider source code of both IRQ and GPIO GTE instances is locate at

                                                                   located

> +``drivers/hte/hte-tegra194.c``.
> +


-- 
~Randy
