Return-Path: <linux-gpio+bounces-31959-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMIFDJthmGkVHgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31959-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 14:28:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8AC167CCA
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 14:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2887C3016AE4
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 13:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E8C346795;
	Fri, 20 Feb 2026 13:28:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E61627C866
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 13:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771594135; cv=none; b=T66xaGBXx2NydQmsf2zvEU9uMhCshOJuK0maKLR5RJEy198LzLsQC8fzCpFamrHGsWiAEMZJHNQxcys3Mc8Kr4JhahO6hNroaO/PoyTgSREUeP6IyOVe7wmsZpH9loLXBJcUdMKGuSFYI3s2cb5qVM0fBvAmCgIEIaPRY4ZjIa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771594135; c=relaxed/simple;
	bh=UhnH2dBDoCzhvJVOBnFDj+m3IVQBH0bJOZDWlXWdcok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PgrRMVo9lcLOj8Okpg2Rtagn8d5Yg/OlrrMbfo2SM8c2dhkwGxir8Z/977wnGYs7Y65e/egG3trCt8iou9liey8aOWw+3ExaZ7RTdwg/0uN7z73FKjtBGA25uOBj1+IM8z7F98ZVJgqxErGVZLvyV0NA4n0srMLAirGyP88l3lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5fe086fb0bdso566409137.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 05:28:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771594133; x=1772198933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sYatmTr85+RK5ok/q4tw6aLeAlLvU9kjQfcMAJNU4U8=;
        b=Izp+L5X8R/DjXn5TlzVcUyhiaO7Id0E2CrZETzKCrtt0QSMDXYkoVFefbkL6aMvGE2
         SsLIe5o6hrBmlDbNsPRN0+cd+zJwfCph1lTsF+PjClq/QDcxrGLeKNvDefXB8m+t+Nzh
         wE0JIYG04F1Ec4LgDWTwLrQiv/4RdEQCxNtx3286cYxoOPRNqHn79zPnCcLMbrx1/ILt
         HtM3yE+7uyoTTf6o10h7IzmR2dvFmsO3dht1Q+kzrQKKTf3aeE5jhUNe1MMt62UKG92K
         FoFD/3v5Zfphnr71sQh3+CDRAgpjzDyFPajH7GWZZshWWQVJuFNeLIRfXcVyOGHe/DEM
         W9dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH6zuApqq2vc2CTzDGrjA6ac3+kDAcpzOIjRmZno1g3KciMOBq9eP/S6I3IeOVyea/PniGrCRBUu34@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1OvYo+bPmcgDueMblvZgU72Yh6y8BuV+0SBWkzw/TOZ6D8Bfb
	MShy8+lx9hWl95KP8HFeH1IN8iALwN7OPZ0pWAOnXtrJckxZ3cOcgAhMv+G1yKVi
X-Gm-Gg: AZuq6aLOD4FotiVEBlzRQAsMs3TU0+ltxz4RMsao/frN0dunob2nTMMQIatCJ6X6Xod
	+YsRDhNUeG9FB8FSbj8fvQTAns/H8po7aFg4UGQN54F9LQXUCrsD7Q6XyEumAz6tmSa+5p2WYuS
	eadXNin8ndJoWIfB/FjHSvIJWclZZjcKUczAk1StXfBIRY8wwX7wpl+WA9OlWzkeCephDa4nXME
	50xsz788GKTMJXKDWjs9VJbRAUOsVnHSXRMJAQVCexuhWrc8irwh77Jqcq6tuObuAIK2B4a6AUU
	iVg8U+SVbtGdgwSuSCk/rBkghAKQTbcyrqr6xt0N0BrNszE1wWWPjkOaTmrqbB/loxLU43GOAmB
	A6umwNRtjB/gckUW5rGygH72h+mSlOrt2rOahAiwys9mwUC5XobG/IkwaaNDpRCUp8Z8+kJdFWf
	DPo7nEY7UIERGlY3vxe/9AdcJvMzx/MJZtFb3iIiFOPjlBLjtKCuodU5kijvUM
