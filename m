Return-Path: <linux-gpio+bounces-36613-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGDzIX82AmocpAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36613-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 22:05:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0425156FF
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 22:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCD683014C3A
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 20:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B3D37DE8D;
	Mon, 11 May 2026 20:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nt3Ua8ch"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DE93242AB
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 20:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778529904; cv=none; b=pV5L5jJ0YUthf3jeIFwe4t0tO8LmllB664wFhLI9CO8TZ9UdzOp/fElrkV8+UXw6I89mzEqTiVQETKwbQiT/oFUzRfBDvxzey2hhCENcR5X/xalpJzPPZRyJdNjyjl0QdXLR7XvuKZn31L+BOLdufVQrr3QgLZPqLZ1psGWEC98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778529904; c=relaxed/simple;
	bh=vifrlnSm2hwvPtyavVza6RSqJuHvkSa7YEqnDg6i8hI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ggtyevSKbH70u3ws3+EEL8aydstPOOYB/mDEpsNgumPgbDEQyeNjNh6o8w84gwWNI3ziR/WSNU6aFSdXoYVN+8ce2l7Qli70VB4Nx92AszpkQVHFYOgSdA79JrzIeA/KIr61SYeH/9WmXvJWFN6eHXy/06K5I+imzgPZnvzTLBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nt3Ua8ch; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C96C2BD05
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 20:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778529904;
	bh=vifrlnSm2hwvPtyavVza6RSqJuHvkSa7YEqnDg6i8hI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Nt3Ua8chsChWviUtf3nByVpkkunRyWEk+lT4AotDC9Y05Z3PHcf4uvVkTAmdFJuDv
	 s0KcDVTcLlF6KKv723rdN5giJIJLedqFepwwUSt9yplhxFPiNWsVhOtEd0OUoygCsC
	 9A+yD2JsJ2gqpGysBftNJ27epa4O4oyINB0D6HGTZ/355ObItcJrciIx4zF8LAJRBd
	 H1PPFlmgr/uTHGxyIpf6cX+sDcQhcPLsYt6YhCoOQwAigAocoMdMXzoCO75pyc8V5u
	 Iz5LD9vcUWvh8HzOLBEuXOZIw23m8RPWXzpxADikZnwyd4o5qsM2hf3wIENp7X0URd
	 jMXZsTsI0YMpg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a85b30dd54so4841699e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 13:05:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/eo0oIJeMZCSaQe+uGzlQ+K0/G4KOw7lfJrKtF6sY4emIQn1XI2+DUo2qRnVm6zN8fHquzR08JZ6Db@vger.kernel.org
X-Gm-Message-State: AOJu0YxlNKeU/55iIIwA1znKpvCTlkhkYwYWWmKP643SOxDRdIEp5zrP
	wKcm67YQqkPeqMVTs+2askMs1CTvdUH/niQg41CV+Q5HcaSuDk6BxdbCoCYhv+7n2wMhHEdtzbR
	28L0JytfuUovJUTco+LQIrNvNvOA2IYk=
X-Received: by 2002:a05:6512:3b21:b0:5a8:6793:e701 with SMTP id
 2adb3069b0e04-5a887ce64c1mr7724276e87.33.1778529903006; Mon, 11 May 2026
 13:05:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506-upstream_pinctrl-v9-0-0636e22343ad@aspeedtech.com> <20260506-upstream_pinctrl-v9-2-0636e22343ad@aspeedtech.com>
In-Reply-To: <20260506-upstream_pinctrl-v9-2-0636e22343ad@aspeedtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:04:50 +0200
X-Gmail-Original-Message-ID: <CAD++jL=3p9BvDgaot3=emM4Zn5jU-ZAUKtB4UwT1HzDiyzKq4Q@mail.gmail.com>
X-Gm-Features: AVHnY4JtxK2F1JLguIEb3zBOcAZHVynLHNdMopJnlqbcSYRx0cEplr-yGb19hdA
Message-ID: <CAD++jL=3p9BvDgaot3=emM4Zn5jU-ZAUKtB4UwT1HzDiyzKq4Q@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] dt-bindings: mfd: aspeed,ast2x00-scu: Describe
 AST2700 SCU0
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: EF0425156FF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36613-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,aspeedtech.com:email]
X-Rspamd-Action: no action

On Wed, May 6, 2026 at 10:07=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.c=
om> wrote:

> AST2700 consists of two interconnected SoC instances, each with its own
> System Control Unit (SCU). The SCU0 provides pin control, interrupt
> controllers, clocks, resets, and address-space mappings for the
> Secondary and Tertiary Service Processors (SSP and TSP).
>
> Describe the SSP/TSP address mappings using the standard
> memory-region and memory-region-names properties.
>
> Disallow legacy child nodes that are not present on AST2700, including
> p2a-control and smp-memram. The latter is unnecessary as software can
> access the scratch registers via the SCU syscon.
>
> Also allow the AST2700 SoC0 pin controller to be described as a child
> node of the SCU0, and add an example illustrating the SCU0 layout,
> including reserved-memory, interrupt controllers, and pinctrl.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

This is an MFD patch in the middle of a pinctrl series, I think Lee
should apply this.
FWIW:
Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

