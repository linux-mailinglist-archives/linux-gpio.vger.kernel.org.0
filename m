Return-Path: <linux-gpio+bounces-31793-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCg9BEuUlWk1SgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31793-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 11:28:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AD91556F6
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 11:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5EB7C301C974
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 10:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A072F90C5;
	Wed, 18 Feb 2026 10:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TSAHJ7SF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922C82F549F
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 10:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771410502; cv=none; b=UnFEPKbb4zy3SneKVvmToSZ/xmsQlLjVmI9LzO8Ayr7JDIXjNJMt4+2SCUqwyppHH9qjkzBWBspk0338lqeQtnz+RTjSXShIy0cnAvqm0mlSVmiCEc8N5Ak9j6yypiRZCJv2C/0Y/La9Qa6ArMDHQJwYuVY9P4geKxRgcKyvXZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771410502; c=relaxed/simple;
	bh=j8IuF/E2/hmw/iyuluGgzkvbSOC0JIYRe9E9ozdoEqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DBS/wxYCZNEGvgAtyBO2aOGKRDvhELNOSVjSwkWLtR31PofUot1tP34XFh2SXkiHLjMCAyts0KxvhaBD2+q02J56ByscJo54yV1Ptx5RFupzwCrhYF1YgkL+YuQmALyhNsF3fnavqOaW80cblWgyB6FG9ka1+qsdMDLKs9N9i1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TSAHJ7SF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49AE2C2BC86
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 10:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771410502;
	bh=j8IuF/E2/hmw/iyuluGgzkvbSOC0JIYRe9E9ozdoEqc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TSAHJ7SFjEGyyxYOpIhc5vZ8bSXNJMNQvQdKzpcDbzJ2jjT62EnDv113LjKHt54bA
	 kQVRsKnSzln6/ZBqZTW1iuRflgOkMENh0MPADSiIlIdhiXmmeQj85voYWXRTZbEKGg
	 s0sbyCDhKtfV/lWBHcj1ToeNroIy3tEDLhDNDApY1RPucEzftAGF5JOknsZQjFW8M7
	 TyrehZT002QBW8fHMNSeXkv56xxdHv3sC3HEY2yYCP7LW/01Fgy48GdqPDUgfOy3Nr
	 aKTlk7pl5OcD/jJ5PyPOb5ur5KBc9iDqPidItPdnAGk4Gf2Sff/kfMdfYcSpm4aLFp
	 r1o1m15E+/8rg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-385e7cafef9so41831041fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 02:28:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWOyBlf4776SLwu5i2LQ4xWCr4FMDmLCoDVzYcAN6oYKMVQpAcZsLJUzOjYd+LBin0yB9djXHtBPTju@vger.kernel.org
X-Gm-Message-State: AOJu0YxWtJe15/Wdrutb1VpABcUGVKTsUUR8d2UAoPAdlNSxTMVQj2rT
	6bmgRMcDbWCNPCXtlhnvkFxQwWUNx9o+Qc3VU090aE5i3ZTOowBJP/FEWcZFDGOnrhIdOgkLIF5
	8Hvsm+nDOHqHlVRsEW9fP0qj4fUfF3aGyKfTw9V8FkA==
X-Received: by 2002:a2e:a907:0:b0:383:3e5:2379 with SMTP id
 38308e7fff4ca-387ed8c7bd1mr55220001fa.27.1771410500925; Wed, 18 Feb 2026
 02:28:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213092958.864411-1-tzungbi@kernel.org> <20260213092958.864411-8-tzungbi@kernel.org>
In-Reply-To: <20260213092958.864411-8-tzungbi@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 18 Feb 2026 11:28:08 +0100
X-Gmail-Original-Message-ID: <CAMRc=McGmrA-YWSxfh--32WnYDqV3Dwrdgf8C6kP2kVMoXas5Q@mail.gmail.com>
X-Gm-Features: AaiRm52DQc1ieZMH7Nooiv-lEB2Wcrxxy9vF45IVG6Y4h_W8ecqm7P9WI4sK9dI
Message-ID: <CAMRc=McGmrA-YWSxfh--32WnYDqV3Dwrdgf8C6kP2kVMoXas5Q@mail.gmail.com>
Subject: Re: [PATCH v3 07/11] gpio: Add revocable provider handle for struct gpio_chip
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, chrome-platform@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31793-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 78AD91556F6
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 10:31=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
>
> The underlying chip can be removed asynchronously.  `gdev->srcu` is used
> to ensure the synchronization before accessing `gdev->chip`.
>
> Revocable encapsulates the details.  Add revocable provider handle for
> the corresponding struct gpio_chip in struct gpio_device so that it can
> start to hide the synchronization details.
>
> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> index 3abb90385829..56643f40e87e 100644
> --- a/drivers/gpio/gpiolib.h
> +++ b/drivers/gpio/gpiolib.h
> @@ -52,6 +52,7 @@
>   * @device_notifier: used to notify character device wait queues about t=
he GPIO
>   *                   device being unregistered
>   * @srcu: protects the pointer to the underlying GPIO chip
> + * @chip_rp: revocable provider handle for the corresponding struct gpio=
_chip.
>   * @pin_ranges: range of pins served by the GPIO driver
>   *
>   * This state container holds most of the runtime variable data
> @@ -79,6 +80,7 @@ struct gpio_device {
>         struct workqueue_struct *line_state_wq;
>         struct blocking_notifier_head device_notifier;
>         struct srcu_struct      srcu;
> +       struct revocable        *chip_rp;

I like it much better than with __rcu but see my comment under the
revocable series: is there any reason why we can't do:

struct revocable chip_rp;

?

Bartosz

