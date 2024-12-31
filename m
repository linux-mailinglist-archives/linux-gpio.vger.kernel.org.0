Return-Path: <linux-gpio+bounces-14379-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C33E29FF126
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Dec 2024 19:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C48241883544
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Dec 2024 18:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6AE1ACEBF;
	Tue, 31 Dec 2024 18:08:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06222AD31;
	Tue, 31 Dec 2024 18:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735668487; cv=none; b=TP6Ib9MmD7lX8d9yXzL8J8zO4M2l74EbUyjlOV1sSD47JA0xcjUfo0FDjC9COJ+hcHjV4JlXFSg/g1983mZV/KPajCHRKIehHATqPpmGIlWk0c/MKiaJwlXfW7LackawfcmwPuMDEI8+sbaJJaUV0wojkgOEUpAYzeA2Xb1rl6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735668487; c=relaxed/simple;
	bh=asG8QUsAcpivCII00hEuLDTjwAoR6SlLqH18zpcB2v0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tuz4W27ULLtSrBQODhbhTZAxduQR0Aokqn/fj0/7c6ln/U+1JqaNqvAOn16F21TbucQV51DJHUtptyIBt0KhCvvUOKFkcZVou/Ga/9WSSqkDclyGEFquRYxfpdVB2wdSrEi0m+B5C4kOCp8qN+DiqJ7WTrylM9kgP1hqnkdfCo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 307581063;
	Tue, 31 Dec 2024 10:08:32 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80B523F673;
	Tue, 31 Dec 2024 10:08:01 -0800 (PST)
Date: Tue, 31 Dec 2024 18:07:53 +0000
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
Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <Z3Qy-br-wVCLpo7Q@pluto>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-1-e9a3a5341362@nxp.com>
 <20241227151306.jh2oabc64xd54dms@bogus>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227151306.jh2oabc64xd54dms@bogus>

On Fri, Dec 27, 2024 at 03:13:06PM +0000, Sudeep Holla wrote:
> On Wed, Dec 25, 2024 at 04:20:44PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Two drivers scmi_cpufreq.c and scmi_perf_domain.c both use
> > SCMI_PROTCOL_PERF protocol, but with different name, so two scmi devices
> > will be created. But the fwnode->dev could only point to one device.
> >
> > If scmi cpufreq device created earlier, the fwnode->dev will point to
> > the scmi cpufreq device. Then the fw_devlink will link performance
> > domain user device(consumer) to the scmi cpufreq device(supplier).
> > But actually the performance domain user device, such as GPU, should use
> > the scmi perf device as supplier. Also if 'cpufreq.off=1' in bootargs,
> > the GPU driver will defer probe always, because of the scmi cpufreq
> > device not ready.
> >
> > Because for cpufreq, no need use fw_devlink. So bypass setting fwnode
> > for scmi cpufreq device.
> >

Hi,

> > Fixes: 96da4a99ce50 ("firmware: arm_scmi: Set fwnode for the scmi_device")
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/firmware/arm_scmi/bus.c | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> > index 157172a5f2b577ce4f04425f967f548230c1ebed..12190d4dabb65484543044b4424fbe3b67245466 100644
> > --- a/drivers/firmware/arm_scmi/bus.c
> > +++ b/drivers/firmware/arm_scmi/bus.c
> > @@ -345,6 +345,19 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
> >  	device_unregister(&scmi_dev->dev);
> >  }
> >
> > +static int
> > +__scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *np,
> > +		       int protocol, const char *name)
> > +{
> > +	/* cpufreq device does not need to be supplier from devlink perspective */
> > +	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq"))
> > +		return 0;
> >
> 
> This is just a assumption based on current implementation. What happens
> if this is needed. Infact, it is used in the current implementation to
> create a dummy clock provider, so for sure with this change that will
> break IMO.

I agree with Sudeep on this: if you want to exclude some SCMI device from the
fw_devlink handling to address the issues with multiple SCMI devices
created on the same protocol nodes, cant we just flag this requirement here and
avoid to call device_link_add in driver:scmi_set_handle(), instead of
killing completely any possibility of referencing phandles (and having
device_link_add failing as a consequence of having a NULL supplier)

i.e. something like:

@bus.c
------
static int
__scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *np,
		       int protocol, const char *name)
{
	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq"))
		scmi_dev->avoid_devlink = true;

	device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
	....


and @driver.c
-------------

static void scmi_set_handle(struct scmi_device *scmi_dev)
{
	scmi_dev->handle = scmi_handle_get(&scmi_dev->dev);
	if (scmi_dev->handle && !scmi_dev->avoid_devlink)
		scmi_device_link_add(&scmi_dev->dev, scmi_dev->handle->dev);
}

.... so that you can avoid fw_devlink BUT keep the device_node NON-null
for the device.

This would mean also restoring the pre-existing explicit blacklisting in
pinctrl-imx to avoid issues when pinctrl subsystem searches by
device_node...

..or I am missing something ?

Thanks,
Cristian

