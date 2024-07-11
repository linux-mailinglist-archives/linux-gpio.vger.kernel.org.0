Return-Path: <linux-gpio+bounces-8190-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F18392F214
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jul 2024 00:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01F5EB22C38
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2024 22:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18C81A01B3;
	Thu, 11 Jul 2024 22:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ks8ELnCm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33AD15531B;
	Thu, 11 Jul 2024 22:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720737379; cv=none; b=W4cgAYu4DikQyXLpCSN7iU8RZLjpd9UP9wHtmgdMZp84w/2um9Qunc4NACokUYxylgxizLwZ3j8Cy3YPR4IID7UylV30afDND68IdxHaUGTtkHuqLtD1kHB7iWUptsH/SAJ6/vpirZCF/WEX6+Nf46uCRPq8dSQWjEut8f5F+xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720737379; c=relaxed/simple;
	bh=pirreVvy4JZn8lrnWfmD1cwECwdJ1hvtT3Z1k6qiOwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NnhZTnCig2g4Cq4v/dhrr8UN9q9j2REX7/kRmmCWpifZWtjDn328hN6MJqB/HSbQS2Zq8akYoS2p/IgtLua8XWnYDiXVi3w6wKbOwqksqHTfBSCxVvQfYB0UKHlY56oZyc/s/W/+6irT8iwdUnZ5YVeodyakl5M+9lBkFo0iHxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ks8ELnCm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B487C32782;
	Thu, 11 Jul 2024 22:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720737379;
	bh=pirreVvy4JZn8lrnWfmD1cwECwdJ1hvtT3Z1k6qiOwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ks8ELnCmsBZ4ZxMYxC8SuWAARCYiWRJZth0Zyt2UkPp/K/lMnmocSf81YBl6SiiNT
	 9EmZM/rP13whx+pEGYHjq33WVwsaXcFI04u4h0Xdp3CHgQbxHRS5T/cwQSPlutGUPQ
	 w/XSc9Y3yIO6s3CTlWHuiUuS72Xs1FDIT1kTTUyj+ex6Je0OVJTO3FRoYn2+haZdle
	 H4A1enmwEcV7wAyyeTpVcElD1vWsHCgmL4cP6H8t/BSFhWxXaUhMPRbtpMFaPLNtZO
	 sMs6hSmwYtuq5Fah4gfxcu5YiQFlKM6XDscniSMdF/dEBhjbQIOdx09ch5PTd3NBs/
	 /A5ym9rdYGSIA==
Date: Thu, 11 Jul 2024 16:36:18 -0600
From: Rob Herring <robh@kernel.org>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
	Dhaval Shah <dhaval.r.shah@amd.com>,
	Praveen Teja Kundanala <praveen.teja.kundanala@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	saikrishna12468@gmail.com, git@amd.com
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: Add support for Xilinx Versal
 platform
Message-ID: <20240711223618.GA3237343-robh@kernel.org>
References: <20240711103317.891813-1-sai.krishna.potthuri@amd.com>
 <20240711103317.891813-2-sai.krishna.potthuri@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711103317.891813-2-sai.krishna.potthuri@amd.com>

On Thu, Jul 11, 2024 at 04:03:15PM +0530, Sai Krishna Potthuri wrote:
> Add Xilinx Versal compatible string and corresponding groups, function and
> pins properties to support pin controller features on Versal platform.
> 
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> ---
>  .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml | 509 +++++++++++-------
>  1 file changed, 329 insertions(+), 180 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
> index ce66fd15ff9c..68c378b17f49 100644
> --- a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
> @@ -28,7 +28,9 @@ description: |
>  
>  properties:
>    compatible:
> -    const: xlnx,zynqmp-pinctrl
> +    enum:
> +      - xlnx,zynqmp-pinctrl
> +      - xlnx,versal-pinctrl
>  
>  patternProperties:
>    '^(.*-)?(default|gpio-grp)$':
> @@ -46,196 +48,334 @@ patternProperties:
>              description:
>                List of pins to select (either this or "groups" must be specified)
>              items:
> -              pattern: '^MIO([0-9]|[1-6][0-9]|7[0-7])$'
> +              allOf:
> +                - if:
> +                    properties:
> +                      compatible:
> +                        contains:
> +                          const: xlnx,zynqmp-pinctrl
> +                  then:
> +                    pattern: '^MIO([0-9]|[1-6][0-9]|7[0-7])$'
> +                  else:
> +                    pattern: '^((LPD|PMC)_)?MIO([0-9]|[1-6][0-9]|7[0-7])$'

Did you test whether this works? It doesn't because the schema is 
nonsense. The schema applies to a property's value, but the "if" schema 
applies to a node. And it's not even the node you are at, but the parent 
node. IOW, there is no "compatible" in this node.

The 'else' schema covers both cases, so I'd just change the pattern and 
be done with it.

However, based on the rest of the patch, you should just do a new schema 
doc. There's little overlap of the values.

Rob

