Return-Path: <linux-gpio+bounces-29066-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE70C852B3
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 14:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E94F93A315E
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 13:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F20322C99;
	Tue, 25 Nov 2025 13:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NH4TdUYk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB67731A80B
	for <linux-gpio@vger.kernel.org>; Tue, 25 Nov 2025 13:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764077107; cv=none; b=PJHFlLqdi8LQyz/G8KEMkh46SFumGB9xEkyRif3mAAUcejmymmr5IgfTEFDXzsVLlg21Dqf4oJJL8QCSf2UDyRRjIFZnY+lMqF3Lzd6N3TVAhTTOmzWxCDd3kGMbhoYOTyg8XbF00CPk4a8aCLSsRzIWL8FMohoxQ/yATpddcYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764077107; c=relaxed/simple;
	bh=FPyBqqFwWhk6eaB9uetXj3XUshpp/EXVGnOWI7sqz0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DSlUrRtkkrR8UivWEtUcGOpUwXJfm1+hDJ8yushpz6YV/ZlaFI+Wc/ecw/xmR8D60NYB1VmxxQsdTpfIa0bNMxDGQvfsJjeyM/Nr9pwWgpH1QIJ6tjVP9CwUe6cHPt7yVDgiV1Uyi0Eg1giOPHfbo0eM7cdq6r/0KWly3W8XmxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NH4TdUYk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884B3C4AF09
	for <linux-gpio@vger.kernel.org>; Tue, 25 Nov 2025 13:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764077107;
	bh=FPyBqqFwWhk6eaB9uetXj3XUshpp/EXVGnOWI7sqz0M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NH4TdUYkUh7Xsqj4bit8Gh2ZvW9P7tXUcWNsErvrzWsY2D9LB4KpQw3wElPjYG2Kh
	 aqt1Crl2OJyO0ozLcw66Bx14K7TrOm9B81kaablokMPuwedRovJqTC8L77kMFpuux+
	 lliJ2liZBOdjg4Btw3ateKRfqJbNQJgvzEbTugyhHM9+VkVnPuMjbuAci3hi3lU/HS
	 CI3oXoBBHyJ+ef8nu8zGU9VYZ95Cow3Ke/RHACF66elJvbz1SWrA4B/pItfjuZdItl
	 sspzHMTs1/PcZe6ADRqeaBQi59UjmdEgvO0Ge78LWQ8EA9I5xnJLSk6loqujEQG73x
	 HvRZCO/P+reVA==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-787e84ceaf7so55527147b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 25 Nov 2025 05:25:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX8GHQXxBo2MsofxfSn4tJoxRSd8qLvc6LFBaLcxk7pWt3syP+denE9+iGkyLb7vnP8e4Hp/tfdFwdt@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6hSYhQkEWgE2eVBQyEoEgRo80CfplYKXxNkhmOD9lTFBIBMsZ
	GGdHkkpxeIN80fu5lChP8LhlTVkCv2qtLRIl7tmOENRXXUxpNjm1WR9JMA341nnoWd6gxvFKSCt
	C54bzTyhPGMqzR3E3wuEPatMdKPneTsk=
X-Google-Smtp-Source: AGHT+IFhRE1ILRuTBkbhYwyPnCDEJgxBOhpApftiaGhDTJ+wvAPws2O+6jJqZACEeO0fCVi4LDyQQzOVGTx00oVjtKU=
X-Received: by 2002:a05:690c:3348:b0:786:a967:5a8a with SMTP id
 00721157ae682-78a8b521351mr116767487b3.51.1764077106811; Tue, 25 Nov 2025
 05:25:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-lantern-sappy-bea86ff2a7f4@spud> <20251112-improving-tassel-06c6301b3e23@spud>
 <CACRpkdYQ2PO0iysd4L7Qzu6UR1ysHhsUWK6HWeL8rJ_SRqkHYA@mail.gmail.com> <20251124-crayfish-lard-cc7519e1119e@spud>
