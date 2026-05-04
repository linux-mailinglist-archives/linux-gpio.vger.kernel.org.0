Return-Path: <linux-gpio+bounces-36031-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGk4OFNa+GlStQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36031-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 10:35:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB884BA49A
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 10:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FBFB3068E7C
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 08:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8841333D512;
	Mon,  4 May 2026 08:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="L0LY+0ZK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD97033B6C2
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 08:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777883423; cv=none; b=dpSj5Pc4CI9K+eCOULpPonLeDW5lBa8uy7Mk3CN8lxeoRKdzcF18b1/+4XQUYgG7jzTVtapvlhDZAlXSuEoXUnpunhQdlyxqjsOYVf2YYgcXfClVN73/4GYiMRk55uh7GeJGXf7SRy93QbzhRFaLX+2A2L8/XNuuuC8K2SpRf30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777883423; c=relaxed/simple;
	bh=JMujZUDEuc3YNk3EbWd6e8TbepwSK0dwVKPhpxfhgxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MqyKIgRTMlxO5b0CNeV51rRQxpHUHFYAY5PEC4MCpX8PwoRU19BYFUW4S0NJwdO55B18Zt6k/bG8KVjQsdVTZJp1ET2D1oCqxv4abbqfjxRbV77UdlNX0o88frbW9LIG5y4ZWyAo03+1WO1HDLlpb4oGnIDJ142CcTauqfPnD1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=L0LY+0ZK; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=eTSd
	DPwWW4/ZWzbZYVwv6UgySSpuqfzPBisnZyolzFg=; b=L0LY+0ZKpGp1YN9pVpMW
	YLJxnvPaC+/Tvf3Wjy2FILZZQ3KP/OKnI4y9ILEPNUFtlIDFOeZDZa+KFBM3OSIo
	IHzU4NWS4Z6rsozRkhL3FFH/1lAb6VBCQhFVgTyb8hBF/IVhnQ0YrTAm0Gu/bmMc
	VKQwCXogLBB5dkEcfvZUGGosM53Z/D9c5c85ikTIGg/XyGmHOi5l9o9oYu0Skgcy
	REYwjGNYu4AhTxYZ85kAZefqbvwOAI00HKlfSU+XapOOJDzlN2qv00McvDtVf6bo
	t1meY0cIKIr2aWMMpY8UTrlsW++R6xD3Ok688WLvBwnUDAbnapSq8J4j+jFu80lV
	cA==
Received: (qmail 2104411 invoked from network); 4 May 2026 10:30:19 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 May 2026 10:30:19 +0200
X-UD-Smtp-Session: l3s3148p1@X9uhvflQBM8ujnvR
Date: Mon, 4 May 2026 10:30:18 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Janne Grunau <j@jannau.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 6/9] dt-bindings: i2c: apple,i2c: Add t8122 compatible
Message-ID: <afhZGnc9vATRDH9d@ninjato>
References: <20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net>
 <20260320-apple-m3-initial-devicetrees-v1-6-5842e1e393a8@jannau.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-apple-m3-initial-devicetrees-v1-6-5842e1e393a8@jannau.net>
X-Rspamd-Queue-Id: 7DB884BA49A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36031-lists,linux-gpio=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gompa.dev,linux-watchdog.org,roeck-us.net,openbsd.org,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jannau.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:dkim]

On Fri, Mar 20, 2026 at 01:23:24PM +0100, Janne Grunau wrote:
> The i2c block on the Apple silicon t8122 (M3) SoC is compatible with the
> existing driver. Add "apple,t8122-i2c" as SoC specific compatible under
> "apple,t8103-i2c" used by the deriver.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> Acked-by: Andi Shyti <andi.shyti@kernel.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied to for-current, thanks!


