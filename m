Return-Path: <linux-gpio+bounces-27625-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3B8C0BF61
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 07:29:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35B4C18A1D45
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 06:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CF52DC764;
	Mon, 27 Oct 2025 06:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="n0j7N7FJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046479478;
	Mon, 27 Oct 2025 06:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761546588; cv=none; b=IFzgLiAVOq36OPp4Qxzcz+ArWYl1SmVeI0wdA90He1Pii66KOcvQ9seLFC59HvkrVDOpF5tQ5p0TVth+JN84ON6Fm59NVhvw1XlMqZlaBlOGR05HnufL5VD6SKZ3LJl0TPMkdbRrF49Wok1OoHhxnVAIJxgYww9FP0wMDajizjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761546588; c=relaxed/simple;
	bh=XS8ZnEwdbQODkBHko60VhtHUEJoqWmqerTpuGZZqeiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ssu2CRMlYnCpLsG1OHkMSaV2g+WYkGr3k6W4rRjnIpZ2gI0SOBU3OSIHfyzp0l5mcqyL/UhgngMoM/E0dbxqvm9ngfahYoINMG0EhpcQD6REioe8YFrRY8ij6XwiWZrBnt5bptqH+oubS4YykWFWCVTjt3rH7qXKlbRZ3KBS51I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=n0j7N7FJ; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=eqJupTdcDojOK89eT/aIAQqr2PcKIEXCUk/EMlsfH2Q=;
	b=n0j7N7FJI74lCIGUQi/fNgw+ZTUV+bvQju90w5OCd6qiKMrcjsSDiEDAvsoD0X
	Pn8gjf6StxSTQkUqfQ8RlGks3kJPk1hc7chiKk/HFmsDSGuHz54UqpMvdv2mwDga
	YGRJc8XAthCCMRBPdKbW8u0/4OMYRfPUZSuyfTCf8zvCA=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with UTF8SMTPSA id Mc8vCgCXD3g0Ef9o01E_AA--.50644S3;
	Mon, 27 Oct 2025 14:29:10 +0800 (CST)
Date: Mon, 27 Oct 2025 14:29:08 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v6 8/9] arm64: dts: lx2160a-rdb: fully describe the two
 SFP+ cages
Message-ID: <aP8RNOVUVEUJKPIb@dragon>
References: <20251014155358.3885805-1-ioana.ciornei@nxp.com>
 <20251014155358.3885805-9-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014155358.3885805-9-ioana.ciornei@nxp.com>
X-CM-TRANSID:Mc8vCgCXD3g0Ef9o01E_AA--.50644S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU29NVDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNRZr0Gj-ETZ6nAAA3O

On Tue, Oct 14, 2025 at 06:53:57PM +0300, Ioana Ciornei wrote:
> Describe the two SFP+ cages found on the LX2160ARDB board with their
> respective I2C buses and GPIO lines.
> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


