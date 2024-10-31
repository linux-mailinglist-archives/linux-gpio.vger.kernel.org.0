Return-Path: <linux-gpio+bounces-12351-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 355919B7675
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 09:26:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDEB228410F
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 08:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98BB916A92E;
	Thu, 31 Oct 2024 08:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mmn+VOHJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4642415574C;
	Thu, 31 Oct 2024 08:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730363205; cv=none; b=ui7l/ZbjfS4Wqnr+nEgZcFlfTR+06cGPO5wov7Aro6RqcQ1sat31oq9OlqJvH15VV/2Wa7ZwQqMe2LrxpV8h6Jssw8ItvltKaomAqunDd1Sn3J845BO1mxeWBDtJTiAUKw0rD0Jjc7HnLdCnNJfk9Bdj09+OiyxCH5MitO/zzxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730363205; c=relaxed/simple;
	bh=8uB0xeZj8MIs5nP/n7CthToLpfCqShDh88AQhvVlYI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vAH2ZjUmn9IgA9ejE7IGooZvrlkjL97LjCpwCr2lhUmGtJH2uW6y4K4L9oKJN+mHjUl9IlSL0YXrBaKz6/oxVC8muVSFUo2L6gZ2t1KWGZiqa7dZ2aQmO1kNItdIXCAdSRNhzuI6zoMLUSj43CewhXI45iI2N3Rnd/sfQGTtAZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mmn+VOHJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 141C2C4CEC3;
	Thu, 31 Oct 2024 08:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730363204;
	bh=8uB0xeZj8MIs5nP/n7CthToLpfCqShDh88AQhvVlYI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mmn+VOHJxIWNaWpsKwX1iUy2kD4oXN8a+MmnkH+8V4wKQt+Bf4qVxAAUtflJhwkNS
	 7qO/K4AOwLHwpVwo/elm94gbuA1etS5TzbEMmubqsbvUVWFXPIdeVPMigSX/i+bBCE
	 JVGUG04dxoc8zHh75+uHpOLpHVVXS4a61wsy7n322ZjeDFSsWDTnLBnM4brd2I/J0h
	 24SwW0Ch4LFQtEa3QTqRVex8XF3gMSFytkGSQsQimBousL7GtgoSsASP2qvFubzEMN
	 TlXKaYKp5BtHR6q0nMcrVnViJ3G2WeGLuLXR59Ebw/9gPU9DVLSd+9DLytPC8/Z/RC
	 0MT4z+phn3u3A==
Date: Thu, 31 Oct 2024 09:26:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>, Amit Kucheria <amitk@kernel.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH v2 11/15] dt-bindings: iommu: qcom,iommu: Add MSM8917
 IOMMU to SMMUv1 compatibles
Message-ID: <ueag7zoppjxkczs55hnsrg7bdakel4rm5w6j5yurf5bcbj64cs@eq6xhuqctbnc>
References: <20241031-msm8917-v2-0-8a075faa89b1@mainlining.org>
 <20241031-msm8917-v2-11-8a075faa89b1@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241031-msm8917-v2-11-8a075faa89b1@mainlining.org>

On Thu, Oct 31, 2024 at 02:19:52AM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> Add MSM8917 compatible string with "qcom,msm-iommu-v1" as fallback
> for the MSM8917 IOMMU which is compatible with Qualcomm's secure
> fw "SMMU v1" implementation.
>=20
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  Documentation/devicetree/bindings/iommu/qcom,iommu.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


