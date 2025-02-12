Return-Path: <linux-gpio+bounces-15865-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50213A328D8
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 15:41:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB3AD3A99D1
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 14:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12B425A622;
	Wed, 12 Feb 2025 14:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Je5v/O6R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1CE25A33E;
	Wed, 12 Feb 2025 14:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739371077; cv=none; b=oKgfhoP7P8/29+oiy+kWHcvIKba6n/33QfAdvVhAw/5IlNHrncRGEwxxLt1QrjCNCsJTBRCoXv3wLVca4HezUupoPvZ+Po7mD8iMjCrHJKB+vF+yjT538DhQxT0C0qSBh2HgmQ7bmgN5xlTqELUk7qgD5+dekhrvgCPwL47Jc1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739371077; c=relaxed/simple;
	bh=VUBM57jOz21qhzl4JgnGGgiFmJ16K4z/3nSk3V+odWQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=s2shW5vJglAG87cdDeYvL24imuL5UvQsf1AjZDX+Yeu2/TwaFKy9yTZxDAWk7sh7XliIjfQq/zfeqBWxeq2o1eTTNsnGLhQqRPaIXrR/fhNhYrDuA/7p062z5ukppZU4Y/6dMdpxFTk8Ao1cjjXMdX8OD15O72sLkw2Eah3N9D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Je5v/O6R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B43F8C4CEE4;
	Wed, 12 Feb 2025 14:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739371076;
	bh=VUBM57jOz21qhzl4JgnGGgiFmJ16K4z/3nSk3V+odWQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Je5v/O6RvOmLtL1lWrIBnUZdIB9qSs5EzOVdh0V7z1Wp5/q7Seycikmd3UDwzVhZd
	 r60tyUtkLhGWXvRZua2EZbVry+x0exOrN9X7SVOi670+LrPax9T3ze+hHf3T2ZZQlx
	 qJ3AfWEUNv2W3g7BTWsTnpXRct0ysuDJFPDaK4km1V1sbRsMa51ZkgF4LNXd/YgKfV
	 8FLPNGgSpj8395pzX311yHjDr5sDyA5Hqhin4D4jIxNmmIMpqqWi3EcLZL9QstKpGG
	 aTsR2kRVHbQCnBFJD15qKYbIyjx5k7u6LwWO/hTn/KMThp19m0vZvZEkAlWJ7UK6dK
	 oA8B5HOGhqO1g==
Date: Wed, 12 Feb 2025 08:37:55 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Daniil Titov <daniilt971@gmail.com>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Joerg Roedel <joro@8bytes.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 iommu@lists.linux.dev, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Dang Huynh <danct12@riseup.net>, 
 Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>
To: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
In-Reply-To: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
References: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
Message-Id: <173937096484.3561919.15204410384855360487.robh@kernel.org>
Subject: Re: [PATCH 00/10] Initial support of MSM8937 and Xiaomi Redmi 3S


On Tue, 11 Feb 2025 23:37:44 +0100, Barnabás Czémán wrote:
> This patch series add initial support for MSM8937 SoC
> and Xiaomi Redmi 3S (land).
> 
> The series is extending the MSM8917 gcc and pinctrl drivers
> because they are sibling SoCs.
> MSM8937 have 4 more A53 cores and have one more dsi port then
> MSM8917.
> It implements little-big architecture and uses Adreno 505.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
> Barnabás Czémán (5):
>       dt-bindings: mfd: qcom,tcsr: Add compatible for MSM8937
>       dt-bindings: nvmem: Add compatible for MS8937
>       dt-bindings: iommu: qcom,iommu: Add MSM8937 IOMMU to SMMUv1 compatibles
>       dt-bindings: arm: qcom: Add Xiaomi Redmi 3S
>       arm64: dts: qcom: Add Xiaomi Redmi 3S
> 
> Dang Huynh (2):
>       pinctrl: qcom: msm8917: Add MSM8937 wsa_reset pin
>       arm64: dts: qcom: Add initial support for MSM8937
> 
> Daniil Titov (3):
>       dt-bindings: clock: gcc-msm8917: Split to separate schema
>       dt-bindings: clock: Add MSM8937 Global Clock controller compatible
>       clk: qcom: gcc: Add support for Global Clock controller found on MSM8937
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |    7 +
>  .../bindings/clock/qcom,gcc-msm8909.yaml           |   10 +-
>  .../bindings/clock/qcom,gcc-msm8917.yaml           |   74 +
>  .../devicetree/bindings/iommu/qcom,iommu.yaml      |    1 +
>  .../devicetree/bindings/mfd/qcom,tcsr.yaml         |    1 +
>  .../devicetree/bindings/nvmem/qcom,qfprom.yaml     |    1 +
>  arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>  arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts   |  402 ++++
>  arch/arm64/boot/dts/qcom/msm8937.dtsi              | 2145 ++++++++++++++++++++
>  drivers/clk/qcom/Kconfig                           |    6 +-
>  drivers/clk/qcom/gcc-msm8917.c                     |  617 +++++-
>  drivers/pinctrl/qcom/Kconfig.msm                   |    4 +-
>  drivers/pinctrl/qcom/pinctrl-msm8917.c             |    8 +-
>  include/dt-bindings/clock/qcom,gcc-msm8917.h       |   17 +
>  14 files changed, 3277 insertions(+), 17 deletions(-)
> ---
> base-commit: df5d6180169ae06a2eac57e33b077ad6f6252440
> change-id: 20250210-msm8937-228ef0dc3ec9
> 
> Best regards,
> --
> Barnabás Czémán <barnabas.czeman@mainlining.org>
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250211-msm8937-v1-0-7d27ed67f708@mainlining.org:

arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dtb: gpu@1c00000: clock-names:5: 'alwayson' is not one of ['core', 'iface', 'mem', 'mem_iface', 'alt_mem_iface', 'gfx3d', 'rbbmtimer', 'rbcpr']
	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dtb: clock-controller@1800000: clocks: [[18], [51], [52, 1], [52, 0]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-msm8917.yaml#
arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dtb: clock-controller@1800000: clock-names: ['xo', 'sleep_clk', 'dsi0pll', 'dsi0pllbyte'] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-msm8917.yaml#
arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dtb: clock-controller@1800000: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-msm8917.yaml#






