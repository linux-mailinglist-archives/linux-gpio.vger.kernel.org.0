Return-Path: <linux-gpio+bounces-15819-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27400A31F2F
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 07:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 224AF3A9499
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 06:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8FA1FF1B1;
	Wed, 12 Feb 2025 06:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oeGS57uo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86778271835;
	Wed, 12 Feb 2025 06:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739342242; cv=none; b=I5VOyyDgd5MDtR9nqosNLr7/IR4yc5FqmYiyA55Tf90/aBiR3yauc5zpABfp+XSWw6fQOmJD4ysvGss8VGFjqXhKG6jqYj3i2Py853i8GXh2wQiOL9w3vWJyLB9k01HZOP9V+yy6I+WmfryVJtUj/xC/kMqH04XUe3FZdQkNtR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739342242; c=relaxed/simple;
	bh=M4tiaGX4ojD1fCsuZ42+BhMMqOwPft1awhWpZNLz0TU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHaiG6IB1yAARQcP0sYY66vtJsELUmAJgFncX/dAGEcgX53CFcHSqdPXyjDtCTcCRdTwS6zyfVt3QvtVZi4XAXGTfrXcl9HpUvLGKSrl5mTcERJlwueU0GPn9lXgA/l1RtgYlzvHeeM8qO5n3RVjUQMTTcRkQKRKj3y3lPWR6vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oeGS57uo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5E3C4CEDF;
	Wed, 12 Feb 2025 06:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739342242;
	bh=M4tiaGX4ojD1fCsuZ42+BhMMqOwPft1awhWpZNLz0TU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oeGS57uoJl6ztdPUHAjXoIJymBnWE9m1kt0Fj2+4sdBQ+0ExPXhbysJtj2NRphXuK
	 LwLy9/pTnVieODZygPXbPmcQwiuV4Ia3wP0Iv9bF5IMf5Ct8aCU5Bfqb6qaj2nbboi
	 mt2fmAVVqEQsEXLt/WP9Os08Pk65UN5ymKcYk1xnvg//sSHyGYx7NndLcQdBXgEsh8
	 QIQcISW2tfco+7GsZHLyPJJzISaLW93JthqHzvOR3G/ZfJz3Kb+MW+/LpYQ7wZiyUr
	 9KFutRjCuurOj50SpePuwPEz1n2w30BCmaMQ1LgMyTFuoNijp1yaIpfCurdEs609dX
	 ydhy3iprBgRZQ==
Date: Wed, 12 Feb 2025 07:37:18 +0100
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
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 07/10] dt-bindings: iommu: qcom,iommu: Add MSM8937 IOMMU
 to SMMUv1 compatibles
Message-ID: <20250212-invisible-esoteric-anaconda-f8e73d@krzk-bin>
References: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
 <20250211-msm8937-v1-7-7d27ed67f708@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250211-msm8937-v1-7-7d27ed67f708@mainlining.org>

On Tue, Feb 11, 2025 at 11:37:51PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> Add MSM8937 compatible string with "qcom,msm-iommu-v1" as fallback
> for the MSM8937 IOMMU which is compatible with Qualcomm's secure
> fw "SMMU v1" implementation.
>=20
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  Documentation/devicetree/bindings/iommu/qcom,iommu.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


