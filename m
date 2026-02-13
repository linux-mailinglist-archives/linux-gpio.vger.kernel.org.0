Return-Path: <linux-gpio+bounces-31671-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MJcJHk2j2n2MgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31671-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 15:34:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F363137193
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 15:34:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9D6DB3015D98
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 14:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46867360750;
	Fri, 13 Feb 2026 14:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CF2AHAld"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092A223EA85
	for <linux-gpio@vger.kernel.org>; Fri, 13 Feb 2026 14:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770993269; cv=none; b=oFGilm2ZKMO+EzNYVlOxQ8NYcdtb+9M7D1+DRn2PndsBPacUNrT4YkSTsrU/ymt/JKJIB1n10LfeqCvkzrQ6yqsFMP0vEYCWwVKE5N5RUE8L/+dF7uWHRPB4kGbEgOu2r48GL2QCwOErdgQpB6Jmq3URkZAvJYiDmtqY+gaLm1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770993269; c=relaxed/simple;
	bh=0Qcj7CGf14qZHAhD+EGK/TWjM5lS7NT7JVMosz3LLLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ftz8A2BVTvoHQMDd3+7VBHCqOWvL39K9VmRtVATyMp0p4GCrIPFSoGqSWWJ2FGUhvOpRGFjh/SKSbn29+HwKk4leS8CK58u2LxdZylIVvCla7V2hhsHailg8w2fXeGdbQsWz5H8qFn6zrcsAwX9O/Ito2vkKhWKwLE9OQmBNtQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CF2AHAld; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2EC9C2BC9E
	for <linux-gpio@vger.kernel.org>; Fri, 13 Feb 2026 14:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770993268;
	bh=0Qcj7CGf14qZHAhD+EGK/TWjM5lS7NT7JVMosz3LLLI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CF2AHAld/bGUaFBGfR6v46o/HfJMEE5OrXguiDeEC2Mi2NQvAK+7UGKs+UTJ8J+l6
	 GHmIxIEoQ+3UPrC3N03z4msYZVP5VZ2yYE1CC+zBA9lE08xpz1uczoyeNXYFmKey6A
	 R3uOe0LlqV/VLFQ6/8Fr62b54tjOrT8pZENBSS2pP12Q1Ymv+PC6eXpQbVs/Wp2qUf
	 g1F6kPz2c4NaA6dPkEjFcGyYuu6a5NPxdzSo5ZLvD7ZgOkXghypSjgRAqpx2NjJDw7
	 bogilfqQc42gLlOi98Rr75V3zxhs5B3mi7ZCyJgNRTHI7EkzRwinjBneCqRZCYYkD2
	 L6j75f2CEh8hQ==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-65939428896so1445841a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Feb 2026 06:34:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVCOqqtzEbWi7ST2mcmrci5uE9L8Iu3kEA+ziA1P4+mQ0Yi1MY6BeXIEF9UEtTzqduNCsqLVDDRHry/@vger.kernel.org
X-Gm-Message-State: AOJu0YzKldkzlnlqRiejFZgMl0dLJAwmVLQA/FOuQpblbrxGKTRdAola
	PToUmZYJUgkkEEbKr+UcXSGJN7pocuTbUDDZCZJN/41Jf746nrQ2674PYnxxyjrdtZtzX+dhvHM
	9tonGQ/1KNOnyTnhWyBEVbGiGa1wFUA==
X-Received: by 2002:a05:6402:4406:b0:659:4853:5382 with SMTP id
 4fb4d7f45d1cf-65bb13c2f2cmr1025659a12.32.1770993267058; Fri, 13 Feb 2026
 06:34:27 -0800 (PST)
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
In-Reply-To: <CADvTj4rPq8D5piqEijCdAjkWmZtq3Bi_Kxv-4F0aU4xi_O5WKg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 13 Feb 2026 08:34:15 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+Fb0vOggHWkNGusCBcwTQubD1Lc+0=U4+MpZacXqc_ag@mail.gmail.com>
X-Gm-Features: AZwV_QiHNRnqrC8vtnLxaNooiOUQf_KM4GiX8xldXuv3CFyw6A0CQlyPTNOG65I
Message-ID: <CAL_Jsq+Fb0vOggHWkNGusCBcwTQubD1Lc+0=U4+MpZacXqc_ag@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-aggregator binding
To: James Hilliard <james.hilliard1@gmail.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31671-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5F363137193
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 3:22=E2=80=AFPM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> On Thu, Feb 12, 2026 at 12:54=E2=80=AFPM Rob Herring <robh@kernel.org> wr=
ote:
> >
> > On Wed, Feb 11, 2026 at 10:01:05AM -0700, James Hilliard wrote:
> > > On Wed, Feb 11, 2026 at 1:44=E2=80=AFAM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> > > >
> > > > On 11/02/2026 09:28, James Hilliard wrote:
> > > > > On Wed, Feb 11, 2026 at 1:19=E2=80=AFAM Krzysztof Kozlowski <krzk=
@kernel.org> wrote:
> > > > >>
> > > > >> On 11/02/2026 09:17, Krzysztof Kozlowski wrote:
> > > > >>> On 11/02/2026 09:13, James Hilliard wrote:
> > > > >>>> Document the gpio-aggregator virtual GPIO controller with a de=
dicated
> > > > >>>> schema and compatible string.
> > > > >>>>
> > > > >>>> Also extend the GPIO AGGREGATOR MAINTAINERS entry to cover the=
 new
