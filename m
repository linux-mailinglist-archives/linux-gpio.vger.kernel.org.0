Return-Path: <linux-gpio+bounces-31787-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNzSOJSHlWnqSAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31787-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 10:34:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA37154BD8
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 10:34:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23C553016D3C
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 09:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2293A33C1B0;
	Wed, 18 Feb 2026 09:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFAamR6M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BDC2F547F
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 09:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771407249; cv=none; b=C22A5tCA3qrI6g/l25+QFQ4DWNQvQGdLm0QsL6FAoj/6aeB9GuP1hYNsIBCO4UIzEV3+Ddp54r4WZnWyAW7ieYL2ZIXlCp/nkSH528z6hgSKoxdT3DNS70gIXHytFWVFijQ70oO5BGxbjTbnXClBwGJa5ggRdgwAyTtU4QUwY+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771407249; c=relaxed/simple;
	bh=S2fAqnp/pYHLw/y2nvO8RwQgZHk6o0/SJezYNuscCws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gNCvWpXDeXSVmZPbcltN0aURyDUMuZCLm2ZQO0UaCA1D9ehMwK0TPpH8O0Ciu9EBKOKQ7oZRGfJLfPqfo/Y98mS3Hql170cTxiESyesfZB7Xn61yXVDJVb6Cd92vpL9h5O2EtwjIXRUUzkDYjZRPrQAA35mI3ItxUSubpt8BAfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFAamR6M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70818C2BC86
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 09:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771407249;
	bh=S2fAqnp/pYHLw/y2nvO8RwQgZHk6o0/SJezYNuscCws=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lFAamR6M5QFXupgM6YZBksrVr+Dfvq1yhmfdul36U9MfK1nnfP1ossjNXrK+l1lz9
	 M4/zfQ4JX3wk+jY+ZNMlQHeiDwPB65RW5fh68tggMpgKO2yTe4KJZWCVq16jnFOICx
	 7vBX1ihMTletfM+J3gOUnq4Evh7Ma9SYgiNkX8koCCj595a4PzAY0qo51K7AQIIS5u
	 nQnI5CzpNxkoLzQ3ZPXmh4zHM1lozkm9ZWMTvDPTYNPzIKvOF2O6uZLpsrK4Th2bz9
	 8Pr38d7uQFo9hfIdS36H5bb7RjiX7bwipiMncotJY4O19SWByJ7ccUqsTZtVORGSzZ
	 whtGTvEdDuBdQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59e4989dacdso5655289e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 01:34:09 -0800 (PST)
X-Gm-Message-State: AOJu0YwV7tx/sMLTdvePpfUlzpPsPCJZlwhjpKi5fRJfTh1/kPu/P5To
	AbPPa9+ebHTgnlPm65nPPQM9zQmSollK5kanUM0Ye0sA62KYFpTDPFgikJthJ6wUODzA32sXFK7
	m9Mnxcm0GtTGYMA1JehLSjrLqITm2e7xO7whHcD1t2g==
X-Received: by 2002:a05:6512:1193:b0:59e:6098:325c with SMTP id
 2adb3069b0e04-59f69c0f332mr4656697e87.2.1771407248008; Wed, 18 Feb 2026
 01:34:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214213239.2546012-1-james.hilliard1@gmail.com>
 <CAMRc=MfK8k88PfQPvP=p1r3KQ40dwcZq4Z4f5fnRFakpYcknvA@mail.gmail.com>
 <CADvTj4r4mR0_HxcOOZFqJTVfoD=YdrGd2AD+hQNw6ciGUC=C1A@mail.gmail.com>
 <CAMRc=Me6v2E1zKGQzukJmP45cVkRWOGzYoO9=LKh63rPFRqfqA@mail.gmail.com> <CADvTj4ovM1faNGoUa4HoTCN7avAqwkZfY5v9P8okgx87or8gDA@mail.gmail.com>
In-Reply-To: <CADvTj4ovM1faNGoUa4HoTCN7avAqwkZfY5v9P8okgx87or8gDA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 18 Feb 2026 10:33:54 +0100
X-Gmail-Original-Message-ID: <CAMRc=McR613nBkUehva0bidxrUz2eQ1Ud9g1m4gKdXyGzHo_PA@mail.gmail.com>
X-Gm-Features: AaiRm51TpfF5TpICSocGEksfNwterWtJl28o32HV6sZvtB9frFQDrJMQ9pCp8rc
Message-ID: <CAMRc=McR613nBkUehva0bidxrUz2eQ1Ud9g1m4gKdXyGzHo_PA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpiolib: of: add gpio-line node support
To: James Hilliard <james.hilliard1@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31787-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5DA37154BD8
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 8:07=E2=80=AFPM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> On Tue, Feb 17, 2026 at 6:18=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.=
org> wrote:
> >
> > On Mon, 16 Feb 2026 22:20:10 +0100, James Hilliard
> > <james.hilliard1@gmail.com> said:
> > > On Mon, Feb 16, 2026 at 4:38=E2=80=AFAM Bartosz Golaszewski <brgl@ker=
nel.org> wrote:
> > >>
> > >> On Sat, 14 Feb 2026 22:32:37 +0100, James Hilliard
> > >> <james.hilliard1@gmail.com> said:
> > >> > Allow GPIO controller child nodes marked with "gpio-line" to
> > >> > configure direction/flags at probe time without hogging the line.
> > >> >
> > >> > Teach OF gpiochip scanning and OF dynamic reconfiguration handlers=
 to
