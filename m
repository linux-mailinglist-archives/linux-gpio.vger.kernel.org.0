Return-Path: <linux-gpio+bounces-32907-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMcJE7Xnr2nkdAIAu9opvQ
	(envelope-from <linux-gpio+bounces-32907-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 10:43:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8390C248B4A
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 10:43:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 14C053035282
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 09:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9192343E49C;
	Tue, 10 Mar 2026 09:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RmyTNcSN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445D1329E6F;
	Tue, 10 Mar 2026 09:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773135621; cv=none; b=XFtSrwRydydhoS0A9EUa8LOamcY4pEdlmcq3TzCLiUmdi14wrvymyk6MPzV15tLpiCqO8AV/vxOfAEjml7AS4Tb4QirCmBbRVvy/5XIBiVtVRS7Y8O6oj8ywbIphvaPRABNfqX11cD5G9aPnY3YGvi6TTUy0oPkbeeq+wcV8g9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773135621; c=relaxed/simple;
	bh=1v6x3Ncu5CyQJlWMMlRaz6M+L/TB1DfNtUnwwRlv8Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0LqoL0NVt8VWflmyBlVaoURdrudBFp0WZkFgmsVlUbAtrZdn+rJPeY+HKIz6++56/XMjKsXyiymZWb0/BgPjaOBiK8PLbJTUAWwcUXIIdLGXp0OFEwigZ0/eNeGhBeFUg3xkYmN1V9UIzsbSvzIDnJnxvxLmoMCQytP/wO+/5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RmyTNcSN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44442C19423;
	Tue, 10 Mar 2026 09:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773135620;
	bh=1v6x3Ncu5CyQJlWMMlRaz6M+L/TB1DfNtUnwwRlv8Ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RmyTNcSNdDnk2DnyHTOfjkQzqGrbXtqV8CnwamGnOLks5arWDv92gb5w0AOwoSHAi
	 gFCYbVLNRPTQaph/OpW9RB148NEVAtkzYdsmrqaMi/4JeLAw9euBpBDsmMUx+BAbxF
	 fYZzvYTXZqrp5UZidP7Y6wCS48KVj8OqnBuFyYQZjFVf5T/nZK9M0OmASogo5v+G8L
	 +Y5x45iFqFsP1pGwsITeyfBhN8zeeS1kwLpVn55hM9wQEig9OKCD/9Dd+VOqZLXi1K
	 oZAQ7yobxlF+gxCq8KJWhjxwuzGjndkmtiMf+gJ41WQz2DLNy74VVQh16gFUGE3rYX
	 /M9Cbie3Js10g==
Date: Tue, 10 Mar 2026 10:40:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shi Hao <i.shihao.999@gmail.com>
Cc: linusw@kernel.org, brgl@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: convert Cavium ThunderX GPIO binding
 to YAML
Message-ID: <20260310-snobbish-white-caterpillar-e8ef29@quoll>
References: <20260309082252.34384-1-i.shihao.999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309082252.34384-1-i.shihao.999@gmail.com>
X-Rspamd-Queue-Id: 8390C248B4A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32907-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,devicetree.org:url,bootlin.com:url,0.0.0.6:email]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 01:52:52PM +0530, Shi Hao wrote:
> Convert Cavium ThunderX GPIO text based device tree
> node to YAML schema format, ensuring validation and
> consistency across Device Tree.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Is this part of some LFX/GSoC program and thus should be first reviewed
by your mentors?

> 
> Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
> ---
>  .../gpio/cavium-thunder-8890-gpio.yaml        | 52 +++++++++++++++++++
>  .../bindings/gpio/gpio-thunderx.txt           | 27 ----------
>  2 files changed, 52 insertions(+), 27 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/cavium-thunder-8890-gpio.yaml

Filename based on compatible,

>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-thunderx.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/cavium-thunder-8890-gpio.yaml b/Documentation/devicetree/bindings/gpio/cavium-thunder-8890-gpio.yaml
> new file mode 100644
> index 000000000000..16d7c347f913
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/cavium-thunder-8890-gpio.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/cavium-thunder-8890-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cavium ThunderX GPIO controller
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  Device Tree binding for the GPIO controller found in

s/Device Tree binding for// because we do not need description of DT
binding that it is a DT binding.

> +  Cavium ThunderX and OCTEON-TX SoCs.
> +
> +maintainers:
> +  - Linus Walleij <linusw@kernel.org>
> +  - Rob Herring <robh@kernel.org>

You cannot have here subsystem maintainers. This needs platform or
driver maintainers.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - cavium,thunder-8890-gpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - '#gpio-cells'

Use consistent quotes, either ' or "

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio_6_0: gpio@6,0 {
> +      compatible = "cavium,thunder-8890-gpio";
> +      reg = <0x3000 0x100>; /*  DEVFN = 0x30 (6:0) */

I have doubts this was checked with W=1.

Best regards,
Krzysztof


