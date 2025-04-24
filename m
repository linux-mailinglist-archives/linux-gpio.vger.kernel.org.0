Return-Path: <linux-gpio+bounces-19237-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A49BA9A58C
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 10:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7008C7A5493
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 08:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC641F4634;
	Thu, 24 Apr 2025 08:15:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BCD19994F;
	Thu, 24 Apr 2025 08:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745482527; cv=none; b=s7YDqkjJ7u/HWfmIhLwSKt6d/VV5e6qsyn1KrbQWqUDw/cFGRXLws80hJit06egSotZLv61zqplG+GTrcKoBj5sj3p9L/IdciEcZPZrdjr1yq/usPrYNNENvZvsVlVtBWkCA075W0NIHF4VaP141FJSN8vQZgyAQ26dNcbdLptw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745482527; c=relaxed/simple;
	bh=p1rDUK8rdI5Szwyaio0ijicup4XX8ctN1sOZD2658Mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fsIp6QZTpFpIYF5TsbsLXYC0xuqdiaXGWXOkQogVPK4Y77ERcgBzt7mo8yzKMmm/hryKDrJydzgqpSdXMgiXjvLo8eFAVgUF6v29ZX4rA3XPS7bqy/xODQuxxBnXLJJ/S/embR6YdTo0kj0sLlUD75eI3pc6qZ7aBNdoUJfipSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Received: from [192.168.2.35] (unknown [98.97.25.173])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 712A4B2C201A;
	Thu, 24 Apr 2025 10:15:19 +0200 (CEST)
Message-ID: <60891c52-eeca-4358-8f38-789533016495@freeshell.de>
Date: Thu, 24 Apr 2025 01:15:16 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: starfive,jh7110: add
 PAD_INTERNAL_* virtual pins
To: Icenowy Zheng <uwu@icenowy.me>, Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20250424062017.652969-1-uwu@icenowy.me>
 <20250424062017.652969-2-uwu@icenowy.me>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20250424062017.652969-2-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/23/25 23:20, Icenowy Zheng wrote:
> The JH7110 SoC could support internal GPI signals to be routed to not
> external GPIO but internal low/high levels.
> 
> Add two macros, PAD_INTERNAL_LOW and PAD_INTERNAL_HIGH, as two virtual
> "pads" to represent internal GPI sources with fixed low/high levels.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
> index 3865f01396395..3cca874b2bef7 100644
> --- a/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
> +++ b/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
> @@ -126,6 +126,10 @@
>  #define	PAD_GMAC0_TXEN		18
>  #define	PAD_GMAC0_TXC		19
>  
> +/* virtual pins for forcing GPI */
> +#define PAD_INTERNAL_LOW	254
> +#define PAD_INTERNAL_HIGH	255
> +
>  #define GPOUT_LOW		0
>  #define GPOUT_HIGH		1
>  

Asking about the choice of 255 and 254 values for virtual high/low pins,
here. There's not much result when grep Linux source for 'virtual pin'
to compare with. Are these the best values for this approach?

What happens when devicetree has in it to route PAD_INTERNAL_LOW to
PAD_INTERNAL_HIGH and other unlikely combinations?  Or a devicetree blob
with this computed value is paired to Linux kernel that does not have
the code to handle these virtual pins, for compatibility concern?

Do we know yet if JH8100 will share some of this design?

-E

