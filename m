Return-Path: <linux-gpio+bounces-24998-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8349EB37485
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 23:47:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA4337C42A3
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 21:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2FB52882AA;
	Tue, 26 Aug 2025 21:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iut+CaEi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CB51C5D4B;
	Tue, 26 Aug 2025 21:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756244844; cv=none; b=KE5X4+vcdagD1nAv8pTXJb9SRlYmNwwt6h3+z8tLk6y5qZUe7iLJHVOPiGUSOR1aAlavN0Ss/2cCnTiUF91lIfGktm29mFFETinhOX3E7KO/ax/IrQ8jVZC2oxqAwxj6pjRp9cUHZKuCHfbPizqpgwwy6NAljzELll+2MCg6XaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756244844; c=relaxed/simple;
	bh=7rZc4H6brtLrd8ymrzGf1cMDZcvIgN8NA8yiwzAbcNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ko+kY4GKtZ1yPJgxk9AwvqG7QhEUFpGMrQfV9659AyqJ2Sx5cYJmeMksMrZpA3I6cIBVMNn/WoBXU21gz0qbfEr5FBARRgERCw7VmPnjIVDNfiBIqJzW9RWaqMUw7A+nb4iTcxTkZF7E4egv99e0smtOb4b+qbJ8MMT+Bk9p1sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iut+CaEi; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4b2b859ab0dso36081231cf.1;
        Tue, 26 Aug 2025 14:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756244842; x=1756849642; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XkXCtZkNS4sQ1PyXjfM/RdJFG7EoG62SuYsDVUj0IR4=;
        b=Iut+CaEi7BgMy8MceXxv9/6HZgjXxspQj/CyB3K+aXubF8hW/Vb8xJe+fhzLspb9cO
         hzz/QI2R/twwqCjqHXxrdqqPJfVqSKIEd8iM+7weJVQ2B9BGpJ7GS/sT2dtbXfjYbnjs
         dfiQo1OCJ37zATLZcDWPAb6YJICpUHNyWvok8/yd1R+U39dd3soJ+7SwNlK6PUwc96Pn
         58pC6Tc01IV1Ivrkklqtc2TIWm/A42qPS5cH+79AWG22dyYkEUqsmXG3yfgVEjD/cQlO
         Xtf3kvek01R0Y7iKpmNGOP0JxIqf70Riz2FOk7iySzchrbDcsycbfeshOLKn5k8a+n7y
         AUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756244842; x=1756849642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XkXCtZkNS4sQ1PyXjfM/RdJFG7EoG62SuYsDVUj0IR4=;
        b=j1bP80lTvUyWUwYsujvJy2mEONMHzs7sBdID98rQZhKbkXtJrwrBK+pmmYcHEaNWI8
         xxy5zhLdoXCFIDk9yQmwNX8KfzTpMIXdAysJno/uoFR/GR/X6xqt5teTwAVYCG+G0R1/
         u3TDYSpPKYBioeh5KIucLRAu9XC+oxtmrZ8Ik2qCLfZZ9odUPDnze5RIQ6x62KxibesE
         97HtS55SpWUmFBk/8KL4SRMD+LbGVPyNQSvSfsZ/RBOSxwwsVfuSPXcnsx+5o0R9RyE2
         KPNV86DLG95r9Ii22cuVr785iPbpOnCms8JoEW+wp1M6Qw87tV26vCD6JbaZgYN4cLO6
         fyOA==
X-Forwarded-Encrypted: i=1; AJvYcCUN6/D1HYy12CZll6jtp3P+DBL8a5IgVoZK37yNwszNWGq4h0pWueZfpYb+QC+U3vO29UH2z2ymvvIOoA==@vger.kernel.org, AJvYcCVv9P5HJ3hwEgd+k4TEPgtsBSQXEbvnBl4PQxgXH/9NJe4XH0U/pFHibmo0IUz30JJWwIXYN7QPTR3W@vger.kernel.org, AJvYcCW9XV2J/Omp8xrTQDkBtU3AWvCU/tmQxPmgLi6YALiANnLYvviTCsgMO4KMba7lYELXMQhasFDCZlSetWTw@vger.kernel.org
X-Gm-Message-State: AOJu0YywFZ2CLev+VsuXNkCCEml2kvNn6ep5W1aMRzUb25OiLAkEuG5t
	6X17UJtFW5qFTsysFTqO+Sjg9OFHfxKEzFduxK5j9tZYndusgWBFIHh4
