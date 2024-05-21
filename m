Return-Path: <linux-gpio+bounces-6516-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 676188CAFCD
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 15:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 980A41C21A5A
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 13:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E05CF7F47F;
	Tue, 21 May 2024 13:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+PRTIpK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FFF7EF18;
	Tue, 21 May 2024 13:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716299905; cv=none; b=jt0P2o/wyjbY5AWdlXHuP5pZuDrihYuhoiRET7TCFj7jXHdQgZl6Z4WwjsDoxtcLTInR0cNM4uqnCnThHLK2x3oh6DOAXaG+fWI6II71fuNiCQqcvvB2SBzlKdhESFZu4dAFdVgIUNnc1VcHAM5eBtMx1DkrU+pQzOqIucdqpMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716299905; c=relaxed/simple;
	bh=5HmqnqzsCxCFATCFiGYJDXxeivAzpUBsJa0zJPKEjyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGGN+UaLgHCqsdAZFuTJ3CY5j6LTX4tIULuGTpuII/y/jC+0ZwDdYZHNrRrGE1bvCdLTPF00qe4XwaxsFhvyjlSMTDpg2cmenIQsATstGnPzmd1MSZ6I/dj+PUQogEN0YB5l1kj2YY7LyJwpWGuUoEju2P7ariPU9AIpsB0AYBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+PRTIpK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 010D0C2BD11;
	Tue, 21 May 2024 13:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716299905;
	bh=5HmqnqzsCxCFATCFiGYJDXxeivAzpUBsJa0zJPKEjyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j+PRTIpKK8u+UHgOf9az9SySkFMZ+a4n0cu7VdC8zw2I3xA0P4gEK7BKH+rSh15Fn
	 UUlRp5eC1zF7G4eKzbdwRnzs4iIEVN4gnv5cIsEgr0UquISM4cg15xd109f6LyH+/x
	 EMmqw7aQbIkmP2UWcLvDfQEvmIxyKnI0TJX9cOtAO+eyVd3Zd8ztwvkB8otr/dC6ri
	 eTGEyjFVQ4bAngNWO5jddw/L3iKIw51D/KqMfnLKsq/SD4/lCkVJ69N9XBIuBVbyeV
	 TNDPxdX/NmLV0jJYpw9zb39lUMHZw2BtiS9Ng0bs9cFXjeYLs3n2XkMxOPfb23Gn+O
	 SQqDllUEmCL4w==
Date: Tue, 21 May 2024 08:58:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Jacky Bai <ping.bai@nxp.com>,
	linux-gpio@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org, Dong Aisheng <aisheng.dong@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: firmware: arm,scmi: Add properties for
 i.MX95 Pinctrl OEM extensions
Message-ID: <171629989985.3959039.18302222463531901927.robh@kernel.org>
References: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com>
 <20240521-pinctrl-scmi-imx95-v1-1-9a1175d735fd@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-pinctrl-scmi-imx95-v1-1-9a1175d735fd@nxp.com>


On Tue, 21 May 2024 14:25:57 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX95 Pinctrl is managed by System Control Management Interface(SCMI)
> firmware using OEM extensions. No functions, no groups are provided by
> the firmware. So add i.MX95 specific properties.
> 
> To keep aligned with current i.MX pinctrl bindings, still use "fsl,pins"
> for i.MX95.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/firmware/arm,scmi.yaml     |  4 +-
>  .../bindings/firmware/nxp,imx95-scmi-pinctrl.yaml  | 53 ++++++++++++++++++++++
>  2 files changed, 56 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


