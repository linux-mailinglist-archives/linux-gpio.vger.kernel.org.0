Return-Path: <linux-gpio+bounces-18553-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D36F1A82348
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 13:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CAD41B85A87
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 11:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF3125E46C;
	Wed,  9 Apr 2025 11:14:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C4625DCFC;
	Wed,  9 Apr 2025 11:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197249; cv=none; b=fYQsSwVquPGoUzqNpG150k8scKsAZSWq3DeyjyDmX/9jPa2nntR/9b8iB+y05VXgAQs3FAsSxgntvQQgPvNhJH24iviBVD3P1XH98GvrGco7ZetzSsK1gPQ6iKXrt4kpKuW2+yEujigOmGqeSj8zNVj4HD6B9tY3cbGpti7LhUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197249; c=relaxed/simple;
	bh=HX06AXwlwFb+zyiqr4dlDx5tRPTTjJS5hvDRJEZ1yTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLtgx+ccrdAYVgXndt4XALaOmLiEBWG7nvnpMOW1BCWEUFbsskqENr2g+temhCnNfG0TUwXH/jlbIf4LOXxEo1LCmOty0UJUBp5Xj4J+GHfP/eEwIpLNzgAMBROTuQg6kjvfcZwOn6qx+e0FXA68LjVZWgM9xaQA0k1EGzLqOfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01B081595;
	Wed,  9 Apr 2025 04:14:07 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 947573F694;
	Wed,  9 Apr 2025 04:14:03 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:14:00 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Message-ID: <20250409-incredible-attentive-scorpion-fa9def@sudeepholla>
References: <DB9PR04MB84614FBF96E7BC0D125D97F688D62@DB9PR04MB8461.eurprd04.prod.outlook.com>
 <Z87UJdhiTWhssnbl@bogus>
 <Z87sGF_jHKau_FMe@bogus>
 <PAXPR04MB8459EA5C7898393E51C246AD88D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <PAXPR04MB8459A73179FFF0ED0C9A51E488D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z9AdICiyaCmzKh-N@bogus>
 <Z9FnZzBQuZ1j5k3I@bogus>
 <Z9Fv9JPdF5OWUHfk@bogus>
 <20250313052309.GA11131@nxa18884-linux>
 <20250409035029.GC27988@nxa18884-linux>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409035029.GC27988@nxa18884-linux>

On Wed, Apr 09, 2025 at 11:50:29AM +0800, Peng Fan wrote:
> Hi Sudeep, Cristian
> 
> On Thu, Mar 13, 2025 at 01:23:27PM +0800, Peng Fan wrote:
> >On Wed, Mar 12, 2025 at 11:28:52AM +0000, Sudeep Holla wrote:
> >>On Wed, Mar 12, 2025 at 10:52:23AM +0000, Sudeep Holla wrote:
> >>> On Tue, Mar 11, 2025 at 11:23:12AM +0000, Sudeep Holla wrote:
> >>> > On Tue, Mar 11, 2025 at 11:12:45AM +0000, Peng Fan wrote:
> >>> > >
> >>> > > So it is clear that wrong fw_devlink is created, it is because scmi cpufreq device is
> >>> > > created earlier and when device_add, the below logic makes the fwnode pointer points
> >>> > > to scmi cpufreq device.
> >>> > >         if (dev->fwnode && !dev->fwnode->dev) {
> >>> > >                 dev->fwnode->dev = dev;
> >>> > >                 fw_devlink_link_device(dev);
> >>> > >         }
> >>> > >
> >>> >
> >>> > Thanks, looks like simple way to reproduce the issue. I will give it a try.
> >>> >
> >>> 
> >>> I could reproduce but none of my solution solved the problem completely
> >>> or properly. And I don't like the DT proposal you came up with. I am
> >>> not inclined to just drop this fwnode setting in the scmi devices and
> >>> just use of_node.
> >>>
> >>
> >>Sorry for the typo that changes the meaning: s/not/now
> >>
> >>I meant "I am now inclined ..", until we figure out a way to make this
> >>work with devlinks properly.
> >
> >when you have time, please give a look at
> >https://github.com/MrVan/linux/commit/b500c29cb7f6f32a38b1ed462e333db5a3e301e4
> >
> >The upper patch was to follow Cristian's and Dan's suggestion in V2[1] to use
> >a flag SCMI_DEVICE_NO_FWNODE for scmi device.
> >
> >I could post out the upper patch as V3 if it basically looks no design flaw.
> >I will drop the pinctrl patch in v3, considering we are first going
> >to resolve the fw_devlink issue for cpufreq/devfreq.
> >
> >[1] https://lore.kernel.org/all/Z6SgFGb4Z88v783c@pluto/
> 
> Not sure you gave a look on this or not. I am thinking to bring this V3
> out to mailing list later this week. Please raise if you have any concern.
> 

Yes I had some thoughts. I will take a look and refresh my memories first.

-- 
Regards,
Sudeep

