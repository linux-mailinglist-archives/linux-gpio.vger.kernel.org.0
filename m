Return-Path: <linux-gpio+bounces-30842-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Ef4NqmwcGmKZAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30842-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 11:55:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F95255933
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 11:55:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8FA3A94283F
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 10:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED81948094E;
	Wed, 21 Jan 2026 10:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uuCWDPzK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D36480358
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 10:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768992134; cv=none; b=gVxXUsM93G3UKIXLP+DUzf316xOOG7zd5hO4OLLKruW7ZcubLgF/DQwG3Wvh74TrA2Y7S3FZTBYh81StnOE02Qo7vPJ5FTndSEJCTQgbcxDuB8Hv4YRRG+AP22c9jZTYc+Zwbb06V15w2rLl7KFEfFQ2KA7u6ZRRcb/7F0TPplc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768992134; c=relaxed/simple;
	bh=R21oflyt7SrGqIaCohBGqYGY1hSCnp/1MlBXab+sm7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L59+3Zb9QASv7axHrIs5zkllMjuPZG/+1axFqPfTXPrnGmqzMANFyGmRZx26HMh0jwyY8XbMfxCvcS3p+UriND+Sda1xDF8caNy/cj8tXWcqly6ZvQIaZ8o8+W0U4M+VW2wWSzpHtZM2oUK6T64Vw4wwk0QiBmLE76quFjApD+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uuCWDPzK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756A5C2BCB3
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 10:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768992134;
	bh=R21oflyt7SrGqIaCohBGqYGY1hSCnp/1MlBXab+sm7k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uuCWDPzKoVZZXKxa6bPgjmxODXrRoGoTMwAHaeFS5xCYfS7W94ziXycYAkvQxJIed
	 xi7iXbpER2Ppeil+4pGZf/Gw7wJAyWZVKQcfwlTsTo4OTM8/HL48VY3cFuTDAl/qls
	 B29+xNFEplPYwPldths9i3RppCwheWuWuDY4Xxhm8mM9/tZCyi9B0bM3VLVPHkrUfn
	 DOTJSSAmCTxEJpBwohJE/9YxbPtIEGAm+1OhfmwwaiPiQ+tS2BwDRa1jeXv4aeneNA
	 lEF/VG/DfkebuMKfh043gRFiWh5CiHPF08ovRPjuUbZcqAIgIwhAYHNZw2EHuntFry
	 9PQxXxfuud5ig==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-383153e06d6so52831561fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 02:42:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXeZMUN4yUX06dk/Xy0wP9R2guJMco8qux2X9aUWo7//D1Z9BHeihy6dY4/lqNE6MvPx5E9qO9dIrTv@vger.kernel.org
X-Gm-Message-State: AOJu0YzV3wl+NHZL7U7CmjnhxHYsY5OkUEwPxw1+wJABdhyAFxtEowr/
	v4f1+i16kUd4A5+E6/jFmdkDdziI9p98gyBww77UE8QfsIdCgPWqcSwGwhi0Jblu36x46A6U28Q
	lCiafveolxLyuVo2H7ih0hEKqT+/XMlWg3pec7MTBPQ==
X-Received: by 2002:a2e:bc0f:0:b0:383:2537:f13b with SMTP id
 38308e7fff4ca-385a546efc7mr18343981fa.27.1768992132870; Wed, 21 Jan 2026
 02:42:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116081036.352286-1-tzungbi@kernel.org> <CAMRc=MdOCvEb81k0whM9dGCE8Hp=tdxZTUuiFeiL3+WsEei9EQ@mail.gmail.com>
 <aWuFBqIfJpDL9g-J@tzungbi-laptop> <CAMRc=McrFa42mNWmZtD1HKKKZ+USUKpQAAME50wbfxPM7L72gA@mail.gmail.com>
 <aXBTPG9rUHMgbHYp@google.com>
