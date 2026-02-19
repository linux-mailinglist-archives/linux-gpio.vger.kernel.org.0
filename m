Return-Path: <linux-gpio+bounces-31890-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HWUBytPl2liwwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31890-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 18:58:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7381616F7
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 18:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A72E301FCB0
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 17:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4305352941;
	Thu, 19 Feb 2026 17:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pGvjEqJb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66035347BC1
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 17:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771523880; cv=none; b=M9a86foRDFkgIls2k6EvBmCgNtR1lR/zo6te7ipB5zV+NsjeiLuB5jBUKEQF6KHws+fXF4emzWhcDpyefot7aCjixGf4jT1GaI3oUoMc58vNyNUYqOSna6s9VrdA5t+F1Gixc3JYMb2wm4rMhtyw5HD92j964qGRx3mUjEwlUDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771523880; c=relaxed/simple;
	bh=y5tjNUS7eVV28LuymY23bLtafbnmZBlJzoU7oSXMGC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DOMT1xIL/R+aCUb5AQF8XpiWmCiMPc4AcNo9tzXP0cHuz6snn4cZyStSH4Hqi5PdTtl9Ux8nLZoSPGz2sUDjm5/XSsTDjf6jtmInR8tUXB5LHF1+jhDMAPdVdoPUqZKlhpNLAKD08GmdH5F/u/VoTTW3DYQUbCJyetx2zRc3mDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pGvjEqJb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E1DFC19421
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 17:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771523880;
	bh=y5tjNUS7eVV28LuymY23bLtafbnmZBlJzoU7oSXMGC0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pGvjEqJbqZROIjWpYuK7XUPCN1aExBvc4W7jsLfOk4jkhb7sD1X0BVhS4gvTg/Y3S
	 5dVqfXaeYEuLn0nnlrE+7iLWGnyh9A2lGLShkWv36E4GmOvHncoI7Zhmzj8xSOebwR
	 8Cb1krzCCHOlYyYnv4fjo2PgJZqor2hfULzkPJmPYp97ceCT4nNfeB1vH8ArLmAvQk
	 0k+d6o4+3s+40dnoy/ebN2ZRLEDHxlWRJRdNuCtDuCy4UFYs1pp30nE50bPKsUfkv/
	 TDnBIkPOs3Pczu02pjPcRBRnopJo2m0LFuN7ZQE2Xqu5071350csY0wXjnMOjtyW5n
	 vloYzNB2B8pyA==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79628fb5c05so10525037b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 09:57:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWl3+tBg1VyuFmwr4AGgqjfm9a4CHfSa8kMRTXfhWNOhKJtj8RU1eas89uKx9VVkrRbc3qIS1ysS/qR@vger.kernel.org
X-Gm-Message-State: AOJu0YzeY6esw3wvjzR3F6sXHbHDFsXNPcXJrDOuM6a0xJc7aCyK/E1o
	VcXDZIGFtiCtY1vpzz1cXlTmklcEAUCPUyK1Qh5kP0zsBMTOUM7wCm42pXnq5pAOAHcr8OKZKlt
	glFc2dPE5NHLOX+zZSGyVfIdlQH3Fsso=
X-Received: by 2002:a05:690c:e3ea:b0:797:ddf2:7ca2 with SMTP id
 00721157ae682-797ddf2b65emr99418747b3.55.1771523879279; Thu, 19 Feb 2026
 09:57:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211081355.3028947-1-james.hilliard1@gmail.com>
 <338e6575-ec44-4179-94af-9086a7ca79ac@kernel.org> <92359c6d-06ac-4f8d-baa5-6fa45a536455@kernel.org>
 <CADvTj4q74H__JZftOiXkdsY3+E_Xmcx6Y6i70RQDJ0K09=XOHQ@mail.gmail.com>
 <30026ed7-cd19-4be2-adbb-e8bb155a75b8@kernel.org> <CADvTj4oBtO0Yhib1rE8QQwgtJvy-x_hK46C63mjVAydtxHOV8g@mail.gmail.com>
 <20260212195423.GA787785-robh@kernel.org> <CADvTj4rPq8D5piqEijCdAjkWmZtq3Bi_Kxv-4F0aU4xi_O5WKg@mail.gmail.com>
 <CAL_Jsq+Fb0vOggHWkNGusCBcwTQubD1Lc+0=U4+MpZacXqc_ag@mail.gmail.com>
In-Reply-To: <CAL_Jsq+Fb0vOggHWkNGusCBcwTQubD1Lc+0=U4+MpZacXqc_ag@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Feb 2026 18:57:48 +0100
X-Gmail-Original-Message-ID: <CAD++jLn9KJ2sfMtAxVGbcmWQW=1vxdiMNCDLNg-XV3hJDz=O9w@mail.gmail.com>
X-Gm-Features: AaiRm52e5_MjhFloDrcGpMxbrb4MlA2uzq59W5-tgHpEpGZRtMlA-4cAJeEpc5A
Message-ID: <CAD++jLn9KJ2sfMtAxVGbcmWQW=1vxdiMNCDLNg-XV3hJDz=O9w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-aggregator binding
To: Rob Herring <robh@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Bartosz Golaszewski <brgl@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31890-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,glider.be,ew.tq-group.com,bootlin.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9D7381616F7
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 3:34=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> > > Humm, peripheral boards! So there's a connector. You need a connector
> > > binding. And the one solved binding for such a thing is GPIO! The
> > > gpio-map property lets you remap GPIOs from one provider (the connect=
or)
> > > to a parent provider (soc_gpio). It would look something like this:
> >
> > Well...some GPIOs are wired to peripheral board connectors...but
> > some are wired to things like built in LEDs and a few different
> > on-controller components as well which vary by controller hardware
> > revisions.
> >
> > This gpio-map feature doesn't exist in the mainline kernel does it?
>
> For at least the last 5 years. It's even defined in the DT spec
> (generically as "nexus").

I actually tested this. It works.

It's however a bit annoying that we do not have a single upstream
DTS file using it, so there are no examples to look at other than
in the documentation.

I suppose there would also be greater buy-in to the concept if
we had managed to push the same for at least I2C and SPI,
but it's easy to ask other people to work, I know that.

> > In my device everything I'm wanting to name is off the same gpiochip.
>
> gpio-map completely decouples what the base DT GPIOs look like.

> I suspect there's no support for gpio-line-names alongside gpio-map.
> You get to define how that works.

James sent a proposal that I think looks good for gpiochips
and I think the same can be used for nexi. But I don't know
the esoteric details of the nexi so I might be wrong...

Yours,
Linus Walleij

