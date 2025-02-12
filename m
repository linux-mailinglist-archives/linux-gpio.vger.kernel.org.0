Return-Path: <linux-gpio+bounces-15816-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BD2A31F23
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 07:37:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66DDC3A97FB
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 06:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CCD01FCFCC;
	Wed, 12 Feb 2025 06:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pSDyVnxO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A698E1EEA32;
	Wed, 12 Feb 2025 06:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739342119; cv=none; b=SZY2qm1WogwFMD02L25TsDjH8MQj5bFOPPpQpgBB4x5OeFAEBThxVeRUUxTAePbc8v//dkHeDw9LjKx05g/UEQZSkH4rxTi2u50L0tGNBk4uncBrxuazJ5LmRnnGglY8tsYCG8AAFygwENxxPI80FqOMEvK6km/pIUfhHZFMrfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739342119; c=relaxed/simple;
	bh=e/ULmuPE9VXv8GzletaPbn1h11ZiKC4BhnBufzkNShA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ackXiu8vn4D0b3gMHOrQ9WndvFW9xhKJXmAPa6ruuLdVG1mOMUnKZUetMBHhzOyXJlkcwALIWCadhcKSMpKV2zrF/kpAFlynmjkTvvzsx/75nP2FfS46O53WbiD7ZHLGitooL+4GxFZUgqnShunwAhMu8TjkpZpghZsBB1mYfxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pSDyVnxO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F679C4CEDF;
	Wed, 12 Feb 2025 06:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739342118;
	bh=e/ULmuPE9VXv8GzletaPbn1h11ZiKC4BhnBufzkNShA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pSDyVnxOyjk81T/knbOS4uo8DkrCguN5NQelvumMBGY5A4ARhpL77vIx05xvByCkB
	 J2GYUhmQc/HxlI2VD7zKjGw9Cjj8Klnh+bgDhmnUV7GaPRyVwasZYQ1K9nSFe0Vbrw
	 PLhCW09VA9s1V70/0q465KTOCJqPYaM4zIhRcibB8azCdVGqo51juyxb1mFT1QknVe
	 OXiosBJZk6btfb+X9AcqU7pabc7WuxFicDci4TNTHc6Vh2VhDTY3QKqXqzz2XLMlWU
	 /g2/He26he0eg6NJ4KEV6dSMeGzZL4oygP5nB5Cp6ELOm+ufBFdUNw95vUp/JyYYHD
	 HuszUzQ6dxuZA==
Date: Wed, 12 Feb 2025 07:35:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephan Gerhold <stephan@gerhold.net>, Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
	Daniil Titov <daniilt971@gmail.com>
Subject: Re: [PATCH 02/10] dt-bindings: clock: Add MSM8937 Global Clock
 controller compatible
Message-ID: <20250212-gibbon-of-amazing-strength-69debd@krzk-bin>
References: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
 <20250211-msm8937-v1-2-7d27ed67f708@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250211-msm8937-v1-2-7d27ed67f708@mainlining.org>

On Tue, Feb 11, 2025 at 11:37:46PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> From: Daniil Titov <daniilt971@gmail.com>
>=20
> Document the qcom,gcc-msm8937 compatible and add new input clocks.
>=20
> Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  .../bindings/clock/qcom,gcc-msm8917.yaml           | 23 ++++++++++++++++=
++----
>  include/dt-bindings/clock/qcom,gcc-msm8917.h       | 17 ++++++++++++++++
>  2 files changed, 36 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8917.yam=
l b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8917.yaml
> index 6e567b2a5153af9bb32958154633d6da5fd1cd50..689c5760d9cd1fc96d97e5705=
cd1fcd48324433a 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8917.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8917.yaml
> @@ -4,14 +4,14 @@
>  $id: http://devicetree.org/schemas/clock/qcom,gcc-msm8917.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Qualcomm Global Clock & Reset Controller on MSM8917 and QM215
> +title: Qualcomm Global Clock & Reset Controller on MSM8917, MSM8937 and =
QM215
> =20
>  maintainers:
>    - Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
> =20
>  description: |
>    Qualcomm global clock control module provides the clocks, resets and p=
ower
> -  domains on MSM8917 or QM215.
> +  domains on MSM8917, MSM8937 or QM215.
> =20
>    See also:: include/dt-bindings/clock/qcom,gcc-msm8917.h
> =20
> @@ -20,6 +20,7 @@ properties:
>      enum:
>        - qcom,gcc-msm8917
>        - qcom,gcc-qm215
> +      - qcom,gcc-msm8937

So this is new patch.

> =20
>    clocks:
>      items:
> @@ -27,6 +28,8 @@ properties:
>        - description: Sleep clock source
>        - description: DSI phy instance 0 dsi clock
>        - description: DSI phy instance 0 byte clock
> +      - description: DSI phy instance 1 dsi clock
> +      - description: DSI phy instance 1 byte clock

But this is part of #1. At least that would be logical, because
otherwise your move does not make sense - moved code is the same as old
code.

Best regards,
Krzysztof


