Return-Path: <linux-gpio+bounces-23577-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8134B0BEB7
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 10:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23B263B5798
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 08:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E3F286D63;
	Mon, 21 Jul 2025 08:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aucUChu8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6369327FB35;
	Mon, 21 Jul 2025 08:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753086204; cv=none; b=SlYDzkvHGiltGnKpSO1pUbPoza35QF7lqRK/S/0Rri5WI2A4A4z5sGQZAOKl21F9DfO2NhXiYE5+9qkEvVsgjSZz6BjQNCEoMr64sTVQOlXAgvfc9PtrxjL+5sBpDW2qjPeiaFR0PIIXPTFu+xa1CDy5TyOMHu08dxjjVBOxbR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753086204; c=relaxed/simple;
	bh=1Uz4iGqA/+cc+qW2DgSX3la5rsy0xMSqJoDWqrQXkP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NsYIL1oX5GPj0Ub3i+afNSKLCdw969m04qelRmJKlStOVS1GWxd+kpYQcV7ioi819Br+6777BJd2IBZqpP2RnjsH3zMZkvJgsQMbwqrO7z2rQSwViakSzbO7Gx0Kd2VmUPJ/suECq87zfdT2d/4L5lBeL96GXoFd4Q5XG5MEVKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aucUChu8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E90AC4CEED;
	Mon, 21 Jul 2025 08:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753086203;
	bh=1Uz4iGqA/+cc+qW2DgSX3la5rsy0xMSqJoDWqrQXkP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aucUChu8+a3Fdv69Ce8ZRQvJA60QGCJAPFxlYq084F/dFR8gXiyMfaNEIuxE+Ak0K
	 nIVz4me8S6r/4cqskJSpWB+FQuLvlWZvKIZts49jvw/ng6HH9rhzo0NJ/ZbDhD0C8k
	 bUl32TedXq+1Qkmgecshn9FhiEMsa/TShz9hI2qSLJgTtvydpSu09LF4zfVvKkeJrj
	 /HkgMiU6pSTiTEXbt3E5a2MTEguQ6F4OGatAF/KvdtHLWA000DkBbjrNFGFuv0IgyI
	 yJh2YRmgp1UI5+khOutgfXUeNjzJILIci1+Pj3zP1cbalEyTyRDQZxjPbdil1mgzA/
	 /RDhAvq+yvTNA==
Date: Mon, 21 Jul 2025 10:23:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com
Subject: Re: [PATCH v2 2/2] ASoC: codecs: wsa883x: Handle shared reset GPIO
 for WSA883x speakers
Message-ID: <20250721-hairy-aardwolf-of-enterprise-bbc99f@kuoka>
References: <20250718104628.3732645-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250718104628.3732645-3-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250718104628.3732645-3-mohammad.rafi.shaik@oss.qualcomm.com>

On Fri, Jul 18, 2025 at 04:16:28PM +0530, Mohammad Rafi Shaik wrote:
> On some Qualcomm platforms such as QCS6490-RB3Gen2, the multiple
> WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
> To handle such cases, use the reset controller framework along
> with the "reset-gpio" driver.
> 
> Register devm action to safely disable the regulator on device removal
> to prevents a potential release warning from _regulator_put().

It is not possible to remove the device - suppress bind attrs. How did
you trigger that?

> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/codecs/wsa883x.c | 93 +++++++++++++++++++++++++++++---------
>  1 file changed, 71 insertions(+), 22 deletions(-)

...

>  static int wsa883x_probe(struct sdw_slave *pdev,
>  			 const struct sdw_device_id *id)
>  {
> @@ -1566,13 +1615,18 @@ static int wsa883x_probe(struct sdw_slave *pdev,
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to enable vdd regulator\n");
>  
> -	wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
> -						GPIOD_FLAGS_BIT_NONEXCLUSIVE | GPIOD_OUT_HIGH);
> -	if (IS_ERR(wsa883x->sd_n)) {
> -		ret = dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),
> -				    "Shutdown Control GPIO not found\n");
> -		goto err;
> -	}
> +	ret = wsa883x_get_reset(dev, wsa883x);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Register devm action to safely disable the regulator on device removal.
> +	 * This prevents a potential release warning from _regulator_put().
> +	 */
> +	ret = devm_add_action_or_reset(dev, wsa883x_regulator_disable,
> +				       wsa883x);

If removal is possible (but then explain in commit msg how), then this
should be separate commit with fixes and cc-stable, because you are
fixing actual bug - lack of regulator release on unbind.

Best regards,
Krzysztof


