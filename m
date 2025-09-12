Return-Path: <linux-gpio+bounces-26076-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F69B55168
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 16:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F4737C48F1
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 14:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9D932A819;
	Fri, 12 Sep 2025 14:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dwQWORoq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DC530AAC1;
	Fri, 12 Sep 2025 14:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757687036; cv=none; b=GQVpU2GtV5bOGF7fxGyfOV+gjLhSlg0/QyKSK7aY2Pv1wBjRTubbRLgX3YutClKj+tktSM1/Jd4E+19IjsKyRIgDqktxRGRcjq2UO5k0fKh0E6Vm2Tpr+D23GG++DiYPlTzE/v349o8hCsqwf0cMQ6V6JbT/6wz00oswhEAEM3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757687036; c=relaxed/simple;
	bh=NFv/yYr1KOxreJRPTaFPS6HpBuZ76BcfhaKQEMHG2H4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=biv6t/78ZWsiZf3ny3mWXbhWFImmkJBr0ScGPJNAkxqbPq33Ouww9lhl81Biz6RrDhuvbRey/BY5HxCpzssIwxwyULqZIqeS7l8QRj7bxv0mmfCnN/VZ8G5AlGmWkdNPL+xmGGv1JJGOzelRFs3Uo1JW9rZuq1JsNTa3on6VPsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dwQWORoq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88439C4CEF1;
	Fri, 12 Sep 2025 14:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757687035;
	bh=NFv/yYr1KOxreJRPTaFPS6HpBuZ76BcfhaKQEMHG2H4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=dwQWORoqLKX7hCzuvdQ6m1qIZ5eGYlNfV4cHStnVnbsoDt/iiQzrRVkbLyL1QExuU
	 699F7UYbQ9CypuGbnco47riN7D0rVCBBEQuQVNb9daHtErb5xnfxyTL02+vHLrAtcW
	 AdlUQpVqLeGTEFDYn3ywOQVT8O014qmNuqsFLym9EyONKxCOL05n2jqcxVLphWwGjp
	 DuhHoK2pFnqmrM+B41gnTHSBtBwVfaWYyo6CUG4nIsHVDM2bq+v/nIqhmhvfJIacIl
	 UwlSA8seNolE70FB/mLjtrRF2G5jXr22Fsk7MP5AW/lpBziBWe/uaKTLNFmSO6Vs/9
	 qPz+IPF6X8H4A==
Date: Fri, 12 Sep 2025 09:23:54 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 cix-kernel-upstream@cixtech.com, krzk+dt@kernel.org, 
 linux-kernel@vger.kernel.org, conor+dt@kernel.org, linus.walleij@linaro.org, 
 linux-arm-kernel@lists.infradead.org
To: Gary Yang <gary.yang@cixtech.com>
In-Reply-To: <20250912060650.2180691-3-gary.yang@cixtech.com>
References: <20250912060650.2180691-1-gary.yang@cixtech.com>
 <20250912060650.2180691-3-gary.yang@cixtech.com>
Message-Id: <175768614788.1334014.18023232974115676473.robh@kernel.org>
Subject: Re: [v2 2/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl


On Fri, 12 Sep 2025 14:06:49 +0800, Gary Yang wrote:
> The pin-controller is used to control the Soc pins.
> There are two pin-controllers on Cix Sky1 platform.
> One is used under S0 state, the other is used under
> S5 state.
> 
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> ---
>  .../bindings/pinctrl/cix,sky1-pinctrl.yaml    | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.example.dtb: wifi-vbat-gpio-pins: pins-wifi-vbat-gpio: {'pinmux': [2816], 'bias-pull-up': True, 'drive-strength': 4} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250912060650.2180691-3-gary.yang@cixtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


