Return-Path: <linux-gpio+bounces-15817-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62208A31F19
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 07:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0AC4168AC3
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 06:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572E71FF1CB;
	Wed, 12 Feb 2025 06:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C/6bS0hK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004F41EEA32;
	Wed, 12 Feb 2025 06:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739342171; cv=none; b=EJ+DUUF4h1+ia9N92zsIPw5s7PZLgplcfNDjTYoPS3KFigfpwFRTff82OtJDmWFAziJincZo/628LtNudmrx6bUCpVfvteAR07CSyE7BjgHhoF3bGW2wdZNGsdEfUZ3vYr+cila9D9zPmRbK6AsdtBZO0JOU9xVuV+EluI51t9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739342171; c=relaxed/simple;
	bh=VH19UhiZvMPgSkjmgePhQCQICVgB846fW0J0pTP8Ges=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QYpSrgf7xiGzfTRnhIN7Z9vXoaihYkGgO/EH1rnwyybH6AoqllY46F6SV8O6dkSsOmOyzujVsLWWStQsiPIRPM9nN3JjeZLuKnt2x/d+h5xmAc9JI7VACtjJkuyLqOyQyvRuENHIwOG72nPrfzq5c3TSISsAS6pj/NYsRiuTTCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C/6bS0hK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B0CC4CEDF;
	Wed, 12 Feb 2025 06:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739342169;
	bh=VH19UhiZvMPgSkjmgePhQCQICVgB846fW0J0pTP8Ges=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C/6bS0hKisGl6zn4xGMoluuXOUbFdzYTGJvCZBjS+X4FqY8af/KaAFFqasuMslcaB
	 Pzk6AXUvZGLA1QN74qZpIA1ji690JJUGsDm7fHr1xWUbfSMB7+AP91HO3PndCvFPyN
	 Sdmw+VlUyd/U/AUokjhRALaPg2fmroNh8o7hWSG6BSUIS+2k2wsdAnyZ+UohBjd/7F
	 dhWUsEfCmwqVY7EcWPMJ3lued3ctdRwWSZhGsUqHUx+KfTPjgzQC2ZXIKCvnrMYM2o
	 GbJ+ZSaisItw4jY6alvmVtPjSoRpJ+WpECRxlDutlCLOZDvAKl0kY2Nj5r86PYsKMf
	 3S4zKLIdrFjQg==
Date: Wed, 12 Feb 2025 07:36:06 +0100
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
Subject: Re: [PATCH 09/10] dt-bindings: arm: qcom: Add Xiaomi Redmi 3S
Message-ID: <20250212-unnatural-auk-of-reading-bfd4ca@krzk-bin>
References: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
 <20250211-msm8937-v1-9-7d27ed67f708@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250211-msm8937-v1-9-7d27ed67f708@mainlining.org>

On Tue, Feb 11, 2025 at 11:37:53PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> Document Xiaomi Redmi 3S (land).
> Add qcom,msm8937 for msm-id, board-id allow-list.
>=20
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


