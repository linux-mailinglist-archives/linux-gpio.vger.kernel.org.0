Return-Path: <linux-gpio+bounces-34034-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PThLfVfwWmaSgQAu9opvQ
	(envelope-from <linux-gpio+bounces-34034-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 16:44:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FE92F6D35
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 16:44:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 12C7E30FFEEA
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 15:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935523BF66F;
	Mon, 23 Mar 2026 15:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EtZuqN9a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56465282F17
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 15:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279430; cv=none; b=avehhnBBeHsvblN2ajI80JPzVSQp5bC9qXKQC+sn7abc8WJCnhOHOhzSHIF40E85CVzcF4qUGSbz/HSfJ6ybg6anyRfjvOCLMM4fTRe946cWNRIHYBxawwJTsrsS7QtPlXINNAnOUqJA3LSvUa5gvjR/LOXakk4z/UBWBvxozcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279430; c=relaxed/simple;
	bh=v1fDbmrhGB/KQRvZCzdGtCJo9z7E0IsvXMUDNGcbEuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tv1btGpcLTQm9X3V6GeQgjoOPfKkuFjT4nA8qXs1ywON0OxkvKGIoJQvc/W7zM7NBNF9FbPFQ/YJNXVfwkOAwupP90eOkyO628ZWCryrSK2etHJ0Q5zC6mMP/blJiD07aDQ4rTEhZ05lBd1prv4PK/QkxQ3w580UlwDsJPrKNW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EtZuqN9a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E37C2BCB6
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 15:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774279430;
	bh=v1fDbmrhGB/KQRvZCzdGtCJo9z7E0IsvXMUDNGcbEuI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EtZuqN9a7DTCB32dXZU79UXuE9BlMEzrI+Akiq3IS3QZY1IpLsqWrZdZERK2uqKxS
	 QEaAYPb7FKNgdV79q554tNxx40SKQVIgNOlCOQagN77FCOXLPd7yYUDIPE54G6JEU8
	 fxG0fvot461bCIBkIr+p2kvvArL6yh+mJ6EryaywjHzAYeAojkIJ0UdxKPVukhieJx
	 14X1ILlSnBgUObuFbFGvt32gYeD2RyGVN1oxcyNgq5hWwhOiBWzmGJubGrfMJyIRzW
	 YRLVypY4pZrSNTnHDYdpL0wJRMHmbtJBJjVyTSHJ2sapEWyiN/FnJIUB1J6V5MFW55
	 H6GkQlDyCswMw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a0faa0d15cso4167667e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 08:23:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJ9uH6hG2QAUA4KCBRLNGcwgg7Ev9XjmOQAa9OLG037VWAO//UgGL+IEdKA155pBWf63HbpQAP6UWH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5OlLhOUzRHMFOhg/u3bFpVBWwmvIiTAziMaR7F9l7cy+hAXYq
	lcXXkRkHb8RvsG/Au+7YWbKO2+aYjAkCuXq23oQbksm4F2+gMN+NJB2Q/0MdFpwc6WaExjwUYob
	d8wHMd4INHGOwLLecKfPLRV9SW7Lkp2Q/t/4kin/HqA==
X-Received: by 2002:a05:6512:3da2:b0:5a2:7c67:4b3 with SMTP id
 2adb3069b0e04-5a285af54b9mr4230973e87.2.1774279428666; Mon, 23 Mar 2026
 08:23:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319-baytrail-real-swnode-v1-0-75f2264ae49f@oss.qualcomm.com>
 <20260319-baytrail-real-swnode-v1-1-75f2264ae49f@oss.qualcomm.com> <abz4-iKFBsPIJb7F@ashevche-desk.local>
In-Reply-To: <abz4-iKFBsPIJb7F@ashevche-desk.local>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 23 Mar 2026 16:23:36 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mee6Jdku8n0xSPJkjJGZefzs9OJscnA8Tpn41G9hXKg5A@mail.gmail.com>
X-Gm-Features: AaiRm51K9AlGK_wY7XjZ-ErYfJVKWSHbGMymY34rMutrWSHNVzmMpb2pSbPy_9c
Message-ID: <CAMRc=Mee6Jdku8n0xSPJkjJGZefzs9OJscnA8Tpn41G9hXKg5A@mail.gmail.com>
Subject: Re: [PATCH 1/4] software node: support automatic secondary fwnode assignment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,linux.intel.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34034-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_TWELVE(0.00)[19];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 34FE92F6D35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 8:39=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Mar 19, 2026 at 05:10:54PM +0100, Bartosz Golaszewski wrote:
> > Provide a structure and a set of functions allowing to set up automatic
> > secondary firmware node assignment for platform devices. It uses
> > a behind-the-scenes bus notifier for a group of named software nodes. I=
t
> > will wait for bus events and when a device is added, it will check its
> > name against the software node's name and - on match - assign the
> > software node as the secondary firmware node of the device's *real*
> > firmware node.
>
> ...
>
> > +/**
> > + * software_node_register_auto_secondary() - set up automatic assignme=
nt of
> > + *                                           secondary firmware nodes
> > + * @auto_sec: Context data to use.
> > + *
> > + * NOTE: All software nodes passed in @auto_sec must be named.
>
> > + * Returns:
>
> Is it with 's' in other kernel-doc? The official is "Return", the 's' var=
iant
> is supported, but not documented.
>
> > + * 0 on success, negative error number on failure.
>
> The Return section must be last in the kernel-doc description. This is do=
cumented.
>
> > + * This registers the software node group passed in @auto_sec and sets=
 up
> > + * automatic assignment of them as secondary firmware nodes of real no=
des
> > + * attached to appropriate devices on the bus specified in @auto_sec. =
The
> > + * software nodes must be named and their names must be the same as th=
e
> > + * devices they should reference. The assignment happens when the devi=
ce is
> > + * first added to the bus.
> > + */
>
> ...
>
> > +/**
> > + * struct software_node_auto_secondary - context data for automatic se=
condary
> > + *                                       fwnode assignment
> > + * @nb: Private bus notifier data - don't use
>
> Mark it with __private then.

Ok for this and the ones above.

>
> > + * @node_group: NULL-terminated array of software node addresses
> > + * @bus: Bus on which to wait for devices
>
> If bus is not compiled into kernel, this optionally has to support NULL
> in the code (I haven't checked the code, though).
>

The bus type object for given bus is typically defined in whatever
compilation unit contains the implementation of that bus. It's not
possible to access its address if it's not enabled.

Bart

