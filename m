Return-Path: <linux-gpio+bounces-20604-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A11CAC59E4
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 20:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1C418A6934
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 18:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD0E27FD6F;
	Tue, 27 May 2025 18:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKeGzMz3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB4427C856;
	Tue, 27 May 2025 18:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748369288; cv=none; b=IC3UrNrrNd9VYxlSSNVtLmX8xrpD7eygx9y9pTAheb54iw3riYG2xwGbQo1yGAtbGp17dWfR77Bw6MqD7X0Moi/D8ip/J9gaHzEl/z63uU6L2jUUe/AMYA7WjEeYDOFtuFKcccLx1p3t61xhpwlbEfGADRTSR5VjZex8k4zM+Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748369288; c=relaxed/simple;
	bh=AtndP8SC4G+koV9Ua6XlKbU+JTgMbx7diYFHCLztyKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DLBmplbl5kyaOMcSkWzVNOMFFJW2cqm5iRGSwLTIEYFJ668L9LwbHkRde54FGVnVLsSqYXZbxwQiMw3iIexiIQ7R/Gyo0FGtCGrlPejy+uvtqLGVMGsEqz7eQqv2W0yX/y3C3l1wNTAE/tpy/RV4b037mLFqT4DSTvCrLky44p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKeGzMz3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 196BEC4CEE9;
	Tue, 27 May 2025 18:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748369287;
	bh=AtndP8SC4G+koV9Ua6XlKbU+JTgMbx7diYFHCLztyKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AKeGzMz3Xl1muQtURYKPVSZZekmPun2R7ie6FIS3VW6Ao5TtM7JDZFX/YcgSRRCUG
	 +wOwqYwb/27gEP91+2VvFRUWJEvEc/n47XYl68+VI2R5+wgh3phCcZSU1rC1UO6ltj
	 1GpqzP1ZmwUp08DBbwythCOJcwrQ5VC0QveHxdshtcs3bONWwr8DH4Ezj0pvH6v/R4
	 s47jtCwSdAVwC9qmDkQi60AG+6Tc8f2yrSn/Jd7O3EhzarMQd+0nIkHJXVpHRT1TIn
	 lQQMkyJW6qnrwCq9tjbz/IWEEEf2TGEQ3kDkqAYouEbA4QdI88KK+UaiMPeK4JdyVJ
	 qbzPd6793W1lg==
Date: Tue, 27 May 2025 13:08:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: gpio: convert gpio-pisosr.txt to yaml
 format
Message-ID: <174836928454.876591.1783039862927592508.robh@kernel.org>
References: <20250522223742.516254-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522223742.516254-1-Frank.Li@nxp.com>


On Thu, 22 May 2025 18:37:41 -0400, Frank Li wrote:
> Covert gpio-pisosr.txt to yaml format.
> 
> Additional changes:
> - Add ref to spi-peripheral-props.yaml.
> - Set ngpios max value to 32.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/gpio/gpio-pisosr.txt  | 34 ----------
>  .../devicetree/bindings/gpio/pisosr-gpio.yaml | 67 +++++++++++++++++++
>  2 files changed, 67 insertions(+), 34 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-pisosr.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/pisosr-gpio.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


