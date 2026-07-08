Return-Path: <linux-gpio+bounces-39626-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ysKzNUQITmrwBwIAu9opvQ
	(envelope-from <linux-gpio+bounces-39626-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 10:20:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA05723164
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 10:20:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aiHjG5Fo;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39626-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39626-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DD371300B9C9
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 08:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 798713FFFAD;
	Wed,  8 Jul 2026 08:20:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D5E37B413;
	Wed,  8 Jul 2026 08:20:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783498818; cv=none; b=Jy4MXOm/GfXfATAN43a88gBnLXyOmv6SvLHPTHiuDIjXLMM5v39a4TsBOAKaJWT2zbYrMPtNZDaTj6LSZN4gYRb1e+VRpwYSPrBlwNFRa7zkgSgkNZypDKe7KpPHYpsHjQpgw8k4MeLtI1eJbvwRfsS1mloNR2atNRiGvMb8Vyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783498818; c=relaxed/simple;
	bh=KUIWr7/a3fEpywFUG9/E2MvwtIeBEeRy4KxkKm9jajA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TXEs/eRxfaTs3CEUwikuZKUZ3qVAEsojcy2d3lUo35iTpD2XKL01KSIknl7C4pz5HO552VQbj9IcrHVQMVjMLrT3A65N52+UoOSney/oIJqnhxYcDp0ddVTcd0H+2O9yuQ1iGbV6u053igC7Xq2bngIKc/Lg78w/+W66Lucmdcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aiHjG5Fo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5931F000E9;
	Wed,  8 Jul 2026 08:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783498816;
	bh=tAM7j5fQB9lPdjO1SSxK15JUZTKVRDEjwTyBLBLdbg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aiHjG5FoMWjwkqplKSyC6Z0HRMTU0vi8VYoM0h6WQEMyNkW0Pu6OBQs1hn4xHwsJZ
	 WS2AFd1+l9Lo/dfo3xF2PvvVPu77/LmSweFm/64r0iT04caYhKxCl52rGl/zKuEnKG
	 2Qi7h2HKLOLGKbaLrT75Rpxjoj+iSFy1IaVV2bP0Nf+2GKDWNllUuxcmvkZKQ+zU3E
	 2vkf74sW5VJa6qdZY7sMfoct3fmm7u1rnR9UKI/1cQtDDdWAMURHFOsJDvzgE8XsfH
	 FZdMym29eHeeBNDHgVQnjCKLQWHVH7TRkUalXVugiwUs7hHkRQW0rCvmj+0ixxJABh
	 3ipFl2YVX7xBg==
Date: Wed, 8 Jul 2026 10:20:13 +0200
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
Message-ID: <20260708-glorious-electric-octopus-e80abe@quoll>
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
 <20260703-qe-pic-gpios-v1-4-6c3e706e27dc@bootlin.com>
 <20260706-elfish-cornflower-bullfinch-604e0a@quoll>
 <DJRCWXDUGFY8.1AIUFSEBFTG94@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DJRCWXDUGFY8.1AIUFSEBFTG94@bootlin.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
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
	TAGGED_FROM(0.00)[bounces-39626-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quoll:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,bootlin.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6BA05723164

On Mon, Jul 06, 2026 at 10:48:32AM +0200, Paul Louvel wrote:
> On Mon Jul 6, 2026 at 8:52 AM CEST, Krzysztof Kozlowski wrote:
> > On Fri, Jul 03, 2026 at 03:30:12PM +0200, Paul Louvel wrote:
> >> Some QE GPIO pins have an associated interrupt line in the QE PIC to
> >> signal state changes on the pin.  Add the corresponding
> >> interrupt-controller / nexus properties to the QE GPIO binding.
> >> 
> >> Because the GPIO controller does not perform any interrupt handling
> >> itself, a nexus node (interrupt-map) is used to map each GPIO line
> >> supporting IRQ to the parent QE PIC interrupt domain.
> >> 
> >> As the QE PIC can be configured to generate an interrupt on either a
> >> high-to-low transition or any change in signal state, three
> >> interrupt-map entries are needed per GPIO pin that can yield an
> >> interrupt (falling, both, and the "none" case which defaults to both in
> >> QE PIC).  This overhead is necessary because the interrupt-map-pass-thru
> >> property is not part of the DT specification.
> >> 
> >> The interrupt-map property is optional: it is not required for GPIO
> >> banks that have no interrupt capable GPIO line (e.g. port D on MPC8323),
> >> or when interrupt functionality is not used.
> >> 
> >> Update the example to show a scenario where each bank supports a
> >> different numbers of IRQs, or no IRQs at all.
> >> 
> >> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
> >> ---
> >>  .../bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml   | 69 +++++++++++++++++++++-
> >>  1 file changed, 66 insertions(+), 3 deletions(-)
> >> 
> >> diff --git a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> >> index 1af99339ff40..0c849a5698f4 100644
> >> --- a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> >> +++ b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> >> @@ -27,6 +27,17 @@ properties:
> >>    "#gpio-cells":
> >>      const: 2
> >>  
> >> +  "#address-cells":
> >> +    const: 0
> >> +
> >> +  "#interrupt-cells":
> >> +    const: 2
> >> +
> >
> > If this has interrupt-cells, then it is a nexus, thus why isn't this
> > also a "interrupt-controller"?
> 
> Because these these banks are not interrupt controllers.
> Interrupts are handled by the QE PIC, and the GPIO controller does not do any
> interrupt handling itself.
> In this setup, does it really needs an "interrupt-controller" property?

So this is interrupt-nexus, but not an interrupt-controller. If that's
the case of hardware, then it is fine/correct.

Best regards,
Krzysztof


