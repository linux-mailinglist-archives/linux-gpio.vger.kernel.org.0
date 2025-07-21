Return-Path: <linux-gpio+bounces-23562-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BA6B0BDB1
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 09:33:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5150162B14
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 07:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF14283FD4;
	Mon, 21 Jul 2025 07:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WQVMx82I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8021C2836B4;
	Mon, 21 Jul 2025 07:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753083186; cv=none; b=okJ4BYliiaAEONJe5PxoUmRZlXHxPJ3vbdjgGODnl5f1j/PG4Lz9upMWwubLUFKeHJeNPw5ebuam/e9eP2hyNOpjPmwDF7GwZeZCsZ2aq4HuLoxEMWQzd2hF3EIBb7V1x4SRRwZJh28ljrnnCzTrZlss1Untq8+CoqyxXSEJrd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753083186; c=relaxed/simple;
	bh=mdw1CJUvpPFP7q0+Tbu+h7FrEywRakCiECzX+/r2WGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gr9Q/cCP9PL5/vg4ZU7ahlHlm9P7/rPJgL8qYX7sjfiQwuH0Of60uFuVtNcfIspI+Mjw0hvs8FFtdlopdIcjIU4QtNkhlFnb0EDDC95m90JBYVtWaBVej7Cx5JTAk/2807mOgBr3kUQbEoBsUrVd3Ggo++GjKgRN44mfcW0OrWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WQVMx82I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E6E1C4CEED;
	Mon, 21 Jul 2025 07:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753083186;
	bh=mdw1CJUvpPFP7q0+Tbu+h7FrEywRakCiECzX+/r2WGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WQVMx82I8bVkS4iAB/XBcHjAZN+OhmUhogG2a6aPNGFZLGTIRUdJ+WBnlccVGR+8P
	 LfxhMHXvqI8vOZ7ABVpKYeYoFLtLKhtW9T5yvCVp46/OM/CfrGPH1urmhIOAEWZSvX
	 W2KZwAUGG/oTmXoaUgQ07oYeT+0gubuEN3FBGwfZWsmBQGS4vU8e2Jo1VAqehDPfqH
	 J0e660hGsA067rNtYNL6MoNdw9AvRanwG93tWFmsX9hyJAI7qsg+74XlsaHZutiMVA
	 ds9o1mVOzxHqahjQ2F2L5BBU+e0CuLzCqHO8O3IFZNypfMuE1lVKAPGq/v7Z8bnMYS
	 BhZDW8+x+8IxA==
Date: Mon, 21 Jul 2025 09:33:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	kernel@oss.qualcomm.com, Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v7 3/9] ASoC: dt-bindings: qcom,lpass-va-macro: Update
 bindings for clocks to support ADSP
Message-ID: <20250721-fervent-panda-of-effort-f962b5@kuoka>
References: <20250720173215.3075576-1-quic_pkumpatl@quicinc.com>
 <20250720173215.3075576-4-quic_pkumpatl@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250720173215.3075576-4-quic_pkumpatl@quicinc.com>

On Sun, Jul 20, 2025 at 11:02:09PM +0530, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Manage clock settings for ADSP solution. On Existing ADSP bypass
> solutions, the macro and dcodec GDSCs are enabled using power domains
> in lpass-va-macro which is not applicable for ADSP based platform.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  .../bindings/sound/qcom,lpass-va-macro.yaml   | 23 +++++++++++++++----
>  1 file changed, 18 insertions(+), 5 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


