Return-Path: <linux-gpio+bounces-7078-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF568D8474
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 15:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF988B2614D
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 13:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8066212D76B;
	Mon,  3 Jun 2024 13:54:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CEE41E4A2;
	Mon,  3 Jun 2024 13:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717422896; cv=none; b=rJbV1LDPi3qickWUCOB3+n+HyAFSm+cW5PoyWzVx+Gp7MsTuNB9z6iKVOwqlO/kADQFpV1BjK6gp36WzLYdcN/1wLDz2TAwE7V82g6JtUVRfXWplcm87PYwBWwWb9tttZb5osLCUP/LXFZZ6LdtbgOSm33d8f3KZqOcrfIj+JjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717422896; c=relaxed/simple;
	bh=vTTzcuOT0hu+3Euns8TOuKgbuBxigYHbPABPbaEJeKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhENkJsWqYCzFIY/YrwOu6GJrSnPhn2QZ/hraaa+V5IKhsCxmvY2qifxMMbRam6HfFzo3Kq8qZNA8CUoS9IzYIa/fyHizasVVhGJ2IHNe+K5GKYgEH0+rIQwupr0CnA1w/cN6HwqeKW5Wl3EOUm6fjbp2CGTApXW3fWkNwOkpuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB15F1042;
	Mon,  3 Jun 2024 06:55:18 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50EDA3F64C;
	Mon,  3 Jun 2024 06:54:52 -0700 (PDT)
Date: Mon, 3 Jun 2024 14:54:49 +0100
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
Subject: Re: [PATCH 0/3] pinctrl: scmi: support i.MX95 OEM extensions with
 fsl,pins property
Message-ID: <Zl3LKRE-PT3u1AX7@bogus>
References: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com>
 <DU0PR04MB941718F15619A907C15AA18588F02@DU0PR04MB9417.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU0PR04MB941718F15619A907C15AA18588F02@DU0PR04MB9417.eurprd04.prod.outlook.com>

On Mon, May 27, 2024 at 08:36:27AM +0000, Peng Fan wrote:
> Hi Linus, Sudeep, Cristian,
> 
> > Subject: [PATCH 0/3] pinctrl: scmi: support i.MX95 OEM extensions with
> > fsl,pins property
> 
> Sorry if this is an early ping to you. Just wanna this not blocking i.MX95
> upstream support.
>

I would say yes as this was posted bang in the middle of the merge window.
So it is possible for people to miss this if they are busy otherwise.

I wouldn't have responded in general or if someone is new to the Linux
kernel development. But you are no new to kernel development.

In general I also have a suggestion for you. Avoid churning the dependent
patch series if the base set of patches are not yet reviewed or agreed upon.
I was super confused with the amount of different concurrent but dependent
patch series you had for this whole i.MX SCMI pinmux support. I had ignored
and not responded in the past but thought it would be good to respond in
this thread.

--
Regards,
Sudeep

