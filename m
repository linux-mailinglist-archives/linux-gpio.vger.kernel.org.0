Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1958628B431
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Oct 2020 13:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388343AbgJLLzA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 07:55:00 -0400
Received: from first.geanix.com ([116.203.34.67]:46678 "EHLO first.geanix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388255AbgJLLzA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Oct 2020 07:55:00 -0400
Received: from [192.168.8.20] (unknown [85.184.138.169])
        by first.geanix.com (Postfix) with ESMTPSA id 0457DF411E4;
        Mon, 12 Oct 2020 11:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
        t=1602503698; bh=8KpZ/LqtudnWkL9wT0zNWYXQwli628YNhNK2pWomEPQ=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=IvjD+ZhEAOyEAGwZILlezGsQ4+vC/UdbyfKfUXqMovAzniJqQtmK1YdhhiEB4yNlG
         rLoXMhZtgWbaItkce3DtMJb8rdkE5VMXsBVx77pbFLVqEqcMUSGd9+jOJ5Do1djORU
         v9f4PHnU2VXjMN7CgeEtdsvILDUfNefa/GwWlM8zxrBvBeCTYl6ISl6jNhPWRkV6fw
         eWMig2K+BA4QHddp9RP0GXCHA3MHwIoz+LQjrYmccfH9Qhq0NNUV0AXZFy2fdavyQu
         EVa+t/xVO+pU6aLcswclIIinxOt96bOlJNRpnAVNHtilPsc5iy1W30vYKRbTce4ORQ
         hZuIYb69gVLMA==
Subject: Re: [PATCH v2 1/2] pinctrl: mcp23s08: Use full chunk of memory for
 regmap configuration
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
References: <20201009180856.4738-1-andriy.shevchenko@linux.intel.com>
From:   =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <dadaf399-03cc-1512-8208-76565ab257a7@geanix.com>
Date:   Mon, 12 Oct 2020 13:54:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201009180856.4738-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=4.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        URIBL_BLOCKED autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on ff3d05386fc5
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

You can add my
Tested-by: Martin Hundebøll <martin@geanix.com>

Thanks,
Martin

On 09/10/2020 20.08, Andy Shevchenko wrote:
> It appears that simplification of mcp23s08_spi_regmap_init() made
> a regression due to wrong size calculation for dev_kmemdup() call.
> It mises the fact that config variable is already a pointer, thus
> the sizeof() calculation is wrong and only 4 or 8 bytes were copied.
> 
> Fix the parameters to devm_kmemdup() to copy full chunk of memory.
> 
> Fixes: 0874758ecb2b ("pinctrl: mcp23s08: Refactor mcp23s08_spi_regmap_init()")
> Reported-by: Martin Hundebøll <martin@geanix.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: fixed few typos in the commit message
>   drivers/pinctrl/pinctrl-mcp23s08_spi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-mcp23s08_spi.c b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
> index 1f47a661b0a7..7c72cffe1412 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08_spi.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
> @@ -119,7 +119,7 @@ static int mcp23s08_spi_regmap_init(struct mcp23s08 *mcp, struct device *dev,
>   		return -EINVAL;
>   	}
>   
> -	copy = devm_kmemdup(dev, &config, sizeof(config), GFP_KERNEL);
> +	copy = devm_kmemdup(dev, config, sizeof(*config), GFP_KERNEL);
>   	if (!copy)
>   		return -ENOMEM;
>   
> 
