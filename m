Return-Path: <linux-gpio+bounces-16464-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C09A4143D
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 04:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4C6D1893CE4
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 03:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B4C1ACEBB;
	Mon, 24 Feb 2025 03:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZ66Gnkx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C66038DE3;
	Mon, 24 Feb 2025 03:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740368744; cv=none; b=TB9+Zdku2kiQ92NQGuvvsQ1Cr/xJ0K05h6yQVuVbt5QfiyglOFOpswdSbZIMnEGYkSBubaVvNL/OR/vu0T9SRXf+HYXYyhdozHUi55ZvrYUHZWpfO/MS8hwafIVeopR07uAYTom9ohddUXvYAcvV9SpTVmjcm/B6R4TTBETI9kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740368744; c=relaxed/simple;
	bh=x36eM8I9mvfh06MWtqJiRZWuU4kR0fM4aRJdD6U8/3A=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=AxaFl9s2iz6Nr0XDZRpNkHKXJmkm90WJuHth6awGfLL3K/alVqG3lpYrKg0JtKfThLVu9fk1NZI7tKlfEPP1Fij8kUTBTryONJG/CcqiJ6ATC8LbKJZW5g7OmUyT96sPnuBUkkJEFaWov+VOdpCeejYfVUZBI19xi1YlF5ImsdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZ66Gnkx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98399C4CEDD;
	Mon, 24 Feb 2025 03:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740368743;
	bh=x36eM8I9mvfh06MWtqJiRZWuU4kR0fM4aRJdD6U8/3A=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=dZ66Gnkx4ceRLCODpuOct/FlYIgHKqs09y3VyEDNYAeha11wFWePwaaELtFepl9+4
	 jHgmYb1wgobZRs68fx2xUSo42mlGXp5LeZdbA7pATs9awNxbbS/uxz1ztkFYUTN4oj
	 PnprRGqYhqO2eefvXY+Z0u0lZ78dy2w14Iw0W2KSSgNO816Gi2Tum51Ve1u1uQP7BO
	 nujq0yaUYUivZXPjg0DV+Gh7ujILbkVD3/6JFA27qQnmbnoxooiI3JN4esbPZ4X9y+
	 wlKpoWNBvVA8QtFog4fqlNwBGOSMDhftxLpAs+Zbz7K+VdV9iHxLyOGM2MKd9L6SBE
	 7aPO9gLogFY+Q==
Date: Sun, 23 Feb 2025 21:45:42 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 linux-clk@vger.kernel.org, Will Deacon <will@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 iommu@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephan Gerhold <stephan@gerhold.net>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Lee Jones <lee@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>
To: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
In-Reply-To: <20250224-msm8937-v3-1-dad7c182cccb@mainlining.org>
References: <20250224-msm8937-v3-0-dad7c182cccb@mainlining.org>
 <20250224-msm8937-v3-1-dad7c182cccb@mainlining.org>
Message-Id: <174036873937.769195.3244673416189974329.robh@kernel.org>
Subject: Re: [PATCH v3 1/8] dt-bindings: clock: qcom: Add MSM8937 Global
 Clock Controller


On Mon, 24 Feb 2025 02:56:16 +0100, Barnabás Czémán wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250224-msm8937-v3-1-dad7c182cccb@mainlining.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


