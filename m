Return-Path: <linux-gpio+bounces-31576-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEFWClngi2kVcgAAu9opvQ
	(envelope-from <linux-gpio+bounces-31576-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 02:50:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 792BA120888
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 02:50:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADBB830579EE
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 01:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8A82C032E;
	Wed, 11 Feb 2026 01:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="j2aso4Ro"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FE71DF748;
	Wed, 11 Feb 2026 01:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770774540; cv=none; b=GmC+sls6a25RuvjWX930uDuIknV0l/C8zMRoMup9vpGlm29/kjtdXGqzc6eUwFp6hnCLpGUT+Bv4phpeUG+1dJnb2upm+zekiNvyMBHDVeAObPOGEnqlBAv7XD5zVfHfCmWNn3p3DAehG5DaBjCHcCeUnwH/3Gyb+xDcAOEQEMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770774540; c=relaxed/simple;
	bh=EakT1hLowwtmKPzAINUoQ/hf7LzQVPrsfk76ZwhNbgw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hKQVhaIAFOiISNmTBf2H7xPwbT+aBvPsCFv+04dgtOK+OO+BQtzN2QJHHMhuKPdMljpjYyWrT2W+ZciLolpWn2e+Dvds0w8xTHnZ5V59JMMVz46tkSiEDAGd7F0DYrYt8ngtagXJVRxP74BwsamOm1rZxE6/bnwVU+j8viPpj9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=j2aso4Ro; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770774535;
	bh=EakT1hLowwtmKPzAINUoQ/hf7LzQVPrsfk76ZwhNbgw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=j2aso4RoraIWSto2koPfLCJtWXbahxGOS4F92RyaOGH+78Q8Q9iIZ/eUuvTp27cwz
	 SXvrqpP9nSmfrOmTGeATd/1wAYIwQvsIZFajhF7jfm0Kgh4M0HCrBs0ndy+GINfUCx
	 xRPl4KwOJ0Zm7YQZOn34RsRkKdxWo4QH3BxhM2nvpfOg8bvm9QHprtvgy1serdTxng
	 +aXDiqbUrJfbEz9rqIpQ8lqGgBruyDHeFYJn68/nSjvvg/OV4jzL3dyO45qrSM58yu
	 J2l8WGLBGkO349u/X+M8/a62r6cVK2mPWHQfGYyN/SPJ6l3W1g0IySz4rpDjqVH4f4
	 bbWnqCOBWwlcg==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7CA69603B4;
	Wed, 11 Feb 2026 09:48:53 +0800 (AWST)
Message-ID: <15b7c7cd97cc974605ffd79125d641ba159587f5.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 0/3] pinctrl: single: bit-per-mux DT flexibility,
 probe robustness, and consistent pinconf offsets
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, Tony Lindgren
 <tony@atomide.com>,  Linus Walleij <linusw@kernel.org>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>, 
 "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "linux-omap@vger.kernel.org"
	 <linux-omap@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	 <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Date: Wed, 11 Feb 2026 12:18:53 +1030
In-Reply-To: <OSQPR06MB72526DA818EACDE2931BA0168B62A@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: 
	<20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com>
	 <CAD++jL=OXJdJZpjbo0_C03vcgPe5btum-J0uifvSJkMaUWG-=w@mail.gmail.com>
	 <OSQPR06MB725257E71F0B7F7F1013263D8B98A@OSQPR06MB7252.apcprd06.prod.outlook.com>
	 <20260206042215.GA5376@atomide.com>
	 <OSQPR06MB7252ADEF2CB075BC40AD7DB68B66A@OSQPR06MB7252.apcprd06.prod.outlook.com>
	 <CAD++jLm2a1-G7QQBb+u68DH_RT6kc4=vpqZWQcirvWrcRjw+5Q@mail.gmail.com>
	 <OSQPR06MB7252D5BCD40BDF2A91FF41438B66A@OSQPR06MB7252.apcprd06.prod.outlook.com>
	 <CAD++jLkqpRrcgQ2JvbHJY3NQ=KHi8T91aOg2KvAmkVAXAEzH-A@mail.gmail.com>
	 <OSQPR06MB72520084144325D548E36AD78B65A@OSQPR06MB7252.apcprd06.prod.outlook.com>
	 <CAD++jLkB26XNAosUdD2BigLw+=Hd6+VBsmv0fHawQ25e8rQhrQ@mail.gmail.com>
	 <20260209144250.GC5376@atomide.com>
	 <OSQPR06MB72526DA818EACDE2931BA0168B62A@OSQPR06MB7252.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31576-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,codeconstruct.com.au:mid,codeconstruct.com.au:dkim]
