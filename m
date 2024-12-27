Return-Path: <linux-gpio+bounces-14308-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7E99FD599
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 16:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82F5D3A126B
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 15:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC8C1F5433;
	Fri, 27 Dec 2024 15:30:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CAD627470;
	Fri, 27 Dec 2024 15:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735313444; cv=none; b=kCI8aNGspszv/IDCALJbhQCWeZ/dj8bIW1SHlXicgUJWeu3stDDRjjVGAQrGit0YFcIA9g1W6Q5CetuJegAPYjtr9LC0QF3AMYmPOuL1X1z+ri0adIAzIqYDEbuRl50xR8yedwN/yo0KKysbH3wwY0T3h9nEjTRAwI6V/oacpqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735313444; c=relaxed/simple;
	bh=/8hBdE55DZD3vLmo/lyPZX8RqUjMPoV5jOOztNg3cv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C24w3gFwyXWOLdYOyvYdFky1tNVpJ9XdX1w7nuznyT2la6bEBejKPas2Riq+pRn3rQcKt99oKHC9N7WIcB+HSAMBbT5u5BbulHewzSIofe3kT83m9YBOuVKrjFAHL/bHQeVNcsVo7yAPBUgFz2YbTUsMTRX2bYQn38LmJHsdE1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E406D1E2F;
	Fri, 27 Dec 2024 07:31:09 -0800 (PST)
Received: from bogus (unknown [10.57.92.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E902B3F673;
	Fri, 27 Dec 2024 07:30:37 -0800 (PST)
Date: Fri, 27 Dec 2024 15:30:20 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 3/4] pinctrl: scmi: Check fwnode instead of machine
 compatible
Message-ID: <20241227153020.hl6lysid75yquca7@bogus>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-3-e9a3a5341362@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241225-scmi-fwdevlink-v1-3-e9a3a5341362@nxp.com>

On Wed, Dec 25, 2024 at 04:20:46PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> For the platform that not compatible with scmi pinctrl device, the
> fwnode will not be set, so checking fwnode will make code simpler
> and easy to maintain.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pinctrl/pinctrl-scmi.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
> index df4bbcd7d1d59ac2c8ddc320dc10d702ad1ed5b2..aade6df77dbb2c391741e77c0aac3f029991e4bb 100644
> --- a/drivers/pinctrl/pinctrl-scmi.c
> +++ b/drivers/pinctrl/pinctrl-scmi.c
> @@ -505,11 +505,6 @@ static int pinctrl_scmi_get_pins(struct scmi_pinctrl *pmx,
>  	return 0;
>  }
>  
> -static const char * const scmi_pinctrl_blocklist[] = {
> -	"fsl,imx95",
> -	NULL
> -};
> -
>  static int scmi_pinctrl_probe(struct scmi_device *sdev)
>  {
>  	int ret;
> @@ -521,7 +516,7 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
>  	if (!sdev->handle)
>  		return -EINVAL;
>  
> -	if (of_machine_compatible_match(scmi_pinctrl_blocklist))
> +	if (!dev->fwnode)

I would prefer to see the blocklist to be explicit here rather than
implicitly hiding it away with this change set.

-- 
Regards,
Sudeep

