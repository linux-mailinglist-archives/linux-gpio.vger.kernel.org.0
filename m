Return-Path: <linux-gpio+bounces-23326-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C2EB066D0
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 21:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A71AD565D58
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 19:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD5D2C08B1;
	Tue, 15 Jul 2025 19:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DWmUVlhE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861AC2C08A8;
	Tue, 15 Jul 2025 19:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752607650; cv=none; b=JwkDAhg8kH6oYMeDu851nNmqGjQm4hizyi2PUU+uCvUuBoHPMLPVMtB5cCHWZ+6ahpxazfFl78c46+dR+MastAzaRfs0CH6jwO4qHagQ5D1Qu1R0h/lZT/++V7WHMBQRPv64218LfL4jx1Rg05DCBTLa9dX6OOszu+kMpEsFpTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752607650; c=relaxed/simple;
	bh=UbAz1GqPVvCjtUr3XivrE0+yy9OlU1DgIFHCkoZr2F0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=iEDg9d/AB+VDmTAltKThXavbKhxG9HtS5Tr9sd4WSt34olU5PnmbYqhALatIx4DxIIuqUk61fVWAEQqfpxUWe1swlPNxSW3CV2zJDx1L+iuG8ZHhrMYYPUa6FykrLib3mG0DhS5qJF9DJeGYKef9DcBkb37BNa1pFRBbKgHAlMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DWmUVlhE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F34A6C4CEFA;
	Tue, 15 Jul 2025 19:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752607650;
	bh=UbAz1GqPVvCjtUr3XivrE0+yy9OlU1DgIFHCkoZr2F0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=DWmUVlhEJyTIhNNbNXoknPcCv2JgREt9aBxfurJLY4Vsbppejc2iAUgwwBTsoPo5u
	 d/kjQb5dyNwV6rrvH0kwg8WgQEO5VeqXoxKNK0Et0Fh+5kR7WgGvZdj/NilYVnhJxC
	 eeJNk6QS2PrHWVP/uy4yvmHY8J1UoCkif087b1CP458dRS70h0Y1FDrfCKVIxehnbD
	 xzzSKZlvHu1fCmo+HbWI/CIwS6/sxhSFDXy4dCFpB/NP/mhwe4N9zKNZShwE5A6FS0
	 YN9Y9h33vrEXr4PhdEgV7c/GOstOLow4YE0uyFj+qSNB9An+R8TzZDxagsHV8EIaYc
	 diKnQUjHhcj/Q==
Date: Tue, 15 Jul 2025 14:27:29 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linus.walleij@linaro.org, 
 linux-gpio@vger.kernel.org, Will Deacon <will@kernel.org>, 
 florian.fainelli@broadcom.com, krzk+dt@kernel.org, svarbanov@suse.de, 
 wahrenst@gmx.net, iivanov@suse.de, conor+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, mbrugger@suse.com, 
 devicetree@vger.kernel.org
To: Andrea della Porta <andrea.porta@suse.com>
In-Reply-To: <97c650c9967c0c3381c383dfe68bbe6966912604.1752584387.git.andrea.porta@suse.com>
References: <cover.1752584387.git.andrea.porta@suse.com>
 <97c650c9967c0c3381c383dfe68bbe6966912604.1752584387.git.andrea.porta@suse.com>
Message-Id: <175260764914.1776969.16903839575056957261.robh@kernel.org>
Subject: Re: [PATCH 1/7] dt-bindings: pinctrl: Add support for Broadcom STB
 pin controller


On Tue, 15 Jul 2025 20:31:38 +0200, Andrea della Porta wrote:
> From: "Ivan T. Ivanov" <iivanov@suse.de>
> 
> The STB pin controller represents a family whose silicon instances
> are found e.g. on BCM2712 SoC.
> 
> In particular, on RaspberryPi 5, there are two separate instantiations
> of the same IP block which differ in the number of pins that are
> associated and the pinmux functions for each of those pins. The
> -aon- variant stands for 'Always On'.
> 
> Depending on the revision of the BCM2712 (CO or D0), the pin
> controller instance has slight differences in the register layout.
> 
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
> This patch is based on linux-next/master
> 
>  .../pinctrl/brcm,bcm2712c0-pinctrl.yaml       | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/pinctrl/brcm,brcmstb-pinctrl.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/97c650c9967c0c3381c383dfe68bbe6966912604.1752584387.git.andrea.porta@suse.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


