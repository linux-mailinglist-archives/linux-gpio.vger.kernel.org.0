Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7E6711DB54
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2019 01:55:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727775AbfLMAzq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 19:55:46 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:32792 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727491AbfLMAzq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 19:55:46 -0500
Received: by mail-wr1-f66.google.com with SMTP id b6so4815951wrq.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2019 16:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gFjhozgG0wJvhDM360uom2X/mNpI/FjmSBDUTyP3cAk=;
        b=Racuw22f7+pJ6uT9JFY9UKo0OLsikNY/eEUH3YQ6Ve+NSCAVgJh0Zd6rHUOK6SyA3F
         viwwP03XAisSR6dCxCu2KS5PLhNbSzmcWXE9j4IfFWauXkT7TyLDWBhVh5lAhjxwutrV
         AXedO+6jiXvcsPFyHxIvRmSWPZVAIWSgH/ax0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gFjhozgG0wJvhDM360uom2X/mNpI/FjmSBDUTyP3cAk=;
        b=Mw0RVTZmM5UOjg6QeBgitznxys9me3X00r6GFQL52Lyx6q4UeQRSLSgPNRY2yF2dkV
         7Ic6DQk8codgxNUk0RCXL++pOBhv4PS56Wjr6Mq5YZpON2KQegpwMYL4pWEiG6skChC0
         Y5p+rAwfmo1NTXVGd+R4pHunATy5bl0m2IKclB1zl8f2F+Te4TPyicvHopZ0i0hoJqC9
         a61ZqASpVuJdUIRXlf+jGDwIOCArKL0/9XE+LS4BMLtCWVxikdBBnRND431mJDssdz7J
         tiusHHBbPB9cO6yszkRbj+bsQP39cOuG1vz/BGt9fiAguls5y2wZTrO2LEgNOB94ZSoT
         v4Sg==
X-Gm-Message-State: APjAAAUkkzZKE5LcM3ZFL3GuqCH4ECrmpcHTufxsb/iojUDclcby64X3
        2gBYL8wXyYZ2e4jfMENgiTnuYQ==
X-Google-Smtp-Source: APXvYqzdij9d5WV2KSvynrYakAFyUlnevS/Iz6htmvAoKT/4hvWf5MZFA0y7Xl19BmhVuW+oj8Jg9w==
X-Received: by 2002:a5d:44cd:: with SMTP id z13mr9454072wrr.104.1576198543557;
        Thu, 12 Dec 2019 16:55:43 -0800 (PST)
Received: from rj-aorus.ric.broadcom.com ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id x7sm7925462wrq.41.2019.12.12.16.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2019 16:55:42 -0800 (PST)
Subject: Re: [PATCH 1/1] pinctrl: iproc: Set irq handler based on trig type
To:     Hamish Martin <hamish.martin@alliedtelesis.co.nz>,
        linus.walleij@linaro.org, rjui@broadcom.com, sbranden@broadcom.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20191212220923.15089-1-hamish.martin@alliedtelesis.co.nz>
 <20191212220923.15089-2-hamish.martin@alliedtelesis.co.nz>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <a5a47959-8a56-c558-f104-c4071bb512c3@broadcom.com>
Date:   Thu, 12 Dec 2019 16:55:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191212220923.15089-2-hamish.martin@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 2019-12-12 2:09 p.m., Hamish Martin wrote:
> Rather than always using handle_simple_irq() as the gpio_irq_chip
> handler, set a more appropriate handler based on the IRQ trigger type
> requested.
> This is important for level triggered interrupts which need to be
> masked during handling.
> 
> Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
> ---
>   drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> index 831a9318c384..c79e91eb1a47 100644
> --- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> +++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> @@ -288,6 +288,11 @@ static int iproc_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>   		       rising_or_high);
>   	raw_spin_unlock_irqrestore(&chip->lock, flags);
>   
> +	if (type & IRQ_TYPE_EDGE_BOTH)
> +		irq_set_handler_locked(d, handle_edge_irq);
> +	else
> +		irq_set_handler_locked(d, handle_level_irq);
> +

I think it would make more sense to put them under the above spinlock 
protection, right?

In addition, with this, can the default assignment in 'iproc_gpio_probe' 
be removed?

girq->handler = handle_simple_irq;

Thanks,

Ray

>   	dev_dbg(chip->dev,
>   		"gpio:%u level_triggered:%d dual_edge:%d rising_or_high:%d\n",
>   		gpio, level_triggered, dual_edge, rising_or_high);
> 
