Return-Path: <linux-gpio+bounces-31768-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHLtFsialGkoFwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31768-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 17:43:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEE214E5EC
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 17:43:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C599E3019918
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 16:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC00836EAA7;
	Tue, 17 Feb 2026 16:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uEinzWkh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEFE36D51B
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 16:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771346626; cv=none; b=hiSRhbbUm3Ca+u4LmYZAq/XI0+P4ZbqWy4CfJmRYOz1301NviANyeOCKbYVr8pGrOLCnW64IujY8hHSspdp6xenO/B07bDP1ZCx93ph9lra35u+RSMLAr0U3qAXh66/gHiuqffZmC9YFYt/V/3VbeYcpbYeWViCpR4mletaRMvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771346626; c=relaxed/simple;
	bh=e44I+gmR/Crii5lzJC5/nGh/rjAXjynQw2DgvMzop3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FbmdIH3dxgPuCCmg/NWpKqlx/mjXXKjKuVc2ifIsdMbC0TApkaQ8Hf5IJvKW3B5J6V/K4ptunkPb+3D8yKR0wBgHmQoxMRvAEiCLN9u1o6P+3KOtwRY82BBtfBATe/7hrTyVpqhLX/siJIaZvzUVMOjyss5LWr98T8Qc6FSGwLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uEinzWkh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E68C4CEF7
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 16:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771346626;
	bh=e44I+gmR/Crii5lzJC5/nGh/rjAXjynQw2DgvMzop3k=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=uEinzWkhfejDthNLMSVfdDkyp7ZNlrdBHapzEqlt5sMHX0GPeazD25p14sZ81t/uP
	 HOrdojvB5kGpj12bhyOuJ1+NgVk2RiV7+qSI9tGm/wnhbpZCNvcdXrGLqPwWPyenKo
	 Jyoy0TVyjv5wQnb0OynEUCkF+uCIHjzS03bMZM8Qc+A+eguT/vzoLHG9nZKr3s3hX+
	 55+uvw0F81gURTjMubgsUf5EPcuMTdpMLNo3DU9nDCsS9BHJdnHeSf24uJjVJigij2
	 OcoKwaIgZ0ZNsA4Bf/weRPvx5MybGAtP4B5zNkEWklkrxEyo/qfnDPCpsuqbMHgaoK
	 3LsEw+fwntDyQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59e64657f0cso4297264e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 08:43:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU4zNqdpDOmuWz6cB2lW9/x5iGTI2EqYNEQg0XR+7YonAApMp9k7PGNyvLBPR9bddPxRON0+Aka6Axt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9aySrrZV0yMGWp6DmEadUc06op9uRSZ0a1z0F+Mlsdpw00xhc
	4pdjU8D34pLbHnNtj1EwJpuS1ysYsL+oel0GPY7Zl+jJ8VjLBhtpkWhqOod3qUWmtWwcZCWfaP7
	90PCBoj9g1E9Ssq1A5dIY0Z0iBpSPfCA=
X-Received: by 2002:a05:6512:114a:b0:59e:340:e557 with SMTP id
 2adb3069b0e04-59f6d357cd8mr3391698e87.19.1771346624454; Tue, 17 Feb 2026
 08:43:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216160946.2977985-1-wens@kernel.org> <20260217163208.5db4cd1e@orionap.fritz.box>
In-Reply-To: <20260217163208.5db4cd1e@orionap.fritz.box>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 18 Feb 2026 00:43:31 +0800
X-Gmail-Original-Message-ID: <CAGb2v67NcduBxxrFeVkhi7eKyBBcMKy6dptHFrtZg2-Xs2Nf7w@mail.gmail.com>
X-Gm-Features: AaiRm50IgvwBli9VJ3oskhBXlgPk6-8kaHQNo2uOGlyvC7LHA0MeNNq9rzrpr3Q
Message-ID: <CAGb2v67NcduBxxrFeVkhi7eKyBBcMKy6dptHFrtZg2-Xs2Nf7w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: Implement gpiochip::get_direction()
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	James Hilliard <james.hilliard1@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,sholland.org,gmail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-31768-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BCEE214E5EC
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 12:32=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> On Tue, 17 Feb 2026 00:09:45 +0800
> Chen-Yu Tsai <wens@kernel.org> wrote:
>
> > After commit e623c4303ed1 ("gpiolib: sanitize the return value of
> > gpio_chip::get_direction()"), a warning will be printed if the
> > gpio driver does not implement this callback.
>
> I am curious how this could slip through? Did the get_direction()
> callback become mandatory at one point, but no one noticed that it was
> missing for sunxi? It looks like the situation was even worse before that
> patch, as it was dereferencing the function pointer without any check?

Digging deeper, my attribution is incorrect. The actual commit that
triggers the warning is 471e998c0e31 ("gpiolib: remove redundant callback
check"), in which a check of .get_direction before calling it was removed.
So I believe this just landed for the next release.

Thanks for spotting that. I'll send a v2 to add that information.

> > Implement it for the sunxi driver. This is simply a matter of reading
> > out the mux value from the registers, then checking if it is one of
> > the GPIO functions and which direction it is.
>
> Mmh, it feels a bit backwards to resort to the function name *string* for
> comparison, when it's always 0 for in and 1 for out (which we actually se=
t
> in pinctrl-sunxi-dt.c now). But the mux value for IRQ is different betwee=
n
> SoC generations, and I guess for historic reasons function strings are a
> thing in pinctrl, so this is probably the best solution after all:

Yeah, I was a bit undecided, but using the raw values for in / out and then
having a string comparison for irq made things even weirder.

> > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
>
> FWIW:
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>


Thanks!

