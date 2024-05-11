Return-Path: <linux-gpio+bounces-6319-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0168C3371
	for <lists+linux-gpio@lfdr.de>; Sat, 11 May 2024 21:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 435FA1F21770
	for <lists+linux-gpio@lfdr.de>; Sat, 11 May 2024 19:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA8F1B974;
	Sat, 11 May 2024 19:29:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876BD1C6B7
	for <linux-gpio@vger.kernel.org>; Sat, 11 May 2024 19:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715455773; cv=none; b=HvplnPLUTWIrNch+1/cSVLih7aQWh3OvfLRCJCUxAGrXegWgZ/7W35ADcLlG3poJKwXMUWqlKqhIdzCb98wxust54bsmBr+cKoKp6E7i+rfxgTGtGv5/ZSyrFLhL0mXX73aHyEktvdZ3t/rjl2AqXGXkHBb/s75jQivgwwnI+ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715455773; c=relaxed/simple;
	bh=4lsE2Se8vXaMMEIsPzHa9RIlcRpOCsASJLMGgVYbVfc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUbNvZ1oz+Z01r8gKEXjHYemeMxnqp/avPNDA5KuERuuAeyj459HjKkbPZ19aYqNlgQvrEq3kn32Z0mHfSJBY2umaXEfECyhVaVghg6TeKaIhvrLsnQyI40X8PMWa6d9J6eW5Usobc+3m0wWtlH7Wegquy9dzy606j0VSeCQlPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-208.elisa-laajakaista.fi [88.113.25.208])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id c822eb82-0fcc-11ef-abf4-005056bdd08f;
	Sat, 11 May 2024 22:29:28 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 11 May 2024 22:29:27 +0300
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 3/3] pinctrl: imx: support SCMI pinctrl protocol for
 i.MX95
Message-ID: <Zj_HFxHMV57EXfYm@surfacebook.localdomain>
References: <20240505-pinctrl-scmi-oem-v3-v4-0-7c99f989e9ba@nxp.com>
 <20240505-pinctrl-scmi-oem-v3-v4-3-7c99f989e9ba@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240505-pinctrl-scmi-oem-v3-v4-3-7c99f989e9ba@nxp.com>

Sun, May 05, 2024 at 11:47:19AM +0800, Peng Fan (OSS) kirjoitti:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The generic pinctrl-scmi.c driver could not be used for i.MX95 because
> i.MX95 SCMI firmware not supports functions, groups or generic
> 'Pin Configuration Type and Enumerations' listed in SCMI Specification.
> 
> i.MX95 System Control Management Interface(SCMI) firmware only supports
> below pin configuration types which are OEM specific types:
>     192: PIN MUX
>     193: PIN CONF
>     194: DAISY ID
>     195: DAISY VAL
> 
> To support Linux generic pinctrl properties(pinmux, bias-pull-[up,
> down], and etc), need extract the value from the property and map
> them to the format that i.MX95 SCMI pinctrl protocol understands,
> so add this driver.

...

> +struct imx_pin_group {
> +	struct pingroup data;
> +};

I don't see the necessity of having this wrapper structure. Can't you simply
use struct pingroup directly?

...

> +static int scmi_pinctrl_imx_probe(struct scmi_device *sdev)
> +{
> +	int ret;
> +	struct device *dev = &sdev->dev;
> +	struct scmi_pinctrl_imx *pmx;
> +	const struct scmi_handle *handle;
> +	struct scmi_protocol_handle *ph;
> +	struct device_node *np __free(device_node) = of_find_node_by_path("/");
> +	const struct scmi_pinctrl_proto_ops *pinctrl_ops;

> +	if (!sdev->handle)
> +		return -EINVAL;

When this conditional can be true?

> +	if (!of_match_node(scmi_pinctrl_imx_allowlist, np))
> +		return -ENODEV;

> +	handle = sdev->handle;

It's even better to assign first and then check if the above check is needed at all.

> +	pinctrl_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PINCTRL, &ph);
> +	if (IS_ERR(pinctrl_ops))
> +		return PTR_ERR(pinctrl_ops);
> +
> +	pmx = devm_kzalloc(dev, sizeof(*pmx), GFP_KERNEL);
> +	if (!pmx)
> +		return -ENOMEM;
> +
> +	pmx->ph = ph;
> +	pmx->ops = pinctrl_ops;
> +
> +	pmx->dev = dev;
> +	pmx->pctl_desc.name = DRV_NAME;
> +	pmx->pctl_desc.owner = THIS_MODULE;
> +	pmx->pctl_desc.pctlops = &pinctrl_scmi_imx_pinctrl_ops;
> +	pmx->pctl_desc.pmxops = &pinctrl_scmi_imx_pinmux_ops;
> +	pmx->pctl_desc.confops = &pinctrl_scmi_imx_pinconf_ops;
> +
> +	ret = scmi_pinctrl_imx_get_pins(pmx, &pmx->pctl_desc);
> +	if (ret)
> +		return ret;
> +
> +	ret = scmi_pinctrl_imx_probe_dt(sdev, pmx);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_pinctrl_register_and_init(dev, &pmx->pctl_desc, pmx,
> +					     &pmx->pctldev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register pinctrl\n");
> +
> +	return pinctrl_enable(pmx->pctldev);
> +}

-- 
With Best Regards,
Andy Shevchenko



