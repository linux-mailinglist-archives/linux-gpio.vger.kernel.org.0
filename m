Return-Path: <linux-gpio+bounces-31480-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBkVND9vhWnqBQQAu9opvQ
	(envelope-from <linux-gpio+bounces-31480-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 05:34:07 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB64FA1D6
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 05:34:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C80F30327FC
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Feb 2026 04:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E215335BB4;
	Fri,  6 Feb 2026 04:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="kwk9mzoE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2542E33506A;
	Fri,  6 Feb 2026 04:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770352268; cv=none; b=YfZhPA/6x7Obz58OenepJ4R+GHp1aITRa1Dl0LPBY6InUb8shuBfcsFgXg6+gJXXwMOZ2gXLtYkZNQ/Rt8rZybm91eZc2ImRV4gdoMz+Jcn/X18YU6G0pO1n2AqUJe7c7EwbPcnbxuhflu26yDzzarvmKreyL1KfViTb+DNVD5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770352268; c=relaxed/simple;
	bh=jFmNoqj9HqTRVjU1BU0gq4JHfzGq48IU+b3F6hx3rRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=icDLlMtnd+FoRuuStKun1ZM7JA5H2R2aTOtma7UUNhq9vVP8k1royqllOShXBYQYu2lst5Vj2O5/dkGJCdGMNgUZrZPYL5dDof8pWhU3hAyzfrjres0EENyr/1o/f8PqWCwmsmm1AI7rjwMBes6reBZj+HhVwCucpwLwZzyv8sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=kwk9mzoE; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (84-231-56-127.elisa-mobile.fi [84.231.56.127])
	by mail5.25mail.st (Postfix) with ESMTPSA id 0413560881;
	Fri,  6 Feb 2026 04:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1770351756;
	bh=jFmNoqj9HqTRVjU1BU0gq4JHfzGq48IU+b3F6hx3rRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kwk9mzoEYPjeH03drx7Kb0lX0rtI+T1BvvcO6H06NGgGIVzFuI43AEAtLVMz2TezM
	 8PZx7TacSCpTTV4kyHsxa9WqGrwsbi+i+RnaUzGSXhfQn4AFF7RX4LJAmcaMgO8mxC
	 G85zXj6HlGNRHo57jEclqXpY5b+DXGv2B7fb9Zg0o99q/cgjQJdfOwaWevUF/z3fRc
	 ToOnrimzNNDMg8l2KzOdOjMkYXyVkuqiis0jQMBLlKvb0S1UHKB7rUatiKtP8m+ba2
	 SNahWGkmUPoo6ZP7HHGiodmL5iVg26AR8hz4a9PD8Qo0obslsz1MLaZqRY/vy6JO2M
	 JN35yfo+cE4eA==
Date: Fri, 6 Feb 2026 06:22:15 +0200
From: Tony Lindgren <tony@atomide.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH v2 0/3] pinctrl: single: bit-per-mux DT flexibility,
 probe robustness, and consistent pinconf offsets
Message-ID: <20260206042215.GA5376@atomide.com>
References: <20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com>
 <CAD++jL=OXJdJZpjbo0_C03vcgPe5btum-J0uifvSJkMaUWG-=w@mail.gmail.com>
 <OSQPR06MB725257E71F0B7F7F1013263D8B98A@OSQPR06MB7252.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSQPR06MB725257E71F0B7F7F1013263D8B98A@OSQPR06MB7252.apcprd06.prod.outlook.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[atomide.com:s=25mailst];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[atomide.com];
	TAGGED_FROM(0.00)[bounces-31480-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[atomide.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tony@atomide.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,atomide.com:mid,atomide.com:dkim,aspeedtech.com:email]
X-Rspamd-Queue-Id: 4BB64FA1D6
X-Rspamd-Action: no action

Hi,

* Billy Tsai <billy_tsai@aspeedtech.com> [260204 06:54]:
> Hi Tony,
> 
> This series proposes a set of changes to pinctrl-single motivated by
> bit-per-mux SoC designs such as ASPEED AST2700 (per-pin DT encoding,
> aligned pinconf offsets, and allowing probe to continue when the MMIO
> region is already reserved).
> 
> Linus reviewed the series and noted that he would prefer a custom
> pinctrl driver using existing helpers and the pinmux = <...> DT
> property, rather than extending pinctrl-single, and suggested that the
> pinctrl-single maintainers review the approach before any merge
> decision.
> 
> I would appreciate your guidance on whether extending
> pinctrl-single in this direction is acceptable, or if the preference is
> to pursue a dedicated driver instead.

I agree with what Linus that separate more targeted drivers are better
to avoid the drivers getting complex. With the GENERIC_PIN* helpers doing
targeted drivers should be trivial.

My preference would be to move the bit-per-mux handling out of the
pinctrl-single driver into a separate pinctrl-single-bit type driver.
Seems that can still handle the cases where no hardware specific driver
is needed.

This would simplify pinctrl-single driver quite a bit, and would make
the new driver quite simple too AFAIK.

Regards,

Tony

