Return-Path: <linux-gpio+bounces-32127-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIBoAsN0nWmAQAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32127-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 10:52:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE0C184F47
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 10:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAC5B314495D
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 09:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3CDF372B2D;
	Tue, 24 Feb 2026 09:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eq+jD1gM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC5C37417C
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 09:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771926609; cv=none; b=GjNruAZr9s2au+vDJLZR/3SCwG70jz8M7JBPPp93kurQusj3zwzz1pgo8mq/zsPN+szjiHKVevu171pstQku8V/GdisWwC6IYDPmA7yVMqsb2xneUeJzKGp94+eoD/JE9PUQyhPNyLEO2iyLQt3CJ7TVYLCihBbzLMR3Kb6kb24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771926609; c=relaxed/simple;
	bh=kxJ90tcmPPiY1SpjNBdM0uhq9B+wR1mKfqQdu49v1NI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jQO12aC7jLOemLO5sb+ViCV/DbDCseywuh70rZ7VPytddl0YhkOzNE8hPQbcIFBSjTdRZIMVO3LCJgA6gXkThsTla/6zEnE+0MnwAR6GaB3flvKvlPNjqf7Jpi18w9vUzGbGJM/mhfaiqCPbYxbv5uK+OQLaaHWUKUbHNyS4Go8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eq+jD1gM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27BF3C2BC86
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 09:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771926609;
	bh=kxJ90tcmPPiY1SpjNBdM0uhq9B+wR1mKfqQdu49v1NI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Eq+jD1gMxVtEeHkCx7sflO5rcMjSxzFIP82TfHquCfZfqUZI9rrx0Hwpk4z3sBYpE
	 c82d3jqNZiL6WpuSie6jA7IqWdiTVUBMV92m2NIcLG3MmtSVZrUNGwegIYWjzb55Q5
	 y0semVVD9jOYXRaNf5TY0xagBBnwYKgiL3XjesNZhLVBcfQQ+Rdz57YXq3k+g8xtgw
	 wAQYcEkl/iarEx4igcPlh/jgsr/8NaUTwUldPqNYo9d47Y2NaE4m0SezFC4SWLIMrq
	 5qO9nPKwfpoOMNEuoDq/2//5E5QBR6VjSDtmR3aP2TBrI7q7+NvO3soltMqGy/vp0T
	 m9HGrTHI9RSSg==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79430ef54c3so47202447b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 01:50:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV6lgkdMRCd7CVJHiTbVNQg0hs8TZ3D7vJy/Gz4hS1EzeIQxolxMv+HapaC+yjOwFGixBGIBlvgDYIY@vger.kernel.org
X-Gm-Message-State: AOJu0YwagARQrhILBBb5IyYwLt2ir2zephWuoE2I40foFKi9m5TNC0aW
	S1bseXoCe6OhTjbV2BVWZng1hkW20IOgz8UDhwgcrFhKlXIW3fp1kQmLe8ZqxpJmaim24Xpmjsb
	JY2W9PdDhPE5PxxxKtIDRWbBFi6Cj17s=
X-Received: by 2002:a05:690c:e3e8:b0:798:270:fec0 with SMTP id
 00721157ae682-79828cf8c2bmr95444407b3.5.1771926608489; Tue, 24 Feb 2026
 01:50:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223172006.204268-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260223172006.204268-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 10:49:57 +0100
X-Gmail-Original-Message-ID: <CAD++jLnPOQnijw0M0VOUJfeh8+6Z+R66T2btQp2-nPvV+zN3XA@mail.gmail.com>
X-Gm-Features: AaiRm52GEJwdxzDavCzNneyytQjybOl1hlwutImflwW5u6UT4J63oSemi_7VCGo
Message-ID: <CAD++jLnPOQnijw0M0VOUJfeh8+6Z+R66T2btQp2-nPvV+zN3XA@mail.gmail.com>
Subject: Re: [PATCH] gpio: introduce a header for symbols shared by suppliers
 and consumers
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32127-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5FE0C184F47
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 6:20=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> GPIO_LINE_DIRECTION_IN/OUT definitions are used both in supplier (GPIO
> controller drivers) as well as consumer code. In order to not force the
> consumers to include gpio/driver.h or - even worse - to redefine these
> values, create a new header file - gpio/defs.h - and move them over
> there. Include this header from both gpio/consumer.h and gpio/driver.h.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Andy, Linus: I'm no longer sure who proposed it but I've had it on my
> TODO list. Please feel free to take credit below.

I'm just happy it happens, I ran into the problem.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

