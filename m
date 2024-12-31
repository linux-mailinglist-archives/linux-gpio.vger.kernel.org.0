Return-Path: <linux-gpio+bounces-14383-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F389FF131
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Dec 2024 19:18:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFB931882CDF
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Dec 2024 18:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16AC71AF4EF;
	Tue, 31 Dec 2024 18:18:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F69D29CF0;
	Tue, 31 Dec 2024 18:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735669107; cv=none; b=UgL/yAH8krSXaxu0waxASzX/HMEdwipfKJQoi/nrrq2ZRTgM4TeS68snD55PwtZSmdP/uNdN5gA1EFXNRiHyxkOdRQQQdUHldb9OeAhUozPppZZqYBZzURhMCVdPOcj1H5Kvpxk3xWQxuAlfL7/56aHO+qH7m60iKH3/tNvzcqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735669107; c=relaxed/simple;
	bh=CQkKSodBDO9vyC379yhlTTh/PnXip+EGEuEyYFF36ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OI5LfQAAXE4voJrgHvmIQO6Hi8jKYtwNtjur+U9QJWxBkXKrAVK8VAUUCYEoTSR0NgStwmEzO57F3lNmrLT5ZNVhg4LNWVQfLTRmuXw7CLCU/hxMocpcbq4smnA2guOwH5DZwhE8h8vPnbUsMDl7OSKd56Sn3aTLZVCujFUNjcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27219143D;
	Tue, 31 Dec 2024 10:18:54 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C8263F673;
	Tue, 31 Dec 2024 10:18:23 -0800 (PST)
Date: Tue, 31 Dec 2024 18:18:20 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
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
Subject: Re: [PATCH 3/4] pinctrl: scmi: Check fwnode instead of machine
 compatible
Message-ID: <Z3Q1bKMynWGfUkPr@pluto>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-3-e9a3a5341362@nxp.com>
 <20241227153020.hl6lysid75yquca7@bogus>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227153020.hl6lysid75yquca7@bogus>

On Fri, Dec 27, 2024 at 03:30:20PM +0000, Sudeep Holla wrote:
> On Wed, Dec 25, 2024 at 04:20:46PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> > 
> > For the platform that not compatible with scmi pinctrl device, the
> > fwnode will not be set, so checking fwnode will make code simpler
> > and easy to maintain.
> > 
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/pinctrl/pinctrl-scmi.c | 7 +------
> >  1 file changed, 1 insertion(+), 6 deletions(-)
> > 
> > diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
> > index df4bbcd7d1d59ac2c8ddc320dc10d702ad1ed5b2..aade6df77dbb2c391741e77c0aac3f029991e4bb 100644
> > --- a/drivers/pinctrl/pinctrl-scmi.c
> > +++ b/drivers/pinctrl/pinctrl-scmi.c
> > @@ -505,11 +505,6 @@ static int pinctrl_scmi_get_pins(struct scmi_pinctrl *pmx,
> >  	return 0;
> >  }
> >  
> > -static const char * const scmi_pinctrl_blocklist[] = {
> > -	"fsl,imx95",
> > -	NULL
> > -};
> > -
> >  static int scmi_pinctrl_probe(struct scmi_device *sdev)
> >  {
> >  	int ret;
> > @@ -521,7 +516,7 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
> >  	if (!sdev->handle)
> >  		return -EINVAL;
> >  
> > -	if (of_machine_compatible_match(scmi_pinctrl_blocklist))
> > +	if (!dev->fwnode)
> 
> I would prefer to see the blocklist to be explicit here rather than
> implicitly hiding it away with this change set.

Using a flag to inhibit device_link_add as said early in the series this
could be dropped and kept as is, I suppose.

Thanks,
Cristian


