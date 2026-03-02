Return-Path: <linux-gpio+bounces-32374-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EC1uLMhcpWlc+QUAu9opvQ
	(envelope-from <linux-gpio+bounces-32374-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 10:47:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F741D5BEF
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 10:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5F993014FF7
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 09:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BAE838F254;
	Mon,  2 Mar 2026 09:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WegT/50n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8C138BF6E
	for <linux-gpio@vger.kernel.org>; Mon,  2 Mar 2026 09:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772444870; cv=none; b=npFWBnxqzb7LloIqotdl6qBFQKPwmMIgLz/i5F8TUf2+ZAdrL+TDvcA0dGyoTy6sR1y0T4FbDkpa0R7NaOqHI7rnRcKAVhILyXwlNeDFVZ1qIiFk5bzdkiCxjeWPflQd6czKm4Ztw5n1UUPeoXs7ZvVjOOrCckRK34+6QJqgW/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772444870; c=relaxed/simple;
	bh=n0sVEjWNofsCxgzUtyk9/qTlFP36u11HIZHhHh3t5qE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W6JPT3EEp2X+qqMjKnuLKXKSlkLltu3bpMLVF92Q9CZcbXpPWUJ8b5BylpCoML4+V4k3Vy3SV+mk2N3g/LvJPrdTT0ir9sblEdvvznW1hMeVN0V/jPOIqEl7IccSZ0Oq3aP0+TywvVJjZUe3f1NdksHMy7Pd1V+2z3lREbOyen0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WegT/50n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24A7CC2BCB8
	for <linux-gpio@vger.kernel.org>; Mon,  2 Mar 2026 09:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772444870;
	bh=n0sVEjWNofsCxgzUtyk9/qTlFP36u11HIZHhHh3t5qE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WegT/50nZAqeMKls134gY/2OPItDepfzI1tSNMvGQNX53pkd8SR5d8r4BUs8Mn2Q6
	 gZYnhiHDRHzWzOCgW49odepaGxm9gKPnpXLvzhpHzSx4JZazi9ZFHYwoCdvL5iVnTy
	 kDN4Q6SWHV9ZS3iRDwjkfvQ7Noam4Pc3OIFFn98aZzAl2fli6ChTYpU3J/G7lKOS5L
	 aPi4pupvmepegZoPbj+2pPXk6cd5UILo3Ox+eHRr+wH1Uxjk/wluY3MBK+Ieyqt0Ri
	 PqrY5/ST0hEV7TxGEUo+MqcOVeQ4YRAfzVm7+SA86qOCI5Mhp17nlOBaZlkcEJvGIu
	 fmgyOXZBcjaAw==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79801df3e42so50689917b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2026 01:47:50 -0800 (PST)
X-Gm-Message-State: AOJu0YwVLpznaD87LfjJrbpDxMqoFvelMEOdn5XVRgNsd9HxAyXE0j9N
	Y3aRqlXXsofEBQC9XCzPI/YV8ZGp7S1dpvTPpTxGw3wIl3wBQZ4Fexxsh3Lc2TQl5bqrLoHyo8f
	xvjdoO5A1Ep9tGuuxxUaYoUDP14eWx2M=
X-Received: by 2002:a05:690c:3686:b0:797:d46b:e86e with SMTP id
 00721157ae682-79874be88demr138701707b3.14.1772444868769; Mon, 02 Mar 2026
 01:47:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227-ajar-wolverine-7ce1ebd79821@spud>
In-Reply-To: <20260227-ajar-wolverine-7ce1ebd79821@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 2 Mar 2026 10:47:38 +0100
X-Gmail-Original-Message-ID: <CAD++jLmo91CE8Yia69trrHz3g=PXPsSW32F7+GQ-0JvrpKSFHA@mail.gmail.com>
X-Gm-Features: AaiRm53MvmsLRrrHhVdWy25oztgLPBvp02xm93HhXnpSoyRADkEyceB1uibfank
Message-ID: <CAD++jLmo91CE8Yia69trrHz3g=PXPsSW32F7+GQ-0JvrpKSFHA@mail.gmail.com>
Subject: Re: [RFC v11 0/4] PolarFire SoC GPIO interrupt support
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Herve Codina <herve.codina@bootlin.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32374-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 59F741D5BEF
X-Rspamd-Action: no action

Hi Conor,

On Fri, Feb 27, 2026 at 3:53=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

> From: Conor Dooley <conor.dooley@microchip.com>
>
> In 2024 I sent a v7 of adding support for the GPIOs on PolarFire SoC,
> which relied on an irqchip driver for a mux sitting between the GPIO
> controllers and the main interrupt controller on the chip:
> https://lore.kernel.org/all/20240723-flatworm-cornflake-8023212f6584@wend=
y/
>
> Some feedback I got from Thomas there ended up being a complete black
> hole for time spent, and I never managed to make the change he wanted,
> as a house of cards collapsed whenever I tried it. I eventually
> abandoned my attempt to upstream the GPIO driver with interrupt support
> and cut it out of the driver to make progress. I've been carrying what
> Thomas deemed incorrect downstream since.
>
> Recently Herv=C3=A9 upstreamed a patchset for a Renesas chip that deals w=
ith
> a mux sitting between a GPIO controller and the platform interrupt
> controller by way of interrupt-map. I saw the opportunity to copy what
> he did, so have gone from an irqchip driver that read the mux setting
> that firmware had configured, to trivial driver that reads the mux
> configuration from devicetree and sets the hardware up to match.
>
> This gets rid entirely of the irqchip driver, so resolves Thomas'
> complaint, but I don't love how the GPIO side of things turned out quite
> as much. The hardware has 41 interrupts but 70 GPIO lines. 38 of these
> are 1:1, direct connections to a dedicated line on the interrupt
> controller and 3 are shared.
> With the parent mux driver, the GPIO driver's interrupt handler was only
> called either for specific direct interrupt or for only the subset that
> are fed into the shared interrupt for that controller. Without the
> parent irqchip from mux driver, and using interrupt-map, I lost the
> ability to use mux driver to selectively call the handler, so now the
> GPIO controller attempts to handle interrupts on all lines.
> Probably this is ultimately not a big deal, it just feels bad to do.
>
> Going RFC here, since it's an entirely different approach. The version
> number is a continuation from before, since the patchset linked above
> got merged at v10 when I stripped the interrupt support.
>
> The mux driver has moved from irqchip to soc, since that's where Herv=C3=
=A9's
> ended up.

This surely looks acceptable, I had an inquiry about using proper
chaining for the IRQs but other than that it looks fine to me.

Yours,
Linus Walleij

