Return-Path: <linux-gpio+bounces-19124-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AB5A96341
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 10:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92A1017611D
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 08:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79A28266EF5;
	Tue, 22 Apr 2025 08:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QmYN7D6/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD452580E0;
	Tue, 22 Apr 2025 08:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745311588; cv=none; b=EOZb1HkVJL9M+wEms59b0HQxMLLYr8T3S2SMXH9kbKTKXok8ndCW+M1myS+RK5Z4NIUdX/r3ET3JaYpXILVS5IMlApfEXj0T6PdwjNCuU7glVtS8TCi8CWA2LaalWydJRWm9SVSVkgY5Qxgw9G67Ne4777IWDr6M/T1nfvBcFQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745311588; c=relaxed/simple;
	bh=H44nKWfJpflFFXOrn5cncTRUymqZaUjYXbKXiW88Txw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6JV5+oCgSKSEeDYrthd0hku+ZHi1+r3Ic3fSI4kBJlcDNoVp45gT/rauM+ksatTf1t1w566xNWWNnG3pOpMSEcIf7tR44k5enaW5YI3ayGRz0P3KP8GqhKZwQCVPXo1xAS5TBMR0fvPxaXyc9o5DwybSHMuGESsX2i82KW4VE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QmYN7D6/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A82C4CEE9;
	Tue, 22 Apr 2025 08:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745311587;
	bh=H44nKWfJpflFFXOrn5cncTRUymqZaUjYXbKXiW88Txw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QmYN7D6/vQ3fhyXfvF2TBLjn9Eh6HHivB2z2YJK9Q1otgITmYvXWco87nUQ/XQFej
	 d24PAugK941acJt881sWsHAnIbR9eKNrky+nbiRiL4mup5twIh0m67xqu46jrSWmRD
	 8EPJxxMkxH/Vj/arYSTCAmWqj9iHXT7hyxLH9R9ouO3DvdjiwDA57a1hsnfA2oh+l/
	 e9VnSQ8AiR2H7lLMrYiS9GbwvK3nvogHF+tFOyZtAZ5JPdY+8Mv7Fqt+XS2A39TlML
	 XwuNTkJURqd4th6YNyQVCEGs1aHB+mD21WwZyZKVOSEvInoYdj422SG6TzvMh2cnJp
	 NpNyOEY6X8TCQ==
Date: Tue, 22 Apr 2025 10:46:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephan Gerhold <stephan@gerhold.net>, Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Baryshkov <lumag@kernel.org>, 
	Adam Skladowski <a_skl39@protonmail.com>, Sireesh Kodali <sireeshkodali@protonmail.com>, 
	Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	iommu@lists.linux.dev, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
Subject: Re: [PATCH v5 1/5] dt-bindings: clock: qcom: Add MSM8937 Global
 Clock Controller
Message-ID: <20250422-ermine-of-pastoral-courage-bb7bcd@kuoka>
References: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
 <20250421-msm8937-v5-1-bf9879ef14d9@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250421-msm8937-v5-1-bf9879ef14d9@mainlining.org>

On Mon, Apr 21, 2025 at 10:18:23PM GMT, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wrot=
e:
> Add device tree bindings for the global clock controller on Qualcomm
> MSM8937 platform.
>=20
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  .../devicetree/bindings/clock/qcom,gcc-msm8953.yaml   | 11 ++++++++---
>  include/dt-bindings/clock/qcom,gcc-msm8917.h          | 19 +++++++++++++=
++++++
>  2 files changed, 27 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


