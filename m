Return-Path: <linux-gpio+bounces-36242-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OTAHhhJ+mmJMAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36242-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 21:46:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 741B94D3397
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 21:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0E540301A27E
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 19:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF08D346E50;
	Tue,  5 May 2026 19:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="icb6EM9M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B215F23D7FF;
	Tue,  5 May 2026 19:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778010385; cv=none; b=B0G9l3ousT/bTPhnpv8T1umQmgqBxnHKXB5akGYuAlUDDhCzv0pjLDZdeDWv1LT90oGl3GYCaKAx/bIAgnldH1zBUvXIBx87v3t19dapgI/Jdg5vR1jZkL0tMzbe+kETeiP/LBWqwEsooNSb1jFcCyTUp2/oUIatZ/aeZk6nOzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778010385; c=relaxed/simple;
	bh=1l6AEA47+DNTOgppu+35U+rjWMbfBF3LPM2Zl6wdbXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WgBzaRlkbqQH29EsbTR8iIQ6dQutOVjxipGzFqQUlYxsgRdnoM4ipRbSmgb/eXgK44oWZQDjk6cY9oXnANoH8RI1JivMQn7CUFjvC+8mVh9H6Qma8HD4XrBM+bggTVBc4C6/BfmEIFbwVLzz0yELFNWby+yRf0e8wmMppAI4jso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=icb6EM9M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3495CC2BCB4;
	Tue,  5 May 2026 19:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778010385;
	bh=1l6AEA47+DNTOgppu+35U+rjWMbfBF3LPM2Zl6wdbXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=icb6EM9M4wYOqC/VuwHxS0M/UXNyYVLcNjMd7PZyHTm/2zFQT2eDMMdXkE/5Xmo14
	 G7A7ThX9bpWOmxLhYCINxceTgPHzgcOt6B1ssdkU4aZF0GGgYbD7VyUKO+foRVmmsk
	 xcwKabE2PEim2EG7PkMiCo6501EQpQDkz3rFWEfqxJhffz6Bqh/4G1bWHzeYIBMWXk
	 5qXlF4tpd3oXMLoNbCIuGQJcbqMznh2G/Q5e13YzlIIP9jKUdM2n48JfKnEJEPIgnz
	 w3RqYR5B4UQFVCWmFsvvzR/r/k04FSLIOFnmfm0u2fKcioAuJd3+T/5JL5bSoDZSq1
	 iJaRnYVkae4Rw==
Date: Tue, 5 May 2026 14:46:23 -0500
From: Rob Herring <robh@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-kernel@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/3] dt-bindings: gpio: Add EIO GPIO compatible to
 gpio-zynq
Message-ID: <20260505194623.GA3806254-robh@kernel.org>
References: <20260421104358.2496125-1-shubhrajyoti.datta@amd.com>
 <20260421104358.2496125-3-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421104358.2496125-3-shubhrajyoti.datta@amd.com>
X-Rspamd-Queue-Id: 741B94D3397
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,amd.com,gmail.com,kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-36242-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Tue, Apr 21, 2026 at 04:13:57PM +0530, Shubhrajyoti Datta wrote:
> EIO (Extended IO) GPIO is a Xilinx IP block that exposes
> multiplexed I/O pins through an EIO interface.
> 
> The EIO GPIO block has 2 banks with 26 GPIOs each (52 total).
> The GPIO width cannot be determined from the hardware registers,
> the driver relies on the compatible string to select the correct
> bank/pin configuration. A new compatible is therefore required.
> 
> The block is currently present on xa2ve3288 silicon.
> The compatible string uses version 1.0 matching the IP core version.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
> Changes in v3:
> - Update the commit message
> 
> Changes in v2:
> - Add description of EIO block
> 
>  .../devicetree/bindings/gpio/gpio-zynq.yaml        | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
> index 30a7f836c341..1ca067217509 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
> @@ -12,6 +12,7 @@ maintainers:
>  properties:
>    compatible:
>      enum:
> +      - xlnx,eio-gpio-1.0
>        - xlnx,pmc-gpio-1.0
>        - xlnx,versal-gpio-1.0
>        - xlnx,zynq-gpio-1.0
> @@ -30,7 +31,7 @@ properties:
>  
>    gpio-line-names:
>      description: strings describing the names of each gpio line
> -    minItems: 58
> +    minItems: 52
>      maxItems: 174
>  
>    interrupt-controller: true
> @@ -89,6 +90,17 @@ allOf:
>            minItems: 116
>            maxItems: 116
>  
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - xlnx,eio-gpio-1.0
> +    then:
> +      properties:
> +        gpio-line-names:
> +          minItems: 52

The min is already 52, so you can drop this. With that,

Acked-by: Rob Herring (Arm) <robh@kernel.org>

> +          maxItems: 52
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.34.1
> 

