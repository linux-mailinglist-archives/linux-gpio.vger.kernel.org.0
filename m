Return-Path: <linux-gpio+bounces-26400-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AB7B8A415
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 17:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 159033B6BB9
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 15:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95EBB3191B1;
	Fri, 19 Sep 2025 15:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DU3dHtFI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A84318151;
	Fri, 19 Sep 2025 15:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758295462; cv=none; b=F86irA1e1f8rF/4cfM1NZ7jAUQnpUI9ppn7+XC5UmBI6NvlWoSPDV+0S9S5G30PH+XmqU6OFSpdJUDglkvZp3bpXo8sZBFqkcM7gDdSF0pYBPgkiO5yenpyIPYJAjfBuJyT7xJlOoVGMfHmmMApmYDXR/telfBZWhL9H1fXvDP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758295462; c=relaxed/simple;
	bh=ABPSXlxAq7jRyiDCS/EVwlVL/meoOY0nO0Ad+jU4kDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KXTep4CrG4E+Iw5IEfZkoiZBrGwdYQ4DJpYfM0/Tz5/bjxFUZoMuYaK4Rkyb9yevrICtVdGNdUdRKf4CEuPEA8+78LjC9zSKoOpKs0IGN50R7jrwJb4povObhrdXq7AT1IyZwMVL0PFmKqohgTybleT+Cr+bPSrM4vXv0LPeF/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DU3dHtFI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B27C4CEF0;
	Fri, 19 Sep 2025 15:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758295461;
	bh=ABPSXlxAq7jRyiDCS/EVwlVL/meoOY0nO0Ad+jU4kDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DU3dHtFIBsAxB7Pt5UVMSZJt7VS4WcAeAutUWseQBKC3/LV2iFNdTkOSl/JwGx2i/
	 sLZdGnErEYEAnsGyaijiiaZ6WDIOVntvtMC7lgCKAFrGN08e1if82OrLI+K3F7dmpO
	 MLBQHh9Ijh22VanE3obrw/2WwaxYSWN3nwNB4Cu3c+AFaFgX6iNk5WStniMZxlCaAQ
	 DDBhLjgbgo56vcWx/G2yobWmdru3hZbMEUfkasPAqnoC5ixr+oewGsXXV9oTTPY9PM
	 keZff9OUrkv1q5YI9gzQkiqRnXErR7arzVhi76QCBOFtJ7n+GzOoVaz5akrRgRb9y8
	 5XFW5AMSHhUNA==
Date: Fri, 19 Sep 2025 10:24:14 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 7/7] dt-bindings: soc: fsl: qe: Add support of IRQ in
 QE GPIO
Message-ID: <20250919152414.GB852815-robh@kernel.org>
References: <cover.1758212309.git.christophe.leroy@csgroup.eu>
 <7269082e90d20cf2cb4c11ceb61e24f0520d0154.1758212309.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7269082e90d20cf2cb4c11ceb61e24f0520d0154.1758212309.git.christophe.leroy@csgroup.eu>

On Thu, Sep 18, 2025 at 06:23:27PM +0200, Christophe Leroy wrote:
> In the QE, a few GPIOs have an associated IRQ to notify changes.
> Add IRQ support to QE GPIO.
> 
> As not all GPIOs have an associated IRQ, the driver needs to know
> to which GPIO corresponds each provided IRQ. This is provided via
> multiple compatible properties:
> 
> 	compatible = "fsl,mpc8323-qe-pario-bank-a"
> 	compatible = "fsl,mpc8323-qe-pario-bank-b"
> 	compatible = "fsl,mpc8323-qe-pario-bank-c"
> 
> 	compatible = "fsl,mpc8360-qe-pario-bank-a"
> 	compatible = "fsl,mpc8360-qe-pario-bank-b"
> 	compatible = "fsl,mpc8360-qe-pario-bank-c"
> 	compatible = "fsl,mpc8360-qe-pario-bank-d"
> 	compatible = "fsl,mpc8360-qe-pario-bank-e"
> 	compatible = "fsl,mpc8360-qe-pario-bank-f"
> 	compatible = "fsl,mpc8360-qe-pario-bank-g"
> 
> 	compatible = "fsl,mpc8568-qe-pario-bank-a"
> 	compatible = "fsl,mpc8568-qe-pario-bank-b"
> 	compatible = "fsl,mpc8568-qe-pario-bank-c"
> 	compatible = "fsl,mpc8568-qe-pario-bank-d"
> 	compatible = "fsl,mpc8568-qe-pario-bank-e"
> 	compatible = "fsl,mpc8568-qe-pario-bank-f"
> 
> When not using IRQ and for banks having no IRQ (like bank D on mpc8323)
> the origin compatible = "fsl,mpc8323-qe-pario-bank" is still valid.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  .../gpio/fsl,mpc8323-qe-pario-bank.yaml       | 27 +++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> index 0dd9c0e6ca39..c34aeea119e0 100644
> --- a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> +++ b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> @@ -14,6 +14,22 @@ properties:
>      items:
>        - enum:
>            - fsl,chip-qe-pario-bank
> +          - fsl,mpc8323-qe-pario-bank-a
> +          - fsl,mpc8323-qe-pario-bank-b
> +          - fsl,mpc8323-qe-pario-bank-c
> +          - fsl,mpc8360-qe-pario-bank-a
> +          - fsl,mpc8360-qe-pario-bank-b
> +          - fsl,mpc8360-qe-pario-bank-c
> +          - fsl,mpc8360-qe-pario-bank-d
> +          - fsl,mpc8360-qe-pario-bank-e
> +          - fsl,mpc8360-qe-pario-bank-f
> +          - fsl,mpc8360-qe-pario-bank-g
> +          - fsl,mpc8568-qe-pario-bank-a
> +          - fsl,mpc8568-qe-pario-bank-b
> +          - fsl,mpc8568-qe-pario-bank-c
> +          - fsl,mpc8568-qe-pario-bank-d
> +          - fsl,mpc8568-qe-pario-bank-e
> +          - fsl,mpc8568-qe-pario-bank-f

Is this supposed to be mpc8569? I don't see any existing 
"fsl,mpc8568-qe-pario-bank" compatibles.

This breaks the ABI. If the OS relied on "fsl,mpc8360-qe-pario-bank" for 
example, you just broke it.

As the GPIO bank doesn't do any interrupt handling itself 
(mask/unmask/ack), you can just do this (using 
fsl,mpc8360-qe-pario-bank-a case):

interrupt-map-mask = <0x1f 0>;
interrupt-map = <15 0 &qepic 0>,
                <16 0 &qepic 1>,
                <29 0 &qepic 2>,
                <30 0 &qepic 3>;

And then a user of the GPIO interrupt just says "interrupts = <15 0>;".

Rob

