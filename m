Return-Path: <linux-gpio+bounces-30742-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A0396D3AE89
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 16:12:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 85B1A303D6BE
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 15:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C662D38A287;
	Mon, 19 Jan 2026 15:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LKvQ4YyU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEB73876D6;
	Mon, 19 Jan 2026 15:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768835426; cv=none; b=iNjRmlcKzlg7KDN69m0s+tRoLCZZt3KhEes5OvBX7HXEroisAlZSbYA9PY/JXnoUnuHUTAfNTjWx9oamZsdd2DMaNKu1hKytkpod6rlwhDVMA0vVAAnxtT2Jg/ivmygfOKwotDuhQ6Jo8GMuk0dfhOZB/jCwKzcNAVT0zh/50zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768835426; c=relaxed/simple;
	bh=xXZbxSZlonw4Ew/6ct2KJs2ARO//Or9SzkD37nESUpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=umwU5AXbDxV/+2Aewb5xn6aVpdhuvZSMDjLdyDPGILWz3wOej3caVantrTlm861PlVJom6tQTjfgw0c/hiHj89gEHuGEK4Pn7Kzqa5EEK+nnHEAALA+DZKC5vVQ2o6w8Ai4EsBu1JjdJmj21eJsO8qEqNQJm3YDDoehteMJQLs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LKvQ4YyU; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7B6E51A2860;
	Mon, 19 Jan 2026 15:10:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 47D8760731;
	Mon, 19 Jan 2026 15:10:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F0D2010B6B105;
	Mon, 19 Jan 2026 16:10:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768835421; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IKmEBqxXC0eXvuOxUuZp0J0zMWNOx/SfPht47UrGDuQ=;
	b=LKvQ4YyUWDrWQjpNq5ajlD3aPCGC+Tfg2t9NSM3F4Y0nQZHCWqUEABPnRRLtBU0h+16aVU
	Mg6DUe1U/20WfKfVh62ywX9PnzCcmpeXczmR+QT8sPPs2cF1toiIDXIGa6/HxSm5wbahvR
	Wp0NFgpnN4hGAoDrgTLD5D4Ao+72H6ozAS62xnEkhbgRa8TqVE5ogDy9Zh7vV3etr1YF+7
	bzm0qVOo3rloL09B92Ny4E0WkLGF/IClyVPwyYEVQLHD32c3g0a5vOuEOI/tpg7li+PFl6
	1Qmn7wX4dUAX+8nep0srimCWbZf6WOfAiqxNZaHuwpqJya8WBKuWsSbiSxGDTg==
Date: Mon, 19 Jan 2026 16:10:15 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jens Emil Schulz =?iso-8859-1?Q?=D8stergaard?= <jensemil.schulzostergaard@microchip.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] pinctrl: ocelot: Update alt mode reg addr calculation
Message-ID: <2026011915101544cfdc14@mail.local>
References: <20260119-pinctrl_ocelot_extend_support_for_lan9645x-v1-0-1228155ed0ee@microchip.com>
 <20260119-pinctrl_ocelot_extend_support_for_lan9645x-v1-2-1228155ed0ee@microchip.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260119-pinctrl_ocelot_extend_support_for_lan9645x-v1-2-1228155ed0ee@microchip.com>
X-Last-TLS-Session-Version: TLSv1.3

On 19/01/2026 16:06:10+0100, Jens Emil Schulz Østergaard wrote:
> Lan9645x is the first chip supported by this driver where the pin stride
> is different from the alt mode stride. With 51 pins and up to 7 alt
> modes, we have stride = 2 and alt_mode_stride = 3.
> 
> The current REG_ALT macro has the implicit assumption that these numbers
> are equal, so it does not work for lan9645x.
> 
> The pin stride is the 'stride' variable in the driver. It is the size
> of certain register groups which depends on the number of pins supported
> by the device. Generally we have stride = DIV_ROUND_UP(npins, 32). E.g:
> 
> GPIO_OUT_SET0
> GPIO_OUT_SET1
> ...
> GPIO_OUT_SETn
> 
> The alt mode registers are further replicated by the number of bits
> necessary to represent the alt mode. For instance if we need 3 bits to
> represent the alt mode:
> 
> GPIO_ALT0[0-2]
> GPIO_ALT1[0-2]
> 
> To set alt mode 3 on pin 12, it is necessary to perform writes
> 
> GPIO_ALT0[0] |= BIT(12)
> GPIO_ALT0[1] |= BIT(12)
> GPIO_ALT0[2] &= ~BIT(12)
> 
> The stride and alt mode stride are used by the REG_ALT macro to
> calculate the alt mode register address for a given pin.
> 
> This adds the option to specify n_alt_modes, which is used to set
> info->altm_stride. The default value is info->stride, to make sure
> existing devices are unaffected by this change.
> 
> Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
> Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
> Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/pinctrl/pinctrl-ocelot.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
> index 70da3f37567a..4db0439ca8c4 100644
> --- a/drivers/pinctrl/pinctrl-ocelot.c
> +++ b/drivers/pinctrl/pinctrl-ocelot.c
> @@ -358,12 +358,14 @@ struct ocelot_pinctrl {
>  	const struct ocelot_pincfg_data *pincfg_data;
>  	struct ocelot_pmx_func func[FUNC_MAX];
>  	u8 stride;
> +	u8 altm_stride;
>  	struct workqueue_struct *wq;
>  };
>  
>  struct ocelot_match_data {
>  	struct pinctrl_desc desc;
>  	struct ocelot_pincfg_data pincfg_data;
> +	unsigned int n_alt_modes;
>  };
>  
>  struct ocelot_irq_work {
> @@ -1362,7 +1364,7 @@ static int ocelot_pin_function_idx(struct ocelot_pinctrl *info,
>  	return -1;
>  }
>  
> -#define REG_ALT(msb, info, p) (OCELOT_GPIO_ALT0 * (info)->stride + 4 * ((msb) + ((info)->stride * ((p) / 32))))
> +#define REG_ALT(msb, info, p) (OCELOT_GPIO_ALT0 * (info)->stride + 4 * ((msb) + ((info)->altm_stride * ((p) / 32))))
>  
>  static int ocelot_pinmux_set_mux(struct pinctrl_dev *pctldev,
>  				 unsigned int selector, unsigned int group)
> @@ -2294,6 +2296,9 @@ static int ocelot_pinctrl_probe(struct platform_device *pdev)
>  	reset_control_reset(reset);
>  
>  	info->stride = 1 + (info->desc->npins - 1) / 32;
> +	info->altm_stride = info->stride;
> +	if (data->n_alt_modes)
> +		info->altm_stride = fls(data->n_alt_modes);
>  
>  	regmap_config.max_register = OCELOT_GPIO_SD_MAP * info->stride + 15 * 4;
>  
> 
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

