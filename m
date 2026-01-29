Return-Path: <linux-gpio+bounces-31306-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EWqAPaHe2mlFQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31306-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 17:16:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC88B203A
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 17:16:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 697EF3008E01
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 16:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5255933D6DF;
	Thu, 29 Jan 2026 16:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qPBuSKsG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1507B7260A;
	Thu, 29 Jan 2026 16:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769703409; cv=none; b=s5OozNv8C/7LEz7/QQkS+v2Ub9aBvn5SHYQR2LBXwuTSyU1JKklKhtxvi/wye0uih5B6EwJFIguotsjwO18FzAvkP4v8k6Po1R7EqvZEcRguijgYJvLO8R7JKvIBRdmvFHEy7ZWgZ2hIPpDX1yyxEbQgkprzzlhpgoX8LL6B4hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769703409; c=relaxed/simple;
	bh=ZKh+gwOXIrHUXWgIsde1vq5TQv6RVWGnWv4kiXsAKJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drajozW8W+m4cs8BxOSLTNmhEB9O5NMECwJuVcEHrCXitKy8JzpAvooThGT4NFD/ZqIJaJvlziqi04h1YsYkSKjyAU7R5oUB7MQM6iWupTjM7f0+OWT907jSi1EbroHL4NJ0qb6cfeJdCTgFvnht1EgvNlWDeGfV3m+1ppaRw3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qPBuSKsG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85063C4CEF7;
	Thu, 29 Jan 2026 16:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769703408;
	bh=ZKh+gwOXIrHUXWgIsde1vq5TQv6RVWGnWv4kiXsAKJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPBuSKsG8T4BCOrEBRaDWr8MG+IzuvfSTZjfiuYNld26Igdxvp+JkV67AHJHQMOjE
	 tcfnvilda9aCiR4vVSui0M8WxMjSRcVJSKjyE8pH8VdR9RiyEof8qoQftVKMWKuLUA
	 VMwEpMoBhxgTZj/epqG8Ds9XLp5IWMW/039AmDx898PWnf05qKj4EPNVo0d7ReszNV
	 L1COCTOGuT7VB/RLypoukJb/HjQz84NoC1+0+WWDUMeF5/hxM2fwD9EFxXzyxt/UA/
	 Sg0aStCqlUvW3E3MtZmzIn3zwXbAsDxfjr2KqjGQTZ1yNyAJnkx25yX750PtdkcBef
	 8DyFa8g0/YEEA==
Date: Thu, 29 Jan 2026 10:16:47 -0600
From: Rob Herring <robh@kernel.org>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <legoffic.clement@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	jens.wiklander@linaro.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v5 03/12] dt-bindings: bus: document the stm32 debug bus
Message-ID: <20260129161647.GA1176398-robh@kernel.org>
References: <20260123-debug_bus-v5-0-90b670844241@foss.st.com>
 <20260123-debug_bus-v5-3-90b670844241@foss.st.com>
 <089559fd-3c9a-4ff4-8732-bb23fa907be8@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <089559fd-3c9a-4ff4-8732-bb23fa907be8@foss.st.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com,lists.linaro.org,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com];
	TAGGED_FROM(0.00)[bounces-31306-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[2.252.41.0:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[2.252.95.176:email,devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6EC88B203A
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 03:23:45PM +0100, Gatien CHEVALLIER wrote:
> Hello,
> 
> Does this binding file satisfy the feedback received?

Please check patchwork if you want to know the status of your patch.

> 
> Thanks,
> Gatien
> 
> On 1/23/26 11:39, Gatien Chevallier wrote:
> > Document the stm32 debug bus. The debug bus is responsible for
> > checking the debug sub-system accessibility before probing any related
> > drivers.
> > 
> > Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> > ---
> >   .../bindings/bus/st,stm32mp131-dbg-bus.yaml        | 76 ++++++++++++++++++++++
> >   1 file changed, 76 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
> > new file mode 100644
> > index 000000000000..6c74433efbe3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
> > @@ -0,0 +1,76 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/bus/st,stm32mp131-dbg-bus.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: STM32 Coresight bus
> > +
> > +maintainers:
> > +  - Gatien Chevallier <gatien.chevallier@foss.st.com>
> > +
> > +description:
> > +  The STM32 debug bus is in charge of checking the debug configuration
> > +  of the platform before probing the peripheral drivers that rely on the debug
> > +  domain.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - st,stm32mp131-dbg-bus
> > +          - st,stm32mp151-dbg-bus
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 1
> > +
> > +  ranges:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  "#access-controller-cells":
> > +    const: 1
> > +    description:
> > +      Contains the debug profile necessary to access the peripheral.
> > +
> > +patternProperties:
> > +  "@[0-9a-f]+$":
> > +    description: Debug related peripherals
> > +    type: object
> > +
> > +    additionalProperties: true
> > +
> > +    required:
> > +      - access-controllers
> > +
> > +required:
> > +  - "#access-controller-cells"
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +  - compatible
> > +  - ranges
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/stm32mp1-clks.h>
> > +
> > +    dbg_bus: bus@50080000 {
> > +      compatible = "st,stm32mp131-dbg-bus";
> > +      #address-cells = <1>;
> > +      #size-cells = <1>;
> > +      #access-controller-cells = <1>;
> > +      ranges = <0x50080000 0x50080000 0x3f80000>;
> > +
> > +      cti@50094000 {
> > +        compatible = "arm,coresight-cti", "arm,primecell";
> > +        reg = <0x50094000 0x1000>;
> > +        clocks = <&rcc CK_DBG>;
> > +        clock-names = "apb_pclk";
> > +        access-controllers = <&dbg_bus 0>;
> > +      };
> > +    };
> > 
> 

