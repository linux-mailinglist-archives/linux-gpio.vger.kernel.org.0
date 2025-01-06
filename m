Return-Path: <linux-gpio+bounces-14548-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 742EEA0323A
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 22:43:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E99163A3627
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 21:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385081E04A9;
	Mon,  6 Jan 2025 21:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="iowIDloh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-74.smtpout.orange.fr [80.12.242.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D6F188A0D;
	Mon,  6 Jan 2025 21:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736199809; cv=none; b=msvLrCE8dvk9CVVelY6i/geUFipBrkLBu12b3j4s0N1UMjwlVrLMnft0Emok9gpszaSj8LoHOBBaiY+BO3EERqtsH6PjulEBMLLw+Rwt2QiPRy54NvjpLBg65+mObifkny6mbXsEO3CCaG6h1/EqTcgAK+cHPC51U70zyM7XmjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736199809; c=relaxed/simple;
	bh=O0MQ2l63dfHE7WM1suoTpwLA1O7Xfa/0PKd9qMjqFEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DJFgAgMW0xOO2YpepaPOPhHpNAvX/HJgh//+cXuCFPEiqZByuQsF9aVZo/eWvJ4sge5fqguIPQQ/1BUJeiCn5kMpKOZsPZ6FI9u3UPUWBxFIPu6yrXRRqadiMyx+c6ixhQ4K4xAeAttXldZa0NavlCYfxN0kEmcqrHvl8HV5MXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=iowIDloh; arc=none smtp.client-ip=80.12.242.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id UujktaFspoTrQUujntr9Qg; Mon, 06 Jan 2025 22:34:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1736199258;
	bh=PcGDZ20MbLYfZ7EGFNqqr0gNwlImKeN5cu0DsZ7P7vk=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=iowIDlohTttzH2sFgYMmwPrmnRlT+5GB954fxcD3g9XT1Jfp8T4QVPpdSDMcHy9aj
	 7GSuWLgsK0oXxV1PJ0wExZmY0CioAJZnA+F4+yVhybbdcAWfZcRj33k7oLILj07DkY
	 Ndd5RcHrQossS84+4RDuZ+RxNSz6dtAEWxjpLeF4H54GWg8QDUaSTaz6YqwDdNwq6a
	 qMtjCnWJsB93DwwBNRxmVBdvpyTcjKw3kMZK5o04QmX7sq+3ES19JzdDL/aDR2se5a
	 JjPiK+riSPP/L9m+e4wU8Bb4rFq7HnhvPeZ9WHgXN18/wU6G14LnGLLiIQXjaj73ok
	 z/0QiDs74rKxg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 06 Jan 2025 22:34:18 +0100
X-ME-IP: 90.11.132.44
Message-ID: <955f3abf-81b8-4471-82eb-b969dc5d7c9e@wanadoo.fr>
Date: Mon, 6 Jan 2025 22:34:12 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: microchip: pci1xxxx: Fix possible double free in
 error handling path
To: Ma Ke <make24@iscas.ac.cn>, kumaravel.thiagarajan@microchip.com,
 arnd@arndb.de, gregkh@linuxfoundation.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250106074053.312243-1-make24@iscas.ac.cn>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250106074053.312243-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 06/01/2025 à 08:40, Ma Ke a écrit :
> When auxiliary_device_add() returns error and then calls
> auxiliary_device_uninit(), the callback function
> gp_auxiliary_device_release() calls kfree() to free memory. Do not
> call kfree() again in the error handling path.
> 
> Fix this by skipping the redundant kfree().
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 393fc2f5948f ("misc: microchip: pci1xxxx: load auxiliary bus driver for the PIO function in the multi-function endpoint of pci1xxxx device.")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>   drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
> index 32af2b14ff34..fbd712938bdc 100644
> --- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
> +++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
> @@ -111,6 +111,7 @@ static int gp_aux_bus_probe(struct pci_dev *pdev, const struct pci_device_id *id
>   
>   err_aux_dev_add_1:
>   	auxiliary_device_uninit(&aux_bus->aux_device_wrapper[1]->aux_dev);
> +	goto err_aux_dev_add_0;
>   
>   err_aux_dev_init_1:
>   	ida_free(&gp_client_ida, aux_bus->aux_device_wrapper[1]->aux_dev.id);
> @@ -120,6 +121,7 @@ static int gp_aux_bus_probe(struct pci_dev *pdev, const struct pci_device_id *id
>   
>   err_aux_dev_add_0:
>   	auxiliary_device_uninit(&aux_bus->aux_device_wrapper[0]->aux_dev);
> +	goto err_ret;
>   
>   err_aux_dev_init_0:
>   	ida_free(&gp_client_ida, aux_bus->aux_device_wrapper[0]->aux_dev.id);

Hi,

This is strange because the nearly same patch is in -next since June 
2024 ([1])

It is also in Linux since at least 6.10 ([2])

In [1] and [2], there is also a new err_ret label, which is not part of 
your patch.

On which tree are you working?
Is your patch compile tested?

CJ


[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c?id=086c6cbcc563c81d55257f9b27e14faf1d0963d3

[2]: 
https://elixir.bootlin.com/linux/v6.10/source/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c#L116

