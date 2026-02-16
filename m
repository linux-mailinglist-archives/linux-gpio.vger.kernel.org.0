Return-Path: <linux-gpio+bounces-31707-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sENCBu7xkmlA0QEAu9opvQ
	(envelope-from <linux-gpio+bounces-31707-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 11:31:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E18D1425D5
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 11:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72F19300DF77
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 10:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB0A1F2BAD;
	Mon, 16 Feb 2026 10:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nNzKSTCw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5021A1624C5
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 10:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771237866; cv=none; b=liNj+gx0XvMTULVnmZ4ACSXMWj8nTICd7XNlY192wWQnK0NXaTnXbykiy2Ul+u9IH6ZV9nJb+dpMHFZBxv40wdMEP42WkMiEtrcb9x/V+lhfASLkPV04Vv+x5iJmkb1QbK5GD909pAPssTrOLkEDcpTJPGHyXp/x7KfxGi1qNJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771237866; c=relaxed/simple;
	bh=DwbKLdoYsyjKXqQAWi9WY8Xz+6TEySM2cv+K/XJSlQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VLntWUIpKlK4bvAbOMQ/kRa2v+9UBZzM4/rOIF6uBgBGRxjie2/h7b4fRt+bQLstxXEAfTvbS2mulFsxio/6feyY7Ycon6vVH2YYVTZywlaOv28G2huLn02tanVyFD37WvDSJfbdohbcMalCLworRtFAAWIgPof8XzyG5r6drx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nNzKSTCw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B32C19424
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 10:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771237865;
	bh=DwbKLdoYsyjKXqQAWi9WY8Xz+6TEySM2cv+K/XJSlQ0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nNzKSTCwseetf+537vQElljuZ0djhNl2dWFWVIEv571OjF++b6Pi6k+TB/vNt2CPc
	 HZvy4JyFpRpTn3LWpACw1esvU9R/1gquBDhqlRSJfead+CmhEGcX/mGmxXfWQCWNSr
	 z8/rz+sRGOhrfZyD/LzedEsUeZk4fnafqMy243sd45/qkAPe7hO3tr9lGIMvPrqgoO
	 NfiKLNoAA41i1L50FUa27HNuKRw16GWHkZ84Dz/TTJv3oLGeLBpKppS0BAjPqRCOHA
	 1Yok+01ORTO5XIxZUI79BFgP+5wa4jMS3u0DWC4wrQmG6NHsogmsEEeO5yKWGYSNHZ
	 O3HHEJ2cE2v4Q==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59e62a3ee29so3139280e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 02:31:05 -0800 (PST)
X-Gm-Message-State: AOJu0Yw7kmLIeCfwV1rWAlnWOYb7DI4F0kIf7vzLrlBih0gMOUsjSLDH
	HhCYJS3ow/TeKEQIO3BohithgsIg9cNlZE/nyAAD/AW6bZ/x7gC2mvMP98mHkid4aicPGrU7gxc
	78qvtEO2MCN5B9SEAWRcbXIkfUDvFhyen+Dy9Qkh7hg==
X-Received: by 2002:ac2:4f0e:0:b0:59d:e589:c977 with SMTP id
 2adb3069b0e04-59f02632e00mr3099495e87.26.1771237864449; Mon, 16 Feb 2026
 02:31:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214003402.3851492-1-dlechner@baylibre.com>
In-Reply-To: <20260214003402.3851492-1-dlechner@baylibre.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 16 Feb 2026 11:30:51 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mf7LNW+3u9j97VwLpmXGgZAKZuqNiYNYUS7wd4oxsndeQ@mail.gmail.com>
X-Gm-Features: AaiRm52GlCwugplo7iNaJwvWLeMCtIwL8vP50Vpn9Gt--Rhrh4p658hQLWWqOSc
Message-ID: <CAMRc=Mf7LNW+3u9j97VwLpmXGgZAKZuqNiYNYUS7wd4oxsndeQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] dbus: add -c option to gpiocli-get/set commands
To: David Lechner <dlechner@baylibre.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31707-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3E18D1425D5
X-Rspamd-Action: no action

On Sat, Feb 14, 2026 at 1:34=E2=80=AFAM David Lechner <dlechner@baylibre.co=
m> wrote:
>
> Add the -c/--chip option to gpiocli-get/set to allow users to specify a
> chip and line number instead of a line name. This is useful when a line
> does not have a name.
>
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---

Hi David!

I did not accidentally omit the --chip option in gpiocli
get/set/monitor. GetValues/SetValues are methods of the Request
interface, not Chip. User can request lines with a chip specified but
getting/setting values happens on the object implementing the Request
interface. You can check what requests are currently managed with
`gpiocli requests` and use the -r/--request to restrict the scope to a
particular one.

In other words, I don't think the client needs this.

Bartosz

