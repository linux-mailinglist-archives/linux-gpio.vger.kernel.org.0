Return-Path: <linux-gpio+bounces-31677-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJY3BZSqj2m2SQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31677-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 23:49:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC38139DB9
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 23:49:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8DB7303DD38
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 22:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55593176E7;
	Fri, 13 Feb 2026 22:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eih4Buj9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D0C3161B5
	for <linux-gpio@vger.kernel.org>; Fri, 13 Feb 2026 22:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771022989; cv=pass; b=jDzyMKn/pHVeFapfjWm9gt31HMMIdjwkK3dGHsVaKlA6K3P3n5/VqA74h2ut/3Menk6fygehlANxXSQj9hEVsA4DOuU9xoTHXCPJZn8UGjFWUQIMTTlOwgdFsSgQjcPGV3oEhZkFo7mXkKZuE0PSmkQ++cPReNDM/gPyuVQ2ln8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771022989; c=relaxed/simple;
	bh=9kNLURRl9epMH2EGWpNGXjQSwO+2bGtfXsiuAbAVrkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OJIebHT3yawhLf8xgzN60aPzqdfeAZ3FgfTlTLdUTw+sPZ8iP8NW/Ql6b5i6dhE2RsD3LAlxlxIPsGVF2bI2ZXz54JHgep27xqq4dylXODFs7+PwssKd0fOMiM71j7g1Xwep0n+lLvh639i27pnp18d4eNnPz2jY6u4COc1bpZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eih4Buj9; arc=pass smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-948bfb6b6bcso448470241.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Feb 2026 14:49:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771022987; cv=none;
        d=google.com; s=arc-20240605;
        b=aw2NZKpna81c8h44EUmX8YZctIB8AvWhJTAHpaTJqxBgzy4h3XsAWHGVIwqA28oA3o
         mAIiMrGHqxwzihvBsyuSJehcSWaY0gPDDWO+yySBugVmiRhc3P6unRw2FQYIPV+teBSo
         LLLjAsDn392xfXgzuxW7qMMfdZjwXTqy6sa+Eg3LP383sjg3hDqNOngPMV1j+uEqno5c
         GN7kdttQ3cxE/UYbFdZvr17iUkwR8VjQZt+XyD7dyMNAXaN/cRJ6Mi9CtvhSZT1PrcF8
         DzoyWGHmCopQ0Ec9VnQy4nKK2HtgfayaRgGpOHPfwrXZNczrDOqJeYU9btFXUbsbTwPm
         jPrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fm/Ku3H4FZvf+zzBHFNaTUSrm5SHhsvOTJezFOttYB4=;
        fh=H7G8LLH3ZXw6cge+yr9Ybd3uLkYArf5SpaMqJLK0CpU=;
        b=K8yvUMLj9Avwsuqq+NfsIBruFva99NtCTSLkhQrOjU06pReU/2tDTnX1SJSZ1ral5p
         9oQO2OvXbXrBC/OWmwK1G7hN192KrxLb6JafHwkXdqDeDfF8RgO90GfupgE5tTI1T6jf
         x2JuZrLmAK6uJBvMrWAYXUPhZJtYxrIbfv8yzFWSHqB6FKJGC+05y3G4QcDHpix3/iRn
         /HAPZwVMnMiYoVCt+jojj4X69zWjL2mVm/ALLFtm58CVQUnBi9hkve242jIjyIm+Eoq6
         PT8Avr+0SMNrJW5dtrauzBWkOZSdqFSLq83eWWpmedLXIM6j9o6wzzz+Jxi22fdbF11o
         NCPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771022987; x=1771627787; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fm/Ku3H4FZvf+zzBHFNaTUSrm5SHhsvOTJezFOttYB4=;
        b=eih4Buj9GVbAVBtpKVwM3dT5dceuOrV0GxYp24TwsTHAbL8B/HECL5XGWDw+z+wsKF
         HIXfDlwvhDPNX1sUbxo/CpkdPFHgiUxICN5GbSme6rOEVsD148h1L7RE7lIZRTvDUza5
         Cydh59ng+7voQL2egV5pUZNO29NPbh3vB/+N5S58S8ZMKLNEVIf7aayDyvZuk/VECBoF
         ZjhiT3SqbZQ87VEImkCCnZ6nFl1Ye/i/mrLc/aAgqmfYkdtdPcaTyDlVe3K7XoXh8Dsc
         ASRXqryPd9wv6R/BEgaedjolV1xGWSEBV9uot2hSvOVKXr1AGmVZ+9w37GTbp3hVF7Uk
         Oilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771022987; x=1771627787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fm/Ku3H4FZvf+zzBHFNaTUSrm5SHhsvOTJezFOttYB4=;
        b=kKUGqq8V7Ll3asUpEVEitBdOlUoXbeQ/5P6u/LUvyISSi0U7k1h2bfLSY3uiVKoc3j
         gtlqVyenFGRm19+JrxhO2AZpaur1DZMghy0YDDhQxxoD13YzYb5mvHRPYjqXKQiRCN7u
         26mfA2hGeaJg/ZeHSl4f5DA2YJvYyRPC0/omEPpghmfDGiso2NhEkHtRfvaqvxuTT8CR
         2IuDxmBkN4pHwzo2N+jZiR58CBfR4fhDJJglicAf5WDntrZcb4NXTk11iVLewiKa+Fbh
         YwpNcfSRqgiRlDAJqGbYpd9L8bj/wYpbgDG3T+Wmy4Fyub9C6awTCgZmi/kY0o0xFb2F
         6r0w==
