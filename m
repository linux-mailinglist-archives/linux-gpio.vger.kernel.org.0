Return-Path: <linux-gpio+bounces-34550-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPlVFXjQzGlFWwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34550-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:59:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AB4376692
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B30583138D6A
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 07:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231FF3932E2;
	Wed,  1 Apr 2026 07:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q33gf0na"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27EF392836;
	Wed,  1 Apr 2026 07:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775029626; cv=none; b=UW4QZdBwtm3V3nhTuu9iukUSGQ7Uc5ukmrqbj96C/f2u+1LG0zkQKGPpvjK0qnwyK6fckGVi9CGrXYrsMdtbYG6XXpBAZBxu0D+WCYvkt+xRvTW1IzVR0ISQZBeyXyvfXzM+vbF0xMCe5s2k5w4+7kNtsJYzxk/KhWa30HDttkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775029626; c=relaxed/simple;
	bh=lzWX3iUS0cGBKwvQbYvLCMFCiE+hsgup2maX2G5+fRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XuiwyMswbtsF+hMTyEWthHCRyIe5/nmDhS9lJFPN+u3BqMmqP6KlWLK5iK1uuSC2jZeWnEY3eUA3qbeckrLWXry8upNXCfdENVeebcC9ANvPa2vRWBxSoWniJNNGlmrxc5+6gbfnLlDAdqxz8TwMEfav8U6pd3uNvmToFDlPsSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q33gf0na; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC25C4CEF7;
	Wed,  1 Apr 2026 07:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775029626;
	bh=lzWX3iUS0cGBKwvQbYvLCMFCiE+hsgup2maX2G5+fRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q33gf0na9FgTmniWilMtyme65kNyXWY9hOXQH8PxqqvxmVLF5KQEqlgUNp0iPFCHK
	 7yveG1omdQbPZYX0MEnCX++PN4kKVLtgtTkXriqw/Qaihm54nLe44MTucaoxSzDsOx
	 xPH32/6bukn0lJdOJlayInKBvOiqh9TwLtoko1l1bfVc7K8YVmoUVMPtCaCY2gz7De
	 n3rT3QP8D81tRPwoK/eCH10H54E3g6BrYQi47q3P/1CZMa13B0ZQE/A1IezUg/Axp2
	 8DoM//zzJE6+Lf2sLjXIRQMIeemZJu5BCHGjY3rOwvaRieW1mGzX8LpoxL10m+d1PK
	 FExdQDBX0tfWw==
Date: Wed, 1 Apr 2026 09:47:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, brgl@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, afaerber@suse.com, tychang@realtek.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, cy.huang@realtek.com, 
	stanley_chang@realtek.com, james.tai@realtek.com
Subject: Re: [PATCH 1/3] dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
Message-ID: <20260401-idealistic-grinning-wallaby-8c3cd5@quoll>
References: <20260331113835.3510341-1-eleanor.lin@realtek.com>
 <20260331113835.3510341-2-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260331113835.3510341-2-eleanor.lin@realtek.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34550-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.1.92.32:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A9AB4376692
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 07:38:33PM +0800, Yu-Chun Lin wrote:
> +  reg:
> +    items:
> +      - description: GPIO controller registers
> +      - description: GPIO interrupt registers
> +
> +  interrupts:
> +    items:
> +      - description: Interrupt number of the assert GPIO interrupt, which is
> +                     triggered when there is a rising edge.
> +      - description: Interrupt number of the deassert GPIO interrupt, which is
> +                     triggered when there is a falling edge.
> +      - description: Interrupt number of the level-sensitive GPIO interrupt,
> +                     triggered by a configured logic level.
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  gpio-ranges: true
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-ranges
> +  - gpio-controller
> +  - "#gpio-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio@89120 {
> +      compatible = "realtek,rtd1625-isom-gpio";
> +      reg = <0x89120 0x10>,

0x10 feels very short range.

> +            <0x89100 0x20>;

And this means it's continuous. Are you sure these are two separate
address spaces?

Best regards,
Krzysztof


