Return-Path: <linux-gpio+bounces-17380-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24385A59684
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 14:41:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 627B1168344
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 13:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD64922A4EA;
	Mon, 10 Mar 2025 13:41:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C50D62288F7;
	Mon, 10 Mar 2025 13:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741614113; cv=none; b=bgF0uPqd0mrtzxQ7/je5COd4GpDDNSVgy5dIfVjDkzctlPg0S1S/n1r4yi90OKuUPLmH1Chn6z1gsySS4REkWfMTl18Zpmbgq8CGhrUflDenU6XVRGt8Ii1A1weujhpd/P+SfRSScoP4ggyQU922ShAykkzGTTR69Fdhd9tk0Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741614113; c=relaxed/simple;
	bh=nAmgfZNQu7S8jr939gr7ER0zYUBcT7czwN5spys2Q5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/VvDFSvN/wVi/VJuQOY48c3SylA3F3Or3u2kw18OZbvDEkw+3XLeJgNe1r3AYovyKh6Hhie9xqlRoqjTqDgujlFtgQnh5wQYyF5zO9Nn8RHkGapwiD6a3WwTGwZ/xguG7Rvx3EWM4/ybdIi6AnQMdIJ0EUJJawFi9FPxH5hwKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4D4F26BC;
	Mon, 10 Mar 2025 06:42:01 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 462AC3F673;
	Mon, 10 Mar 2025 06:41:47 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:41:44 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
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
Message-ID: <Z87sGF_jHKau_FMe@bogus>
References: <CAGETcx87Stfkru9gJrc1sf=PtFGLY7=jrfFaCzK5Z4hq+2TCzg@mail.gmail.com>
 <Z65U2SMwSiOFYC0v@pluto>
 <20250218010949.GB22580@nxa18884-linux>
 <Z7Rf9GPdO2atP89Z@bogus>
 <20250218133619.GA22647@nxa18884-linux>
 <Z7Wvyn1QJQMVigf9@bogus>
 <Z7Z-ZnztmvUxWoQJ@NXL53680.wbi.nxp.com>
 <Z86w3ZRS6T2MvV3X@bogus>
 <DB9PR04MB84614FBF96E7BC0D125D97F688D62@DB9PR04MB8461.eurprd04.prod.outlook.com>
 <Z87UJdhiTWhssnbl@bogus>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z87UJdhiTWhssnbl@bogus>

On Mon, Mar 10, 2025 at 11:59:33AM +0000, Sudeep Holla wrote:
> On Mon, Mar 10, 2025 at 10:45:44AM +0000, Peng Fan wrote:
> > > Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting
> > > fwnode for scmi cpufreq
> > > 
> > > On Thu, Feb 20, 2025 at 08:59:18AM +0800, Peng Fan wrote:
> > > >
> > > > Sorry, if I misunderstood.
> > > >
> > > > I will give a look on this and propose a RFC.
> > > >
> > > > DT maintainers may ask for a patchset including binding change and
> > > > driver changes to get a whole view on the compatible stuff.
> > > >
> > > > BTW, Cristian, Saravana if you have any objections/ideas or would
> > > take
> > > > on this effort, please let me know.
> > > >
> > > 
> > > Can you point me to the DTS with which you are seeing this issue ?
> > > I am trying to reproduce the issue but so far not successful. I did move
> > > to power-domains for CPUFreq on Juno. IIUC all we need is both
> > > cpufreq and performance genpd drivers in the kernel and then GPU
> > > using perf genpd fails with probe deferral right ? I need pointers to
> > > reproduce the issue so that I can check if what I have cooked up as a
> > > solution really works.
> >
> > This is in downstream tree:
> > https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/arch/arm64/boot/dts/freescale/imx95.dtsi#L2971
> > https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/arch/arm64/boot/dts/freescale/imx95.dtsi#L3043
> > https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/arch/arm64/boot/dts/freescale/imx95.dtsi#L80
> >
> > we are using "power-domains" property for cpu perf and gpu/vpu perf.
> >
> > If cpufreq.off=1 is set in bootargs, the vpu/gpu driver will defer probe.
> >
> 
> OK, does the probe of these drivers get called or they don't as the driver
> core doesn't allow that ? I just have a dummy driver for mali on Juno
> which just does dev_pm_domain_attach_list() in the probe and it seem to
> succeed even when cpufreq.off=1 is passed. I see scmi-cpufreq failing
> with -ENODEV as expected.
> 
> I need to follow the code and check if I can somehow reproduce. Also are
> you sure this is not with anything in the downstream code ? Also have you
> tried this with v6.14-rc* ? Are you sure all the fw_devlink code is backported
> in the tree you pointed me which is v6.6-stable ?
> 

I even tried the above branch, but no luck. The above is neither latest
stable version nor pure stable. It has few extra patches backported
though IIUC. Anyways any pointers to enable me to reproduce the issue
would be much appreciated.

-- 
Regards,
Sudeep

