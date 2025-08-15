Return-Path: <linux-gpio+bounces-24404-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F02B2794B
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 08:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 591D162736B
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 06:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73582BE62A;
	Fri, 15 Aug 2025 06:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PyR+u99D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7F5319845;
	Fri, 15 Aug 2025 06:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755239832; cv=none; b=EM4356WN0LVsZHjJyEcYayIJyrim7sZmH8rp+CSSatEesj5RPfN7XvEsALcuPUjQL2+MJbUEpoVZLNWdW9+ZEE8ifIxYp6C4dUEqxppe/cSW761LJ0MPhdGRlag+zvehppvDKkq67qL7hfLnKTO7vrg6H86nA/s83VTVVrSDxFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755239832; c=relaxed/simple;
	bh=tra7rydiILTcSEb0lcmhsy/l1DqMq2O1S4BfXAk8GfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uUhredvG6xugl9YgWRl8eiwvDv1ilFeSuIljyBRHaAmv8BfqoHz2uuunt4B1XlMi4S0bep31+YFImyMbvOA+RFrItGbSyoCeDPOYgqb21MXk8874hLOBqP+kbcv0VvbAmWy3Q1eTGqzFlQp4WAs/5coy9GSTV7hia0jS5X+taMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PyR+u99D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4556EC4CEEB;
	Fri, 15 Aug 2025 06:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755239831;
	bh=tra7rydiILTcSEb0lcmhsy/l1DqMq2O1S4BfXAk8GfM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PyR+u99DIpsbAwmgoZioxJE5kxVgtixCUFqDQeoUevZ+0SY34EUDxER/2uGlmpYME
	 d/uiGR30L5dwI6u4qSdrygdM+QnmgzkXd1WsXRmMd6fR7QZutUaDXWakFaNaHcRZTr
	 1WqVoAM3riy0pw4j9FJe+s2qoxGLVveQWjjLUFJK5h+OcCcNudfla0K5yk9VZr+J6d
	 D3IGS9+Dt4kHCaBH4iiIa2zPx1fL/t621lYhikG7kUUiqSSSKyhjhLth5M0f+jmcKT
	 wGBHkMC6pF2Z/TykJ7moSVSAMPECGi18WMAg6SXu6vFqGymkWAdUQqO33j7zARzLOX
	 snc2NOEsRwOUg==
Message-ID: <5ee0656b-136b-480f-9555-26ccdbff3eda@kernel.org>
Date: Fri, 15 Aug 2025 07:37:06 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] ASoC: codecs: wsa883x: Handle shared reset GPIO
 for WSA883x speakers
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
 kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250806181818.2817356-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250806181818.2817356-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20250806181818.2817356-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 8/6/25 7:18 PM, Mohammad Rafi Shaik wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> On some Qualcomm platforms such as QCS6490-RB3Gen2, the multiple
