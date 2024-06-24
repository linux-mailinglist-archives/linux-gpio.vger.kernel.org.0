Return-Path: <linux-gpio+bounces-7655-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B3491584D
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 22:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBFB3B2239D
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 20:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB38B1A0710;
	Mon, 24 Jun 2024 20:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SBxgbgAE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545A945010;
	Mon, 24 Jun 2024 20:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719262553; cv=none; b=nmsYuNfXyJCR9mW1mRVDuuySQV1p098y7elJVWzrrp44arCY5gruAM9pUB5VVQOW6tV2rK6nFOqLxxxswyhlK/mn61CFsfHKHDOP0kfg/r4l95rSmuHj9JjgQOu235a4PaO+XDd4Be5ecOHTJKgplGQJ8hEoQtP14JCsf9Gukzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719262553; c=relaxed/simple;
	bh=VWZUaMzX5Qio8eVf2ACkTHR2Gg2exUglIbOvPvij3wI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/2jRc4eJlpaDMIsKQWckcun72gxs4qPykViqmteDfdSIhAqS/Nf4ELOXrRLo9F9heUEMsAE2agyO66QFCTpnhJcjE5wZXliAURNzGt5UCjv6UO1ekowe7aMYuGRNuWtDHalUbKtEV3l7Sqqq1V+t70sctdPh3JmuymS7G8BsoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBxgbgAE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8AFC2BBFC;
	Mon, 24 Jun 2024 20:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719262552;
	bh=VWZUaMzX5Qio8eVf2ACkTHR2Gg2exUglIbOvPvij3wI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SBxgbgAEfJWQKngInYfmNSWbfEo4ph7HMHEYbnXY1yYEqG6GZvsJv+rYw0LL97UhE
	 H2oIITR2X77VfdJDJQa7z1DyDY8FHL93FpjOGnkQgdN8MAW52oVAEMYmgU47qgp0x+
	 wDW4SORstsHjEfVQFeW1xmCSP8Znphnt6Q41IplGvYRMqBlcqqBW61tRntSfKQ2V3o
	 2tQGHum+CrwNWqaLHj8bvhcMmUn3swLRKUIvcNmomiHc/T1E9djPOVTBrBXIhM5Emm
	 Y9miKw+XSrObnHVL5jdrFcM9dU3kZ9HNxRZwGsb3ZivrbL5lguj9JCDEHW+x2ve4NN
	 Zc+nXpESeu2+g==
Date: Mon, 24 Jun 2024 14:55:51 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Lee Jones <lee@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	linux-gpio@vger.kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v3 1/9] Revert "dt-bindings: clock: mobileye,eyeq5-clk:
 add bindings"
Message-ID: <171926254915.403186.10352088009707402076.robh@kernel.org>
References: <20240620-mbly-olb-v3-0-5f29f8ca289c@bootlin.com>
 <20240620-mbly-olb-v3-1-5f29f8ca289c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240620-mbly-olb-v3-1-5f29f8ca289c@bootlin.com>


On Thu, 20 Jun 2024 19:30:53 +0200, Th�o Lebrun wrote:
> Switch from one sub-node per functionality in the system-controller to a
> single node representing the entire OLB instance. This is the
> recommended approach for controllers handling many different
> functionalities; it is a single controller and should be represented by
> a single devicetree node.
> 
> The clock bindings is removed and all properties will be described by:
> soc/mobileye/mobileye,eyeq5-olb.yaml
> 
> Signed-off-by: Th�o Lebrun <theo.lebrun@bootlin.com>
> ---
>  .../bindings/clock/mobileye,eyeq5-clk.yaml         | 51 ----------------------
>  1 file changed, 51 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


