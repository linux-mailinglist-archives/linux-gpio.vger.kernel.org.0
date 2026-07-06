Return-Path: <linux-gpio+bounces-39489-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8a4aG3VXS2rWPgEAu9opvQ
	(envelope-from <linux-gpio+bounces-39489-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 09:21:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E55270D763
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 09:21:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=N61PiGho;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39489-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39489-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0228F3059D8D
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 07:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F913CBE66;
	Mon,  6 Jul 2026 06:53:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB993FF88C;
	Mon,  6 Jul 2026 06:52:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783320794; cv=none; b=fd6Q/zh8NL3OkwJ2trHjne8zOQlM7c2HKrukylKUGXSuIo4J06yeZ7poHNFzBitqlyeMROcCCvS9OHxDVOOrJKmoyhV8eleGhKBIGoqBpkeYDT+69H7vzouzqx3g7r6xl2BZeFNExcYV9ba9X4ggkdFNNPlh/Jf/RfAJAfIOOvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783320794; c=relaxed/simple;
	bh=izitCg9SRdQqbGJnJ0KAMXXLvPqISrhaLUFRnFyiOxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQEVUq1qEX7T+P+FZoQH02vCanoIWn2rP73wl1Hlh0la+wCeTeAF8BUsKjkCv1P+9Kk0fOYp70VV+6Sjte5825XHEfxc2JzyT4gRuhMozHGlwvhcNmPH/6a/gFRiSpixqsYLYVdYLjF9YO/NdqlVL1uG1iAud5++O5+jhExExNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N61PiGho; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582EF1F000E9;
	Mon,  6 Jul 2026 06:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783320775;
	bh=GqJKu5gWDZ/UYtVOCDNuBOQs8FjclaKQ1yPzLTbmJLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N61PiGho+yEliRWsdlEhUA25Ntfh+uCc1l0dS/x9FiocKW8k7ng0kBwMbOXn88W9A
	 nauN7Kc/AXHmucbexSQC9Cdm6cfQmVBZvikh0Jn65YTcc4ulUnoyHjNtW1j+IWO6xL
	 spxeTlhsJKkFM9eYz3S6v2cMowYtG1NyJ9F6knEpRhxo6JR8cdilsWDIjiPclLL14O
	 aLkyqI54Hl9n5bRKhkW5f4EDNJDvLI/wJiaUgiZUZU0vYpEvuI5uuZDY5JM48EimW2
	 NKWsN15efn4K30evc46ELHNSqCtUAXAEDHJc3wC0I7jxp76SOOTCnD+Vndl+sWzwnn
	 lVXILi6CroXzQ==
Date: Mon, 6 Jul 2026 08:52:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 04/12] dt-bindings: soc: fsl: qe: Add support of IRQ in
 QE GPIO
Message-ID: <20260706-elfish-cornflower-bullfinch-604e0a@quoll>
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
 <20260703-qe-pic-gpios-v1-4-6c3e706e27dc@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260703-qe-pic-gpios-v1-4-6c3e706e27dc@bootlin.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:paul.louvel@bootlin.com,m:qiang.zhao@nxp.com,m:chleroy@kernel.org,m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:thomas.petazzoni@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39489-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,lists.ozlabs.org,lists.infradead.org,vger.kernel.org,bootlin.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,quoll:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E55270D763

On Fri, Jul 03, 2026 at 03:30:12PM +0200, Paul Louvel wrote:
> Some QE GPIO pins have an associated interrupt line in the QE PIC to
> signal state changes on the pin.  Add the corresponding
> interrupt-controller / nexus properties to the QE GPIO binding.
> 
> Because the GPIO controller does not perform any interrupt handling
> itself, a nexus node (interrupt-map) is used to map each GPIO line
> supporting IRQ to the parent QE PIC interrupt domain.
> 
> As the QE PIC can be configured to generate an interrupt on either a
> high-to-low transition or any change in signal state, three
> interrupt-map entries are needed per GPIO pin that can yield an
> interrupt (falling, both, and the "none" case which defaults to both in
> QE PIC).  This overhead is necessary because the interrupt-map-pass-thru
> property is not part of the DT specification.
> 
> The interrupt-map property is optional: it is not required for GPIO
> banks that have no interrupt capable GPIO line (e.g. port D on MPC8323),
> or when interrupt functionality is not used.
> 
> Update the example to show a scenario where each bank supports a
> different numbers of IRQs, or no IRQs at all.
> 
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
> ---
>  .../bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml   | 69 +++++++++++++++++++++-
>  1 file changed, 66 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> index 1af99339ff40..0c849a5698f4 100644
> --- a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> +++ b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> @@ -27,6 +27,17 @@ properties:
>    "#gpio-cells":
>      const: 2
>  
> +  "#address-cells":
> +    const: 0
> +
> +  "#interrupt-cells":
> +    const: 2
> +

