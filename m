Return-Path: <linux-gpio+bounces-11002-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DC79938F0
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 23:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B36B5B22B16
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 21:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32CB51DE4EE;
	Mon,  7 Oct 2024 21:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pTFWnH27"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACDC320F;
	Mon,  7 Oct 2024 21:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728335911; cv=none; b=kf1Ds2GADFJf1+QMDYtB0Fmyvcz4j1hi1Z/XjkBSWe+iv38a+bXPvjmdPM+yMN8vzI7WZgN3Wt3Gtw8H3t/pAQosW6Tv/zkSPA/sd2dS+U9rhSeNt3RmP7hMfL7u1Y2NwxrCYWKOISw713ElJpyScI1b40V30cOWB9J2ZUkPOUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728335911; c=relaxed/simple;
	bh=HrN67y6Cy1Pyc/S6hivHO4mRSYQ/s+XYFkTpBAfO33A=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=SH6YRyNP+hpwwFW7xfAbu/GFzdRnURKrCWj33B9MuavHS/M5ZGJr7LeOHOv6WG+kl/pbXrLssSDeUsfETky+T/ACPWxBrP0R6G4g2Ck2K5aGBtoWLn25VGqoOwHAvOxi68LyVb+umnFWhfaLcTWCCoqk72v67E+ixuXxJjllpF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pTFWnH27; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B25CC4CEC6;
	Mon,  7 Oct 2024 21:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728335910;
	bh=HrN67y6Cy1Pyc/S6hivHO4mRSYQ/s+XYFkTpBAfO33A=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=pTFWnH27DhMY9xXoJsniYDjNAAEsXRaLBHmDDr8Ic5uzQ/sccd2e7YNNFSygEeOOB
	 +C6XDOwwBVzzfOJdo1Gmy7Sn9wr8b2+Xbr7+gZl4d+2cOGhr3mElQOtViRPsz7p+J3
	 3I+URejXY5DpbxBL1yIyojaRpdKOVoHP8NHZF38t1WLz/6N2C8G4xVvsj4sxVmaWgC
	 5ovAQi4n4+vmPpNKHUsPdVY9D9wA4EMzywqhF2qoPdd4RRWmdpcdAAfa4BiLHiNW59
	 MdvALtquDMghJLamdHBOwmNa/yslJBfr3eNyhwnZiNXQL/vEhygu3QFfY5rCJABezk
	 I8DzbN6tfVv6A==
Date: Mon, 07 Oct 2024 16:18:29 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: eladwf@gmail.com, Linus Walleij <linus.walleij@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-mediatek@lists.infradead.org, 
 Frank Wunderlich <frank-w@public-files.de>, daniel@makrotopia.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
 ansuelsmth@gmail.com, Sean Wang <sean.wang@kernel.org>, 
 linux-kernel@vger.kernel.org, john@phrozen.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241007203053.72862-4-linux@fw-web.de>
References: <20241007203053.72862-1-linux@fw-web.de>
 <20241007203053.72862-4-linux@fw-web.de>
Message-Id: <172833590964.2590037.11713747544689826039.robh@kernel.org>
Subject: Re: [PATCH v3 3/4] dt-bindings: pinctrl: add binding for MT7988
 SoC


On Mon, 07 Oct 2024 22:30:44 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This adds bindings for MT7988 pinctrl driver.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> changes in v3:
> - limit conf subnode name with optional suffix like mmc on mt7986
> - match mux subnode without wildcards
> 
> changes in v2:
> - drop gpio-cells description
> - move ref in mux subnode up
> - order uart-functions alphanumeric and fix typo
> ---
>  .../pinctrl/mediatek,mt7988-pinctrl.yaml      | 569 ++++++++++++++++++
>  1 file changed, 569 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml: patternProperties:-pins$:patternProperties: '^mux$' should not be valid under {'pattern': '^\\^[a-zA-Z0-9,\\-._#@]+\\$$'}
	hint: Fixed strings belong in 'properties', not 'patternProperties'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241007203053.72862-4-linux@fw-web.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


