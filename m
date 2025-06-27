Return-Path: <linux-gpio+bounces-22355-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFECAEBCA6
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 17:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C80833B4201
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 15:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CCA02E9ECE;
	Fri, 27 Jun 2025 15:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WFOg3zkc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8302EA148
	for <linux-gpio@vger.kernel.org>; Fri, 27 Jun 2025 15:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039820; cv=none; b=UwhHKQcEgNDBl8gCPEsSd/j5joq+t3bO6hgl3wTzLfa6Z81R457cGm1F3NIktJzmWcXKoWVeEjDkXEULEse+o8ROP5tgRBnWTmZorNYfmsdrs0lUlTo04IDnQb3z+wEhu2g+5WDerdZyawde4tWZX7m3k4SnU4l+RAoNvXad8OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039820; c=relaxed/simple;
	bh=UBKlyQTrrW5klKrbyU9NXzUyebl1blpNBjEVxRRuQFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C1dpxnQrw7vVPQpQwE2IeSivf95EVGIs6UzxEezxp3xPShEdiHlvMbULv6hx3u92MivsiVFeaqSlEmKLJR/1hVunJux6PyhuvAA84IHyMKUj0ISzr9YpxYuub9/EDIEAuUBssxQTNcZ1Loz1UpW7QhmBgCuxbv6LhIWhEeRBrZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WFOg3zkc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FE60C4CEEF;
	Fri, 27 Jun 2025 15:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751039820;
	bh=UBKlyQTrrW5klKrbyU9NXzUyebl1blpNBjEVxRRuQFk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WFOg3zkcKgG/IBxLP7H2u+QkMUQ7xTXT9E6le4cUCqawbwIfr/s1By8+DrnMavRSp
	 WvMkPngZprZ3ftXxypMwCyhnoZhBHOB6IwFfND4gl3N/Wp02RDXNAIRRrCRALNgdRW
	 97rolVuB0lLJwbuEvPhUkGrcMSujPCjZFwHovnwQADpp5OojJL24pCpE9POY6+dXFZ
	 wMF4lD95FjXsBp4ZjKKdSF4nAPR9YzgnugMiX3AlyPtOkIiSBi3RGHyCf6WtjJK86Y
	 U0FAWPc7wffz8N7NqqtUkuBUdWMV4uKWg36MQhBBBPhVaLcxqFrX166yTLLrOvnnny
	 A0mYGa3yZ6xDg==
Message-ID: <076e7574-d16d-4f26-8e15-1a05cd5af7ab@kernel.org>
Date: Fri, 27 Jun 2025 17:56:57 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: amd: Clear GPIO debounce for suspend
To: Mario Limonciello <superm1@kernel.org>, mario.limonciello@amd.com,
 Basavaraj.Natikar@amd.com, Shyam-sundar.S-k@amd.com,
 linus.walleij@linaro.org, dmitry.torokhov@gmail.com
Cc: linux-gpio@vger.kernel.org
References: <20250627150155.3311574-1-superm1@kernel.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250627150155.3311574-1-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 27-Jun-25 5:01 PM, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> soc-button-array hardcodes a debounce value by means of gpio_keys
> which uses pinctrl-amd as a backend to program debounce for a GPIO.
> 
> This hardcoded value doesn't match what the firmware intended to be
> programmed in _AEI. The hardcoded debounce leads to problems waking
> from suspend. There isn't appetite to conditionalize the behavior in
> soc-button-array or gpio-keys so clear it when the system suspends to
> avoid problems with being able to resume.
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Hans de Goede <hansg@kernel.org>
> Fixes: 5c4fa2a6da7fb ("Input: soc_button_array - debounce the buttons")
> Link: https://lore.kernel.org/linux-input/mkgtrb5gt7miyg6kvqdlbu4nj3elym6ijudobpdi26gp4xxay5@rsa6ytrjvj2q/
> Link: https://lore.kernel.org/linux-input/20250625215813.3477840-1-superm1@kernel.org/
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v2:
>  * clarify comment for pinctrl (Hans)

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans



> ---
>  drivers/pinctrl/pinctrl-amd.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
> index 5cf3db6d78b79..b3f0d02aeeb35 100644
> --- a/drivers/pinctrl/pinctrl-amd.c
> +++ b/drivers/pinctrl/pinctrl-amd.c
> @@ -979,6 +979,17 @@ static int amd_gpio_suspend_hibernate_common(struct device *dev, bool is_suspend
>  				  pin, is_suspend ? "suspend" : "hibernate");
>  		}
>  
> +		/*
> +		 * debounce enabled over suspend has shown issues with a GPIO
> +		 * being unable to wake the system, as we're only interested in
> +		 * the actual wakeup event, clear it.
> +		 */
> +		if (gpio_dev->saved_regs[i] & (DB_CNTRl_MASK << DB_CNTRL_OFF)) {
> +			amd_gpio_set_debounce(gpio_dev, pin, 0);
> +			pm_pr_dbg("Clearing debounce for GPIO #%d during %s.\n",
> +				  pin, is_suspend ? "suspend" : "hibernate");
> +		}
> +
>  		raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
>  	}
>  


