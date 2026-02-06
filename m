Return-Path: <linux-gpio+bounces-31492-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFA5CffjhWnCHwQAu9opvQ
	(envelope-from <linux-gpio+bounces-31492-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 13:52:07 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB8BFDB98
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 13:52:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46A883039305
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Feb 2026 12:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142223B530D;
	Fri,  6 Feb 2026 12:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CxWs6Qdx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7A63D3D0A
	for <linux-gpio@vger.kernel.org>; Fri,  6 Feb 2026 12:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770382232; cv=none; b=m045zI27oavDdawNxZy3I0+KDF07Oz/3UiXZNGU8xfNovBrZzHOERJV6IBlTRnj9L/cPD1AAz8FPDk/9rGg/Im665KB7xet24ErDPfyy0c5v2axSu4H57JXkmIXXQOURwLtAHGLqEjVencZCClf7zCae9K41YplF7g44QXiOuLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770382232; c=relaxed/simple;
	bh=v/19RVbcpuTIGxbuXeb4ZtmU7F+LfHpGctBk8u5FM8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d8yEekE13hb2z9DeVYkyfUmZYc4KQID49XbNsIf8swZx25MiE2spkj5bDjd7uopyfI7A9cox1r0DjhDWB7Mjs5NKy489GqvBUVdprubVCvkLhUch0Ph2FTYAfxu33Iff3OBLeqC0ybPcZ8z/oQa680Gu0crZZy4rVcQHSU5njIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CxWs6Qdx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8241AC116C6
	for <linux-gpio@vger.kernel.org>; Fri,  6 Feb 2026 12:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770382232;
	bh=v/19RVbcpuTIGxbuXeb4ZtmU7F+LfHpGctBk8u5FM8A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CxWs6QdxzudD+cADgI9kk72SezQfAEZu887Psbqkxq/9h9EtSPi0xz0EQHY+Me2aR
	 G+caqMzOWs7+a5VY9Mq/L/iJ/fmxylOrWLefczBR76QI4/B8FxMFDO02u3bbh1AKnm
	 0Kq7UeSAHZPS/8PpyqYqdEco8yD0D5TdXlXsS/a2uNgXtlWMDBgTRO9gzpZuUHeAb5
	 eDXy58knIoq7MyqhxJtHMG47KZ8NfgvdiNnJx2KpQKPhGZQKNDrNKFHndEq4Ye2sDp
	 zxJ5cOhaALpaBhtylTz8vMWCDWXSOVqNcJwUQANeTcFACvB7FRkAvw0/q8a/q579+a
	 cp0RChCm7tO8A==
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-649ba412cd4so2043861d50.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Feb 2026 04:50:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWBCdExoCczXBxaT1+xrjgf4H/DLTl3kFyrxh5pat5+TRw3IiuQ94T3ebZlI1bnXO5HslWGr/Co28QN@vger.kernel.org
X-Gm-Message-State: AOJu0YxXNeSs+jRgset042RBra4YHbE6zLgPvb0CdA1/Pe0A9LY93J1o
	xiqaIt1YoNVtzbsdaro6H43S7x3+4kjmYL4eN2rEmkNdVG3H8ZYXpkvZVht/LhbNF+sJQ73I+wu
	M+9TwDMdAwrhTQnOFkZ/OxEM+XGfOA0U=
X-Received: by 2002:a05:690e:40f:b0:649:c36a:a9d5 with SMTP id
 956f58d0204a3-649f1ea5375mr1789712d50.32.1770382231852; Fri, 06 Feb 2026
 04:50:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com>
 <CAD++jL=OXJdJZpjbo0_C03vcgPe5btum-J0uifvSJkMaUWG-=w@mail.gmail.com>
 <OSQPR06MB725257E71F0B7F7F1013263D8B98A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <20260206042215.GA5376@atomide.com> <OSQPR06MB7252ADEF2CB075BC40AD7DB68B66A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <CAD++jLm2a1-G7QQBb+u68DH_RT6kc4=vpqZWQcirvWrcRjw+5Q@mail.gmail.com> <OSQPR06MB7252D5BCD40BDF2A91FF41438B66A@OSQPR06MB7252.apcprd06.prod.outlook.com>
In-Reply-To: <OSQPR06MB7252D5BCD40BDF2A91FF41438B66A@OSQPR06MB7252.apcprd06.prod.outlook.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Feb 2026 13:50:21 +0100
X-Gmail-Original-Message-ID: <CAD++jLkqpRrcgQ2JvbHJY3NQ=KHi8T91aOg2KvAmkVAXAEzH-A@mail.gmail.com>
X-Gm-Features: AZwV_QjznRiO3R7PrXKwCTjHHZVk1DsnLknrKSsSuWnvcVQBwBcOJl2iW8ROiqE
Message-ID: <CAD++jLkqpRrcgQ2JvbHJY3NQ=KHi8T91aOg2KvAmkVAXAEzH-A@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: single: bit-per-mux DT flexibility, probe
 robustness, and consistent pinconf offsets
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>, BMC-SW <BMC-SW@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31492-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,aspeedtech.com:email]
X-Rspamd-Queue-Id: ABB8BFDB98
X-Rspamd-Action: no action

On Fri, Feb 6, 2026 at 12:34=E2=80=AFPM Billy Tsai <billy_tsai@aspeedtech.c=
om> wrote:
> On Fri, Feb 6, 2026 at 8:24=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.=
com> wrote:
>
> > > I understand the preference is to keep pinctrl-single minimal and mov=
e
> > > the bit-per-mux handling into a separate, more targeted driver built =
on
> > > top of the GENERIC_PINMUX/GENERIC_PINCONF helpers, rather than extend=
ing
> > > pinctrl-single itself.
> > >
> > > Based on that, I=E2=80=99ll look into refactoring this into a
> > > pinctrl-single-bit style driver that covers bit-per-mux / bit-per-pin
> > > layouts generically (including AST2700), while keeping pinctrl-single
> > > focused on the simpler register models.
> > >
> > > One additional point I=E2=80=99d like to raise is the handling of pre=
-reserved
> > > MMIO regions.
> > >
> > > On AST2700 systems, the SCU register range containing the pinctrl
> > > registers is commonly reserved by a top-level syscon node or by firmw=
are.
> > > In this setup, devm_request_mem_region() can return -EBUSY even thoug=
h the
> > > registers are valid and intended to be shared, which currently causes=
 the
> > > driver to fail probing and leaves pinmux unconfigured.
> > >
> > > When moving to a separate targeted driver, would the preferred approa=
ch
> > > be to treat this condition as a warning and continue probing, or is t=
here
> > > an alternative pattern you=E2=80=99d recommend for handling shared SC=
U-style
> > > register blocks in pinctrl drivers?
>
> > Can't you just base this entire driver on syscon which uses regmap-mmio
> > to abstract and solve this problem?
>
> > The syscon is entirely designed as a singleton owning all registers
> > and handing them out to subdrivers.
>
> Agreed that syscon/regmap would be ideal. The main issue with
> pinctrl-single is that it is fundamentally MMIO-based: it always
> requests and ioremaps the register range and performs raw MMIO accesses,
> with no regmap integration. Adapting it to act as a syscon consumer would
> require a larger architectural rework of the driver.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/pinctrl/pinctrl-single.c?h=3Dv6.19-rc6#n230

These comments were under the assumtion that you do what Tony & I
suggested and create a completely new driver for these use cases.

Sorry if it was unclear.

Yours,
Linus Walleij

