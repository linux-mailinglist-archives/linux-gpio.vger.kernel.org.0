Return-Path: <linux-gpio+bounces-31830-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHxRMrtRlmlYdwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31830-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 00:56:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 305EF15B0BF
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 00:56:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1770F3024A63
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 23:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763A230C625;
	Wed, 18 Feb 2026 23:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KyOnXJ04"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9A830BF55
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 23:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771458998; cv=pass; b=dhD7JgvD0/ANbEzRRgWhpPco0FQWfCkgjizA0w12WpgcqtKSD0KbV9qAO/FllvgFNOGeT4oDODK3Gh4XIHFOg/j/aQEjjTsPwTCf4CKRO8tBa5gKaPGgpPsp/VV628nDpj/yJhzzeiOFxXDG8UGWT85JdfhyYXNZW3cuy19CM1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771458998; c=relaxed/simple;
	bh=AC4pbwC4YLAUywWsIK9CNWjR33nRd2if5qWenTumErQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DGE1B3HPPV7brj65DyD30FUf/4m3OaqZfVkuDPUBWf9Dhvwq/vk269gacVeRpo/AkkYEL+u7O+kXfbi/seceHbVUTcOVJWhh2C/AorX+Dl0Pg97FMC0tI7GgS0cNskaq0gDWk3FkT5ONm9CsCFJmDpLCpCdQEFfnSkWE6PuCkeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KyOnXJ04; arc=pass smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5fdf71f3327so959495137.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 15:56:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771458996; cv=none;
        d=google.com; s=arc-20240605;
        b=Ir/yB1jGdcnkHeZIhD8nFF9unOVvXVVhoCeLcn4QFtnQ7Ha18/nN2VGxEohRl+T7IR
         YlmSq1Rfo/83uRKLmPj1jH/wnKAQuW7pdE7Ic7hSoebOb0CYAKeGbLRo52z2fq8q1Y9v
         g3+ZXb0Fke6ScJ4rjKBDKolFLE2aKbLrLUFqR4JaNoN+GeTNIy68t2Avjq9NltjUoPlG
         vNz1vhTCN0DisjRXVoS9B1P6GJYgAk6iWmNuSynvMhxUIfDTIYBgU8s4zIwPL3mYDS3M
         G2CmsZWJqdrcqTvX1GgkoTrBcGwa7FVb4Q+KiAfcxfWGRavVay/GW0hdAbJEVR0FR5Rs
         Xuuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AC4pbwC4YLAUywWsIK9CNWjR33nRd2if5qWenTumErQ=;
        fh=k8YqD4ctGzIh9XvUVgLAks0Pq/eVDVAb/5Fcm48n6fc=;
        b=d3VayCJa16QgP+evl7hGgzEkVBCzEeGcGdmTHjD8m2gcFqBiCeJqBgNglFnrRIgZ1B
         c6omJFjnslDujgryd0diGnNbMKrwLR9Dl9A4otU7mpJkIyk40gxb3EjoEIk8KaF0dSSZ
         kG/cgSSip2E3meLzyGBTJWhiEuCwRt5zg7hrapYUN58OQsx1paszAcetuEy9AdEJ5YHl
         YwiE8dkoGbbOwmWJlEE+TBEfF2KB5dzDjD3d7HHtnE3lnqhF2njg4c2RonoWG0owox+4
         nHIabSi6k1r/Lm8XtDvzQFM54v9dY4T5OheU83mvIZHPGIMLNktRSr+/23+Q/37Nswyl
         eF6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771458996; x=1772063796; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AC4pbwC4YLAUywWsIK9CNWjR33nRd2if5qWenTumErQ=;
        b=KyOnXJ04ayXH+BrKEdRFAHznDBo8kQ2e51ksJtTaUeg+9dzyVpmduuzBteUgm/pwIy
         0UrYY7Jxdd9cofLr+TBAC7st9oDfdzHU9xKd+yxbrDSoLVJ4AASpWGsXf+lFeV9wxl5N
         52HUJJa1dRgwxiotK8Ai/ApV8Nxvx7xDbt7mmaLk5IJyL5dBGukr/F0FioTDA72hnGbV
         nPoXHRwcLLkog4hXc+gm9mY2ha5Hhet5KZd6bNLWAfNvv9nNzYs+DCnkNj3E2yjrbnOR
         4pALnL4NdMMr5rS72rYHzTwbMvm0/VzF4Sq7FzXX0kInTPIxXRz6d01Ybk/dPHhPTPta
         p32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771458996; x=1772063796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AC4pbwC4YLAUywWsIK9CNWjR33nRd2if5qWenTumErQ=;
        b=EHtWjhWM9KFBVaOYe41O/dPUYwGj3tKdZZFvWG/qMfU9afU46aT8flx5DnmzfRWu5x
         QncPsOly8R3CZOFC0RLJ7bSa1J9wxspp/yhkZfyr657ClwmInLXO1yOEbs5RVTWTopiA
         TDlAxi0ckmBsIHT/xkfG5Cce4yZ8xvTPf8/yj04jr3tlzYfReJw7JOmAyz3G1iLNCHqU
         jmZCJaL0Q7xPaMKNDtavfYRXC296GOVwvICpR1mlES1pdSmqldbUMCvIASz4xSrB1eUY
         1USgWTZ9UHdYaDEO/wQDaTLRTkyrd3Q/YdWeD16AhivmFVHdnkli7/p1lz1DU5b/3dzR
         nMZw==
