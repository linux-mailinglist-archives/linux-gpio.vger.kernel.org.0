Return-Path: <linux-gpio+bounces-29955-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32522CE4AC2
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Dec 2025 11:30:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06E72300C0C2
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Dec 2025 10:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31EB1286405;
	Sun, 28 Dec 2025 10:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BtWKMpXi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4D01E89C;
	Sun, 28 Dec 2025 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766917843; cv=none; b=mcKTtLU1Zdns2tW+Hrsp8Yg4F9Asz3DhXja6BDspEqquknQoMKV0EAOm6MK4LfJ/+w+TmkeGHDDAZ3ARFU3EyCkvoAtUFthER7pwUMdn1tvf+u0BRWilGQSwYYTnuhYPvmO6j11LZ4WQ8SBBJ3Rmj3WPvgsudjf8Kzej11OS+Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766917843; c=relaxed/simple;
	bh=iSoBZKWqJzZOiZShBZ0SH5d1WexPAjGU44wbacsprJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I0FV2PHL2qVdDzf4X5Cvyq/n9XGqlGTTgTRlj0zgn6nVGtlB02qVqcIsMd5LbT6SaA7pJpOPbcBe1yng+TTCPzCxhtZR7FZAHvpQ7RFuSN/PesGPJRFIo76vqvmf7Ed29N6sHQQvi1NJmVRIXXrss1ORImBSdGBIx/6u6KQTaw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BtWKMpXi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8720C4CEFB;
	Sun, 28 Dec 2025 10:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766917842;
	bh=iSoBZKWqJzZOiZShBZ0SH5d1WexPAjGU44wbacsprJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BtWKMpXiztzSDj7ueLLhMipJA0rLwp//K64RVHmJIYzIcP8aKBgqMQZuxUOs4dt/Q
	 cIOaepS2VAx1eWlAsn9mKJ7N3/Q+tQdGoge8olMwM+FZNCUtZstk0wrqQBS/fgGcp2
	 eaKVA4PuMSKQqqHLPqnYd6SVDoci+13dF6M9LaGRvKy7pss/8PKpc8Qaln0h5p9agV
	 EhRW9U6buwJrNDLBU/Gb+VocPuoPvcjxPcaJhkHyLtm2Ms3xXpq5fMbxUbfZPfgc0P
	 g8J+rBuw5J1K11OlJzR57zjxeopKqGQTD4a4/2NR4n3W70p+Qf+Ls5puewFw+4/Mld
	 qyBGOqBMt1f6g==
Date: Sun, 28 Dec 2025 11:30:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tao.huang@rock-chips.com
Subject: Re: [PATCH v4 1/7] dt-bindings: pinctrl: Add rv1126b pinctrl support
Message-ID: <20251228-airborne-elated-asp-c8f1fb@quoll>
References: <20251227114957.3287944-1-ye.zhang@rock-chips.com>
 <20251227114957.3287944-2-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251227114957.3287944-2-ye.zhang@rock-chips.com>

On Sat, Dec 27, 2025 at 07:49:51PM +0800, Ye Zhang wrote:
> The RV1126B is a new SoC that is the successor of the RV1126. It has
> different pinctrl registers and is not compatible with the RV1126.
> Therefore, add a new compatible string for it.
> 
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


