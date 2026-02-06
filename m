Return-Path: <linux-gpio+bounces-31485-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDV9J6ixhWkRFAQAu9opvQ
	(envelope-from <linux-gpio+bounces-31485-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 10:17:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C435FBEAF
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 10:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDF533059F2C
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Feb 2026 09:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044133587A1;
	Fri,  6 Feb 2026 09:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BktlHtDv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2483570A0;
	Fri,  6 Feb 2026 09:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770369220; cv=none; b=DhXZ+jklxsHzOlbRQ3nNIKlHeGr++Dyf3f8yL9SYa+50Tfm3xbAPtpCRA2w+i5Eh6B5a9MuVDcci5EqNveZebJGS4HL3enVSIXS+tqjZQos/UIfLoCuyVTenYDMi8iOL+LGj5tnq20uYja3KsHSVsCd9+bIjv3Zs/rg1Tv0fjAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770369220; c=relaxed/simple;
	bh=Ad+gFIapLDGeK2QdxKtz+WJu1GmvHE2AyaoW+Qo7jNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EZXwQBlJlp+jPN7zvlIOs1CKgSTJMijaynSyBtxmPkMBD179qYq8+WK6Eu+D8fduBXgr7tRCjfIqRZ0VHqH0cBHOKckBWmh9WAmgy6yiiOB20Q8oG7pjqMP2PVfJ/uLNugzrrQBMhatTweHUeCW2tjADD7eg8MewFYc8qC+DbQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BktlHtDv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022A5C116C6;
	Fri,  6 Feb 2026 09:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770369220;
	bh=Ad+gFIapLDGeK2QdxKtz+WJu1GmvHE2AyaoW+Qo7jNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BktlHtDvn1B+0UQ3KDROvzT0wYm01I6ZTOs3ug11EsugNIok9sxjKpyofrR07qBMe
	 YmPmIt5f/YGhrFvmpub9Vr3m3vaIfnb2MTFYydRbJcLfmQmobWSrcuzrCVyYR3VbLX
	 CehCcrIRsNJX1EgA3lDhaTKbxBQuiQxRoqg1PXFHbIzf6eYk14Effovqfskcf0n7QZ
	 8cNM5xDnZaigtaqV1xtDY+7Nlyy/Mtt3QGICPb819/vZUFWDtsQS9KUN8IagNSf3kg
	 9mvbmMLL+7O50RP/T5aemAajii8T3mTESNNFdo7FWORv0bpl6eYLLLAEpstgU7jP4z
	 sUGb7pzKqqoNw==
Date: Fri, 6 Feb 2026 09:13:35 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Johan Hovold <johan@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Dan Williams <dan.j.williams@intel.com>, linux-gpio@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v2 07/11] gpio: Add revocable provider handle for struct
 gpio_chip
Message-ID: <aYWwv2Ip_dvS7E9w@google.com>
References: <20260203061059.975605-1-tzungbi@kernel.org>
 <20260203061059.975605-8-tzungbi@kernel.org>
 <CAMRc=MdYeoMxNFYeX_9S-M286aUjnsxLyy9_apmfPR4NeqVouw@mail.gmail.com>
 <aYRaNu-ZistKBPN-@google.com>
 <CAMRc=MeyfAMVOMVtC3zobv5XXGtthJxYGsTogNzRK3uhKo1TvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeyfAMVOMVtC3zobv5XXGtthJxYGsTogNzRK3uhKo1TvQ@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31485-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0C435FBEAF
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 05:57:15PM +0100, Bartosz Golaszewski wrote:
> On Thu, Feb 5, 2026 at 9:52 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > On Wed, Feb 04, 2026 at 07:58:44AM -0500, Bartosz Golaszewski wrote:
> > > On Tue, 3 Feb 2026 07:10:54 +0100, Tzung-Bi Shih <tzungbi@kernel.org> said:
> > > > diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> > > > index 3abb90385829..cd136d5b52e9 100644
> > > > --- a/drivers/gpio/gpiolib.h
> > > > +++ b/drivers/gpio/gpiolib.h
> > > > @@ -52,6 +52,7 @@
> > > >   * @device_notifier: used to notify character device wait queues about the GPIO
> > > >   *                   device being unregistered
> > > >   * @srcu: protects the pointer to the underlying GPIO chip
> > > > + * @chip_rp: revocable provider handle for the corresponding struct gpio_chip.
> > > >   * @pin_ranges: range of pins served by the GPIO driver
> > > >   *
> > > >   * This state container holds most of the runtime variable data
> > > > @@ -79,6 +80,7 @@ struct gpio_device {
> > > >     struct workqueue_struct *line_state_wq;
> > > >     struct blocking_notifier_head device_notifier;
> > > >     struct srcu_struct      srcu;
> > > > +   struct revocable_provider __rcu *chip_rp;
> > > >
> > >
> > > Why __rcu? This doesn't live in a different address space, only the internal
> > > resource it protects does. If anything - this could be __attribute__((noderef))
> > > but even that is questionable as this is an opaque structure.
> >
> > For fixing a race on the pointer itself.  See also [1].
> >
> > [1] https://lore.kernel.org/all/20260129143733.45618-2-tzungbi@kernel.org
> 
> So we're just using a double RCU here? One to protect the resource and
> another to protect the protector of the resource? I can't say I'm a
> fan of this. I really want to like this interface but is there really
> no way to hide the implementation details from the caller? Isn't this
> the whole point? As it is: the user still has to care about an
> RCU-protected pointer.

Will think about it but I have no better idea for now.

Ideally, I think the user doesn't need to interact with the RCU (even if it's
annotated with __rcu) but revocable APIs should handle it correctly.

