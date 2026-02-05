Return-Path: <linux-gpio+bounces-31478-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHQdEUvNhGk45QMAu9opvQ
	(envelope-from <linux-gpio+bounces-31478-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 18:03:07 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F436F59E9
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 18:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EEF23029AC3
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Feb 2026 16:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2394943C050;
	Thu,  5 Feb 2026 16:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WBA20aEa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA29443C04F
	for <linux-gpio@vger.kernel.org>; Thu,  5 Feb 2026 16:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770310650; cv=none; b=RnL/yZI6CxiKnOn9sjejE2x3cfVCVrmndHqctyEnx44Sv4NdYFpM5FP2YZHRv8sWidEFn2ehzkjjbRYjaDL37+FvDTGCPUXufTe+yOvYUotJBYTuhfWBG/O7qlAXISKdRz5bdieNbnL9rKDyaGb8kgc7VYsB7E/jXZBQIet2QkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770310650; c=relaxed/simple;
	bh=Zw5WIY3J5ENJJDDygHQNWlZe7u7h9TLoc6XRCjylqHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sy5d6wksEY10OdY4ej+zYlSyZ+t2T0lvossc3KW1S8AvYc4REoYGmLzjtF0mtJYfFTKE5ro2dMUBxoq8DB2FN17skxXojZHZ08znF/QZibAeGcj1t9o9y3AJ1LwwA70VV5jsyZljP9fj7Svv4Mm4u3ZEuPSOPWHqyjoP3QdwuSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WBA20aEa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 812BBC2BCB0
	for <linux-gpio@vger.kernel.org>; Thu,  5 Feb 2026 16:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770310650;
	bh=Zw5WIY3J5ENJJDDygHQNWlZe7u7h9TLoc6XRCjylqHc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WBA20aEa7pPguk0UVf9KGsqoRzjmR6nXN8bdYdjWaPfEOk6DWNSUY6eO2nWg+u501
	 zUopUjgvz4BAxevHMdkts1gyaFPm5QGa9UsNESEUoAHfvFqQxp2R79iMNAxEFf4/fi
	 zrWUEYo91KnkwBnwzjT7sSY4hwiILbzCG7CcaJi0XtlOIz+rMBTcxRwODrkjlNCcLH
	 O3njqK294Bjex+5Lff8qkn/oGTF68bci+HwF46chFWuav+R9/frDKsNbDniRrbaEeO
	 RPHI8Ap08vlYQc/mvz+HCb10G6jCS7qYTZT7CoddKds5huWcT84D8lgPAhf5ziprlO
	 Ofp7G3jD01UMQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59dd3e979ceso1376324e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Feb 2026 08:57:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXIRUR+tLo4ve0rJYKX1zeSeJW0yqtrz/c1h8jvFGc0CgynjfW43Xp8dPnHqiMXLsMIU8U13lxMMsOh@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt8m7x/CWRc7rzyRQ/idRtLaHOtuQ04rFefw1DDtmOMaRwq5QR
	trwrH5Q8pguT3xtuXupwX4cD7JOR2kfLWsFyKdoP8RfAdQBgOLNv7ZCa5deuHolb+nJ/uCutI/r
	XPzLeKphRE7hQJjWckIrFlzANkT3uQy99G4g/43FqjA==
X-Received: by 2002:a05:6512:2242:b0:59d:fac0:3a14 with SMTP id
 2adb3069b0e04-59e38c2cac2mr2718297e87.28.1770310649101; Thu, 05 Feb 2026
 08:57:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203061059.975605-1-tzungbi@kernel.org> <20260203061059.975605-8-tzungbi@kernel.org>
 <CAMRc=MdYeoMxNFYeX_9S-M286aUjnsxLyy9_apmfPR4NeqVouw@mail.gmail.com> <aYRaNu-ZistKBPN-@google.com>
In-Reply-To: <aYRaNu-ZistKBPN-@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 5 Feb 2026 17:57:15 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeyfAMVOMVtC3zobv5XXGtthJxYGsTogNzRK3uhKo1TvQ@mail.gmail.com>
X-Gm-Features: AZwV_QhVt9fFlCIRZ6WCsWdzbxJzZZDt-WgXxzp0b0Kvg4TAPPrm4BYVxBO1jUo
Message-ID: <CAMRc=MeyfAMVOMVtC3zobv5XXGtthJxYGsTogNzRK3uhKo1TvQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] gpio: Add revocable provider handle for struct gpio_chip
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, chrome-platform@lists.linux.dev, 
	Dan Williams <dan.j.williams@intel.com>, linux-gpio@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31478-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9F436F59E9
X-Rspamd-Action: no action

On Thu, Feb 5, 2026 at 9:52=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> w=
rote:
>
> On Wed, Feb 04, 2026 at 07:58:44AM -0500, Bartosz Golaszewski wrote:
> > On Tue, 3 Feb 2026 07:10:54 +0100, Tzung-Bi Shih <tzungbi@kernel.org> s=
aid:
> > > diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> > > index 3abb90385829..cd136d5b52e9 100644
> > > --- a/drivers/gpio/gpiolib.h
> > > +++ b/drivers/gpio/gpiolib.h
> > > @@ -52,6 +52,7 @@
> > >   * @device_notifier: used to notify character device wait queues abo=
ut the GPIO
> > >   *                   device being unregistered
> > >   * @srcu: protects the pointer to the underlying GPIO chip
> > > + * @chip_rp: revocable provider handle for the corresponding struct =
gpio_chip.
> > >   * @pin_ranges: range of pins served by the GPIO driver
> > >   *
> > >   * This state container holds most of the runtime variable data
> > > @@ -79,6 +80,7 @@ struct gpio_device {
> > >     struct workqueue_struct *line_state_wq;
> > >     struct blocking_notifier_head device_notifier;
> > >     struct srcu_struct      srcu;
> > > +   struct revocable_provider __rcu *chip_rp;
> > >
> >
> > Why __rcu? This doesn't live in a different address space, only the int=
ernal
> > resource it protects does. If anything - this could be __attribute__((n=
oderef))
> > but even that is questionable as this is an opaque structure.
>
> For fixing a race on the pointer itself.  See also [1].
>
> [1] https://lore.kernel.org/all/20260129143733.45618-2-tzungbi@kernel.org

So we're just using a double RCU here? One to protect the resource and
another to protect the protector of the resource? I can't say I'm a
fan of this. I really want to like this interface but is there really
no way to hide the implementation details from the caller? Isn't this
the whole point? As it is: the user still has to care about an
RCU-protected pointer.

Bartosz

