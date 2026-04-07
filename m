Return-Path: <linux-gpio+bounces-34778-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LsrGwnk1GlMygcAu9opvQ
	(envelope-from <linux-gpio+bounces-34778-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 13:01:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 094E03AD6CB
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 13:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8984030210C7
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 10:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B135A3AB297;
	Tue,  7 Apr 2026 10:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mYWWf7Qb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716093AB269
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 10:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775559462; cv=none; b=RIAtoso0npFqocPaOEj0TwnRqTihi5z0eLrf1MVL4gqNOLxVd7y6gx45QXeLz+kA9xaIXLlCj7pb+Py4UTCFpLy8PpUnGe9e2ChfdIcLk7EMoT23eTKBcdyNluX/J1RLCPQrCa8Yaal8YWR9TqASjsfiKdG54pakE6QEB8FjLSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775559462; c=relaxed/simple;
	bh=4r1vDbs0pq5LzaslrOkl01oKuos6pzpFCtMes87/kkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tzvqDeajqxQ8bzmS2SkfGq/8FKOrcXn25OuSojAOzwnBIen2xCgTwtP816Xpj8bPFy8VMAX/jH0ag1Xo+3ecPfkXnn5jYRmTOveWzjIZtXSTliO6Ee6/Pl/6d8e3fUKx8Bqes+qk9uZegmeiOiLJM9gC8EcXC7OXLKi85uS2drc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mYWWf7Qb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E714C2BCB3
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 10:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775559462;
	bh=4r1vDbs0pq5LzaslrOkl01oKuos6pzpFCtMes87/kkw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mYWWf7Qby/+Ci0q++KFsbjqGBGSoCxKvCQ2kqJycj6SIEnHNLLwR9r44X0d4CPolK
	 tg3Bfo3kPewMeTpksUKFEVeP6Mdx60XXNYMPnEHKZwOHbvf24rnA6ul1eoIUzbMlVU
	 ZCo6qCqJhpc2PfUP3hPYjnH929wKNz2iPZqbyvPqt8pBOzT0lMi6hJddmw16cwsJfU
	 J9ip6EGwANwwjWw33HDR4T6V/HLd5/lctDR5mnTLrAgq8pqbROkLVUVlgbnl+4rkyg
	 NGjqcxD8eJL87zmmj8WbVfvcad2TwOSwA+tOxnekG11AdspcwOIFn48c4UKl6GjiSC
	 7ujyavdEdgpGQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a2c9c5ff87so5082498e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 03:57:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWVIdGjyyStDz8guUwr6cquvKHyAwr/y7NFyI+qpEBmXxNbHOsS55dlM/IUgIQDFqHTB9xwmFZacJjU@vger.kernel.org
X-Gm-Message-State: AOJu0YzvN1sssP4tRwjjk8tRgGVrNAu7UDIP+aQ6zrji99yYwB/s6nDI
	/VXLqSHUSgdqzJ3/x1p6wAiyW9huAKOwUXlujeXX6pgm5dPT4HV3q6E5EbzZh1+zqiM0HcibVoQ
	lgBBocFUB2dk7VxKJK2pSud2Cq5/iMT7z4Us9tQrDPw==
X-Received: by 2002:ac2:4e0a:0:b0:5a2:a0b0:94a with SMTP id
 2adb3069b0e04-5a33757bf68mr5319679e87.25.1775559460807; Tue, 07 Apr 2026
 03:57:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
 <20260402-baytrail-real-swnode-v2-1-6f5054a4cc07@oss.qualcomm.com>
 <ac5wprh9vfTU5pGa@ashevche-desk.local> <ac7UqTsPC8yUooAR@google.com>
 <CAMRc=Mcq-T=4fnGTWXzEBjfiPaZLGw4HVAuOm48v-5Uf++K5xg@mail.gmail.com> <ac_9EV3C0I1WXQz2@google.com>
In-Reply-To: <ac_9EV3C0I1WXQz2@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 7 Apr 2026 12:57:29 +0200
X-Gmail-Original-Message-ID: <CAMRc=MeRSKWoEn36hht4JuwrwOMpoA5g_Xju2XT9Urq3mQS2wg@mail.gmail.com>
X-Gm-Features: AQROBzBAE1qyZXcNp6W0M7clxAQQsS9tQ0MKkJzF0Q5g3_M3cSllREtCbrsIUy0
Message-ID: <CAMRc=MeRSKWoEn36hht4JuwrwOMpoA5g_Xju2XT9Urq3mQS2wg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] software node: return -ENXIO when referenced
 swnode is not registered yet
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34778-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,oss.qualcomm.com,gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 094E03AD6CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 3, 2026 at 8:07=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Fri, Apr 03, 2026 at 09:29:38AM +0200, Bartosz Golaszewski wrote:
> > On Thu, Apr 2, 2026 at 10:43=E2=80=AFPM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > On Thu, Apr 02, 2026 at 04:35:34PM +0300, Andy Shevchenko wrote:
> > > > On Thu, Apr 02, 2026 at 02:54:26PM +0200, Bartosz Golaszewski wrote=
:
> > > > > It's possible that at the time of resolving a reference to a remo=
te
> > > > > software node, the node we know exists is not yet registered as a=
 full
> > > > > firmware node. We currently return -ENOENT in this case but the s=
ame
> > > > > error code is also returned in some other cases, like the referen=
ce
> > > > > property with given name not existing in the property list of the=
 local
> > > > > software node.
> > > > >
> > > > > It makes sense to let users know that we're dealing with an unreg=
istered
> > > > > software node so that they can defer probe - the situation is som=
ewhat
> > > > > similar to there existing a firmware node to which no device is b=
ound
> > > > > yet - which is valid grounds for probe deferral. To that end: use=
 -ENXIO
> > > > > which stands for "No such device or address".
> > > >
> > > > This error code is also too generic to my taste. What about alterna=
tive(s)?
> > > > EADDRNOTAVAIL
> > > > ENOTCONN
> > > >
> > > > (The brief grep shows that the second one might suit slightly bette=
r than the
> > > >  first one by existing use cases.)
> > >
> > > We are in the core of the driver core. Why not simply use -EPROBE_DEF=
ER
> > > to which all users will resolve this error to and call it a day?
> > >
> >
> > Because -EPROBE_DEFER only makes sense in probe() context, while
> > fwnode_get_reference_args() may be called in many other situations.
>
> Exactly same argument applies to your follow-up change: gpiod_get()
> returning -EPROBE_DEFER only makes sense in probe context but it may be
> called in many other situations. Are you planning to change all places
> where gpiolib returns -EPROBE_DEFER to something else just in case it
> might be called outside of probe context?
>

I'd argue that gpiod_get() should really be limited to being called at
probe() time but I see your point.

> -EPROBE_DEFER should have been called -ENOTREADY from the beginning and
> then we would not have this argument. Or, even better, we should have
> used -EAGAIN. But it is just a name, semantics does not really change.
> We want to signal that something is not ready and the operation needs be
> repeated. Currently we contorting ourselves by using yet another error
> code that everyone will either convert to -EPORBE_DEFER or will handle
> like -EAGAIN.
>
> > I think ENOTCONN as "not connected" makes sense, though the string
>
> Why is it better? Most of users of -ENOTCONN are in networking code so
> it is somewhat unexpected to have other APIs return it.
>
> > representation says: "Transport endpoint is not connected" which
> > doesn't spell out quite the same thing.
>
> Yes, because it is really for networking/sockets handling.
>
> Thanks.
>

Andy et al: what is your take on this?

Bart