> > >> > process gpio-line nodes in addition to gpio-hog nodes.
> > >> >
> > >> > Also parse "gpio-line-name" and apply it to desc->name. For gpio-h=
og
> > >> > nodes, keep "line-name" semantics as the hog consumer label.
> > >> >
> > >>
> > >> One important thing that's missing from this commit description is: =
what is
> > >> the use-case and why do you need this.
> > >
> > > Added some more use-case details in v3:
> > > https://lore.kernel.org/all/20260216211021.3019827-1-james.hilliard1@=
gmail.com/
> > >
> > > In my case I'm setting up the GPIO line initial state and names for
> > > userspace consumers mostly. I want to be able to configure the
> > > individual line names from a combination of the dts file and multiple
> > > dtso files for the same gpiochip along with setting up an initial sta=
te
> > > before userspace consumers operate on the lines.
> > >
> > >> The DT binding patch should be sent together with this in a single s=
eries. It
> > >> should also be documented in the relevant .rst file.
> > >
> > > Which file would that be?
> > >
> >
> > Documentation/driver-api/gpio/board.rst would fit best.
>
> Should gpio-hog docs be moved here as well?
>

Not moved from DT bindings, just added as they are missing.

> >
> > > I had previously added docs to gpio.txt but was told here to just
> > > drop the docs:
> > > https://lore.kernel.org/all/b851bfd4-3c35-489f-a32d-dcd7a37ca99a@kern=
el.org/
> > >
> >
> > There's a difference between device-tree bindings (formal, machine-read=
able
> > definition of the firmware ABI) under Documentation/devicetree/bindings=
/ and
> > documentation for humans residing elsewhere in Documentation/. Make sur=
e to
> > not confuse the two. I would expect both to be supplied with such a cha=
nge.
>
> What file under bindings would this go in?
>

Typically the top-level GPIO bindings document but we don't have it
yet. Or rather: we have the old .txt format and not yaml. I need to
start chipping away at it at some point...

> >
> > >> I suppose it's another shot at defining what we previously called
> > >> "initial-line-state", "default-line-state", etc. What happens when s=
omeone
> > >> requests the line, reconfigures it and then releases it?
> > >
> > > This should just provide an initial configuration, subsequent consume=
rs
> > > would override whatever is set here AFAIU.
> > >
> >
> > Yeah, that's what I was afraid of. This is not hardware description, th=
is is
> > user-convencience and as such I don't think it has place in DT bindings=
 and -
> > by extension - in DTS.
>
> I guess this is more describing a hardware configuration, but is that
> not allowed in DT bindings? There seems to be plenty of DT stuff
> that's effectively describing the way the hardware should be configured
> initially.
>
> For example uart/serial nodes have a current-speed property that
> can be used to configure the initial speed, but this can also be
> overridden by userspace consumers at runtime as well via
> termios configurations AFAIU. That seems to be a pretty similar
> case to what I'm trying to do here with gpios.
>
> What's the reason user-convenience hardware configuration stuff
> like this shouldn't go in DT bindings?
>

We do have many cases like that back from before DT schema and
validation. Bindings have become much stricter since and it's assumed
that DTS should only describe hardware, not its configuration.

> > I'm afraid I don't have good alternatives to offer, solving this has be=
en
> > attempted several times in the past without success. Even gpio-hog woul=
d likely
> > not get past DT maintainer review these days but it's ABI now so will s=
tay
> > supported.
>
> What did previous attempts look like? At least this is minimally invasive
> and shares most of the code paths with gpio-hog.
>

They focused more on the "default" state of GPIOs. State to which you
would revert if not requested. If anything: this makes more sense than
"initial" state to me which we forget after the first request. Right
now this is something driver-specific. I'll let DT maintainers speak
if that's something we could put into DT.

Bart

> > How early do you need to set these settings?
>
> Well, before userspace applications can interact with the gpio lines I
> suppose. Essentially so that it acts as a failsafe configuration in case
> the userspace app doesn't get started for whatever reason as well as
> giving some initial starting configuration for a userspace app to act
> upon.

