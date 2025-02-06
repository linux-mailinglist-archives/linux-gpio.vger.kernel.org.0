Return-Path: <linux-gpio+bounces-15443-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD2EA2A813
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 13:06:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB143166D82
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 12:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365D722C327;
	Thu,  6 Feb 2025 12:06:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653FE2288F9;
	Thu,  6 Feb 2025 12:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738843575; cv=none; b=mX/zoY/D1LHP9mLKwfN8dADhUf5BXzUxKx+bIGL02C441gLIXYkcm0E7UxHtJbNksiEUZ+zCqlpk/YP8YaL/36qG+TizRTi1dF7SciY3mAMKa8SmjRnXeLnyffsfq1gRJ77EFLrDT3skHZN/EVLJ40KiSfJM6Z1DmCw0tBeDgGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738843575; c=relaxed/simple;
	bh=U6gbIFqnWs8jLbyQIrKy4MQNtRukxtTcp/pPESXgDf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z08t76QIGx8HOX4gx8ZthAM692uDs9KsdILzI1lo7e++U603/kl6mwiTSQYhowGkE/yREFVAIYLAav8oWH6VMxtqk2vN849JFWujlNRFvgcnvnTZjFD5CT7GxvFVISThRX8ydPGUBuYy3BmuVSRGh0Wq7uRrkDp+KzQ4E5b78+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D11B212FC;
	Thu,  6 Feb 2025 04:06:35 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D2013F63F;
	Thu,  6 Feb 2025 04:06:10 -0800 (PST)
Date: Thu, 6 Feb 2025 12:06:03 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
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
Subject: Re: [PATCH v2 2/4] firmware: arm_scmi: Add machine_allowlist and
 machine_blocklist
Message-ID: <Z6Slq4KjS_RJ3ItB@pluto>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-2-3af2fa37dbac@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120-scmi-fwdevlink-v2-2-3af2fa37dbac@nxp.com>

On Mon, Jan 20, 2025 at 03:13:30PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 

Hi,

> There are two cases:
> pinctrl-scmi.c and pinctrl-imx-scmi.c, both use SCMI_PROTOCOL_PINCTRL.
> If both drivers are built in, and the scmi device with name "pinctrl-imx"
> is created earlier, and the fwnode device points to the scmi device,
> non-i.MX platforms will never have the pinctrl supplier ready.
> 

The pinctrl-imx case is an unfortunate exception because you have a
custom Vendor SCMI driver using a STANDARD protocol: this was never
meant to be an allowed normal practice: the idea of SCMI Vendor extensions
is to allow Vendors to write their own Vendor protocols (>0x80) and their
own SCMI drivers on top of their custom vendor protocols.

This list-based generalization seems to me dangerous because allows the
spreading of such bad practice of loading custom Vendor drivers on top of
standard protocols using the same protocol to do the same thing in a
slightly different manner, with all the rfelated issues of fragmentation

...also I feel it could lead to an umaintainable mess of tables of
compatibles....what happens if I write a 3rd pinctrl-cristian driver on
top of it...both the new allowlist and the general pinctrl blocklist
will need to be updated.

The issue as we know is the interaction with devlink given that all of
these same-protocol devices are created with the same device_node, since
there is only one of them per-protocol in the DT....

...not sure what Sudeep thinks..just my opinion...

> Vendor A use 0x80 for feature X, Vendor B use 0x80 for feature Y.
> With both drivers built in, two scmi devices will be created, and both
> drivers will be probed. On A's patform, feature Y probe may fail, vice
> verus.
>

That's definitely an issue much worse than fw_devlink above....we indeed take
care to pick the right vendor-protocol at runtime BUT no check is peformed
against the SCMI drivers so you could end up picking up a completely unrelated
protocol operations...damn...

I think this is more esily solvable though....by adding a Vendor tag in
the device_table (like the protocols do) you could skip device creation
based on a mismatching Vendor, instead of using compatibles that are
doomed to grow indefinitely as a list....

So at this point you would have an optional Vendor and an optional flags
(as mentioned in the other thread) in the device_table...

I wonder if we can use the same logic for the above pinctrl case,
without using compatibles ?
I have not really thougth this through properly....

In general, most of these issues are somehow Vendor-dependent, so I was
also wondering if it was not the case to frame all of this in some sort
of general vendor-quirks framework that could be used also when there
are evident and NOT fixable issues on deployed FW SCMI server, so that
we will have to flex a bit the kernel tolerance to cope with existing
deployed HW that cannot be fixed fw-wise....

...BUT I thought about this even less thoroughly :P...so it could be just a
bad idea of mine...

Thanks,
Cristian

