Return-Path: <linux-gpio+bounces-36626-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFnYGaJFAmoppwEAu9opvQ
	(envelope-from <linux-gpio+bounces-36626-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 23:09:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7937516245
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 23:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA3C83064672
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 21:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B3A4D2EF5;
	Mon, 11 May 2026 21:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="RRzywsUr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C5E4D2EDC
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 21:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778533622; cv=none; b=OqBd+yLY8fRyMCp0OfirMKZdyk+T7mnDl8JAc/hWVomFnH0uxiqYpPp4K/j46L/rTneV02piuNormMcTi1amIRqQTfR4uiiKiYwvVA/2MrpeR1uZsJbQYGGj7OF+0aSUpSwZEKUUOEGEyf0WDI6CpfDddcphbxezGmWULibLEH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778533622; c=relaxed/simple;
	bh=qx/sM3dtvFhYhSuVNg7aToSQIkLaYC9yAo6jZXZcc7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E5Pxyr9C/MzHxTf8SDjoLhpPz6fstnyvn3w2nvYqmoU6Pky5k7za020LpMAyHkbjEqm5qnoXsdI6Ov+PWTJTQxG0CcZXtUY7SChvNXEnSOXbK8Fal6I3MPDsSf6AEygmESaO0D/qUdRmFe0Beex6DQYvb9HqQWv3HwKxC4NCz70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=RRzywsUr; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8dbbc6c16b2so624808285a.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 14:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778533619; x=1779138419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2e8V3Np5CG1tWfMvqmvU0kbV8SH8kLNhZdDX838QVqI=;
        b=RRzywsUrCMa7hHPnecwvYZDy0zVCdZNRMcHA29t+FErNWwXOC2XhBcwXy3jZJyIeeI
         cBSQprDDHWptdhnVAavi5dGXvT0e7+Cgl8PgMwwoPn32j+EZrczVClC5OpPyFt85nbsX
         CdaojT7xSYFXOR38zEQfBAftd3XYv42KR8PzE+BrNo+CDNxi3xjHnhho3A4hHyZVmpmH
         ROILgNssSvUIuL78u5qtlNLjtgp+aXTKRUiBT6mnG3QmSL58c1+6Fww9A7yK11tKbNoT
         A4J70Sk9dyLK6PG10azNzCyLKnVG1SawBAjBUVxiHXI8b9O0+WUtxI74oyj+qyK/f+SF
         SN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778533619; x=1779138419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2e8V3Np5CG1tWfMvqmvU0kbV8SH8kLNhZdDX838QVqI=;
        b=OCjgF8CYc7y/rQTooqQByDBUYk+XRNmgrKo1ca0kjozgjssCyijkXuhDlGa4UODFxm
         mTMuGu+ek9/XfBIUvG15h7h8D95w8+mMfggFhqwC2tAvh5RXMIWS1HPhohzZHlkCpZFz
         5Sp0K/VChx4YiH+NPnrL/Ls9Th3O/Gcd46N7CenYp72Sc0GrNu06P9XjpMpNGdYWU3ep
         1/RNdIWbS0hO2krrrnBrViJmLCNTLii4VvM+CDsWIemJyn3x4gZPUrUQC2hzGQTmVW4P
         1q2fevga20q4OK6S0/ZG5IIIxaKhm5CRIBzzjNqSsx7w4dEROI4XEcHMAHYsQTAP0TzB
         x9+Q==
X-Gm-Message-State: AOJu0Yys1Z9sJMjvCG7lA9tLas06JZeVAQ+buqadFUsMX3NTF1saGls7
	29pSm7LgRr/0yg1S8ddGkdvc3nqaJCzBP1IxMSJcioCtYgRv8igRSLDvoyJun5qcG4H20sJkNkT
	i1kQN
X-Gm-Gg: Acq92OFfwj/J7ocMISZ+IDdXz6Om0qZGpin4rpx9cA8b+VfCxw7qh7aINSgIx58faZk
	L1PuRZ0jpwN0sJRlgd2t7+bJjb1x2t79sHMJfd1zobzYU81RjIcgkXWzQQMzNbXp5Lo71n6SkVk
	HYJ25rKg/LjjAqHLnNkWTZflwmFKDrL8yvxNWLtpUwHCaHAPzSosCsk8Q/uPjdfQnjKjBkcXkk3
	tBfQOVN5rr0Fug+gwx+DRt7fOSkoPG1Dkw5Cn9aY7MuH/LtVyfUyE60YMHcLHi7XO+SfxG82HM/
	/Q9XJ6kNynjCXTDtrzcMlNPbDpn+Sia6jYzGWkp3W6ni2peoP76C+cq23XdS6q6xS+WZNVrUItH
	okxCKLkYrNbcGbWrh+3DvIrGOKWEdu7vZMsp7+AQdhkgAH6lton9+PIGc7KKaUgw8FhQA8d8TUA
	XKhjgvgMgIIIl6jSm22vvmaSFjgh7X/we5Arq/9Q+hazre+J7nttd6xvSntTFqkD3G12R8S2vak
	A==
X-Received: by 2002:a05:620a:4406:b0:8d7:5735:fe59 with SMTP id af79cd13be357-90cb7bc2545mr183680785a.18.1778533619146;
        Mon, 11 May 2026 14:06:59 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b977274csm1123387985a.6.2026.05.11.14.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 14:06:58 -0700 (PDT)
Message-ID: <7907021b-2506-4c04-b379-0ca2d67e8503@riscstar.com>
Date: Mon, 11 May 2026 16:06:58 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] gpio: regmap: Don't set a fixed direction line
To: Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sashiko <sashiko-bot@kernel.org>
References: <20260511-regmap-gpio-sparse-fixed-dir-v3-0-1429ec453be7@kernel.org>
 <20260511-regmap-gpio-sparse-fixed-dir-v3-2-1429ec453be7@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260511-regmap-gpio-sparse-fixed-dir-v3-2-1429ec453be7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C7937516245
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.56 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36626-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:email,riscstar.com:mid,sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/11/26 2:43 PM, Linus Walleij wrote:
> If a GPIO line has a fixed direction, report an error
> is a consumer anyway tries to set the direction to

