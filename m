Return-Path: <linux-gpio+bounces-17348-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFE7A58FA5
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 10:29:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A687F188A44B
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 09:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC4A21D599;
	Mon, 10 Mar 2025 09:29:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2EBA224B08;
	Mon, 10 Mar 2025 09:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741598949; cv=none; b=cjqTiBxaVV6TaHpkGkP21RyJHv+2zMxwT+EhNnwn99Y6yO4faTlP5CZMQSbJ9KzgtluxwoQSLWEZhs7iDGkEe8Fq7uuS7kQA2eN9TEeDQG8S6ENdgbCfuiP+i/XY1sBVcjL5zIU9gKTBsYwmg1HD0OJmfFH97trcDc8K3LR7/XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741598949; c=relaxed/simple;
	bh=uZM3lp58dqP9fRo8T3M/Fyf3CLx9G0+yBPauwPD1UJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBnzcIe80e8tOrQboyez21m2q75YLDeeF/gbhYxr1j9YghPv4CKPDhEVADUcO5ALJcDzZFgZ+HNQpPY6UO9WDDxvP+mAAvZbvnN8aaQdDVIpHSAkEaFE7IKzR90cBYk/zf+ifyAGM2KvFRmxDdQ4YuedVcrssxnE6sJ/oZrihSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F97815A1;
	Mon, 10 Mar 2025 02:29:18 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D59473F5A1;
	Mon, 10 Mar 2025 02:29:03 -0700 (PDT)
Date: Mon, 10 Mar 2025 09:29:01 +0000
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
Message-ID: <Z86w3ZRS6T2MvV3X@bogus>
References: <Z6uFMW94QNpFxQLK@bogus>
 <20250212070120.GD15796@localhost.localdomain>
 <Z6x8cNyDt8rJ73_B@bogus>
 <CAGETcx87Stfkru9gJrc1sf=PtFGLY7=jrfFaCzK5Z4hq+2TCzg@mail.gmail.com>
 <Z65U2SMwSiOFYC0v@pluto>
 <20250218010949.GB22580@nxa18884-linux>
 <Z7Rf9GPdO2atP89Z@bogus>
 <20250218133619.GA22647@nxa18884-linux>
 <Z7Wvyn1QJQMVigf9@bogus>
 <Z7Z-ZnztmvUxWoQJ@NXL53680.wbi.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7Z-ZnztmvUxWoQJ@NXL53680.wbi.nxp.com>

On Thu, Feb 20, 2025 at 08:59:18AM +0800, Peng Fan wrote:
>
> Sorry, if I misunderstood.
>
> I will give a look on this and propose a RFC.
>
> DT maintainers may ask for a patchset including binding change and
> driver changes to get a whole view on the compatible stuff.
>
> BTW, Cristian, Saravana if you have any objections/ideas or would take on this
> effort, please let me know.
>

Can you point me to the DTS with which you are seeing this issue ?
I am trying to reproduce the issue but so far not successful. I did
move to power-domains for CPUFreq on Juno. IIUC all we need is both cpufreq
and performance genpd drivers in the kernel and then GPU using perf genpd
fails with probe deferral right ? I need pointers to reproduce the issue
so that I can check if what I have cooked up as a solution really works.

--
Regards,
Sudeep

