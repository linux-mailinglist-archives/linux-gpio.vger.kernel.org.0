Return-Path: <linux-gpio+bounces-22325-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 936C3AEB0E7
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 10:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EECE93B452B
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 08:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC3722FF35;
	Fri, 27 Jun 2025 08:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KmO82kM0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F86B3C01
	for <linux-gpio@vger.kernel.org>; Fri, 27 Jun 2025 08:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751011484; cv=none; b=U6ktYrG66fZhp0TghM1f8mlOytR32D35JVzkClOi9Nr7Nss/D5NPk92twxSVmKBOf1w3WEFd3BRR+pFfjJfk8rBgILAPOHx79tutohaQ28uc/DjQCk+mfz76Z94bcp76rBAhZ4p1zl3l0gr4/20me8/cEgKhojF1Tz7X3rGak4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751011484; c=relaxed/simple;
	bh=HKgFRIAWKhwztE9CHed3YCwzPqeaHfL05xrmFE8N+Dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NMKtDU1I1CBvQLMcgCRNznAuhk2I3qX0HMzLQCDQQhEkTK6poPXD7S9ZhDsRMQVSwI11vm4A4JCpQ4CCnd4rSQMu+4D5KXG6+HWovE1h/i33xW+ojedEDq+pSr7ndwYxpK35in6Sj7gww2KvXTVJeKr6m+3Vquk7+9oDubLzMU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KmO82kM0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B3BC4CEE3;
	Fri, 27 Jun 2025 08:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751011483;
	bh=HKgFRIAWKhwztE9CHed3YCwzPqeaHfL05xrmFE8N+Dg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KmO82kM0JKRj1RpAYODoEFfqj3ocXCu5fcdlo9oN6vUDz48u3EILV/keifv6rOTDN
	 OfGU92L6PyISGNE1JXVpxs+Rjh37/nv9j6oY8+JjyDiGFJbyyXp9L3X8WubaAq4fyL
	 Cee4TwUU3G01c/4PLnRdZfHELGiaDTQg2TrZrAJ6zb94ly+Snt/FJuQhLKwU2gR0bc
	 4mvlxVhtG0sPhmRWozqAWGqkuREtL7dRO3FPuuGOOjLZ5pYvfH1QD3bI7pGFKSCAKd
	 NO6lACFcgGBkYO2neGCPzK38mgahRocUYySH+SXz1svTyEyBL5iZvf7kuU/U4ymcJD
	 yirAQdYlxZV8w==
Message-ID: <375eadfd-4ede-49ff-a75a-a39f68605277@kernel.org>
Date: Fri, 27 Jun 2025 10:04:40 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: amd: Clear GPIO debounce for suspend
To: Mario Limonciello <superm1@kernel.org>, mario.limonciello@amd.com,
 Basavaraj.Natikar@amd.com, Shyam-sundar.S-k@amd.com,
 linus.walleij@linaro.org, dmitry.torokhov@gmail.com
Cc: linux-gpio@vger.kernel.org
References: <20250626221409.2256551-1-superm1@kernel.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250626221409.2256551-1-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mario,

On 27-Jun-25 12:14 AM, Mario Limonciello wrote:
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

Nice I do think this is a better solution then disabling hw-debounce
in soc-button-array as we did before.

> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Hans de Goede <hansg@kernel.org>
> Fixes: 5c4fa2a6da7fb ("Input: soc_button_array - debounce the buttons")
> Link: https://lore.kernel.org/linux-input/mkgtrb5gt7miyg6kvqdlbu4nj3elym6ijudobpdi26gp4xxay5@rsa6ytrjvj2q/
> Link: https://lore.kernel.org/linux-input/20250625215813.3477840-1-superm1@kernel.org/
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/pinctrl/pinctrl-amd.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
> index 5cf3db6d78b79..4276bbe77e0e9 100644
> --- a/drivers/pinctrl/pinctrl-amd.c
> +++ b/drivers/pinctrl/pinctrl-amd.c
> @@ -979,6 +979,13 @@ static int amd_gpio_suspend_hibernate_common(struct device *dev, bool is_suspend
>  				  pin, is_suspend ? "suspend" : "hibernate");
>  		}
>  
> +		/* clear debounce */
> +		if (gpio_dev->saved_regs[i] & (DB_CNTRl_MASK << DB_CNTRL_OFF)) {
> +			amd_gpio_set_debounce(gpio_dev, pin, 0);
> +			pm_pr_dbg("Clearing debounce for GPIO #%d during %s.\n",
> +				  pin, is_suspend ? "suspend" : "hibernate");
> +		}
> +


I notice that the if () { } block above this checks if a pin is not configured
to be a wakeup src. Since we only need this for wakeup sources maybe put this
in an else block of the if () { } block above this ?

I've not strong preference for doing this change, just something which I noticed
while looking at the code.

Either way this should probably have a comment on why the clearing is done here.

Regards,

Hans



>  		raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
>  	}
>  


