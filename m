Return-Path: <linux-gpio+bounces-32900-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHyaEZLkr2lwdQIAu9opvQ
	(envelope-from <linux-gpio+bounces-32900-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 10:29:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA4A2486DB
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 10:29:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE49A3197F8F
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 09:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8C243CEF0;
	Tue, 10 Mar 2026 09:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QYj6WetU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D0A313293
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 09:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773134114; cv=none; b=iRWiT2Qzb8L2OMDN+cNnSIRK4e5F20H4mVPCKUlyfAsrBIu4w4uKfbtZIf9vTyFc7Ypd9booqE9KUo7hA2rOwkVjPBbBkaSgJacST3EfSaNrIZ0ADV0TBBP7T7fPTkYqaQTxQLST5759x+Alkv6cT2sJn4LPio7DPMyRoSciH2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773134114; c=relaxed/simple;
	bh=Iz0gR5pkZB03M9dyiZMiSZl4dxXjfY1DOzSwmldDktM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKkLDASuj35nyOvQfzLnfoLNPG6loCF/K5SSdOeeaTSOm1Zwt6muo5Wzh9fejZfoR+HYCt+LpksrM49eN5Vw+Jnke1/Sv11YdASzgg1LSNTPudbCD7Ermtza/G6hrxAmvCjuqkmniMi7QKJyxImv3gyrRtGF8qvFG+DttOPjUjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QYj6WetU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C14A0C2BC87
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 09:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773134113;
	bh=Iz0gR5pkZB03M9dyiZMiSZl4dxXjfY1DOzSwmldDktM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QYj6WetUhHBTlAaA/bpAh41bd2TPXYAR2+vff5mG4bPusSXBQXQ6JnkmviS7Acesn
	 pq/Gf7PDh+C5AOAsbIe29mRZCp6ustvkBvxHzU/3pEUlfpbRzPCSPI77V0Gj141O4U
	 A0M86khgKPTt4bLlbPiFnsHDRskUjv+a1Tq2fc2UfsOk69QvX4QThmDcWFq84KirUl
	 xY5TvVC71+UpWXhFPIyTYP9moIYE09vTuIsyXivQV6zrjtqQvZqoGkbfE6XVWG3Ljb
	 OLV/qE26kQHVNywS/hbc1DCU5KBjzcO2pUAl1pKFeO53CvHpLlRO0vSChZ3iNQZpel
	 Ko+4/QYvHbvqg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a13d40c760so3960714e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 02:15:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXTq5C13CgDUpzjy8MiWZmMZtbp4gbfCuV1OpautWrddFPBs0lcGoEE+QqzlcG0E+zQNPGUJ92KPu2w@vger.kernel.org
X-Gm-Message-State: AOJu0YzG8uDu5YSDPpga7H/+SLFSqLREGIKnX10+FlhhgMzjxZaqqJoe
	Zb5E0E7iXsPx49BCIrZ22qJEriSNK7Ikis0tK9wxgz+CjJ/lZSUOfijXb4sMgmjM4eS9Kj6asBH
	W18wUEEvWXG+0ZkaeUDJboTz9NmldUeICH14rfQZXXQ==
X-Received: by 2002:a05:6512:650c:b0:5a1:8d2:f9f5 with SMTP id
 2adb3069b0e04-5a13cd3bf2dmr3871022e87.25.1773134112389; Tue, 10 Mar 2026
 02:15:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309134920.1918294-1-o.rempel@pengutronix.de>
 <20260309134920.1918294-5-o.rempel@pengutronix.de> <CAD++jL=3GeHNirtN9diGc8R2rxczo4UUL9_ON28jOj_DPP2Sjg@mail.gmail.com>
In-Reply-To: <CAD++jL=3GeHNirtN9diGc8R2rxczo4UUL9_ON28jOj_DPP2Sjg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 10 Mar 2026 10:14:59 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mdutv6TyU5SG2uzCgRuvYVmfFB0kwXgj45Qajet+TdBhw@mail.gmail.com>
X-Gm-Features: AaiRm53hf_pDhHi7djsWr-nAOlaqvVed1FWqA5yKgoU5U9ZU1mnIZAae4kC7y1A
Message-ID: <CAMRc=Mdutv6TyU5SG2uzCgRuvYVmfFB0kwXgj45Qajet+TdBhw@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] gpio: gpiolib: fix allocation order in
 hierarchical IRQ domains
To: Linus Walleij <linusw@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Thomas Gleixner <tglx@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Peter Rosin <peda@axentia.se>, kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6EA4A2486DB
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
	TAGGED_FROM(0.00)[bounces-32900-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pengutronix.de:email]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 10:05=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
>
> On Mon, Mar 9, 2026 at 2:49=E2=80=AFPM Oleksij Rempel <o.rempel@pengutron=
ix.de> wrote:
>
> > In gpiochip_hierarchy_irq_domain_alloc(), calling irq_domain_set_info()
> > before irq_domain_alloc_irqs_parent() causes a NULL pointer dereference
> > for slow-bus (SPI/I2C) IRQ chips.
> >
> > irq_domain_set_info() locks the child descriptor, triggering .irq_bus_l=
ock.
> > If the child proxies this lock to the parent, it crashes because
> > parent->chip is not yet allocated.
> >
> > Fix this by allocating the parent IRQs first, ensuring parent->chip is
> > populated before the child's .irq_bus_lock is invoked.
> >
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > ---
> > changes v3
> > - new patch
>
> Bartosz, tglx: is this something we should apply for fixes?
>
> I think it needs to go into gpiolib for next at minimum, unless
> there is some semantic problem with the patch.
>

Looks good to me. I can take it into v7.0-rc4 via the GPIO tree and
tglx can pull the tag once it's out as a base for the rest of the
series?

Bart

