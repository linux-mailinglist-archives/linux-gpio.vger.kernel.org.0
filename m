Return-Path: <linux-gpio+bounces-11733-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF1F9A99B3
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 08:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F15EF1F2198D
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 06:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F812136E0E;
	Tue, 22 Oct 2024 06:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="SuwUto3i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34AC21E495;
	Tue, 22 Oct 2024 06:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729577848; cv=none; b=cN6Ws5vfd4XtvppqeNwmWJeKclI1EpBW3txhGpCKpZ2caOwtHqMHunSKOtIz+aLjro1/HeDxAFlI2H8Xr92Xn+2/QumqHYhiBWepduSZXrgp2grdlUdLFrUImMoa4J1CcAJ1y9/GvUydfbHzgqHnhfRGqJQl8hHV7oGshA7RFQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729577848; c=relaxed/simple;
	bh=h3InVI4qFK55P4L7wHq1injg5MD9zqKZJYcTogdFIeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lGH1Uarm5wVPBdU4TYrlNrydq63jLcD+zsSyqfhx9//mBMBqaegwOyZciTgZCweGdZMqTlsvncH5lvO7pVf4RxWeACnsVR10Ao8ZyaQ/C4WUtdv/OX/51Nryc+2UPr6pORnOWEx273SC0oSBcBBlAQhMf5qdBVP8lLqg3icD+bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=SuwUto3i; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=h3InVI4qFK55P4L7wHq1injg5MD9zqKZJYcTogdFIeE=;
	b=SuwUto3i8XkFrXD8TDh9txIufyXu31OxY6FIqdnP6b57TkWqZ1Emx5lo/gXQfw
	E0f8WQaEhCbRZI4f31GUaq44kTkUbKtnfIDP9lTXdmtOEgl55l7zEE2k/v8eWfDX
	OUSGHK+ve8P6IXhh8ML1CFg0S8H7+2jHIhOJOAFdBxHTo=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3H6w9QxdncfWVAA--.5441S3;
	Tue, 22 Oct 2024 14:16:31 +0800 (CST)
Date: Tue, 22 Oct 2024 14:16:29 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Stefan Wahren <wahrenst@gmx.net>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	kernel@dh-electronics.com, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 01/12] dt-bindings: pinctrl: fsl,imx6ul-pinctrl:
 Convert i.MX35/5x/6 to YAML
Message-ID: <ZxdDPSI4i/nRawlw@dragon>
References: <20241017211241.170861-1-marex@denx.de>
 <ZxcbHb5v05+XhFnM@dragon>
 <6eb23f6c-fe0c-4ee1-8f99-568041524073@denx.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6eb23f6c-fe0c-4ee1-8f99-568041524073@denx.de>
X-CM-TRANSID:M88vCgD3H6w9QxdncfWVAA--.5441S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU3J5rUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQGAZWcXARTPXwAAsA

On Tue, Oct 22, 2024 at 05:52:08AM +0200, Marek Vasut wrote:
> On 10/22/24 5:25 AM, Shawn Guo wrote:
...
> > I'm not sure it makes a lot sense to have "fsl,imx6ul-pinctrl: " in the
> > subject prefix.
> I can change it to imx-pinctrl or something and send V4 , or can you tweak
> it while applying since the series is somewhat large ? Which do you prefer ?

I expect this binding change go via pinctrl tree, so it's up to Linus.

Shawn


