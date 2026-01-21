Return-Path: <linux-gpio+bounces-30863-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QG3sFU3McGkOaAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30863-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 13:53:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDEF571DA
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 13:53:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1491770D361
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 12:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA402BDC32;
	Wed, 21 Jan 2026 12:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UnVC/BhA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C34A22259F
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 12:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768999364; cv=none; b=PWCl5H+eTfrVcBbHCAVSVOsr/TADW4RDJVBOGfkrzwRAXSTQ2bnQcCOKvN8Ate7V8TLMu+PEpZ3Kf5F61CDanuh4FEXPOnf/AFWrQuNiX3C8qH/0s54QcFWj/Bz9dbLfnpp/T32nJhJNSpsPwjISmL3jFsRiUdjB9zFPZYRDQoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768999364; c=relaxed/simple;
	bh=0HjdByAbPJTeDuGEDNiYTUtgD0UckMjRF1RPmGXvzV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TPr36qISBDqnyx8bKP9Rjo200keSJ+xcZCpGTvJiiw7WoDM4cS7qEwLNFSZ3AkFe1gHnRpvMUYV3wISJwN9Tl11iInMbTeFVjUzeSInr+iQX8583i1F4s2cPcRj5+uhm36wkjZG0MsujBJJqTR1bLge2ERUfvxGKOu4A+FvplTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UnVC/BhA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B09C116D0
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 12:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768999363;
	bh=0HjdByAbPJTeDuGEDNiYTUtgD0UckMjRF1RPmGXvzV8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UnVC/BhAV8RExjfRBGxd4SayHpkI6BXVApiddURNH6LADLweuCDo1yeyzxzzcjMKt
	 MNmEBWXfNGJ/p7Wg1W+pMupV/HHb7qvugLSoAFgklqtk/REb8XEEB9KfAXCZes1942
	 rY6K4B8xvhtKwh5ACxg0EykQDuq46vPZLAbl4G3hJ8VrEk99svpl4XvZ32gcUZSMxg
	 9ggkZOIeMQD+lgwX/pdji+pctRty4i7P5G1gCLjpL3IVfClR+H2k0YoV1a5hPhpliT
	 re4rsZjSWR0PC4HxDmXFVifTZsgaA6x4Sd/nqvrq9MruUBraCOoRiax28OHE38+a3K
	 L5qypK48qfwbw==
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-649488dc7bdso524178d50.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 04:42:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWf8cdAbEWVLc+sqYAU2orCuPTWBStAnVhDyLAFCaZHetE2C/rjQOy+zHvP91zMAPp3/nWiUBbVQ4o8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzazgqm05By8znWztDzxg2nevrpIwPRm5sZmW3+MkYAsje0QhJI
	2XbFg0SQtT4BFe3xNDeJCqkj6oZyF5k0HSrITT+CVODZLxx771iGsdYD2VUQTLFwrIy2E61olQw
	rfoZ4mxjA+HJ0mPOUlEelTgaIb3zCeW0=
X-Received: by 2002:a05:690e:188d:b0:644:60d9:7525 with SMTP id
 956f58d0204a3-6491651e69dmr12004302d50.87.1768999363203; Wed, 21 Jan 2026
 04:42:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260117-upstream_sgpio-v1-0-850ef3ffb680@aspeedtech.com>
In-Reply-To: <20260117-upstream_sgpio-v1-0-850ef3ffb680@aspeedtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 21 Jan 2026 13:42:31 +0100
X-Gmail-Original-Message-ID: <CAD++jLkSmV1kVT+c2Nk-oWMS7WPgeu2NbF0yt4SUVsTmAUjq3g@mail.gmail.com>
X-Gm-Features: AZwV_QiQRH_FgyO-4O8MQg7hUCGXaZg8vwoF5MWGo_Re4DDhsmu71vEaHa_pOBQ
Message-ID: <CAD++jLkSmV1kVT+c2Nk-oWMS7WPgeu2NbF0yt4SUVsTmAUjq3g@mail.gmail.com>
Subject: Re: [PATCH 0/5] Add Aspeed G7 sgpio support
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
	bmc-sw@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-30863-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,aspeedtech.com:email]
X-Rspamd-Queue-Id: CCDEF571DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Jan 17, 2026 at 12:17=E2=80=AFPM Billy Tsai <billy_tsai@aspeedtech.=
com> wrote:

> The Aspeed 7th generation SoC features two SGPIO master controllers: both
> with 256 serial inputs and outputs. The main difference from the previous
> generation is that the control logic has been updated to support
> per-pin control, allowing each pin to have its own 32-bit register for
> configuring value, interrupt type, and more.
> This patch serial also add low-level operations (llops) to abstract the
> register access for SGPIO registers making it easier to extend the driver
> to support different hardware register layouts.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Changes look reasonable to me!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

