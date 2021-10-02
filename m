Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEE3E41F87C
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Oct 2021 02:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232181AbhJBAKg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 20:10:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbhJBAKg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Oct 2021 20:10:36 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E30DC061775;
        Fri,  1 Oct 2021 17:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
        Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=+sQUt7IX2KLd/sKNrDCXq3+jeNXMP8gWMLRkP4shBf8=; b=I8pp4tfk5NBW51EsUixX1AYK4d
        Ac1SpeEe98FnSJAEbPmcN4Dmrf6YfhbemHJkXWVypFjYfYx9c8t4QHQ9c1pqY7Us4z+ABv/+DINts
        +PHalbJKz4AB/7zGlZkTWPs0wq4ZAGiyGnXXqVph9fEMZ5mJLJR/IdeUrtyGaqnKw9Y7tPPRLrghr
        RdU/RshQ59NuKcBY037zaAlFn+HWs6/gf7Gk3nJ3DuC1PNdpoeNUJd1Qn+D2UeC/SL6dnjvKfr9aA
        FpaSaNlQKAHo76tiC+ijzwVRzcRqD+WPGWdWEnrUEgr368avsy7wQFzGOzzhlaJffo8H5RjJy0Ng7
        P+0liFkQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mWSaB-001VTz-4T; Sat, 02 Oct 2021 00:08:51 +0000
Subject: Re: [RFC v2 11/11] MAINTAINERS: Added HTE Subsystem
To:     Dipen Patel <dipenp@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        warthog618@gmail.com, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org
References: <20210930232617.6396-1-dipenp@nvidia.com>
 <20210930232617.6396-12-dipenp@nvidia.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b6a968cb-1d7b-887c-8995-6e6b9fef03bf@infradead.org>
Date:   Fri, 1 Oct 2021 17:08:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930232617.6396-12-dipenp@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 9/30/21 4:26 PM, Dipen Patel wrote:
> Added myself as a maintainer for this new Hardware Timestamping Engine
> (HTE) subsystem.
> 
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> ---
>   MAINTAINERS | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index abd0dd5aa003..03ae8056c35b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8659,6 +8659,14 @@ L:	linux-input@vger.kernel.org
>   S:	Maintained
>   F:	drivers/input/touchscreen/htcpen.c
>   
> +HTE SUBSYSTEM
> +M:	dipenp@nvidia.com

Please update as documented:
	M: *Mail* patches to: FullName <address@domain>


> +S:	Maintained
> +F:	drivers/hte/*
> +F:	include/linux/hte.h
> +F:	Documentation/hte/*
> +F:	Documentation/devicetree/bindings/hte/*
> +
>   HTS221 TEMPERATURE-HUMIDITY IIO DRIVER
>   M:	Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>
>   L:	linux-iio@vger.kernel.org
> 


-- 
~Randy
