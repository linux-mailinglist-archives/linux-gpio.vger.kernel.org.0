Return-Path: <linux-gpio+bounces-29998-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0E4CE925C
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Dec 2025 10:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0B4230361C9
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Dec 2025 09:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC982727EE;
	Tue, 30 Dec 2025 09:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DjvhdDsN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CC0242D97;
	Tue, 30 Dec 2025 09:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767085566; cv=none; b=u23HJZdePv1pawpglO09BmWyaggnmbn3yjvn6Y6swCvrg7olWYU+X/e9HMOgeRdKKnnBfY3lztQ4BsqPChRFapngtH+/JMXETlVGYEoKqwLOKbGlqRJPx7vP1iZhL7itOuxDCCBESvZTbY6N4ySjQrpCyJ9pyCtyVM86pfKjYNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767085566; c=relaxed/simple;
	bh=FFmFLOGcRxnFIt2njib8cEC4BnQSt9mMbKuUEJ06tUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GwuVXPIeNFtOgGWIeT4rLBH+7PsGDqSSAKg/H9YvXXp9p8QnzEl0n0LeJWGn+mXDHzmxG1bu3D3nLXJAjPCofhdDr2hm2B0d2zUbjZptouLS9yNNLtQaVcK1EgSCC4AQ5tplpLT02AxNhA9ych3xxBPA50AE4xMChBA3Z8Z/qj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DjvhdDsN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87218C4CEFB;
	Tue, 30 Dec 2025 09:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767085564;
	bh=FFmFLOGcRxnFIt2njib8cEC4BnQSt9mMbKuUEJ06tUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DjvhdDsN36CSz4iCvXcvukq1VtRHS/IaElFb/7GS7z/03+KoW3rhHNYtDkBxwxCxm
	 1oX90ok3SICrkCtolLsEEP6/hPn89Iq6Bfwon8yG0SP9VMtfltT+3EqlfG4MfffVkJ
	 CuXCONON2VfFKt4i1Dx6pEmggElamNkbxPTs5EurKFeLPAhklTcg/eNo/jkYDSiJj5
	 tx8h1qRTPHJcDskjMtqlqWMuZfa/qu6xVEx3Ko+ycms4mKI3z4ITmG2eLnyBdiohAb
	 aF3dinMskLYyyWwhIWTf+zpCGhrci09MKREdk8DlIRTlVvLluyqUYRiAZ8WLHR86S+
	 vCvvBnSZs6wgQ==
Date: Tue, 30 Dec 2025 10:06:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: spacemit: add K3 SoC support
Message-ID: <20251230-jasper-loon-from-atlantis-c7c2df@quoll>
References: <20251226-02-k3-pinctrl-v2-0-5172397e6831@gentoo.org>
 <20251226-02-k3-pinctrl-v2-1-5172397e6831@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251226-02-k3-pinctrl-v2-1-5172397e6831@gentoo.org>

On Fri, Dec 26, 2025 at 08:58:24PM +0800, Yixun Lan wrote:
> Add new compatible string for SpacemiT K3 SoC, the pinctrl IP shares
> almost same logic with previous K1 generation, but has different register
> offset and pin configuration, for example the drive strength and
> schmitter trigger settings has been changed.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml     | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> index d80e88aa07b4..d2cb994e30c1 100644
> --- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> @@ -11,7 +11,9 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: spacemit,k1-pinctrl
> +    enum:
> +      - spacemit,k1-pinctrl
> +      - spacemit,k3-pinctrl
>  
>    reg:
>      items:
> @@ -74,8 +76,12 @@ patternProperties:
>            drive-strength:
>              description: |
>                typical current when output high level.
> -              1.8V output: 11, 21, 32, 42 (mA)
> -              3.3V output: 7, 10, 13, 16, 19, 23, 26, 29 (mA)
> +              For K1 SoC, the settings show as below:
> +                1.8V output: 11, 21, 32, 42 (mA)
> +                3.3V output: 7, 10, 13, 16, 19, 23, 26, 29 (mA)
> +              For K3 SoC, the settings show as below:
> +                1.8V output: 2, 4, 6, 7, 9, 11, 13, 14, 21, 23, 25, 26, 28, 30, 31, 33 (mA)
> +                3.3V output: 3, 5, 7, 9, 11, 13, 15, 17, 25, 27, 29, 31, 33, 35, 37, 38 (mA)

This should be a schema rather than free form text. Add oneOf where each
item is description (1.8 V) + enum. This would be first commit for
converting text to schema for K1, which you grow for K3 in this commit.


Best regards,
Krzysztof


