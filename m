Return-Path: <linux-gpio+bounces-15818-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78622A31F26
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 07:37:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD71F188C0F0
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 06:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F9431FDE29;
	Wed, 12 Feb 2025 06:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IF18i2MZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49801FBE8B;
	Wed, 12 Feb 2025 06:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739342220; cv=none; b=V8z87G6j6h2txFEXtciJocA33mG7mCURIvN1jD4pwpvGP2501pvKtxw92llM+NOC6GprTmSg5xkoCIBHZAuytpcfHjvqgTKgPVU2nWb3yU3bSSZS3V7UjqqHFo6JANx1Pm4qqBPiK07y5kBmjg3oZr37JXAuF/H97rRyETzXL5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739342220; c=relaxed/simple;
	bh=Iq6Nt+5CVmIIWdhHskKQppZcZDvxrlz4yKZttl961Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=prD2BfZMoKkctJiyZpO1lnyCX0YWxPkuk3+hQVuxYBl9SFO8s3wsJpwX1APcLNbdKhj+6B3Ol2YjLAqIwpPh1VVzU9ia/OPHjQ/e6gqzKDMeUgraCBZZSfq2quJoncKN2OGDPfAF30m5Pguwehof+nWX4AUbXKw+eDS7Wprgj7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IF18i2MZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617D8C4CEDF;
	Wed, 12 Feb 2025 06:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739342219;
	bh=Iq6Nt+5CVmIIWdhHskKQppZcZDvxrlz4yKZttl961Lk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IF18i2MZEvfyZrAbTRBGT7vFuqTGkcmrhJPfoRdM4sv1/FBb5E/Cuex5SXfvWXv7P
	 CKrFFHPOzjna0NMUIupt56OeWp7saPKG0lTIHUvFx5xrtP5oXPo982o6AZb+h4SQbO
	 dGAsD+O2Ii/y7HtlAE+ZPbKGIYJTKZKRiCVkSEDOkHVApOo7DliIJ7MxdRxP+li5bi
	 cc8pg3ucQjMdRvwzgKbsUlJie/wDJVODqL0oc0Vf3qC1SJK330LNPGtsYfUcpg4wfZ
	 j8kQtsiHdao7ry9EM6jj2FTD4vBAyu7Tvn+ghEDKbPqkvA44N+5vai1d4N77aJc5VZ
	 gaLzJgZL8oNpQ==
Date: Wed, 12 Feb 2025 07:36:55 +0100
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
Subject: Re: [PATCH 05/10] dt-bindings: mfd: qcom,tcsr: Add compatible for
 MSM8937
Message-ID: <20250212-wakeful-thoughtful-mustang-8baa9d@krzk-bin>
References: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
 <20250211-msm8937-v1-5-7d27ed67f708@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250211-msm8937-v1-5-7d27ed67f708@mainlining.org>

On Tue, Feb 11, 2025 at 11:37:49PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> Document the qcom,msm8937-tcsr compatible.
>=20
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20

Your cover letter or individual changelogs should explain dependencies
and how it can be merged.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


