Return-Path: <linux-gpio+bounces-6241-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4B28BFD0F
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 14:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA7B91C20E78
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 12:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9328683CBE;
	Wed,  8 May 2024 12:22:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8812A83CCF;
	Wed,  8 May 2024 12:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715170939; cv=none; b=RGPuImIywIX7o5bdbpUHDbtu3x8YMdW2+B8veJJVTEt47UZTKZdMDH75VS4VkekS8cZbnM7zihaUleYYKMBWXTv6y2Ac29vPswCdPxJ0uQnI2I4U6uC2pl1iC8/NMOSPBrscqc8iKgYkzzERy8dBkzBiUp6oKywxlAc64j9lACQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715170939; c=relaxed/simple;
	bh=X1S1dzhW3wRfqpB++o89A6VLOtGJiekN3EHOLbW+84E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6SikQK/+cjezFBMcYKuZIhf/pSlseV1QnJDGe11a9uCugIbMdwj/GRZvDvilbq//wPbVxThoR06JpjvRj3ljmNkR4H+7mUJoUA6nVLOG3yNasnfXUC1xTTCUmW4zJFmlXeBF5/cc5gQv41srJxXgCGC8/dSi0e3CZoVVkNPBV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 559B91007;
	Wed,  8 May 2024 05:22:42 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C7873F587;
	Wed,  8 May 2024 05:22:14 -0700 (PDT)
Date: Wed, 8 May 2024 13:22:12 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Aisheng Dong <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v5 0/3] pinctrl: scmi: support i.MX95 OEM extensions
Message-ID: <ZjtudPS1CUqCJU5v@bogus>
References: <20240508-pinctrl-scmi-oem-v3-v5-0-6f2b167f71bc@nxp.com>
 <ZjtCGXgwgtZ4X49v@bogus>
 <DU0PR04MB94170BB9A2C41DE40C8F575288E52@DU0PR04MB9417.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU0PR04MB94170BB9A2C41DE40C8F575288E52@DU0PR04MB9417.eurprd04.prod.outlook.com>

On Wed, May 08, 2024 at 09:41:24AM +0000, Peng Fan wrote:
> Hi Sudeep,
>
> > Subject: Re: [PATCH v5 0/3] pinctrl: scmi: support i.MX95 OEM extensions
> >
> > On Wed, May 08, 2024 at 11:32:01AM +0800, Peng Fan (OSS) wrote:
> > > ARM SCMI v3.2 Table 24 Pin Configuration Type and Enumerations:
> > > '192 -255 OEM specific units'.
> > >
> > > i.MX95 System Manager FW supports SCMI PINCTRL protocol, but it has
> > > zero functions, groups. So pinctrl-scmi.c could not be reused for i.MX95.
> > > Because nxp,pin-func, nxp,pin-conf properties are rejected by dt
> > > maintainers, so use generic property 'pinmux' which requires a new
> > > driver pinctrl-imx-scmi.c
> > >
> >
> > Not a review in particular, but if we decide to merge this deviation, it must be
> > under the condition that it can be deleted anytime in the future if this
> > becomes annoyance(like other vendors using this as a way to deviate from
> > the specification). If we can't agree with that, then we better not merge this
> > at all.
>
> It is ok for me. I agree.
> But actually this driver still follows Spec by using OEM extensions.
>

Agreed, but that's what I call as deviations. When such extensions are
used as baseline implementation, it becomes deviations.

--
Regards,
Sudeep

