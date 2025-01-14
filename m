Return-Path: <linux-gpio+bounces-14764-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FB2A1039E
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 11:07:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AC6016642B
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 10:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C6051CBE95;
	Tue, 14 Jan 2025 10:07:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2841ADC7C;
	Tue, 14 Jan 2025 10:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736849240; cv=none; b=uQ59RtkBWnZ4n0nMa9ZE5EcnTFg5Wc4UJ/LmsxVV/FTo38UMvNpMCwXMbuN1p4x9IFn0fsl/uM84uUJ5Cb6Uk283q55pE4dLlE5fAGf5nCfVnB2qPsmiN2wpFxPJyuBwuvOjh+cB5URi0XYRq0Qc05pcbXjRE0i5j4N9uAoNXsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736849240; c=relaxed/simple;
	bh=5TdtG7n4eLtAPN1ZHKI3Iuxaw2C/1ZmWQUDtr4xuOuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHD80zhWuLyjsw4ejmbbkFIUVBpv4yHiwfRmhD2O5HkkqSKEhiIWIaHOnf4YJYmYegg2DYPSWRoy3m7mIw+a26QfgwRj/KDDo+zbSYScPvq/E2DAXCZzDmh+aA94lg4sVDT/MmNsACwtFI52UtDTHYAbvGuEhNNqJs03idScpE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D25411FB;
	Tue, 14 Jan 2025 02:07:46 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C45A63F792;
	Tue, 14 Jan 2025 02:07:15 -0800 (PST)
Date: Tue, 14 Jan 2025 10:07:03 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
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
Subject: Re: [PATCH 2/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 pinctrl
Message-ID: <Z4Y3OE8ubIWGiDhb@pluto>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-2-e9a3a5341362@nxp.com>
 <20241227152807.xoc7gaatejdrxglg@bogus>
 <Z3Q07EDfN0kTiVRV@pluto>
 <20250106044120.GB14389@localhost.localdomain>
 <PAXPR04MB84595C6840D6B79B728F8B1B88182@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB84595C6840D6B79B728F8B1B88182@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Tue, Jan 14, 2025 at 08:31:03AM +0000, Peng Fan wrote:
> Hi Cristian, Sudeep
> 
> > Subject: Re: [PATCH 2/4] firmware: arm_scmi: bus: Bypass setting
> > fwnode for pinctrl
> > 
> [...]
> 
> > >> fix here) than this change.
> > >
> > >...or indeed this is another possibility
> > 
> > I am doing a patch as below, how to do you think?
> 
> Do you have any comments on below ideas?
> 
> I am thinking to send out new patchset based on
> below ideas in this week.
> 

Hi Peng,

sorry for the delay.

Why both blacklist and allowlist ?

Cristian

> > 
> > With below patch, we could resolve the devlink issue and also support
> > mutitple vendor drivers built in, with each vendor driver has a
> > machine_allowlist.
> > 
> > diff --git a/drivers/firmware/arm_scmi/bus.c
> > b/drivers/firmware/arm_scmi/bus.c index
> > 1d2aedfcfdb4..c1c45b545480 100644
> > --- a/drivers/firmware/arm_scmi/bus.c
> > +++ b/drivers/firmware/arm_scmi/bus.c
> > @@ -55,6 +55,20 @@ static int scmi_protocol_device_request(const
> > struct scmi_device_id *id_table)
> >         unsigned int id = 0;
> >         struct list_head *head, *phead = NULL;
> >         struct scmi_requested_dev *rdev;
> > +       const char * const *allowlist = id_table->machine_allowlist;
> > +       const char * const *blocklist = id_table->machine_blocklist;
> > +
> > +       if (blocklist && of_machine_compatible_match(blocklist)) {
> > +               pr_debug("block SCMI device (%s) for protocol %x\n",
> > +                        id_table->name, id_table->protocol_id);
> > +               return 0;
> > +       }
> > +
> > +       if (allowlist && !of_machine_compatible_match(allowlist)) {
> > +               pr_debug("block SCMI device (%s) for protocol %x\n",
> > +                        id_table->name, id_table->protocol_id);
> > +               return 0;
> > +       }
> > 
> >         pr_debug("Requesting SCMI device (%s) for protocol %x\n",
> >                  id_table->name, id_table->protocol_id); diff --git
> > a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h index
> > 688466a0e816..e1b822d3522f 100644
> > --- a/include/linux/scmi_protocol.h
> > +++ b/include/linux/scmi_protocol.h
> > @@ -950,6 +950,9 @@ struct scmi_device {  struct scmi_device_id {
> >         u8 protocol_id;
> >         const char *name;
> > +       /* Optional */
> > +       const char * const *machine_blocklist;
> > +       const char * const *machine_allowlist;
> >  };
> 
> Thanks,
> Peng.
> 
> > 
> >  struct scmi_driver {
> > 
> > Thanks,
> > Peng
> > >
> > >Thanks,
> > >Cristian

