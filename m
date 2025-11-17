Return-Path: <linux-gpio+bounces-28617-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF82C666FA
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 23:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 096C44E6366
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 22:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D74B531B80C;
	Mon, 17 Nov 2025 22:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fAZBAz0Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9E327FB18;
	Mon, 17 Nov 2025 22:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763419052; cv=none; b=dGLz2K6ZgcvijABZQ5mD/gAkNGYoVioDn2jfLIVKf5ahvcHLzNci/355Epk/wJZ36M+iuI49jzbIxBXXpcC2L3CC3ZXuem+0gh4k2dH29IibmdFipz88dBg6X4JtBmYimoIX+EP3sebs6/EsD2i4CkyaIt1of5AZCueVB/EJHtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763419052; c=relaxed/simple;
	bh=xDxKRjzNpJQd9tWAvceuE9e8NxUEtNSgHtGbSSwni7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DMGz/ZEFUv5c0FyMblNILij38XD2UN1IrjUrVC5QRE6sTb5WxYx8JldnBbqaDKaCz7EcbsGHRLPirSlnsZYc3Zjxi9tlv9xwehXtb8OMe8Bj7w13CMOeXJF78aTTjlEbFzDleNBiKUfqG4p40DxNTdmRv3Ll68rRyey5UKyU9AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fAZBAz0Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD852C2BCB0;
	Mon, 17 Nov 2025 22:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763419051;
	bh=xDxKRjzNpJQd9tWAvceuE9e8NxUEtNSgHtGbSSwni7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fAZBAz0ZwXz3E5r/LGBedPvzHPND5WaVQmqyYqF5FxVwaLfxEBC8YeQLaTObnVUTX
	 0hM/g1AhTb9ClSTdH7i1EfQSlp1P6Ck/UeeagdJ7yw0Qrv0RPZnq8FLNcQitIv4djk
	 amO/Eq1FVTXjNbKr79NnHsU6dIDVDZMBqqwiIChbPhqjEmIBuLvC8wETappBAkGXrz
	 Pv0ZsmLNoorNrOUtSZbtvYncsIvqzdE14om+sUEZz3HKZciq2gicAaRjrSj74U8VQ+
	 Z7PZ+o7WljfU76CRYU9L42bs/J003O6Q1T49hzfJxZOhE/fLnnRGirCyV9thls3tcK
	 /PDyKc3C2C++Q==
Date: Mon, 17 Nov 2025 16:37:29 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH] dt-bindings: gpio: mpfs-gpio: Add pic64gx GPIO
 compatibility
Message-ID: <176341904869.845657.970101427228139692.robh@kernel.org>
References: <20251117-grumbly-oversized-2215fe887181@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117-grumbly-oversized-2215fe887181@spud>


On Mon, 17 Nov 2025 15:59:18 +0000, Conor Dooley wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> 
> pic64gx GPIO is compatible with mpfs-gpio controller, add it with a
> fallback.
> 
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> 
> The diff here is kinda scuffed, because for some reason this binding had
> an "items: - enum" construct to begin with.
> 
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Linus Walleij <linus.walleij@linaro.org>
> CC: Bartosz Golaszewski <brgl@bgdev.pl>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: linux-riscv@lists.infradead.org
> CC: linux-gpio@vger.kernel.org
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
>  .../devicetree/bindings/gpio/microchip,mpfs-gpio.yaml        | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


