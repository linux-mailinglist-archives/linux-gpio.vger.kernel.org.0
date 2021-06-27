Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6643B5491
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jun 2021 19:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231429AbhF0RqD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Jun 2021 13:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbhF0RqD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Jun 2021 13:46:03 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F232CC061574;
        Sun, 27 Jun 2021 10:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
        Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=+KUJztB76RmAV0aA24uXY6Y2cMuNUIBfXToczeSdKns=; b=2M4mJDWbMmR1hn8uFPwoC4phCO
        vKi5dLzYgXNgkavSJBryhZmrFh7c5o6zFghCoGr7wX4yQ37ME8DURfxQtPU3v2nwWuDtk2UzAtYfG
        RgSArFLYCxUBn3oIN5eKtM9GdNbvDTwsfFwBA18DHicBoxfx6dFWXrNG3FTZbfvqxoXTk5S3zyUVb
        braigbcF39XRT+kxKcLxw1cyPpvpEsMlZ15vety5GpmBXmODNNS6RGya/ApKaZ+it/1PBQoeYWrBc
        nswVf/P9KpAypMAnElj4nL/8/gykNflxCJ12Rzu9q5qHs+wvZ5S1sZy27q5UJAgud9jRH3bzIm8CH
        o6IgWakw==;
Received: from [2601:1c0:6280:3f0::aefb]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lxYok-005wmF-FT; Sun, 27 Jun 2021 17:43:38 +0000
Subject: Re: [RFC 10/11] hte: Add tegra GPIO HTE test driver
To:     Dipen Patel <dipenp@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        warthog618@gmail.com, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-11-dipenp@nvidia.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6e83e300-5baa-0ddb-465f-8a38ab8bbca6@infradead.org>
Date:   Sun, 27 Jun 2021 10:43:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625235532.19575-11-dipenp@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 6/25/21 4:55 PM, Dipen Patel wrote:
> diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
> index c4d335c41254..e62077c1024c 100644
> --- a/drivers/hte/Kconfig
> +++ b/drivers/hte/Kconfig
> @@ -38,4 +38,12 @@ config HTE_TEGRA194_IRQ_TEST
>            The NVIDIA Tegra194 GTE IRQ test driver demonstrates HTE subsystem
>  	  usage for the LIC IRQ hardware timestamp.
>  
> +config HTE_TEGRA194_GPIO_TEST
> +        tristate "NVIDIA Tegra194 HTE GPIO Test"
> +        depends on HTE_TEGRA194
> +        help
> +          The NVIDIA Tegra194 GTE GPIO test driver demonstrates how to use HTE
> +	  subsystem indirectly through gpiolib API calls for GPIO line for the
> +	  hardware assisted timestamping.
> +
>  endif

Fix indentation, please.

-- 
~Randy