s/is/if/

> something other than what it is hardcoded to.
> 
> This didn't happen much before because what we supported was
> all lines input or output and then the implementer would
> probably not specify the direction registers, but with
> sparse fixed direction we can have a mixture so let's take
> this into account.
> 
> As a consequence, since gpio_regmap_set_direction() can
> now fail, alter the semantics in
> gpio_regmap_direction_output() such that we first check
> if we can set the direction to output before we set the
> value and the direction.
> 
> Suggested-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20260507-regmap-gpio-sparse-fixed-dir-v1-1-a2e5855e2701%40kernel.org
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Reviewed-by: Alex Elder <elder@riscstar.com>
Tested-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/gpio/gpio-regmap.c | 37 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index b3b4e77ec147..51b4d69b8740 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -196,6 +196,22 @@ static int gpio_regmap_get_direction(struct gpio_chip *chip,
>   		return GPIO_LINE_DIRECTION_IN;
>   }
>   
> +static int gpio_regmap_try_direction_fixed(struct gpio_regmap *gpio,
> +					   unsigned int offset, bool output)
> +{
> +	if (test_bit(offset, gpio->fixed_direction_output)) {
> +		if (output)
> +			return 0;
> +		else
> +			return -EINVAL;
> +	} else {
> +		if (output)
> +			return -EINVAL;
> +		else
> +			return 0;
> +	}
> +}
> +
>   static int gpio_regmap_set_direction(struct gpio_chip *chip,
>   				     unsigned int offset, bool output)
>   {
> @@ -203,6 +219,13 @@ static int gpio_regmap_set_direction(struct gpio_chip *chip,
>   	unsigned int base, val, reg, mask;
>   	int invert, ret;
>   
> +	/*
> +	 * If the direction is fixed, only accept the fixed
> +	 * direction in this call.
> +	 */
> +	if (gpio_regmap_fixed_direction(gpio, offset))
> +		return gpio_regmap_try_direction_fixed(gpio, offset, output);
> +
>   	if (gpio->reg_dir_out_base) {
>   		base = gpio_regmap_addr(gpio->reg_dir_out_base);
>   		invert = 0;
> @@ -234,6 +257,20 @@ static int gpio_regmap_direction_input(struct gpio_chip *chip,
>   static int gpio_regmap_direction_output(struct gpio_chip *chip,
>   					unsigned int offset, int value)
>   {
> +	struct gpio_regmap *gpio = gpiochip_get_data(chip);
> +	int ret;
> +
> +	/*
> +	 * First check if this is gonna work on a fixed direction line,
> +	 * if it doesn't (i.e. this is a fixed input line), then do not
> +	 * attempt to set the output value either and just bail out.
> +	 */
> +	if (gpio_regmap_fixed_direction(gpio, offset)) {
> +		ret = gpio_regmap_try_direction_fixed(gpio, offset, true);
> +		if (ret)
> +			return ret;
> +	}
> +
>   	gpio_regmap_set(chip, offset, value);
>   
>   	return gpio_regmap_set_direction(chip, offset, true);
> 


