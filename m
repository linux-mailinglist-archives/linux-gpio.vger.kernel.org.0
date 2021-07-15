Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B87433C9DFB
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jul 2021 13:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbhGOLwY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Jul 2021 07:52:24 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:15020 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbhGOLwY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jul 2021 07:52:24 -0400
Received: from dggeml759-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GQXdG5h0jzbcPV;
        Thu, 15 Jul 2021 19:46:10 +0800 (CST)
Received: from [10.174.178.165] (10.174.178.165) by
 dggeml759-chm.china.huawei.com (10.1.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 15 Jul 2021 19:49:28 +0800
Subject: Re: [PATCH] pinctrl: single: Fix error return code in
 pcs_parse_bits_in_pinctrl_entry()
To:     Zhen Lei <thunder.leizhen@huawei.com>,
        Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Manjunathappa Prakash <prakash.pm@ti.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20210715064206.3193-1-thunder.leizhen@huawei.com>
From:   "weiyongjun (A)" <weiyongjun1@huawei.com>
Message-ID: <55d02087-e2c7-9a0c-e20e-ff6f106703a3@huawei.com>
Date:   Thu, 15 Jul 2021 19:49:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20210715064206.3193-1-thunder.leizhen@huawei.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.165]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggeml759-chm.china.huawei.com (10.1.199.138)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Fix to return -ENOTSUPP instead of 0 when PCS_HAS_PINCONF is true, which
> is the same as that returned in pcs_parse_pinconf().
>
> In addition, I found the value of pcs->flags is not overwritten in
> pcs_parse_bits_in_pinctrl_entry() and its subfunctions, so moving this
> check to the beginning of the function eliminates unnecessary rollback
> operations.
>
> Fixes: 4e7e8017a80e ("pinctrl: pinctrl-single: enhance to configure multiple pins of different modules")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>   drivers/pinctrl/pinctrl-single.c | 21 ++++++++-------------
>   1 file changed, 8 insertions(+), 13 deletions(-)
>
>
>   	npins_in_row = pcs->width / pcs->bits_per_pin;
>   
>   	vals = devm_kzalloc(pcs->dev,
> @@ -1212,29 +1217,19 @@ static int pcs_parse_bits_in_pinctrl_entry(struct pcs_device *pcs,
>   		goto free_pins;
>   	}
>   
> -	gsel = pinctrl_generic_add_group(pcs->pctl, np->name, pins, found, pcs);
> -	if (gsel < 0) {
> -		res = gsel;
> +	res = pinctrl_generic_add_group(pcs->pctl, np->name, pins, found, pcs);
> +	if (res < 0)
>   		goto free_function;
> -	}


This change cause 'gsel' not set.

Do not mix this cleanup with bugfix.



