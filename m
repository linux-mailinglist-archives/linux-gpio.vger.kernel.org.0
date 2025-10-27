Return-Path: <linux-gpio+bounces-27623-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B2BC0BF40
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 07:27:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA2E33A3653
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 06:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF2E52DC33D;
	Mon, 27 Oct 2025 06:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="TKTTrNlH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1792D94BE;
	Mon, 27 Oct 2025 06:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761546418; cv=none; b=WQtscfkKcdXhh66msXqdh3pwpFseg7btgLPGhiaaM1dto2SR4pa3Ea44o8jr64KZ+TpZzESUZY5Vo+e4YSc7PUXS0F+bBs4hLWs4kTQg0PC3HiV+tDIi6hWgTZjzUnfKeVF/BOnU6MUgaDv5BiEqMN2qJWWtTiE4rGdOKpMjGSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761546418; c=relaxed/simple;
	bh=HYWkmt3LCPdE9n17oEOvzOhX1Ae4vU8uAWLnveHqqC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTifZHKQEgklEDXpByBWAS2eHZgFk2M8l9Vu9HvAqCMNynqigUZeedy+uSkB0XRcFDOQ0GXJElD12iJdnXHissVtKTPCWeWzDN8Pbp4injzL0QBWonhpO3ewBRY3c50Rf8bdYbMeMeJhU1UMqDw3QTYBm5+UXRSe/sFOC4wFzgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=TKTTrNlH; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=CmB72yubslbZXj8R2X1Bdm4JAwibrDYd8xNkh45tUaU=;
	b=TKTTrNlHNchd5mbbe/gEWwLHIFAfZ3MvCt9+y03jNixpkRH59d4/k33Ap/x358
	7NssfSFTnDfcJv9qZ7NbukOgg7Se8Pz0yhWKKQeR1c5jOPlRHlcIvbGYKF/oNjPo
	S0o9obahp/+lxg4MVVG7nqST4CpT+/as291aLds4FxENU=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCHTyCMEP9oq0y6AA--.3282S3;
	Mon, 27 Oct 2025 14:26:22 +0800 (CST)
Date: Mon, 27 Oct 2025 14:26:19 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v6 6/9] arm64: dts: lx2160a-rdb: describe the QIXIS FPGA
 and two child GPIO controllers
Message-ID: <aP8Qi6n2Tac_mQp2@dragon>
References: <20251014155358.3885805-1-ioana.ciornei@nxp.com>
 <20251014155358.3885805-7-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014155358.3885805-7-ioana.ciornei@nxp.com>
X-CM-TRANSID:M88vCgCHTyCMEP9oq0y6AA--.3282S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUO7KIDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRTzZWj-BPkuXAAAsT

On Tue, Oct 14, 2025 at 06:53:55PM +0300, Ioana Ciornei wrote:
> Describe the FPGA present on the LX2160ARDB board as a simple-mfd I2C
> device. The FPGA presents registers that deal with power-on-reset
> timing, muxing, SFP cage monitoring and control etc.
> 
> Also add the two GPIO controllers responsible for monitoring and
> controlling the SFP+ cages used for MAC5 and MAC6.
> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


