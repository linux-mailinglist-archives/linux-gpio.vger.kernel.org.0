Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B18C113A8D
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2019 04:42:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728560AbfLEDmK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 22:42:10 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:41214 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728098AbfLEDmK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 22:42:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=SKEwuU9LCubrqhiHixUVqpCy0ldQIv/3sUOUcM8nBDs=; b=MBJ6tQQaMPWzRiQjX2yRpygbf
        dvad/n2hXUp0+K09ULooMF6cSihWeH2kJRB60ogr1YNLs9/viLrQWIS+d1LxNt/9Om0oIbiXoJ+o7
        YQ4Af4KYLDE26Fwm4OygR4iCXtTmZaUkommbO2x9E22SJqTPSpaISZ0UsZrQem8NQ9pRvKo2+HnDK
        H+lExL6upZhDp2pLLd/ikAOwm1moJBrui4it/dj5tOoaXx0rhWH8sGeDpNOvMFU9u5KN7e/Dah5A0
        y2BxrelEtJEAvm07pNJfqR63/7BNDW9pQPPMQmLxUjQthY4vvvMRnmHZEiIUW0zJ6Z1ZZpql4FE3b
        JSw1lDxXA==;
Received: from [2601:1c0:6280:3f0::3deb]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ici1p-0006RO-1Q; Thu, 05 Dec 2019 03:42:09 +0000
Subject: Re: [PATCH 1/1] pinctrl: Modify Kconfig to fix linker error
To:     Rahul Tanwar <rahul.tanwar@linux.intel.com>,
        linus.walleij@linaro.org
Cc:     sfr@canb.auug.org.au, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <cover.1575514110.git.rahul.tanwar@linux.intel.com>
 <ba937f271d1a2173828a2325990d62cb36d61595.1575514110.git.rahul.tanwar@linux.intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b92f1c7c-efdb-340d-dbfa-2a083732d8fb@infradead.org>
Date:   Wed, 4 Dec 2019 19:42:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <ba937f271d1a2173828a2325990d62cb36d61595.1575514110.git.rahul.tanwar@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/4/19 7:01 PM, Rahul Tanwar wrote:
> Fix below linker error
> 
>     ld: drivers/pinctrl/pinctrl-equilibrium.o: in function
>     `pinconf_generic_dt_node_to_map_all':
>     pinctrl-equilibrium.c:(.text+0xb): undefined reference
>     to `pinconf_generic_dt_node_to_map'
> 
> Caused by below commit
> 
>     1948d5c51dba ("pinctrl: Add pinmux & GPIO controller driver for a new SoC")
> 
> by adding 'depends on OF' in Kconfig driver entry.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>>
> Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested


Thanks.

> ---
>  drivers/pinctrl/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 3bfbf2ff6e2b..ba0cad4bd072 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -422,6 +422,7 @@ config PINCTRL_TB10X
>  
>  config PINCTRL_EQUILIBRIUM
>  	tristate "Generic pinctrl and GPIO driver for Intel Lightning Mountain SoC"
> +	depends on OF
>  	select PINMUX
>  	select PINCONF
>  	select GPIOLIB
> 


-- 
~Randy