X-Forwarded-Encrypted: i=1; AJvYcCUI7E0vhFzFj7ToEvBA61so77437EEZNeLFuFePHANt08YUgop8jHuSrihWcMVHC99dledSNY4mvIkF@vger.kernel.org
X-Gm-Message-State: AOJu0YwUGgs5gWVeuLqGWZMV6OIHQ/Y7WDgX4xnaMH1Tibv4AksbVtOr
	QoUoNnMAquSyGSER6VjleRf20K1l07sHjFM+66i0zY2kEp5xwpknAx+veWV/RnRVAooxTvrccsi
	OxjPQZ44WfIH1MkmQX+iVUO3Nh3yFo7s=
X-Gm-Gg: AZuq6aJxHeRENVaP8i3SIluRA1nS16+fukzTTqotws9Xxv8Ius1varcB+qrYmu9WgwO
	4/kHPLJhLx3Kz/ZJw7pEKb5A0Jk6c6iG3DQfUjMw9dLFrFATTlEcaqV4PZEkwcx0Ue9VAp3PA8R
	tWW2tM470NL+CCGXpuijpt/FZregKOX+Y7wf4io7f9kq/QBifjIIsJL1HAdtsz/6YV3wPzfsUjz
	mHIJDfqBa8/qopgdcaYlzHBrU+07jmDpYIITR9LOCGdMwQ1IUGy5Fthyo3k6eiDVnNXWztwli6v
	pblIRjQPcDVNYlt5q/4pdizR78NDuqR2P4Z8buLuCw89gZyARARRBaIGj6CW0b0QNwM=
X-Received: by 2002:a05:6102:c8a:b0:5fd:fce9:761d with SMTP id
 ada2fe7eead31-5fe90af4167mr9458137.7.1771458995676; Wed, 18 Feb 2026 15:56:35
 -0800 (PST)
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
 <CADvTj4ovM1faNGoUa4HoTCN7avAqwkZfY5v9P8okgx87or8gDA@mail.gmail.com>
 <CAMRc=McR613nBkUehva0bidxrUz2eQ1Ud9g1m4gKdXyGzHo_PA@mail.gmail.com> <CAL_JsqLEKr6G4qZe=vvJzP+KC_WWh0SHOjg14rxQvAvxV7wNUA@mail.gmail.com>
In-Reply-To: <CAL_JsqLEKr6G4qZe=vvJzP+KC_WWh0SHOjg14rxQvAvxV7wNUA@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 18 Feb 2026 16:56:24 -0700
X-Gm-Features: AaiRm50Fz7sVrjYTGUOqByPlip7HX54I2BXLrvfH_CB3_ZB9kbq90tLPHO525g0
Message-ID: <CADvTj4pfuV1s7VzS-cw+66N9HxijZ8x4Gr_jgTqPEqDvpz-hqg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpiolib: of: add gpio-line node support
To: Rob Herring <robh@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31830-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jameshilliard1@gmail.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 305EF15B0BF
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 4:45=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, Feb 18, 2026 at 3:34=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.=
org> wrote:
> >
> > On Tue, Feb 17, 2026 at 8:07=E2=80=AFPM James Hilliard
> > <james.hilliard1@gmail.com> wrote:
> > >
> > > On Tue, Feb 17, 2026 at 6:18=E2=80=AFAM Bartosz Golaszewski <brgl@ker=
nel.org> wrote:
> > > >
> > > > On Mon, 16 Feb 2026 22:20:10 +0100, James Hilliard
> > > > <james.hilliard1@gmail.com> said:
> > > > > On Mon, Feb 16, 2026 at 4:38=E2=80=AFAM Bartosz Golaszewski <brgl=
@kernel.org> wrote:
> > > > >>
> > > > >> On Sat, 14 Feb 2026 22:32:37 +0100, James Hilliard
> > > > >> <james.hilliard1@gmail.com> said:
> > > > >> > Allow GPIO controller child nodes marked with "gpio-line" to
> > > > >> > configure direction/flags at probe time without hogging the li=
ne.
> > > > >> >
> > > > >> > Teach OF gpiochip scanning and OF dynamic reconfiguration hand=
lers to
> > > > >> > process gpio-line nodes in addition to gpio-hog nodes.
> > > > >> >
> > > > >> > Also parse "gpio-line-name" and apply it to desc->name. For gp=
io-hog
> > > > >> > nodes, keep "line-name" semantics as the hog consumer label.
> > > > >> >
> > > > >>
> > > > >> One important thing that's missing from this commit description =
is: what is
> > > > >> the use-case and why do you need this.
> > > > >
> > > > > Added some more use-case details in v3:
> > > > > https://lore.kernel.org/all/20260216211021.3019827-1-james.hillia=
rd1@gmail.com/
> > > > >
> > > > > In my case I'm setting up the GPIO line initial state and names f=
or
> > > > > userspace consumers mostly. I want to be able to configure the
> > > > > individual line names from a combination of the dts file and mult=
iple
> > > > > dtso files for the same gpiochip along with setting up an initial=
 state
