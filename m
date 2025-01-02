Return-Path: <linux-gpio+bounces-14412-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCED9FFC89
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 18:07:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C897E3A24B5
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 17:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6280915E5A6;
	Thu,  2 Jan 2025 17:07:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79A15C2C8;
	Thu,  2 Jan 2025 17:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735837634; cv=none; b=gxHjIB+7OKUT2Yo8X0SjbWZSsLXlEAeQx8YRDXdIQdfLcOn3Qtt2/K0HGPaoqE4G1TGpSEULPYlbRIW5BiiupNfjR/Bh2JuGhShJWDzkEqS6UQc2pdPoB1eMA2n067YwPnIc/0eI/9GqEsioOO/fKvx66v+Q2OzZ0PWRGUbM5Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735837634; c=relaxed/simple;
	bh=6yUdC46m8RGq2qReGCelQ4EVCtuq5yBzpLoyphZO7Dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kab16SJVbJTRCkNHQYhc4nErx1lkNtBjN18/Vgi78NDLl7RY8AP4LdK4wF2rAMkrC1ft3pvJltTDcgflhxclkcQ5wnYm6CLcjQNl2PwiFfE63EByTyZ9Tyaa9XcukCAJ3PKYic4568uSyswXVl/amO1dmGAO61130vU6ouV774U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16B8411FB;
	Thu,  2 Jan 2025 09:07:40 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FE8E3F673;
	Thu,  2 Jan 2025 09:07:08 -0800 (PST)
Date: Thu, 2 Jan 2025 17:06:57 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Aisheng Dong <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <Z3bHsUMvajaOOhgO@pluto>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-1-e9a3a5341362@nxp.com>
 <20241227151306.jh2oabc64xd54dms@bogus>
 <Z3Qy-br-wVCLpo7Q@pluto>
 <PAXPR04MB8459AB05EEC7107D500A826688142@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459AB05EEC7107D500A826688142@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Thu, Jan 02, 2025 at 07:38:06AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting
> > fwnode for scmi cpufreq
> > 
> > On Fri, Dec 27, 2024 at 03:13:06PM +0000, Sudeep Holla wrote:
> > > On Wed, Dec 25, 2024 at 04:20:44PM +0800, Peng Fan (OSS) wrote:
> > > > From: Peng Fan <peng.fan@nxp.com>
> > > >
> > > > Two drivers scmi_cpufreq.c and scmi_perf_domain.c both use
> > > > SCMI_PROTCOL_PERF protocol, but with different name, so two
> > scmi
> > > > devices will be created. But the fwnode->dev could only point to
> > one device.
> > > >
> > > > If scmi cpufreq device created earlier, the fwnode->dev will point
> > > > to the scmi cpufreq device. Then the fw_devlink will link
> > > > performance domain user device(consumer) to the scmi cpufreq
> > device(supplier).
> > > > But actually the performance domain user device, such as GPU,
> > should
> > > > use the scmi perf device as supplier. Also if 'cpufreq.off=1' in
> > > > bootargs, the GPU driver will defer probe always, because of the
> > > > scmi cpufreq device not ready.
> > > >
> > > > Because for cpufreq, no need use fw_devlink. So bypass setting
> > > > fwnode for scmi cpufreq device.
> > > >
> > 
> > Hi,
> > 
> > > > Fixes: 96da4a99ce50 ("firmware: arm_scmi: Set fwnode for the
> > > > scmi_device")
> > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > ---
> > > >  drivers/firmware/arm_scmi/bus.c | 15 ++++++++++++++-
> > > >  1 file changed, 14 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/firmware/arm_scmi/bus.c
> > > > b/drivers/firmware/arm_scmi/bus.c index
> > > >
> > 157172a5f2b577ce4f04425f967f548230c1ebed..12190d4dabb654845
> > 43044b442
> > > > 4fbe3b67245466 100644
> > > > --- a/drivers/firmware/arm_scmi/bus.c
> > > > +++ b/drivers/firmware/arm_scmi/bus.c
> > > > @@ -345,6 +345,19 @@ static void __scmi_device_destroy(struct
> > scmi_device *scmi_dev)
> > > >  	device_unregister(&scmi_dev->dev);
> > > >  }
> > > >
> > > > +static int
> > > > +__scmi_device_set_node(struct scmi_device *scmi_dev, struct
> > device_node *np,
> > > > +		       int protocol, const char *name) {
> > > > +	/* cpufreq device does not need to be supplier from devlink
> > perspective */
> > > > +	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name,
> > "cpufreq"))
> > > > +		return 0;
> > > >
> > >
> > > This is just a assumption based on current implementation. What
> > > happens if this is needed. Infact, it is used in the current
> > > implementation to create a dummy clock provider, so for sure with
> > this
> > > change that will break IMO.
> > 
> > I agree with Sudeep on this: if you want to exclude some SCMI device
> > from the fw_devlink handling to address the issues with multiple SCMI
> > devices created on the same protocol nodes, cant we just flag this
> > requirement here and avoid to call device_link_add in
> > driver:scmi_set_handle(), instead of killing completely any possibility of
> > referencing phandles (and having device_link_add failing as a
> > consequence of having a NULL supplier)
> > 
> > i.e. something like:
> > 
> > @bus.c
> > ------
> > static int
> > __scmi_device_set_node(struct scmi_device *scmi_dev, struct
> > device_node *np,
> > 		       int protocol, const char *name) {
> > 	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name,
> > "cpufreq"))
> > 		scmi_dev->avoid_devlink = true;
> > 
> > 	device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
> > 	....
> > 
> > 
> > and @driver.c
> > -------------
> > 
> > static void scmi_set_handle(struct scmi_device *scmi_dev) {
> > 	scmi_dev->handle = scmi_handle_get(&scmi_dev->dev);
> > 	if (scmi_dev->handle && !scmi_dev->avoid_devlink)
> > 		scmi_device_link_add(&scmi_dev->dev, scmi_dev-
> > >handle->dev); }
> > 
> > .... so that you can avoid fw_devlink BUT keep the device_node NON-
> > null for the device.
> > 
> > This would mean also restoring the pre-existing explicit blacklisting in
> > pinctrl-imx to avoid issues when pinctrl subsystem searches by
> > device_node...
> > 
> > ..or I am missing something ?
> 
> link_ret = device_links_check_suppliers(dev); to check fw_devlink
> is before "ret = driver_sysfs_add(dev);" which
> issue bus notify.
> 
> The link is fw_devlink, the devlink is created in 'device_add'
>         if (dev->fwnode && !dev->fwnode->dev) {                                                     
>                 dev->fwnode->dev = dev;                                                             
>                 fw_devlink_link_device(dev);                                                        
>         }
> The check condition is fwnode.
> 
> I think scmi_dev->avoid_devlink not help here.
> 

Ah right...my bad, the issue comes from the device_links created by
fw_devlink indirectly while walking the phandles backrefs...still...
...cant we keep the device_node reference while keep on dropping the
fw_node as you did:

 	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {
		scmi_dev->dev.of_node = np;
 		return 0;
	}
 
 	device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
 	....

...so that the fw_devlink machinery is disabled but still we create a
device with an underlying related device_node that can be referred in a
phandle.

I wonder also if it was not even more clean to DO initialize fw_devlink
instead, BUT add some of the existent fw_devlink/devlink flags to inhibit
all the checks...but I am not familiar with fw_devlink so much and I
have not experimented in these regards...so I may have just said
something unfeasible.

Thanks,
Cristian


