Return-Path: <linux-gpio+bounces-16466-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F69AA4144D
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 04:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5857F168663
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 03:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2C11DA634;
	Mon, 24 Feb 2025 03:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQfan/Iv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FCE1D619F;
	Mon, 24 Feb 2025 03:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740368746; cv=none; b=OHPAYbmibWCwaf5DTj9dp4esrmgL6Dzi729B1i3Sv2hogkX/zKxNg89vSOO/Vmx5kBuI44xCPbapeOYtDe/Oz2PHQHysNhuSB6oAErnMpMZ7gAIggr9QSznJfjmmrQ2TDjJKvJv15jiIQ4WFBqTveT+jwQfRyLb0JhZJ3iNXlRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740368746; c=relaxed/simple;
	bh=qUFe4UpqBfFhFksfcMUFZKdum1MPLs1H5ZB+gO4zfFY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=h2bV76ixnYFLmRn9fxTZLlFcSoVH/3O/rOWvO38JT4g6vJgoEUNAKD5v1gSsEjbSR0toAaS+f9y/lDhY7v7QlUwnKg4wYMWHlmwaRXKZfNl8ib5A4PKMiOjwni81ONhcMP6FaQTMiqLZXpLhUlWUCebrh5o6oH0SIvyjJVUlMhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQfan/Iv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB64FC4CEEA;
	Mon, 24 Feb 2025 03:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740368746;
	bh=qUFe4UpqBfFhFksfcMUFZKdum1MPLs1H5ZB+gO4zfFY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=VQfan/Iv4Y9TzOMYqSNVSOsUCmtvnlwiK3HdxmznH6xj6G8HcNLH+41M3XIsuGBP6
	 oG4xsCddQ53ccSIuco6whQ6gqaK09azWoX7fgWCO8sKXxARPieOVtwnue+iXiaXp9O
	 XU0ALoPgI7BvYETedwjXQ/IB5ymMT9gRuFEa9AUGn+RGqH1msqmLDu0S/pdHqqYa04
	 8v2WjYQO1aLtO+1U3/CtreGCdOG9tHd5e35TGmD0uQayFqXzR7FOiOy2tTVbB+KbRX
	 6utsBGtAHCH7q1eOC5ak46c8biDkn7vc1jXaN6kgu6wSNSNtb2YkYfIeTPcLmyWkIc
	 IpelMr2K567Pg==
Date: Sun, 23 Feb 2025 21:45:45 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 linux-clk@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Stephan Gerhold <stephan@gerhold.net>, 
 Konrad Dybcio <konradybcio@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
 Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Adam Skladowski <a39.skl@gmail.com>, David Airlie <airlied@gmail.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Simona Vetter <simona@ffwll.ch>, Robin Murphy <robin.murphy@arm.com>, 
 iommu@lists.linux.dev, freedreno@lists.freedesktop.org, 
 Stephen Boyd <sboyd@kernel.org>, Sean Paul <sean@poorly.run>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>
To: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
In-Reply-To: <20250224-msm8937-v3-5-dad7c182cccb@mainlining.org>
References: <20250224-msm8937-v3-0-dad7c182cccb@mainlining.org>
 <20250224-msm8937-v3-5-dad7c182cccb@mainlining.org>
Message-Id: <174036874131.769285.18190619820973305083.robh@kernel.org>
Subject: Re: [PATCH v3 5/8] dt-bindings: drm/msm/gpu: Document AON clock
 for A505/A506/A510


On Mon, 24 Feb 2025 02:56:20 +0100, Barnabás Czémán wrote:
> From: Adam Skladowski <a39.skl@gmail.com>
> 
> Adreno 505 (MSM8937), Adreno 506(MSM8953) and Adreno 510(MSM8976)
> require Always-on branch clock to be enabled, describe it.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> [reword commit, move alwayson on the first place]
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250224-msm8937-v3-5-dad7c182cccb@mainlining.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