X-Rspamd-Queue-Id: 792BA120888
X-Rspamd-Action: no action

Hi Billy,

On Tue, 2026-02-10 at 06:28 +0000, Billy Tsai wrote:
> > * Linus Walleij <linusw@kernel.org> [260209 09:51]:
> > > On Mon, Feb 9, 2026 at 3:25=E2=80=AFAM Billy Tsai <billy_tsai@aspeedt=
ech.com> wrote:
> > >=20
> > > > To make sure I align with your expectations:
> > > > 1) Would you prefer the new driver to be fully standalone (using th=
e
> > > > =C2=A0=C2=A0 GENERIC_PIN* helpers + syscon/regmap-mmio), rather tha=
n trying to
> > > > =C2=A0=C2=A0 refactor/export helpers from pinctrl-single?
> > >=20
> > > Yes. Conor improved these helpers so now it should be possible
> > > to use these to do a very simple and slim driver for what you
> > > want to do.
> > >=20
> > > > =C2=A0=C2=A0 Action item: Introduce a new pinctrl-single-bit.c driv=
er and DT
> > > > =C2=A0=C2=A0 binding, which can also cover the existing bit-per-mux=
 logic currently
> > > > =C2=A0=C2=A0 in pinctrl-single.c.
> > >=20
> > > Sounds about right.
> > >=20
> > > > 2) For the syscon/regmap hookup, is it acceptable to add a syscon p=
handle
> > > > =C2=A0=C2=A0 property in DT (e.g. "syscon =3D <&scu>;") for the new=
 driver to obtain
> > > > =C2=A0=C2=A0 the regmap, or do you prefer a different binding/prope=
rty name?
> > >=20
> > > This works for me.
>=20
> > Great, sounds good to me too!
>=20
> Hi Tony & Linus,
>=20
> Thanks again for the earlier guidance =E2=80=94 that was very helpful.
>=20
> I wanted to double-check one remaining detail around the syscon/regmap
> hookup. As discussed before, using an explicit syscon phandle on the
> pinctrl node (e.g. syscon =3D <&scu>) is fine from my side, and I
> understand that approach is acceptable.
>=20
> Andrew also pointed out that, for AST2700/SoC0, the SCU is moving towards
> an auxiliary-bus based model, where subfunctions such as pinctrl are
> instantiated as auxiliary devices by the SCU driver itself, with the
> pinctrl node appearing as a subnode of the SCU binding. In that setup,
> the pinctrl driver would obtain the regmap from its parent device rather
> than via an explicit DT phandle, similar to what is discussed here:
> =C2=A0 https://lore.kernel.org/all/459f84c56a5010910ecbf8b445c092674f0606=
91.camel@codeconstruct.com.au/
>=20
> Before proceeding, I wanted to confirm whether this auxbus-based approach
> for the new pinctrl-single-bit driver would also be acceptable from your
> perspective, given that it avoids introducing a generalized DT-based
> syscon hookup up front and aligns with the SoC0 direction.

While how we describe the hardware in the devicetree is important, the
impact on the driver is ultimately some glue code. I think the thing to
prioritise right now is the design, implementation and testing of the
bit-per-mux functionality, less so how we get the driver bound to the
device and retrieve the syscon.

The proposal I made in the message you linked is a bit speculative at
the moment. It needs buy-in from the DT maintainers as it proposes some
rework of what's already in-place. That needs thought, but perhaps it
can come a bit later. For now you could write a proof-of-concept
implementation of the glue code for testing purposes (which we may
replace once we resolve the binding discussion).

Andrew

PS: However, regarding the syscon property itself, it's probably worth
paying attention to the "=E2=80=9Csyscon=E2=80=9D is not a generic property=
" note in
https://docs.kernel.org/devicetree/bindings/writing-bindings.html#typical-c=
ases-and-caveats

