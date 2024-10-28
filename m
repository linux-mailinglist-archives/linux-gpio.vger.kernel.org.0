Return-Path: <linux-gpio+bounces-12196-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C949B2966
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 09:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C22551C21980
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 08:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E181925B4;
	Mon, 28 Oct 2024 07:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LtcYpO0a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C321922CD;
	Mon, 28 Oct 2024 07:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730101017; cv=none; b=ACIJSikRMg5qFbShOR0TZz4AONX/g3Ota/Besj2bMLZy/UvjWByFrULSIxhhOCeN8tVGG/tX4xeeFLOthNaAee74aqjPnE/S8zA6/114wgJpIYd6uYnnf2Cx6IKYWMLF70pFjVB8rZLJMp9o5P15/x/dZ1GOsdPDiU91kT58VBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730101017; c=relaxed/simple;
	bh=C8jzd03PT7TBnleSW2b3mkmpjRFkk1JQWJOGmJ6JBHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P55nBMVcQ0RCtB0HeuWG4EI8F8552atLicPomCPsrMXanYGronum+XeNUTBRuElDkDe4Bh113xmKpJ47tBsDtK1Unl2H+nVK7KrLgW61OCamF198Dn5EIJ0YA69sZajPT27qH719zBZuS4maxVL/Vsttu8eTmp6w39aR+hq3S+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LtcYpO0a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 809DAC4CEC3;
	Mon, 28 Oct 2024 07:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730101017;
	bh=C8jzd03PT7TBnleSW2b3mkmpjRFkk1JQWJOGmJ6JBHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LtcYpO0aHbfPPpU6JOxrB0QOqE7WkvgEvHsDBvWGuIQWZb74ZXs2m7PXcvWcW/pCQ
	 SOtK++YJLVOs28akn0bliE2QXHR2lUBwJ7x0bT8eeUwKufL+X5utlWVsPakegAMhOd
	 cizfcDzQjgxSJ45YlNAa9K33QgQF7tDbCDuAd23uqjBhg1OgrrrYRb6U9UgaxNGeo9
	 YPXRwMfvnEC/RmWgga+sSV//YS4j9TG9onTGDeZGZl97PP/86f21alkTnt2noXde0D
	 15CLRsHEG0rzvZi30a+Plsp5GhNEceBHSOtaA+mSBBTJ/kWt3fm6ibPP/w3QZ8aqyI
	 CGoMNbNDOI4mQ==
Date: Mon, 28 Oct 2024 08:36:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	tarang.raval@siliconsignals.io, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: pinctrl: convert pinctrl-mcp23s08.txt to
 yaml format
Message-ID: <h2trxxyutkkbubjz572e57widjfce7y3n2dixnkciavbtw3isx@cmuc5y6yqrrt>
References: <20241028063939.6276-1-himanshu.bhavani@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241028063939.6276-1-himanshu.bhavani@siliconsignals.io>

On Mon, Oct 28, 2024 at 12:09:11PM +0530, Himanshu Bhavani wrote:
> YAML binding file provides the conversion of the original text-based
> binding for the pinctrl-mcp23s08 to microchip,mcp23s08.yaml.
> 
> following compatible strings using the deprecated mcp prefix have been
> removed from this binding:
> 
> - mcp,mcp23s08
> - mcp,mcp23s17
> - mcp,mcp23008
> - mcp,mcp23017
> 
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

<form letter>
This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
</form letter>

Best regards,
Krzysztof


