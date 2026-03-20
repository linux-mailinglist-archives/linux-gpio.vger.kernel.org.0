Return-Path: <linux-gpio+bounces-33919-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJw6EuFKvWlr8gIAu9opvQ
	(envelope-from <linux-gpio+bounces-33919-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 14:25:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AA52DAEDD
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 14:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E91FF30328A3
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 13:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268923A8737;
	Fri, 20 Mar 2026 13:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IsmxSYJe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FA835BDA5
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 13:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774013048; cv=none; b=kNgdLg+t1oKi485wR6Lhe4zLDFqson1RBXNVoU+5/EsoIDtDSXCWwDd3K80BaOrTzsSYGIC6nlv4QSy+cli87Grn4fBr8TzNCKbdgxh1IYVXJgLWjIDknW2gkZ1gaEUvHMZW2u1eBCPqNOD9cocXeiqtLiIroUYZuc63uHfTOkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774013048; c=relaxed/simple;
	bh=qKboe0/DtcoJu2p1G1+lmquY232Ov8fUQpxq2txGni0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XMaCYxHSBhXLB/AEMFwjVPJ6LXdyH+GRd6JqeO1iF2W8cTatNYeCxzU81+gzMOvpWOD1Zn7E1h3E8m9E0xspbwsMeYa6N/07GPDWEhWMyJdwpNoroQBCLXXlVpMpIo4Td2mNJkC2pbYNLzgvrUJcCRE381hOTY6g+fdbsg+OqbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IsmxSYJe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED03C2BCF4
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 13:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774013048;
	bh=qKboe0/DtcoJu2p1G1+lmquY232Ov8fUQpxq2txGni0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IsmxSYJe13Uh2Ham+r9TnB/dla6xbqEeqDJoJyBrjNZknv+2gLOnec6nA7rwmRRSp
	 VX3aWbHsiGogLffTRLtYztOtlD8LUlE5JsZ/+h8X5AMO5UFjDy0hehWlkJA7emwQY9
	 pdtYgrO9etYNEoUU6i8Wbq2iHg6VH9JEk5Y8yIUwQvxpzjEb0uci4kKmQf1Xj5AePh
	 1admpNUXPfJIbek+/5Xlog+ItkFA1cIM0IH7Vc8i/l14DCc6Z9HDwG3SGdmqWhRQKZ
	 v5VIafh3FUq2rN9HFg/qIeRgu71ekoko+6TS3kj3pjE82XNY464bVvJPsJ08Zgcync
	 w29Hhl9Dn72pg==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79853c0f5b9so5541597b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 06:24:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVcYkwztmkcj+nm3HGU9GtPZitGA1gcYDv9Euwto+9rwGiwpcqdDgtK9F4f6CsyUcZjiTaNmHphu0XU@vger.kernel.org
X-Gm-Message-State: AOJu0YykLj5/4W49SLNWtea71CFccuPBC7BjPT8LJ+MXJpj7hE1pCyRv
	dbPdSjJFIkIEPC+C8Vnwy1ca8fxr+3FJxX4zBUgMK/9ngDahApbafNm7IeX5BgTgfvfp+6lbX1U
	iGaxmrPc825q+rr41SzZG71+vrVM4uuE=
X-Received: by 2002:a05:690c:6608:b0:79a:3752:af20 with SMTP id
 00721157ae682-79a90aae9a8mr26948667b3.7.1774013047789; Fri, 20 Mar 2026
 06:24:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
 <20260313195801.2043306-4-shenwei.wang@nxp.com> <2aa1d063-181f-4145-9f1f-7e3012c4d0af@foss.st.com>
 <104e9861-bfd4-4e0f-8967-a849edf7e6fb@lunn.ch> <CANLsYkx6KhspTjzpk51ywfgWcf-FR7-3XrH=MmBi_W6yZmMukA@mail.gmail.com>
In-Reply-To: <CANLsYkx6KhspTjzpk51ywfgWcf-FR7-3XrH=MmBi_W6yZmMukA@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Mar 2026 14:23:56 +0100
X-Gmail-Original-Message-ID: <CAD++jLkAQzQ+zzC9ycRt+CQ3801G4p=sJbg1K0h2ugHW0JnQ8w@mail.gmail.com>
X-Gm-Features: AaiRm521fZwGOYxcLS7yMLe01ZzXoPJRV2jTRRY65q686pnlDl5uPYKXfNpRPU4
Message-ID: <CAD++jLkAQzQ+zzC9ycRt+CQ3801G4p=sJbg1K0h2ugHW0JnQ8w@mail.gmail.com>
Subject: Re: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33919-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[lunn.ch,foss.st.com,nxp.com,kernel.org,lwn.net,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.963];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 32AA52DAEDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 5:03=E2=80=AFPM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:

> I have made this point clear before: modeling legacy protocols in
> mainline doesn't scale.  Mainline uses a single generic protocol, and
> yes, it means breaking legacy protocols.  This is the cost of moving
> to a mainline kernel.  If people want to use the legacy firmware, they
> must stick with a legacy kernel.

I mostly agree with this stance.

But it is under the assumption that the contributor is coming from the
same legal body that can define and change the firmware in question.

For example: the mainline Linux kernel supports a whole slew of
funky Apple rpmsg-like protocols. c.f. drivers/soc/apple/rtkit.c

We cannot go and tell the Asahi contributors to change the Apple
firmware to use rpmsg like everyone else, because they are not Apple,
they just want to run Linux on someone else's hardware.

In this case, the contributor is coming from the same legal body as
the one doing the firmware. I know and sympathize with the fact
that sometimes working inside a company to make changes happen
can be as hard as working on the outside, and internal structures
can be as resistant to pressure change as Microsoft, or Apple.
Additionally they hit the contributor on the head with "just get this
done, now, fast".

So it is pretty important in this situation that it is NXP that we address.
The contributor is just a representative of that legal body
in this case.

If someone *outside* of NXP, say an OpenWrt hobbyist contributor
was pushing the same patches based on code drops and reverse
engineering, the response would be *different*.

In a way the situation is a bit icky. As the Linux community we often
see all contributions as personal, individual. And the discussion here
is that of standards committee, which we are not.

So if we are addressing NXP, then we need to be explicit about that,
and careful not to put their representative in the crosshairs. It's unfair,
he's just the messenger.

Yours,
Linus Walleij

