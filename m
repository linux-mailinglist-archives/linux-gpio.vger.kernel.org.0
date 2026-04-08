Return-Path: <linux-gpio+bounces-34885-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4iiIDqpY1mnLEQgAu9opvQ
	(envelope-from <linux-gpio+bounces-34885-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 15:31:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D11D33BCF37
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 15:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1E33D3012BCE
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 13:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C1C3CEBAF;
	Wed,  8 Apr 2026 13:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rtN7MGYB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD17A26FA60;
	Wed,  8 Apr 2026 13:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775655076; cv=none; b=MoqV1dYhi6jVmAkAyi4vFl4wjGw6wrcoNmilsvhS3/DZxuPjZdFGl44LG07SblYzvaSQo7VfNB/sEnuOruK+HG0Ci5d/gxc5VdsY7z+0vWYgjOR9KipdZyB85pduxmWhVvCymuYFBrq3QCR3dE127Z/oswI/JYst+GXVXvVAfcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775655076; c=relaxed/simple;
	bh=sqUO8WthhJzcAvxM38OAUGehd9oMK+15WBmzaWNn1p0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FoF8voXRZ7j03l8r87Wu7l+7A6fNwW1ZcRj1dccl9tTa8yGA8/My682JxzgLcy24o7AkK/R0BcdAUfkh04/tZgBJGaBrF1J2zMTP3LXosa2Y7NMj048f6qZFQlXoGsO2UgbqTjhrl4alyOWp0i1Tbe3GvHU+m1t/3xY+zXtWRB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rtN7MGYB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7A3C2BC9E;
	Wed,  8 Apr 2026 13:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775655076;
	bh=sqUO8WthhJzcAvxM38OAUGehd9oMK+15WBmzaWNn1p0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rtN7MGYBrPtoBdayEGA8Bnd5JDJvLqhc+pJsd5pw0aUN5CcVQ2NLuFngCfmnH5qv0
	 iefrYkl1O+7pu18psbX3QN8D4M0iDwlJ3909aUSS3aPVNKUtF8YAB06ZiNj+G57h7X
	 EUDkawGKS+itWyQRGJCn2GDmU1bBZhnRusnH+GDjHj0JvVBlCS7LJMSfU+zpH2Vsc+
	 nZlsRiPeyTA9ygmbXB5NjRNzIRCxFmhRDmrZd6yAzzu87c5hIJ5tF2SooEn+uLHLD3
	 tfvz6+2KrpaupePD8ZBHGDPh7tHbtppsgqO6U7k05O8cKHBGKlZdzds0DfddJ35sX0
	 1M1uXixj4VREA==
Date: Wed, 8 Apr 2026 08:31:14 -0500
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] dt-bindings: mfd: aspeed,ast2x00-scu: Describe
 AST2700 SCU0
Message-ID: <20260408133114.GA1938858-robh@kernel.org>
References: <20260331-upstream_pinctrl-v5-0-8994f59ff367@aspeedtech.com>
 <20260331-upstream_pinctrl-v5-2-8994f59ff367@aspeedtech.com>
 <20260401-adept-zebra-of-bloom-5bb68b@quoll>
 <OSQPR06MB725204B2FAE543A71AEA52C38B51A@OSQPR06MB7252.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSQPR06MB725204B2FAE543A71AEA52C38B51A@OSQPR06MB7252.apcprd06.prod.outlook.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34885-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D11D33BCF37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 06:14:06AM +0000, Billy Tsai wrote:
> > > AST2700 consists of two interconnected SoC instances, each with its own
> > > System Control Unit (SCU). The SCU0 provides pin control, interrupt
> > > controllers, clocks, resets, and address-space mappings for the
> > > Secondary and Tertiary Service Processors (SSP and TSP).
> > >
> > > Describe the SSP/TSP address mappings using the standard
> > > memory-region and memory-region-names properties.
> > >
> > > Disallow legacy child nodes that are not present on AST2700, including
> > > p2a-control and smp-memram. The latter is unnecessary as software can
> > > access the scratch registers via the SCU syscon.
> > >
> > > Also allow the AST2700 SoC0 pin controller to be described as a child
> > > node of the SCU0, and add an example illustrating the SCU0 layout,
> > > including reserved-memory, interrupt controllers, and pinctrl.
> > >
> > > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> > > ---
> > >  .../bindings/mfd/aspeed,ast2x00-scu.yaml           | 117 +++++++++++++++++++++
> > >  1 file changed, 117 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> > > index a87f31fce019..86d51389689c 100644
> > > --- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> > > +++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> > > @@ -46,6 +46,9 @@ properties:
> > >    '#reset-cells':
> > >      const: 1
> > >
> > > +  memory-region: true
> > > +  memory-region-names: true
> 
> > Missing constraints. From where did you take such syntax (so I can fix
> > it)?
> 
> The intention was to constrain these properties conditionally for
> AST2700 SCU0 as done further down in the patch.
> 
> I can update the binding so that memory-region and memory-region-names
> have baseline constraints (e.g. minItems and maxItems), and then refine them in the
> conditional branches for AST2700SCU0, AST2700SCU1 and others
> 
>   memory-region:
>     minItems: 2
>     maxItems: 3
>   memory-region-names:
>     minItems: 2
>     maxItems: 3

As of this patch, you don't need that. You can just define the regions 
and names at the top-level. And the conditional schema only needs to 
disallow them for the appropriate case.

Rob

