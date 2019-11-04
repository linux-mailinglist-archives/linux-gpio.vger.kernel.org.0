Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E480EDC5D
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 11:22:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbfKDKWS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 05:22:18 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:37222 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726441AbfKDKWS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 05:22:18 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xA49utVG002166;
        Mon, 4 Nov 2019 11:22:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=eU6eABG4qyDAE1xkwrnneHH0ZTGv0XqpzXiOHf/PvB4=;
 b=j00ZwEYhJTDKLSQNtp6gi01FWnzPPaXXE6fU0NQE/41OO2OdjYgNDhaersyBnVi4duq5
 8i9WfYiqi0JJpFvASDIS95l7yFBoxP/5TnlCAb26vvjeO4E9cNTMxQXYmSwhZEFZ9wsW
 XiTzu9wgffgYBNJjicJsb3LRqyzl4Y0V2LUzP+/SPXOJhpRDEVPlcZBKIFp4cKzNi7cx
 w+rdIvThGJU65NnXoLTTy4ZTMPAwMeB73KdGtC3kk7Z1GqZbARXGhMRYpQENcKdvO4f6
 LLFzdtDvaz/5VDOizprNJOEeQBDGJ1xdQOdoyac5aBLNa6VBZZAZjSeEPmRMGNO0PfH6 NA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2w1054gw6p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 04 Nov 2019 11:22:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 283CF10002A;
        Mon,  4 Nov 2019 11:22:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1AB272BC5C3;
        Mon,  4 Nov 2019 11:22:08 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 4 Nov
 2019 11:22:07 +0100
Subject: Re: [PATCH 1/1] pinctrl: stmfx: fix valid_mask init sequence
To:     Amelie Delaunay <amelie.delaunay@st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20191104100908.10880-1-amelie.delaunay@st.com>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <3767f869-7454-c230-5e6c-487b436cb58f@st.com>
Date:   Mon, 4 Nov 2019 11:22:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191104100908.10880-1-amelie.delaunay@st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-11-04_06:2019-11-01,2019-11-04 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Amélie,

On 11/4/19 11:09 AM, Amelie Delaunay wrote:
> With stmfx_pinctrl_gpio_init_valid_mask callback, gpio_valid_mask was used
> to initialize gpiochip valid_mask for gpiolib. But gpio_valid_mask was not
> yet initialized. gpio_valid_mask required gpio-ranges to be registered,
> this is the case after gpiochip_add_data call. But init_valid_mask
> callback is also called under gpiochip_add_data. gpio_valid_mask
> initialization cannot be moved before gpiochip_add_data because
> gpio-ranges are not registered.
> So, it is not possible to use init_valid_mask callback.
> To avoid this issue, get rid of valid_mask and rely on ranges.
> 
> Fixes: da9b142ab2c5 ("pinctrl: stmfx: Use the callback to populate valid_mask")
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

Acked-by: Alexandre TORGUE <alexandre.torgue@st.com>

> ---
>   drivers/pinctrl/pinctrl-stmfx.c | 14 --------------
>   1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
> index 564660028fcc..ccdf0bb21414 100644
> --- a/drivers/pinctrl/pinctrl-stmfx.c
> +++ b/drivers/pinctrl/pinctrl-stmfx.c
> @@ -585,19 +585,6 @@ static int stmfx_pinctrl_gpio_function_enable(struct stmfx_pinctrl *pctl)
>   	return stmfx_function_enable(pctl->stmfx, func);
>   }
>   
> -static int stmfx_pinctrl_gpio_init_valid_mask(struct gpio_chip *gc,
> -					      unsigned long *valid_mask,
> -					      unsigned int ngpios)
> -{
> -	struct stmfx_pinctrl *pctl = gpiochip_get_data(gc);
> -	u32 n;
> -
> -	for_each_clear_bit(n, &pctl->gpio_valid_mask, ngpios)
> -		clear_bit(n, valid_mask);
> -
> -	return 0;
> -}
> -
>   static int stmfx_pinctrl_probe(struct platform_device *pdev)
>   {
>   	struct stmfx *stmfx = dev_get_drvdata(pdev->dev.parent);
> @@ -660,7 +647,6 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
>   	pctl->gpio_chip.ngpio = pctl->pctl_desc.npins;
>   	pctl->gpio_chip.can_sleep = true;
>   	pctl->gpio_chip.of_node = np;
> -	pctl->gpio_chip.init_valid_mask = stmfx_pinctrl_gpio_init_valid_mask;
>   
>   	ret = devm_gpiochip_add_data(pctl->dev, &pctl->gpio_chip, pctl);
>   	if (ret) {
> 
