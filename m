Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3B9F176E25
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2020 05:45:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgCCEpi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Mar 2020 23:45:38 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:44544 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726954AbgCCEph (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Mar 2020 23:45:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=eLN9YBiut+Gct7IPcAPFG+XNP1pdvkitmza97VKOpx4=; b=WnpEGMNvpbb3FWnqXyTVw6ttOp
        SIV3NYVwCcFouCVDjMJuqjgKkB/ynlpqqIVj1PxxbgKM+chESG8Jdvbyz9jyjyh2kS9E5mH/5pvEv
        eQxYpgmqkiz/ER3qDrFtlkFlX0tAX3EyMC+bqPW4h3p9g8oFcV4vWpYL80BQ6KoDIx45o5Vw0j6qV
        cP+AnG3nNRoeFXsNYtTXtpZDgR2MqY/RzWt8nSkH0C2+lm3tDnRhhjc3pyzjNoBKDgOqrIUbQAfhV
        RuBS76fpmFuF00svrfSJgdgYGRMfZ6qHU6A5ZW8tW3DsZv+PyvPEsOJCorXkxHSDBDLCVEBtbQldl
        7heFbZtA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j8zR3-0000hy-2G; Tue, 03 Mar 2020 04:45:37 +0000
Subject: Re: [PATCH] pinctrl: sprd: Fix the kconfig warning
To:     Baolin Wang <baolin.wang7@gmail.com>, linus.walleij@linaro.org
Cc:     orsonzhai@gmail.com, zhang.lyra@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <eeb12d7843fb06f80e19f98eb25711231c3b610f.1583205650.git.baolin.wang7@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3271ce73-7165-c545-43e7-93d85a7c3680@infradead.org>
Date:   Mon, 2 Mar 2020 20:45:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <eeb12d7843fb06f80e19f98eb25711231c3b610f.1583205650.git.baolin.wang7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 3/2/20 7:32 PM, Baolin Wang wrote:
> On X86 plaform, if the CONFIG_OF is not selected, and set the
> CONFIG_SPRD_SC9860 as 'm', that will cause below waring:
> 
> WARNING: unmet direct dependencies detected for PINCTRL_SPRD
>   Depends on [n]: PINCTRL [=y] && OF [=n] && (ARCH_SPRD || COMPILE_TEST [=y])
>   Selected by [m]:
>   - PINCTRL_SPRD_SC9860 [=m] && PINCTRL [=y]
> 
> Thus move the configuration dependency under CONFIG_PINCTRL_SPRD_SC9860
> to fix the warning.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Baolin Wang <baolin.wang7@gmail.com>

Works for me.  Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested


> ---
>  drivers/pinctrl/sprd/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/sprd/Kconfig b/drivers/pinctrl/sprd/Kconfig
> index c9e7f0b..eef35d0 100644
> --- a/drivers/pinctrl/sprd/Kconfig
> +++ b/drivers/pinctrl/sprd/Kconfig
> @@ -4,9 +4,7 @@
>  #
>  
>  config PINCTRL_SPRD
> -	tristate "Spreadtrum pinctrl driver"
> -	depends on OF
> -	depends on ARCH_SPRD || COMPILE_TEST
> +	tristate
>  	select PINMUX
>  	select PINCONF
>  	select GENERIC_PINCONF
> @@ -16,6 +14,8 @@ config PINCTRL_SPRD
>  
>  config PINCTRL_SPRD_SC9860
>  	tristate "Spreadtrum SC9860 pinctrl driver"
> +	depends on OF
> +	depends on ARCH_SPRD || COMPILE_TEST
>  	select PINCTRL_SPRD
>  	help
>  	  Say Y here to enable Spreadtrum SC9860 pinctrl driver
> 


-- 
~Randy

