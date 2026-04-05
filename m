Return-Path: <linux-gpio+bounces-34685-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MP7Bo1/0mnFYQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34685-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 17:28:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B92639ED98
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 17:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC5E43008A79
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Apr 2026 15:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DAEE308F0A;
	Sun,  5 Apr 2026 15:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KvQWd+Gl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 795DF2750ED;
	Sun,  5 Apr 2026 15:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775402885; cv=none; b=W8yR1hSuArPw6bkYxsGtKxdenDkTvQoBGLlpMnK4F/hKnNiyILBPLfCeCfJ9dr3glQ7CpZOF4svysqJ96ECdyH4/jCQVf0AgTEZECdL9NjVGRthAR9OaIXknsMyiQhIKnYVGWFH1MmVXaoOX2SMFXiyPwe9L5MG1CN8shcJJTKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775402885; c=relaxed/simple;
	bh=NDnBsbXnNGGHQG0turWSfj4CBg3TO2qRC78L3hPeXs4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f/G6aDiZLTTxAZsSRZOXDTw9Z1UHOf6jk8E58QljM7sagWUV4u6Ewlsrx7DUWU7pM54NGoBjG2Yr1A1+3wlsbGtP46p69JsTn+FXWHObhEUmiIaGRFd4IxIf0noxl8wTPVbUdWIMF3KxJJqa4jMpE4GRl/1R0S7R/ZdfCU/gGGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KvQWd+Gl; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 048E81BC0;
	Sun,  5 Apr 2026 08:27:49 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E34383F62B;
	Sun,  5 Apr 2026 08:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775402874; bh=NDnBsbXnNGGHQG0turWSfj4CBg3TO2qRC78L3hPeXs4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KvQWd+GlyQ26qJRkqKLtd0rZhhvYeTZuhURhP2De+TrJdzHLaXomuaxGKCg7V+Nmu
	 Cq76diR6Q/0tGfEMAOK8ZxI5sR+DH/t5TeJTkhUA5i4JJEJ6ngsn8s9++hzFvakxNn
	 hubn+aHBCVzSVgfa8MK94n19vR39SYApBGMpstuA=
Date: Sun, 5 Apr 2026 17:27:38 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] pinctrl: sunxi: a523: Remove unneeded IRQ
 remuxing flag
Message-ID: <20260405172738.02530c80@ryzen.lan>
In-Reply-To: <CAGb2v64A0rgiMkTCdvq-pVfzCTqWKqc=nx69B9tD7A8_E7vHUg@mail.gmail.com>
References: <20260327113006.3135663-1-andre.przywara@arm.com>
	<20260327113006.3135663-2-andre.przywara@arm.com>
	<CAGb2v64A0rgiMkTCdvq-pVfzCTqWKqc=nx69B9tD7A8_E7vHUg@mail.gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-34685-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.przywara@arm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6B92639ED98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 27 Mar 2026 19:38:57 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

Hi Linus,

> On Fri, Mar 27, 2026 at 7:30=E2=80=AFPM Andre Przywara <andre.przywara@ar=
m.com> wrote:
> >
> > The Allwinner A10 and H3 SoCs cannot read the state of a GPIO line when
> > that line is muxed for IRQ triggering (muxval 6), but only if it's
> > explicitly muxed for GPIO input (muxval 0). Other SoCs do not show this
> > behaviour, so we added a optional workaround, triggered by a quirk bit,
> > which triggers remuxing the pin when it's configured for IRQ, while we
> > need to read its value.
> >
> > For some reasons this quirk flag was copied over to newer SoCs, even
> > though they don't show this behaviour, and the GPIO data register
> > reflects the true GPIO state even with a pin muxed to IRQ trigger.
> >
> > Remove the unneeded quirk from the A523 family, where it's definitely
> > not needed (confirmed by experiments), and where it actually breaks,
> > because the workaround is not compatible with the newer generation
> > pinctrl IP used in that chip.
> >
> > Together with a DT change this fixes GPIO IRQ operation on the A523
> > family of SoCs, as for instance used for the SD card detection.
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > Fixes: b8a51e95b376 ("pinctrl: sunxi: Add support for the secondary A52=
3 GPIO ports") =20
>=20
> Acked-by: Chen-Yu Tsai <wens@kernel.org>

Can you possibly take this patch and maybe the binding (PATCH v2 2/3)?
Ideally still for v7.0? IIUC Chen-Yu would take the DT patch, but
relies on those two here.

Thanks,
Andre


>=20
> > ---
> >  drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 1 -
> >  drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   | 1 -
> >  2 files changed, 2 deletions(-)
> >
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pi=
nctrl/sunxi/pinctrl-sun55i-a523-r.c
> > index 69cd2b4ebd7d..462aa1c4a5fa 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> > @@ -26,7 +26,6 @@ static const u8 a523_r_irq_bank_muxes[SUNXI_PINCTRL_M=
AX_BANKS] =3D
> >  static struct sunxi_pinctrl_desc a523_r_pinctrl_data =3D {
> >         .irq_banks =3D ARRAY_SIZE(a523_r_irq_bank_map),
> >         .irq_bank_map =3D a523_r_irq_bank_map,
> > -       .irq_read_needs_mux =3D true,
> >         .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL,
> >         .pin_base =3D PL_BASE,
> >  };
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinc=
trl/sunxi/pinctrl-sun55i-a523.c
> > index 7d2308c37d29..b6f78f1f30ac 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> > @@ -26,7 +26,6 @@ static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX=
_BANKS] =3D
> >  static struct sunxi_pinctrl_desc a523_pinctrl_data =3D {
> >         .irq_banks =3D ARRAY_SIZE(a523_irq_bank_map),
> >         .irq_bank_map =3D a523_irq_bank_map,
> > -       .irq_read_needs_mux =3D true,
> >         .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL,
> >  };
> >
> > --
> > 2.43.0
> > =20
>=20


