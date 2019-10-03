Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A09FCAE50
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2019 20:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388309AbfJCSgL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Oct 2019 14:36:11 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42441 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388437AbfJCSgK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Oct 2019 14:36:10 -0400
Received: by mail-pf1-f195.google.com with SMTP id q12so2281249pff.9
        for <linux-gpio@vger.kernel.org>; Thu, 03 Oct 2019 11:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=YFyTJ8BzR0j/Y9IcLHxBPvpd6JctIzAZJXdgxvtLnB4=;
        b=HjYUlKzlfPmLuOeVnGPU1fDy8FAs93KFB4BbrHc2eQ3zoY9a/AeHZZapnk0WReita+
         dvGoW+KaCndigpvJPQMiCF0AuNnvnfGzxp8pwXtIRFC1D++SCikoOlik7zow8WM/Ow9J
         IzktcyTzDwY3BB3ygRkVfzJmNy6zxHstm0+nA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=YFyTJ8BzR0j/Y9IcLHxBPvpd6JctIzAZJXdgxvtLnB4=;
        b=QLnmTRW8x6dSZ+e2WfdwhsBt5fvHo4yvQMeB/hEgfZKxQ6M2/2zNtXcf+HkNC8rc0G
         t1r/lHJoMCj3DWIx9AWeCV8QFDz8IqhiZdiRPjunu4IUFW51IpvV4JNDvJx1phiWLhU4
         m/yK8bef6Y67nCGRzPsWvvDDnQIGO7aSnZ5aQGuUBHpdOHIC9BuQG/vZioGQF0wUc4tu
         A81raaHj5z36uM+fi1wXDa8kymJWUrImWjxi5t7hlXsSnl0Vi/o1SVFbtbjciGuOSDbz
         4uDuCEPLhAcxSW2AWMjdPK1z0HiD8y7Dfaw6v58k9GOVFxtvjwqlcyt817MbvBxDyrwC
         sHzg==
X-Gm-Message-State: APjAAAX6oa4a/rYJvnYG/yGEhbWRrwyyTQQo76NWl4rcIq54zlh0JIOq
        sJJL7bhDS26bKqBPatltC1ka2Q==
X-Google-Smtp-Source: APXvYqw/7fw6vP2s6NX9UHYGAKljiKQWnc4jhc+Ay4Tgk/hDnxvqm18CQECsXyauhzkcvzEEWggUGQ==
X-Received: by 2002:a17:90a:3d08:: with SMTP id h8mr12382854pjc.12.1570127768511;
        Thu, 03 Oct 2019 11:36:08 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id b16sm4355458pfb.54.2019.10.03.11.36.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Oct 2019 11:36:07 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] pinctrl: iproc: allow for error from
 platform_get_irq()
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linus.walleij@linaro.org, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com,
        rayagonda.kokatanur@broadcom.com, li.jin@broadcom.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20191003000310.17099-1-chris.packham@alliedtelesis.co.nz>
 <20191003000310.17099-2-chris.packham@alliedtelesis.co.nz>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <420179c4-3e8c-2ad9-4bdd-ee745cedd8d5@broadcom.com>
Date:   Thu, 3 Oct 2019 11:36:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003000310.17099-2-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks for fix.

On 2019-10-02 5:03 p.m., Chris Packham wrote:
> platform_get_irq() can return an error code. Allow for this when getting
> the irq.
>
> Fixes: 6f265e5d4da7 ("pinctrl: bcm-iproc: Pass irqchip when adding gpiochip")
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Acked-by: Scott Branden <scott.branden@broadcom.com>
> ---
>   drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> index 6f7d3a2f2e97..8971fc54e974 100644
> --- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> +++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> @@ -853,7 +853,7 @@ static int iproc_gpio_probe(struct platform_device *pdev)
>   
>   	/* optional GPIO interrupt support */
>   	irq = platform_get_irq(pdev, 0);
> -	if (irq) {
> +	if (irq > 0) {
>   		struct irq_chip *irqc;
>   		struct gpio_irq_chip *girq;
>   

