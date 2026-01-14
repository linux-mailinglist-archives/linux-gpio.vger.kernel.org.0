Return-Path: <linux-gpio+bounces-30517-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BC8D1D7E5
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 10:25:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9F7B93002527
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 09:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E089B3815F7;
	Wed, 14 Jan 2026 09:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KF/FVP69"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F902DECB2;
	Wed, 14 Jan 2026 09:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768382503; cv=none; b=P5hOKMN1Ueju+jF3nINNTSrBCoO1n5MUe83K4Se7yBlp+9hbNb1p8coezRx2lyVwMOg4owhfmummhO1z6j9n2G40oXHLnoQKoMAXoXPWI+G0LmY2JfikwFBnQ3971/2EnB6gqpoIqJ/LhI2f3YP+oxqU1jtS+leUTw+NTqhp/yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768382503; c=relaxed/simple;
	bh=f2i7Ca7kE/tSd54T6g1tBC4smOuu0UifHpyMR2pxBlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DwP3WDY3lSDRYFUWXGKToj86ACDFlD9roFRQpQQE4edUpv3UDdeTs1dTHj635NppwpfQFVoaZwBlPBjknhK7cWNY/Amv80JUHmq78IcehRo+oqGgBIjkpDOZKi/ME4qxWLKR1IgIVZNdl5f0al3xj6moEFtjTnX2EtdjXijHdIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KF/FVP69; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9959EC4CEF7;
	Wed, 14 Jan 2026 09:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768382503;
	bh=f2i7Ca7kE/tSd54T6g1tBC4smOuu0UifHpyMR2pxBlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KF/FVP69hZkhwcLLAhCgtKUzKAURzqMtPpW/houIW0eg5evNCjlo/ZfJwrHR3u2Ew
	 XtZmNLFnop1ZY1/54B5b/Lgj0Bmef/+RhSmOOMjZeVshwoixK3t9FUPOYORV6JzOSE
	 VUkUN829dlCYf1kslFr5EoDc6in3lNwGZbt+4OSXkKOq4ViPc4B1emIf5uqY5bKb7l
	 KwVzUjFYDs7aov98Ho2nKSEks9ihLAeRs6XZioyASFRNQAbIRAgSWTvoROm6Xqrn78
	 KXSVu/3jb/hlE0BcTLyqr08apalgMqaadJf12jRqhnZeD0w12sqTF54XeL/Fz/Mo+h
	 CJBZ3kM6FgUdQ==
Date: Wed, 14 Jan 2026 10:21:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: mcp23s08: Add multi-chip
 example
Message-ID: <20260114-woodoo-ubiquitous-turtle-bddbee@quoll>
References: <20260113-mcp23s17-multiple-addr-names-v1-0-f14b60f92c82@yoseli.org>
 <20260113-mcp23s17-multiple-addr-names-v1-2-f14b60f92c82@yoseli.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260113-mcp23s17-multiple-addr-names-v1-2-f14b60f92c82@yoseli.org>

On Tue, Jan 13, 2026 at 03:29:48PM +0100, Jean-Michel Hautbois wrote:
> Enable gpio-line-names property in the schema and add example showing
> how to use it with multiple MCP23S08/17/18 chips sharing the same SPI
> chip select. Names are assigned sequentially in hardware address order.
> 
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> ---
>  .../bindings/pinctrl/microchip,mcp23s08.yaml       | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,mcp23s08.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,mcp23s08.yaml
> index e07f4723de17..667be31b6da3 100644
> --- a/Documentation/devicetree/bindings/pinctrl/microchip,mcp23s08.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/microchip,mcp23s08.yaml
> @@ -42,6 +42,8 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  gpio-line-names: true

Variable number of GPIOs? No constraints possible at all? 

> +
>    reset-gpios:
>      description: GPIO specifier for active-low reset pin.
>      maxItems: 1
> @@ -159,3 +161,34 @@ examples:
>              microchip,spi-present-mask = /bits/ 8 <0x01>;
>          };
>      };
> +
> +  - |
> +    /* Multiple chips sharing same SPI CS with gpio-line-names */
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        gpio@0 {
> +            compatible = "microchip,mcp23s17";
> +            reg = <0>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            spi-max-frequency = <10000000>;
> +            /* Two chips at hardware addresses 0 and 1 */
> +            microchip,spi-present-mask = /bits/ 8 <0x03>;
> +            /*
> +             * Names assigned sequentially in address order.
> +             * First 16 names for chip at address 0 (GPA0-7, GPB0-7).
> +             * Next 16 names for chip at address 1 (GPA0-7, GPB0-7).
> +             */
> +            gpio-line-names =

Just extend existing example. There is little point in adding one new
example per one new different property.

Best regards,
Krzysztof


