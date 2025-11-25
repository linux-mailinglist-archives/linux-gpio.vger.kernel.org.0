Return-Path: <linux-gpio+bounces-29070-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C3FC86D05
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 20:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A7B854E5BB7
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 19:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0C8338582;
	Tue, 25 Nov 2025 19:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="losK84xo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE220337B80
	for <linux-gpio@vger.kernel.org>; Tue, 25 Nov 2025 19:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764098903; cv=none; b=UWvsTAWsiu9zXu89bX8IgKwrS0GJsn3DRPRmldwx94S7KsjoeZBRo32tc7gslbO/wf3UaQpV69xijkfZMMQaM3VUyBPJ3IW4KnzIQcu15uimLoOSN8jcDFzbcf16znHCicmkWZQCLJDhnxp81IsAX1KKMaLbwZqk0tP8Shphi8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764098903; c=relaxed/simple;
	bh=fAj9fI/smhHZS2i+arWiP39hGNKYtZ67nqduqRLnfRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CIp6zagjwPK5MK7cXKG4EAc53aR8JmH655zzr3q4AlWNhYJTJXrAOpGFZ36HE+rW8UHNXCwHYKrfTrKc5ZA9rP+vQ1G2F02jhSsjknlIOcJjigywxbAudAziWUos06QEUDup/1OoCq/2fvFFKKYZ3S2XEFhtpLtHLu6jyjFmz2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=losK84xo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8E80C2BC86
	for <linux-gpio@vger.kernel.org>; Tue, 25 Nov 2025 19:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764098902;
	bh=fAj9fI/smhHZS2i+arWiP39hGNKYtZ67nqduqRLnfRE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=losK84xoOog7/9AFiwLk6RWDGbGuR9vWXxuhWxrYaE71yYPGWVpyd9rmUbkByx6hV
	 YT98piZaluAl0Ajy30WLAP+KUAMxMVS63/RqLeA0VAfMQj6iz/JkJEUBR3SNTY5927
	 MJsHa8gSGSJpi0r0fFBksJb0XkKSS+X0mqM+dwG1f6TYjHkt0udkTFmSNY8AhwygBJ
	 XDnO+bDwMi7nffHqCdscMaJCeXCI5cmdyvE9eQEYRpu/AerdBBLhAjAGreO30OqcBj
	 7AMY/njRgF/29N4tm6PHl9HcrklpozzxWFRmRrTEVyG/Xnd/W6xF0Bi+xGTIepkVtw
	 n12kWThzezlTw==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-63fc6d9fde5so5095264d50.3
        for <linux-gpio@vger.kernel.org>; Tue, 25 Nov 2025 11:28:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUs6zdaLHnfxMKzyULp/Y4yd/nm7VcbN+wHoYriXbMgHK3QJFd36lA7zQoj0CEVBiGpmWDcsDrv8onX@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcmz51VmQeJX2rvR7EQ5ylRJX9v2TUz9wVMkkLiZD/iaEt5h+x
	6qdwtWfym/v/l+ftaaX1GOzT0vh/fRndtP2xjhD3XfK0LAYEMRa3owRpDuDbd/mgFxk18A5Gxeh
	3CtRJtoo1IVRyAuykhKwfcGmiDabhYyQ=
X-Google-Smtp-Source: AGHT+IFIaE/WZGNWyon6qjtdwQo5J2MJCQ9Ctmstcy93GeATkxL1uyhZeJJi0933D8MrHhLOnBgI1zRS2Fgm1CHc9vU=
X-Received: by 2002:a05:690e:1509:b0:63c:f5a7:3dc with SMTP id
 956f58d0204a3-64329366d9dmr2295741d50.56.1764098901987; Tue, 25 Nov 2025
 11:28:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-lantern-sappy-bea86ff2a7f4@spud> <20251112-improving-tassel-06c6301b3e23@spud>
 <CACRpkdYQ2PO0iysd4L7Qzu6UR1ysHhsUWK6HWeL8rJ_SRqkHYA@mail.gmail.com>
 <20251124-crayfish-lard-cc7519e1119e@spud> <CAD++jLkehJNGxxQJV6vOA9xurBjwpYcL1ufYBQEOqRjNG-h-fg@mail.gmail.com>
 <20251125-kindness-quicken-a70e3fdd0b8c@spud>
In-Reply-To: <20251125-kindness-quicken-a70e3fdd0b8c@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 25 Nov 2025 20:28:10 +0100
X-Gmail-Original-Message-ID: <CAD++jLmO33B58WUxJiM7c6VCrkQ4nxOmodbOozNmS9LD1VDt1g@mail.gmail.com>
X-Gm-Features: AWmQ_bm9ofiMfGUGkR38HCX3KA3LRPetacX6_LAHAloU61i-ZBhAExWFfaDK5JY
Message-ID: <CAD++jLmO33B58WUxJiM7c6VCrkQ4nxOmodbOozNmS9LD1VDt1g@mail.gmail.com>
Subject: Re: [RFC v1 2/4] pinctrl: add polarfire soc mssio pinctrl driver
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	Valentina.FernandezAlanis@microchip.com, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 6:47=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

> > I think it's unfortunate naming, people sometimes use the word
> > "pinmux" as a DT property, sometimes to describe the subsystem,
> > sometimes a part of the subsystem, sometimes anything related
> > to pins.
>
> I think I actually understand the naming now. It's called pinmux because
> the existing function pinconf_generic_dt_node_to_map() doesn't support
> pinmux, so this is the version you need for platforms that are using
> pinmux. But then nothing about it limits it actually to pinmuxes, other
> than arbitrary property checks, it could actually be used for my pins +
> functions use-case, if I added similar code to amlogics in my probe
> function that creates the functions and groups.
>
> I still think the naming is poor though, and that it is not as generic as
> it purports to be, since it depends on having the exact dt configuration
> that amlogic has, and wouldn't work for spacemit that use the first
> multi-group example that I gave above. I'd be inclined to say that it
> should be shunted back to the amlogic driver, to avoid baiting people
> into trying to use it because of the label position problem,

You're probably right. I see the problem here.

> > I know I should perhaps have shepherded this better :/
>
> idk, I think this is the usual "creating something generic but with only
> one user" problem. Hard to know if it actually is generic at all.

The problem is mostly too few people working on genericizing
the pinctrl code I think, it makes me be happy about any such
attempts. But I should pay more attention, clearly I just looked
at it superficially.

> > > It seems to depend on aml_pctl_parse_functions() being called
> > > during probe which creates the groups and functions.
> > > There's a weird warning about expecting a function parent node that s=
eems
> > > very amlogic specific too.
> > >
> > > In my eyes, there should be some generic dt_node_to_map helpers that
> > > do it all for you on the "configuration entirely described in dt"
> > > platforms because that's what stuff like spacemit k1 driver that do
> > > this in their dt_node_to_map implementations.
> >
> > I think you're right!
>
> My dilemma now is what to call them and where to put them.
> pinconf_generic_dt_node_to_map<something>() feels weird for something
> that is also creating functions and groups, which I noticed because I
> was having to include pinmux.h in pinconf.c so that I could call
> pinmux_generic_add_function().

pinctrl_generic_dt_node_parse_config() or so? Is it vague enough?

Yours,
Linus Walleij

