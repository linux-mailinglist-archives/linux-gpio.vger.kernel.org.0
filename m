Return-Path: <linux-gpio+bounces-31534-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKPwECkIimluFQAAu9opvQ
	(envelope-from <linux-gpio+bounces-31534-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Feb 2026 17:15:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E7011269A
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Feb 2026 17:15:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B411303C298
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Feb 2026 16:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C9233815C3;
	Mon,  9 Feb 2026 16:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eUZjPza7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EFC3815CE;
	Mon,  9 Feb 2026 16:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770653640; cv=none; b=VCtLf1iXro1nHrQbYcs8pJiz7qKN9duvcnoP0eMtF58sCasfYwDDZTvgVSUAXseOxdZjyQboYAfE+cfhDMfeZRsYZEBaEVfyQuOPpHOPJLym8dzvS5CXKQ2Pw1eSeUpIJNVRW/kFEjnRnkFSgL1XuxHFZ4OQPAnCZbMqCzRh+5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770653640; c=relaxed/simple;
	bh=LOJcn+SmxysmVh2uPMIzBp5pbzxzu9seMnrYNsHRBSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oyEdr1shpiAKsjhQeOAJ+lSkRQ+N9YWlzC0urKftPwpN095HYyT1X2bkIDTgWbgPWHwPBqnu11JPWDWFl5nL01qxOzhr3/nvp1/9RaSnDB6Ns0vToDQMaCQXaeK1GPUKEp/mqy8KjkOgvyUjLjKfvRFOCh9lxgQVSe5eybm7YWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eUZjPza7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 632F9C16AAE;
	Mon,  9 Feb 2026 16:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770653640;
	bh=LOJcn+SmxysmVh2uPMIzBp5pbzxzu9seMnrYNsHRBSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eUZjPza7FPFYtADnlPyrvUQeLkRIftNqUBdxCxWsmcAxTSEC7h1y3EogopI2EN5yo
	 OHmOM4kRW0mWYsaSBWeGG94SFkrQlwoy9ERbFTMTpJ0Io+NbOKNgJNMpqw5vPFTiY6
	 qwp352Vg3bCuD/ikfLM+KvmjcmjKBagsBMSXIrGiWJHNZaw4RYV4gPr0yrtQYiRF+s
	 XbzUgmmGAWxnPB125eA5XmC+pOpdmCHQCX7Td/XoBgVqmJ4gjH0csPg+S7wNLwyOwO
	 QrRRMXCGGZHPIJ2qZsnFaSW8sWMnKrw3L0+d4bXLpB3/vn47IMQEV+DuyQG5OfBMsM
	 AqPkD6R2UBZ+g==
Date: Mon, 9 Feb 2026 10:13:54 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-renesas-soc@vger.kernel.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andy Shevchenko <andy@kernel.org>, 
	Antonio Borneo <antonio.borneo@foss.st.com>, Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Konrad Dybcio <konradybcio@kernel.org>, 
	Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, Mark Brown <broonie@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Waiman Long <longman@redhat.com>, 
	Wilken Gottwalt <wilken.gottwalt@posteo.net>, Will Deacon <will@kernel.org>
Subject: Re: [RFC PATCH 0/4] hwspinlock: refactor headers into public
 provider/consumer pair
Message-ID: <yl4bbbev7lgrmnqys2izkolo5egzg24faukvqar5eh26q5ra7p@42rcegfpqqt6>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
 <aXc7DxsqiCGdfzxi@smile.fi.intel.com>
 <aXc-Zxw05XQLb1Dy@ninjato>
 <aXdAB2bLTy6u8G8c@smile.fi.intel.com>
 <aXdCBu6kzdw1NWay@ninjato>
 <aXikZ5wc6bvgRqF6@ninjato>
 <aYnBrN0JRCf9-UjB@ninjato>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYnBrN0JRCf9-UjB@ninjato>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31534-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[44];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[intel.com,linux.alibaba.com,vger.kernel.org,foss.st.com,kernel.org,arndb.de,gmail.com,baylibre.com,linuxfoundation.org,redhat.com,lwn.net,lists.infradead.org,st-md-mailman.stormreply.com,lists.linux.dev,analog.com,infradead.org,sholland.org,posteo.net];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 91E7011269A
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 12:14:52PM +0100, Wolfram Sang wrote:
> Hi Bjorn, Baolin Wang,
> 
> > > > > Providers need it, especially the 'priv' member. Consumers won't see it.
> > > > 
> > > > But can't we make it opaque?
> > > > 
> > > > We may have getters and setters for the priv member...
> > > 
> > > I think we could do that.
> > > 
> > > Two drivers use the bank member, but only for the device
> > > (lock->bank->dev). That can probably be refactored away, I'd guess.
> > 
> > I am willing to develop this series in the above direction. Before
> > though, I'd like to know from hwspinlock maintainers if they agree to
> > this refactoring in general.
> 
> Moving maintainers from CC to To ;) Do you, in general, approve this
> change to the headers?

Certainly, I don't think we should force unnatural slicing of drivers
across the source tree.

> I think it is more modern and e.g. the mailbox subsystem has a similar
> structure, a header for the client and a header for the controller.

gpio, regulators, resets to name a few more.

> And do you also prefer an opaque 'priv' member?
> 

'priv' is already opaque, so I presume you're asking if we can make
struct hwspinlock internal to hwspinlock_core.c?

I can see the allure of making hwspinlock::lock internal to the core,
but (luckily) I don't see it to be a matter of just slapping some OOP it
and call it solved. It would have to come with a new model for how we
create the hwspinlock in the first place - as this is currently
allocated as a whole by the provider driver.

I've always found the current model unergonomic, resolving this part
might very well have the side effect that Andy is looking for (and I'd
welcome that).

Regards,
Bjorn

> Happy hacking,
> 
>    Wolfram
> 

