Return-Path: <linux-gpio+bounces-28922-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 67979C74BE1
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 16:08:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A181B4EA4DC
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 14:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E7233EB11;
	Thu, 20 Nov 2025 14:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PldiHqj7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231DB34845C;
	Thu, 20 Nov 2025 14:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763650673; cv=none; b=s6LXNV+7ufebRm7dp8bbOgU7dKZB93SyHjzyd208LxS9APw2tY7mWAGnIfFTdXMuNdxgJTWPLustQPKro0xlCNUFm5RawrX39++YeVvR6ISV6l/HkqF6+3i2K1yklfoRLRKaWQPTKht9mWSjFu0Kw6viwL956fYBKXSjAN5krII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763650673; c=relaxed/simple;
	bh=FllQqtE4orPMdrZNm1F58mK954c2tYj0EmfaCYY+KjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SG7EM/rGT7bzXLp5dsiWlemRpo0kCJyNOxfu6d1RelHaBT3I5A6/eKK67ErITivTEXw/14hJlm3eG2h281EysioeAwgze1gw+aw+TQPW7TSL6o1FseGWRJJi6vggmX/KP60A8fy1WBEl1R5dBgMMVE8SsqKClnqLMjS31w9+ofI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PldiHqj7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506B2C4CEF1;
	Thu, 20 Nov 2025 14:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763650672;
	bh=FllQqtE4orPMdrZNm1F58mK954c2tYj0EmfaCYY+KjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PldiHqj7a88UuC99KV/6r9CI3Hbw/AE97hYFf63llFIxk0BXWlw50O9GsyqT3j18/
	 7IJUWaDkTWFGidJVsmT4YVmFcfoov9soi2ADP6KgWr7DVz296JBbBkovSQWUxn5hLr
	 RYrKNBHS8U3dcr2eOuhABSTO1bCR1LeieEoMoFm9LTxLRnLCGh1XSZKA/G8uwHxcfh
	 dXIS24jLPsxu7T3Bg7ggmVvhL+qgLPzqEDIzqEixBshgKjZvnJ/UYKtKg9TZntV3mZ
	 j5PvPX96TeBtgAsnOUDTDn0pdwqsWstH9WLStZ/rJTc/220Ef3fZvy5alre/dWRChY
	 cerOLhAPjOK4A==
Date: Thu, 20 Nov 2025 08:57:50 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sander Vanheule <sander@svanheule.net>
Cc: linux-leds@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	Pavel Machek <pavel@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v8 1/6] dt-bindings: leds: Binding for RTL8231 scan matrix
Message-ID: <176365067018.1256117.16826379130126022423.robh@kernel.org>
References: <20251119200306.60569-1-sander@svanheule.net>
 <20251119200306.60569-2-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119200306.60569-2-sander@svanheule.net>


On Wed, 19 Nov 2025 21:03:00 +0100, Sander Vanheule wrote:
> Add a binding description for the Realtek RTL8231's LED support, which
> consists of up to 88 LEDs arranged in a number of scanning matrices.
> 
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> ---
> Changes since v7:
> - Move $ref and add unevaluatedProperties for led nodes
> - Drop example redundant with MFD binding
> 
> Changes since v6:
> - Relax description formatting
> - Enforce address format for led node names
> - Use absolute paths for schema references
> ---
>  .../bindings/leds/realtek,rtl8231-leds.yaml   | 136 ++++++++++++++++++
>  1 file changed, 136 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


