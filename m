Return-Path: <linux-gpio+bounces-31028-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +P5BEsztc2n/zgAAu9opvQ
	(envelope-from <linux-gpio+bounces-31028-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 22:53:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 769B17AFBB
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 22:53:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1609E3003BC4
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 21:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3CA2206AC;
	Fri, 23 Jan 2026 21:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="XGBYIJBF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C068172631;
	Fri, 23 Jan 2026 21:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769205190; cv=none; b=olzX5RDdgVhrPNcRvUXKcwhAKPSgwKQPPycCpLUUxtTQFz2/l33lClUYJEX5RH7UM2+KE7QwOviSfT7ALFtRrDAjgSemcyOJ7XAmNGiSsMtiuy+UAHUpS9Bc8nR8Z8LFjG0I+wc/BHz/SJ+Ghzfh2Y5hoFt9M6itXCRXwjgMabs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769205190; c=relaxed/simple;
	bh=mQAwcPuHESj3atIn7zkj/DHi9alzcMPIKLxRoVsho20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WPXFQfJWKe751viJ12SdUfdG24beX8RR0myTD48kweLFJ29kiOE0cVby+k/7SFqDUpSHWZ69fVAOeul3LPrDJh8ku4QRpACCJISnghp+C0cyRLGAPk3cHwPB+3w4gPE1YgM8e2FavGDdYwb6Zku5TZWmR4jXGugqNSwYTt+ckls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=XGBYIJBF; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=2ba85GeB3B1ichKlJAwFJYf43g8jypI7q6DIILljSC8=; b=XGBYIJBF9Cua6CZ2MaiR035mIb
	OnQz3xs6o1QG8YZvT1Q1ZkLDhkI0Uax3dy3wuYs4cY4FELSY0MVhSShd6voxGmC5HCh9dM5t5wmdQ
	APq7/Fu06NAi3mww/CjOsdNoQ2a0Dwvr9d+pQCdxsH0MKQlv5juPhu478N1ckK4jgj8ApjbBxuYrm
	//1Fu8hkvfe2iKI0Ab+oxEg19Mqsd1K502wzzsGlMxHfaHPWo+tpqTGO2+91smcrJo8Qq7O5q70ef
	YZboFx5KtrwIyNs/4wOuKtGc6OYvCNwtiM5z+wJ8sL0twPB/8QEbiD9udIq9l1eabjk+9tWPDnc5r
	J+mtcrOQ==;
Received: from i53875b18.versanet.de ([83.135.91.24] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vjP53-0042yn-Kl; Fri, 23 Jan 2026 22:52:38 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Bartosz Golaszewski <brgl@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] gpio: rockchip: mark the GPIO controller as sleeping
Date: Fri, 23 Jan 2026 22:52:37 +0100
Message-ID: <16771005.dW097sEU6C@diego>
In-Reply-To: <e9fd0005-bfbb-4052-8c2a-9200eb0b60ac@arm.com>
References:
 <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com>
 <CAMRc=Md0h5b=N9CqV-9L9sOtCNbiL1-y6RE0x4+w9HYXE8=pEQ@mail.gmail.com>
 <e9fd0005-bfbb-4052-8c2a-9200eb0b60ac@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[sntech.de,none];
	R_DKIM_ALLOW(-0.20)[sntech.de:s=gloria202408];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31028-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[sntech.de:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heiko@sntech.de,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 769B17AFBB
X-Rspamd-Action: no action

Am Freitag, 23. Januar 2026, 21:57:50 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Robin Murphy:
> On 2026-01-23 7:27 pm, Bartosz Golaszewski wrote:
> > On Fri, Jan 23, 2026 at 2:27=E2=80=AFPM Robin Murphy <robin.murphy@arm.=
com> wrote:
> >>
> >>>>
> >>>> It's not a big issue for the hdmirx driver specifically, but I wonder
> >>>> how many more (less often tested) rockchip drivers use GPIOs from th=
eir
> >>>> IRQ handler.
> >>
> >> Yeah, seems this finally reached my distro kernel and now the kernel l=
og
> >> on one of my boards is totally flooded from gpio_ir_recv_irq()
> >> (legitimately) calling gpio_get_value()... that's not really OK :/
> >>
> >=20
> > This has always been a sleeping driver. The driver does not know the
> > firmware configuration it'll be passed and - as I explained above -
> > depending on the lookup flags, we may call .direction_output() and
> > descend into pinctrl which uses mutexes. Ideally, we'd make
> > GPIO-facing pinctrl operations not sleeping but this is a long-time
> > project and quite complex. Telling the GPIO core that it cannot sleep
> > is simply incorrect - even if it worked for this particular use-case -
> > and has an impact on paths we're choosing.
> >=20
> > Can the GPIO reading in the gpio-ir-recv driver be done from a
> > high-priority workqueue by any chance? Or can we make it a threaded
> > interrupt?
>=20
> rockchip_gpio_get() is essentially nothing but a readl(), please explain=
=20
> how that could sleep? Saying that countless in-tree and out-of-tree=20
> arbitrary GPIO consumer drivers should pointlessly refactor just to=20
> avoid the GPIO core spewing spurious WARN()s is not reasonable.
>=20
> I appreciate there are cases where the warning most definitely *is*=20
> relevant, which is why I picked up this discussion rather than proposing=
=20
> a revert, even though the documentation says:
>=20
>   * @can_sleep: flag must be set iff get()/set() methods sleep, as they
>=20
> where since neither rockchip_gpio_get() nor rockchip_gpio_set()=20
> themselves sleep, apparently this flag must *not* be set. It's=20
> irrelevant that a higher-level gpiod_set_value() invocation might end up=
=20
> calling .set_direction before it gets as far as calling .set - that's=20
> not the gpio_chip's fault, and gpiolib knows exactly what it's doing.
>=20
> What I'm getting at is that getting, and even (directly) setting a=20
> GPIO's value can reasonably be expected to be more common and applicable=
=20
> in a wider range of circumstances than changing its configuration, so=20
> the former should not be unfairly penalised because of the latter. This=20
> case is clearly distinct from external GPIO expanders on buses that=20
> fundamentally can't guarantee fast memory-mapped access at all, so=20
> trying to conflate it under the same flag doesn't fit, and that needs=20
> fixing ASAP, before the reverts *do* start piling in. Maybe that just=20
> means some new dir_can_sleep or more abstract dir_needs_pinctrl flag=20
> might suffice, maybe it's something more involved; I don't really know,=20
> and I don't have the bandwidth to take this on myself.

the sadest part here is, that the dive from gpio to pinctrl is sort of
a remant of the past. Originally it was meant to "automatically" set
the gpio pinmux, but nowadays we (at least try to) have pinctrl entries
doing that separately.

But of course that's hard to enforce now, because we can't really know
where gpios without pinctrl might hide, and of course newer kernels
need to still run with old DTBs.

But...

rockchip_pmx_gpio_set_direction()'s only function is to set the GPIO
pinmux - it does not handle the actual the actual direction.

Can't we move the pinctrl_gpio_direction_input/_output() call just over
to the request callback of the gpiochip?


Heiko



