Return-Path: <linux-gpio+bounces-36619-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMgILEA7AmqYpQEAu9opvQ
	(envelope-from <linux-gpio+bounces-36619-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 22:25:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C909515D30
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 22:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E649B306CC71
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 20:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0A5037FF71;
	Mon, 11 May 2026 20:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RpB8bRJB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DFF37EFF1
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 20:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778531009; cv=none; b=OlaNRnNVTmrMa28E3TIvqEMFLSL8lLs8W5lu4VbJGxIBdxQqsa/4c+hPRt4KnKMTxsCNx4HRBNGVpIJ6icw/cbBIZJ1A4t0gdJzUMRZTgLgZZ/Zyw+LcqDcCJsN3gUOs4DSLpmBifAzktuMeibvSe1/i6Nax24S6piZsBZNKrcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778531009; c=relaxed/simple;
	bh=Mw4otLNufcyiPgx5PCsJEXIfpLTfBs5wWkfpUHwyxKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WED2fgRVHuXvKbZWA+5o3nURNGQPVwKQ1hL3ZUd/FnoGmMENxkj6nVczhXh2xetP7Ve+T8ALtoU5Brx28mEs4/81f0emBidG5IncUj09mJdSkhPWx46Q82TjwvqtLnBPqGZlfEYsXt8W3bn3wGuDvy6eUwhpMBrLHCZO62WIap8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RpB8bRJB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 421AAC2BCFA
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 20:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778531009;
	bh=Mw4otLNufcyiPgx5PCsJEXIfpLTfBs5wWkfpUHwyxKU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RpB8bRJBrzCFTAcznf4QzQZ6HV51QKaF/wUVny/T7vSt4QbDQhfgY8yHCbhfo8who
	 wSkiD4jLIU28+QrFV5AQ/6jJKTLxWPnSzIinbDpZlydktxvHP85UrE+iAzdtBrcIOz
	 YPIfsralVeWzkm3yMuJGxQ91txZOG2Z4d2B4p2X/R5wsSzwWHIgTQqNOZa5yHXdHxC
	 0lHUVEdGcUgG0qlJYi8OmEi5e1UzZ5toWZj7/VQiL1nNqmZWSigpBSvBxQcu8mQzRC
	 PDzVNShCCiQhBPyG4xT+bvICDwXfi//ciGSpP2H6mzXEao7JyJJE5uyhX6fp1AclQ7
	 8P4R055DdnIIQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a86e4b950cso3456382e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 13:23:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8ydFRxxeLTrNSJ6JGKMneG+dBWidzVqLfrMYG6WfGX7NZv1RzzuDF+ObY4hNI/m5y1gW40GGIQIvUf@vger.kernel.org
X-Gm-Message-State: AOJu0YxVj+ZNhLKifhDVw693Oje6NpjxAt6+46eHaODw+Ph0RHv5QyuP
	h4QqoJSV08oP52K/vwuzeIYkZAFhQKPn0HsLaoUoPaqX+ddZX0bPidtMzgPTTWlJy8+GnRA0fcF
	kazCS6r51PGjGgvqr/Rr/yVCHoEr6zmw=
X-Received: by 2002:a05:6512:114b:b0:5a8:6c7b:f9d7 with SMTP id
 2adb3069b0e04-5a8e31f5ff3mr23278e87.41.1778531007946; Mon, 11 May 2026
 13:23:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506-energize-dramatize-051909e54256@spud>
In-Reply-To: <20260506-energize-dramatize-051909e54256@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:23:16 +0200
X-Gmail-Original-Message-ID: <CAD++jLkEfqDrqaxTjxf4AwHPcdCppPfO5F7H5YnR2gebzhZFig@mail.gmail.com>
X-Gm-Features: AVHnY4IP4KN4sVQQCZ4yBVMA5cS0ZkPLASNGKB7mSTEskh3Q63aPn5iBQgOAutg
Message-ID: <CAD++jLkEfqDrqaxTjxf4AwHPcdCppPfO5F7H5YnR2gebzhZFig@mail.gmail.com>
Subject: Re: [RFC v1 0/4] generic pinmux dt_node_to_map implementation
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 0C909515D30
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36619-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Wed, May 6, 2026 at 11:58=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:

> Whipped this up last week, at to a first glance it appears to work,
> although the spacemit platform I've used to implement this has very
> limited in-tree use of pinctrl so it is hard to be sure.

I like it, if it wasn't RFC I would merge it.

> What I don't love though is how similar the functions
> pinctrl_generic_pins_function_dt_node_to_map() and
> pinctrl_generic_pinmux_dt_node_to_map() are - essentially identical
> other than which function they in turn call.

Hm we can maybe think of something more descriptive
to the first one?

I think the new function is very much to the point. That's what
it does. pinctrl_generic_pins_function_dt_node_to_map() could
perhaps be names something that make it evident what is
special about it. Not that I have a good idea.

> Basically, I wanna know if you think that that is acceptable,

Looks Good To Me (TM) no-one else is helping out with pin
control core work so I'm happy for everything I get.

Yours,
Linus Walleij

