Return-Path: <linux-gpio+bounces-31064-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEbhK4BCd2mMdQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31064-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 11:31:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA5986F72
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 11:31:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39B79302C936
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 10:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94773330329;
	Mon, 26 Jan 2026 10:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jHX8+Wl7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA01329E5C
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 10:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769423372; cv=none; b=M3+zYRXBFXaQgyp3npa7gR5ymbCRSHU64BcnUydqFKXlUU+3LKqzy/nAXCbM11EW3BYXqETZot3eKwXT++D/S89VwoOi7eEusoU3Bl1TSy9lJKBIpyBq7//eMa39aNcAB3wY80fI2nArLgvymMC9PXoA/nicS6Z3zxOmSIl70Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769423372; c=relaxed/simple;
	bh=Jh9DbPdyhqX1cvGDcyHJMZub+1uUsIMf6B/WAv++Rbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KMcJIG9Q4dAg5mX0uQkJI975GkBsHqCSXxIN7gt2Om+ceUwLsmsj6XS8eIZp1iFM+1gGYH8bOh0Tgd9rQCA0B3kN3hw5VeMtKiULDzc+G7Lc7TrUwMjscxBCnqEA1AtwsXa1OwBBlllP0MhBbj/maxiTbBAmxthCyq8B3yOcHpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jHX8+Wl7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=F2bF
	S/uMFLgtEVC0YCnMXZC86wb3SDlDFVJk5gHDbHs=; b=jHX8+Wl7CjOEdsajEoyd
	YLJSni1KMKFnTnF6HUkKy4i7hdARKm53juZzr7ZafJR47rtHoNyWJaaKdHJ/2sso
	LqYQH5W3d0RaRaQ8Q8J1G9u4nNTashMNVexC1gLUhUwVMKjdwdx0vBnOcNj2BbqO
	OzdLxlpS3qYwey2EMbughKgdVpyf2lbwjuTyiOgPikJmtfRlj0LYKeoBgjXrSvoV
	mlK/IzdLZzcuzrQK6IypnN/vpPwAKgfyOgmhmg2cICJBgE71R+rc1lx8MlV6l5v8
	F39Y7wqyE8Wvnw4+qlOC0DvLTWsXo+ZALNH34HFE5YzYV8NWVP6e4yVnRLb2de1H
	6g==
Received: (qmail 2710669 invoked from network); 26 Jan 2026 11:29:27 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jan 2026 11:29:27 +0100
X-UD-Smtp-Session: l3s3148p1@tFg7+0dJFMUujnvz
Date: Mon, 26 Jan 2026 11:29:26 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andy Shevchenko <andy@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Waiman Long <longman@redhat.com>,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Will Deacon <will@kernel.org>
Subject: Re: [RFC PATCH 0/4] hwspinlock: refactor headers into public
 provider/consumer pair
Message-ID: <aXdCBu6kzdw1NWay@ninjato>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
 <aXc7DxsqiCGdfzxi@smile.fi.intel.com>
 <aXc-Zxw05XQLb1Dy@ninjato>
 <aXdAB2bLTy6u8G8c@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXdAB2bLTy6u8G8c@smile.fi.intel.com>
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
	TAGGED_FROM(0.00)[bounces-31064-lists,linux-gpio=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[44];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,foss.st.com,kernel.org,arndb.de,linux.alibaba.com,gmail.com,baylibre.com,linuxfoundation.org,redhat.com,lwn.net,lists.infradead.org,st-md-mailman.stormreply.com,lists.linux.dev,analog.com,infradead.org,sholland.org,posteo.net];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5AA5986F72
X-Rspamd-Action: no action


> > Providers need it, especially the 'priv' member. Consumers won't see it.
> 
> But can't we make it opaque?
> 
> We may have getters and setters for the priv member...

I think we could do that.

Two drivers use the bank member, but only for the device
(lock->bank->dev). That can probably be refactored away, I'd guess.


