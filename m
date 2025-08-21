Return-Path: <linux-gpio+bounces-24724-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C45B2F3BD
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 11:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFA0C189F33D
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 09:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C352EFDA1;
	Thu, 21 Aug 2025 09:23:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2F61FA272;
	Thu, 21 Aug 2025 09:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755768211; cv=none; b=lTq6lNrx0S2cYmZ19ZLUock0pKByJ9jEB6Cb5JiQ72TO5TN7T45qf6xAzfyLhUzoF+RTcScBPN2SF8bG/Lhr0jSPCaR4+w8QILnWB9hESgGZDsn6Z9vbVQwTzWLIEhCtPew0eAODkt1U8kKlA5fINc1r0d3CcJ25ZNQyMPmXL3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755768211; c=relaxed/simple;
	bh=ZFzgJhx4hn1G8tRLV0NFu2vvp6dXVo4Mk/gknDvLzS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=altuBb5KUjfBrpZWOBXFzJso32dZGU4eN99guAfoPKARtAHsFSIduPlDl7n9EEsqlNLriSltZIAXpe/Sr5kkhVC534P0tW9PfjJN7vkRfnEXeiKPVttKM2kmoQSfykIcDpsalhOqi+8GgSSiHIOdbJ4SpXVijFk7Yz7kCmIDWUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.158.240.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0CD3A340DED;
	Thu, 21 Aug 2025 09:23:28 +0000 (UTC)
Date: Thu, 21 Aug 2025 17:23:23 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lukas Wunner <lukas@wunner.de>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: gpio: Minor whitespace cleanup in example
Message-ID: <20250821092323-GYC1065530@gentoo>
References: <20250821083213.46642-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821083213.46642-2-krzysztof.kozlowski@linaro.org>

Hi Krzysztof, 

On 10:32 Thu 21 Aug     , Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '='
> character.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/gpio/maxim,max31910.yaml  | 6 +++---
>  .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml          | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
..
> diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> index ec0232e72c71..83e0b2d14c9f 100644
> --- a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> @@ -80,7 +80,7 @@ examples:
>      gpio@d4019000 {
>        compatible = "spacemit,k1-gpio";
>        reg = <0xd4019000 0x800>;
> -      clocks =<&ccu 9>, <&ccu 61>;
> +      clocks = <&ccu 9>, <&ccu 61>;
>        clock-names = "core", "bus";
>        gpio-controller;
>        #gpio-cells = <3>;
> -- 
> 2.48.1
> 

thanks, for spacemit,k1-gpio

Acked-by: Yixun Lan <dlan@gentoo.org>
-- 
Yixun Lan (dlan)

