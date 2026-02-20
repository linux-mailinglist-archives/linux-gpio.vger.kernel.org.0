Return-Path: <linux-gpio+bounces-31932-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ONYHpkRmGmL/gIAu9opvQ
	(envelope-from <linux-gpio+bounces-31932-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 08:47:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DADAB1655F8
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 08:47:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8439F30160C7
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 07:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0106302742;
	Fri, 20 Feb 2026 07:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPFpq6l3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638102EFDA4
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 07:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771573632; cv=none; b=iIwovx1Da7WyQUje+YHScOe67WW9GCVIQ8EVSwX9DI4jk1q+vfBgn7cjJjGThArZiZHJ6xuyVQz6UpUEQ0vaxZWB6Ov5K1nF7JcUQf7u4wfOzzgdMnN1zNwU7yzepd/Eaz7TJWhK1DdIAR9yBuwnKe60U8xtzOrRQ0rPE4e57Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771573632; c=relaxed/simple;
	bh=sdebDhDZnywd2uWMuS4f752/48HseCqlPT5fN8H53pk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=svXi2pPL4MAeaqKQ/H6wpGnjkAEEm7HknJ1rvoLek8GVmAWcIAyXBq8g2pM2uRweRyIsIe9qsUC6gepQ7MFMyhHnybqbG5DX68HzdYRILut3y+PKWvI0poxxJC8L0k8bOQvqRWGd99Qqb+zl9cPtyLfA+CzHbIUMq4/U05IA/0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPFpq6l3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF24C116D0
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 07:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771573632;
	bh=sdebDhDZnywd2uWMuS4f752/48HseCqlPT5fN8H53pk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KPFpq6l3FvkmOHmkB7hPif3s6YIvlBzfnichVkKETS3LnjCjdIZpTE7o7rShD+0/6
	 8cblYMy52xFnJGxiM+RJcG+3iR+1v9moPNCSFIrW86YvMWp2ef7eD21mBrxlptl3GS
	 U3QqGplD2300kxOlrKTCH3oA5V4XRKInVfL2BRHmy+CclfJ2vjFGi3/AWf+wjyCiou
	 TvW5m3+gTyb8SomWyZcpmq+wRNP4GgJTMnLUWutdorpxQgkOXMkDecKM5YpgKA+/6K
	 NKpjxAFVzFM1iAyIPO2I8O7ktGSKS97s0kBeTVCk1lQ9OvFyR+ZFy78SwQ8sBzLcN4
	 bT7yvc7+Lc/xg==
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-649b1ca87ddso1501786d50.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 23:47:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU2PaF7YVa7ZOdb+gXZQxodO8jR0tgKM9Enq0hBzKlIqlxt1IsICA7W2hh+Y1gxT+R4//DoU3DE00Ue@vger.kernel.org
X-Gm-Message-State: AOJu0YyR0ie+DqvSD7QLaDAY+FwwUj41n1SltUubBleagU+R22zc/dpy
	1yVatLf1KD5ZwQE63hw/zIlW53OksJjDNV7PCGoinPaZMpPzuGFEguK2h4xY0FrqVBHy8DMU70E
	7lQQ6bZC7NAaWq35E0u0NNRZ97gdD1RE=
X-Received: by 2002:a05:690c:e3cd:b0:794:cea5:2ce with SMTP id
 00721157ae682-797f716f8damr57561247b3.5.1771573631215; Thu, 19 Feb 2026
 23:47:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213092958.864411-1-tzungbi@kernel.org> <20260213092958.864411-2-tzungbi@kernel.org>
In-Reply-To: <20260213092958.864411-2-tzungbi@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Feb 2026 08:46:59 +0100
X-Gmail-Original-Message-ID: <CAD++jLkaBPxPoMewbSeh=+GzFg8JTaBXQ-KsAXUgxgQZLcgQiw@mail.gmail.com>
X-Gm-Features: AaiRm52CMlErlBEqpuELbwrw3FPYyKKjdMlNu0pHoeQnbWplSCYK8ppWOB41Q3c
Message-ID: <CAD++jLkaBPxPoMewbSeh=+GzFg8JTaBXQ-KsAXUgxgQZLcgQiw@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] gpio: Access `gpio_bus_type` in gpiochip_setup_dev()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31932-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DADAB1655F8
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 10:31=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:

> To make the intent clear, access `gpio_bus_type` only when it's ready in
> gpiochip_setup_dev().
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

