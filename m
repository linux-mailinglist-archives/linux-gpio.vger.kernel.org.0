Return-Path: <linux-gpio+bounces-7117-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D238FAFD6
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 12:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F8541F23171
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 10:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3351448F1;
	Tue,  4 Jun 2024 10:27:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF9213247D;
	Tue,  4 Jun 2024 10:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717496829; cv=none; b=g/uYhnC2ZyKLyaoCLfxxfEd7HpNVMaj4ze2s80VUbGuM+mGtV9fTKxTAS40om8r4tHlp37kHpWneO+cRzEusZTERnY2yQbuzWIqWwPPkNZpxPIQGYtNgIZNhPRwD+2W/lN7m3bw6/NLxLOYES8DHfNbJbyZKL+II3IZCRmpB8ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717496829; c=relaxed/simple;
	bh=s4p/kkqzKCiAh7TGz3mBbtp1qYDq3Y8HERuiXSIOO44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRzlVnpUsroGVF222orK3vaGUq0Szdcr85O0j6j6JtXkhO++mjjw+xWZ7qeirF66xBNqmkSVBMuRrXZHgEGdoIzLcbnYunOyc2zx/BS6ksJIJEudhcNDsl3Z/dW8Bz2lCehR3IkUWy9kxqr7teOz7I7gbtgg/J5B3SIPpqbccpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DCB11042;
	Tue,  4 Jun 2024 03:27:31 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF6D43F792;
	Tue,  4 Jun 2024 03:27:04 -0700 (PDT)
Date: Tue, 4 Jun 2024 11:27:02 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
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
Message-ID: <Zl7r9sN8EH8Xmnqn@pluto>
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
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pinctrl/freescale/Kconfig            |   9 +
>  drivers/pinctrl/freescale/Makefile           |   1 +
>  drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 357 +++++++++++++++++++++++++++
>  3 files changed, 367 insertions(+)
>

Only tested compilation and interactions with Generic Pinctrl SCMI
driver, LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