X-Forwarded-Encrypted: i=1; AJvYcCXKaE+I1/VJ+LhyJogYvTce+mDXeQrmfQJSMKhPoaTLYAf/5hFS/tLvrPFgknpNH6tarsC0GkZI8Y48@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ8O9IjCvQ8hBpzRJ9EqmfN3bMuINkFfqNtz96nLrj8csFg6DD
	EYH8GHnb11cwwlFrJjpfOSuGiQ4tskYwfqz+7zaN6YjAUudFcOEDhA6Wx+eZ79q1DMGEo5EcFaQ
	pM7GOikG4gxTRX6A6HzIk0G8NDOhXsKauu5ql
X-Gm-Gg: AZuq6aLpcwl92g30rRYnv+harUxDDwWvxrqT4B1YOzuf1paIYlP99AJXEHJEnDgjT66
	hVrJgTmL751DIy62QjFHE2yR14z6zSfndO9jVIaXWl34fFYADx16Pz3Wsc3wubtHg62eHEXnQkP
	rCg+YjVGQDSQ8XVGqplx64r4xGh+5CG1aW0r0OPtOLxXkSN9Act83C+u5WimOYNFRoyfbXMkjor
	t6MXweXmg3CTx1LY2vj/XLIEOpMXkhuAGuaU/hUYHC6anNdPmsyxjlrQUIr/nOgMDKbrClEgc9W
	0xaK59dOzXlCvRPSF8Q0Ljp+RaCExc5EedhKw0DbXRxptgU4moaFBdiEeVHcN8H7Llb9ObNbohX
	3DXE=
