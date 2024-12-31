Return-Path: <linux-gpio+bounces-14381-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ED49FF12C
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Dec 2024 19:14:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AD061880679
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Dec 2024 18:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A2D1AF0DE;
	Tue, 31 Dec 2024 18:13:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA4A5154430;
	Tue, 31 Dec 2024 18:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735668835; cv=none; b=cSfJxx5qdoEYN2JXtP93StOcES/BdV0nl3uNvIQlPWd/A0L5Km2tIu0D3DkBkHOHDassBG2BEl3nfYyQJ4rjUDjJDl/Z4n7RGsBMbnxOl01wayu1T5T2wLZmCv+lTL+IrK0A/nE+K+agHi8JqXeWSKOCsp4OUl7MCFWZ/gfslr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735668835; c=relaxed/simple;
	bh=y9VrbR7s79Lydq9Xalw/yfLXy2Umagf2f14o0mX6fs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XtbGFSTKyEqKxr0HD1Ikol+erJLrDZKeRVE0MHKi9kHlnocgL/7fok28bUwSMusgVeJZaPlyIkokOJkqrC17vdLD3NarChaFhBoUzEEORwLTrSuXzDz5pxXqFtBBr7PomOnqce+G+XN8zYppWp5Y+Pq4k+bY4mwqoqFsapFj2yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39E60143D;
	Tue, 31 Dec 2024 10:14:21 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D21A3F673;
	Tue, 31 Dec 2024 10:13:50 -0800 (PST)
Date: Tue, 31 Dec 2024 18:13:48 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 pinctrl
Message-ID: <Z3Q0XGA9li-nVcum@pluto>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-2-e9a3a5341362@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241225-scmi-fwdevlink-v1-2-e9a3a5341362@nxp.com>

On Wed, Dec 25, 2024 at 04:20:45PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> pinctrl-scmi.c and pinctrl-imx-scmi.c, both use SCMI_PROTOCOL_PINCTRL.
> If both drivers are built in, and the scmi device with name "pinctrl-imx"
> is created earlier, and the fwnode device points to the scmi device,
> non-i.MX platforms will never have the pinctrl supplier ready.
> 
> So bypass setting fwnode for scmi pinctrl devices that non
> compatible with socs.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/firmware/arm_scmi/bus.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 12190d4dabb65484543044b4424fbe3b67245466..87665b09c8ff492953c8300f80ed73eab6cce4fd 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -345,6 +345,11 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
>  	device_unregister(&scmi_dev->dev);
>  }
>  
> +static const char * const scmi_pinctrl_imx_lists[] = {
> +	"fsl,imx95",
> +	NULL
> +};
> +
>  static int
>  __scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *np,
>  		       int protocol, const char *name)
> @@ -353,6 +358,15 @@ __scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *np,
>  	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq"))
>  		return 0;
>  
> +	if (protocol == SCMI_PROTOCOL_PINCTRL) {
> +		if (!strcmp(name, "pinctrl") &&
> +		    of_machine_compatible_match(scmi_pinctrl_imx_lists))
> +			return 0;
> +		if (!strcmp(name, "pinctrl-imx") &&
> +		    !of_machine_compatible_match(scmi_pinctrl_imx_lists))
> +			return 0;
> +	}

...and same here, you could set a flag scmi_dev->avoid_devlink and
just avoid calling device_link_add instead of killing the device_node...

Thanks,
Cristian