> > > > >>>> binding file.
> > > > >>>
> > > > >>> <form letter>
> > > > >>> This is a friendly reminder during the review process.
> > > > >>>
> > > > >>> It seems my or other reviewer's previous comments were not full=
y
> > > > >>> addressed. Maybe the feedback got lost between the quotes, mayb=
e you
> > > > >>> just forgot to apply it. Please go back to the previous discuss=
ion and
> > > > >>> either implement all requested changes or keep discussing them.
> > > > >>>
> > > > >>> Thank you.
> > > > >>> </form letter>
> > > > >>>
> > > > >>
> > > > >> First thing which was missing (I did not even check the rest in =
such
> > > > >> case): missing rationale for this patch, missing hardware descri=
ption.
> > > > >
> > > > > I added some more details to the commit message, this is a
> > > >
> > > > No... Commit msg is exactly the same.
> > >
> > > I added the details to this commit message specifically:
> > > https://lore.kernel.org/all/20260211081355.3028947-2-james.hilliard1@=
gmail.com/
> > >
> > > >
> > > > > virtual gpio driver though so AFAIU it's not hardware specific.
> > > >
> > > > You can give example of any hardware where this is useful. You need=
 to
> > > > make your case with actual arguments.
> > >
> > > The sunxi h616 board I have has hundreds of GPIOs, only
> > > a few of which are needed, I want to map them in device
> > > tree overlays since there's some minor variants with different
> > > hardware gpio configurations.
> > >
> > > Setting the gpio names on the parent controller is not practical
> > > since doing so would require setting hundreds of values for
> > > gpio-line-names, you also can't really combine sets of pin
> > > names across device tree overlays AFAIU.
> >
> > You can do: gpio-line-names =3D "GPIO0", "", "", "GPIO3", ...;
> >
> > The clock binding has "clock-indices" which is used with
> > "clock-output-names". We could do something similar if
> > all the '""' entries are really a problem.
>
> AFAIU this doesn't solve the line name merge issue.
>
> I have some GPIO lines that are common to all control card
> variants, as such I would like to put the names for these lines
> in the base dts file so the names always get applied.
>
> I also have some lines that that are common to a subset of
> control card variants(which I detect via GPIO strapping in uboot),
> as such I would like to put the names for these lines in a dtso file
> that is conditionally applied by uboot based on the control card
> variant. There are actually multiple GPIO groupings, some are
> for peripheral connectors and others are for control board
> integrated hardware.
>
> So what I want to be able to do is effectively merge all the GPIO
> names from a dts file and multiple dtso files, and you can't merge
> list properties, you can only override them entirely AFAIU.

IIRC, there was some dtc work to prepend/append to properties.

> > > > > Use case is I have a device with something like 300 gpio
> > > > > lines...and I want to name/group a small subset of those
> > > > > lines for delegation to a userspace app rather than trying
> > > > > to set 300 or something gpio-line-names values, also I'm
> > > >
> > > > So if I change the approach in user-space or use different user-spa=
ce
> > > > app then I change the DTS?
> > >
> > > The idea is to make it practical to set gpio-line-names for a
> > > subset of the GPIOs that are wired to peripheral boards.
> >
> > Humm, peripheral boards! So there's a connector. You need a connector
> > binding. And the one solved binding for such a thing is GPIO! The
> > gpio-map property lets you remap GPIOs from one provider (the connector=
)
> > to a parent provider (soc_gpio). It would look something like this:
>
> Well...some GPIOs are wired to peripheral board connectors...but
> some are wired to things like built in LEDs and a few different
> on-controller components as well which vary by controller hardware
> revisions.
>
> This gpio-map feature doesn't exist in the mainline kernel does it?

