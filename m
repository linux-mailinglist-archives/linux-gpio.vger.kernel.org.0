Return-Path: <linux-gpio+bounces-30390-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CD3D0E8F0
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 11:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3F2930056D2
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 10:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC692FE053;
	Sun, 11 Jan 2026 10:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hcMWFVSm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A098E1A5B84;
	Sun, 11 Jan 2026 10:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768126725; cv=none; b=GsTJ/vgNlu94tvKlqlKMSKyZdUzFGBeQopfvD9HAuADMneGIOKwdVJAQix8/FPen/CN3ERe2gKlyXBHwaeaFRYD8cFCb/sNHHF5Vvyo4PSstBTfwwG6859lBmQ9+dh+av+88vnBHc8xLjMx4vPz1nh43z0jk9LjPOkz4fJeIg/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768126725; c=relaxed/simple;
	bh=2R3Z7M0zSvL7DPn1AI4tWPhor2GuFLNNBnThZc5CUZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rYNUctOVssu9TtbhDCUHTc/aZDE9VZkBVL9pcr4K6T3frcmWVGFfhjsJlazonks7CcciA847RQCLu0NFCNXqOFQNfwOcOhdv2hn4ivbARkT6DJCP6Rpzt1vhN3psDUOOU2BGGdb442X1XTIHFNWzOU7vYTTKs74k08Q+8jZwlaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hcMWFVSm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AFDFC4CEF7;
	Sun, 11 Jan 2026 10:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768126725;
	bh=2R3Z7M0zSvL7DPn1AI4tWPhor2GuFLNNBnThZc5CUZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hcMWFVSmf3lnydeBLNjReZqnDjlBPsElZGPj/4UgIgvmkxtktdycdEtphLZdV278E
	 QNZK8IUoGOAYPgcQbX7fXscnED2TKQEpZoGk7nG5kdu1OTyyMQHFhle0A0J0N+xLj2
	 nLoU7qi4sxnkxNomp53XQ9aJEf3oUMq6kHrqp4IOLNWVE52EyC2AbU0WcFwGM1IJQY
	 VOuMyPqIyDaHXzOb4Ql3ZlGc6cuD41ssjr11OidYtGV7y0N6bDslB2oEXxGuo36lYN
	 2VVu8XUMubVqCpVpXjXAPPOiptvSmqE8FmByyGDu+t9wU9rVfGT4u6ZsG8MECN42LS
	 BcONQFKSNjilQ==
Date: Sun, 11 Jan 2026 11:18:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stafford Horne <shorne@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux OpenRISC <linux-openrisc@vger.kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/6] dt-bindings: gpio-mmio: Add opencores GPIO
Message-ID: <20260111-bold-wolf-of-champagne-58fac7@quoll>
References: <20260109134409.2153333-1-shorne@gmail.com>
 <20260109134409.2153333-3-shorne@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260109134409.2153333-3-shorne@gmail.com>

On Fri, Jan 09, 2026 at 01:43:53PM +0000, Stafford Horne wrote:
> Add a device tree binding for the opencores GPIO controller.
> 
> On FPGA Development boards with GPIOs the OpenRISC architecture uses the
> opencores gpio verilog rtl which is compatible with the MMIO GPIO driver.
> 
> Link: https://opencores.org/projects/gpio
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
> Since v2:
>  - Fixup patch to simply add opencores,gpio and add an example.

Simplify? You completely changed the meaning of binding here - now
device is not compatible.

I don't know which one is correct, but your changelog must explain why
now devices are not compatible but they were before.

> Since v1:
>  - Fix schema to actually match the example.
> 
>  Documentation/devicetree/bindings/gpio/gpio-mmio.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> index ee5d5d25ae82..d44edc181e0a 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> @@ -23,6 +23,7 @@ properties:
>        - ni,169445-nand-gpio
>        - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
>        - intel,ixp4xx-expansion-bus-mmio-gpio
> +      - opencores,gpio
>  
>    big-endian: true
>  
> @@ -160,3 +161,11 @@ examples:
>              intel,ixp4xx-eb-write-enable = <1>;
>          };
>      };
> +
> +    gpio@91000000 {

Please do not grow the examples if they are exactly the same as other.

> +        compatible = "opencores,gpio";
> +        reg = <0x91000000 0x1>, <0x91000001 0x1>;
> +        reg-names = "dat", "dirout";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +    };
> -- 
> 2.51.0
> 

