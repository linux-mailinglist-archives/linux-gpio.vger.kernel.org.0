Return-Path: <linux-gpio+bounces-15840-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAAFA323D3
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 11:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9980E18892EE
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 10:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9032080E7;
	Wed, 12 Feb 2025 10:48:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E46AE208978;
	Wed, 12 Feb 2025 10:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739357304; cv=none; b=LlLXyddMUNuiFGbKTfDeJDpkY0lfkDIFQfsDLpechVXNNeOwPKClxQ8X3lZ8+Am/nxINIAWtLYiJwCBZFY+fEFhYFBxyRKfOkcxPt7LzHUp9qDkYqbPcK7Ow+AeitqOZgoWepE+W7HCKPn8VsCEpxnE9a/VxAs4n/uKmb0/IDH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739357304; c=relaxed/simple;
	bh=9IF2oBk6bHBAt4J0R6POr79YolbpRn/EuqK+TJfK6W4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hIsivXhUKDGrhZzVhhAChcSRDqgPyQx8/99YfKnUwRtSDc3P9d4iUhSjnmLTpJINXJ825yb1StdO3vC3IcaKq2zJ/CDRcGOkq9WqaOeBEc6iHQOPhK2o9nun2oazDbjKXKivru9aodYUljChL7hGA+i40gR+9vzBV5jqCskBApY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DC6512FC;
	Wed, 12 Feb 2025 02:48:43 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 714193F6A8;
	Wed, 12 Feb 2025 02:48:19 -0800 (PST)
Date: Wed, 12 Feb 2025 10:48:16 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
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
Message-ID: <Z6x8cNyDt8rJ73_B@bogus>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-1-e9a3a5341362@nxp.com>
 <Z6uFMW94QNpFxQLK@bogus>
 <20250212070120.GD15796@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212070120.GD15796@localhost.localdomain>

On Wed, Feb 12, 2025 at 03:01:20PM +0800, Peng Fan wrote:
> On Tue, Feb 11, 2025 at 05:13:21PM +0000, Sudeep Holla wrote:
> >On Wed, Dec 25, 2024 at 04:20:44PM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> >> Two drivers scmi_cpufreq.c and scmi_perf_domain.c both use
> >> SCMI_PROTCOL_PERF protocol, but with different name, so two scmi devices
> >> will be created. But the fwnode->dev could only point to one device.
> >> 
> >> If scmi cpufreq device created earlier, the fwnode->dev will point to
> >> the scmi cpufreq device. Then the fw_devlink will link performance
> >> domain user device(consumer) to the scmi cpufreq device(supplier).
> >> But actually the performance domain user device, such as GPU, should use
> >> the scmi perf device as supplier. Also if 'cpufreq.off=1' in bootargs,
> >> the GPU driver will defer probe always, because of the scmi cpufreq
> >> device not ready.
> >> 
> >> Because for cpufreq, no need use fw_devlink. So bypass setting fwnode
> >> for scmi cpufreq device.
> >>
> >
> >Not 100% sure if above is correct. See:
> >
> >Commit 8410e7f3b31e ("cpufreq: scmi: Fix OPP addition failure with a dummy clock provider")
> >
> >Am I missing something ?
> 
> Could we update juno-scmi.dtsi to use ?
> 
>  &A53_0 {
> -       clocks = <&scmi_dvfs 1>;
> +       power-domains = <&scmi_perf x>;
> +       power-domain-names = "perf";
>  };
>

We can, but I retained it so that the clocks property support can be still
validated until it is removed. I think there are few downstream users of
it. It is not just the DTS files you need to look at when dealing with
such things. It is the bindings that matter. Until bindings are not
deprecated and made obsolete, support must exist even if you modify the
only user in the upstream DT.

--
Regards,
Sudeep