For at least the last 5 years. It's even defined in the DT spec
(generically as "nexus").

> Would this work with multiple connectors?

Yes.

> In my device everything I'm wanting to name is off the same gpiochip.

gpio-map completely decouples what the base DT GPIOs look like.

>
> >
> > conn_gpio: connector {
> >         #gpio-cells =3D <1>;
> >         gpio-map =3D <0 &soc_gpio 3>,
> >                    <1 &soc_gpio 123>;
> >         gpio-line-names =3D "GPIO0", "GPIO1";
> >
> >         /* in an overlay */
> >         device {
> >                 foo-gpios =3D <&conn_gpio 1>; /* soc_gpio 123 */
> > };
>
> I think in my case the entire connector would be in the overlay, as
> the connector GPIO lines vary by control board hardware revisions.
> Would that still work?

You mean you have an overlay for h/w revision of the base board and
then an overlay for the peripheral board? I'm only talking about the
latter.

> Would the gpio-line-names defined here get set on the parent
> &soc_gpio gpiochip or would they show up under a virtual
> separate gpiochip similar to gpio-aggregator?

I suspect there's no support for gpio-line-names alongside gpio-map.
You get to define how that works.

There is no gpiochip for the map. It is transparent.

> > >
> > > Say for example I have a control board connected to a few
> > > different peripheral boards, there may be different mixtures
> > > of peripheral boards, some of which can be used at the same
> > > time as they use different GPIOs.
> > >
> > > The idea is we load device tree overlays for the detected
> > > peripheral boards with detection done in uboot based on a
> > > GPIO pin strapping based detection.
> > >
> > > In userspace we want to match the peripheral board GPIOs
> > > based on the GPIO line names, but using gpio-line-names
> > > on the entire GPIO controller isn't practical as that doesn't
> > > allow composing gpio-line-names configurations from
> > > multiple device tree overlays and would require a ridiculous
> > > number of placeholder entries due to there being no way
> > > to configure individual gpio-line-names for non-hog lines.
> >
> > GPIO lines typically connect to something. Relying on gpio-line-names
> > seems like a failure in defining (in DT) that something.
>
> Isn't gpio-line-names intended to describe what they are physically
> connected to? At least that's how I'm seeing them often get used
> in mainline device trees.

No doubt. People want names for everything, so we give them names so
they stop asking.

*-gpios is how you describe what GPIOs are connected to. This works
unless you aren't describing the device/thing the GPIO is connected to
in the DT. The first thing to do there is question could you describe
it?

> > We would never rely on GPIO pin names in the kernel. Userspace doing
> > so is pretty suspect too. More importantly wanting to do something in
> > userspace is irrelevant to bindings. What's in userspace today may be i=
n
> > the kernel tomorrow. Look at serial attached BT or other h/w.
>
> Why is that suspect for userspace? The userspace tooling for
> gpio manipulation largely seems to support flags for name based
> lookups as an alternative to gpio numbers.

For starters, once you depend on specific names, it is an ABI. But we
don't document all the names, so it's not an ABI.

> In terms of userspace vs kernel drivers...the current situation
> for my hardware at the moment is that it's effectively a hybrid
> situation, some peripheral board components like eeproms and
> temperature sensors have proper kernel drivers, these would be
> on the i2c lines for the connectors. There's also uart lines as well
> for high speed communications and plug detection GPIOs, reset
> GPIOs and reset detect GPIOs on the connectors.

All that should be in a connector driver IMO. For purposes of the
binding, I don't really care where you handle things. I do care if
where is influencing the binding design.

> Overall management of the peripheral boards is handled by a
> userspace application that needs to know which GPIOs are
> attached to which physical connector lines, and since this varies
> by the hardware revision it seemed logical to use gpio line names
> for that rather than implementing the mapping logic in the userspace
> application. There isn't really a good way to control reset lines
> and such from userspace other than with GPIO based interfaces
> right?

gpio-map is designed exactly for this purpose. GPIO0 on the connector
is always the same thing (or defined by the peripheral board) and what
actual GPIO drives it doesn't matter.

> I'm trying to push as much logic into the kernel as practical,
> hence why I'm trying to use the gpio names instead of having
> the userspace application handle the mappings.

Using names is not putting it into the kernel because the kernel
doesn't use the names.

Rob

