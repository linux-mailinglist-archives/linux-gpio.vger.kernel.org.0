Return-Path: <linux-gpio+bounces-22690-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E46AF6BCB
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 09:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FE2A7B312D
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 07:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 761CC299947;
	Thu,  3 Jul 2025 07:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GnITBC+z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274C2224AF3;
	Thu,  3 Jul 2025 07:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751528512; cv=none; b=u8uyo9P095AgHgjkyRn//zlSSHTSks178LLCKHqW2JJ1pYfUnhOvGMLOyj1kwpNfJWZFZV0B/PEBFg6lW33bFNvJ90dJQSrHT0wMOmsB636NacefOMjGvm71a/7a2fC1Ea59/BGtT5NAJm2IZCiZwrxOJvpTeRUtMFiqoe6u58w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751528512; c=relaxed/simple;
	bh=62GHx5qjp4SjOImNUi/iLutYVSnoegTnLhSY38r/7Gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=it9v6lv5T2en+chLj9hhVHG7+VGWCgAeM9S3wngqKhbGmWlc8Do1jSHLJ3se1h60dX7uMB06Pq0y8eOlNQU0EH8q38aI+IN66SQTXED8bO3BJF4XwN9fphi+XMcfzaKz2Gik44LIB801zy3gjcKyevDjQqrkiNUlyrYAhPRgo+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GnITBC+z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E62DC4CEE3;
	Thu,  3 Jul 2025 07:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751528511;
	bh=62GHx5qjp4SjOImNUi/iLutYVSnoegTnLhSY38r/7Gs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GnITBC+z2PQjXhBRfw47VJ67SEXPXKP2mbynv0Do6IOM4hqar5O112dzqoG47scS5
	 iVoVXayQ71XP/Ibpd0NmctrgQ4S99DtI4cS9aUGEU180rCAOXIde229YJJIKeSuoVZ
	 HOoiG1Bla+PJL4cm/c+0lbLbst3l5vCTeUCoYQ0+D3+4CrjcFeSAQLh+FXifgz7CDs
	 oXaWqKC4E4lHhELnTQOx9W5aYLfr5oLM6lPLG1ZQxQlwErsQp9ntYkWXQODdn/6fWB
	 Xfa+BdtVTPw5XdncKj1UVInmwpcrGvq7gPHpPGszDeCd73cwrMUeYyOZNpPV4unGkk
	 aZEp2XyTdxSvw==
Date: Thu, 3 Jul 2025 09:41:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: document the Milos Top
 Level Mode Multiplexer
Message-ID: <20250703-daring-burgundy-limpet-a1c97e@krzk-bin>
References: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
 <20250702-sm7635-pinctrl-v2-1-c138624b9924@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250702-sm7635-pinctrl-v2-1-c138624b9924@fairphone.com>

On Wed, Jul 02, 2025 at 05:56:16PM +0200, Luca Weiss wrote:
> Document the Top Level Mode Multiplexer on the Milos Platform.

What is Milos platform? Does it have some sort of model number how we
usually expect? Wasn't this SM7325 or similar?

The problem with such new naming that it awfully sounds like family
names, so just expand the name and explain it.

> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../bindings/pinctrl/qcom,milos-tlmm.yaml          | 133 +++++++++++++++++++++
>  1 file changed, 133 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,milos-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,milos-tlmm.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..0091204df20a0eca7d0d0e766afcb8d08042b015
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,milos-tlmm.yaml
> @@ -0,0 +1,133 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,milos-tlmm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. Milos TLMM block
> +
> +maintainers:
> +  - Luca Weiss <luca.weiss@fairphone.com>
> +
> +description:
> +  Top Level Mode Multiplexer pin controller in Qualcomm Milos SoC.
> +
> +allOf:
> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,milos-tlmm

Before you start adding such 'milos' all over the code, you need to
update the rule for compatible naming. I don't know how thus I would not
recomment the switch from obvious model number to non-obvious cryptic
alias.

Best regards,
Krzysztof


