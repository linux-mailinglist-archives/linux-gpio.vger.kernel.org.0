Return-Path: <linux-gpio+bounces-31300-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FpANZtte2mMEgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31300-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 15:24:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 922FAB0E21
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 15:24:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D41B83008D78
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 14:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 323972DE6FF;
	Thu, 29 Jan 2026 14:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1m5bI97"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C4E2C0266
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 14:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769696661; cv=pass; b=D8OWkSKfvoQ+sEYUvcMfBraoKyajZ+bpIcbFk/OFmPzy3fKFKNBC1H7VLBkqlMMKmiveTY+xWYcfl9wU+NMMSllOwOFYS4iIEAqYu5cSxVCpE/PujlOadvtP59eyqi2ENKo2OcNpRpu5fvsjtS3bdwEgDLN/9kkLQqSVhMMKN18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769696661; c=relaxed/simple;
	bh=VSgqdVbJ5jQ0lYw1lkLNdUawAWkBGgQFLtj16q3xo58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=llHDAP4bAz7VnTlyTLczXDJaMM3xk651KiqBkIqW0x9VskJyjLxN6RUUQIuYzSxYdZ+4BfwSgsglGvz/sdng6t8wr/vHBvicIKhdR0134OOtuT3jJZBvZj473q7l1dTjkC7BfZrAp38NOQWo8cm9ER5NGisGK4s5Uo+cU7RiODk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D1m5bI97; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b872f1c31f1so143115866b.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 06:24:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769696658; cv=none;
        d=google.com; s=arc-20240605;
        b=L29sfnnHxea7rR48/ieBcuMuqD36B70XpIq0xl6yFNbe4hfJx+OgIt2KE2rV67gPUO
         Wp+x/yB/W+/X5ATWGDsIKn5F3wt5Tzc6LFQBpD3aWJfOgrlZmm8yVF/Ia8rtFiMZIBRB
         NHsUiEcp8gZQGXRRyiHaUSyEP+kB8v3bJExk8p9ze5zzEW46hLZLdtsVyq/Qh1sXbRgU
         aGZoL4l8m0O2nBCc4p55XKv++aqIC1gNazVCymN++mm7LD9r3eRp9o1pDsz71MotnL8n
         iDXNaofv+YZsi+WrCUATNAANC4AKS8SMM2ArkMYln57BS/GTZ5BmxbMDjZ4djm+E8jr/
         jWWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D9kbEVTbB1lbitW87SM8lSnk/ZmDIDVbpPp+7rrn5nI=;
        fh=wNl/vpxxlWVYwjUhu4ulNSYoSncWpNDagw67En8Gqfw=;
        b=T2qGF5J8a8zhMAeGZ/mAso9qYmGJgSN26V0OMxdNZTnfTLepi2Xfg7p3pu6UNGx+1s
         7Z7WF79GE0/VADiO0rDhOmIsXJEb1xyfDyObxCCUHE1SzB1aA7yIY0w5UBsH7S2Hi2lR
         /vwQAfSrAUxQZ4kP9/zi/Ff+DNScLL34o3DKy6m5bAX5hTKLI7NZqwYF0WjuWmSt10qS
         iTT/DqgoG/qtSHtiXM03VnaPujyrvOJBw39WeSBHE4o9XrBYAJAGgIM9JZG2XpNaCCAu
         fwjUHlbWpGYj15OXis/0POlQllz/vrkMK7L0qFPTrM3/o97cc/QgYatGyFnGqxBa9Dnc
         hKAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769696658; x=1770301458; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9kbEVTbB1lbitW87SM8lSnk/ZmDIDVbpPp+7rrn5nI=;
        b=D1m5bI974IvpWEVwExJBpiXb1SzGI1h0srNHNnqiNsrMi+CZickq5L4aTuez2UAX2F
         offH1z7GJj3gigDcWQl2jeV++HXn3z4ykfS5hgUFRX349u17yPynAjpbaoreBU6HXRmn
         Se++jyWEYMYukL/MOkWw5zp7J1dItnYZz+pUzvgGfPfcjU2jgn3VkUrq1BNcto5zf0K2
         EUbz2Pv7WMjWN7MOPd8RM93y9KJiWIBnTQbfqzAm+zINFcpMRHsdK8i0s7KCqI/5hIX+
         gmaIFzskkrdgniOfr5zRj83E7Y1bQAXQGx7sX3NEB2cN8LTs4bVdm2hSAObUEnyAZnP6
         nzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769696658; x=1770301458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D9kbEVTbB1lbitW87SM8lSnk/ZmDIDVbpPp+7rrn5nI=;
        b=wTZzDR6LpJXi1hgOvshwZUREa9oUJP3IND35dbh6vv8BjRi3Nr4KDsRaaMJg/i6sRT
         V5X4hffarssQkurz3IaHi8eXX8ie2ST8DuCrucXOojoTYFMco+kmbjXmGTvZoMaaWIfx
         0SkR53hccOkiZspenPM9NF2INRYW9S2TA5y/pxNRZehou16OV3VePrqJZaesG1/+/cdQ
         WIKo+gYm9CTCtJVsfqjfgMmr4AvIxFNrmsUg6MbZFcfcLsCOIPPFBdro4+pcWDueqyfm
         jV1FzrM0fd/0x1pqx84C0WwuioA69jhOa5yXklOrlQ3tFV3Tc2V+6BOGkZ6YuZj+/nQP
         E+dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwZaJawlmp2mbQLoYyifV7yN+etZAmdNUNX28nrqfwzO41uxekQYx1ybMY1jfY0XcswBDy6ZxoaXlA@vger.kernel.org
