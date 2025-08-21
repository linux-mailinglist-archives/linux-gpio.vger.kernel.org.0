Return-Path: <linux-gpio+bounces-24712-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE252B2EF5D
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 09:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A7167210F7
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 07:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB8792E8B85;
	Thu, 21 Aug 2025 07:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PLNlOioW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4D52D97A9;
	Thu, 21 Aug 2025 07:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755760817; cv=none; b=hHQsCw7wcmmqOIwknK329aCkWMw89g6KfLg6/hfV9Sjbq1ZQIzgMvZGgQpdp/P4sIkxdhthlRMUZTy+LkjTqJ6Mj58a6q94I0HDlbXjr7ENKxxPMwrKCjeXqOO4bPzMBc6zqTJa9I0d9YFaDwF4rfHp0atKe5DZZj/fuZ+uxqk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755760817; c=relaxed/simple;
	bh=9O0+HGOwcJkxqZ1P78CUIzkeBXGNDQ1uxZXdRSbeMAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dOp/HzmmQrXydl7Aq5GzuOHoN5ehlVuVVUHK5mqtljpAfjcDeGiPYkiHVVTaUCGvO3lA+8VwmwtG9oTSqjE/HtLIrg3J68iEoGU2GrOHbabj0GvnfE+m1rLCIWxof/1x7tWxSRj6E6jYXzlo3B8rA3Jz/+zfy9qVjthAULj3RuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLNlOioW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44595C4CEED;
	Thu, 21 Aug 2025 07:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755760814;
	bh=9O0+HGOwcJkxqZ1P78CUIzkeBXGNDQ1uxZXdRSbeMAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PLNlOioWd7Cfj3B2W6thbArq8HOHjn6MlGUcBz11xtXrMHPxTm8VuqA0RWPOBEmnu
	 Z+IY+j30jV+3rq88jbtN0QDR1TsDUAplSqeoEL/YpnQWyJhKmUFYGTAsxjdZdi1B88
	 mcoP6aXuLVmwu7M//aVyZUO0SQnU1UnJ//15jA2bY9oc68nD6tbbETX7R+VgvLmYJl
	 mpzjNoZPeoihqPcNFl0xJqDI+LhKDJjYeYZxWMrf72zRoYwhajp2tjt8UClarsHD+f
	 Hy0J2E20inHBbjyLScBDv/w0uKb74GLYCuia3eOcuawGQEMX+FNxblUH/XrQGWwWrR
	 nUDRYhnpEKLtQ==
Date: Thu, 21 Aug 2025 09:20:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephan Gerhold <stephan@gerhold.net>, Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Baryshkov <lumag@kernel.org>, 
	Adam Skladowski <a_skl39@protonmail.com>, Sireesh Kodali <sireeshkodali@protonmail.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Srinivas Kandagatla <srini@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
Subject: Re: [PATCH v6 3/6] dt-bindings: display/msm/gpu: describe A505 clocks
Message-ID: <20250821-radiant-squirrel-of-prowess-f9ea27@kuoka>
References: <20250820-msm8937-v6-0-b090b2acb67e@mainlining.org>
 <20250820-msm8937-v6-3-b090b2acb67e@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250820-msm8937-v6-3-b090b2acb67e@mainlining.org>

On Wed, Aug 20, 2025 at 01:37:47AM +0200, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> Descirbe A505 clocks it is using same clocks like A506.
>=20
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Doc=
umentation/devicetree/bindings/display/msm/gpu.yaml
> index 7ef80f9fac8b2927b2a69100a7f6c729d9d188ab..478ae6e7e55a405d9443dda97=
486b6abfa05e22b 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> @@ -252,7 +252,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            pattern: '^qcom,adreno-506\.[0-9]+$'

50[56] would work, still simple pattern.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