In-Reply-To: <20251124-crayfish-lard-cc7519e1119e@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 25 Nov 2025 14:24:55 +0100
X-Gmail-Original-Message-ID: <CAD++jLkehJNGxxQJV6vOA9xurBjwpYcL1ufYBQEOqRjNG-h-fg@mail.gmail.com>
X-Gm-Features: AWmQ_blHo1ty5-S0e3NCNZzxGhsqsZf2Biuast8gNGtspqWD6HtMxyy46_tdORk
Message-ID: <CAD++jLkehJNGxxQJV6vOA9xurBjwpYcL1ufYBQEOqRjNG-h-fg@mail.gmail.com>
Subject: Re: [RFC v1 2/4] pinctrl: add polarfire soc mssio pinctrl driver
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	Valentina.FernandezAlanis@microchip.com, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 8:14=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

> Started looking at this today too, and I found one of my sources of
> confusion - the recently added helper which I think is confusingly
> named. pinconf_generic_dt_node_to_map_pinmux() works differently to
> pinconf_generic_dt_node_to_map(), because it only works if you have
> the following setup:
>
> label: group {
>         pinmux =3D <asjhdasjhlajskd>;
>         config-item1;
> };
>
> It does not work if you have:
>
> label: cfg {
>         group1 {
>                 pinmux =3D <dsjhlfka>;
>                 config-item2;
>         };
>         group2 {
>                 pinmux =3D <lsdjhaf>;
>                 config-item1;
>         };
> };
>
> Specifically, the label must point to a group.
> pinconf_generic_dt_node_to_map() does not work like this, it accepts both=
!

My feeling is that this is a bug, it should certainly handle configs
with subnodes.

> I think the pinconf_generic_dt_node_to_map_pinmux() function should
> actually be called pinconf_generic_dt_subnode_to_map_pinmux(), because
> it operates at the same level as pinconf_generic_dt_subnode_to_map().

If it should be renamed, yes. But I think it should be fixed to
parse subnodes, if present.

> Probably there should be a "real" pinconf_generic_dt_node_to_map() that
> accepts both setups, since AFAICT it is pretty normal to have different
> pins in a group that get different pinconf settings. Obviously

I think it should be fine to augment the existing function to handle
both cases? (configs inside the current node or in subnodes
alike) I don't see it causing any regressions.

> label: cfg {
>         group1 {
>                 pinmux =3D <dsjhlfka>;
>                 config-item2;
>         };
>         group2 {
>                 pinmux =3D <lsdjhaf>;
>                 config-item1;
>         };
> };
>
> peripheral {
>         pinctrl-0 =3D <&label>;
> }
>
> isn't the only way to do things, and the amlogic user of the current
> setup could just go and do
>
> cfg {
>         label1: group1 {
>                 pinmux =3D <dsjhlfka>;
>                 config-item2;
>         };
>         label2: group2 {
>                 pinmux =3D <lsdjhaf>;
>                 config-item1;
>         };
> };
>
> peripheral {
>         pinctrl-0 =3D <&label1>, <&label2>;
> }

That works too, because sometimes you want to pick a few
different configs and collect them as one.

> Even then though, I'm not really sure that this function does what I
> would have expected it to do, because it won't work as a replacement for
> the custom dt_node_to_map in the spacemit k1 driver, for example, even
> ignoring the requirement about how the labels are done in the dt. That's
> because it doesn't actually do anything with the pinmux property, despite
> that being in the name. It never actually interacts with the pinmux prope=
rty
> at all AFAICT!

I think it's unfortunate naming, people sometimes use the word
"pinmux" as a DT property, sometimes to describe the subsystem,
sometimes a part of the subsystem, sometimes anything related
to pins.

I know I should perhaps have shepherded this better :/

> It seems to depend on aml_pctl_parse_functions() being called
> during probe which creates the groups and functions.
> There's a weird warning about expecting a function parent node that seems
> very amlogic specific too.
>
> In my eyes, there should be some generic dt_node_to_map helpers that
> do it all for you on the "configuration entirely described in dt"
> platforms because that's what stuff like spacemit k1 driver that do
> this in their dt_node_to_map implementations.

I think you're right!

> I'm not gonna get in over my head, and just make a helper for doing the
> pins + function thing that I need for my driver, but would you be open
> to an equivalent for the pinmux scenario?

Yes!

> I'm thinking of something
> that'd work for both the amlogic platform and for the spacemit k1.

That's a good start!

Yours,
Linus Walleij

