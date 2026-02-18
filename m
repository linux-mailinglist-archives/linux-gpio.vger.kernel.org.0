Return-Path: <linux-gpio+bounces-31829-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NRhLAxPlmnddgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31829-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 00:45:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 189D715AFFB
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 00:45:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 377C9301E6FA
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 23:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38CF62877E8;
	Wed, 18 Feb 2026 23:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MwdAJmTo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBBF2FBDFF
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 23:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771458312; cv=none; b=SbZntipm0wIJK/aGxf+/1/xTem2PI05Bufr3WfNe58nZKl6f+kJNYJ4Krvvn+/RIYbb6weJ8PzW/YB8NN6P/qJ9C1ebWLvukeMj5oi718YBGrQk+UobHV7PPVVQR74oVEFR7jz+/+wKt3dnhRXWvKyC6iexJk80CXcfrVCg+zkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771458312; c=relaxed/simple;
	bh=g/zBQ9fYhQkODOs80qTbI69FY29uErszLlmjFbFzIdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y9YItPm9G0DO6hWtg/oxC4+QPvRbN9vk95xi/B4Cpzqm9bXlp+4zZD+LdFKWQtV0kHAHl0NcfOEMsE94r2ZAs5stSWsAE0i+Fji8rVPhhRhnFwel9wrQxvdMzfuXLHpGgd1VpH4WrwoTxezGn5CettDXP2dY00IM7RbsQ40APwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MwdAJmTo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 973B1C19425
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 23:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771458311;
	bh=g/zBQ9fYhQkODOs80qTbI69FY29uErszLlmjFbFzIdY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MwdAJmTogHrCc/zGrLePfEWB4DSEoluxfNQ5kHwNjTh57iO20DMQM+gBZeUM3EN78
	 A+tJsYMrUjaoh4vTptDFNLO6ER5FDKuzphYXBqY9qZypMKJaG+dQ7nHRn3nY03sQBB
	 aSK2EXAiYw0JGp1QwYSN5OG0CAFFuWWGkA0Fb0Xf5bGvhoA5qhPLVr850JpVh1sIPq
	 qyIF+RJag0gMCYh1E6oeFDeyqUbDReiYardw653dOPr/mdaXXuKaMtwhX2Peh58FXW
	 6UjRYdXCiVLv7EkpVeDtgynz100jzJe4aF7uA8sPJiFt5UCYC6XcVzFT6G/GqIgZb8
	 KeE4rL3O6wcoA==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-65baa72399fso411483a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 15:45:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+Ez8Biw4jeX+TvIZMj5V5McZMoNtKQ8KY50AMKH58i6JM09RMp+KK/tsVzSGBxNM78J8gMshLT9Up@vger.kernel.org
X-Gm-Message-State: AOJu0YxVT5vu2UVS++WwrjDYew6ngtfyUifsIwA8B1aA58OLMiaoIFu9
	DVztjH/KRH31c0End4wbJ8Xw86mSxi1U66odNYb9N3bEFD35Fu7VdHzJ15aVEUynVYepjZGwiX/
	RQRcIsvW/QjXU4GQkTDopTNtEyddsTg==
X-Received: by 2002:a17:907:1b0c:b0:b87:2bd6:6bc3 with SMTP id
 a640c23a62f3a-b8fc3d3223bmr885836166b.61.1771458310110; Wed, 18 Feb 2026
 15:45:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214213239.2546012-1-james.hilliard1@gmail.com>
 <CAMRc=MfK8k88PfQPvP=p1r3KQ40dwcZq4Z4f5fnRFakpYcknvA@mail.gmail.com>
 <CADvTj4r4mR0_HxcOOZFqJTVfoD=YdrGd2AD+hQNw6ciGUC=C1A@mail.gmail.com>
 <CAMRc=Me6v2E1zKGQzukJmP45cVkRWOGzYoO9=LKh63rPFRqfqA@mail.gmail.com>
 <CADvTj4ovM1faNGoUa4HoTCN7avAqwkZfY5v9P8okgx87or8gDA@mail.gmail.com> <CAMRc=McR613nBkUehva0bidxrUz2eQ1Ud9g1m4gKdXyGzHo_PA@mail.gmail.com>
