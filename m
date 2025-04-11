Return-Path: <linux-gpio+bounces-18711-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2B4A864C1
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 19:30:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CC7B1899C6D
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 17:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054DD231A2A;
	Fri, 11 Apr 2025 17:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNFD5a9z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B139D23099C;
	Fri, 11 Apr 2025 17:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744392550; cv=none; b=EmbmC+SdKukKnbt3wLgl5wHAqjtJ9xtmdsSbf34QWty3UNHUzvUwZkZ3k9UDCXOMQzi3brV4xM86DOUnr0qRm1FHNHcyPfeokLzCaEw41LO9y0oNy7UkVlNZuUaTbYlGuFcCgpqcCXkJLfvi851CIScovyegK7vQZCvN1t86xDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744392550; c=relaxed/simple;
	bh=kKVBjIqLG2SX8Nr3mknDt2/BoyEzhiQr4GWv7mcthbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=meaE3/C4BqHR8ai2/E93HaI23QS8dSuCtH/Z8qrpdh8CSrZeo2N0bpbkqlJ2nqcg+hItNYhdbHHG2erl6p/Su6I57poBRpbIA1VhS6jprtlt9Qf8I6s5eHAAyhTMOvlLlOLAg5lfUCCNaheiTtlOZhlvH9wQqYBZJXZL4uzZIGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jNFD5a9z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED094C4CEE2;
	Fri, 11 Apr 2025 17:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744392550;
	bh=kKVBjIqLG2SX8Nr3mknDt2/BoyEzhiQr4GWv7mcthbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jNFD5a9zggf36yMG/tqyz74ogYdV2LE9lSIvp3npsNeWkOj88E2IjHslVbWUHDvGg
	 OWBqPEx6hE9Q6b3maM86H7muU4fF5ZCTEBT5w71z24O5gdVKAiuRKDNLRBbqErgxtK
	 iHcsb60Nvfbr9q19Cuo8Q/AknxtA29o4B9F6ZjfGo6Xc1KeUPcPI/sY6uBhQy523Dz
	 YxBl7iIriVlDF12PQj7vfiDO56qiQjvTAa+grnun4Zsi0zy3ZOCo+l2grjFD92JH+2
	 zVw8/FdeMhGGOwneH2vjZojqfMAM4JL2SvNbqJHTSVJ/BECrcUygSGHP0f5HEmrGCg
	 bA7yNVwgkl4cA==
Date: Fri, 11 Apr 2025 12:29:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sean.wang@kernel.org, linus.walleij@linaro.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	matthias.bgg@gmail.com, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 1/3] dt-bindings: pinctrl: mediatek: Add support for
 MT6893
Message-ID: <174439254848.3599304.13968796413519137053.robh@kernel.org>
References: <20250410144044.476060-1-angelogioacchino.delregno@collabora.com>
 <20250410144044.476060-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410144044.476060-2-angelogioacchino.delregno@collabora.com>


On Thu, 10 Apr 2025 16:40:42 +0200, AngeloGioacchino Del Regno wrote:
> Add bindings for the pin controller found in the MediaTek
> Dimensity 1200 (MT6983) SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../pinctrl/mediatek,mt6893-pinctrl.yaml      | 193 ++++++++++++++++++
>  1 file changed, 193 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6893-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