In-Reply-To: <aXBTPG9rUHMgbHYp@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 21 Jan 2026 11:42:00 +0100
X-Gmail-Original-Message-ID: <CAMRc=MejWmGb02akR6TZVPzM4rnZ041TRkJG94=JDYdA5z=xVg@mail.gmail.com>
X-Gm-Features: AZwV_QixHT71jBAW6CYhhCzIJ7SgSnL_P7SnAvqNGHxkd0_5haa6k71I4bYVShY
Message-ID: <CAMRc=MejWmGb02akR6TZVPzM4rnZ041TRkJG94=JDYdA5z=xVg@mail.gmail.com>
Subject: Re: [PATCH 00/23] gpiolib: Adopt revocable mechanism for UAF prevention
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Dan Williams <dan.j.williams@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-30842-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,libgpiod.readthedocs.io:url,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7F95255933
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 5:17=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Mon, Jan 19, 2026 at 09:33:21AM +0100, Bartosz Golaszewski wrote:
> > On Sat, Jan 17, 2026 at 1:48=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.o=
rg> wrote:
> > >
> > > On Fri, Jan 16, 2026 at 11:35:00AM +0100, Bartosz Golaszewski wrote:
> > > > On Fri, Jan 16, 2026 at 9:11=E2=80=AFAM Tzung-Bi Shih <tzungbi@kern=
el.org> wrote:
> > > > >
> > > > > This series transitions the UAF prevention logic within the GPIO =
core
> > > > > (gpiolib) to use the 'revocable' mechanism.
> > > > >
> > > > > The existing code aims to prevent UAF issues when the underlying =
GPIO
> > > > > chip is removed.  This series replaces that custom logic with the
> > > > > generic 'revocable' API, which is designed to handle such lifecyc=
le
> > > > > dependencies.  There should be no change in behavior.
> > > > >
> > > > > This series depends on the 'revocable' API, introduced in [1].  S=
ome
> > > > > build bots may report errors due to undefined symbols related to
> > > > > 'revocable' until the dependency is merged.
> > > > >
> > > >
> > > > Hi Tzung-Bi!
> > > >
> > > > Thank you for doing this and considering my suggestions from LPC. I
> > > > haven't looked at the code yet but I quickly tested the series with=
 my
> > > > regular test-suites. The good news is: nothing is broken, every tes=
t
> > > > works fine. The bad news is: there seems to be a significant impact=
 on
> > > > performance. With the user-space test-suite from libgpiod (for core=
 C
> > > > library - gpiod-test) I'm seeing a consistent 40% impact on
> > > > performance. That's not really acceptable. :( I will try to bisect =
the
> > > > series later and see which part exactly breaks it.
> > > >
> > > > I can also help you with user-space testing with libgpiod, if you n=
eed
> > > > it? Some documentation is available here:
> > > > https://libgpiod.readthedocs.io/en/latest/testing.html
> > >
> > > How to get the performance data?
> > >
> > > I tried on libgpiod-2.2.2.tar.xz:
> > > - ./configure --enable-tools --enable-tests
> > > - make
> > > - ./tests/gpiod-test
> > >
> > > There is only TAP output.  Also I don't see the difference between:
> > > `./tests/gpiod-test` vs. `./tests/gpiod-test -m perf`.
> >
> > Yeah, no, there's no dedicated performance measurement in GLib tests,
> > I just timed the test-suite and it runs 40% slower with this series.
>
> I think this is mostly introduced by a redundant synchronize_srcu() call =
in
> revocable_provider_alloc().  Proposed a fix in
> https://lore.kernel.org/all/20260121040204.2699886-1-tzungbi@kernel.org/.
>
> The replacement still brings a few overhead (e.g., for allocating some in
> the .open() file operations).  Especially the test approach can accumulat=
e
> them.

People do care about open()/close() performance, please see the
following discussion:
https://lore.kernel.org/all/20250311110034.53959031@erd003.prtnl/

It required us to use raw notifiers instead of atomic ones which call
rcu_synchronize() to fix the performance regression.

Bartosz

