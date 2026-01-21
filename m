Return-Path: <linux-gpio+bounces-30836-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBTvA0tTcGlvXQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30836-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 05:17:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E605650E97
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 05:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 59C6B465897
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 04:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA6B31A7F3;
	Wed, 21 Jan 2026 04:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NpiQrLkq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A3F2EC08C;
	Wed, 21 Jan 2026 04:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768969025; cv=none; b=NyZalhmjnqP5UGauZVBQQVcp5ue1W/MgEbRuR+CPRlIV4HHF2QUIfENGTNcDBgOWcWowXdQBWPS4iFbJXdLF/th81xatjL0EiqJECPOrPg7samHje+XbkJneyO5ajlO5FnXETn2LjyPA1eQ8A6xkbEyQELyGnqks3G6llemq4KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768969025; c=relaxed/simple;
	bh=Vl8thQo27leGKYP+VBuDV4QcUH1ab8Zm+QHojEY2LTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mBeaneZzESZManiQIq9TmQLS+Bx3A9SHWp8c/Du3pgpCP62yNEvjH+/VaOEr4zCuSw/3fPVznjLKk6U35II62PPV32b5HREQZQvCWMQNzsSBx1WY7OqizUdMMJkPQKVV1xXIFk2uZ4iC0Ntkxo3QsqAUaGXyQsqlABZ0zVPo3ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NpiQrLkq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D85C116D0;
	Wed, 21 Jan 2026 04:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768969024;
	bh=Vl8thQo27leGKYP+VBuDV4QcUH1ab8Zm+QHojEY2LTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NpiQrLkqRJHXDW+JXPvNr7gw7F2ux/zr6uGSneIY4EGQMUd6kKBsNpUyo0GdLzTHa
	 P3YoAYs5kvjZJBKnWgmGn3FDrCQht4uV/2mu8vzDQ1oHHykU74IppL1JNKa2ozpVXf
	 QBcDFS2fUmnDwzo6jBkXQKlFG9DnaEhntgHGFpeAvYuG3v6CjWyZvtgJ9z2SdeT9RZ
	 TCuf/5uvkSaOOPld0hpxFVF3gHFlLzakawq3BeQSGhNarXWheOGjEpDT6ykJkC5r1I
	 xqIRP2NxIUkjwoY0bHPO/cYVhT+g8AmyWXp2GZuaKH4pEEgqp4TfeIVLjoKVyfsLYq
	 OGL+vs/YFN28Q==
Date: Wed, 21 Jan 2026 04:17:00 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 00/23] gpiolib: Adopt revocable mechanism for UAF
 prevention
Message-ID: <aXBTPG9rUHMgbHYp@google.com>
References: <20260116081036.352286-1-tzungbi@kernel.org>
 <CAMRc=MdOCvEb81k0whM9dGCE8Hp=tdxZTUuiFeiL3+WsEei9EQ@mail.gmail.com>
 <aWuFBqIfJpDL9g-J@tzungbi-laptop>
 <CAMRc=McrFa42mNWmZtD1HKKKZ+USUKpQAAME50wbfxPM7L72gA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McrFa42mNWmZtD1HKKKZ+USUKpQAAME50wbfxPM7L72gA@mail.gmail.com>
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30836-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,libgpiod.readthedocs.io:url]
X-Rspamd-Queue-Id: E605650E97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jan 19, 2026 at 09:33:21AM +0100, Bartosz Golaszewski wrote:
> On Sat, Jan 17, 2026 at 1:48 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > On Fri, Jan 16, 2026 at 11:35:00AM +0100, Bartosz Golaszewski wrote:
> > > On Fri, Jan 16, 2026 at 9:11 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> > > >
> > > > This series transitions the UAF prevention logic within the GPIO core
> > > > (gpiolib) to use the 'revocable' mechanism.
> > > >
> > > > The existing code aims to prevent UAF issues when the underlying GPIO
> > > > chip is removed.  This series replaces that custom logic with the
> > > > generic 'revocable' API, which is designed to handle such lifecycle
> > > > dependencies.  There should be no change in behavior.
> > > >
> > > > This series depends on the 'revocable' API, introduced in [1].  Some
> > > > build bots may report errors due to undefined symbols related to
> > > > 'revocable' until the dependency is merged.
> > > >
> > >
> > > Hi Tzung-Bi!
> > >
> > > Thank you for doing this and considering my suggestions from LPC. I
> > > haven't looked at the code yet but I quickly tested the series with my
> > > regular test-suites. The good news is: nothing is broken, every test
> > > works fine. The bad news is: there seems to be a significant impact on
> > > performance. With the user-space test-suite from libgpiod (for core C
> > > library - gpiod-test) I'm seeing a consistent 40% impact on
> > > performance. That's not really acceptable. :( I will try to bisect the
> > > series later and see which part exactly breaks it.
> > >
> > > I can also help you with user-space testing with libgpiod, if you need
> > > it? Some documentation is available here:
> > > https://libgpiod.readthedocs.io/en/latest/testing.html
> >
> > How to get the performance data?
> >
> > I tried on libgpiod-2.2.2.tar.xz:
> > - ./configure --enable-tools --enable-tests
> > - make
> > - ./tests/gpiod-test
> >
> > There is only TAP output.  Also I don't see the difference between:
> > `./tests/gpiod-test` vs. `./tests/gpiod-test -m perf`.
> 
> Yeah, no, there's no dedicated performance measurement in GLib tests,
> I just timed the test-suite and it runs 40% slower with this series.

I think this is mostly introduced by a redundant synchronize_srcu() call in
revocable_provider_alloc().  Proposed a fix in
https://lore.kernel.org/all/20260121040204.2699886-1-tzungbi@kernel.org/.

The replacement still brings a few overhead (e.g., for allocating some in
the .open() file operations).  Especially the test approach can accumulate
them.