> > > > > before userspace consumers operate on the lines.
> > > > >
> > > > >> The DT binding patch should be sent together with this in a sing=
le series. It
> > > > >> should also be documented in the relevant .rst file.
> > > > >
> > > > > Which file would that be?
> > > > >
> > > >
> > > > Documentation/driver-api/gpio/board.rst would fit best.
> > >
> > > Should gpio-hog docs be moved here as well?
> > >
> >
> > Not moved from DT bindings, just added as they are missing.
> >
> > > >
> > > > > I had previously added docs to gpio.txt but was told here to just
> > > > > drop the docs:
> > > > > https://lore.kernel.org/all/b851bfd4-3c35-489f-a32d-dcd7a37ca99a@=
kernel.org/
> > > > >
> > > >
> > > > There's a difference between device-tree bindings (formal, machine-=
readable
> > > > definition of the firmware ABI) under Documentation/devicetree/bind=
ings/ and
> > > > documentation for humans residing elsewhere in Documentation/. Make=
 sure to
> > > > not confuse the two. I would expect both to be supplied with such a=
 change.
> > >
> > > What file under bindings would this go in?
> > >
> >
> > Typically the top-level GPIO bindings document but we don't have it
> > yet. Or rather: we have the old .txt format and not yaml. I need to
> > start chipping away at it at some point...
>
> Most or all of it can be deleted. The same text exists in dtschema
> gpio.yaml already. There might have been some parts not moved yet as I
> didn't have rights to dual license.
>
> > > > >> I suppose it's another shot at defining what we previously calle=
d
> > > > >> "initial-line-state", "default-line-state", etc. What happens wh=
en someone
> > > > >> requests the line, reconfigures it and then releases it?
> > > > >
> > > > > This should just provide an initial configuration, subsequent con=
sumers
> > > > > would override whatever is set here AFAIU.
> > > > >
> > > >
> > > > Yeah, that's what I was afraid of. This is not hardware description=
, this is
> > > > user-convencience and as such I don't think it has place in DT bind=
ings and -
> > > > by extension - in DTS.
> > >
> > > I guess this is more describing a hardware configuration, but is that
> > > not allowed in DT bindings? There seems to be plenty of DT stuff
> > > that's effectively describing the way the hardware should be configur=
ed
> > > initially.
> > >
> > > For example uart/serial nodes have a current-speed property that
> > > can be used to configure the initial speed, but this can also be
> > > overridden by userspace consumers at runtime as well via
> > > termios configurations AFAIU. That seems to be a pretty similar
> > > case to what I'm trying to do here with gpios.
> > >
> > > What's the reason user-convenience hardware configuration stuff
> > > like this shouldn't go in DT bindings?
> > >
> >
> > We do have many cases like that back from before DT schema and
> > validation. Bindings have become much stricter since and it's assumed
> > that DTS should only describe hardware, not its configuration.
>
> No, configuration is allowed. The oldest example is probably uart baud
> rate. pinctrl is completely the configuration of pins. But there is a
> limit and it's a judgment call.
>
> > > > I'm afraid I don't have good alternatives to offer, solving this ha=
s been
> > > > attempted several times in the past without success. Even gpio-hog =
would likely
> > > > not get past DT maintainer review these days but it's ABI now so wi=
ll stay
> > > > supported.
> > >
> > > What did previous attempts look like? At least this is minimally inva=
sive
> > > and shares most of the code paths with gpio-hog.
> > >
> >
> > They focused more on the "default" state of GPIOs. State to which you
> > would revert if not requested. If anything: this makes more sense than
> > "initial" state to me which we forget after the first request.
>
> Agreed.
>
> > Right
> > now this is something driver-specific. I'll let DT maintainers speak
> > if that's something we could put into DT.
>
> If the argument was wanting to do this in early boot firmware, I'd be
> more convinced. But to say it is needed for userspace, I'm not really
> convinced. My main concern is wanting to describe the state, but not
> what the GPIOs are connected to. Is it really nothing and we'd never
> ever possibly want to describe that.

Well the gpio-line-name property for the individual lines is a way of
describing what the GPIOs are connected to in a way that userspace
can understand, at least that's one of the motivations for this change
along with setting up the initial line state. I would probably also add
gpio-line support to u-boot so that initial state is configured prior to
the kernel taking over as well.

Some of the GPIOs have kernel driver consumers and some have
userspace consumers but it would be kinda nice to have a way to
name them all without the limitations of the gpio-line-names which
isn't really capable of operating on individual lines.

>
> Rob

