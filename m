Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C87941F860
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Oct 2021 01:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232158AbhJAXzT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 19:55:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbhJAXzT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Oct 2021 19:55:19 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67A77C061775;
        Fri,  1 Oct 2021 16:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
        Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=5wv6+Frhzsf9ZnmXfBPxgpN4ah/vIcnKRwBiCvQp04A=; b=qERDYPBjPMhHVtObbuD90nXjqT
        RYLeXP5T/UT0ArNmr4bzLPIJw/dGdWxQAIWzuZFwhWDPQsi42IMeRANWSKDN8JDwjsLc9UnUZupE7
        8HFHGisNfDKnJfwq+R8ag1MWSEgcgUJXKVGalm/VlXXSnip8VFIpO+2D8gny4vQ6kawWRDDUMwHDL
        F6XcGAqLpLtF9tTyeg+hDpTvuxDVZuKmAq9LKIAehGSDMQWgK+LFltyEh2GyPotVj7lny60LqmZSC
        eNvYgABxCYBhLVzxRWJG7hNaPlEVTYcBScXfJm8kTL/zG3bw1a9oAjdpEdT6adTyBUCDsU3hHJN/N
        noYy+RWA==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mWSLN-001Ull-9d; Fri, 01 Oct 2021 23:53:33 +0000
Subject: Re: [RFC v2 02/11] drivers: Add hardware timestamp engine (HTE)
To:     Dipen Patel <dipenp@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        warthog618@gmail.com, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org
References: <20210930232617.6396-1-dipenp@nvidia.com>
 <20210930232617.6396-3-dipenp@nvidia.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <010426c7-74ed-33fb-0c06-c42408cffc0e@infradead.org>
Date:   Fri, 1 Oct 2021 16:53:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930232617.6396-3-dipenp@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 9/30/21 4:26 PM, Dipen Patel wrote:
> diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
> new file mode 100644
> index 000000000000..6fdf243d281b
> --- /dev/null
> +++ b/drivers/hte/Kconfig
> @@ -0,0 +1,22 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +menuconfig HTE
> +	bool "Hardware Timestamping Engine (HTE) Support"
> +	help
> +	  Hardware Timestamping Engine (HTE) Support.
> +
> +	  Some devices provide hardware timestamping engine which can timestamp

	               provide a hardware

> +	  certain device lines/signals in realtime. This way to provide

	                                            This provides a

> +	  hardware assisted timestamp to generic signals like GPIOs, IRQs lines

	  hardware-assisted                              like GPIOs or IRQ lines.


> +	  comes with benefit for the applications like autonomous machines

	  It comes with a benefit for applications like

> +	  needing accurate timestamping event with less jitter.
> +
> +	  This framework provides a generic interface to such HTE devices
> +	  within the Linux kernel. It provides an API to register and
> +	  unregister a HTE provider chip, configurable sw buffer to

	                                               software

> +	  store the timestamps, push the timestamp from the HTE providers and
> +	  retrieve timestamps for the consumers. It also provides means for the
> +	  consumers to request signals it wishes to hardware timestamp and
> +	  release them if not required.
> +
> +	  If unsure, say no.


HTH.
-- 
~Randy
