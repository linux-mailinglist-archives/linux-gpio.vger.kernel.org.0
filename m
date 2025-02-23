Return-Path: <linux-gpio+bounces-16448-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 439C3A41198
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 21:29:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 298697A3F00
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 20:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4370E23A9AF;
	Sun, 23 Feb 2025 20:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aan6HSP1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D608D23A98C;
	Sun, 23 Feb 2025 20:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740342542; cv=none; b=bHxpXimg36DrOOMwxPCSnzbXqBBrmYhaoaERQSY1Vf6Nn+c13muro/xROuwzRrxmpA7Z9bPMq1mw6z7eCh8sfZbTDo1nvujtHW/GlK8L5bWQJWD2gTKO7cuz3N7D0/bUINzacmzASfftRKyT3kwACCwEvg7y2Zt4LNM2shTFniI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740342542; c=relaxed/simple;
	bh=KR7W999H3HhWOx6HbD/qJn1w4eHNm4Exj/VdOj3oOD4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=cgpJv3sxQz48UEkx/PNfS1VEQt8kicJ5Qkl2D08C+Eu0t3ZCIQLQECVK3GQYJUlcP57W3l4U7V5ajyPWJlt/N9hVEP9MBru2I5K5CIqO9pqSwM4XDhXeXNqxViAE5THzMUNzOEONxZhVDgrxcqu8Yjr1SWqAkZRbvcK1rZCSQP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aan6HSP1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE95C4CEDD;
	Sun, 23 Feb 2025 20:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740342541;
	bh=KR7W999H3HhWOx6HbD/qJn1w4eHNm4Exj/VdOj3oOD4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Aan6HSP1ONPevUNZiyUU8ETFdE0qaWvH++o/iVGUuu5Xh2KbPzp71A0/5ttes+Q5/
	 yOPLnxK6yiuf7wV4uqrDTJNc9i7oTy8KKWL7WdO5fI0IYU8QKZFPh2/Oa/2/qVqTED
	 vO2OhHsiRfoxz9hgIKyPNgLpj5J3LzLT7a5G4fGmiXMG/LuhJ0K8lICySXzxA9Rlbr
	 rebPb+m8p92pd53t8TGdJJe+D3oQEqrTftCNnBQJQk2PkPrbLLgOARCk1wXy1p6AZy
	 LEleD5gExrcWP7vUt8tgs1ii4a51YClasTyM7kIUT859txQXFcNpN+5r0rGCxAu2gO
	 F4FJ8Vd0VfFxw==
Date: Sun, 23 Feb 2025 14:28:59 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Stephan Gerhold <stephan@gerhold.net>, dri-devel@lists.freedesktop.org, 
 Will Deacon <will@kernel.org>, Sean Paul <sean@poorly.run>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Bjorn Andersson <andersson@kernel.org>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Joerg Roedel <joro@8bytes.org>, Lee Jones <lee@kernel.org>, 
 iommu@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>, 
 linux-clk@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, 
 David Airlie <airlied@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>, freedreno@lists.freedesktop.org, 
 Simona Vetter <simona@ffwll.ch>
To: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
In-Reply-To: <20250223-msm8937-v2-1-b99722363ed3@mainlining.org>
References: <20250223-msm8937-v2-0-b99722363ed3@mainlining.org>
 <20250223-msm8937-v2-1-b99722363ed3@mainlining.org>
Message-Id: <174034253684.156189.15967514216362963573.robh@kernel.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: clock: qcom: Add MSM8937 Global
 Clock Controller


On Sun, 23 Feb 2025 19:57:46 +0100, Barnabás Czémán wrote:
> Add device tree bindings for the global clock controller on Qualcomm
> MSM8937 platform.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  .../bindings/clock/qcom,gcc-msm8937.yaml           | 73 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-msm8917.h       | 17 +++++
>  2 files changed, 90 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/clock/qcom,gcc-msm8937.example.dts:24.28-29 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/clock/qcom,gcc-msm8937.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250223-msm8937-v2-1-b99722363ed3@mainlining.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


