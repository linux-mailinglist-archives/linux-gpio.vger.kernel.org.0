Return-Path: <linux-gpio+bounces-31731-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ON5RHweck2n56wEAu9opvQ
	(envelope-from <linux-gpio+bounces-31731-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 23:36:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F18147F13
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 23:36:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DE8830075FD
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 22:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41E91EE00A;
	Mon, 16 Feb 2026 22:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vC6CD9i/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6664424291E
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 22:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771281400; cv=none; b=VjpK3OFVwJqSi99f16V8HeMWunq2LpoI68na45zVyjqm/F6iEjVdNTgeG0bgAtZhvoI9nLM3WC448Jn1c3ERPLNvh7VNYuvgMwaKKlRR+3TaIuIqBtj6HumuwfczL1iBQqwsfmCl3Z90SYGzq2mJCVTDhnLnDMnvD+exWkura/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771281400; c=relaxed/simple;
	bh=n6mzMQlYwCosdp7sPTHeQmdtXI7vJYrza0mNgrfXASU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PhF8flWBS6O1JYa61/jnVKdVUxStXrsV4xfOg8nDO4TN9UD5dXOIMam9BCjxktis2RCVkVrCMyK4W0lhglaYEDvOSDSWAnb+8icbBAg7Uv1/31pkDnxdZqGRx/Nr0UZPuch9ZF1WjbJKWvWi32g4wl6aaKMUqLoa3Uxz0SoOP+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vC6CD9i/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 228B1C4AF09
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 22:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771281400;
	bh=n6mzMQlYwCosdp7sPTHeQmdtXI7vJYrza0mNgrfXASU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vC6CD9i/GF69AG52oQMHsirMlaYZLdl8hgW/t+OEMhTOztg0GfX6u4oDdcwbIh8FV
	 z4v9ONxl0x5vMRF/FcnAbT8TVw/Sb6eAVS2CyoWGbjuudo53GtQ+lMwlKvf+SKraNc
	 4ynbUdmjw2F2RrLUt3/x9Fodn97mEpRLH/tQejxln9x69iqmwpNg+/YQwWyqH8UPcn
	 S47oMUQYVqmxcNhUAV+YRsfmn6EBinNZkG/pep2R2UkZ1C1SqDhh2EyYV21udsKCib
	 5yBGlse0PYzm2Y/L2O+r4mUKF9zEwCie4re62LPhJQ6DbaP+0Eh6N2CZ2MWZTA85XY
	 Mti/R3ZRA3pQg==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-794f701a3e6so30491497b3.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 14:36:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXnjchW2SulBVZMQ++PY0LnsOGSMRPginjJ2tdoMc3oH5/86xXBIYbcNnTtdDecFz6uefgQXTBQQGmO@vger.kernel.org
X-Gm-Message-State: AOJu0YwsvaD26mfpBr3amYuib+gE3J9fesERtHRBC7S4b734iTygAEs9
	rDOvZ5rr/x/1SEqBG9iFEamxmr69fh3SZKf+KW7DwSMfSjlE59/8rmwKmqRhyghtyarKXAm2NN5
	qfxsWcjuHB8PuE0n7e1vvJvJi9lEL0yc=
X-Received: by 2002:a05:690c:e3ce:b0:794:2fc8:8358 with SMTP id
 00721157ae682-797a0bd4349mr94993897b3.6.1771281399276; Mon, 16 Feb 2026
 14:36:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205103930.666051-1-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260205103930.666051-1-cosmin-gabriel.tanislav.xa@renesas.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Feb 2026 23:36:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLmwij-tD5k+XtxtoRKzKasKnAdkG2CCzPVoEU5wGiL=yQ@mail.gmail.com>
X-Gm-Features: AaiRm51aDtjLHR3s0vdfZKxoqoT_51wOkzrkrxp8tUVDONKVqGvf7RWeQVGKsUc
Message-ID: <CAD++jLmwij-tD5k+XtxtoRKzKasKnAdkG2CCzPVoEU5wGiL=yQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: renesas: rzt2h: fix invalid wait context
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-31731-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D6F18147F13
X-Rspamd-Action: no action

On Thu, Feb 5, 2026 at 11:40=E2=80=AFAM Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:

> The rzt2h_gpio_get_direction() function is called from
> gpiod_get_direction(), which ends up being used within the __setup_irq()
> call stack when requesting an interrupt.
>
> __setup_irq() holds a raw_spinlock_t with IRQs disabled, which creates
> an atomic context. spinlock_t cannot be used within atomic context
> when PREEMPT_RT is enabled, since it may become a sleeping lock.
>
> An "[ BUG: Invalid wait context ]" splat is observed when running with
> CONFIG_PROVE_LOCKING enabled, describing exactly the aforementioned call
> stack.
>
> __setup_irq() needs to hold a raw_spinlock_t with IRQs disabled to
> serialize access against a concurrent hard interrupt.
>
> Switch to raw_spinlock_t to fix this.
>
> Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handl=
e interrupts")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

I'm waiting for Geert's verdict on this one, I can merge it directly
for fixes unless Geert want to accumulate a few fixes first.

Yours,
Linus Walleij

