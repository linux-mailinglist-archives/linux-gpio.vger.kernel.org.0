Return-Path: <linux-gpio+bounces-19127-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AED9A965A6
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 12:17:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E6ED7ABFB7
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 10:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59CA920DD7D;
	Tue, 22 Apr 2025 10:16:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0770E1EE008;
	Tue, 22 Apr 2025 10:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317013; cv=none; b=gGtwe93i0Vsp6Ab9iRIrGi91Qh6nSZYPWZf7ggH5g0fRY5I+yOQ6+GmVbGhhPxwv69WmNs3rrIgYHLgf2OddL6/fTEbqy2bqxpa3ka1HWW0YD1ZFa6Ps3e19JxytdzRN70EN0o5TLMqwdg+U5My9sfMd4Loum12FxfP6rk8sBvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317013; c=relaxed/simple;
	bh=W90UIsyeg/0lHOkHT4N2q5JRFzPPDsW1VlF70FXqS88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uXv1k4iI3I/Z0exjdLrps3W61fHqMdvkWnGeobQUHsWwuCS+1LynasR4SfRpouAad1dUJk3PKTnzvQ8s9BV2smAAD+/Mo87is0D8bJAjQD+KgF/1vgPNVV9bLB28D7+4m12JiMbE1YF0k2bV9fpGcSoKw259hSOwgECsUBSsqUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1399152B;
	Tue, 22 Apr 2025 03:16:45 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F67A3F66E;
	Tue, 22 Apr 2025 03:16:47 -0700 (PDT)
Date: Tue, 22 Apr 2025 11:16:44 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Sudeep Holla <sudeep.holla@arm.com>,
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
Message-ID: <20250422-vigorous-cockatoo-of-growth-bacdb7@sudeepholla>
References: <PAXPR04MB8459EA5C7898393E51C246AD88D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <PAXPR04MB8459A73179FFF0ED0C9A51E488D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z9AdICiyaCmzKh-N@bogus>
 <Z9FnZzBQuZ1j5k3I@bogus>
 <Z9Fv9JPdF5OWUHfk@bogus>
 <20250313052309.GA11131@nxa18884-linux>
 <20250409035029.GC27988@nxa18884-linux>
 <20250409-incredible-attentive-scorpion-fa9def@sudeepholla>
 <20250417-diligent-anteater-of-felicity-70bff3@sudeepholla>
 <20250420140944.GB31933@nxa18884-linux>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250420140944.GB31933@nxa18884-linux>

On Sun, Apr 20, 2025 at 10:09:44PM +0800, Peng Fan wrote:
> On Thu, Apr 17, 2025 at 03:26:42PM +0100, Sudeep Holla wrote:
> 
> >Revert to old behaviour and driver request fw_devlink dependencies to
> >be created if they rely on them. I am not sure if that is better approach.
> 
> This requires to update various drivers(clk,power,perf,pinctrl,regulator) to
> set the flag SCMI_DEV_SET_FWNODE.
> 
> Using SCMI_DEV_NO_FWNODE would avoid updating the various drivers.
> 

Agreed and good point.

> Anyway, you decide which to go :)

Still undecided 🙁

-- 
Regards,
Sudeep

