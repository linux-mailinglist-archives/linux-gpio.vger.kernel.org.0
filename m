Return-Path: <linux-gpio+bounces-34916-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKyNFL9Y12kFMggAu9opvQ
	(envelope-from <linux-gpio+bounces-34916-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 09:43:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F19F73C72DE
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 09:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 65256300788D
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 07:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F56637C939;
	Thu,  9 Apr 2026 07:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EVllBZVK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35DC3081BE;
	Thu,  9 Apr 2026 07:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775720637; cv=none; b=c5kWS9bClbUFWuIflP0ug9EkLyYAtlN6vNGDrOeSTBMR/QwolE63YM5Ycefkq6pF7b9iGxQg7DIWcUMIz1wFYkteRx2S2/Rk7f899B8jhu2mq7ugeyAIWOWVxrPVf7c748e/bUaI4qMSjiHve4iMdeHtw62/wyhgKMLuwGZQodw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775720637; c=relaxed/simple;
	bh=uq/R6PmosWxaig3fB+at0I2ppDM6xQzhVCUmWXfCLIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWutZHr1/EXXKSypSsMK9JLPX8pI9HGi2iyndpCiVQdYG4N64HfCmowHSAXKx2LoZLGUBRGQ5Kby52/VfHrqZX9ReKWV7498HRLQR+UiFExftNym1kZZgRmpkpdj0TLXJvGmWeJxb78fGQwETQg+tVMxjbVFydcteHKWFwaUyMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EVllBZVK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C1EC4CEF7;
	Thu,  9 Apr 2026 07:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775720636;
	bh=uq/R6PmosWxaig3fB+at0I2ppDM6xQzhVCUmWXfCLIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EVllBZVKxqZDb6GWFRf6NCvRGFukJ+3EsnP2wGG9WlFBKXTj1m8EIxNieXFokKcNC
	 DY8z5BewLaM0clOfV8z+g1lmeigkmas2Ef6llkBYUOLKsmHrhs6frICytJD1gAsrKP
	 ILgqkdcyErgC7vKK10MJFyN83omrsJUU66Wg5JXSURzCIb3ir1Ij3WrhC0G+47k5+2
	 fOyhhnUVmELllc1kcdTZyR18jQlxhVRpMa5u74L1GuCocHwkhIB/mey17qCMktLJqH
	 ipAjY8yoPibjVwitnUb53lOicQ19oNEt78twPkuxZBkzykgu0tVCNo/b3LtrTDEbtB
	 v2GJLeLdgZMLA==
Date: Thu, 9 Apr 2026 09:43:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, brgl@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, afaerber@suse.com, tychang@realtek.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, cy.huang@realtek.com, 
	stanley_chang@realtek.com, james.tai@realtek.com
Subject: Re: [PATCH v2 2/4] dt-bindings: gpio: realtek: Add
 realtek,rtd1625-gpio
Message-ID: <20260409-heavy-colorful-monkey-e09d42@quoll>
References: <20260408025243.1155482-1-eleanor.lin@realtek.com>
 <20260408025243.1155482-3-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408025243.1155482-3-eleanor.lin@realtek.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34916-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F19F73C72DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 10:52:41AM +0800, Yu-Chun Lin wrote:
> +maintainers:
> +  - Tzuyi Chang <tychang@realtek.com>
> +
> +description: |
> +  GPIO controller for the Realtek RTD1625 SoC, featuring a per-pin register
> +  architecture that differs significantly from earlier RTD series controllers.
> +  Each GPIO has dedicated registers for configuration (direction, input/output
> +  values, debounce), and interrupt control supporting edge and level detection
> +  modes.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - realtek,rtd1625-iso-gpio
> +      - realtek,rtd1625-isom-gpio
> +
> +  reg:
> +    maxItems: 1
> +    description: |
> +      Memory region containing both interrupt control and GPIO
> +      configuration registers in a contiguous address space.
> +
> +      For realtek,rtd1625-iso-gpio:
> +        - Base + 0x0 ~ 0xff: Interrupt control registers
> +        - Base + 0x100 ~ 0x397: GPIO configuration registers
> +
> +      For realtek,rtd1625-isom-gpio:
> +        - Base + 0x0 ~ 0x1f: Interrupt control registers
> +        - Base + 0x20 ~ 0x2f: GPIO configuration registers

Drop description, you are duplicating here DTS. Bindings do not need to
serve as reference manual for the device.

However when you state them like this and give them names, I have the
same concerns as last time - please consult your datasheet whether this
is really one address space.

With description dropped:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


