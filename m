Return-Path: <linux-gpio+bounces-14382-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CD79FF12E
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Dec 2024 19:16:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 771FD1881637
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Dec 2024 18:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D1D1ACEDA;
	Tue, 31 Dec 2024 18:16:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB6213FD72;
	Tue, 31 Dec 2024 18:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735668979; cv=none; b=ONBa5kBAbyCu/fvGHS6HF3iwiOk2uz2sRBMjjdTy/YmCePQoajehB9Tn8dAbCQaQuD/Ohau8B/vFUgIAVGis4G5xkzgiL01bO/rKR0FxGYGU3IGsvPdoFjsEkBhex3ouz1LDt+JynAHw1Mz1V3U7AlucLCWZksSY9Byylv1FKUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735668979; c=relaxed/simple;
	bh=qhANfXtja1gq5ZAefF0YMiGbthmm0bcnT6HBkKQckdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zs7uhhYH+iNCpPg6LIZxcNSl1ux642irHPwwgd3rGLr3qrIiruFnFGD6WsQ2AyhedrMECwjySr2yZT9+Z7kMAI3XQmoJRtHLhS2As/6lecDI4Qxitxlh3AK9l1hOVQoffeXSVQvZZ5ictVo/4gANnfEw2d/LYc0VcNoagOeDD4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C060143D;
	Tue, 31 Dec 2024 10:16:45 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A87473F673;
	Tue, 31 Dec 2024 10:16:14 -0800 (PST)
Date: Tue, 31 Dec 2024 18:16:12 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: Re: [PATCH 2/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 pinctrl
Message-ID: <Z3Q07EDfN0kTiVRV@pluto>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-2-e9a3a5341362@nxp.com>
 <20241227152807.xoc7gaatejdrxglg@bogus>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227152807.xoc7gaatejdrxglg@bogus>

On Fri, Dec 27, 2024 at 03:28:07PM +0000, Sudeep Holla wrote:
> On Wed, Dec 25, 2024 at 04:20:45PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > pinctrl-scmi.c and pinctrl-imx-scmi.c, both use SCMI_PROTOCOL_PINCTRL.
> > If both drivers are built in, and the scmi device with name "pinctrl-imx"
> > is created earlier, and the fwnode device points to the scmi device,
> > non-i.MX platforms will never have the pinctrl supplier ready.
> >
> 
> I wonder if we can prevent creation of "pinctrl-imx" scmi device on non
> i.MX platforms instead of this hack which IMO is little less hackier
> (and little more cleaner as we don't create problem and then fix here)
> than this change.

...or indeed this is another possibility

Thanks,
Cristian

