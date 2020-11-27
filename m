Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC1B92C6BB6
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Nov 2020 19:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728235AbgK0SrM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Nov 2020 13:47:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728404AbgK0Sq4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Nov 2020 13:46:56 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A263FC0613D2;
        Fri, 27 Nov 2020 10:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=rhJY7wLAspkaYEzHkh+yVX+skQbZ/DMKzfC009QO4I8=; b=Jl3letptNo6u4QgElIXiUuVDjW
        td6bdKE9PaWZb/3s15iGapD4moQGO+8TeXlAArrzMZ0OLWEEmQy47u8STeR5T/BsPWgQSri8vmCa/
        D2JxjFG10Vkzgk4028eQdXoJjws2M5CS34SO9fxczCPNSiCnr2f3IYBSymn6Q6ZjwcRzEpYwNLR15
        ehIYizH0dHbVe4NJ9kds1RVL2QVzFxXHrrBpTFCbYhmjpxIAsrd94lnDruwV1cWGF0qtvmbVJlePv
        4ar/h3Ajh9e/YfDCORx/Trj81HpwhhsyBNBdY6nNX/mUasID1wrJnagY6T+QGMcQs70gGxpKTUo1o
        kmioOo1A==;
Received: from [2601:1c0:6280:3f0::cc1f]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kiike-0000vy-Et; Fri, 27 Nov 2020 18:45:48 +0000
Subject: Re: [PATCH] drivers: gpio: add virtio-gpio guest driver
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        mst@redhat.com, jasowang@redhat.com, linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org
References: <20201127183003.2849-1-info@metux.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ba756539-2435-3587-3aeb-31e7ce95aad7@infradead.org>
Date:   Fri, 27 Nov 2020 10:45:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201127183003.2849-1-info@metux.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11/27/20 10:30 AM, Enrico Weigelt, metux IT consult wrote:
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 5d4de5cd6759..e8414d82cf75 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1613,4 +1613,13 @@ config GPIO_MOCKUP
>  	  tools/testing/selftests/gpio/gpio-mockup.sh. Reference the usage in
>  	  it.
>  
> +config GPIO_VIRTIO
> +	tristate "VirtIO GPIO support"
> +	depends on VIRTIO
> +	help
> +	  Say Y here to enable guest support for virtio based GPIOs.

	                                         virtio-based

> +
> +	  These virtual gpios can be routed to real GPIOs or attached to

	                GPIOs

> +	  simulators on the host (qemu).
> +
>  endif


-- 
~Randy

