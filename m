Return-Path: <linux-gpio+bounces-25420-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1396B40F58
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 23:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B17AD16741F
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 21:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6887233471B;
	Tue,  2 Sep 2025 21:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s+keo995"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1769B1DB958;
	Tue,  2 Sep 2025 21:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756848300; cv=none; b=WyrhbGCJZKz5wak/ZWr+dY9GmFlz/HsK0yKtTDTl2i8LLt26A2YIu71JMhdARQwXuvQtWg3OlwqbrchlhggJmGZAYXZ3EuRp+/3b2wfcfDcYy9eUFJgi8tx1V6HUXXiuaddi5Wx2ubA/ZhIY9Chj2vxyG/pSzGj7CrO8gIi4H/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756848300; c=relaxed/simple;
	bh=pIkxlL/RsKrNHjL9bzr/Ff/bVEvw0mwr+CfKjwjIOWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TCqLggV+jYPyeWUXXz/fGWKJrefgiEPyyBY8NFDuVKBlwL4HpP6Rn6s0JYwriMRvQxbr7QY5JcVOHic1DdK3gT7Bk5KKa2u/frmhVrsa4NdwK1nySAsl/fU5EnkjBbg+OJWyWSZbHBfpsOeLJi23hoI5jLFsrioHe2uzKANP1jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s+keo995; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 772A0C4CEED;
	Tue,  2 Sep 2025 21:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756848299;
	bh=pIkxlL/RsKrNHjL9bzr/Ff/bVEvw0mwr+CfKjwjIOWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s+keo995h383ZM6+v2G9KoeMPR42keu0j33nhQxYc6hfkUa2nW0X1VT4IikS1jlju
	 7BpXG4Tr+rbHR9sLEMO6qebGvsnUgQALfJ6iuUQLYwdm/TsGaL6hhJphBF5jk3cPFs
	 pmH9ySG+xHDliQ0PVjLWLx3URJVjO8AuyvndLsSqL40j750mGjHLoRYacugUjGiPSe
	 KrQQXllhd8pbTgz09P95VO70njQKboE5y8wbztLV+yerxWcae9AtTJYPPM0v0CnnYY
	 xTTqopJeLy+spwriyMqSMLmU67yEsqcWHy517VjzNj5OlTBErvr8WGdQmucpEQApWr
	 gGia+LdgY2fuA==
Date: Tue, 2 Sep 2025 16:24:58 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 6/7] dt-bindings: soc: fsl: qe: Convert QE GPIO to DT
 schema
Message-ID: <20250902212458.GA1184537-robh@kernel.org>
References: <cover.1756727747.git.christophe.leroy@csgroup.eu>
 <48b4e7b25878b94dcb738f8239c815be484cf9c9.1756727747.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48b4e7b25878b94dcb738f8239c815be484cf9c9.1756727747.git.christophe.leroy@csgroup.eu>

On Mon, Sep 01, 2025 at 02:05:13PM +0200, Christophe Leroy wrote:
> Convert QE QPIO devicetree binding to DT schema.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v5: New
> ---
>  .../fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml | 53 +++++++++++++++++++

This should move to bindings/gpio/

>  .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     | 26 +--------
>  2 files changed, 54 insertions(+), 25 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml
> new file mode 100644
> index 000000000000..e6ba319a75c1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale QUICC Engine Parallel I/O (QE PARIO) GPIO Bank
> +
> +maintainers:
> +  - Christophe Leroy <christophe.leroy@csgroup.eu>
> +
> +description:
> +  Bindings for the Freescale QUICC Engine Parallel I/O (PARIO) GPIO controller.

Just drop if nothing more to say than 'title'.

> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,chip-qe-pario-bank
> +      - const: fsl,mpc8323-qe-pario-bank
> +
> +  reg:
> +    maxItems: 1
> +    description: Offset to the register set and its length.

Drop the description. That's every reg.

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
> +    qe_pio_a: gpio-controller@1400 {

Drop unused labels.

> +        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";

Doesn't match the schema. 

> +        reg = <0x1400 0x18>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +    };
> +
> +    qe_pio_e: gpio-controller@1460 {
> +        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
> +        reg = <0x1460 0x18>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +    };

