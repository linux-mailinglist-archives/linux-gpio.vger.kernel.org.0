Return-Path: <linux-gpio+bounces-32714-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNrWCysErGkxjAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32714-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 11:55:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C842922B362
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 11:55:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1D84F3016725
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Mar 2026 10:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3584347521;
	Sat,  7 Mar 2026 10:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gBwF1jya"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF68633D50C;
	Sat,  7 Mar 2026 10:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772880933; cv=none; b=A/rI0l/qN3IxOJxyeGeGnaDcgXI441+Zf/bWSC1BsprHonrLPbbgP9tiv12PWSQxpXDHfOkcP/YyXYEQsizAtYSemSNyr3J+TfyduHbrTIOV7d7vFY/+PSauZR+jixm0eRdYH9795cxe5vliXBopv82/8Ur3mfj2Fk1fzm0IhXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772880933; c=relaxed/simple;
	bh=0owm4mKObWbnUeGHMN4y2SQdPXnXIhv9skTRR518J/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P8KHJb4nSMACLNRvzOPnA5J6nKgTztV69C30WCXuk0Et85bGw0SKutdSjREfGVsQkOEIL0OoOcpdAYZqAqOhukhY+evDTDOfO6MmHVhC09AUQ4ZrNoLgAezEdSY2Oet8xRJ01J7gNh41FwP72+uh+ZwNpimBIvy9PQi23kdxM6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gBwF1jya; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC4DC19422;
	Sat,  7 Mar 2026 10:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772880933;
	bh=0owm4mKObWbnUeGHMN4y2SQdPXnXIhv9skTRR518J/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gBwF1jyaAvo+N9jckDoGQIt0wrQcCufpP7DMH9TRanNgHbvOTlB96BFmvXNJL2fQz
	 eTm/ZClYSUzv5tAxOhY1lKB+Wqxr8/XAPSofHt7JHe3VMZs2UTSzqmD+aaLvp9b4TU
	 JwmwqQrBFm1rTXolEfdIeDvaenB8Lo0XGpK8/2doz9If0QCrrityNU9A2wSdM9wbUc
	 SvWF92XmE5YttrtY/S+gGPj5ksxJ+QsPG4Fhp+OHBftrI0nmV0AUHUDnsH8w8lIaZJ
	 WbWdogZaLuawLZ/n7metr92eUMxo4zfwA6lB/LXyaCyCFO1pkzsPHHTuen2Zu0SPe3
	 vUVl6OT8W6B7Q==
Date: Sat, 7 Mar 2026 11:55:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc0-pinctrl
Message-ID: <20260307-weightless-quirky-spoonbill-dacd89@quoll>
References: <20260306-upstream_pinctrl-v4-0-ad4e8ab8b489@aspeedtech.com>
 <20260306-upstream_pinctrl-v4-2-ad4e8ab8b489@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306-upstream_pinctrl-v4-2-ad4e8ab8b489@aspeedtech.com>
X-Rspamd-Queue-Id: C842922B362
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32714-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 08:40:26PM +0800, Billy Tsai wrote:
> +          - USB2BDBP
> +          - USB2BH
> +          - USB2BHBP
> +          - USB3A
> +          - USB3AAP
> +          - USB3ABP
> +          - USB3B
> +          - USB3BAP
> +          - USB3BBP
> +          - VB0
> +          - VB1
> +          - VGADDC
> +
> +required:
> +  - compatible
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +additionalProperties: false

I guess the mess with examples is partially my fault of imprecise
feedback. Rob asked you to add the example to main MFD device, but:
1. maybe he assumed there will be separate binding for parent device?
2. you added it in wrong patch (pinctrl patch changing MFD!),
3. it was also incomplete that time.

The example - if you tested your v3 - was needed to actually validate
and point errors. My bad I asked to drop it.

So now you have a mess - incorrect, non-validated (example-less) and
maybe even incomplete binding.

Please post complete ast2700 SCU binding - what children do you have? If
none of ones mentioned in the binding apply, then why the binding
mentions them? why do you allow p2a if 2700 does not have it? And
smp-ram?

And if 2700 has silicon-id, interrupt controller, pinctrl etc, then why
none of them were present in the example you added?

But more importantly, none of this was actually built tested/checked
against DTS thus I cannot accept it. We are back to basics... post your
COMPLETE DTS somewhere and provide link to it.

Best regards,
Krzysztof


