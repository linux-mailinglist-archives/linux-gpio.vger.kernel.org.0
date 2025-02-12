Return-Path: <linux-gpio+bounces-15820-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A59A31F2B
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 07:38:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39CC8188A3A8
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 06:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8593E1FF5EB;
	Wed, 12 Feb 2025 06:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qj73nwuF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324D81FC7C3;
	Wed, 12 Feb 2025 06:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739342256; cv=none; b=JV1xuJzdXI8AaFlZi1L6pkcTFlHDu4NRWBSw0pGHmIRdic2g8vwlyyRrQNFh98kv2JbRSsSOHXbkwnrowOtWCxeZEDRm96t7FHpWqvfD4VK55n3nngT0BEkn7hJoka1uAf5bZOuSBpntXJ6nqzJjZu23oAYfbDuQo7dADleNsBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739342256; c=relaxed/simple;
	bh=g7k5THXFMaH/qSOf4PxQOVQREAAwPs4GEz2EWgyvYpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HPfjtpZ3vQbEqhYAYjLwoSlsqyvLusPXs7p5sMLt4dX5Ce+EplHIcicGQRf5rOnDov0kTktvgzuCXIdSUOQ+XXdD4hg+HtqYNxXorOhvNenxRvWJBJf+QDB7XNY/58YEy45eCtYFfbzCq52Qaj/9fR624x2lEbe2HFCG4aChBDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qj73nwuF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA796C4CEDF;
	Wed, 12 Feb 2025 06:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739342255;
	bh=g7k5THXFMaH/qSOf4PxQOVQREAAwPs4GEz2EWgyvYpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qj73nwuFPJ8IiyMSKZCLLIuOk2o7tjdi9+7yOpfIzbQQqPLqv4DTUBYR0iu9h2zK1
	 5aRRjT09KR7byLDw3KerZqLaEthM+Ia/2+mCs/u+912RSv/7pPCE24nyYec33c72JE
	 Hwzn+BUu7qeLGWBe5GuMrMnFykZKHbf4LVsw/JpK/hbu3Qi0/tsvZv41SQqg5tdn7J
	 zbEybvr+/YdHU0/bpWwAuR3gyYrcr3YAaJrYDJRq3wufSUGP7bsO3rnwHVLr3oXuV9
	 CigTVcsFkDs9wdo+DO78zErcCc9qvBJ3gNitAWDRpZVasl1g71rkVd43z0epHdlp6x
	 M3VHNi3t7kqag==
Date: Wed, 12 Feb 2025 07:37:32 +0100
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
Subject: Re: [PATCH 06/10] dt-bindings: nvmem: Add compatible for MS8937
Message-ID: <20250212-snobbish-koel-of-discourse-60fc00@krzk-bin>
References: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
 <20250211-msm8937-v1-6-7d27ed67f708@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250211-msm8937-v1-6-7d27ed67f708@mainlining.org>

On Tue, Feb 11, 2025 at 11:37:50PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> Document the QFPROM block found on MSM8937.
>=20
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