X-Gm-Message-State: AOJu0YzRjEj/pdES/LCH0Y1yq+mPfADUiKFFbbLEkylQZLCJxh5x9Cd+
	/RjOCR0B2H0vrDkx5kxUkyjjAiHbcdlGtrYS8TBGQdm0ZaZwUlPD92n6B2QbJnqCIURo8CBCTqJ
	5KKUndhkmqUOtLrlsVLTMGU0V/uwVxbc=
X-Gm-Gg: AZuq6aJMdbGfkpAyuu+8zsJCjc6wq3px7GQft/OfIXQEXirfkPe+fEKsJ1ir/gb2fo4
	qAslNoNhyDQ15IX5DHjJofHZTOVfnXFN4GeDiLjiFJVM6fCbMmzXcoV6FoXvfrM6iHstzrEF6IY
	wkhTqRAccQHs/M4a2MVKbo3S4tU4A0wQK+eXe1vXNeTdOC0gubMp3R5kfXhhp7fsXebBjOzyhxE
	GiAYDEQr0q9gUSLTK1Q3p+TyHCgTrrU3FXL7SDQPYlJu/qj/SQ/y854KEMBzusBGqpqS68Bm2LT
	smfcGigmhHERkOxBJIqODVUtoKVRuK0CN5Q1aBJAASXYOWalnkfuG/fPB0ilLmaltPkvmQGZHVC
	PB5imuQ==
X-Received: by 2002:a17:907:3d88:b0:b87:322d:a8bc with SMTP id
 a640c23a62f3a-b8dab2ff201mr705174466b.31.1769696657734; Thu, 29 Jan 2026
 06:24:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127214656.447333-1-florian.fainelli@broadcom.com> <20260127214656.447333-4-florian.fainelli@broadcom.com>
In-Reply-To: <20260127214656.447333-4-florian.fainelli@broadcom.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 29 Jan 2026 16:23:41 +0200
X-Gm-Features: AZwV_QhiKhLHh7rkQvLr3bD7QeYruPGKjAy319CFvLv0Pzej6bk4P0Ca1RxCXnQ
Message-ID: <CAHp75Vc1om1XDT0os+md1D-mwYxrVZJGfbpepkdPJrHOmFPBvA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] gpio: brcmstb: allow parent_irq to wake
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31300-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,broadcom.com,kernel.org,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,broadcom.com:email]
X-Rspamd-Queue-Id: 922FAB0E21
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 11:47=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:

> The classic parent_wake_irq can only occur after the system has
> been placed into a hardware managed power management state. This
> prevents its use for waking from software managed suspend states
> like s2idle.
>
> By allowing the parent_irq to be enabled for wake enabled GPIO
> during suspend, these GPIO can now be used to wake from these
> states. The 'suspended' boolean is introduced to support wake
> event accounting.

...

>         if (of_property_read_bool(np, "wakeup-source")) {
> +               /*
> +                * Set wakeup capability so we can process boot-time
> +                * "wakeups" (e.g., from S5 cold boot)

While at it, add a period at the end.

> +                */
> +               device_set_wakeup_capable(dev, true);
> +               device_wakeup_enable(dev);

>         }

...

> +       /* disable interrupts */

Still the comment is useless.

> +       if (priv->parent_irq > 0)
> +               disable_irq(priv->parent_irq);

And looking more at this, I don't see why we even need the check. Does
the code WARNs or so when there is no parent_irq available?

*Yes, I saw this is the original code, perhaps can be addressed in a follow=
 up.

...

> +       /* disable interrupts while we save the masks */

> +       if (priv->parent_irq > 0)

Ditto.

> +               disable_irq(priv->parent_irq);

...

> +       /* disable interrupts while we restore the masks */
> +       if (priv->parent_wake_irq)

Ditto.

> +               disable_irq(priv->parent_irq);

...

> +       /* re-enable interrupts */
> +       if (priv->parent_irq > 0)

Same here.

>                 enable_irq(priv->parent_irq);

...

All we are diving into is the 2 questions:
- is 0 on the particular platform an IRQ number and there is no sparse
tree enabled?
- is maple tree implementation clever enough to not crash (or have
side effects) when we ask for a non-existing index?

Anyway, this can be done later on.

--
With Best Regards,
Andy Shevchenko