In-Reply-To: <CAMRc=McR613nBkUehva0bidxrUz2eQ1Ud9g1m4gKdXyGzHo_PA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 18 Feb 2026 17:44:58 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLEKr6G4qZe=vvJzP+KC_WWh0SHOjg14rxQvAvxV7wNUA@mail.gmail.com>
X-Gm-Features: AaiRm52LQxuy6RjUyjTSU6zyoqOBZR4zKCvs5X3EupLezk7vaOVLkTFnKSzUPFY
Message-ID: <CAL_JsqLEKr6G4qZe=vvJzP+KC_WWh0SHOjg14rxQvAvxV7wNUA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpiolib: of: add gpio-line node support
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>, linux-gpio@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31829-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 189D715AFFB
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 3:34=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Tue, Feb 17, 2026 at 8:07=E2=80=AFPM James Hilliard
> <james.hilliard1@gmail.com> wrote:
> >
> > On Tue, Feb 17, 2026 at 6:18=E2=80=AFAM Bartosz Golaszewski <brgl@kerne=
l.org> wrote:
> > >
> > > On Mon, 16 Feb 2026 22:20:10 +0100, James Hilliard
> > > <james.hilliard1@gmail.com> said:
> > > > On Mon, Feb 16, 2026 at 4:38=E2=80=AFAM Bartosz Golaszewski <brgl@k=
ernel.org> wrote:
> > > >>
> > > >> On Sat, 14 Feb 2026 22:32:37 +0100, James Hilliard
> > > >> <james.hilliard1@gmail.com> said:
> > > >> > Allow GPIO controller child nodes marked with "gpio-line" to
> > > >> > configure direction/flags at probe time without hogging the line=
.
> > > >> >
> > > >> > Teach OF gpiochip scanning and OF dynamic reconfiguration handle=
rs to
> > > >> > process gpio-line nodes in addition to gpio-hog nodes.
> > > >> >
> > > >> > Also parse "gpio-line-name" and apply it to desc->name. For gpio=
-hog
> > > >> > nodes, keep "line-name" semantics as the hog consumer label.
> > > >> >
> > > >>
> > > >> One important thing that's missing from this commit description is=
: what is
> > > >> the use-case and why do you need this.
> > > >
> > > > Added some more use-case details in v3:
> > > > https://lore.kernel.org/all/20260216211021.3019827-1-james.hilliard=
1@gmail.com/
> > > >
> > > > In my case I'm setting up the GPIO line initial state and names for
> > > > userspace consumers mostly. I want to be able to configure the
> > > > individual line names from a combination of the dts file and multip=
le
> > > > dtso files for the same gpiochip along with setting up an initial s=
tate
> > > > before userspace consumers operate on the lines.
> > > >
> > > >> The DT binding patch should be sent together with this in a single=
 series. It
> > > >> should also be documented in the relevant .rst file.
> > > >
> > > > Which file would that be?
> > > >
> > >
> > > Documentation/driver-api/gpio/board.rst would fit best.
> >
> > Should gpio-hog docs be moved here as well?
> >
>
> Not moved from DT bindings, just added as they are missing.
>
> > >
> > > > I had previously added docs to gpio.txt but was told here to just
> > > > drop the docs:
> > > > https://lore.kernel.org/all/b851bfd4-3c35-489f-a32d-dcd7a37ca99a@ke=
rnel.org/
> > > >
> > >
> > > There's a difference between device-tree bindings (formal, machine-re=
adable
> > > definition of the firmware ABI) under Documentation/devicetree/bindin=
gs/ and
> > > documentation for humans residing elsewhere in Documentation/. Make s=
ure to
> > > not confuse the two. I would expect both to be supplied with such a c=
hange.
> >
> > What file under bindings would this go in?
> >
>
> Typically the top-level GPIO bindings document but we don't have it
> yet. Or rather: we have the old .txt format and not yaml. I need to
> start chipping away at it at some point...

Most or all of it can be deleted. The same text exists in dtschema
gpio.yaml already. There might have been some parts not moved yet as I
didn't have rights to dual license.

> > > >> I suppose it's another shot at defining what we previously called
> > > >> "initial-line-state", "default-line-state", etc. What happens when=
 someone
> > > >> requests the line, reconfigures it and then releases it?
> > > >
> > > > This should just provide an initial configuration, subsequent consu=
mers
> > > > would override whatever is set here AFAIU.
> > > >
> > >
> > > Yeah, that's what I was afraid of. This is not hardware description, =
this is
> > > user-convencience and as such I don't think it has place in DT bindin=
gs and -
> > > by extension - in DTS.
> >
> > I guess this is more describing a hardware configuration, but is that
> > not allowed in DT bindings? There seems to be plenty of DT stuff
> > that's effectively describing the way the hardware should be configured
> > initially.
> >
> > For example uart/serial nodes have a current-speed property that
> > can be used to configure the initial speed, but this can also be
> > overridden by userspace consumers at runtime as well via
> > termios configurations AFAIU. That seems to be a pretty similar
> > case to what I'm trying to do here with gpios.
> >
> > What's the reason user-convenience hardware configuration stuff
> > like this shouldn't go in DT bindings?
> >
>
> We do have many cases like that back from before DT schema and
> validation. Bindings have become much stricter since and it's assumed
> that DTS should only describe hardware, not its configuration.

No, configuration is allowed. The oldest example is probably uart baud
rate. pinctrl is completely the configuration of pins. But there is a
limit and it's a judgment call.

> > > I'm afraid I don't have good alternatives to offer, solving this has =
been
> > > attempted several times in the past without success. Even gpio-hog wo=
uld likely
> > > not get past DT maintainer review these days but it's ABI now so will=
 stay
> > > supported.
> >
> > What did previous attempts look like? At least this is minimally invasi=
ve
> > and shares most of the code paths with gpio-hog.
> >
>
> They focused more on the "default" state of GPIOs. State to which you
> would revert if not requested. If anything: this makes more sense than
> "initial" state to me which we forget after the first request.

Agreed.

> Right
> now this is something driver-specific. I'll let DT maintainers speak
> if that's something we could put into DT.

If the argument was wanting to do this in early boot firmware, I'd be
more convinced. But to say it is needed for userspace, I'm not really
convinced. My main concern is wanting to describe the state, but not
what the GPIOs are connected to. Is it really nothing and we'd never
ever possibly want to describe that.

Rob

