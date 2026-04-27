Return-Path: <linux-gpio+bounces-35630-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEtIHEjM72knGAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35630-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 22:51:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EB74F47A4A7
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 22:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B74F302B50A
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 20:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6458639525E;
	Mon, 27 Apr 2026 20:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E3MSBf3p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9C23932E0
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 20:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777323037; cv=none; b=KdJmku0Ce1RuD/2CvvQL2GNx47FVUltV7d3RvcBfb6gW3a7EtmoyecLfxmtRbplvFvYl7Jj/kdH6w/jOcH+h41QeQ0IO4X9gaBqc598cCyjuXLXwnPCeVsl44IRASUzNrlJpRaBwfPJ62jbJnnXGMtVaQDRhNKngwmChVegC+ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777323037; c=relaxed/simple;
	bh=LS7UeFCYENZ9Xd/KmF8dbXXziMoWhhO1+Zz/OyxlBBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SgSsa/w4mXFW2kWTuSTFqevXodzoA/IHTl1He4jZMBvGGprw+3+OFjhPYzkX6c07e2iTMNDpGHOeTlmi19ymmdPazgzL8+dV2zdWcnxVFGQqXpR+frI5zyh2mScjKx0/PGnrn+yQ5dX58MxOeIshLM6YyQZBY/smufTUKBAPjFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E3MSBf3p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 595D0C2BCC4
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 20:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777323036;
	bh=LS7UeFCYENZ9Xd/KmF8dbXXziMoWhhO1+Zz/OyxlBBk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E3MSBf3pk3wwnNPFMzp1z1nVz6t1Xj7EayjcLrC5JOyu74LCaGcgIhk0FdcVjsEga
	 vUvKo3y3SZXXrbn7TdUYgOXjWAKiiCgs2NKcJfYubTZd8Md6D3EN7AD4zi1BfVwbpS
	 WNvzyVPxXyfScZmpQgR8Zyc3NSpWLQlR2J0t7TVmbg5JjWcgUmCNVP4aFOfawR5JGa
	 0r0qbprcow33GerK0DWcBcB7tJMI9CPlCCfvBgGuwH4wVroFcEE494JnsHUKVnZmzC
	 QF8r9X+GBu7HVM7w09KCK08ONFrRfwr1SvlYHqndehJwWIKPoVfohZ2q7FxsiZ0WYL
	 VT805+Yi2VThw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38e7d984096so117523621fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 13:50:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8ADRrHKi2xpkIeyo3DNJ5GSfcYwwWd3h/Txf+JZuV2yAZuZtIhgVdfvu0ui1ZnUjitsaHiPQBhb9eq@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzk3i73FUEl8DMHYunxsn16jPFPa3+MyYiR2tPBHNKzttpY1aN
	NUV41u/kAck64xXeyyp6Ma361vEnwyFiWpaqDh7cEauCNL0cbvM9IVyPckR9aUApV7uCqhiSy2+
	4V3gmRBJ55ecQ5jH5l/JdrPy1iXT5yDQ=
X-Received: by 2002:a05:6512:3f18:b0:5a3:fe5e:3d49 with SMTP id
 2adb3069b0e04-5a746626a7dmr115073e87.23.1777323035055; Mon, 27 Apr 2026
 13:50:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424-ds90ub953-v6-0-7a84efbab316@oss.nxp.com>
 <20260424-ds90ub953-v6-1-7a84efbab316@oss.nxp.com> <CAD++jLmi1Q4sGeY6vK7fxw8AdCmiiW-8kdEi4OFkV1xep=Od_A@mail.gmail.com>
 <AS8PR04MB9080113A71D87E952561FC53FA362@AS8PR04MB9080.eurprd04.prod.outlook.com>
In-Reply-To: <AS8PR04MB9080113A71D87E952561FC53FA362@AS8PR04MB9080.eurprd04.prod.outlook.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 27 Apr 2026 22:50:23 +0200
X-Gmail-Original-Message-ID: <CAD++jLkuDWPd5KsKTpQ=htyupaXEwkPt_jV+RNngs+TTVkYSkw@mail.gmail.com>
X-Gm-Features: AVHnY4LMs19qECeHOCX1rdutVu9oADk-D7aG7FAXma_lqqC3H1U5IuEltiXqiKY
Message-ID: <CAD++jLkuDWPd5KsKTpQ=htyupaXEwkPt_jV+RNngs+TTVkYSkw@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: media: ti,ds90ub953: Add support for
 remote GPIO data source
To: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "G.N. Zhou" <guoniu.zhou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: EB74F47A4A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35630-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,mail.gmail.com:mid]

On Mon, Apr 27, 2026 at 11:13=E2=80=AFAM G.N. Zhou (OSS)
<guoniu.zhou@oss.nxp.com> wrote:
> [Me]

> > I understand that the driver needs to deal with this in a per-gpio-line=
 basis
> > though, have you considered:
> >
> > 1. Just hard-coding this into the driver based on the .compatible
> >   string, if the remote GPIOs are always the same for this TI thing?
> >
> > 2. If it is just for one particular system, you *could* actually have
> >   a table/mask inside the driver for this:
> >   if (of_machine_is_compatible("my-funky-system")) which will
> >   kick in only on that very machine,
> >
> > 3. If you really want to store the information in the media i2c
> >   device node, add some custom property like this:
> >   ti,remote-sources =3D <0x0000001f>;
> >   where a bit is set to 1 for each GPIO which is remote.
> >
> > Putting flags on the GPIO lines themselves seems too complex and system=
-
> > specific.
>
> Thank you for the detailed feedback.
>
> After considering your suggestions, I think option 3 (custom device prope=
rty)
> is the most appropriate approach for this case.

Why is that the most appropriate?

I think (1) is most appropriate, if the hardware with this compatible
always looks like this. You need to answer the question if this
is a per-system flag for the GPIO lines or something that is *always*
applicable for a device with compatible ti,ds90ub9NN-q1?

If it for example always applies to ti,ds90ub971-q1, then make that
compatible decide how to handle indvidual line, just write
code for it. That is case (1).

If this setting depends on how the serializer is integrated and the
remote setting may apply to some systems with this device and not others,
you have options (2) and (3).

> However, I initially implemented this using a custom device property
> (ti,gpio-data) in v1 [1], and Vladimir rejected that approach.

Vladimir is saying that the driver code should handle this
without any extra DT properties. That can be done with approach
(1) and (2). But I don't know about that.

I think the basic problem with the patch is that no-one (myself included)
apart from you understand what a remote serializer is, why it is
remote and what that means, how the mechanism between the
components making up this essentially works etc. I.e. a much
longer and more detailed commit message and binding explaining
very cleary what this is and how it works and why the special
property is needed on some lines, and how it is a property
of some specific way of integrating this GPIO controller.

If a custom property should be used ti,gpio-data is too generic,
come up with a property name that actually says what it is all
about and which anyone would understand. "gpio-data" is a
bit "the thing that does the thing" and overly generic term.

Yours,
Linus Walleij

