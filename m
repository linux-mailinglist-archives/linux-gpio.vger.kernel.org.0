Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 492E641F856
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Oct 2021 01:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbhJAXtZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 19:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbhJAXtZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Oct 2021 19:49:25 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4ECBC061775;
        Fri,  1 Oct 2021 16:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
        Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=D+j+WybPtmBEnVTBgvwYlUNDCxR06I1ekoF/x1QDvas=; b=AmhgeVmYCjSkxdLFxYHMoNieYV
        yqxGhkhYuoivjTkmG7jNJA36wvfSn4ZM7SBLQTM3lMJUI+KTD0BncIL1YF6QStnzYqGjQEr6WFWQe
        J6cOZ4qcj7TMURyYpEjdRlk4WZD2VuzOpVW/T3vRShQpYklX2A6HjrKsjzEUAaWSXQQMEukMTjp7p
        KRaObp+XQzxJX7H1FOTVOZ5XiJzzD7Oo8kLColr8qqTCsozrPjSQgzZhVxE1Qgn/e5DcJR2ogVgEi
        Je08v+zWOyk7b90UHHLmxenMMTJTv4IrLRquFPdgmVNXnoXfIg/Yb79JQhM3dg66VOuaTvHKC13yn
        u0GAd79g==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mWSFg-001UUH-3k; Fri, 01 Oct 2021 23:47:40 +0000
Subject: Re: [RFC v2 10/11] hte: Add tegra GPIO HTE test driver
To:     Dipen Patel <dipenp@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        warthog618@gmail.com, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org
References: <20210930232617.6396-1-dipenp@nvidia.com>
 <20210930232617.6396-11-dipenp@nvidia.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <466cf944-4eae-ad4c-dcf5-42e2e043b754@infradead.org>
Date:   Fri, 1 Oct 2021 16:47:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930232617.6396-11-dipenp@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 9/30/21 4:26 PM, Dipen Patel wrote:
> diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
> index eb339526f141..57c97034d187 100644
> --- a/drivers/hte/Kconfig
> +++ b/drivers/hte/Kconfig
> @@ -38,4 +38,13 @@ config HTE_TEGRA194_IRQ_TEST
>   	  The NVIDIA Tegra194 GTE IRQ test driver demonstrates HTE subsystem
>   	  usage for the LIC IRQ hardware timestamp.
>   
> +config HTE_TEGRA194_GPIO_TEST
> +        tristate "NVIDIA Tegra194 HTE GPIO Test"
> +        depends on HTE_TEGRA194
> +        help
> +	  The NVIDIA Tegra194 GTE GPIO test driver demonstrates how to use HTE

	                                                            to use the HTE

> +	  subsystem indirectly through gpiolib API calls for GPIO line for the

	                                                          lines

> +	  hardware assisted timestamping.

	  hardware-assisted

> +
>   endif

Also:

Please follow coding-style for Kconfig files:

(from Documentation/process/coding-style.rst, section 10):

For all of the Kconfig* configuration files throughout the source tree,
the indentation is somewhat different.  Lines under a ``config`` definition
are indented with one tab, while help text is indented an additional two
spaces.

Some of the lines above are indented with spaces instead of one tab.


thanks.
-- 
~Randy
