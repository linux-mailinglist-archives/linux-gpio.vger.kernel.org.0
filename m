Return-Path: <linux-gpio+bounces-38496-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tfIqIuv3L2okKgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38496-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 15:02:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 265156867F2
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 15:02:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=mwSVXXmu;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38496-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38496-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F1E2307832E
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 13:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5153F39CF;
	Mon, 15 Jun 2026 13:00:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658E93F39F5
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 13:00:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781528417; cv=none; b=kOlRImFkiGCd7zpEPz4go2aYu3bujjeeJrFH9+Vox+haZ4L4xTvEHX65wpe2ufB0J0sBGBpDsIS1vhHmx4rM2S8Pt7gs1fWGhVj8tnjS4NWGVM0TmXfWlsC2UmuzJedvti1PJn5NhUMPXxGdt4/AhKcWqId5QM8oT5c/FmvshvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781528417; c=relaxed/simple;
	bh=iQ3Soby+H1Im+rNqR4BJmskioYFWneXQcHdUDGsEmQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V7jmadixtdreJjRPyqfIaGQ7Cuze9nRtnqsbyykX+M18eKLrZj7trzTKJcApvUVtnKn8YhxZvb7doFEU/3GyDzODECH4/RXF9IDEx4MPxMFMXbCu8qb0Q8/9AfMlL6eNydF8Ch7E2fkK8vLPEZlOi3EIuudMTkNLADR1fQr2EeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwSVXXmu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C6AC1F00A3A
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 13:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781528416;
	bh=9AfeWhadO1v9+SOwJHNDv9yxD8mKNaO32U/4W8IqQks=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mwSVXXmuS70Nf1qIy/M9bjvutWnJr0kJ94zwRPUgp2N5VbWAFlUaATsbNVJkOdjrz
	 n1NHbQajKdYq5Qof41Z8jmH1EPrcssk0ovHroJXvyUZh20BMO/hCEhYumZtOmifKKK
	 Dfmc1Vqzq21QMMXGfNIG7S5lnv1gplR2F2KaXeU42JGPKcJy9S6BBhX/nhVq3h8xCl
	 xRsa/k89h2OA319HsquubXo4Y2dHdaVW7wK5xNa1kxCyeDRQ+OZWdm7MUkFooCx4W7
	 CAAIG8qGDeaVlXrxTfxkPg5kooagQBGdw253qvRViRUH7oqMFjmLOoDqKr/8MWUKun
	 Zm0iFjozjMsAQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39676ff4674so29139291fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 06:00:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/M81Avy6dtFshIGwJdZ4Nib6GUI2YC5bd9OxsOSqPNPNFVXlqlkG50cDNHQrTZvcQDoo6dqVmfPBAx@vger.kernel.org
X-Gm-Message-State: AOJu0YyqNjzaxHJWSXDScKSmb409kvpnm4zzF1f2iv0Fa+UMAmUlWXXX
	j0kb5Gu5lvfltzhbpjDbV4zY2wegQRT+MLzfWC1Dnp0F6qAVZ3XLjROn2Fwd/Y6YKS7kMmP3g9S
	gLXn1HGKb2UmKfpXG8cByMre/n/B+5Rk=
X-Received: by 2002:ac2:4842:0:b0:5ad:a25:b8a3 with SMTP id
 2adb3069b0e04-5ad30dc3332mr1847615e87.29.1781528412405; Mon, 15 Jun 2026
 06:00:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
 <CAD++jLk3YdMUSkk71rgT=taQZnEhqgMgGP0dKBPx7_5Bsxmu+g@mail.gmail.com> <2bb2c0e8-29e1-444b-851b-a9932f547c6a@amlogic.com>
