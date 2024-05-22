Return-Path: <linux-gpio+bounces-6575-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 496548CC382
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 16:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 058062844EA
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 14:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA911C683;
	Wed, 22 May 2024 14:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VyKt44RB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8CE171D8;
	Wed, 22 May 2024 14:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716389327; cv=none; b=CnWuG+ZRjDqJaCV6tNAgUEeMe2hAi59A5DqEMhPmYsDKMEMR6JHtv6Ia+MBcamdKZcF+2P83ABKG2BT4xxz50IPhYB5aExsVotFZ+yi443BFIa9F49mrAHkxoDQxrdGItMYwEKNoENYNGDIyteEgZnhY/YypFlPYfYxxVhNhqxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716389327; c=relaxed/simple;
	bh=REZ/hGrrzdHHLNt53xBnhdfv5bXUdy4C2BSdNp8ahJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tx/LT9YCMuEpmmHMKyGnjRTGbQ3J7wGvO4LYbJsutjTfugSj1MDo0jvYJ6LmZGB1Ez+S/dAeHxZCPoU6y6bmAhuEYLvSLRHoIjqOKFA6aNxQ8sFiw/QR/Q12ELc9azLJQ/UmhzYjTGYC0KmV4H20a4Ue9KqvsqySCV3XSNB4Ga8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VyKt44RB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E77FC2BBFC;
	Wed, 22 May 2024 14:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716389327;
	bh=REZ/hGrrzdHHLNt53xBnhdfv5bXUdy4C2BSdNp8ahJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VyKt44RBSErFmvyFyzhROeJTgR8rCsm4yXCS9l06pIafvLLNuYwp7hwsY+M6svEpl
	 b9ZjlA8CLjhiApVDHBoVORImCP7OJ91F5N2wi/62ArL8mWQrKAQF3p2cokY/6Mnvqi
	 H8FWXMDjNn9+NQXMzfYJrjs8iLBTY0jmakihRNxNHHhya41G2SWXnAuti2U+UTRTPL
	 9KfaENgbb4MgEaVj/MqVSrvAS4IquTOBbpKZoY8xczLlGyVLHcEDvLg/zU0QxOm46Q
	 5KIdK0uuJPvPi6dbRoUxyLwCEjEExI2nlJiLdr74fL4i+5zJ0t1TvCD7WDudARHD37
	 +2T/VfDE5OSUA==
Date: Wed, 22 May 2024 09:48:46 -0500
From: Rob Herring <robh@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
	Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: xilinx: Add support for
 function with pins
Message-ID: <20240522144846.GA3277292-robh@kernel.org>
References: <20240520150424.2531458-1-sean.anderson@linux.dev>
 <20240520150424.2531458-2-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520150424.2531458-2-sean.anderson@linux.dev>

On Mon, May 20, 2024 at 11:04:23AM -0400, Sean Anderson wrote:
> Support specifying the function per-pin. The driver doesn't care
> whethern you use pins or groups for this purpose.
> 
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
> 
> (no changes since v1)
> 
>  .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml | 344 +++++++++---------
>  1 file changed, 176 insertions(+), 168 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
> index f13d315b5d5e..d3b258245e28 100644
> --- a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
> @@ -42,179 +42,187 @@ patternProperties:
>          $ref: pinmux-node.yaml#
>  
>          properties:
> +          pins:
> +            description:
> +              List of pins to select (either this or "groups" must be specified)

Express as a schema:

oneOf:
  - required: [pins]
  - required: [groups]


> +            items:
> +              pattern: '^MIO([0-9]|[1-6][0-9]|7[0-7])$'
> +
>            groups:
>              description:
>                List of groups to select (either this or "pins" must be
>                specified), available groups for this subnode.
>              items:

