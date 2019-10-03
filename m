Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF5D8CAE53
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2019 20:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729032AbfJCSgx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Oct 2019 14:36:53 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34837 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727331AbfJCSgw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Oct 2019 14:36:52 -0400
Received: by mail-pg1-f195.google.com with SMTP id p30so191889pgl.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Oct 2019 11:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Re8qV2QdvbkLCeb2K8HW6hCEuJ7wbKTMp5YuNreyJxY=;
        b=DhN5LdLlc5xvMIxx+vE4iDLvGqtc3RN6Ll9kD5TCP0XPOUl9jAD6ivWCq31Q9jG1Dc
         xwLcQ3N40GFgAGHTDlvYM4TP9qXfOOW/CwEIZhxaAUqbwkhN16Ut+NgbbutBz9dX269C
         7BIlIfjg+RsItpnL7PVKdDy/aM6ypmt2kbppw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Re8qV2QdvbkLCeb2K8HW6hCEuJ7wbKTMp5YuNreyJxY=;
        b=iilLis+f5aZh8fyhZcjVo+ZFyPGJRnayIpSZgVRLCbDKd9Sx8FgDmulWQ9edQh+Rdp
         RuvR2LhITlh7N20y/NTLxiAQ9Eb4XHN6DR2jcXky+quU9yvcwLq9vOxvGSnqhx22ai/h
         mjmYWT2MfhjI0PjlE5YPBPsER7+PVsEh+ntqgAVHDbg24I8O4h143PC1jTkEIbdhIUYZ
         XxGhvkPJTa9Q/WVm4nvBDoX6Tt0G6dUBuqCsXbJFPBjS0N6NJOo7dAlNfbsPNj0fjg24
         F4ueDvzPmllnHtYEDVqroI98jde5hZNtV5yjA+yehnKBiGlMcWXMG1t1L0glKsTRUS+1
         hV3w==
X-Gm-Message-State: APjAAAW8lOvNJpDKUrE+y/MG2D2uZQ4Cba5daW/aNiVcyITbmq6u+AoJ
        XoWOj96lbXpatCvRA1xl6dZVZv8ETJR5nQ==
X-Google-Smtp-Source: APXvYqwQam6eWnyNaRnvLC8IN79OfdtNQK6s5BG7GaJaxRKfpvaD0CESp4p/ah8VMpLvWn6AtodhCA==
X-Received: by 2002:a17:90b:8d1:: with SMTP id ds17mr12110001pjb.47.1570127811972;
        Thu, 03 Oct 2019 11:36:51 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id k8sm2795137pgm.14.2019.10.03.11.36.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Oct 2019 11:36:51 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] pinctrl: iproc: use unique name for irq chip
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linus.walleij@linaro.org, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com,
        rayagonda.kokatanur@broadcom.com, li.jin@broadcom.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20191003000310.17099-1-chris.packham@alliedtelesis.co.nz>
 <20191003000310.17099-3-chris.packham@alliedtelesis.co.nz>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <3c03506b-8ac3-4f17-3784-fd0292e3d3ee@broadcom.com>
Date:   Thu, 3 Oct 2019 11:36:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003000310.17099-3-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

looks fine

On 2019-10-02 5:03 p.m., Chris Packham wrote:
> Use the dev_name(dev) for the irqc->name so that we get unique names
> when we have multiple instances of this driver.
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Acked-by: Scott Branden <scott.branden@broadcom.com>
> ---
>   drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> index 8971fc54e974..c24d49d436ce 100644
> --- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> +++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> @@ -858,7 +858,7 @@ static int iproc_gpio_probe(struct platform_device *pdev)
>   		struct gpio_irq_chip *girq;
>   
>   		irqc = &chip->irqchip;
> -		irqc->name = "bcm-iproc-gpio";
> +		irqc->name = dev_name(dev);
>   		irqc->irq_ack = iproc_gpio_irq_ack;
>   		irqc->irq_mask = iproc_gpio_irq_mask;
>   		irqc->irq_unmask = iproc_gpio_irq_unmask;

