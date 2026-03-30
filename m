Return-Path: <linux-gpio+bounces-34410-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yL5kIxo9ymnD6gUAu9opvQ
	(envelope-from <linux-gpio+bounces-34410-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 11:06:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C67FD357CBD
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 11:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3E143030482
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 09:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F9B3ACA7A;
	Mon, 30 Mar 2026 08:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5EuxWkI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB95C3B27E1
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774861189; cv=none; b=KTQuPUrj8CWPp6VDgy4P66zSwBhALMzfmR8Fnn6jWyLndaqb1gxLnmSltN5D9PyyeOpy6f5KPzx/yp9ezFHaUZC4GsuCfrr0Lg0QOc91pSzuGH/YHVkZUpYnugfTjchpe1hLs3kHBo6MOT9Y3xYiJBceaHa2dPt6QMb6QSLxxiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774861189; c=relaxed/simple;
	bh=gQGPQdG0MaEvRxFPzW/waYcmPEYMB0k968IArc9kkN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YSuhmyKeL11rz32T3sFJfTUM/s0MsC3ZonHsYofBBzgqV7fYR2x2+y+lkvtjhE/uwrll+rmiNSfDVvN9cs+5munbNkY5jXqMMgcspB/ETNCefXepVZfWYONzLVKvxatlkofm4CJG+UeX/uzGzUTC8rfHsw2Pb9w9RGZqCXe32pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5EuxWkI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 562E8C2BCB4
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774861189;
	bh=gQGPQdG0MaEvRxFPzW/waYcmPEYMB0k968IArc9kkN4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l5EuxWkIL+FLkUr6o6ZO1G1d3LKW5iffvH1KIEbhu6y+wvXJIX0Ve8gQDrMKy7WYn
	 AMu+hwsEmOZC+euBvMpaWIP5TavmfDZgpYVgz8DsRBYKDyk2WizQcrheJQrODS+YBG
	 Y9HciljKBQ8Dq7WokwjQsZ5qtd7YyhrVItlSutICvLyzhn1z8rnTqbkhTOtzWw/gT/
	 C0WMgKWTrcf5xuIL0AIIus+SEqWw9K3/Sy41grtomTs2YTchZSh70JRAb6EMiNC4rm
	 W/H6AxXFfrJx0PDObiXo0lo/QXPQDkMzShA2gx27Y5LKZB/6oEqzqL0m0JpFwVCDig
	 eW97MXBFZ9bDA==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64d5a7926cfso5383606d50.2
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 01:59:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXTNEGEwyRecfa7KUrjuVIU2JlOx8mwjaCeXFJLaaOBLcTez09s5fq6KAKfDl5FUh7DHTTNVmRu3Op@vger.kernel.org
X-Gm-Message-State: AOJu0YzaiY0YfvIwYJubpWAaZPyq3iagjL+zH7ELS89bKamJG47NQXdw
	GSuT4kWW22J9cTPvbG2Eo8LjSLc4Yud7rzTWJnJmr6CuKcS25rKxOfn9A6tepaU2C7+aGqvrqua
	l0u+Mikk9fE9tei+FwXJkXUN0d0ZxDHM=
X-Received: by 2002:a05:690e:400e:b0:64e:e52c:cda8 with SMTP id
 956f58d0204a3-64ff73cb5c3mr11998693d50.37.1774861188627; Mon, 30 Mar 2026
 01:59:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-mfd-si476x-v1-1-93298ca35d6d@kernel.org> <CAMRc=MfbzzafKC2+DQKCPnRCTygWkyD+WLwLzQPw=4AOE1Ds5w@mail.gmail.com>
In-Reply-To: <CAMRc=MfbzzafKC2+DQKCPnRCTygWkyD+WLwLzQPw=4AOE1Ds5w@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 30 Mar 2026 10:59:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLmz4bGw1n3EB4hiFPvkzfQ_z_GfOHr8t-cmu9Bm88fAww@mail.gmail.com>
X-Gm-Features: AQROBzAh-yk2J3fusLKHqVNbnR2kBozfeB2ZUenl_od3zU4AeUCCfwtF1my4F8o
Message-ID: <CAD++jLmz4bGw1n3EB4hiFPvkzfQ_z_GfOHr8t-cmu9Bm88fAww@mail.gmail.com>
Subject: Re: [PATCH] mfd: si476x: Modernize GPIO handling
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Andrey Smirnov <andrew.smirnov@gmail.com>, Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34410-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C67FD357CBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 10:46=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
> On Fri, 27 Mar 2026 09:37:26 +0100, Linus Walleij <linusw@kernel.org> sai=
d:
> > The SI476X driver depends on the legacy GPIO API. As it only
> > really use a single GPIO for reset, and this can be easily converted
> > to use a GPIO descriptor, modernize the driver.
> >
> > The "reset" GPIO is obtained from a device property, such as a
> > device tree ("reset-gpios", which is standard, but this hardware has
> > no DT bindings as of now) or a software node for static platforms.
> >
> > Out-of-tree users can easily adopt to providing a GPIO descriptor
> > this way.
> >
> > Signed-off-by: Linus Walleij <linusw@kernel.org>
> > ---
>
> You could probably simplify it even more by using the reset-gpio driver w=
hich
> allows you to use reset control APIs with the "reset-gpios" property. It =
fiddles
> with GPIOs behind the scenes while you just assert/deassert the reset.

Yeah... but I don't feel confident doing that without the hardware to
test on. This conversion is pretty straight-forward.

If someone appears that can actually test this one patch I can take
a stab at converting it to reset control as well.

Yours,
Linus Walleij

