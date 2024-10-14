Return-Path: <linux-gpio+bounces-11309-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CE599D24B
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 17:24:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D73DA1F25103
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 15:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532821B4F08;
	Mon, 14 Oct 2024 15:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="HzQokqH2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8341AE01F;
	Mon, 14 Oct 2024 15:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728919365; cv=none; b=MjwUeAsVZbtvmk5ojjtb2N97ksn1eVRe2SZ5dZx9/oO/rxsL7J25FDPTW/LXJ0+YkmMZKJ/G/XjIdqy1ypX4uJk18+pelkBuDzFlt13kb4DkNkwSQRe7CK7OQM7JIqFBd2lmOX2sgpj5sgofmfr6g7FMu7nzh3WgsijV9xLOeRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728919365; c=relaxed/simple;
	bh=riXFOTomC+rJMGpA1bmlrqeX3Yd+ngcuOvBAzntGC3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KUETXbv+L6/Aagd1h2138a4JFeELk13+Yyr7Jer07lpbkydqppPlj1t9gqwV7hsZb3jzNgVcD2y3oF+s+e1Ftf1jXzPC39mo5i3/6qba2kq8pgsD/6luKtOhxi9OmG2pfCmyUXG+blCrYwhgTpEAdlJ17RjB5p0K3tRGjsGEBq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=HzQokqH2; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=riXFOTomC+rJMGpA1bmlrqeX3Yd+ngcuOvBAzntGC3Y=; b=HzQokqH2HhbTAwK0NvS/BSx/lN
	S+gpVOrdx1XnxxgppSHuLlOyRzSg1/TAGLw+Hv7IYnoXWkgYcFj0htDoLTAghLwy9vx9s6ivPlNdg
	rtqVtcqPsSA2ttFf4Vt4NvE6drpug/dFXTTLFSBohy2wQ9bs6KSgnSw72/GHlDlHoS7/5w7pIAPm0
	qr4+KoYm2HsCSW/G0x1sn0fWpQBivOAcu961c1vgDhtNjLvVKTK96mLsLDgf31WtECME0qE0wNlga
	srHIudAXzkLkyWd8RP2Tbq5pDyFbP4wTsBDEosrzXuRZPgiiCIZ8BcM+Rs+um/q9P0beHkTSIOqWM
	onwvGadQ==;
Date: Mon, 14 Oct 2024 17:22:37 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Bin Liu <binmlist@gmail.com>
Cc: Judith Mendez <jm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Kevin Hilman <khilman@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bin Liu <b-liu@ti.com>,
 linux-serial@vger.kernel.org
Subject: Re: [PATCH RESEND 2/2] serial: 8250: omap: Move pm_runtime_get_sync
Message-ID: <20241014172237.63e9625f@akair>
In-Reply-To: <4297747A-8AB9-4E50-93FF-723672B6471C@gmail.com>
References: <20241012142705.45948f7d@akair>
	<4297747A-8AB9-4E50-93FF-723672B6471C@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Sun, 13 Oct 2024 21:52:05 -0500
schrieb Bin Liu <binmlist@gmail.com>:

> Hi,
>=20
> Somehow this email wasn=E2=80=99t cc=E2=80=99d to my company email account
> b-liu@ti.com, so I am replying from my personal email which
> subscribed to the mailing list, and sorry if the formatting is wrong
> since I am writing this response on my phone.=C2=A0
>=20
> On Oct 12, 2024, at 7:27=E2=80=AFAM, Andreas Kemnade <andreas@kemnade.inf=
o>
> wrote:
> >=20
> > =EF=BB=BFAm Fri, 11 Oct 2024 12:33:56 -0500
> > schrieb Judith Mendez <jm@ti.com>:
> >=20
> > Currently in omap_8250_shutdown, the dma->rx_running
> >> flag is set to zero in omap_8250_rx_dma_flush. Next
> >> pm_runtime_get_sync is called, which is a runtime
> >> resume call stack which can re-set the flag. When the
> >> call omap_8250_shutdown returns, the flag is expected
> >> to be UN-SET, but this is not the case. This is causing
> >> issues the next time UART is re-opened and omap_8250_rx_dma
> >> is called. Fix by moving pm_runtime_get_sync before the
> >> omap_8250_rx_dma_flush.
> >>=20
> >> Signed-off-by: Bin Liu <b-liu@ti.com>
> >> Signed-off-by: Judith Mendez <jm@ti.com>
> >>=20
> > Is this a theorectical problem or some real practical problem?
> > So you are running a system with runtime pm enabled on serial
> > console.
> > How did you come across this issue?
> > I could run the serial console/getty with runtime pm autosuspend
> > enabled without issues all the years.
> >=20
> Yes this is a real issue reported on AM335x. Please see the report
> linked below.
>=20
> PROCESSOR-SDK-AM335X: Possible bug in 8250_omap UART driver -
> Processors forum - Processors - TI E2E support forums e2e.ti.com
>=20
>=20
Thanks for information, so it looks like material for backporting.
Maybe add the link in the description and add the cc stable and=20
add back the fixes tag.

Regards,
Andreas

