Return-Path: <linux-gpio+bounces-31535-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFyBE/o6imlvIgAAu9opvQ
	(envelope-from <linux-gpio+bounces-31535-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Feb 2026 20:52:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BBA1143F6
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Feb 2026 20:52:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D211B301BF51
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Feb 2026 19:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CACC426D1D;
	Mon,  9 Feb 2026 19:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="c8DMBDkx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECC838757A
	for <linux-gpio@vger.kernel.org>; Mon,  9 Feb 2026 19:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770666718; cv=none; b=nop5n6JtmA/OJtPhAmgc7BjmUHBp1owbVSJWKLi1fGcGbePGr0SNE06PYf/BpzNRoXOTn1yfc+VRM+9w0bSFyghdpwYiP4vHDYBfsvdrd5EbJtw/DQurD5CTWFfu5+5mRMr9Ra2iOKDNpkM4RphENzRAHw/6fYWo4Ocfz87jwu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770666718; c=relaxed/simple;
	bh=QbNxuK3tOvIXgmDYwedzBVTlP19K/BzDnWCsg1LTqx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=me3fBdF0ZGfOnsQ1svGlRtL+4flbRWxNf8OZxpIEXsR9qx3LAPNo5OzvlN70St6RBgNOECYCT3ZWfIBm9w7FBbFm98F3n9hx731aUgQXNVFZUhTaNCKV+X1pVucja8iSKE6/Td5GbiGRFHYmPeBiPfx46hpFMAOps5/MSvUaCME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=c8DMBDkx; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KT3v
	PAr9+jvW3mi9x8Y66vturr8FwJVBhekG/tpC6Zk=; b=c8DMBDkxMXgjYFjg5hpl
	di8EsVNS7YfG/wjaG4AjbGVDMKBYDw/F0jtxz1N8dV1hw7uq4pHlU6Ohlhp+4BvD
	qhMtxNA/ZaXedTK6SvYQGoZMiGaDveLpLtUI3o33sUlK/C85dvD2YjO41B8DhvmO
	pADRlu/On51sYmfx+BtG5svy13expgCyNbZXBcxl9oQXI1rcs4LciDgwCp5bm9i4
	SbWspMzL8Nfs3Zy+Qy59J+2HEsehECs6xvPy0dvH5hDnlEFAiumfgWX3m4vJezU7
	OupUsVSileDb1YP07j1KmpxYDFQ6+eYo1RNTrWvWHCBuilb0So9QcHdPDwtpBiIN
	Qw==
Received: (qmail 1421036 invoked from network); 9 Feb 2026 20:51:47 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Feb 2026 20:51:47 +0100
X-UD-Smtp-Session: l3s3148p1@B1IbeGlKqNoujnuv
Date: Mon, 9 Feb 2026 20:51:46 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-renesas-soc@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andy Shevchenko <andy@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
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
Message-ID: <aYo60vooftdem4Lt@ninjato>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
 <aXc7DxsqiCGdfzxi@smile.fi.intel.com>
 <aXc-Zxw05XQLb1Dy@ninjato>
 <aXdAB2bLTy6u8G8c@smile.fi.intel.com>
 <aXdCBu6kzdw1NWay@ninjato>
 <aXikZ5wc6bvgRqF6@ninjato>
 <aYnBrN0JRCf9-UjB@ninjato>
 <yl4bbbev7lgrmnqys2izkolo5egzg24faukvqar5eh26q5ra7p@42rcegfpqqt6>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yl4bbbev7lgrmnqys2izkolo5egzg24faukvqar5eh26q5ra7p@42rcegfpqqt6>
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
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	RCPT_COUNT_TWELVE(0.00)[44];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31535-lists,linux-gpio=lfdr.de,renesas];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[intel.com,linux.alibaba.com,vger.kernel.org,foss.st.com,kernel.org,arndb.de,gmail.com,baylibre.com,linuxfoundation.org,redhat.com,lwn.net,lists.infradead.org,st-md-mailman.stormreply.com,lists.linux.dev,analog.com,infradead.org,sholland.org,posteo.net];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A3BBA1143F6
X-Rspamd-Action: no action

Hi Bjorn,

thanks for the reply!

> > Moving maintainers from CC to To ;) Do you, in general, approve this
> > change to the headers?
> 
> Certainly, I don't think we should force unnatural slicing of drivers
> across the source tree.

Cool, glad you like it.

> I've always found the current model unergonomic, resolving this part
> might very well have the side effect that Andy is looking for (and I'd
> welcome that).

Yeah probably, but frankly the task of redesigning hwlock-allocation is
a bit exceeding my bandwidth for this project. Can we make this a second
step on top of this series? And if so, would be this series acceptable
as-is then (modulo the better include-sorting mentioned by Andy)?

Hope you are well,

   Wolfram


