Return-Path: <linux-gpio+bounces-32225-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDLzMl8loGkDfwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32225-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 11:50:07 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0601A48F5
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 11:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07ED83139A42
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 10:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09EC3126DF;
	Thu, 26 Feb 2026 10:46:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4261834CDD;
	Thu, 26 Feb 2026 10:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772102818; cv=none; b=jd8y2zCx22222NTPjVWJGrLH7DV0HhDaLdlm2Xg0WoW/tiXd52ehSF6eWQWckm/6DMuO5VaGkMfqyBL3nO5eemC1G3LEISiI4yermgDIQnx+8182tviTuph8OGNX10jTrfYf8D1nACc3+55f5clh3dV6i+cDZ34ZML32r0LdsjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772102818; c=relaxed/simple;
	bh=wwBEUPka4TbFXZaA7qr4GKxGV4GHyeUeHI1rgIASL+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gf3enMYlr439onrP9sfSZXOaEpmkbQkbt1QJ02sNLWjMJpSlo2VmJ7YxXYp/Y5mLzHX0YmGJZGEMBu/KT7BPTCvAz/0x7NDBmEMoKgA2w2tO6cvtmbsxAHRyiGzHJP1vsiTX2JQ0scPw23uHmXe2O3gu7YTdO/6stN7/+UiV5lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B1C01516;
	Thu, 26 Feb 2026 02:46:50 -0800 (PST)
Received: from [10.1.36.70] (Suzukis-MBP.cambridge.arm.com [10.1.36.70])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16F093F73B;
	Thu, 26 Feb 2026 02:46:53 -0800 (PST)
Message-ID: <fb91b392-2a01-4f01-85a2-335bb39ec60e@arm.com>
Date: Thu, 26 Feb 2026 10:46:52 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/12] dt-bindings: document access-controllers
 property for coresight peripherals
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 Linus Walleij <linusw@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, cristian.marussi@arm.com,
 jens.wiklander@linaro.org, etienne.carriere@foss.st.com,
 Sudeep Holla <sudeep.holla@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
 <20260226-debug_bus-v6-1-5d794697798d@foss.st.com>
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260226-debug_bus-v6-1-5d794697798d@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32225-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[foss.st.com,linaro.org,kernel.org,linux.dev,gmail.com,arm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suzuki.poulose@arm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,st.com:email,arm.com:mid,arm.com:email]
X-Rspamd-Queue-Id: 7A0601A48F5
X-Rspamd-Action: no action

Hi

On 26/02/2026 10:30, Gatien Chevallier wrote:
> Document the access-controllers for coresight peripherals in case some
> access checks need to be performed to use them.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml           | 3 +++
>   .../devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml          | 3 +++
>   Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml           | 3 +++
>   Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml           | 3 +++
>   Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml           | 3 +++
>   Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml          | 3 +++

Are you sure, you are not missing "replicator" in the list ?

Otherwise, looks good to me.

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>



>   6 files changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> index 2a91670ccb8c..949444aba1f8 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> @@ -128,6 +128,9 @@ properties:
>     "#address-cells":
>       const: 1
>   
> +  access-controllers:
> +    maxItems: 1
> +
>   patternProperties:
>     '^trig-conns@([0-9]+)$':
>       type: object
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
> index b74db15e5f8a..b0693cd46d27 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
> @@ -78,6 +78,9 @@ properties:
>           description: Output connection to CoreSight Trace bus
>           $ref: /schemas/graph.yaml#/properties/port
>   
> +  access-controllers:
> +    maxItems: 1
> +
>   required:
>     - compatible
>     - reg
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
> index 71f2e1ed27e5..10ebbbeadf93 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
> @@ -118,6 +118,9 @@ properties:
>           description: Output connection from the ETM to CoreSight Trace bus.
>           $ref: /schemas/graph.yaml#/properties/port
>   
> +  access-controllers:
> +    maxItems: 1
> +
>   required:
>     - compatible
>     - clocks
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
> index 378380c3f5aa..f243e76f597f 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
> @@ -73,6 +73,9 @@ properties:
>           description: Output connection to the CoreSight Trace bus.
>           $ref: /schemas/graph.yaml#/properties/port
>   
> +  access-controllers:
> +    maxItems: 1
> +
>   required:
>     - compatible
>     - reg
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
> index 96dd5b5f771a..9dc096698c65 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
> @@ -128,6 +128,9 @@ properties:
>         - const: tracedata
>         - const: metadata
>   
> +  access-controllers:
> +    maxItems: 1
> +
>   required:
>     - compatible
>     - reg
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
> index a207f6899e67..29bbc3961fdf 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
> @@ -70,6 +70,9 @@ properties:
>           description: Input connection from the CoreSight Trace bus.
>           $ref: /schemas/graph.yaml#/properties/port
>   
> +  access-controllers:
> +    maxItems: 1
> +
>   required:
>     - compatible
>     - reg
> 


