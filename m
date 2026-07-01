Return-Path: <linux-gpio+bounces-39308-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9jelAd30RGr+3woAu9opvQ
	(envelope-from <linux-gpio+bounces-39308-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 13:07:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DADE66EC8F6
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 13:07:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=T7kun4Fs;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39308-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39308-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 812A23061E88
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 11:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78CBE43E4A4;
	Wed,  1 Jul 2026 11:04:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1917E43E48B
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 11:04:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903872; cv=none; b=G79GhQzA8luelIBZsMwCnCZFIrJfAdEbayyP2Y59mVmi4KriFQcUkQ87IRWsmbjX2TgyGsR4dNiION87k+JJqiWzGeZl/KZDnuU9IIkDhuCovVjJOi1fSRsNmmHhSJxTv8cGlq7wqBb7IFv8QGoIh0DfRS/k35wtYHAeN8AtQUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903872; c=relaxed/simple;
	bh=GZVdHF4RDDIw1GGyB47+k+m0XFHhbNyNGeWh/pCWjI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJlC8rTlndwNKUccNj3ZG2simpcVyOEfNUZZthyRKpMYA08OP1cT8rn108ba98ZIW3OGgL4svyahGim9uAkzz3RVgtsJyjnQlCTbguFGBGKxrshbRpYAoTK5nq6F+aCkQfuK1ass6bK5RrmmcocnsS9RnKiklb8Pp5EkvycmK/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T7kun4Fs; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B83961F0155A
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 11:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782903870;
	bh=GZVdHF4RDDIw1GGyB47+k+m0XFHhbNyNGeWh/pCWjI8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=T7kun4FsQTg4nrByttcWF1XbAF9a1nz/xm5VEJGp6Vq6BvL4piRhl7pnpTSZaSsAv
	 o6vdGU5xtAPraiD6B8Aj1/xzLT/BeVvkRC60esDutv8NozfP303xB30G/dkU11VQby
	 BCcSNqv7e1MxVhEn3YG/ioapS6k5K4ypOjvOw3wlw9hBJ8M2p0awlpsfBQ0a+O3737
	 mfv8x7Ua6KnSPEuq53FbqNlRluTh+MLzo8GXEiNL5QA5BSyaGV9alRGPJvugzgZS8X
	 9x92fFNjHvpI/PYVIpjbqHZ1GQ7hyktFB9uCLU1mJC3CmOHgC5FWsCeEpNTD8BhjUj
	 3CcMF6KgvliIw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39b1eb7bd9bso5072061fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 04:04:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rofrs+4d2ul5YEivnfKBGpebZFD7kIZ+skTs4i/9guxqwds9v5ohg9rlWcDS3jxyjBVydF2GxpdYap6@vger.kernel.org
X-Gm-Message-State: AOJu0YwPO7R8tTSVRq7cA6ITTv3TOTvFugoRV00undzfcCmG/AbSCcUd
	WzxPTr781buACOC1GIbK4rmW7rLxf17qcSt4G7+xv310sZT53IBlRGi2QKIFZdSqzv+JXt1ZYpP
	w8zC1hL1DsVrdXE1vnLW0bAAd0i4Wx3A=
X-Received: by 2002:a05:6512:2457:b0:5ad:abf:1e1a with SMTP id
 2adb3069b0e04-5aec678e6bcmr286502e87.5.1782903869487; Wed, 01 Jul 2026
 04:04:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622092335.1166876-1-eleanor.lin@realtek.com>
 <20260622092335.1166876-2-eleanor.lin@realtek.com> <CAD++jL=6pqEA0-vs_J57MnhmLmLwrTj7-syOL8E7PLYW-vUBvg@mail.gmail.com>
 <56be68cba7d9461d9a1ec66ed1a1417a@realtek.com>
In-Reply-To: <56be68cba7d9461d9a1ec66ed1a1417a@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 13:04:16 +0200
X-Gmail-Original-Message-ID: <CAD++jL=1mqDetG-+DW_Loj5Ufp_v5DmLN+T9pM_28dAASHHRzA@mail.gmail.com>
X-Gm-Features: AVVi8Cd5VWiNZ8yCkmPmPqgDgJBXqd110lMfJ3ncCbilkzR-pzDuizM2gwBEdko
Message-ID: <CAD++jL=1mqDetG-+DW_Loj5Ufp_v5DmLN+T9pM_28dAASHHRzA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
To: =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Cc: "brgl@kernel.org" <brgl@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"afaerber@suse.com" <afaerber@suse.com>, "mwalle@kernel.org" <mwalle@kernel.org>, 
	"andriy.shevchenko@intel.com" <andriy.shevchenko@intel.com>, =?UTF-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>, 
	=?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>, 
	=?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>, 
	=?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39308-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:eleanor.lin@realtek.com,m:brgl@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:afaerber@suse.com,m:mwalle@kernel.org,m:andriy.shevchenko@intel.com,m:tychang@realtek.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-realtek-soc@lists.infradead.org,m:cy.huang@realtek.com,m:stanley_chang@realtek.com,m:james.tai@realtek.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DADE66EC8F6

On Wed, Jul 1, 2026 at 12:41=E2=80=AFPM Yu-Chun Lin [=E6=9E=97=E7=A5=90=E5=
=90=9B]
<eleanor.lin@realtek.com> wrote:

> To clarify the hardware design: this SoC does not use a banked GPIO
> architecture.
>
> Each GPIO pin has its own dedicated 32-bit control register that handles
> both GPIO configuration and interrupt settings (e.g., edge/level enable).
> The only exception is the interrupt status register, which is grouped int=
o
> 32-bit words.

Aha, I get it!

> Since physical GPIO banks do not exist, using a 3-cell <bank offset flags=
>
> format would misrepresent the hardware. Therefore,
> keeping #gpio-cells =3D <2> and #interrupt-cells =3D <2> is the most accu=
rate
> reflection of the actual silicon.

Hmmmm I would argue that the way the interrupts are routed into a
single 32-bit register for 32 GPIOs would be an argument for using
#interrupt-cells =3D <3> but it would be confusing to use a mixture of
2 and 3 cells for GPIOs and interrupts, so I guess 2 is OK for both.

Yours,
Linus Walleij

