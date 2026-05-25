Return-Path: <linux-gpio+bounces-37462-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLQjHKRLFGpeMQcAu9opvQ
	(envelope-from <linux-gpio+bounces-37462-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 15:16:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D06A5CAF5D
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 15:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B957B3004692
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 13:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60DD384231;
	Mon, 25 May 2026 13:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nbmlAnIs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BE61B4223;
	Mon, 25 May 2026 13:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779714974; cv=none; b=bhi2vWCXTOGiK+J5Wpo0nd23OyWtR5IoUfQDvPgB1LRDBrOCehbCp3+sgRQ1mqgxd1uZhAE2elYzTPTvaCpoJHd0oUOwnHj2hg3I/BydHQ82ATkwD7ss4/jcL70x7bubb833iBynnISbziSVwO0Sm/MbFEvPavN/Cy47yDrkJQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779714974; c=relaxed/simple;
	bh=CiHfOFWBBVlGq3ebj4AHhQdzY89mtfr/b9jzInJKPEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQFCHS2VC0WH4vk8YiXCYyf01yWZJ4JlD8wVQvA4uUBGp2EFcDeXCWWvCHbxJGgXRWm2zCJTEBt288d65nc9Z+qOfUw1paH/j2Rn0eoiGvmlPuuFCTUfAeWwOwBRZ7sEwHKEXsCjiVf7XHoeR1ISGE2z9OQYvbX1n3PQP/9uNkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nbmlAnIs; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A401F000E9;
	Mon, 25 May 2026 13:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779714973;
	bh=6UIuQRfv+UYVJqZIp+HBt5FvsWW0qcjFFZ8GAxI7t2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nbmlAnIs/faHTIuHHvV8JMFp7Y8b+haaZfFACz0NX5xAK6EBWpj29zYMTUO0S+pod
	 L7hcxEQgwyAv76oCXL93o8572ihIT4ByXDYsuuqGDEZyJXxSIfBz6rQP7mw8J7c9cW
	 0b0yv2zLCm0gIFsVEvZYoSoNfsRhWWnhonqSC+ZVMqSMr/zXnfro0wND67FWuHCUbC
	 FOo9ezmMvGjXTPdEL4X+LRvyc2bZ2Rni6zGeZ1H+fhnp89mhH38CWIh6QUrGQD9sUf
	 R0MGaQ69wMyuDvl8La0qb+e19htvquteiXtB2BqZ2ew9VX4GQEbOraR/SIdJ/mNgpO
	 0fMrX1r08x5dg==
Date: Mon, 25 May 2026 13:16:09 +0000
From: Yixun Lan <dlan@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Han Gao <gaohan@iscas.ac.cn>,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
	Anand Moon <linux.amoon@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH] pinctrl: spacemit: fix NULL check in
 spacemit_pin_set_config
Message-ID: <20260525131609-GKA3748271@kernel.org>
References: <20260519164007.122574-1-gaohan@iscas.ac.cn>
 <20260519232154-GKA3708537@kernel.org>
 <CAD++jL=gAXc0oRg3RJCuaH0_oDXJ39aShAXtQz0tpt339mFB5Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=gAXc0oRg3RJCuaH0_oDXJ39aShAXtQz0tpt339mFB5Q@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[iscas.ac.cn,hammernet.be,gmail.com,pigmoral.tech,linux.spacemit.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-37462-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7D06A5CAF5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Linus,

On 10:48 Mon 25 May     , Linus Walleij wrote:
> On Wed, May 20, 2026 at 1:21 AM Yixun Lan <dlan@kernel.org> wrote:
> 
> > Can you take this as a fix for v7.1 cycle?
> 
> Only if you can provide proof that it is a regression, i.e crashes
> systems that were working with v7.0.
> 
Ok, I'm fine with it applied as noncritical fixes, as the problem exist
in v7.0 and can't say it's a regression, it shouldn't cause crashes but
only fail to configure pin when id equal to 0.
-- 
Yixun Lan (dlan)

