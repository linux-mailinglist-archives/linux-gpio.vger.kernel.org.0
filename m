Return-Path: <linux-gpio+bounces-26514-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F37B9323A
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 21:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A7AF1907891
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 19:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4332F5308;
	Mon, 22 Sep 2025 19:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eq3Hhmzz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633FD18C2C;
	Mon, 22 Sep 2025 19:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758570635; cv=none; b=MDwEwwZUNjEyJlSBNpZ61PD52iWpqc0OvqiiDF4ikQIcCcOynziwV4YEe9pjj9O+4ZarvbDkP52StJmPzowVDo9jQRcnUBvD3QF6WEJ9lnMQ9E1CsyRsa7a4CvW7sqBVZreY1UZcQFoZjKQ8zesdjf7pSany325Rzh/845PVwLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758570635; c=relaxed/simple;
	bh=JgLQHFBkmZ+S8gkaMiPw+41o8BKwW0HfdBhWNAIaIPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qcw4Vtr7Gil6S6EgnjRxSOMJ1jBfSFUu1h6xdhfgHla8QW65zz5MjjdaZmrt1ZPKbL8Wk+cUD9UpXZQUZ8pjTq05+A4nhbMi5bRm7MC2NtH9rUvRyRPSGOK9Wpb1R1jR+3XcOXW8TrzSyRpeEtoq5qAxgatfOF1UsumgLDYJoio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eq3Hhmzz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A65E2C4CEF0;
	Mon, 22 Sep 2025 19:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758570635;
	bh=JgLQHFBkmZ+S8gkaMiPw+41o8BKwW0HfdBhWNAIaIPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eq3HhmzzMi36uwfqkhClHjhpl+S9BA68fd5sFhlPgUAeZrY96QuYy9gxImTYMUfiv
	 CGEtyjX2PmHYJ6c2q06VCVw+j4p7UhZ4wlb1UzfitdnwdQ2bHZajnTC28wPeS+D7Yu
	 bD953/e628+SHiat6Tk1L+Afea5w3wUqs/DJDXdVhZYjDkP9VZQST99QGxd2LXbZ1G
	 hYl8j1MyYblb4OWFip8qjYNIBJGA9jeBRCmW6Ab+XOgzII/uLqe7GUD2Lt7UheqQAO
	 ZfShDqsaVm3AadRLs1xGvb+31G0ZFJVeDCOGQa7DxbIBKzF7liiwHXiUrEE85he7Ql
	 42vUx85UYuJTg==
Date: Mon, 22 Sep 2025 14:50:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Lee Jones <lee@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 03/11] dt-bindings: fsl,fpga-qixis: describe the gpio
 child node found on LS1046AQDS
Message-ID: <175857063304.1062079.93303890842024200.robh@kernel.org>
References: <20250919132515.1895640-1-ioana.ciornei@nxp.com>
 <20250919132515.1895640-4-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919132515.1895640-4-ioana.ciornei@nxp.com>


On Fri, 19 Sep 2025 16:25:07 +0300, Ioana Ciornei wrote:
> Extend the list of accepted child nodes with the QIXIS FPGA based GPIO
> controller and explicitly list its compatible string
> fsl,ls1046aqds-fpga-gpio-stat-pres2 as the only one accepted.
> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
> Changes in v3:
> - new patch
> Changes in v4:
> - none
> 
>  .../devicetree/bindings/board/fsl,fpga-qixis.yaml      | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


