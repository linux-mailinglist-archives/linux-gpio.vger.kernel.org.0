Return-Path: <linux-gpio+bounces-16222-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F533A3BB85
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 11:22:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9D401725DA
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 10:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290321D7984;
	Wed, 19 Feb 2025 10:17:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29EB1C5F0C;
	Wed, 19 Feb 2025 10:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739960276; cv=none; b=lVtBISD1xTVzPqEdx2t+3pAbEEkyHOxSP/XNLJ/g5MnOMx8+yRQkSVi3rMz+u06SA2AftHkexNicOkv2yR5pqbL9BsffoV820aYCRhlexSA5J9pp66hTJqkddrLn8ZfEFW8bbpxXpvSZJDTSAZK29eW6E3Zb1OPF1kOX2/4vIAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739960276; c=relaxed/simple;
	bh=DuYlt34xD1e3j0IA7LTc8PQr3bNRl2dT3bWTNzleND4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPEiFgh2hYc1HaiOLlNu2zbS3ayULu/kPb/P339XU3itBnR6/SKpaKJ/EO8KgcxdNVB1G6VZTAD8uHYSGt7iFPueOlSGzSU6mGDRoD+e9y3igxwDzEPk5h2CGQJgmkUSi166+3GMFXoMKo0Mr/XhBTpA2o/mFksQqO8IxPOXxd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3CCD1682;
	Wed, 19 Feb 2025 02:18:10 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A6503F6A8;
	Wed, 19 Feb 2025 02:17:49 -0800 (PST)
Date: Wed, 19 Feb 2025 10:17:46 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<imx@lists.linux.dev>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <Z7Wvyn1QJQMVigf9@bogus>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-1-e9a3a5341362@nxp.com>
 <Z6uFMW94QNpFxQLK@bogus>
 <20250212070120.GD15796@localhost.localdomain>
 <Z6x8cNyDt8rJ73_B@bogus>
 <CAGETcx87Stfkru9gJrc1sf=PtFGLY7=jrfFaCzK5Z4hq+2TCzg@mail.gmail.com>
 <Z65U2SMwSiOFYC0v@pluto>
 <20250218010949.GB22580@nxa18884-linux>
 <Z7Rf9GPdO2atP89Z@bogus>
 <20250218133619.GA22647@nxa18884-linux>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218133619.GA22647@nxa18884-linux>

On Tue, Feb 18, 2025 at 09:36:19PM +0800, Peng Fan wrote:
> On Tue, Feb 18, 2025 at 10:24:52AM +0000, Sudeep Holla wrote:
> >On Tue, Feb 18, 2025 at 09:09:49AM +0800, Peng Fan wrote:
> >> A potential solution is not using reg in the protocol nodes. Define nodes
> >> as below:
> >> devperf {
> >> 	compatible ="arm,scmi-devperf";
> >> }
> >>
> >> cpuperf {
> >> 	compatible ="arm,scmi-cpuperf";
> >> }
> >>
> >> pinctrl {
> >> 	compatible ="arm,scmi-pinctrl";
> >> }
> >>
> >> The reg is coded in driver.
> >>
> >> But the upper requires restruction of scmi framework.
> >>
> >> Put the above away, could we first purse a simple way first to address
> >> the current bug in kernel? Just as I prototyped here:
> >> https://github.com/MrVan/linux/tree/b4/scmi-fwdevlink-v2
> >>
> >
> >Good luck getting these bindings merged. I don't like it as it is pushing
> >software policy or issues into to the devicetree. What we have as SCMI
> >binding is more than required for a firmware interface IMO. So, you are
>
> Would you mind share more info on other cases that SCMI not as firmware
> interface?
>
> >on your own to get these bindings approved as I am not on board with
> >these but if you convince DT maintainers, I will have a look at it then
> >to see if we can make that work really.
>
> The issues are common to SCMI, not i.MX specific.
> I just propose potential solutions. You are the SCMI maintainer, there
> is no chance to get bindings approved without you.
>

I am not blocking you. What I mentioned is I don't agree that DT can be used
to resolve this issue, but I don't have time or alternate solution ATM. So
if you propose DT based solution and the maintainers agree for the proposed
bindings I will take a look and help you to make that work. But I will raise
any objections I may have if the proposal has issues mainly around the
compatibility and ease of maintenance.

> No more ideas from me. Leave this to you in case you have better solution.
>

Unfortunately no, I don't have one. I haven't had time to sit and explore
the issue and think of any solution yet.

--
Regards,
Sudeep

