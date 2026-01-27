Return-Path: <linux-gpio+bounces-31156-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGT0LJGkeGmGrgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31156-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 12:42:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7708E93C0B
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 12:42:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5B24302F7C0
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 11:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FCD034A3AC;
	Tue, 27 Jan 2026 11:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HMKf9MJH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56ED834A78F
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 11:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769514100; cv=none; b=okKwek+KQjYT7FLx6KlO7ResTIQkyks6Hcz7LVf+9IXacMcKENJbfNtNWmJkQjEcOHSr0BjmFBKpzGstWzz0H+x9BuMTv4RurEY1wECRU3bLPv/JFXScPKcMCahemn2b8aroGncc/FeR60tcmtJ2q6ow0KDilhgpYC4zfSNeLO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769514100; c=relaxed/simple;
	bh=68UIz997v/QQuZTcsHzoMjMrK8CsIhjT+rj9uii+aXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lumPblOsy7uI2e0wMdoDg8uPjYPbqGYRhyNcfyujdpV7C+LWD2ehgRn3/8MoyZ0yNecz01tbYvEq0LI28SyFnk0rZT4SotEWAMTAt8NgpYgiPJwgP4EkihEWjF1aIVY/qfb9+8U0SgnfjWrDROO183NO//fkE34gtckmMiIWvpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HMKf9MJH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=jjft
	8BNeQcJsJ7Q11OQxvOD2FcnLqb+zVi7vsmsrKrA=; b=HMKf9MJHWxg4cDoC0MI5
	PucL2VvzlUC0YI8iulenVBfr4MKGN1Ebz/YS1t187Hww6Lia4sqg0KTw3F3qaA8d
	fVpnblfy4xEeohABEyTM7oqNa6BOGfLVxxr8rmkvMhfQK1nrI0ib+mawvB2j67eb
	escveoPg+49prmLwiAVDxa5Olq9jqrb6Oy2VLTS9slta+ejYZ8tAxILuEUEqjzd2
	B497UTAZnMHLfG99P4I4tAefPug2NI2ICiFMumiJtdHcDFX8eRFkkgXPgVb3IwCd
	FkzdQ2TxXtfOYU07f71N22Yc46fbmeUV+2jRLzGsvUZzhJUb6Bnj7QG1Sfroih7i
	Vg==
Received: (qmail 3194881 invoked from network); 27 Jan 2026 12:41:27 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jan 2026 12:41:27 +0100
X-UD-Smtp-Session: l3s3148p1@x4iaGl1JPqYujnvZ
Date: Tue, 27 Jan 2026 12:41:27 +0100
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
Message-ID: <aXikZ5wc6bvgRqF6@ninjato>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
 <aXc7DxsqiCGdfzxi@smile.fi.intel.com>
 <aXc-Zxw05XQLb1Dy@ninjato>
 <aXdAB2bLTy6u8G8c@smile.fi.intel.com>
 <aXdCBu6kzdw1NWay@ninjato>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXdCBu6kzdw1NWay@ninjato>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31156-lists,linux-gpio=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim]
X-Rspamd-Queue-Id: 7708E93C0B
X-Rspamd-Action: no action

Hi all,

> > > Providers need it, especially the 'priv' member. Consumers won't see it.
> > 
> > But can't we make it opaque?
> > 
> > We may have getters and setters for the priv member...
> 
> I think we could do that.
> 
> Two drivers use the bank member, but only for the device
> (lock->bank->dev). That can probably be refactored away, I'd guess.

I am willing to develop this series in the above direction. Before
though, I'd like to know from hwspinlock maintainers if they agree to
this refactoring in general.

Thanks and happy hacking,

   Wolfram


