Return-Path: <linux-gpio+bounces-17355-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA3BA5935A
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 13:03:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D72DC1892560
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 12:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C660229B2A;
	Mon, 10 Mar 2025 11:59:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77CC3229B17;
	Mon, 10 Mar 2025 11:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741607981; cv=none; b=mjDFw74DxkUguXWI/pW0Z/VTzHwOGHihW1Fg8EHi0ZExgR1wBgc6I2pQcL/Yq4cXjbgjmgE3A87ur7gTzC5zpRxxV5wARCCOVXQAkl7TW5ilpv3OoURkDDYuEAZi9rLsONuhJdMvWUOo5eOBRRrfzWSdh9NIyDyRLr9IZuQ6doQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741607981; c=relaxed/simple;
	bh=JdTtNW4KV9x3208UN40VO7s75L7zCHPjuhDtsTLEx4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekknl8N/WZiOo+i32/7AltwtW13qtZswqg4/YDGgM4pV2HdNHN+DjYk/aa7OOjbosRfD9xTlMmoXaT9IkpDFSpx5uTj2ocSM0zja/a/HvSBcZKkaKObMFithq+MaMOmxbI+5Pvxe8oR8x8hvIgJP4AEjwgKSxcW4V8GYgLElJbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 481C71516;
	Mon, 10 Mar 2025 04:59:50 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9B693F5A1;
	Mon, 10 Mar 2025 04:59:35 -0700 (PDT)
Date: Mon, 10 Mar 2025 11:59:33 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
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
Message-ID: <Z87UJdhiTWhssnbl@bogus>
References: <Z6x8cNyDt8rJ73_B@bogus>
 <CAGETcx87Stfkru9gJrc1sf=PtFGLY7=jrfFaCzK5Z4hq+2TCzg@mail.gmail.com>
 <Z65U2SMwSiOFYC0v@pluto>
 <20250218010949.GB22580@nxa18884-linux>
 <Z7Rf9GPdO2atP89Z@bogus>
 <20250218133619.GA22647@nxa18884-linux>
 <Z7Wvyn1QJQMVigf9@bogus>
 <Z7Z-ZnztmvUxWoQJ@NXL53680.wbi.nxp.com>
 <Z86w3ZRS6T2MvV3X@bogus>
 <DB9PR04MB84614FBF96E7BC0D125D97F688D62@DB9PR04MB8461.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB9PR04MB84614FBF96E7BC0D125D97F688D62@DB9PR04MB8461.eurprd04.prod.outlook.com>

On Mon, Mar 10, 2025 at 10:45:44AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting
> > fwnode for scmi cpufreq
> > 
> > On Thu, Feb 20, 2025 at 08:59:18AM +0800, Peng Fan wrote:
> > >
> > > Sorry, if I misunderstood.
> > >
> > > I will give a look on this and propose a RFC.
> > >
> > > DT maintainers may ask for a patchset including binding change and
> > > driver changes to get a whole view on the compatible stuff.
> > >
> > > BTW, Cristian, Saravana if you have any objections/ideas or would
> > take
> > > on this effort, please let me know.
> > >
> > 
> > Can you point me to the DTS with which you are seeing this issue ?
> > I am trying to reproduce the issue but so far not successful. I did move
> > to power-domains for CPUFreq on Juno. IIUC all we need is both
> > cpufreq and performance genpd drivers in the kernel and then GPU
> > using perf genpd fails with probe deferral right ? I need pointers to
> > reproduce the issue so that I can check if what I have cooked up as a
> > solution really works.
>
> This is in downstream tree:
> https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/arch/arm64/boot/dts/freescale/imx95.dtsi#L2971
> https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/arch/arm64/boot/dts/freescale/imx95.dtsi#L3043
> https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/arch/arm64/boot/dts/freescale/imx95.dtsi#L80
>
> we are using "power-domains" property for cpu perf and gpu/vpu perf.
>
> If cpufreq.off=1 is set in bootargs, the vpu/gpu driver will defer probe.
>

OK, does the probe of these drivers get called or they don't as the driver
core doesn't allow that ? I just have a dummy driver for mali on Juno
which just does dev_pm_domain_attach_list() in the probe and it seem to
succeed even when cpufreq.off=1 is passed. I see scmi-cpufreq failing
with -ENODEV as expected.

I need to follow the code and check if I can somehow reproduce. Also are
you sure this is not with anything in the downstream code ? Also have you
tried this with v6.14-rc* ? Are you sure all the fw_devlink code is backported
in the tree you pointed me which is v6.6-stable ?

--
Regards,
Sudeep

