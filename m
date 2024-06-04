Return-Path: <linux-gpio+bounces-7119-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B992B8FB1D2
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 14:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F1A2282473
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 12:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87881145B1F;
	Tue,  4 Jun 2024 12:08:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 013EA13D609;
	Tue,  4 Jun 2024 12:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717502915; cv=none; b=EOB1SQP4B6iZPCGYdwRqq5+O0N+TKDGCCMNbQXUiyzN4kw8X8VyU89XyI6kmQZ/r4gzl07AYOVH4XJifH2MXPQcvyTCYXsILBtNQdcy6MB/c3sJ9byvuI0kGeWqjjb1z37Lpk8vxpniL9gK1PesSRJ2m08G+3H+6IiywcQEP/TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717502915; c=relaxed/simple;
	bh=wWt+Bkj7J7O6w+1CIY2m5MfZj8A19Ctnvwncpiv8dH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADFd8FV6ujKDtwnKFuFPA+PejkomVz+S3Stxa31X8MISOSuEJ0p/L+0CgRYe2LnAf9BbP5evnIij7AFAgrvDc9pLvedW5cfWBw2ohz1qebOwWqJD6ArJBfEU97iZKIeTN+x4PxDNxOEOjw3D/bxX3r5bc21WzF1aEM380hBNckE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7685F1042;
	Tue,  4 Jun 2024 05:08:56 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAB213F64C;
	Tue,  4 Jun 2024 05:08:29 -0700 (PDT)
Date: Tue, 4 Jun 2024 13:08:27 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 3/3] pinctrl: imx: support SCMI pinctrl protocol for
 i.MX95
Message-ID: <Zl8DuwP8nL_zrS2z@bogus>
References: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com>
 <20240521-pinctrl-scmi-imx95-v1-3-9a1175d735fd@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-pinctrl-scmi-imx95-v1-3-9a1175d735fd@nxp.com>

On Tue, May 21, 2024 at 02:25:59PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> The generic pinctrl-scmi.c driver could not be used for i.MX95 because
> i.MX95 SCMI firmware not supports functions, groups or generic
> 'Pin Configuration Type and Enumerations' listed in SCMI Specification.
>
> i.MX95 System Control Management Interface(SCMI) firmware only supports
> below pin configuration types which are OEM specific types:
>     192: PIN MUX
>     193: PIN CONF
>     194: DAISY ID
>     195: DAISY VAL
>
> To Support fsl,pins property together with SCMI OEM protocol, add this
> driver.
>

(For the scmi interface usage part)

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

--
Regards,
Sudeep