X-Received: by 2002:a05:6102:c8f:b0:5f5:3abd:9301 with SMTP id ada2fe7eead31-5fe7fda5c4dmr3272761137.35.1771594132794;
        Fri, 20 Feb 2026 05:28:52 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94afd1ad879sm16669583241.6.2026.02.20.05.28.52
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 05:28:52 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5fe086fb0bdso566404137.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 05:28:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV88HKMGXjAORe1fAmviK7om4mval5jrYd+r0i0+kFtr4bEbMgZQtQ7nwAIHiPgxVrt+916/PuVjxJ8@vger.kernel.org
X-Received: by 2002:a05:6102:32d5:b0:5f5:5857:35c0 with SMTP id
 ada2fe7eead31-5fe7fc1c35amr3105314137.13.1771594132085; Fri, 20 Feb 2026
 05:28:52 -0800 (PST)
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
 <CAD++jLn9KJ2sfMtAxVGbcmWQW=1vxdiMNCDLNg-XV3hJDz=O9w@mail.gmail.com>
 <20260220091727.5330accd@bootlin.com> <CAD++jLmwAb35RW1fh3ONc-R4ca_NeWPWhWag-c-xv0oACNAG9Q@mail.gmail.com>
 <CAMuHMdUkdF1X7xZvu9uhNPJBnq6grq-BvBk-598f=h7uTbYbVA@mail.gmail.com> <20260220140703.0ba7b435@bootlin.com>
In-Reply-To: <20260220140703.0ba7b435@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Feb 2026 14:28:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVjpj0q2WacsgeTFzZULecZb0R4NLv2KaT3ZMu6j-xOSw@mail.gmail.com>
X-Gm-Features: AaiRm53OUstZjIQmruRYtvjxVjDV6vkWb2Hn-3KHrEv1Xt_MEbxv64SR8_ZbOqA
Message-ID: <CAMuHMdVjpj0q2WacsgeTFzZULecZb0R4NLv2KaT3ZMu6j-xOSw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-aggregator binding
To: Herve Codina <herve.codina@bootlin.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	James Hilliard <james.hilliard1@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,ew.tq-group.com];
	TAGGED_FROM(0.00)[bounces-31959-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.975];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[4c:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: BA8AC167CCA
X-Rspamd-Action: no action

Hi Herv=C3=A9,

On Fri, 20 Feb 2026 at 14:07, Herve Codina <herve.codina@bootlin.com> wrote=
:
> On Fri, 20 Feb 2026 10:15:59 +0100
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, 20 Feb 2026 at 09:35, Linus Walleij <linusw@kernel.org> wrote:
> > > On Fri, Feb 20, 2026 at 9:17=E2=80=AFAM Herve Codina <herve.codina@bo=
otlin.com> wrote:
> > > > With nexus, you cannot translate &spi0.
> > > >
> > > > Also nexus works well when an index is involved. In other word, it =
works
> > > > well with phandle with args.
> > > >
> > > > i2c-bus =3D <&i2c0>;
> > > >
> > > > In this kind of of definition, no index are present. With nexus nod=
e, this
> > > > looks like
> > > >
> > > > i2c-bus =3D <&nexus>;
> > > >
> > > > How to handle multiple i2c busses with nexus node?
> > >
> > > Can't you just use the foo-n suffix trick from the pinctrl etc?
> > >
> > > my_nexus: nexus {
> > >    gpio-map =3D <...>;
> > >    interrupt-map =3D <...>;
> > >    nexus_i2c0: i2c-bus-0 =3D <&i2c4>;
> > >    nexus_i2c1: i2c-bus-1 =3D <&i2c6>;
> > >    nexus_i2c2: i2c-bus-3 =3D <&i2c8>;
> > > };
> > >
> > > &nexus_i2c1 {
> > >      sensor@4c {
> > >           ....
> > >      };
> > > };
> > >
> > > Maybe it's not as elegant but I think it could work?
> >
> > Wasn't that already solved using i2c-parent, cfr. the connectors
> > discussion at last ELC-E?
>
> Well, I wouldn't say "solved".
>
> But yeah, the idea is i2c bus extension:
> https://lore.kernel.org/all/20250205173918.600037-1-herve.codina@bootlin.=
com/
> https://lore.kernel.org/all/20250618082313.549140-1-herve.codina@bootlin.=
com/
>
> When DT overlays enter in the loop, the main issue is to reference a
> symbol from the overlay.
>
> This issue led to DT addons to replace overlays:
> https://lore.kernel.org/all/de02ed8c-0176-4996-ad7a-680a2e115161@beaglebo=
ard.org/
>
> All of these is really out of scope of this "dt-bindings: gpio: add
> gpio-aggregator binding" series.
>
> I am open to discuss nexus nodes, busses, DT addons but I don't thing thi=
s
> series is the right place to do this discussions and, on my side, I don't
> want to pollute James' work with all that stuff.

So true ;-)

If James' connector uses only GPIOs, he can already use the GPIO
aggregator:
  1. Write DT bindings for the "device" (the expansion board) attached
     to the connector, with a real compatible value,
  2. Add the real compatible value to gpio_aggregator_dt_ids[].

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

