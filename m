Return-Path: <linux-gpio+bounces-32727-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOD4FR5CrGnEoAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32727-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 16:19:58 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DDA22C5BB
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 16:19:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0944E3012EBD
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Mar 2026 15:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2AA3A2555;
	Sat,  7 Mar 2026 15:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LLRmUA7U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D252DC792;
	Sat,  7 Mar 2026 15:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772896793; cv=none; b=JGE8xoAR7pm31sIxgVspLmrd1p6bLFm1Br65xw6RuUcpd4SjztghmDyatC1wIq1BuplCR4oNwa9k7jQOqtC6hy59zQaNGx6hqNfm16Uawddhd6xogescbJVqbyNJdmEXYwAfRKSX/J35RAhn4KTI05/tH0SwdX1Eg8lu5O9LxXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772896793; c=relaxed/simple;
	bh=1AnC7JuzY6vxujjqCJ8Mk1cswzSyhfw/ZCAQjD3UQf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NuWz6NO6cohCkPb5jS3/H92ZR9m/480hPq8PAMJFvIYqildEriHzBrIqyV3pahMHaBwo8af9Tbvh05IrztkAbXOS3EvZdPQ9ICv2UULLo6617X9VtR+OmyadB7RR6EsMFQxOg8z0xRSVQ5EpfO4eqR4bLH3uv9FhFqI8wbYMK6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LLRmUA7U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD32AC19422;
	Sat,  7 Mar 2026 15:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772896793;
	bh=1AnC7JuzY6vxujjqCJ8Mk1cswzSyhfw/ZCAQjD3UQf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LLRmUA7UHsZdMOdy4AkblVCwT2uBpYuNr6s15csCBqJVJe58asVD0AnULdsv7v4rp
	 wSpMD49CR1o00bt8X8RZ0YaE9+ea1YNBG3Mf31B9OrccPyyuUh1wTpf5sFYCgCoxLk
	 SEmaXSIUEp0QlhkPzexhXjkE4OmR8yVr/ysDzctOUAUVvMcOq0BkcdteaFUH1gsoti
	 UeEHadMHeqwlIKWJ3u8YiSD50pWGNq6xh2cZX/p13gqQu69vMpzY2YW0efFZ/0IjDQ
	 1iv46LnVots9IJPzjIq9o1Xp4GqRyCakWAJuIONInevd3dv/kKFqZcc245DtUfs8PT
	 XF3g37QofXGZQ==
Date: Sat, 7 Mar 2026 16:19:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zichar Zhang <zichar.zhang@cixtech.com>
Cc: linusw@kernel.org, brgl@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, peter.chen@cixtech.com, 
	fugang.duan@cixtech.com, jank@cadence.com, cix-kernel-upstream@cixtech.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: cdns: add clock-names property
Message-ID: <20260307-foamy-happy-bumblebee-cddd75@quoll>
References: <20260306093238.2715269-1-zichar.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306093238.2715269-1-zichar.zhang@cixtech.com>
X-Rspamd-Queue-Id: B1DDA22C5BB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32727-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.966];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,cixtech.com:email]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 05:32:37PM +0800, Zichar Zhang wrote:
> From: "Zichar.Zhang" <zichar.zhang@cixtech.com>
> 
> Add the optional 'clock-names' property to specify the name of the GPIO
> controller's input clock, aligning with standard clock binding conventions.

No, there are no such standard clock binding conventions. DT maintainer
tells you that.

Otherwise explain me where did we document such convention?

> This complements the existing 'clocks' property and ensures proper clock
> handling in device tree descriptions.
> 
> Signed-off-by: Zichar Zhang <zichar.zhang@cixtech.com>

Messed From/DCO.

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

> ---
>  Documentation/devicetree/bindings/gpio/cdns,gpio.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
> index a84d60b39459..c242b31edcbf 100644
> --- a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
> @@ -24,6 +24,12 @@ properties:
>    clocks:
>      maxItems: 1
>  
> +  clock-names:
> +    description:
> +      Optional name for the GPIO controller input clock.
> +    minItems: 1

Nope. From where did you take such syntax? Missing proper constraints
for names.

I don't see reason for this in the first place and your commit msg is
really poor in explaining WHY you are doing this.

Best regards,
Krzysztof


