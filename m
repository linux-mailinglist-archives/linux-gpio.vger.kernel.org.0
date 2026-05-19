Return-Path: <linux-gpio+bounces-37165-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1u94MenwDGoGqQUAu9opvQ
	(envelope-from <linux-gpio+bounces-37165-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 01:23:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 21193585FB1
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 01:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61C6C3056FC1
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 23:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48AF3537E8;
	Tue, 19 May 2026 23:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OH0BZj/N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BC2352003;
	Tue, 19 May 2026 23:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779232918; cv=none; b=nBVrcpNYFcqI2t7U+WUUeLtDYmp8voPfoCMrEmym7AEAzh3BzP1lrMaIX5I/JuYUGx7XJjIMwJOsIfzOtEJNbX/hc07hAF0/z/aHViYS/fMDJBhK4oFp9753l6P91c78Gm/NWnomuWM9CVf7P4SfAvblMReJ8Ck57zhxY7QGRrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779232918; c=relaxed/simple;
	bh=of6cfuYDOuPHZQqFwY6adJj8H3lq4Bxw08GbEIKhY+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nf23c69c5Ia+FZQPq3n+FCdUn7qu15cJ/KiNZ8gTIl92el7fiuhZEa3on/Cb8wrFO8hkZowVno56R+c8TCXbukTs1NQDb0Tjx0ZnLagFLQHPJukLZUhYG0+lfR0sa+QOS6r8D5IUH00XYCKsj56mn2tEpk7nqeVnBjqgdNXdbpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OH0BZj/N; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA371F000E9;
	Tue, 19 May 2026 23:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779232917;
	bh=rTHVrMvCwYTZlktit7SkyBCR9EOe2m+vAOtAPQ7Cebk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OH0BZj/N3kGv0Krj7B8nAn/aKUUeD0Rg7L0DfA3kXFym101kBPtk07yt3Jc2y0wEQ
	 KROqKjkHqzcqj1jdg6WGggS81iCbX82cmNxjrFIQnBjzyDL3lGnMvaXSC7XPteDOiX
	 uhxE1jgpaqweBOkwjytfCsqa9pNKtLw/Fj1UVEGrmrsF9G+UVDARBvDCffthdh1lVw
	 0upvOwMEx37iVh8MDYANV03I9xE4QhrU50ne/CHZse9O9N4hdg+vz/Yx1nxNMVgd0M
	 lPaBjARuSL+j5X4e/RCrAddi4cZJpmYSapDsA+vMKbMEV/nt1aoikZ/6/Ah1nLsvMg
	 n9p2nEbTpi3oQ==
Date: Tue, 19 May 2026 23:21:54 +0000
From: Yixun Lan <dlan@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Han Gao <gaohan@iscas.ac.cn>
Cc: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
	Anand Moon <linux.amoon@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH] pinctrl: spacemit: fix NULL check in
 spacemit_pin_set_config
Message-ID: <20260519232154-GKA3708537@kernel.org>
References: <20260519164007.122574-1-gaohan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519164007.122574-1-gaohan@iscas.ac.cn>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[hammernet.be,gmail.com,pigmoral.tech,linux.spacemit.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-37165-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlan@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,iscas.ac.cn:email]
X-Rspamd-Queue-Id: 21193585FB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Linus,

Can you take this as a fix for v7.1 cycle?

On 00:40 Wed 20 May     , Han Gao wrote:
> spacemit_pin_set_config() looks up the per-pin descriptor with
> spacemit_get_pin() then checks the wrong variable for failure:
> 
> 	const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
> 	...
> 	if (!pin)
> 		return -EINVAL;
> 
> 	reg = spacemit_pin_to_reg(pctrl, spin->pin);
> 
> pin is an unsigned int pin id, where 0 (GPIO_0 / gmac0_rxdv on K3) is a
> valid pin, so rejecting it here drops the PAD config write for the first
> pin of every group. On K3 Pico-ITX the GMAC RGMII group lists pin 0 as
> its first entry, so its drive-strength / bias configuration was silently
> ignored.
> 
> The intended guard is against spacemit_get_pin() returning NULL when the
> pin id isn't in the SoC's pin table. Check spin instead, which both
> restores PAD setup for pin 0 and prevents a NULL deref on spin->pin.
> 
> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
LGTM, thanks

Reviewed-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/pinctrl/spacemit/pinctrl-k1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> index b0be62b1c816..95024e2bb5a5 100644
> --- a/drivers/pinctrl/spacemit/pinctrl-k1.c
> +++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
> @@ -795,7 +795,7 @@ static int spacemit_pin_set_config(struct spacemit_pinctrl *pctrl,
>  	void __iomem *reg;
>  	unsigned int mux;
>  
> -	if (!pin)
> +	if (!spin)
>  		return -EINVAL;
>  
>  	reg = spacemit_pin_to_reg(pctrl, spin->pin);
> -- 
> 2.47.3
> 

-- 
Yixun Lan (dlan)

