Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07259305B3
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2019 02:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbfEaARf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 May 2019 20:17:35 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:33217 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbfEaARf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 May 2019 20:17:35 -0400
Received: by mail-ed1-f67.google.com with SMTP id n17so11766181edb.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 May 2019 17:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=KilQgTmnb5nYWh7a+i+EYwFVHm8qNkHvjaIrcsYy+bQ=;
        b=UYD6a11T0faxUH6FuHYRubUy66uwhxQIFEQHBDNi6Hm0rsKXch8bTe4qbEogjYXF12
         +tAXmYQJ2h0kxzyQiD4t336y85hpXCAo42Kpxvof+f9lePbWvaCcWzpiUJcAHGhnIRYb
         0uJU5TwEMlTC8awpUo4J5raGlGPbw6sNU0C0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KilQgTmnb5nYWh7a+i+EYwFVHm8qNkHvjaIrcsYy+bQ=;
        b=oH8uwrTxizYPy3o9Glx6Jv4rhqCgeB3HABUzrNWqlOKrcvUPMzhoFXQQVryOC0DJer
         IV8TH2v/l0TANBXSrNRdDBizCR7/G7suq3q1d4pUiisvhcPwpOAvgIq2I/hVpxTm9HMJ
         GkmfjkJKGVsYjoRp8ojuQ1dSdFRhVTgjn6Ob+x0tNbNW02fD8hMeGSdOiJTQnP3DhTZ5
         DQtp5Vc9dMsQzkMn7jaK0RqmSBvxM8xAw2F2NZz1qfbUTFe5oQ/1WOmoYcaLc5OmavSu
         YW3LbGWmtOcfLQi78E7aZTR2+NkVF8rzFSbiqpVUHeTLBHZ2qZ7RbcodUC9VMASatGVr
         Qk5Q==
X-Gm-Message-State: APjAAAV0/plSqQ8afNHkET52WqXpYmK65mJ1J9YgKEynmKDHlPCUx5n1
        SF6igiWUTB3LHxYSfWqDjddxPQ==
X-Google-Smtp-Source: APXvYqxpHaDuapqKKB2H8FRfUx2YJNboFSFW9NVWgRnsRiE5ANLJDWfQM9va4NxyzqJDXI1k3Rd8FQ==
X-Received: by 2002:a17:906:843:: with SMTP id f3mr6346472ejd.70.1559261853687;
        Thu, 30 May 2019 17:17:33 -0700 (PDT)
Received: from [10.136.8.252] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id o2sm684618ejz.22.2019.05.30.17.17.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 17:17:32 -0700 (PDT)
Subject: Re: [PATCH] pinctrl: ns2: Fix potential NULL dereference
To:     Young Xiao <92siuyang@gmail.com>, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1559097838-26070-1-git-send-email-92siuyang@gmail.com>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <ace57d13-6194-df8e-d2e8-fbc85d9ce21a@broadcom.com>
Date:   Thu, 30 May 2019 17:17:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1559097838-26070-1-git-send-email-92siuyang@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 5/28/2019 7:43 PM, Young Xiao wrote:
> platform_get_resource() may fail and return NULL, so we should
> better check it's return value to avoid a NULL pointer dereference
> a bit later in the code.
> 
> Signed-off-by: Young Xiao <92siuyang@gmail.com>
> ---
>  drivers/pinctrl/bcm/pinctrl-ns2-mux.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
> index 4b5cf0e..2bf6af7 100644
> --- a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
> +++ b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
> @@ -1048,6 +1048,8 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
>  		return PTR_ERR(pinctrl->base0);
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	if (!res)
> +		return -EINVAL;

Right, usually not needed if devm_ioremap_resource is used since it was
checked there. But in this case, I do think it needs to be checked. This
change looks good to me. Thanks.

>  	pinctrl->base1 = devm_ioremap_nocache(&pdev->dev, res->start,
>  					resource_size(res));
>  	if (!pinctrl->base1) {
> 

Reviewed-by: Ray Jui <ray.jui@broadcom.com>
