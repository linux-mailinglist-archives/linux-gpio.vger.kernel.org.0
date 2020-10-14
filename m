Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4564728D774
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 02:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389575AbgJNAaS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Oct 2020 20:30:18 -0400
Received: from regular1.263xmail.com ([211.150.70.206]:49820 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730493AbgJNAaD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Oct 2020 20:30:03 -0400
Received: from localhost (unknown [192.168.167.235])
        by regular1.263xmail.com (Postfix) with ESMTP id 76FD739E;
        Wed, 14 Oct 2020 08:23:44 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.120] (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P2981T139638898628352S1602635023646159_;
        Wed, 14 Oct 2020 08:23:44 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <057012ada3f62f389750076c22335d90>
X-RL-SENDER: kever.yang@rock-chips.com
X-SENDER: yk@rock-chips.com
X-LOGIN-NAME: kever.yang@rock-chips.com
X-FST-TO: linux-rockchip@lists.infradead.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_v3_1/3=5d_pinctrl=3a_rockchip=3a_make_driv?=
 =?UTF-8?B?ZXIgYmUgdHJpc3RhdGUgbW9kdWxl44CQ6K+35rOo5oSP77yM6YKu5Lu255SxbGlu?=
 =?UTF-8?Q?ux-rockchip-bounces+kever=2eyang=3drock-chips=2ecom=40lists=2einf?=
 =?UTF-8?B?cmFkZWFkLm9yZ+S7o+WPkeOAkQ==?=
To:     Jianqun Xu <jay.xu@rock-chips.com>, linus.walleij@linaro.org,
        heiko@sntech.de
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org
References: <20201013063731.3618-1-jay.xu@rock-chips.com>
 <20201013063731.3618-2-jay.xu@rock-chips.com>
From:   Kever Yang <kever.yang@rock-chips.com>
Message-ID: <b9f0f4d7-371e-9442-2f58-f4d1516bb181@rock-chips.com>
Date:   Wed, 14 Oct 2020 08:23:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201013063731.3618-2-jay.xu@rock-chips.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 2020/10/13 下午2:37, Jianqun Xu wrote:
> Make pinctrl-rockchip driver to be tristate module, support to build as
> a module, this is useful for GKI.
>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> ---
>   drivers/pinctrl/Kconfig            |  2 +-
>   drivers/pinctrl/pinctrl-rockchip.c | 13 +++++++++++++
>   2 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 815095326e2d..bc9774c1ae8d 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -207,7 +207,7 @@ config PINCTRL_OXNAS
>   	select MFD_SYSCON
>   
>   config PINCTRL_ROCKCHIP
> -	bool
> +	tristate "Rockchip gpio and pinctrl driver"
>   	depends on OF
>   	select PINMUX
>   	select GENERIC_PINCONF
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index 0401c1da79dd..927d132d6716 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -16,10 +16,12 @@
>    */
>   
>   #include <linux/init.h>
> +#include <linux/module.h>
>   #include <linux/platform_device.h>
>   #include <linux/io.h>
>   #include <linux/bitops.h>
>   #include <linux/gpio/driver.h>
> +#include <linux/of_device.h>
>   #include <linux/of_address.h>
>   #include <linux/of_irq.h>
>   #include <linux/pinctrl/machine.h>
> @@ -4258,3 +4260,14 @@ static int __init rockchip_pinctrl_drv_register(void)
>   	return platform_driver_register(&rockchip_pinctrl_driver);
>   }
>   postcore_initcall(rockchip_pinctrl_drv_register);
> +
> +static void __exit rockchip_pinctrl_drv_unregister(void)
> +{
> +	platform_driver_unregister(&rockchip_pinctrl_driver);
> +}
> +module_exit(rockchip_pinctrl_drv_unregister);
> +
> +MODULE_DESCRIPTION("ROCKCHIP Pin Controller Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:pinctrl-rockchip");
> +MODULE_DEVICE_TABLE(of, rockchip_pinctrl_dt_match);

Looks good to me,

Reviewed-by: Kever Yang<kever.yang@rock-chips.com>

Thanks,
- Kever



