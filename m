Return-Path: <linux-gpio+bounces-33026-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKDwHYs4sGkKhQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33026-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 16:28:11 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D222537C8
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 16:28:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8746C318B597
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 14:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F2B2E7621;
	Tue, 10 Mar 2026 14:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UN9V9OwM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3044E2D0C63;
	Tue, 10 Mar 2026 14:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773153244; cv=none; b=PuX7yx2G9XRYsvI3t3sgBX8WSo3LgikSFVPTozUl2J4/gMbIpmxcm+jI3fkvIu7wRgfbWgjxfPnZhbYljlhs7UaWcynKONOi195veXaHgw+wrU/m76q6e5SyyE1prKcKoR34EhnqgwrshsfXCNQqpIsSbMIFiOOhV6ah3mOvMA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773153244; c=relaxed/simple;
	bh=en8zy/sckVOY0F1xKRSThzPbRxMSB+5Nfupj5w0twTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m6U0FZ0Ox+ixvRZYITUSEig1U5p54zul7PF0kgPd0mSwlLPZ1elk5E6ClJt1AHE6P1BMZJh2a13kcltnzo/A1R8PH17qjrZwVYppFApNdRgp02kMlCLzfMENQ1cQ4HIgFNH9KsNMFIAJcWitiiNPs0ig/6eVmc3pEn+e6OpFkwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UN9V9OwM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6502D250;
	Tue, 10 Mar 2026 15:32:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773153175;
	bh=en8zy/sckVOY0F1xKRSThzPbRxMSB+5Nfupj5w0twTo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UN9V9OwM5nHzxHfdkdjzjSf/8Yb1sKtLFNVM/q5Pl370Ij6BV2VWwrBkvWNH7MUc+
	 GauE9o+N0bNVNTEY5stNoy3qAJL7y7ogFcpFGMSaMVvj8hBlBEkA0sqoXgGpZX1ECr
	 i7HM2U/1b7PWVx4VYR4zqL1jah7jU4l1y0hlzy1s=
Message-ID: <49b787d2-f5e6-47a7-863c-ac3ee24dca86@ideasonboard.com>
Date: Tue, 10 Mar 2026 14:33:58 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] gpio: tps68470: Add i2c daisy chain support
To: Antti Laakso <antti.laakso@linux.intel.com>, linux-media@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linusw@kernel.org, brgl@kernel.org, sakari.ailus@linux.intel.com,
 mchehab@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 hverkuil+cisco@kernel.org, sre@kernel.org, hao.yao@intel.com,
 jason.z.chen@intel.com, jimmy.su@intel.com, miguel.vadillo@intel.com,
 kees@kernel.org, ribalda@chromium.org
References: <20260310124427.693625-1-antti.laakso@linux.intel.com>
 <20260310124427.693625-5-antti.laakso@linux.intel.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260310124427.693625-5-antti.laakso@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E8D222537C8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33026-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Antti

On 10/03/2026 12:44, Antti Laakso wrote:
> The tps68470 daisy chain make use of gpio 1 and 2. When in use, these
> gpios must be configured as inputs without pull-up.
> 
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/gpio/gpio-tps68470.c | 23 ++++++++++++++++++++++-
>   1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-tps68470.c b/drivers/gpio/gpio-tps68470.c
> index d4fbdf90e190..729ad8e397fc 100644
> --- a/drivers/gpio/gpio-tps68470.c
> +++ b/drivers/gpio/gpio-tps68470.c
> @@ -14,6 +14,7 @@
>   #include <linux/gpio/driver.h>
>   #include <linux/mfd/tps68470.h>
>   #include <linux/module.h>
> +#include <linux/platform_data/tps68470.h>
>   #include <linux/platform_device.h>
>   #include <linux/regmap.h>
>   
> @@ -120,6 +121,17 @@ static int tps68470_gpio_input(struct gpio_chip *gc, unsigned int offset)
>   				   TPS68470_GPIO_MODE_MASK, 0x00);
>   }
>   
> +static int tps68470_enable_i2c_daisy_chain(struct gpio_chip *gc)
> +{
> +	int ret;
> +
> +	ret = tps68470_gpio_input(gc, 1);
> +	if (ret)
> +		return ret;
> +
> +	return tps68470_gpio_input(gc, 2);
> +}
> +
>   static const char *tps68470_names[TPS68470_N_GPIO] = {
>   	"gpio.0", "gpio.1", "gpio.2", "gpio.3",
>   	"gpio.4", "gpio.5", "gpio.6",
> @@ -129,6 +141,8 @@ static const char *tps68470_names[TPS68470_N_GPIO] = {
>   static int tps68470_gpio_probe(struct platform_device *pdev)
>   {
>   	struct tps68470_gpio_data *tps68470_gpio;
> +	struct tps68470_gpio_platform_data *pdata = dev_get_platdata(&pdev->dev);
> +	int ret = 0;
>   
>   	tps68470_gpio = devm_kzalloc(&pdev->dev, sizeof(*tps68470_gpio),
>   				     GFP_KERNEL);
> @@ -149,7 +163,14 @@ static int tps68470_gpio_probe(struct platform_device *pdev)
>   	tps68470_gpio->gc.base = -1;
>   	tps68470_gpio->gc.parent = &pdev->dev;
>   
> -	return devm_gpiochip_add_data(&pdev->dev, &tps68470_gpio->gc, tps68470_gpio);
> +	ret = devm_gpiochip_add_data(&pdev->dev, &tps68470_gpio->gc, tps68470_gpio);
> +	if (ret)
> +		return ret;
> +
> +	if (pdata && pdata->daisy_chain_enable)
> +		ret = tps68470_enable_i2c_daisy_chain(&tps68470_gpio->gc);
> +
> +	return ret;
>   }
>   
>   static struct platform_driver tps68470_gpio_driver = {