X-Received: by 2002:a05:6102:3583:b0:5de:93bb:c53f with SMTP id
 ada2fe7eead31-5fe16ee2466mr1332610137.25.1771022986851; Fri, 13 Feb 2026
 14:49:46 -0800 (PST)
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
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Feb 2026 15:49:36 -0700
X-Gm-Features: AaiRm51ZFxUyPIsRwBEEG2RmrGgxnbc0sWqKUh340EJHCarzH8oO2L9mHlRuunI
Message-ID: <CADvTj4rfgEjMNkjg-A0Jn=brO1SUBzQtL_+wra8RWdgBDVdU5w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-aggregator binding
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31677-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jameshilliard1@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6AC38139DB9
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 7:34=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Thu, Feb 12, 2026 at 3:22=E2=80=AFPM James Hilliard
> <james.hilliard1@gmail.com> wrote:
> >
> > On Thu, Feb 12, 2026 at 12:54=E2=80=AFPM Rob Herring <robh@kernel.org> =
wrote:
> > >
> > > On Wed, Feb 11, 2026 at 10:01:05AM -0700, James Hilliard wrote:
> > > > On Wed, Feb 11, 2026 at 1:44=E2=80=AFAM Krzysztof Kozlowski <krzk@k=
ernel.org> wrote:
> > > > >
> > > > > On 11/02/2026 09:28, James Hilliard wrote:
> > > > > > On Wed, Feb 11, 2026 at 1:19=E2=80=AFAM Krzysztof Kozlowski <kr=
zk@kernel.org> wrote:
> > > > > >>
> > > > > >> On 11/02/2026 09:17, Krzysztof Kozlowski wrote:
> > > > > >>> On 11/02/2026 09:13, James Hilliard wrote:
> > > > > >>>> Document the gpio-aggregator virtual GPIO controller with a =
dedicated
> > > > > >>>> schema and compatible string.
> > > > > >>>>
> > > > > >>>> Also extend the GPIO AGGREGATOR MAINTAINERS entry to cover t=
he new
> > > > > >>>> binding file.
> > > > > >>>
> > > > > >>> <form letter>
> > > > > >>> This is a friendly reminder during the review process.
> > > > > >>>
> > > > > >>> It seems my or other reviewer's previous comments were not fu=
lly
> > > > > >>> addressed. Maybe the feedback got lost between the quotes, ma=
ybe you
> > > > > >>> just forgot to apply it. Please go back to the previous discu=
ssion and
> > > > > >>> either implement all requested changes or keep discussing the=
m.
> > > > > >>>
> > > > > >>> Thank you.
> > > > > >>> </form letter>
> > > > > >>>
> > > > > >>
> > > > > >> First thing which was missing (I did not even check the rest i=
n such
> > > > > >> case): missing rationale for this patch, missing hardware desc=
ription.
> > > > > >
> > > > > > I added some more details to the commit message, this is a
> > > > >
> > > > > No... Commit msg is exactly the same.
> > > >
> > > > I added the details to this commit message specifically:
> > > > https://lore.kernel.org/all/20260211081355.3028947-2-james.hilliard=
1@gmail.com/
> > > >
> > > > >
> > > > > > virtual gpio driver though so AFAIU it's not hardware specific.
> > > > >
> > > > > You can give example of any hardware where this is useful. You ne=
ed to
> > > > > make your case with actual arguments.
> > > >
> > > > The sunxi h616 board I have has hundreds of GPIOs, only
> > > > a few of which are needed, I want to map them in device
> > > > tree overlays since there's some minor variants with different
> > > > hardware gpio configurations.
> > > >
> > > > Setting the gpio names on the parent controller is not practical
> > > > since doing so would require setting hundreds of values for
> > > > gpio-line-names, you also can't really combine sets of pin
> > > > names across device tree overlays AFAIU.
> > >
> > > You can do: gpio-line-names =3D "GPIO0", "", "", "GPIO3", ...;
> > >
> > > The clock binding has "clock-indices" which is used with
> > > "clock-output-names". We could do something similar if
> > > all the '""' entries are really a problem.
> >
> > AFAIU this doesn't solve the line name merge issue.
> >
> > I have some GPIO lines that are common to all control card
> > variants, as such I would like to put the names for these lines
> > in the base dts file so the names always get applied.
> >
> > I also have some lines that that are common to a subset of
> > control card variants(which I detect via GPIO strapping in uboot),
> > as such I would like to put the names for these lines in a dtso file
> > that is conditionally applied by uboot based on the control card
> > variant. There are actually multiple GPIO groupings, some are
> > for peripheral connectors and others are for control board
> > integrated hardware.
> >
> > So what I want to be able to do is effectively merge all the GPIO
> > names from a dts file and multiple dtso files, and you can't merge
> > list properties, you can only override them entirely AFAIU.
>
> IIRC, there was some dtc work to prepend/append to properties.
>
> > > > > > Use case is I have a device with something like 300 gpio
> > > > > > lines...and I want to name/group a small subset of those
> > > > > > lines for delegation to a userspace app rather than trying
> > > > > > to set 300 or something gpio-line-names values, also I'm
> > > > >
> > > > > So if I change the approach in user-space or use different user-s=
pace
> > > > > app then I change the DTS?
> > > >
> > > > The idea is to make it practical to set gpio-line-names for a
> > > > subset of the GPIOs that are wired to peripheral boards.
> > >
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
>
> > Would this work with multiple connectors?
>
> Yes.
>
> > In my device everything I'm wanting to name is off the same gpiochip.
>
> gpio-map completely decouples what the base DT GPIOs look like.
>
> >
> > >
> > > conn_gpio: connector {
> > >         #gpio-cells =3D <1>;
> > >         gpio-map =3D <0 &soc_gpio 3>,
> > >                    <1 &soc_gpio 123>;
> > >         gpio-line-names =3D "GPIO0", "GPIO1";
> > >
> > >         /* in an overlay */
> > >         device {
> > >                 foo-gpios =3D <&conn_gpio 1>; /* soc_gpio 123 */
> > > };
> >
> > I think in my case the entire connector would be in the overlay, as
> > the connector GPIO lines vary by control board hardware revisions.
> > Would that still work?
>
> You mean you have an overlay for h/w revision of the base board and
> then an overlay for the peripheral board? I'm only talking about the
> latter.

Mostly the base board at the moment, the peripheral boards tend
to be more similar in terms of GPIO configuration despite having more
subvariants.

>
> > Would the gpio-line-names defined here get set on the parent
> > &soc_gpio gpiochip or would they show up under a virtual
> > separate gpiochip similar to gpio-aggregator?
>
> I suspect there's no support for gpio-line-names alongside gpio-map.
> You get to define how that works.

Yeah, I gave that a try but it was problematic, gpio-map also
needs an in kernel consumer to do anything which is not ideal
if one wants the effective consumer to be in userspace in some
cases.

I experimented and came up with an entirely different approach,
I added a gpio-line that's configured like a gpio-hog and then added
a gpio-line-name override property to that, this seems to allow
for setting up the lines for userspace handling and allows for setting
individual line nodes from multiple overlays for the same controller:
https://lore.kernel.org/linux-gpio/20260213223204.2415507-1-james.hilliard1=
@gmail.com/

>
> There is no gpiochip for the map. It is transparent.
>
> > > >
> > > > Say for example I have a control board connected to a few
> > > > different peripheral boards, there may be different mixtures
> > > > of peripheral boards, some of which can be used at the same
> > > > time as they use different GPIOs.
> > > >
> > > > The idea is we load device tree overlays for the detected
> > > > peripheral boards with detection done in uboot based on a
> > > > GPIO pin strapping based detection.
> > > >
> > > > In userspace we want to match the peripheral board GPIOs
> > > > based on the GPIO line names, but using gpio-line-names
> > > > on the entire GPIO controller isn't practical as that doesn't
> > > > allow composing gpio-line-names configurations from
> > > > multiple device tree overlays and would require a ridiculous
> > > > number of placeholder entries due to there being no way
> > > > to configure individual gpio-line-names for non-hog lines.
> > >
> > > GPIO lines typically connect to something. Relying on gpio-line-names
> > > seems like a failure in defining (in DT) that something.
> >
> > Isn't gpio-line-names intended to describe what they are physically
> > connected to? At least that's how I'm seeing them often get used
> > in mainline device trees.
>
> No doubt. People want names for everything, so we give them names so
> they stop asking.
>
> *-gpios is how you describe what GPIOs are connected to. This works
> unless you aren't describing the device/thing the GPIO is connected to
> in the DT. The first thing to do there is question could you describe
> it?

I'm thinking my gpio-line approach may be a better way to describe
the lines, it also lets one describe the initial GPIO state before
userspace has a chance to touch the lines.

>
> > > We would never rely on GPIO pin names in the kernel. Userspace doing
> > > so is pretty suspect too. More importantly wanting to do something in
> > > userspace is irrelevant to bindings. What's in userspace today may be=
 in
> > > the kernel tomorrow. Look at serial attached BT or other h/w.
> >
> > Why is that suspect for userspace? The userspace tooling for
> > gpio manipulation largely seems to support flags for name based
> > lookups as an alternative to gpio numbers.
>
> For starters, once you depend on specific names, it is an ABI. But we
> don't document all the names, so it's not an ABI.
>
> > In terms of userspace vs kernel drivers...the current situation
> > for my hardware at the moment is that it's effectively a hybrid
> > situation, some peripheral board components like eeproms and
> > temperature sensors have proper kernel drivers, these would be
> > on the i2c lines for the connectors. There's also uart lines as well
> > for high speed communications and plug detection GPIOs, reset
> > GPIOs and reset detect GPIOs on the connectors.
>
> All that should be in a connector driver IMO. For purposes of the
> binding, I don't really care where you handle things. I do care if
> where is influencing the binding design.

Would a connector driver require moving all driver logic to
the kernel? Or would it allow for hybrid architectures like mine
where userspace retains significant control?

>
> > Overall management of the peripheral boards is handled by a
> > userspace application that needs to know which GPIOs are
> > attached to which physical connector lines, and since this varies
> > by the hardware revision it seemed logical to use gpio line names
> > for that rather than implementing the mapping logic in the userspace
> > application. There isn't really a good way to control reset lines
> > and such from userspace other than with GPIO based interfaces
> > right?
>
> gpio-map is designed exactly for this purpose. GPIO0 on the connector
> is always the same thing (or defined by the peripheral board) and what
> actual GPIO drives it doesn't matter.
>
> > I'm trying to push as much logic into the kernel as practical,
> > hence why I'm trying to use the gpio names instead of having
> > the userspace application handle the mappings.
>
> Using names is not putting it into the kernel because the kernel
> doesn't use the names.

I just mean the device tree configures the names the kernel exposes
to userspace, so from the userspace point of view it's the kernel that
provides the GPIO mappings in that case.

>
> Rob

