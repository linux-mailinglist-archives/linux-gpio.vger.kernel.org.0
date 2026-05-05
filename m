Return-Path: <linux-gpio+bounces-36110-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJltBgeQ+WlN9wIAu9opvQ
	(envelope-from <linux-gpio+bounces-36110-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 08:36:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DB14C7442
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 08:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED396301C5BF
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 06:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391C03C4553;
	Tue,  5 May 2026 06:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZtJNlD1g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFAD2DCC1C;
	Tue,  5 May 2026 06:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777963010; cv=none; b=izG60XhWQLq3dHtCA2FjraPy3w5PV+mejh5inelE7rIpBXCmPqghguihVRGs4GJOrHbLLiRm/0LYjHETxAK25IYpTA/XZOGEYkSuRTBPCk3Yu4fwqYLokODhVZqZC0i16nzFSFqghrOJlUFObSc0dXj5E9Xb5SlaWa1P2HL8AuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777963010; c=relaxed/simple;
	bh=TFqejn3IsKpgwjK1Z2L0fPwG+m/H57fk/+s9Zz00kQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4spojX6YnHEwrb0d7iGPMuf6BmnZ2VG47UHGBYhtUbZp+dBjv5HLB6HkefZW/MjR3NIH5UtOCAKv8MIcsru6cQxcfuecf8if5I8QsHw1GXiazEY02xsVVSFra3M6Oz5kzzYfuD0FpftstduOVA63KEK0eQNHLiHzubvhrMXDjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZtJNlD1g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB56C2BCC7;
	Tue,  5 May 2026 06:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777963009;
	bh=TFqejn3IsKpgwjK1Z2L0fPwG+m/H57fk/+s9Zz00kQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZtJNlD1gP5UTFF7E3XRVex68cbvPUFAtSI0ibdDgLfDF40rX4XRZFZQLNg/DgHC+8
	 8ZBzi52k9sTkVUKDuZ1kgVKzNrSBsDFPa8Prw3DCWcpRzFiwyYubaQv3x0U8FA7rei
	 5QJHEctJm5XiD3S8QNSxl1fKVnVwK2INCqUm/rnQNIB/idr+LcqD5mpZsuvuiED2KQ
	 BBevOhz4ISTmkmiwI9LMP0LwnQvJ6bv9YaoAznU9k9iLGFciAIECBHcdSzl4lLVVc8
	 pEXvEIjgTzNfe1xhXzD8JuAg0TPbaWdn/S1E7hTo+d68vTMqES3Smqrr4VX0+P3IhN
	 iC/aNUuoY4N4w==
Date: Tue, 5 May 2026 08:36:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>, 
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, Enric Balletbo <eballetb@redhat.com>, 
	Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH v9 5/7] dt-bindings: pinctrl: s32g2-siul2: describe GPIO
 and EIRQ resources
Message-ID: <20260505-voracious-gregarious-stallion-ff6c34@quoll>
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260504131148.3622697-6-khristineandreea.barbulescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504131148.3622697-6-khristineandreea.barbulescu@oss.nxp.com>
X-Rspamd-Queue-Id: 69DB14C7442
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36110-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]

On Mon, May 04, 2026 at 03:11:46PM +0200, Khristine Andreea Barbulescu wrote:
> Extend the S32G2 SIUL2 pinctrl binding to describe the additional
> resources used by the updated SIUL2 pinctrl driver.

Please describe hardware, not drivers. Statement is not even true -
drivers do not use these resources, unless you organized your patchset
wrong (see submitting bindings documents, both).

Nothing above explains why you need new compatible.

> 
> Besides the MSCR and IMCR register ranges used for pinmux and
> pin configuration, the SIUL2 block also contains PGPDO and PGPDI
> registers for GPIO output and input operations, as well as EIRQ
> registers used for external interrupt configuration.
> 
> Add GPIO controller properties:
>   - gpio-controller
>   - #gpio-cells
>   - gpio-ranges
> 
> Add interrupt controller properties:
>   - interrupt-controller
>   - #interrupt-cells
>   - interrupts

Do not explain what you did, but say why.

> 
> Also update the binding example to show the complete SIUL2 register
> layout, including the GPIO data and EIRQ register windows.
> 
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
> ---
>  .../pinctrl/nxp,s32g2-siul2-pinctrl.yaml      | 107 ++++++++++++++++--
>  1 file changed, 98 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
> index a24286e4def6..0bd341f1e84d 100644
> --- a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -# Copyright 2022 NXP
> +# Copyright 2022, 2026 NXP
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/pinctrl/nxp,s32g2-siul2-pinctrl.yaml#
> @@ -17,26 +17,39 @@ description: |
>      SIUL2_0 @ 0x4009c000
>      SIUL2_1 @ 0x44010000
>  
> -  Every SIUL2 region has multiple register types, and here only MSCR and
> -  IMCR registers need to be revealed for kernel to configure pinmux.
> +  Every SIUL2 region has multiple register types. MSCR and IMCR registers
> +  need to be revealed for kernel to configure pinmux. PGPDO and PGPDI
> +  registers are used for GPIO output/input operations. EIRQ registers
> +  are used for external interrupt configuration.
>  
>    Please note that some register indexes are reserved in S32G2, such as
>    MSCR102-MSCR111, MSCR123-MSCR143, IMCR84-IMCR118 and IMCR398-IMCR429.
>  
>  properties:
>    compatible:
> -    enum:
> -      - nxp,s32g2-siul2-pinctrl
> +    oneOf:
> +      - const: nxp,s32g2-siul2-pinctrl
> +      - items:
> +          - const: nxp,s32g2-siul2-pinctrl-gpio
> +          - const: nxp,s32g2-siul2-pinctrl

I don't get how this binding develops. You were asked to grow existing
binding instead of deprecating it and now you did not grow it: you added
completely new compatible.

Please go back to previous version comments.

Best regards,
Krzysztof


