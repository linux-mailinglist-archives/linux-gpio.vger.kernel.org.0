Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93D03173104
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2020 07:31:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgB1Gaq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Feb 2020 01:30:46 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:55338 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725802AbgB1Gaq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 28 Feb 2020 01:30:46 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id DABC33FA45BAE3DC377F;
        Fri, 28 Feb 2020 14:30:39 +0800 (CST)
Received: from [127.0.0.1] (10.173.223.234) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Fri, 28 Feb 2020
 14:30:35 +0800
Subject: Re: [PATCH -next] pinctrl: da9062: Fix error gpiolib.h path
To:     <support.opensource@diasemi.com>, <linus.walleij@linaro.org>,
        <Adam.Thomson.Opensource@diasemi.com>, <m.felsch@pengutronix.de>
References: <20200228040047.14808-1-yuehaibing@huawei.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From:   Yuehaibing <yuehaibing@huawei.com>
Message-ID: <a28de19d-7e44-1583-e436-b45456b2e62c@huawei.com>
Date:   Fri, 28 Feb 2020 14:30:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20200228040047.14808-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.223.234]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sorry, pls ignore this, will resend v2.

On 2020/2/28 12:00, YueHaibing wrote:
> drivers/pinctrl/pinctrl-da9062.c:28:10: fatal error: ../gpio/gpiolib.h: No such file or directory
>  #include <../gpio/gpiolib.h>
>           ^~~~~~~~~~~~~~~~~~~
> 
> Fix this wrong include path.
> 
> Fixes: 56cc3af4e8c8 ("pinctrl: da9062: add driver support")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/pinctrl/pinctrl-da9062.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-da9062.c b/drivers/pinctrl/pinctrl-da9062.c
> index f704ee0b2fd9..c15eb6e99bc1 100644
> --- a/drivers/pinctrl/pinctrl-da9062.c
> +++ b/drivers/pinctrl/pinctrl-da9062.c
> @@ -25,7 +25,7 @@
>   * We need this get the gpio_desc from a <gpio_chip,offset> tuple to decide if
>   * the gpio is active low without a vendor specific dt-binding.
>   */
> -#include <../gpio/gpiolib.h>
> +#include "../../gpio/gpiolib.h"
>  
>  #define DA9062_TYPE(offset)		(4 * (offset % 2))
>  #define DA9062_PIN_SHIFT(offset)	(4 * (offset % 2))
> 

