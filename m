Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 571AE39ED01
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jun 2021 05:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbhFHDYC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 23:24:02 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:5278 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbhFHDYB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 23:24:01 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Fzb583MTmz1BKkY;
        Tue,  8 Jun 2021 11:17:16 +0800 (CST)
Received: from dggemi762-chm.china.huawei.com (10.1.198.148) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 8 Jun 2021 11:22:05 +0800
Received: from [10.174.178.208] (10.174.178.208) by
 dggemi762-chm.china.huawei.com (10.1.198.148) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 8 Jun 2021 11:22:05 +0800
Subject: Re: [PATCH -next] pinctrl: mcp23s08: Fix missing unlock on error in
 mcp23s08_irq()
To:     <linus.walleij@linaro.org>, <radim.pavlik@tbs-biometrics.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1623069869-39309-1-git-send-email-zou_wei@huawei.com>
From:   Samuel Zou <zou_wei@huawei.com>
Message-ID: <ffe5b0a2-7307-f4d0-16fc-0712d55ce36d@huawei.com>
Date:   Tue, 8 Jun 2021 11:22:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1623069869-39309-1-git-send-email-zou_wei@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.208]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggemi762-chm.china.huawei.com (10.1.198.148)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 2021/6/7 20:44, Zou Wei wrote:
> Add the missing unlock before return from function mcp23s08_irq()
> in the error handling case.
> 
> Fixes: 897120d41e7a ("pinctrl: mcp23s08: fix race condition in irq handler")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>   drivers/pinctrl/pinctrl-mcp23s08.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
> index 799d596..e12aa09 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
> @@ -353,6 +353,7 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
>   
>   	if (intf == 0) {
>   		/* There is no interrupt pending */
> +		goto unlock;
>   		return IRQ_HANDLED;
One mistake here is to forget to delete the "return IRQ_HANDLED" line, 
please ignore this patch, I will send v2 later.
>   	}
>   
> 
