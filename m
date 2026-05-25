Return-Path: <linux-gpio+bounces-37425-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yByADhYDFGquIQcAu9opvQ
	(envelope-from <linux-gpio+bounces-37425-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 10:06:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC385C7719
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 10:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 071BB30146A9
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 08:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B713D9027;
	Mon, 25 May 2026 08:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fDLEwigv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402513D890D
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 08:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779696398; cv=none; b=GBz03RMyvBo5wxjHWEGzi6V2+bZNGSD7UDVS4nOk77wbIACksXI0Jbu3fzhLuvtwEQrQtr1AXJ+hYGmNPFU3boUZShTTawHbBmXB1S9mGRCgTuiLfAYNozT2zjobH6pLCTFCHsMwF78KPHi4LjeJnIfJCH7RKd4S4Zo30kIjryU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779696398; c=relaxed/simple;
	bh=XBdwrpDpVLZphgnQqjfINiqHGCa1lpywck29IxJWjLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c1hL45sdeQPDIXlVqX/24ibEhWLRF3ACZolAhsQrI0pnoyu0m3PhgqTV6bH3SkPb4S4AIOMw9jvQmUJ3w/Cm5dfKAIYNEugP6qyGSW8bhFmq4yr732noxCLjaud7V83PoZFShELDdIvdYZ2Feh3vuJl+Tasd4i+Oz0oOFDjwLNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDLEwigv; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F366F1F00A3F
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 08:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779696397;
	bh=XBdwrpDpVLZphgnQqjfINiqHGCa1lpywck29IxJWjLU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fDLEwigvfx3SKEy+abqKr/OzEu8M1uZr5lZwv82fmKYtK+YvG9058zhlwLGw4oST5
	 0478577WUe+Uc5wobNxLnJxUxHa0w2WEc4p42UrWv0+7pcuOFtgl5uQywyTZ7VPHod
	 m5h2YUwU66j6aPQnq84kLOkJiAEg6CCu5bJ6qOal41l2D+aYc8NwfZslUrXD3TEXEo
	 mdqDKnNJXIYIGlGCmp01Qc8O939wTaNiQ0pd7s7tO2h+dEgrhDnjIz6ydkBi29LCXe
	 UCHXvyb1Ig/C7O67TkPG3ciG5fITPX7NAAC6/M4R671dFZbM76Lk0FYLmh0crQXTpu
	 Imm1SJsoC+Ebg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a742b8b72eso10501498e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 01:06:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8H5x+uHm8uC1QRMjhh2BGeDSxi1Cgfqh5F2VoGkwITd6ODPDW2ld1CriRMLoWjDtC+sAy79Gq6+v1d@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Qe9vQYQctJwH1md5CCwt/KKQbYyH3dOIN75aGGybrlY00sC7
	0jChuZwAchfWBkS8e3Yo+dhATsOnTrqayc+TRU9FQ5SwGn7cGM44Ait8VWkIqh08/qmdluJJepS
	jHSaqG9ar/SGBlqytLb6SKp/CSIOU5wI=
X-Received: by 2002:a05:6512:692:b0:5a8:fc25:3843 with SMTP id
 2adb3069b0e04-5aa323a49d0mr3894276e87.39.1779696395729; Mon, 25 May 2026
 01:06:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521-pinctrl-single-bit-v5-0-308be2c160fc@aspeedtech.com>
In-Reply-To: <20260521-pinctrl-single-bit-v5-0-308be2c160fc@aspeedtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:06:23 +0200
X-Gmail-Original-Message-ID: <CAD++jLnxMGux88CCXH70hwEGiQXn9FCJ=vucLaS=JLhp_C48VQ@mail.gmail.com>
X-Gm-Features: AVHnY4LaI0HREPthKKhQrYPPwj27_NpiZglEh2S216je37LkMgP9M9Luyc3lYsg
Message-ID: <CAD++jLnxMGux88CCXH70hwEGiQXn9FCJ=vucLaS=JLhp_C48VQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] pinctrl: aspeed: Add AST2700 SoC1 support
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>, 
	Lee Jones <lee@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, patrickw3@meta.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com, 
	openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, linux-clk@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37425-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,aspeedtech.com:email]
X-Rspamd-Queue-Id: AEC385C7719
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 11:17=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.=
com> wrote:

> Legacy ASPEED pin controllers have historically not had a coherent
> register interface. Control fields often had no consistent mapping to
> individual pins, and configuring a function frequently required
> coordinating multiple control bits across several registers. As a
> result, the existing ASPEED pinctrl drivers rely on complex macro
> infrastructure to describe the dependencies between pins, functions,
> and register fields.
>
> The pin controller for SoC1 in the AST2700 breaks from this legacy
> design.
>
> For SoC1, each pin maps directly to a dedicated function field in the
> SCU register space that determines the active mux function for that
> pin. This results in a much more regular register layout compared to
> previous generations.
>
> While the behaviour is conceptually similar to pinctrl-single, the
> register layout and configuration model differ enough that reusing
> pinctrl-single directly is not practical. Therefore this driver is
> implemented as a SoC-specific pinctrl driver using static data tables
> to describe the register layout.
>
> The binding reuses the standard pinmux and generic pin configuration
> schemas and does not introduce any custom Devicetree properties.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Patches 2 & 3 applied to the pinctrl tree, thanks Billy!

Sashiko is moaning about something, look into it but my confidence
is low since it is using weasel words like "critical" for things that are
certainly not critical, if there is some validty to these comments it
can certainly be fixed up in-tree.

Yours,
Linus Walleij

