Return-Path: <linux-gpio+bounces-11741-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 246509A9AE3
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 09:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0F621F235AA
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 07:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92EF14A084;
	Tue, 22 Oct 2024 07:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHyzakZ4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8955E84A22;
	Tue, 22 Oct 2024 07:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729581904; cv=none; b=LyE2og85QsSUw45Xs1ISzF9gAZnx1jX7NWa23WcOYy366UkF1kq4EVeUDbzpHmguykjFG2c/QI5gRgKydViNg7rrJbyL6SDgHtKt2aW9uVM45MEmfGpl1Plhw6qhYBHb3XC4U9suz3cOX1ePFR/M/puLxEz94UuCN2NVx4iR1V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729581904; c=relaxed/simple;
	bh=ngWS+GIk0+pbFvc76d3DZJxLDNDvzO17fhI2cqNi3Hg=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=quWGNBmUYetJ7iCHeT9G5jEnhywHOPwv47xhMAb8Gj4lQ1C+xrUUBZ6Q0IBQyiZ8MoFnwMioUc/GLWxk7y//7fGOw8HKciww4xYoNoJ/QVyPRp9/0QAG0v3U9Zx6bnuD7Cq1d88VCFnYbm+3yOwJwLFelGuiyq7r/5zFo5jxr+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHyzakZ4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D604CC4CEC3;
	Tue, 22 Oct 2024 07:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729581904;
	bh=ngWS+GIk0+pbFvc76d3DZJxLDNDvzO17fhI2cqNi3Hg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=AHyzakZ406u7T6ByXYEMUa5KHIXi0YdQO8bHVuWgKNsvmobnCJ5GdqcVz5StyCoLc
	 gYe6WaY8Gt3nyH4lAMrTCpiaLmZoaHWJHXA7NLiCa7IyZapfbvogvRTKVIcG7OO8xG
	 liyN/iUp6LOsCH9tBkK4v1hqzabjzNDlPW1t3CpMeucir8NwSXnMdi/OgfoRtmKja8
	 XGtEAd6BSLiKkzzuUHTx5uwYyLjtvDkkA7egmgBxyOXoSbonRY44fm5/wC6vhqIj1L
	 ttjZp4n3dWM+5rmJjYu4uplQ/wKPPDrFGdt9zwtkY+NH5CybgNCdoMGfN1915xjR0i
	 eDpGFft2H9+oA==
Date: Tue, 22 Oct 2024 02:25:02 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linus.walleij@linaro.org, conor+dt@kernel.org
In-Reply-To: <20241022060157.36372-1-himanshu.bhavani@siliconsignals.io>
References: <20241022060157.36372-1-himanshu.bhavani@siliconsignals.io>
Message-Id: <172958190288.3294457.18338479078694309889.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: convert pinctrl-mcp23s08.txt to
 yaml format


On Tue, 22 Oct 2024 11:31:27 +0530, Himanshu Bhavani wrote:
> Convert the text bindings of pinctrl-mcp23s08 to YAML so it could be used to
> validate the DTS.
> 
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> ---
>  .../bindings/pinctrl/pinctrl-mcp23s08.txt     | 148 -----------------
>  .../bindings/pinctrl/pinctrl-mcp23s08.yaml    | 153 ++++++++++++++++++
>  2 files changed, 153 insertions(+), 148 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.example.dts:85.3-86.1 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:129: Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1442: dt_binding_check] Error 2
make: *** [Makefile:224: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241022060157.36372-1-himanshu.bhavani@siliconsignals.io

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


