Return-Path: <linux-gpio+bounces-26215-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0071B59C03
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 17:24:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66A8A3B8FAE
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 15:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D5F33A02D;
	Tue, 16 Sep 2025 15:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lEv0iDfr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6912A313267;
	Tue, 16 Sep 2025 15:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758036260; cv=none; b=QzFelZ1oKADwzswMjaCBEdvmPBBHBXz594R7nwmhthCZOHxieNUTfitpBt8v+NOemTVCQqnscjOuaYKoDNmga66N6oPM1hnDNdqiT6tqZX/4NKfrN6jgAthMYptrwsc5zv5WrXqd4268LP16A9O8FQxX7wQk5LMDF4PHoVWEavM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758036260; c=relaxed/simple;
	bh=NrvnbXOKyz5N44AuzmMadX5LSJ2hhNbtmAe8y1D3CYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2a0PRPR15812OOZaTpTJxkSC5OQizmBClGSVL/vXTZIm1+npgfSwet9dnTKwsuSuLCcUrC2Q9MrpHtLlq9W1EraOGi8U6XjNBdvGHD2BD5T3SAK2J6hgpby+L0cgOyE6+A1j2dFXxvpfQTynUIPT93TGZpINe/efYmIrGdhDPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lEv0iDfr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F44EC4CEEB;
	Tue, 16 Sep 2025 15:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758036259;
	bh=NrvnbXOKyz5N44AuzmMadX5LSJ2hhNbtmAe8y1D3CYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lEv0iDfrh0M68PB+waItXsuqAIqmt960kuI9KLKowghbhB8L9mRzT9DX0c84oKzLv
	 gY2YLVTUvuxLSuiVoIlmjEm9S0Hga9krM/fpIzGy4sHcGQDVwxps//PB6PcIs3FFqn
	 ELf4K3qSYUTUlSExdI1xnhM+YtEUStCLcf7/V1hcSHkDoeOBp/qTEOJbJlM1Qxspeu
	 gGj3qiOIqx5ikHE0iFAgr0jgRdJJX+LpFpXd6mHzWrfED/+C5C0VxmGiKZZJ/2J2BU
	 jwWRAN+FfhwI1VDpUr+gRbSshIhKUfkH3Q96+vFX3Rfcu2NYwl4YCd3xW9qRkp/vC0
	 vTJd9SMtWfJ6Q==
Date: Tue, 16 Sep 2025 10:24:14 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-gpio@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	Max Shevchenko <wctrl@proton.me>, Rudraksha Gupta <guptarud@gmail.com>, 
	Shinjo Park <peremen@gmail.com>
Subject: Re: [PATCH 0/6] ARM: dts: qcom: msm8960: cleanup and add missing I2C
 nodes
Message-ID: <5ge4fmciy5khy7axvzapmdv55abouzmr6t5j7irz2glznetr6y@ky6v43cyf6ir>
References: <20250915-msm8960-reorder-v1-0-84cadcd7c6e3@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-msm8960-reorder-v1-0-84cadcd7c6e3@smankusors.com>

On Sun, Sep 14, 2025 at 06:34:38PM +0000, Antony Kurniawan Soemardi wrote:
> While working on adding support for the Sony Xperia SP (msm8960t), it
> was pointed out [1] that the msm8960 dtsi could use some general
> cleanup and reordering. This series applies those suggestions and also
> fills in missing I2C nodes that are required by several phones based on
> msm8960.
> 
> Changes included:
> 
> 1. Reorders nodes by unit address and sorts properties to comply with
>    the Devicetree style guide. Cosmetic only.
> 2. Inlines qcom-msm8960-pins.dtsi into the main SoC dtsi. Most Qualcomm
>    SoCs embed their TLMM definitions directly, so this removes an
>    uncommon split file pattern. Cosmetic only.
> 3. Adds I2C child nodes for GSBI10 and GSBI12, which are present on
>    MSM8960 and required by devices such as the Sony Xperia SP.
> 4. Adds I2C child nodes for GSBI1 and GSBI8, which are present on
>    MSM8960 and required by devices such as the Casio G'zOne. This work
>    was contributed by Shinjo Park.
> 5. Updates the binding documentation to rename the GPIO controller node
>    from "msmgpio" to "tlmm".
> 5. Renames the GPIO controller node label from "msmgpio" to "tlmm" to
>    match the convention used by other Qualcomm SoCs. Cosmetic only.
> 
> [1] https://lore.kernel.org/all/rcazqdcr747ujkba6z2j2oci27ajkqfi4hydgc2kiavm73y37x@g63jga2fcwmo/
> 
> Thanks,
> 
> ---
> Antony Kurniawan Soemardi (6):
>       ARM: dts: qcom: msm8960: reorder nodes and properties
>       ARM: dts: qcom: msm8960: inline qcom-msm8960-pins.dtsi
>       ARM: dts: qcom: msm8960: add I2C nodes for gsbi10 and gsbi12
>       ARM: dts: qcom: msm8960: add I2C nodes for gsbi1 and gsbi8
>       dt-bindings: pinctrl: qcom: msm8960: rename msmgpio node to tlmm
>       ARM: dts: qcom: msm8960: rename msmgpio node to tlmm
> 
>  .../bindings/pinctrl/qcom,msm8960-pinctrl.yaml     |   4 +-
>  arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts        |  10 +-
>  arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi      |  59 --
>  .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   |  12 +-
>  .../boot/dts/qcom/qcom-msm8960-sony-huashan.dts    |   2 +-
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           | 727 ++++++++++++++-------
>  6 files changed, 491 insertions(+), 323 deletions(-)
> ---
> base-commit: 9e410f58e82ea0c0e865f688d84edad1da7824d2

I unfortunately don't have this commit, and I can't fine a branch where
patch 1 applies cleanly. Can you please rebase this on top of linux-next
and resubmit it?

Regards,
Bjorn

> change-id: 20250831-msm8960-reorder-1849dee3817f
> 
> Best regards,
> --
> Antony Kurniawan Soemardi <linux@smankusors.com>
> 

