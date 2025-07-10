Return-Path: <linux-gpio+bounces-23113-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC37B00E72
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 00:04:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10D4E3A6F90
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 22:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22CDE2949F6;
	Thu, 10 Jul 2025 22:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jU7cErl5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB02292B3E;
	Thu, 10 Jul 2025 22:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752185079; cv=none; b=hdZC9XRNuLHTPe7/ZYQZKzX1JPpVtpRsG/UtzZrSKbQ/AqdKPp9YgXwTqjZzleTQAcdVypeF6w7evjXT81vUey1atdXCp9sUR56caXc/CPYO4Qd2KPtPQ7RURKWb82oM48k3djxoq0G0ZuPSZ2d/Xgp4vXmSvNTOomg8nD+fc+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752185079; c=relaxed/simple;
	bh=OEb03LJtTJw0ONEHHTG78Zyys2/QnlVxenFbD3godfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idvx78cbEpZQTkn69ZUwDXavc90vs0IBVqGFCV+mbCh+7Dt8KReQVaDvUnvm1yf5LJUeyeL5YHYhj4vLc5oCvLGOTEKXVaotwR+Guq/8C2g+zICljsIslJ/EofL9uhAskfSxqGhSWJqOCQp3i/qd07nMZXOURQyKAFV/H7CWhYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jU7cErl5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426FCC4CEE3;
	Thu, 10 Jul 2025 22:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752185079;
	bh=OEb03LJtTJw0ONEHHTG78Zyys2/QnlVxenFbD3godfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jU7cErl5Gpt+790hNyABbyqH2l7NZnhgjCIyhAanTgMlvGnvvyvCp8blVM8ICHzeq
	 ZA9p9vb42SkHA2jT3v6k1Yf8PVWOe77GhdMh33rLlu5WSSjAf6B+zaAAQKzgXqjv6q
	 rLRrdgWFcwnt5EGN+yc85g3Yv/HPrbCux+ui5apPxf8520+M+rCakCS+PXWXv7jxn2
	 nHZEkAeaGNK7PppqymaicEi5WqouEZY2AC/B+ASt6KKiAK1XD62ZIa1avctnrQlLOH
	 SaUxmfzrPaQWM4ZzHtpVCWnFdvJx6++URYrFWwI2pTpqlR2dDdWLyf/pwBNnrtvFDm
	 RkWsByUc1Vc9Q==
Date: Thu, 10 Jul 2025 17:04:38 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 2/9] dt-bindings: fsl,fpga-qixis-i2c: extend support to
 also cover the LX2160ARDB FPGA
Message-ID: <20250710220438.GA4046565-robh@kernel.org>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-3-ioana.ciornei@nxp.com>
 <c8ddfc31-95a5-4879-b392-18b915095b5d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8ddfc31-95a5-4879-b392-18b915095b5d@kernel.org>

On Wed, Jul 09, 2025 at 02:17:27PM +0200, Krzysztof Kozlowski wrote:
> On 09/07/2025 13:26, Ioana Ciornei wrote:
> > Extend the list of supported compatible strings with fsl,lx2160ardb-fpga.
> > 
> > Since the register map exposed by the LX2160ARDB's FPGA also contains
> > two GPIO controllers, accept the necessary GPIO pattern property. At the
> > same time, add the #address-cells and #size-cells properties as valid
> > ones.
> > 
> > This is needed because when defining child devices such as the GPIO
> > controller described in the added example, the child device needs a the
> > reg property to properly identify its register location.
> > 
> > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> > ---
> >  .../bindings/board/fsl,fpga-qixis-i2c.yaml    | 35 +++++++++++++++++++
> 
> So here is the board? Why FPGA is in the board...

This directory is for board level custom logic in FPGA, CPLD, etc.

Rob

