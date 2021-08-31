Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AFA13FC424
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Aug 2021 10:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240137AbhHaIOQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Aug 2021 04:14:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240072AbhHaIOO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Aug 2021 04:14:14 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A4B2C061575;
        Tue, 31 Aug 2021 01:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=OorlwylrUxzuzS3cetuLxvIStkxVch93Ik09Q2WOBco=; b=Ph8uDNyrJhv42qZkySPR9kDYDW
        mwurkuwMjkPZ4uNGaTVorEMctLgKkuv/NMRUFjuixR7fk8lQQflA/JUduqDyUSxfefXyYEZgoOY5/
        LEzHE976l4sX1rIx0EuLh0WMU8woFkLvUdIPCTunZXg2NJWzT3cBINeyvJgCJF7K61PaSKEMg9qfS
        vyW1+48z6HBV9XQt9H3eblK3oVBu8YJlVrNbZSe1MHOcTTb54SFG+CbnoJEaBv9NMCdlgawOQPMds
        eGb8lncw9pY9IldofDjiRM8lLVtWxflIvnphX69awidyA8+8keRKBcUx7QsiSuMQWtuSpFAAhQy8W
        oyvG42sA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1mKytP-0001PW-NU; Tue, 31 Aug 2021 11:13:15 +0300
Subject: Re: [PATCH 1/2] pinctrl: pimux: Add support to save and restore HW
 register
To:     Prathamesh Shete <pshete@nvidia.com>, linus.walleij@linaro.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        ldewangan@nvidia.com, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     smangipudi@nvidia.com
References: <20210831052834.4136-1-pshete@nvidia.com>
 <20210831052834.4136-2-pshete@nvidia.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <36a272b2-1377-aaae-db37-cb40b618274a@kapsi.fi>
Date:   Tue, 31 Aug 2021 11:13:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210831052834.4136-2-pshete@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 8/31/21 8:28 AM, Prathamesh Shete wrote:
> From: Laxman Dewangan <ldewangan@nvidia.com>
> 
> Add support to save and restore the pincontrol HW register
> for GPIO mode configurations. This helps in changing the
> pin configure only during suspend and restore in resume.

Aren't we already saving all registers during suspend and restoring 
during resume?

> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Signed-off-by: pshete <pshete@nvidia.com>

Needs full name. Also, there is a typo in the commit title, and it is 
quite vague (what HW register?)

Cheers,
Mikko

> ---
>   drivers/pinctrl/pinmux.c       | 24 ++++++++++++++++++++++++
>   drivers/pinctrl/pinmux.h       | 18 ++++++++++++++++++
>   include/linux/pinctrl/pinmux.h |  9 +++++++++
>   3 files changed, 51 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
> index 6cdbd9ccf2f0..66fc0ca22623 100644
> --- a/drivers/pinctrl/pinmux.c
> +++ b/drivers/pinctrl/pinmux.c
> @@ -317,6 +317,30 @@ int pinmux_gpio_direction(struct pinctrl_dev *pctldev,
>   	return ret;
>   }
>   
> +int pinmux_gpio_save_config(struct pinctrl_dev *pctldev,
> +			    struct pinctrl_gpio_range *range,
> +			    unsigned pin)
> +{
> +	const struct pinmux_ops *ops = pctldev->desc->pmxops;
> +
> +	if (ops->gpio_save_config)
> +		return ops->gpio_save_config(pctldev, range, pin);
> +
> +	return 0;
> +}
> +
> +int pinmux_gpio_restore_config(struct pinctrl_dev *pctldev,
> +			       struct pinctrl_gpio_range *range,
> +			       unsigned pin)
> +{
> +	const struct pinmux_ops *ops = pctldev->desc->pmxops;
> +
> +	if (ops->gpio_restore_config)
> +		return ops->gpio_restore_config(pctldev, range, pin);
> +
> +	return 0;
> +}
> +
>   static int pinmux_func_name_to_selector(struct pinctrl_dev *pctldev,
>   					const char *function)
>   {
> diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
> index 78c3a31be882..425c31a0115b 100644
> --- a/drivers/pinctrl/pinmux.h
> +++ b/drivers/pinctrl/pinmux.h
> @@ -31,6 +31,12 @@ int pinmux_map_to_setting(const struct pinctrl_map *map,
>   void pinmux_free_setting(const struct pinctrl_setting *setting);
>   int pinmux_enable_setting(const struct pinctrl_setting *setting);
>   void pinmux_disable_setting(const struct pinctrl_setting *setting);
> +int pinmux_gpio_save_config(struct pinctrl_dev *pctldev,
> +			    struct pinctrl_gpio_range *range,
> +			    unsigned pin);
> +int pinmux_gpio_restore_config(struct pinctrl_dev *pctldev,
> +			       struct pinctrl_gpio_range *range,
> +			       unsigned pin);
>   
>   #else
>   
> @@ -89,6 +95,18 @@ static inline void pinmux_disable_setting(const struct pinctrl_setting *setting)
>   {
>   }
>   
> +int pinmux_gpio_save_config(struct pinctrl_dev *pctldev,
> +			    struct pinctrl_gpio_range *range,
> +			    unsigned pin)
> +{
> +	return 0;
> +}
> +int pinmux_gpio_restore_config(struct pinctrl_dev *pctldev,
> +			       struct pinctrl_gpio_range *range,
> +			       unsigned pin)
> +{
> +	return 0;
> +}
>   #endif
>   
>   #if defined(CONFIG_PINMUX) && defined(CONFIG_DEBUG_FS)
> diff --git a/include/linux/pinctrl/pinmux.h b/include/linux/pinctrl/pinmux.h
> index 9a647fa5c8f1..cca87586d8c1 100644
> --- a/include/linux/pinctrl/pinmux.h
> +++ b/include/linux/pinctrl/pinmux.h
> @@ -53,6 +53,8 @@ struct pinctrl_dev;
>    *	depending on whether the GPIO is configured as input or output,
>    *	a direction selector function may be implemented as a backing
>    *	to the GPIO controllers that need pin muxing.
> + * @gpio_save_config: Save the GPIo configurations.
> + * @gpio_restore_config: Restore GPIO configurations.
>    * @strict: do not allow simultaneous use of the same pin for GPIO and another
>    *	function. Check both gpio_owner and mux_owner strictly before approving
>    *	the pin request.
> @@ -79,6 +81,13 @@ struct pinmux_ops {
>   				   struct pinctrl_gpio_range *range,
>   				   unsigned offset,
>   				   bool input);
> +	int (*gpio_save_config) (struct pinctrl_dev *pctldev,
> +				 struct pinctrl_gpio_range *range,
> +				 unsigned offset);
> +	int (*gpio_restore_config) (struct pinctrl_dev *pctldev,
> +				    struct pinctrl_gpio_range *range,
> +				    unsigned offset);
> +
>   	bool strict;
>   };
>   
> 
