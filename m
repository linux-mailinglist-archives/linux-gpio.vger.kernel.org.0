Return-Path: <linux-gpio+bounces-29621-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D69CC426C
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 17:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BAFED3040175
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 16:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9F6238C03;
	Tue, 16 Dec 2025 15:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tEpMjfb9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544A73BB40;
	Tue, 16 Dec 2025 15:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765899857; cv=none; b=mVqmc2o8lTS3hZ3gQu0mV44mSZpusKHpmWxCshaSHE66EGy/QC3nYV0LmnybZkQq5JGlmVrYSkw90pyvadPZkvV2n+KmJbrapdAiTSqHBDn2TYPNByq9+BFgq6ooJ22lxt/z08q7FvI0hnOgDJWmA4khmm5T3B973KSAvym5qco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765899857; c=relaxed/simple;
	bh=5FCtWKu4gSPyAonL0m0zznCMC+guvfyTLTTvXhmL8WA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=DzETxUse4AjaH/YYTwaMt2a332tJzPxsyV+0G0bEYBCIShTES85RKyRUYZGoWlW3Hs1vqQvVUOLK23/voJ7ygpdgZVXqw5IeBepJ0I/9ZNaUJ4KvRuDQ+OnV/V5iBWnP/wWvHG+PkjljiUvCAERyqqVyL1XqA++AZpzE5e0iyhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tEpMjfb9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04171C4CEF1;
	Tue, 16 Dec 2025 15:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765899857;
	bh=5FCtWKu4gSPyAonL0m0zznCMC+guvfyTLTTvXhmL8WA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=tEpMjfb9GWfRRhPdxOIJMXHcRFAHwmC7zhL96Uu8qx+M2D5EHDd2u+y/zwoW74rGe
	 a+SfB0xzOdAeadMTQS8OpzypNzOht01ZAYy32TC/Iz6Zaggmb+SoUuUmjCoEb+V5GT
	 ujjHqPWYedSwPL8BzcEI5ld5JWY6+fNI5QudhFaFFaOeOlWkXWRJCUKtVR7ppwKjCa
	 4HFpl7pukWPYaakGCP1dm7fFBWJm0S/4IhrOlpi+5wRXoihqlmP57YKVLNI6EaFG8Z
	 7hRKt/L6PHHmmeGK04QfhfvKpJHt0vFmQlggIhNJRM0/pP7eofupAaJ5aJlXcsMih7
	 8f5OwD87pRvCg==
Date: Tue, 16 Dec 2025 09:44:14 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org, 
 tao.huang@rock-chips.com, Linus Walleij <linus.walleij@linaro.org>, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>
To: Ye Zhang <ye.zhang@rock-chips.com>
In-Reply-To: <20251216112053.1927852-7-ye.zhang@rock-chips.com>
References: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
 <20251216112053.1927852-7-ye.zhang@rock-chips.com>
Message-Id: <176589985437.2528677.5118158763336562885.robh@kernel.org>
Subject: Re: [PATCH v3 6/7] dt-bindings: pinctrl: rockchip: Add RMIO
 controller binding


On Tue, 16 Dec 2025 19:20:52 +0800, Ye Zhang wrote:
> 1. Add header file with constants for RMIO function IDs for the Rockchip
> RK3506 SoC.
> 2. Add device tree binding for the RMIO (Rockchip Matrix I/O) controller
> which is a sub-device of the main pinctrl on some Rockchip SoCs.
> 
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> ---
>  .../bindings/pinctrl/rockchip,pinctrl.yaml    |   9 ++
>  .../bindings/pinctrl/rockchip,rmio.yaml       | 106 +++++++++++++++++
>  .../pinctrl/rockchip,rk3506-rmio.h            | 109 ++++++++++++++++++
>  3 files changed, 224 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml
>  create mode 100644 include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml:88:11: [error] string value is redundantly quoted with any quotes (quoted-strings)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/rockchip,rmio.example.dtb: rmio (rockchip,rk3506-rmio): compatible: ['rockchip,rk3506-rmio', 'rockchip,rmio'] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,rmio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251216112053.1927852-7-ye.zhang@rock-chips.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