In-Reply-To: <2bb2c0e8-29e1-444b-851b-a9932f547c6a@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 15 Jun 2026 14:59:59 +0200
X-Gmail-Original-Message-ID: <CAD++jLm9+8RSbBCi-k=8S98XvVJ7taYrK=kuBp3_RqxE_bcxbg@mail.gmail.com>
X-Gm-Features: AVVi8CcBb6WQACvc7gkaicyjvy5mkWEAD_WR6myDRZYFSecbNnPJmhQJczsoxDs
Message-ID: <CAD++jLm9+8RSbBCi-k=8S98XvVJ7taYrK=kuBp3_RqxE_bcxbg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] pinctrl: Add support gpiod_to_irq
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[vger.kernel.org:query timed out,mail.gmail.com:query timed out];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38496-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xianwei.zhao@amlogic.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:linux-amlogic@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[vger.kernel.org:query timed out];
	RBL_SEM_IPV6_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:query timed out];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amlogic.com:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 265156867F2

On Mon, Jun 15, 2026 at 5:17=E2=80=AFAM Xianwei Zhao <xianwei.zhao@amlogic.=
com> wrote:
> On 2026/6/11 20:51, Linus Walleij wrote:
> > Hi Xianwei,
> >
> > thanks for your patches!
> >
> > On Thu, Jun 11, 2026 at 9:54=E2=80=AFAM Xianwei Zhao via B4 Relay
> > <devnull+xianwei.zhao.amlogic.com@kernel.org>  wrote:
> >
> >> Some users need to obtain an IRQ directly from a GPIO descriptor throu=
gh gpiod_to_irq().
> >> Add the required DT binding and implementation to support this use cas=
e.
> >> Since this introduces a new DT property, the property is kept optional=
 to
> >> maintain compatibility with existing SoCs and DTS files.
> > To me it looks like you have just re-implemented hierarchical
> > irqs.
> >
> > Look into the section "Infrastructure helpers for GPIO irqchips"
> > in Documentation/driver-api/gpio/driver.rst, especially towards
> > the end.
> >
> > Solve this by using GPIOLIB_IRQCHIP and a custom
> > child_to_parent_hwirq() callback to translate the GPIO into
> > an IRQ.
> >
> > To just implement gpiod_to_irq() without any irqchip abstraction
> > is also broken: you can't force all users to just use this way
> > to get an IRQ it's excessively restricting.
> >
> > Add
> >
> >    interrupt-controller: true
> >
> >    "#interrupt-cells":
> >      const: 2
> >
> > to the pinctrl node as well so that DT users can simply request
> > the IRQ from the irqchip inside of the pin controller. It will
> > be hierarchical and lightweight but an irqchip nevertheless.
> >
> > The GPIOLIB_IRQCHIP approach will help you to get this
> > right.
> >
>
> I read the document (Documentation/driver-api/gpio/driver.rst) you
> pointed me to and found that the corresponding implementation has
> already been added in this file:
>
> https://github.com/torvalds/linux/blob/master/drivers/irqchip/irq-meson-g=
pio.c

That is the parent interrupt controller to the pinctrl+gpio isn't it.

It will be even clearer once you use interrupts =3D <>; instead of
the hwirq =3D <>; hack.

> However, it is implemented as a standalone irqchip and is not integrated
> with the GPIO controller.

Right, so it is the parent. Of course it it stand alone.

> In this patch, I implemented the GPIO-to-IRQ conversion through
> gpiod_to_irq(). Users can still obtain the interrupt directly through
> the interrupt property, for example:
>
> interrupts-extended =3D <&gpio_intc 16 1>;
>
> The purpose of this change is to make GPIO-to-IRQ conversion easier for
> users who do not want to know the actual interrupt number. The interrupt
> mapping is not fixed and varies between different SoCs, so users should
> not need to handle the hardware interrupt allocation details.

This is not why gpiod_to_irq() exists. It is not a convenience function
that is voluntary to implement.

If you implement gpiod_to_irq() you implement an entire
irqchip otherwise it is a bug.

If the pin control + GPIO driver should serve IRQ numbers in any
shape or form, you need to go the whole way and provide a
hierarchical irqchip.

It doesn't matter if you don't need to set a single bit in the
pinctrl + GPIO hardware for these IRQs, the fact that they are
routed internally on the SoC out through the pin control and
GPIO block by definition makes it hierarchical.

Yours,
Linus Walleij

