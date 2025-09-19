Return-Path: <linux-gpio+bounces-26399-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D25BCB8A16B
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 16:52:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93E3D1C2418B
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 14:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1CD3161BB;
	Fri, 19 Sep 2025 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MVYAu8fd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C77D3161AC;
	Fri, 19 Sep 2025 14:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758293489; cv=none; b=sUhL8QgotVEApWVZ8VQKvUICoD6HVOIoEpo5G2dUbXiHDZcWuCr5lbRsCzT7bsKh7GIn8zLJgaoS5qNxS/q7j3/UI2xFNk5qoTl/ziaamToASRDSLxjUTIvDzIZ1LSNcw92jwYAAP/nrPmTFbvvt3Bi6z+9N7OlU5xV7MMtpdj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758293489; c=relaxed/simple;
	bh=ltSbKh4n47FzGRqG8/CEVAcFRLma3NAxjpUJcx3cn0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gX3T9u7RJGF4/Nqhbz9sUCrc+KE5Vo63XRpH49og1SJmqf56W7KLDDsA/q5k0c7kkdxd1HbwjZjPeR0pbCjIoZrk/44aOaiaQQ3Vgy8SJFQRtEqNdDmz3ua+evIcy3rbxe2sqNqVqiC4uPdSIHhXs8MDfCize465vR3rq0hN9pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MVYAu8fd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99218C4CEF0;
	Fri, 19 Sep 2025 14:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758293488;
	bh=ltSbKh4n47FzGRqG8/CEVAcFRLma3NAxjpUJcx3cn0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MVYAu8fd2IftIHC95aUjjJiEO0whJ69qIM7P7FPm66q/1KYPBQZcRi+FQnrndtgO2
	 bVpjt/Usk9yzCb9XU208L1bGvJEzZlx0yUYq8iyZNZIST/ARjUfNfSTKCHbW33xyL8
	 Pn9VVgK0KUZr1uCxcTcSXz0H2J8JR4jVwaA9NCGHBHfJhzzVuykUUXGPCqM+x1TXNz
	 E6qWOxQ8BfccX49o2P8koeGXZU32rRUplPa3YZclRuSwXkH1p5W+85e/gfb2NJ4O/9
	 NA3VHk7zSBFOqO6G43f74qadqFJNYKBjn4u2OXR4IeVMfuC5kPK23SFq53iIK/NdoI
	 8/uu0CSg55RLQ==
Date: Fri, 19 Sep 2025 09:51:27 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 6/7] dt-bindings: soc: fsl: qe: Convert QE GPIO to DT
 schema
Message-ID: <20250919145127.GA852815-robh@kernel.org>
References: <cover.1758212309.git.christophe.leroy@csgroup.eu>
 <5c4f831404857dd6eeefebe2ecdf2bb8ad503538.1758212309.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c4f831404857dd6eeefebe2ecdf2bb8ad503538.1758212309.git.christophe.leroy@csgroup.eu>

On Thu, Sep 18, 2025 at 06:23:26PM +0200, Christophe Leroy wrote:
> Convert QE QPIO devicetree binding to DT schema.

Why is this in linux-next when it still needs review? Anything in 
linux-next already gets removed from my review queue (patchwork), so 
you're lucky I'm looking at it. It's also not tested probably for the 
same reason that b4 couldn't figure out how to apply the series.

> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v6: Comments from Rob taken into account except the comment on fsl,<chip>-qe-pario-bank becoming fsl,chip-qe-pario-bank as I don't know what to do.
> ---
>  .../gpio/fsl,mpc8323-qe-pario-bank.yaml       | 49 +++++++++++++++++++
>  .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     | 26 +---------
>  2 files changed, 50 insertions(+), 25 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> new file mode 100644
> index 000000000000..0dd9c0e6ca39
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml#

Did you test this? No, because this is wrong and the tools will tell you 
so I don't have to.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale QUICC Engine Parallel I/O (QE PARIO) GPIO Bank
> +
> +maintainers:
> +  - Christophe Leroy <christophe.leroy@csgroup.eu>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,chip-qe-pario-bank

You have to list out every <chip>. Lots of examples in the tree, but 
like this:

oneOf:
  - items:
      - enum:
          - fsl,mpc8360-qe-pario-bank
          - fsl,mpc8569-qe-pario-bank
      - const: fsl,mpc8323-qe-pario-bank
  - const: fsl,mpc8323-qe-pario-bank


> +      - const: fsl,mpc8323-qe-pario-bank
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - '#gpio-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio-controller@1400 {
> +        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
> +        reg = <0x1400 0x18>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +    };
> +
> +    gpio-controller@1460 {
> +        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
> +        reg = <0x1460 0x18>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +    };

We don't need 2 examples of the same thing.