> WSA8830/WSA8835 speaker amplifiers share a common reset (shutdown) GPIO.
> 
> To handle such scenario, use the reset controller framework and its
> "reset-gpio" driver to handle such case. This allows proper handling
> of all WSA883x speaker amplifiers on QCS6490-RB3Gen2 board.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  sound/soc/codecs/wsa883x.c | 57 +++++++++++++++++++++++++++++++++-----
>  1 file changed, 50 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
> index 188363b03b93..ec7a55d88576 100644
> --- a/sound/soc/codecs/wsa883x.c
> +++ b/sound/soc/codecs/wsa883x.c
> @@ -14,6 +14,7 @@
>  #include <linux/printk.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
>  #include <linux/slab.h>
>  #include <linux/soundwire/sdw.h>
>  #include <linux/soundwire/sdw_registers.h>
> @@ -468,6 +469,7 @@ struct wsa883x_priv {
>  	struct sdw_stream_runtime *sruntime;
>  	struct sdw_port_config port_config[WSA883X_MAX_SWR_PORTS];
>  	struct gpio_desc *sd_n;
> +	struct reset_control *sd_reset;
>  	bool port_prepared[WSA883X_MAX_SWR_PORTS];
>  	bool port_enable[WSA883X_MAX_SWR_PORTS];
>  	int active_ports;
> @@ -1546,6 +1548,46 @@ static const struct hwmon_chip_info wsa883x_hwmon_chip_info = {
>  	.info	= wsa883x_hwmon_info,
>  };
>  
> +static void wsa883x_reset_assert(void *data)
> +{
> +	struct wsa883x_priv *wsa883x = data;
> +
> +	if (wsa883x->sd_reset)
> +		reset_control_assert(wsa883x->sd_reset);
> +	else
> +		gpiod_direction_output(wsa883x->sd_n, 1);
> +}
> +
> +static void wsa883x_reset_deassert(struct wsa883x_priv *wsa883x)
> +{
> +	if (wsa883x->sd_reset)
> +		reset_control_deassert(wsa883x->sd_reset);
> +	else
> +		gpiod_direction_output(wsa883x->sd_n, 0);
> +}
> +
> +static int wsa883x_get_reset(struct device *dev, struct wsa883x_priv *wsa883x)
> +{
> +	wsa883x->sd_reset = devm_reset_control_get_optional_shared_deasserted(dev, NULL);
why deasserted ? we are already doing wsa883x_reset_deassert(wsa883x)
just after calling this.

> +	if (IS_ERR(wsa883x->sd_reset))
> +		return dev_err_probe(dev, PTR_ERR(wsa883x->sd_reset),
> +				     "Failed to get reset\n");
> +	/*
> +	 * if sd_reset: NULL, so use the backwards compatible way for powerdown-gpios,
> +	 * which does not handle sharing GPIO properly.
> +	 */
> +	if (!wsa883x->sd_reset) {
> +		wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
> +							GPIOD_FLAGS_BIT_NONEXCLUSIVE |
> +							GPIOD_OUT_HIGH);
> +		if (IS_ERR(wsa883x->sd_n))
> +			return dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),
> +					     "Shutdown Control GPIO not found\n");
> +	}
> +
> +	return 0;
> +}
> +
>  static int wsa883x_probe(struct sdw_slave *pdev,
>  			 const struct sdw_device_id *id)
>  {
> @@ -1566,11 +1608,9 @@ static int wsa883x_probe(struct sdw_slave *pdev,
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to enable vdd regulator\n");
>  
> -	wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
> -						GPIOD_FLAGS_BIT_NONEXCLUSIVE | GPIOD_OUT_HIGH);
> -	if (IS_ERR(wsa883x->sd_n)) {
> -		ret = dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),
> -				    "Shutdown Control GPIO not found\n");
> +	ret = wsa883x_get_reset(dev, wsa883x);
> +	if (ret) {
> +		dev_dbg(dev, "Failed to get reset powerdown GPIO: %d\n", ret);
this is redundant we already have failure messages from wsa883x_get_reset().


--srini
>  		goto err;
>  	}
>  
> @@ -1595,11 +1635,14 @@ static int wsa883x_probe(struct sdw_slave *pdev,
>  	pdev->prop.simple_clk_stop_capable = true;
>  	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
>  	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
> -	gpiod_direction_output(wsa883x->sd_n, 0);
> +
> +	wsa883x_reset_deassert(wsa883x);
> +	ret = devm_add_action_or_reset(dev, wsa883x_reset_assert, wsa883x);
> +	if (ret)
> +		return ret;
>  
>  	wsa883x->regmap = devm_regmap_init_sdw(pdev, &wsa883x_regmap_config);
>  	if (IS_ERR(wsa883x->regmap)) {
> -		gpiod_direction_output(wsa883x->sd_n, 1);
>  		ret = dev_err_probe(dev, PTR_ERR(wsa883x->regmap),
>  				    "regmap_init failed\n");
>  		goto err;


