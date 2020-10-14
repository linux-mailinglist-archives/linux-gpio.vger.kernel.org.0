Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFD1828D771
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 02:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389264AbgJNAaD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Oct 2020 20:30:03 -0400
Received: from regular1.263xmail.com ([211.150.70.204]:38304 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730508AbgJNAaD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Oct 2020 20:30:03 -0400
Received: from localhost (unknown [192.168.167.32])
        by regular1.263xmail.com (Postfix) with ESMTP id 01DA9252;
        Wed, 14 Oct 2020 08:23:58 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.120] (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P19667T139951075981056S1602635036600792_;
        Wed, 14 Oct 2020 08:23:57 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <e672a64380c6425723da0e7b6f339ffd>
X-RL-SENDER: kever.yang@rock-chips.com
X-SENDER: yk@rock-chips.com
X-LOGIN-NAME: kever.yang@rock-chips.com
X-FST-TO: linux-rockchip@lists.infradead.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_v3_2/3=5d_pinctrl=3a_rockchip=3a_enable_gp?=
 =?UTF-8?B?aW8gcGNsayBmb3Igcm9ja2NoaXBfZ3Bpb190b19pcnHjgJDor7fms6jmhI/vvIw=?=
 =?UTF-8?B?6YKu5Lu255SxbGludXgtcm9ja2NoaXAtYm91bmNlcytrZXZlci55YW5nPXJvY2st?=
 =?UTF-8?B?Y2hpcHMuY29tQGxpc3RzLmluZnJhZGVhZC5vcmfku6Plj5HjgJE=?=
To:     Jianqun Xu <jay.xu@rock-chips.com>, linus.walleij@linaro.org,
        heiko@sntech.de
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org
References: <20201013063731.3618-1-jay.xu@rock-chips.com>
 <20201013063731.3618-3-jay.xu@rock-chips.com>
From:   Kever Yang <kever.yang@rock-chips.com>
Message-ID: <75c48986-1f4c-67a3-1943-5ce51e33bbfd@rock-chips.com>
Date:   Wed, 14 Oct 2020 08:23:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201013063731.3618-3-jay.xu@rock-chips.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 2020/10/13 下午2:37, Jianqun Xu wrote:
> There need to enable pclk_gpio when do irq_create_mapping, since it will
> do access to gpio controller.
>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> ---
>   drivers/pinctrl/pinctrl-rockchip.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index 927d132d6716..a2f361aa6d05 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -3157,7 +3157,9 @@ static int rockchip_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
>   	if (!bank->domain)
>   		return -ENXIO;
>   
> +	clk_enable(bank->clk);
>   	virq = irq_create_mapping(bank->domain, offset);
> +	clk_disable(bank->clk);
>   
>   	return (virq) ? : -ENXIO;
>   }


Looks good to me,

Reviewed-by: Kever Yang<kever.yang@rock-chips.com>

Thanks,
- Kever



