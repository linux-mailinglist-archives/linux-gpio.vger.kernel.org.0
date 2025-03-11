Return-Path: <linux-gpio+bounces-17419-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D257A5BED5
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 12:23:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5876516DA91
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 11:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39BA22512C9;
	Tue, 11 Mar 2025 11:23:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52632505AC;
	Tue, 11 Mar 2025 11:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741692200; cv=none; b=O+UXQzvmqcWYZ3nRpJ3jlsD0iCZ3KkaXbO+slR6/5t30W65vVGz9nDhrXNeCae10i1zxRlTRtCxEeN03C5XeJ/3pohBPI30Y+7TfC6xhFuQjdeJp+KWvMCrzZbrvuY86yIUiiS9vOrZeaq+M58X5O9l9ZF1a1sV+RfRJwVmOaww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741692200; c=relaxed/simple;
	bh=ZpalmG4T9OY6m/3LwzKKa9/c72xUEFW6lIUVnjnmeAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRv3FNU/rXWQk8Zf+9WFbIvyd3Cdjd67AieqnWSQYrgc1P2/+anUQjMGt83b6uqcwdvn+Q+0/9L10d2lJAArp4TSWv8AjwtRMzF2TUBqH/HslynWF27EIY2vQdQyY/gFY0h0lxA1rVSvlr29Gs8gmc9etbjVPfLzoM3yugga0WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6DFB152B;
	Tue, 11 Mar 2025 04:23:28 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9EC73F673;
	Tue, 11 Mar 2025 04:23:14 -0700 (PDT)
Date: Tue, 11 Mar 2025 11:23:12 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Aisheng Dong <aisheng.dong@nxp.com>,
	"Fabio Estevam" <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Sascha Hauer" <s.hauer@pengutronix.de>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <Z9AdICiyaCmzKh-N@bogus>
References: <Z7Rf9GPdO2atP89Z@bogus>
 <20250218133619.GA22647@nxa18884-linux>
 <Z7Wvyn1QJQMVigf9@bogus>
 <Z7Z-ZnztmvUxWoQJ@NXL53680.wbi.nxp.com>
 <Z86w3ZRS6T2MvV3X@bogus>
 <DB9PR04MB84614FBF96E7BC0D125D97F688D62@DB9PR04MB8461.eurprd04.prod.outlook.com>
 <Z87UJdhiTWhssnbl@bogus>
 <Z87sGF_jHKau_FMe@bogus>
 <PAXPR04MB8459EA5C7898393E51C246AD88D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <PAXPR04MB8459A73179FFF0ED0C9A51E488D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459A73179FFF0ED0C9A51E488D12@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Tue, Mar 11, 2025 at 11:12:45AM +0000, Peng Fan wrote:
> Based on linux-next, I added below node:
>
> +
> +               test@4f000000 {
> +                       compatible = "fsl,imx-test";
> +                       power-domains = <&scmi_devpd IMX95_PD_VPU>, <&scmi_perf IMX95_PERF_VPU>;
> +                       power-domain-names = "vpumix", "vpuperf";
> +               };
>
> I not write a driver for it, so just check devlink information from sysfs interface.
>
> From below sys directory, this test device takes scmi_dev.4 and scmi_dev.3 as supplier.
> root@imx95evk:/sys/bus/platform/devices/soc:test@4f000000# ls
> driver_override  of_node  subsystem                          supplier:scmi_protocol:scmi_dev.4  waiting_for_supplier
> modalias         power    supplier:scmi_protocol:scmi_dev.3  uevent
>
> Checking scmi_dev.4 below, it is scmi cpufreq, not the scmi perf device.
> scmi_dev.3 is correct, it is genpd.
>
> root@imx95evk:/sys/bus/platform/devices/soc:test@4f000000# cat /sys/bus/scmi_protocol/devices/scmi_dev.4/modalias
> scmi_dev.4:13:cpufreq
> root@imx95evk:/sys/bus/platform/devices/soc:test@4f000000# cat /sys/bus/scmi_protocol/devices/scmi_dev.3/modalias
> scmi_dev.3:11:genpd
> root@imx95evk:/sys/bus/platform/devices/soc:test@4f000000#
>
>
> So it is clear that wrong fw_devlink is created, it is because scmi cpufreq device is
> created earlier and when device_add, the below logic makes the fwnode pointer points
> to scmi cpufreq device.
>         if (dev->fwnode && !dev->fwnode->dev) {
>                 dev->fwnode->dev = dev;
>                 fw_devlink_link_device(dev);
>         }
>

Thanks, looks like simple way to reproduce the issue. I will give it a try.

--
Regards,
Sudeep

