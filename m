Return-Path: <linux-gpio+bounces-35690-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNqbLjmV8GnnVAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35690-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 13:08:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54802483555
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 13:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 93FB5302337D
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 10:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143BA3FA5D5;
	Tue, 28 Apr 2026 10:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sVI2mEYc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98563F7A8A
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 10:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777373090; cv=none; b=Gtb41icgcTGu/0sPbAD0y/PnVWHRlJbYjsj6QmzfAKm510SgCCVYB1BinlwE4dGAatqxjzmkN1nyVw2YqM1Vrkx85GkFbtLN7uu65AfyTmCUqXH4N+s/VrhuTEH4p2QSIqtPEqSOPKBHnWQ4ZJR3H8RTPwqNqPYxhlJPO3C9eKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777373090; c=relaxed/simple;
	bh=FqgLR4kLcZ3dVxyufDuvyUApdY13Qe9rdCefZi95EbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RHwL538cyzaL2cHTmR3QRIDpcdsOn1uZkJM3+wAq08RRClS7+w32I/m9Wv03VNyzccEucfR4Uzb2sUA+yZJIekZjNzDsHqM/L8D4Dq7vKbGUgla+++bTz504R+ZRnUNXXVDIz4KXVI946JNNhXrdr/aCMhUsAPJERY5eATLOsHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sVI2mEYc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE046C4AF0B
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 10:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777373090;
	bh=FqgLR4kLcZ3dVxyufDuvyUApdY13Qe9rdCefZi95EbU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sVI2mEYcNZo3zElrN71gZ01aE/edrfg24MyDvV/q4whvGK6NzNKp7um0sb8tuhhkl
	 AUpJW4jscW3CTv79fkvs5vBrjr/bLxW1vulToVwJ7gi2rhub2tkljh1QvZyhcoQ2ET
	 /emgjy+0Gbit4OGu1oSNJCA88VgYG21wCuhfQs36R9gaJ1EjVx7MY6+E8f/0ilOhjo
	 cJOSSvQGradYNjyGmmkwWfaY6NxrTZtTxXXjYcBmmv/i6Z/dP/zGCGec9zzF5Y+cQM
	 49Uw801N9fhauFf4l3uzwzHxqDzuusy467199gLbO/MPBYrrxgmwejnuriKQzHJfUK
	 MmMSHUfKtIymg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38e9653b580so125051681fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 03:44:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/lZtqp5oywFPmSFV8YHgHJNmHpnvkfW/SZw1AoUKq6u1hPdwQxM9xEX00+TighwjmbaeaCqdfil4N1@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb6uCzeprefCBBXpb0ZnggOieu5j1XexwIirXCt6S6I/p9VD/L
	+gh6SuqzP2TNUG9RmsBfNtFIjhUpMGbYjkeAPHBj8apj14Ud3tYSTiNvtayarfBxoYyTIDJS9Ns
	fTsoQ0ZhI4N7M4emtHPpXVJQvOVVnOiE=
X-Received: by 2002:a2e:a994:0:b0:38e:b7ba:106e with SMTP id
 38308e7fff4ca-392411f5110mr8948921fa.31.1777373089357; Tue, 28 Apr 2026
 03:44:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427021021.2049015-1-wenst@chromium.org>
In-Reply-To: <20260427021021.2049015-1-wenst@chromium.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 12:44:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLnP9HvWPQg8WqoFkgRoFCWjkOUsRAgtnks4mEhHwYRt+g@mail.gmail.com>
X-Gm-Features: AVHnY4If7KtbqOFGA3iu1y5UjbNKnCzQkoWDNIerMJA6Wxu801qNzEULw2AcZ2s
Message-ID: <CAD++jLnP9HvWPQg8WqoFkgRoFCWjkOUsRAgtnks4mEhHwYRt+g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: paris: Directly modify registers to
 set GPIO direction
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 54802483555
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-35690-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,chromium.org:email]

On Mon, Apr 27, 2026 at 4:10=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
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
> a register read-modify-write is done.
>
> Switch to directly setting the GPIO direction register bits to avoid
> the mutex.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

You are essentially decoupling the pin control back-end from
the GPIO front-end, can you try to do this a more friendly way
that doesn't wrangle registers out of the pin controller like this?

If you insist on doing this, you also need to DELETE the pin
control back-end function
mtk_pinmux_gpio_set_direction(), which is what gets called.

Yours,
Linus Walleij

