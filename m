Return-Path: <linux-gpio+bounces-6215-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D988BEC63
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 21:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0246286179
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 19:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19AF616E86A;
	Tue,  7 May 2024 19:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IoKT9AEi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9549E16DEB5;
	Tue,  7 May 2024 19:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715109275; cv=none; b=DNetAm61EY1h8T5W+nNyCV3Pjd/qoHOWHwpzPk8Ew9Qn0Gy2/+K4PJ4jjJjXSh0IMIzJL14hJC5ho5IG66WDzwLBFKbZPtimAxTlPMp1OBl/3nraIPHTr6ytLWc1VpqUUumvwTmPctKpYh2xvdUTxYGKRl4KvAdxMlsgRwdr35k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715109275; c=relaxed/simple;
	bh=+eciEdgd6Kxs36Vv3ytpMLPQlDEH4wWJCOJ+bY3oaqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ESz93WdRmNSNHowGLWbceTtIW5AgGV0pZpZSIDmMQr3NkXTK0opokmZieSRt3VeoSNm8o1GdQU62xfsEew1wnMtp+vxWWA/FzUNO7UwnazMYd9hBXQyACEVhG1F7DH8+DThH/L+skwYA9sMfmNdSaC4/JTkPtcN7mwz5qs2rvJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IoKT9AEi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B07C2BBFC;
	Tue,  7 May 2024 19:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715109275;
	bh=+eciEdgd6Kxs36Vv3ytpMLPQlDEH4wWJCOJ+bY3oaqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IoKT9AEi7R1nDq/QuH9bj6M4DsyZlA0+9MBGMCI2N8Y+Hy4XwxgQiApS3Jcq59PUF
	 4zjW0l3yF3UsPSXbFaUKOkrZ88nZjmdu+x3y+HfgDiK5uAepzc5QSWi37IQIUgtj56
	 1Fmb2MTTk4LMb7wXJhzuM6LkhPffVJuSQBL3t5oYA1W6UdaLis3ECdDd9Qc2sGCqJR
	 NmMbw04y9Z5I41yYbtETnFP8VQ7F1XzbHoPjPRDV/zCBzS2pvjV6FtrC5ETdiZ3J/L
	 l6XaciQ/8DYEi97qNw9B69u1+4OOlr96x3Uv5tUIpqIHwsKtUwNXqM8KxPZD0oVc5F
	 lnBJXapdt4ZOA==
Date: Tue, 7 May 2024 14:14:33 -0500
From: Rob Herring <robh@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
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
Subject: Re: [PATCH v4 2/3] pinctrl: scmi: add blocklist
Message-ID: <20240507191433.GA908134-robh@kernel.org>
References: <20240505-pinctrl-scmi-oem-v3-v4-0-7c99f989e9ba@nxp.com>
 <20240505-pinctrl-scmi-oem-v3-v4-2-7c99f989e9ba@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240505-pinctrl-scmi-oem-v3-v4-2-7c99f989e9ba@nxp.com>

On Sun, May 05, 2024 at 11:47:18AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX95 will have its own pinctrl scmi driver, so need block
> pinctrl-scmi driver for i.MX95, otherwise there will be two pinctrl
> devices for a single scmi protocol@19.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pinctrl/pinctrl-scmi.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
> index 036bc1e3fc6c..331ca20ac68b 100644
> --- a/drivers/pinctrl/pinctrl-scmi.c
> +++ b/drivers/pinctrl/pinctrl-scmi.c
> @@ -11,6 +11,7 @@
>  #include <linux/errno.h>
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
> +#include <linux/of.h>
>  #include <linux/scmi_protocol.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> @@ -504,6 +505,11 @@ static int pinctrl_scmi_get_pins(struct scmi_pinctrl *pmx,
>  	return 0;
>  }
>  
> +static const struct of_device_id scmi_pinctrl_blocklist[] = {
> +	{ .compatible = "fsl,imx95", },
> +	{ }
> +};
> +
>  static int scmi_pinctrl_probe(struct scmi_device *sdev)
>  {
>  	int ret;
> @@ -511,10 +517,14 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
>  	struct scmi_pinctrl *pmx;
>  	const struct scmi_handle *handle;
>  	struct scmi_protocol_handle *ph;
> +	struct device_node *np __free(device_node) = of_find_node_by_path("/");
>  
>  	if (!sdev->handle)
>  		return -EINVAL;
>  
> +	if (of_match_node(scmi_pinctrl_blocklist, np))
> +		return -ENODEV;

Use of_machine_compatible_match() instead.

> +
>  	handle = sdev->handle;
>  
>  	pinctrl_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PINCTRL, &ph);
> 
> -- 
> 2.37.1
> 

