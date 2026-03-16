Return-Path: <linux-gpio+bounces-33584-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MB4FPVxuGn5dgEAu9opvQ
	(envelope-from <linux-gpio+bounces-33584-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 22:11:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A62592A08DF
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 22:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9141D302DB41
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 21:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233DA35F601;
	Mon, 16 Mar 2026 21:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmim/3D4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6690363093
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 21:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773695311; cv=none; b=gMEifNAOM25bUOf58/ih2FmsZhZrBYcctLSEegnSYWLVDHTWHdnZt2NMcTHF+SR4zk6jSC7xs8caE+pCyCC0+W6fJ1yLN+mOeyMwJiFgTexP6Zw95Wk9ckfIgZNyq48HTh8iapASdOP4OO0Kwa0csd6bcAcLN9DiXy/r8/v7pug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773695311; c=relaxed/simple;
	bh=Htz9WcWSJ7v3g96Z/bPQenu2XMHNZj09d6bGTN/cGZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BRkNXK7Fg6nqOb2fxylUagwGt3K+8TDvN75RN43zq3SqcKK6tsXtv2F68/aUs8YQVuwRQi6O4oxe/zXarHKxBZmNr2HtcorvtBvN53AWfnmsrhiDvEjciSS322mNpRIuCJqGrvMYqD5wCKE0almXH1KRR7mHc3NSWOAbk3kIM40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmim/3D4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD2CC19421
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 21:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773695311;
	bh=Htz9WcWSJ7v3g96Z/bPQenu2XMHNZj09d6bGTN/cGZ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kmim/3D4ZHfgjj6IYPnMcNLYG9sv8XqCiBZ5KfllJzJHh5C9C/u7IfTZyZInLH8k9
	 t3l38jmoApes15LRH5RkCGzAtZOJEBH1jtmgR43737lsBI2LX+nUFDjpJlq6FoNVV9
	 6IPIBLQkxAGN0vhDi1Oy5LeYo2GJOwstnWD3X+HIMHZauaOmZSQI3sNAFkPJNzOarY
	 k4aDGrE0Vl4xXfgh8P/mu9IBioJxzkOFw3b5ZkiIC8oigmgTceZQl18kdOT9zl3zZ6
	 fThuLLhUlxVxrQbtKQ9GQrcnjU13O8Pryk0eY/oPA9RgESlJqrxEzC54pz8F1ly9eL
	 HJeQmBJz4DMlQ==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79885f4a8ffso42055397b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 14:08:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWCNA7EQqq8Xm3UIK+IsPkdIiVFzYxQzJSsHoKPkAAl6EIaFQnOaSkj2gVGhkObpB1uhSuHuzouPLK8@vger.kernel.org
X-Gm-Message-State: AOJu0YxJjWTONj83TbTnQD8/9n2Iil8JegbTUJsHCx+bUSmESm0iQo0M
	OPJWm3jhL04ArG69eKiDHVbmi9qUzoGOKFpx6vu4e6qb4hByQ5opkO8aC9ctOsflgWIrORQ6snn
	vy3i/N6PQICW+4kln6mDnH7x4WhH1k0Q=
X-Received: by 2002:a05:690c:6504:b0:799:182:17d1 with SMTP id
 00721157ae682-79a1c200ad0mr140633457b3.45.1773695310833; Mon, 16 Mar 2026
 14:08:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773150895.git.dan.carpenter@linaro.org>
 <93920f541564bc4e6aaf0f2b6df2f5aca721d452.1773150895.git.dan.carpenter@linaro.org>
 <abHR2nnC9jJWK2eW@ashevche-desk.local> <CAD++jLnTJidg20wUYXf+cH4hTsVhAsPwi+CcCdRL5n12kwaTmA@mail.gmail.com>
 <abKYXJCXPpVIEVlQ@ashevche-desk.local>
In-Reply-To: <abKYXJCXPpVIEVlQ@ashevche-desk.local>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 22:08:19 +0100
X-Gmail-Original-Message-ID: <CAD++jL=RoYb-V-kOMoXjnbH24c-YrejqyEEUNeu6hX+HipTwiA@mail.gmail.com>
X-Gm-Features: AaiRm51seapTHcba7LjSTTCnu2qGnW1tbdfEo_CD20pLihSJy4bap4bCjdDblIA
Message-ID: <CAD++jL=RoYb-V-kOMoXjnbH24c-YrejqyEEUNeu6hX+HipTwiA@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] gpio: add pinctrl based generic gpio driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, AKASHI Takahiro <akashi.tkhro@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, arm-scmi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,kernel.org,vger.kernel.org,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-33584-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A62592A08DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 11:41=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> On Wed, Mar 11, 2026 at 11:00:02PM +0100, Linus Walleij wrote:

> > What this does is essentially take the gpio-ranges, find the
> > backing pins on the pin controller, and creates a GPIOchip
> > from them.
>
> Thanks for elaboration! But why is it done this way? It doesn't sound
> like a usual (generic) problem to solve.

The experts can confirm, but I think this was done to simplify
the SCMI firmware, both the specification and the implementation.

It was identified that it was necessary to have a pin control
SCMI specification and implementation, but no separate GPIO
specification and implementation was defined, leading to just
one spec, and one single firmware service to
implement that will support both pin control and GPIO.

These days, if we were re-specifying ACPI we could do the
same there, but alas it already has legacy GPIO-only interfaces.
SCMI has the upside of being able to start from scratch
and upend a few traditions.

Yours,
Linus Walleij

