Return-Path: <linux-gpio+bounces-16465-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1D7A41442
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 04:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F7E918944A2
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 03:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E036D1C6FF6;
	Mon, 24 Feb 2025 03:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="laWMqAKY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8591A1C32EA;
	Mon, 24 Feb 2025 03:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740368745; cv=none; b=fYREXmJcb3IB0RBlal6FrznyTfmvgkGl6TmJ3peL1Ja+PHWb8Xy/TTUqzikLkUW/0iGJoyeIJV5NfKKhKKLj2oGM7M02PhQ8cXgCvcHpWlOAv2Wi/SV3BQyu5aznNecY5bjEZZv8vLgF5W81vYzRPcILiGrAot6WaM054v+Ud5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740368745; c=relaxed/simple;
	bh=42koWRG4Nt5OGSGJb7NMr+y/fPtNaNyRskHNI2gE81U=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=A+dRwc67YIq/cIM/FLypoxjtDrcG6lg9XyElLRslaKiiHVCYBkCvzOwJZRmydmkHDsuGkcpzsnotf3Cny4an8Lr5XHrjBxcS39LJos8yRTSVrPeHXFT/Z6A7LHpUNQ8o5grX3gMsq1hq2mDl4qqm0Z2ANn73rBHoG5BSWzbYVBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=laWMqAKY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA71C4CEE9;
	Mon, 24 Feb 2025 03:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740368745;
	bh=42koWRG4Nt5OGSGJb7NMr+y/fPtNaNyRskHNI2gE81U=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=laWMqAKYVQAXnVx4W/oAOhBswNz1hxhxWsgKscEtN4qNik7+QwQzZlD/ak8ONwwJm
	 29vkZn5x7tgzS+ZM+b97b28cAfKcGOJVuBSaPQvSnQkCDvbf2wUzlP0kAaUq8fxmy2
	 skJBVi8tyGq82SFuPBs4K1RxV/ecV6i9ExEACUqGP/DYOOR+CTQAaUZM54fTYKhre2
	 crjQhUuz0P+mVGCJeK1IZykq5o26XK9tZJld+HiC02MlL1k2gfSPQmk4ciJmTMx5ts
	 harq9iFQOwIikOrem7Jli1Cqs8yaBJNpS2JTCtjutwhkv4U4tTgKsl9lyVcfyK5KD1
	 42iqtuiYcWmbg==
Date: Sun, 23 Feb 2025 21:45:43 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-clk@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux.dev, 
 linux-gpio@vger.kernel.org, Sean Paul <sean@poorly.run>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Lee Jones <lee@kernel.org>, Will Deacon <will@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Stephan Gerhold <stephan@gerhold.net>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
To: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
In-Reply-To: <20250224-msm8937-v3-4-dad7c182cccb@mainlining.org>
References: <20250224-msm8937-v3-0-dad7c182cccb@mainlining.org>
 <20250224-msm8937-v3-4-dad7c182cccb@mainlining.org>
Message-Id: <174036874061.769245.15872803802181415691.robh@kernel.org>
Subject: Re: [PATCH v3 4/8] dt-bindings: iommu: qcom,iommu: Add MSM8937
 IOMMU to SMMUv1 compatibles


On Mon, 24 Feb 2025 02:56:19 +0100, Barnabás Czémán wrote:
> Add MSM8937 compatible string with "qcom,msm-iommu-v1" as fallback
> for the MSM8937 IOMMU which is compatible with Qualcomm's secure
> fw "SMMU v1" implementation.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  Documentation/devicetree/bindings/iommu/qcom,iommu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250224-msm8937-v3-4-dad7c182cccb@mainlining.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


