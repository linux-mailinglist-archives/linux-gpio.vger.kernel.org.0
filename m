Return-Path: <linux-gpio+bounces-23068-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0159AFFE52
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 11:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16833581CD2
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 09:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBDA22D3EDC;
	Thu, 10 Jul 2025 09:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RHXdnvVv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A018E28D82F;
	Thu, 10 Jul 2025 09:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752140403; cv=none; b=rLggcGAgI/bzfJsS+BM99qyMlAsixdBTM2a/dzLEj8AW/Y++CFHZrMcBj9LQGL9dDJ/peysI9YxFwKK1qiZkGglGKVQ6q6bv9aM1QhjpzJR0SXWzITOb9SRAoOL2aHO+yyqY+9eJH6tYkEWiIVCYG9d8TjRTUaD/ZPa3qzNlkiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752140403; c=relaxed/simple;
	bh=4st+5aAzqLkQT7Cxyn38f5ob3o7iaHCYDX+qabL93jA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ggpjjjZ0p9NYQmC8m8OFT9l1ADvEt+sk14jVl8M1tI0WE6GmuH8js704p4r6SUPO8+TBi0KXIWZNptK723ZP6KxhwX+ErUCgC9ClDqWB10KRjWd95P3xwlNBsV9ZWNH0Lz2iD+sD1HIOjJ5L7wj7xa15DKEvo1EEEXRCPamXL7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RHXdnvVv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE8BDC4CEE3;
	Thu, 10 Jul 2025 09:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752140403;
	bh=4st+5aAzqLkQT7Cxyn38f5ob3o7iaHCYDX+qabL93jA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RHXdnvVvg0RJrkrbCDHeQJ/oLUWhoyH2UXFb3dGn4y27daTLYP1+dV/pEQcpE18Xk
	 2YYNd5mNRIHGK9xtLmfffiCA1/T4P+RrVfEeLV0Msl5gUv2uilYfl5j+8nxUHiBRqX
	 dnDl7b5ahG/LkxnzeXpKKwlKX5vXiXbsFH2tGpKECKPSX33CivITRcdLwsAk/3VvrV
	 8CHaBGj6ZxkoDQZIKOikNn9P0RzZWAK+hnh9bnrNJ5+chTcaeIuXexkZ6daH08UPJu
	 KdG3iVpvyrEm/gUOFwfwvth/zkl4+Am1DId+v/ubXVt9cB7MK7r2c2A5yitwb83cD+
	 FvK2jBPYvtT6g==
Date: Thu, 10 Jul 2025 10:39:57 +0100
From: Lee Jones <lee@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Julien Panis <jpanis@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 0/8] mfd: tps6594: Add TI TPS652G1 support
Message-ID: <20250710093957.GE1431498@google.com>
References: <20250703113153.2447110-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703113153.2447110-1-mwalle@kernel.org>

On Thu, 03 Jul 2025, Michael Walle wrote:

> Add support for the TI TPS652G1 PMIC which is a stripped down
> version of the TPS65224. Support for the latter has already been
> merged. Refactor the regulator driver to ease adding new devices.
> After doing that adding the TPS652G1 variant is really straight
> forward. Some care has to be taken by the interrupt handling (of the
> regulator part) because there interrupts are used for voltage
> monitoring which this variant doesn't have.
> 
> As there are conflicts in the regulator tree (some constify
> patches) and my patches make use of them, only the first two (or
> four, that's up to Lee) can go through the MFD tree. Lee, could
> you please provide an immutable tag for the other trees to merge?
> 
> v3:
>  - (re)add dt binding patch that I've accidentally missed in v2

Ah, that explains it!

-- 
Lee Jones [李琼斯]

