Return-Path: <linux-gpio+bounces-33002-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CErvCXkhsGmCgAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33002-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 14:49:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B516F250D91
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 14:49:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 69B943177873
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 13:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4C83BC686;
	Tue, 10 Mar 2026 13:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVW4mxee"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2A33A75B9;
	Tue, 10 Mar 2026 13:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148040; cv=none; b=E2mKnXWwS0ozhmrC17LVgITDEeCrqumioqCQd6vwtfDg9kPWoBApONHDvwXunvYaQrXroBUgfmLF4lOU5ghqf7oQQGIzN9M6PDMXikWTzyOFvuVj5mv4zotVsRUHIkh+QEMGLyO6HAfH3nRBlU+JQZdegzEdkcYL5V6VthZZxzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148040; c=relaxed/simple;
	bh=PKZXbPYgvJTKRqt2jl+pa3m2GFfmeYgaiCcXYSCsdwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ct+1hEUagB9JIwU8xcWm9ivmlI2dJqpxRtVO22tNQWTMbzTAsSGTZufD9oBBtxFOmBfUnQMcLXLig/sbUP5a6C+QLscuyVw5heyEjZ3itj0h2b+qZRyDM20lOe15OVdsfMl86E1FvoC8LLoHRrdRn2MZFAP81U/Nd6r66xwsAqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVW4mxee; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A775C19423;
	Tue, 10 Mar 2026 13:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773148039;
	bh=PKZXbPYgvJTKRqt2jl+pa3m2GFfmeYgaiCcXYSCsdwk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IVW4mxeeQng902Q13MtxcFuNpfTXHl6MynBUSVoWsggxojQkEhmhl7zn5OS+yxVJr
	 608WPctMs8HySBWOd7dbvdDk+nxa5OZh7uFqqSkToRSecivCNZPWfsVMt8lbA3EbTH
	 LY7lIxGp1i98s0Rg/VD8VR21Y17OvlbBWZ6r0HiI+DncI8qXdd0qLa36oJeX/tTxJA
	 OiryYLjNMbxdhTwAs8d8XPd++9fh+kD6AgGQ/QhOV8eaat0u2OFU5KcFsLSzoQzOhK
	 ztMDN0NRce64ZoAkUCmBw7ZxZXmjGUom1UIv/JhR09XMJfTV+REe+sgek+g7lKu56l
	 u233V9YDXskVQ==
Message-ID: <44b921d8-9ee9-46a2-b24a-0ba60b4fd0a2@kernel.org>
Date: Tue, 10 Mar 2026 14:07:14 +0100
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
 mchehab@kernel.org, dan.scally@ideasonboard.com,
 ilpo.jarvinen@linux.intel.com, hverkuil+cisco@kernel.org, sre@kernel.org,
 hao.yao@intel.com, jason.z.chen@intel.com, jimmy.su@intel.com,
 miguel.vadillo@intel.com, kees@kernel.org, ribalda@chromium.org
References: <20260310124427.693625-1-antti.laakso@linux.intel.com>
 <20260310124427.693625-5-antti.laakso@linux.intel.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260310124427.693625-5-antti.laakso@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B516F250D91
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33002-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

Hi,

On 10-Mar-26 13:44, Antti Laakso wrote:
> The tps68470 daisy chain make use of gpio 1 and 2. When in use, these
> gpios must be configured as inputs without pull-up.
> 
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


> ---
>  drivers/gpio/gpio-tps68470.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-tps68470.c b/drivers/gpio/gpio-tps68470.c
> index d4fbdf90e190..729ad8e397fc 100644
> --- a/drivers/gpio/gpio-tps68470.c
> +++ b/drivers/gpio/gpio-tps68470.c
> @@ -14,6 +14,7 @@
>  #include <linux/gpio/driver.h>
>  #include <linux/mfd/tps68470.h>
>  #include <linux/module.h>
> +#include <linux/platform_data/tps68470.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  
> @@ -120,6 +121,17 @@ static int tps68470_gpio_input(struct gpio_chip *gc, unsigned int offset)
>  				   TPS68470_GPIO_MODE_MASK, 0x00);
>  }
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
>  static const char *tps68470_names[TPS68470_N_GPIO] = {
>  	"gpio.0", "gpio.1", "gpio.2", "gpio.3",
>  	"gpio.4", "gpio.5", "gpio.6",
> @@ -129,6 +141,8 @@ static const char *tps68470_names[TPS68470_N_GPIO] = {
>  static int tps68470_gpio_probe(struct platform_device *pdev)
>  {
>  	struct tps68470_gpio_data *tps68470_gpio;
> +	struct tps68470_gpio_platform_data *pdata = dev_get_platdata(&pdev->dev);
> +	int ret = 0;
>  
>  	tps68470_gpio = devm_kzalloc(&pdev->dev, sizeof(*tps68470_gpio),
>  				     GFP_KERNEL);
> @@ -149,7 +163,14 @@ static int tps68470_gpio_probe(struct platform_device *pdev)
>  	tps68470_gpio->gc.base = -1;
>  	tps68470_gpio->gc.parent = &pdev->dev;
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
>  }
>  
>  static struct platform_driver tps68470_gpio_driver = {


