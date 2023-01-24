Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60FC5679D6D
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jan 2023 16:27:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234158AbjAXP1h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Jan 2023 10:27:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234227AbjAXP1g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Jan 2023 10:27:36 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03F6E460B4;
        Tue, 24 Jan 2023 07:27:31 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 512DD81F28;
        Tue, 24 Jan 2023 16:27:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1674574049;
        bh=NvY1Ms7ZtjHQDFqdz6yuwfqess1BDrJEVwapFmtZ4Xw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=rmjR0NhfU/AZz1QZqGuSJzK89nCkorBZeYGwqhf2r51DLkEyomxhhBKPna2zwjm9R
         jWVyT3+s88txrbXPNOfQ1sOtb0SulvhEgcfDee1Zn5IOonJXyAGANYdHfLTrZiOMJt
         CJa2buNUBsytL22bsGJVH2lGXsDgA/OrBWsVvbo8JRqibfLGvWzPvZ03Da7BgCb8DK
         yRyoBWYd2/qE74vt7e8vQqO9JExSo9Cj1vLNunsHEb7obixlwZQFqYpCQSQ1t4M3Hw
         T0AtGc9D2qUaCGX5MEOMMXybOeUsKeWl4obwB7Ub3q6S6HfdL1d8rShOryafmQIyY1
         o3OYfHbGr/OBQ==
Message-ID: <76be618d-e0fa-6bf2-7a8f-da422a0e8485@denx.de>
Date:   Tue, 24 Jan 2023 16:27:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] gpio: mxc: Unlock on error path in mxc_flip_edge()
Content-Language: en-US
To:     Dan Carpenter <error27@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, Marc Zyngier <maz@kernel.org>,
        linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <Y8/3OlSVCK/0wQRj@kili>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <Y8/3OlSVCK/0wQRj@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 1/24/23 16:20, Dan Carpenter wrote:
> We recently added locking to this function but one error path was
> over looked.  Drop the lock before returning.
> 
> Fixes: e5464277625c ("gpio: mxc: Protect GPIO irqchip RMW with bgpio spinlock")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>   drivers/gpio/gpio-mxc.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 6f673b2f2a1b..9d0cec4b82a3 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -249,10 +249,11 @@ static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
>   	} else {
>   		pr_err("mxc: invalid configuration for GPIO %d: %x\n",
>   		       gpio, edge);
> -		return;
> +		goto unlock;
>   	}
>   	writel(val | (edge << (bit << 1)), reg);
>   
> +unlock:
>   	raw_spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
>   }

Acked-by: Marek Vasut <marex@denx.de>

Thanks !
