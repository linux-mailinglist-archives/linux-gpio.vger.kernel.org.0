Return-Path: <linux-gpio+bounces-32308-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJ5FAsCmoWmivQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32308-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 15:14:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEB71B891B
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 15:14:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B8D9305DD67
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 14:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A661410D29;
	Fri, 27 Feb 2026 14:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V++Ip3OX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD0B3F074B
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 14:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772201185; cv=none; b=d/P2k/hlFcKRVB6cYRstndhZI2zGMtRuphGFhTk3Kr1I6fuIj85d99bwNt1U9ELzh6RhSVYrgkUARmMJQspeJUiS6Z/Og8U8N27ijOd4EuqWC+2wZueAFyayhf6zPZIe8DNzo+Aire6cr94Q5mnNt5Lib3a5FdOvUFO/GNVJHaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772201185; c=relaxed/simple;
	bh=V78swCMBy0EDVp9Z1/BFEbZQ/NnZfBxBXJqwi1WkAhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bmiQLTSCOctdoBFfH0WviFa8Tp+JZp8i1q26sMR5qHluvRw3on+0yuMYLlYQT6OTUcvhfeDHVsyFEo13noEVr0efgEoW0cCyD9RYU1P94pppcoTB0NCLwHM30u5ZiRvOs/297nhxPl6oCoX/yQcnWJGmlaPZsL5z0/fnOiJ7az0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V++Ip3OX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2DF9C2BCB5
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 14:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772201184;
	bh=V78swCMBy0EDVp9Z1/BFEbZQ/NnZfBxBXJqwi1WkAhM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V++Ip3OX2lWSVYl+UKTzyeUmdSrFatdp+k2+qy4eFUD7MzxT9mkVQqePLqTkUzSrf
	 fMntO/fdX4am5X7SNNlup9mAoxbJJx4eR6xIHZIKj836a7PlqR36HALSZ/ih86OhNk
	 s4x9aUMpjQ8Ig3rfAiBn7truj22aFW5ea1ABxulXos97kAY6qI1gcrQ84O6Gsnlfaw
	 6ZmVckbU8EMkSIG/bhuzpgsR6tq56ghcLpl3oqCu1uTsLmP7BjYcjs/FFRZ7A+7BbL
	 3tlSisqdhgjKUKu5f3rttMzBHpKwl7QcN6RE/hOkTVAPxY6fK+1BVjh2VfapZzEMVh
	 9EhoynmkBHMFg==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7986e0553bdso19108437b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 06:06:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXGUP4/HT0tlQLbkVz/wu6U0uuYAMO996o79UVAc9Xbxq/Ntv5EhIHskcuUAqb1ZxfV5FXDuFZzmZUv@vger.kernel.org
X-Gm-Message-State: AOJu0YwnKY2d7BsKuISA9kPEAABLqO1F2pPvtnhn8+A82iNwsgM2LotC
	r7EuArJtMCInMcX+aH2e9r4LkvBhIcvlCaqLtV97F0g/Gy+s4/8PrihlHxor8Jlfpl4TiwAk4OR
	DZXRKNF7kmtIFt8na3eNj9wcsWpKvoFc=
X-Received: by 2002:a05:690c:385:b0:798:6c28:dd57 with SMTP id
 00721157ae682-7988554de07mr26608357b3.28.1772201184043; Fri, 27 Feb 2026
 06:06:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225171545.1980385-1-o.rempel@pengutronix.de>
 <20260225171545.1980385-4-o.rempel@pengutronix.de> <CAD++jLnkfcgme27DbAUOKn60HJbJuBghetEqpC8dhGnuMPk=Kw@mail.gmail.com>
 <CAD++jL=PKnAa6CrzGOwPoS_kJJjiHEvztgAFdEoYpHDPj6WT9Q@mail.gmail.com> <aaF0xNKzz74h0gBA@pengutronix.de>
In-Reply-To: <aaF0xNKzz74h0gBA@pengutronix.de>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Feb 2026 15:06:12 +0100
X-Gmail-Original-Message-ID: <CAD++jLkq2HCkJKwt4xwX8PwKzxSGVtLLnWw5i8U9vCga2a8uPQ@mail.gmail.com>
X-Gm-Features: AaiRm532RrAcBAWmH56RMS5aBEUtuVLfNf8FT583QGTAch2yS1YtJvupXbZzHlY
Message-ID: <CAD++jLkq2HCkJKwt4xwX8PwKzxSGVtLLnWw5i8U9vCga2a8uPQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/8] dt-bindings: pinctrl: add NXP MC33978/MC34978 pinctrl
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Peter Rosin <peda@axentia.se>, kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
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
	TAGGED_FROM(0.00)[bounces-32308-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 6AEB71B891B
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 11:41=E2=80=AFAM Oleksij Rempel <o.rempel@pengutron=
ix.de> wrote:
> On Fri, Feb 27, 2026 at 12:02:53AM +0100, Linus Walleij wrote:
> > On Fri, Feb 27, 2026 at 12:00=E2=80=AFAM Linus Walleij <linusw@kernel.o=
rg> wrote:
> > > On Wed, Feb 25, 2026 at 6:16=E2=80=AFPM Oleksij Rempel <o.rempel@peng=
utronix.de> wrote:
> >
> > > > +  - Pins 14-21: SP0-SP7 (Programmable inputs, can be SG or SB)
> > >
> > > What is SB now? Please explain :)
>
> > Oh I see in the driver that this is Switch-to-battery. So document that=
 here
> > in the bindings too.
> >
> > Also it seems that something configured as switch-to-batter must be
> > flagged GPIO_ACTIVE_HIGH.
>
> Actually, the active polarity depends entirely on the external circuit,
> especially since these pins can also be used as controllable current
> outputs.
>
> For example, we attach LEDs directly to the pins. If an LED is
> attached to an SG pin (or an SP pin operating in SG mode), the pin sinks
> current to ground to turn the LED on, making it GPIO_ACTIVE_HIGH from
> the LED consumer's perspective.

Aha OK I see.

My main input to the bindings and the driver design is a second pass
at polarity handling and how consumers in the device tree should
be flagged with GPIO_ACTIVE_LOW and/or GPIO_OPEN_DRAIN
and similar settings and how the Operating System (any operating
system) is supposed to react to that.

My main concern is the semantics with these flags.

Yours,
Linus Walleij

