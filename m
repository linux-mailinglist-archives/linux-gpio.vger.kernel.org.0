Return-Path: <linux-gpio+bounces-30954-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIOxJzyxcmnaogAAu9opvQ
	(envelope-from <linux-gpio+bounces-30954-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 00:22:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 022606E73B
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 00:22:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 814C130247DB
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 23:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCECE3B961B;
	Thu, 22 Jan 2026 23:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lekxa4Nh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D2A330B3E;
	Thu, 22 Jan 2026 23:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769124101; cv=none; b=knn1tHBe0n7mlrjrHePi0pQhoz/DvdmMa4AyN5pIZGIo6J7Z4SouLCNRg18hXgIi5ggpuF8+CxquJzsZthU2mEn/HgHRQ09hpcsA4yxqlXhxOSTNLV9xk8mCCaG85OUfHa/Q1PVAzaFw6xrPUqCXNu/dlqd/b22kwflV0E5SyOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769124101; c=relaxed/simple;
	bh=vUOqLJV03qwaBfmuHwqXoOQ/IdKsiWbk/K4GdntR+BM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bwX/kvxEIJIF4Dx1q2walqEhc+7VE9KeGl3rW2xKObYuNMkHS+gQPcdhefKPpID4Taf+W0FgoHZnn/1sr3SLRz4up15fGkxYAEu/GGVG48TFqTv0rNtiP3GM66tEQ5pv01PLhzJ+wCudB9181XL32/L+xP6CmP/JXKdJ8/eJwAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lekxa4Nh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D927C116C6;
	Thu, 22 Jan 2026 23:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769124100;
	bh=vUOqLJV03qwaBfmuHwqXoOQ/IdKsiWbk/K4GdntR+BM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lekxa4NhA2b+jIufWjek4xt/AQ3UGxjRXVopuVx1/yJ3TyznR95IhK28K94qlOC/r
	 tpV6+BC7k9LYA8mY2TdXOpSrt2T0yF+mJTw6i8m2OHig9F1tS3l/Sk1L/d0cVM0CVt
	 oK74KFnQgA5DDSTwKyG74sZTZ+wce0e/PocViI6eAvbGwbtrSlqbsIqD71V5IjQOLA
	 dv9AKO58oxXnJ+aiqVLuWEyt0KUrdvfIL4tKzqm/6uw++PY4MUC4yHtMwZmW0A5z9+
	 ui5GBZeoi2YRPwQBZUkLHTD6I2D/AjciWG+/gVNRAsDgxex/iI5ywdTjUUuv4Fka8/
	 TfVxHvjFAtCKw==
Date: Thu, 22 Jan 2026 17:21:39 -0600
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
Subject: Re: [PATCH v4 03/12] dt-bindings: bus: document the stm32 debug bus
Message-ID: <20260122232139.GA3717629-robh@kernel.org>
References: <20260122-debug_bus-v4-0-28f0f2a25f2c@foss.st.com>
 <20260122-debug_bus-v4-3-28f0f2a25f2c@foss.st.com>
 <b8175f5e-f6fc-43ff-a36a-dfb8e15230da@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8175f5e-f6fc-43ff-a36a-dfb8e15230da@foss.st.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com,lists.linaro.org,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com];
	TAGGED_FROM(0.00)[bounces-30954-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[2.252.95.176:email,2.252.41.0:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,st.com:email]
X-Rspamd-Queue-Id: 022606E73B
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 05:22:21PM +0100, Gatien CHEVALLIER wrote:
> 
> 
> On 1/22/26 17:19, Gatien Chevallier wrote:
> > Document the stm32 debug bus. The debug bus is responsible for
> > checking the debug sub-system accessibility before probing any related
> > drivers.
> > 
> > Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> > ---
> >   .../bindings/bus/st,stm32mp131-dbg-bus.yaml        | 77 ++++++++++++++++++++++
> >   1 file changed, 77 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
> > new file mode 100644
> > index 000000000000..57f01d301e75
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
> > @@ -0,0 +1,77 @@
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
> > +  ranges: true
> 
> Maybe maxItems:2 is preferred here, no?

Wouldn't it be 1 as there is only 1 range? Up to you whether you want to 
limit it or not.

> 
> > +
> > +  reg:
> > +    maxItems: 1

Should be dropped?

> > +
> > +  "#access-controller-cells":
> > +    const: 1
> > +    description:
> > +      Contains the debug profile necessary to access the peripheral.
> > +
> > +patternProperties:
> > +  "^.*@[0-9a-f]+$":

This can be: "@[0-9a-f]+$"

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

Drop unused labels.

> > +      compatible = "st,stm32mp131-dbg-bus";
> > +      #address-cells = <1>;
> > +      #size-cells = <1>;
> > +      #access-controller-cells = <1>;
> > +      ranges = <0x50080000 0x50080000 0x3f80000>;
> > +
> > +      cs_cti_trace: cti@50094000 {
> > +        compatible = "arm,coresight-cti", "arm,primecell";
> > +        reg = <0x50094000 0x1000>;
> > +        clocks = <&rcc CK_DBG>;
> > +        clock-names = "apb_pclk";
> > +        access-controllers = <&dbg_bus 0>;
> > +      };
> > +    };
> > 
> 