If this has interrupt-cells, then it is a nexus, thus why isn't this
also a "interrupt-controller"?

> +  interrupt-map:
> +    description: |
> +      Specifies the mapping of GPIO lines to the parent interrupt controller, as the
> +      GPIO controller does not do interrupt handling itself.
> +
>  required:
>    - compatible
>    - reg
> @@ -37,9 +48,61 @@ additionalProperties: false
>  
>  examples:
>    - |
> -    gpio-controller@1400 {
> -        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
> -        reg = <0x1400 0x18>;

I don't get why you rewrite existing example instead of adding new one.

> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    pic: interrupt-controller {
> +      interrupt-controller;
> +      #address-cells = <0>;
> +      #interrupt-cells = <2>;
> +    };

Drop node, irrelevant.

> +
> +    gpio-controller@1418 {
> +        #gpio-cells = <2>;
> +        #address-cells = <0>;
> +        #interrupt-cells = <2>;
> +        compatible = "fsl,mpc8323-qe-pario-bank";
> +        reg = <0x1418 0x18>;

And now you are not following DTS coding style.

>          gpio-controller;
> +        interrupt-map = <
> +          7 IRQ_TYPE_EDGE_FALLING  &pic 4 IRQ_TYPE_EDGE_FALLING
> +          7 IRQ_TYPE_EDGE_BOTH     &pic 4 IRQ_TYPE_EDGE_BOTH
> +          7 0                      &pic 4 IRQ_TYPE_NONE
> +
> +          9 IRQ_TYPE_EDGE_FALLING  &pic 5 IRQ_TYPE_EDGE_FALLING
> +          9 IRQ_TYPE_EDGE_BOTH     &pic 5 IRQ_TYPE_EDGE_BOTH
> +          9 0                      &pic 5 IRQ_TYPE_NONE
> +
> +          25 IRQ_TYPE_EDGE_FALLING &pic 6 IRQ_TYPE_EDGE_FALLING
> +          25 IRQ_TYPE_EDGE_BOTH    &pic 6 IRQ_TYPE_EDGE_BOTH
> +          25 0                     &pic 6 IRQ_TYPE_NONE
> +
> +          27 IRQ_TYPE_EDGE_FALLING &pic 7 IRQ_TYPE_EDGE_FALLING
> +          27 IRQ_TYPE_EDGE_BOTH    &pic 7 IRQ_TYPE_EDGE_BOTH
> +          27 0                     &pic 7 IRQ_TYPE_NONE
> +        >;
> +    };
> +
> +    gpio-controller@1430 {
>          #gpio-cells = <2>;

So two new examples? But old one was wrong?

> +        #address-cells = <0>;
> +        #interrupt-cells = <2>;
> +        compatible = "fsl,mpc8323-qe-pario-bank";
> +        reg = <0x1430 0x18>;
> +        gpio-controller;
> +        interrupt-map = <
> +          24 IRQ_TYPE_EDGE_FALLING &pic 8 IRQ_TYPE_EDGE_FALLING
> +          24 IRQ_TYPE_EDGE_BOTH    &pic 8 IRQ_TYPE_EDGE_BOTH
> +          24 0                     &pic 8 IRQ_TYPE_NONE
> +
> +          29 IRQ_TYPE_EDGE_FALLING &pic 9 IRQ_TYPE_EDGE_FALLING
> +          29 IRQ_TYPE_EDGE_BOTH    &pic 9 IRQ_TYPE_EDGE_BOTH
> +          29 0                     &pic 9 IRQ_TYPE_NONE
> +        >;
> +    };
> +
> +    gpio-controller@1448 {
> +        #gpio-cells = <2>;
> +        compatible = "fsl,mpc8323-qe-pario-bank";

Wait, three examples? But isn't this the same as previous one?

> +        reg = <0x1448 0x18>;
> +        gpio-controller;
>      };
> 
> -- 
> 2.55.0
> 