X-Gm-Gg: ASbGncuae3wmgWBHY15G88UM4Zvm1qTTab4Fc8WJUvgVGKUcjC+NwB/ottjZHpcMJvK
	tHyP58BsJYeyGf+4uRBaEOzNBGXOfG1478/QorbDdfTSSPlLIF7/z1qIqycNRvRDiBIby/7l7Xh
	NXglyG1a4V8NBmMQcJV0KBeLClKCJFnC53G5z04CWE/UAKroJAksfdohxg7wPGQi6vBj2JLtbSN
	+uPPC6XwJmC63cfcgRLzgnpX3sKJt/DUsWbJkfPzyMGawmHxorXlYcmUGaAu5taepf+Ga2//TQ2
	xU6Ff9qA3dAxGZsve3YrLmdVOg/G0ls/VMTwfhzm8/24P0fnicareXEiBdv6zCOWRjI+PbBc8oB
	hO2bH4yASmuqwR+SGejYhb7AdTHoAn6rULiNNl06N+xPnOKrA
X-Google-Smtp-Source: AGHT+IH/4BueP1i9uTaGBcioRqKWdWlLPnxhgjhYg/TT045qxzwvPNCGSAOghSI6A+lqXYcoj0Z8VQ==
X-Received: by 2002:ac8:5f4d:0:b0:4b1:dd3:e397 with SMTP id d75a77b69052e-4b2aab56bacmr177029521cf.62.1756244841768;
        Tue, 26 Aug 2025 14:47:21 -0700 (PDT)
Received: from [10.69.40.168] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8de5d37sm77448621cf.34.2025.08.26.14.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 14:47:21 -0700 (PDT)
Message-ID: <e9aa8a07-4ed7-4a7f-a69a-ce496ede48cc@gmail.com>
Date: Tue, 26 Aug 2025 14:47:30 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] gpio: brcmstb: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Michael Buesch <m@bues.ch>,
 Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>,
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux@ew.tq-group.com
References: <20250820154037.22228-1-jszhang@kernel.org>
 <20250820154037.22228-3-jszhang@kernel.org>
Content-Language: en-US
From: Doug Berger <opendmb@gmail.com>
In-Reply-To: <20250820154037.22228-3-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/2025 8:40 AM, Jisheng Zhang wrote:
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   drivers/gpio/gpio-brcmstb.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
> index e29a9589b3cc..0ca3e0d8aa46 100644
> --- a/drivers/gpio/gpio-brcmstb.c
> +++ b/drivers/gpio/gpio-brcmstb.c
> @@ -534,7 +534,6 @@ static void brcmstb_gpio_shutdown(struct platform_device *pdev)
>   	brcmstb_gpio_quiesce(&pdev->dev, false);
>   }
>   
> -#ifdef CONFIG_PM_SLEEP
>   static void brcmstb_gpio_bank_restore(struct brcmstb_gpio_priv *priv,
>   				      struct brcmstb_gpio_bank *bank)
>   {
> @@ -573,14 +572,9 @@ static int brcmstb_gpio_resume(struct device *dev)
>   	return 0;
>   }
>   
> -#else
> -#define brcmstb_gpio_suspend	NULL
> -#define brcmstb_gpio_resume	NULL
> -#endif /* CONFIG_PM_SLEEP */
> -
>   static const struct dev_pm_ops brcmstb_gpio_pm_ops = {
> -	.suspend_noirq	= brcmstb_gpio_suspend,
> -	.resume_noirq = brcmstb_gpio_resume,
> +	.suspend_noirq = pm_sleep_ptr(brcmstb_gpio_suspend),
> +	.resume_noirq = pm_sleep_ptr(brcmstb_gpio_resume),
>   };
>   
>   static int brcmstb_gpio_probe(struct platform_device *pdev)
> @@ -747,7 +741,7 @@ static struct platform_driver brcmstb_gpio_driver = {
>   	.driver = {
>   		.name = "brcmstb-gpio",
>   		.of_match_table = brcmstb_gpio_of_match,
> -		.pm = &brcmstb_gpio_pm_ops,
> +		.pm = pm_sleep_ptr(&brcmstb_gpio_pm_ops),
>   	},
>   	.probe = brcmstb_gpio_probe,
>   	.remove = brcmstb_gpio_remove,

Acked-by: Doug Berger <opendmb@gmail.com>

