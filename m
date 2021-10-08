Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CED9D4266C0
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 11:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236335AbhJHJ2i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Oct 2021 05:28:38 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:13710 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbhJHJ2h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Oct 2021 05:28:37 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HQjTK4lPszWZvY;
        Fri,  8 Oct 2021 17:25:09 +0800 (CST)
Received: from dggema757-chm.china.huawei.com (10.1.198.199) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Fri, 8 Oct 2021 17:26:40 +0800
Received: from [10.67.102.185] (10.67.102.185) by
 dggema757-chm.china.huawei.com (10.1.198.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Fri, 8 Oct 2021 17:26:39 +0800
Subject: Re: [PATCH v1] MAINTAINERS: Change maintainer for gpio-hisi driver
To:     Luo Jiaxing <luojiaxing@huawei.com>, <linus.walleij@linaro.org>,
        <andy.shevchenko@gmail.com>, <andriy.shevchenko@linux.intel.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20210930075807.333-1-luojiaxing@huawei.com>
From:   "liuqi (BA)" <liuqi115@huawei.com>
Message-ID: <29eace32-346c-446a-f709-db76bdae00d2@huawei.com>
Date:   Fri, 8 Oct 2021 17:26:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20210930075807.333-1-luojiaxing@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.185]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggema757-chm.china.huawei.com (10.1.198.199)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 2021/9/30 15:58, Luo Jiaxing wrote:
> Qi Liu take over the maintenance of HISILICON GPIO driver next, change
> the maintainer information.
> 
> Signed-off-by: Luo Jiaxing <luojiaxing@huawei.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Qi Liu <liuqi115@huawei.com>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eeb4c70b3d5b..b7ee5ddaf820 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8400,7 +8400,7 @@ S:	Maintained
>   F:	drivers/dma/hisi_dma.c
>   
>   HISILICON GPIO DRIVER
> -M:	Luo Jiaxing <luojiaxing@huawei.com>
> +M:	Qi Liu <liuqi115@huawei.com>
>   L:	linux-gpio@vger.kernel.org
>   S:	Maintained
>   F:	drivers/gpio/gpio-hisi.c
> 
