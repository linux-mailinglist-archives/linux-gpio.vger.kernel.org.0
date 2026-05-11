Return-Path: <linux-gpio+bounces-36610-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPlTGtE1AmocpAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36610-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 22:02:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F41515652
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 22:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8688B30247EF
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 20:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36BE328B5E;
	Mon, 11 May 2026 20:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZjSMW4AV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66683BB40
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 20:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778529660; cv=none; b=b/GgfrCQEM3/HYoJidn9J3aYjx/p8SEjQZmpSHRH01yU5/mdlg6iizyeh8o0tj0ZhlT7jk2+IfujOoVdP1/KSkVr0yISr+BoQK6OPBDdjKGpcwoZV338zi8/CA+MGIUF4w+EyXmisgLRQXUVHTRxkGj8PVqCSJmcoXbE0WfC/ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778529660; c=relaxed/simple;
	bh=afMhjAzIKP5bcnZSy3KWIznLuKc6kIGzKnWy48IwObo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aO7tUW2i8fIHSjxw6KI3nt9N3VwAQ0SW7KbwuX4ot3iV8+gppKoUiTWn5Td1U6rrdvrwlWY9mPSiFYbCwcGFdgP+R8WsXaO88Ua/67F32J5Ic/q+OJILsCE4thGwLjO1EB9cvOFcBkoQWsa/L//2JPozpjsFFnZRquQSxNX7rc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZjSMW4AV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70EC5C2BCFC
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 20:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778529660;
	bh=afMhjAzIKP5bcnZSy3KWIznLuKc6kIGzKnWy48IwObo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZjSMW4AVnQL/NQhwz+ZpLjM8Hk9JMOKws3Spz8ouELIc+Bu9KqBJDlfrPHMktFTim
	 Vb4ZH+2KCTkTF/lb22lBG9p+eKe6tHw1UTPhNHH62QHGjDClYKvn1OwUMmNRFG+SST
	 jQPwXzj2U79XuxIVNtekGd9FnWj9Hc4Cl7WgZ5/uzY8JTgW/z3Rh3S6nKpwg6862V3
	 dUeuMr9pQe76NrilzH41A/u5OKYW/W/Cax5E1OAqHVUj1+9M/SOkwPmPhT7NupiyV4
	 HfuGfmHXERRdoxl1UoTJY+PwrKgnU/uBhivXGHpwYdtY5IE7kKYpaWBef0HoPAURMo
	 p9Lotrc22yfZQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a8cb92f26aso1447231e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 13:01:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/b3GnhAQOcZwde5YbJg/i6dI7BWj3H5ASgUorLTPj6WNW0a9P1FwNTd3DUAHpsjc5oDZ3+9U3kinEv@vger.kernel.org
X-Gm-Message-State: AOJu0YwtZYcOCJAsDKZmO9p0mYbqF/YbTRWmCsWIa1bqmOhmQsT5fzWu
	OMxN2uspm2ASC81T7d33cxIne2gMQAczqkiiJVUtPKuSA9rktiTq9I9a0hGsNkM1uxvnCwhPvrq
	ra+mptLisdmR7OpQLe0eq8YhIUN6jaHA=
X-Received: by 2002:a05:6512:3b86:b0:5a4:d9:88a5 with SMTP id
 2adb3069b0e04-5a887cde895mr8789758e87.24.1778529658964; Mon, 11 May 2026
 13:00:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505104003.1811841-1-wenst@chromium.org>
In-Reply-To: <20260505104003.1811841-1-wenst@chromium.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:00:46 +0200
X-Gmail-Original-Message-ID: <CAD++jLnpsmV=yqjrFZiqqRxHVM-7pG3SZ15DKakj_3ODnP4wkg@mail.gmail.com>
X-Gm-Features: AVHnY4KLb5dofKxjtoMouq5Gr8Qpwowhm7jBE9YnqDOByoiTwxk2QEGRigVxcuI
Message-ID: <CAD++jLnpsmV=yqjrFZiqqRxHVM-7pG3SZ15DKakj_3ODnP4wkg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mediatek: paris: bypass pinctrl GPIO layer in
 set GPIO direction
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C1F41515652
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-36610-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, May 5, 2026 at 12:40=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:

> pinctrl_gpio_direction_input() / pinctrl_gpio_direction_output() take
> the pinctrl mutex. This causes a gpiochip operations to need to sleep.
> Worse yet, the .can_sleep field in the gpiochip is not set. This causes
> the shared GPIO proxy to trip over, as it uses gpiod_cansleep() to check
> whether it can use a spinlock or needs a mutex. In this case, it ends
> up taking a spinlock, then calls pinctrl_gpio_direction_output(), which
> takes a mutex. This causes a huge warning.
>
> While this class of Mediatek hardware does not have separate clear/set
> registers, the pinctrl context has a spinlock that is taken whenever
> a register read-modify-write is done. Also, once the GPIO function is
> selected / muxed in, further GPIO operations do not involve pinctrl
> operations or state. The GPIO direction and level values do not require
> toggling the pinmux or any other pin config options.
>
> Switch to directly calling mtk_pinmux_gpio_set_direction() in the GPIO
> set direction callbacks to avoid taking the pinctrl mutex. Drop the
> .gpio_set_direction field in mtk_pmxops to signal we are no longer using
> the pinctrl GPIO layer for setting the direction.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Patch applied, thanks for your perseverance Chen-Yu!

Yours,
Linus Walleij

