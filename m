Return-Path: <linux-gpio+bounces-33417-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHnxHwUbtWlZwgAAu9opvQ
	(envelope-from <linux-gpio+bounces-33417-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 09:23:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E9E28C1D8
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 09:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 987BB300FEDA
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 08:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0173264E2;
	Sat, 14 Mar 2026 08:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cOzy9GC2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E34C30FF30
	for <linux-gpio@vger.kernel.org>; Sat, 14 Mar 2026 08:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773476606; cv=none; b=Xv3cGJeUKojGL5xXRwaISzM3YTaeA4Xnl3Kv7X7lI5kxTeodqmFlhSJlcamoQ3h2SGNr43rz0faieItPRh3NjyS9uCUkIN8Tic3KODUctFv9i9ejxMpsee0XNMDgF5wiXUksXNYPlH0Xa3Gla9jArxI4K5GeZe7/Ewk2Mea13i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773476606; c=relaxed/simple;
	bh=8SQqEnyd8Ym6Ru02MK+S6GOZ0uWuE7fHmLVfyAGsPMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aAvhHrJyKZQaqfGxLyDE6YZ9cRVHhG1olynwe6ymoq6KUIUlpBg05Fpzu7HVxNxpzBxsgWUa0mvafwjMK4/3c2HS70BegP2qDopSwaZv6qs6suww3BuHh+vHz3/hqbhHPJC1JvI0KMwCCMG03M7DymcEdHVixfnp8cZ8B8T7Irw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cOzy9GC2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CFFCC2BCB0
	for <linux-gpio@vger.kernel.org>; Sat, 14 Mar 2026 08:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773476606;
	bh=8SQqEnyd8Ym6Ru02MK+S6GOZ0uWuE7fHmLVfyAGsPMg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=cOzy9GC2DTXK+k4f56wA61QizXLZqFsQsaIxotqWcbToMEH6t45IiyoLwP7PQwUfi
	 EqsUzYVoG/gCZ3/NiPEikqjSgYPbdBKnftK231OidPGL3CTHN1Q3YAlZWMFpLufIJC
	 OD4VuvW1vcBHgw4QyU91qWCFOc2tfSnodnH5lLnQpChol1eFLs1WE7jBs3e35pL9bj
	 mPWj3e8V9iemQTbu10sWYqLUylh4/JM8/kV+hzANClhob71xRLK1rzOd8LErw6ZiIL
	 lctd3lFlVK3JSMcV2N6HQWNrVBCNrm8z+ft9LbyBAX+9EQ7lvApDpGfpZwLsCchnIO
	 qhNYtW+VIGV2g==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38a67221fe8so24612131fa.3
        for <linux-gpio@vger.kernel.org>; Sat, 14 Mar 2026 01:23:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJUPj5vXXEn27wj4LrWA82rqyhy8hsntmYfv2kqqFzTjPd5exGbDbvu7cRRCvYahYrITkyyU10AVbE@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv0+4Jk5yE136qIO/R2vEynrxQ8TiVmEoOEDiBZ2SRBk9giJon
	4WADV6W8tdn05e8jgxJEl2aVpw1LZafboV1Nq8ueaa02+IgWYGMXXc/SOKoBcXICTLynOctkOIY
	7T5e4YoCMpgQF2RcJoz8J+nORqF0Nv9Q=
X-Received: by 2002:a05:651c:198d:b0:383:1c18:adfd with SMTP id
 38308e7fff4ca-38a8965a613mr19950571fa.7.1773476604352; Sat, 14 Mar 2026
 01:23:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl>
In-Reply-To: <20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 14 Mar 2026 16:23:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v67ZYyQ13ttMdzskHNTYxqYfEB_kVsMqsY9ZJhRKRQTigQ@mail.gmail.com>
X-Gm-Features: AaiRm50WuEF8U-AOW_wk_AUphFoKyP9ESXQMp8H01_1K7MXDXNBxQrTOlyOt8gs
Message-ID: <CAGb2v67ZYyQ13ttMdzskHNTYxqYfEB_kVsMqsY9ZJhRKRQTigQ@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Linus Walleij <linusw@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33417-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mmpsystems.pl:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 70E9E28C1D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 4:10=E2=80=AFPM Michal Piekos
<michal.piekos@mmpsystems.pl> wrote:
>
> Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.
>
> The issue is caused by gpiochip_lock_as_irq() which is failing when gpio
> is in unitialized state.
>
> Solution is to set pinmux to GPIO INPUT in
> sunxi_pinctrl_irq_request_resources() if it wasn't initialized
> earlier.
>
> Tested on Orange Pi Zero 3.
>
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> Suggested-by: Chen-Yu Tsai <wens@kernel.org>

Interesting solution, not at all what I had in mind. :D
This fixes things immediately for sunxi, and keeps proper pin lockout,
i.e. one can't use a pin muxed for other uses as a GPIO interrupt pin.
I was hoping that the maintainers could provide some guidance as to
whether the core could provide helpers for this, but for now:

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

