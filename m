Return-Path: <linux-gpio+bounces-32146-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eD7eM+nrnWncSgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32146-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 19:20:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7619018B3A9
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 19:20:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C89D312FDFE
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 18:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE517277818;
	Tue, 24 Feb 2026 18:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m8USWwMu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05461CBEB9
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 18:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771956584; cv=pass; b=EFMEkVB8Y5ni2myky5+KCvHPD0mF3kkalUYuts1vxSuEqcyVdL2/oUsYqL9+YwYACpUmzw05CdtLAWDH5MWphOHoo9SkazIWx+LlCOdCZUTsD0mcqtE0reejkdSU7pNIBFmldDbXZjinO8RMEb3drd9y0jZFf9Dd9DUMLyYzvtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771956584; c=relaxed/simple;
	bh=vJaYNFnuf2hOYg3Wzwgr911xc+wa92WDutG7dqVnCzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XOqqpv2jw9yz6NyuS9rR+G70e/7GIBRjKI7rOgLmXIK/paiMn167QgzL6WEPZGNqhojd5xFh+nmqOpWXZ45xsyJ3c79ztxIq9XdAz7UQlKAjPiec/xp6CpJ5uDbv063tVDCFpF2/BOb67Ai9ge1nTsDk1FdtcvNzFAp9lB2Vs+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m8USWwMu; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65a3fdeb7d9so8376530a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 10:09:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771956581; cv=none;
        d=google.com; s=arc-20240605;
        b=Ctx1yuLGrJ1Ewlnrn9cOn/KxufOQDuJCap7kjzUdDPbn3YkB3MIUBmfTdtr9gt1KE2
         3Nim8hVZKU4Up+wc4k/h1QqHXIvbVj4AYGFM3reu+S3YC77HYRllGSIPyh1y+MXs5wu5
         gvyYpL/RKQXyImaPgD4AauqyKucB6BNCgQzSeLH4yzA5b6Jrz1Kv5PlEpvcs6ql+JcYI
         09tvKo6eMVEfNo+RgJbCcFoB7PM0UCCWPuXEg47nUn8wUNDve5CAVtHEhHDltYncOq0v
         mNOp1BJ3eKMx9F+H4VqXQPAjZrbAKLZZuWDmXSPpTGfCJHARmQUXzrQiUjAsdr/PokGY
         Z3MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WkhJvVlHP2HM21UJR495PsQ26BfaGB2+8QVHbNSzt78=;
        fh=yWCQgItxMTpDzwLA9+QI6foPSQeUtwW3GeHwxcjJEtk=;
        b=A0/uvi6HPpzpV+qaGrs7y5I3I5Dwi7w+Azu1vorew+2wsgKsPNJmFIyv5a5WAPWy+7
         /N0CoFl/MMTzI0brvZH5yfK3UBlqmoL7Tkrxt7S4pHL4EpNsGm1n6o9g/Auo2QZxkwca
         5Jy1Tkx8PzzWs1XcE0rWZjLrTlxNQOgKyVCURBia3kAem4Vn6ussyT/aAndrjUxWFgr9
         IcmIrgi1tkFsfz62tZdf7DsVsAWXQnMKq/3S1lkhw5BDKt/l/LsTyFHaa8Jvx60EEj+R
         HGxf47eu7lBxUeV/4M8kaZcONQXBXG82as3wed83Af1tOPg2EZZROP7lwNrYPHMqE1YY
         ZinQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771956581; x=1772561381; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkhJvVlHP2HM21UJR495PsQ26BfaGB2+8QVHbNSzt78=;
        b=m8USWwMuu12L2sIRTkemL72vSy2QQjfQ63+kes29z0dSGvgdQQH/OkPoPpf/ls0y1O
         pbS6qgr9hkCg0TX/GJIrla7gSALHSD51qPPGi3qxRbYMh6b5OTP5yxrNbbVeEwVERR5g
         JCKMF2bXR9iq/n3FJZxD9nbs1Dj1KZKsrBDWuV08ZPgkJxPpw7w+jaE+OxF985A2qrJp
         FQL7xJ4un9lW96idpYMigaF9NUwz0dWyX9d5wWgqlai1kxj37S/KrXXKKe0JrNcdKrCq
         NGiyu0ulFxVO7SzaxUiJjl63h6FoILX/hPBAoyEZrsKLdpgJbgAT/HbwmgVDWaTmSpUP
         Cccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771956581; x=1772561381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WkhJvVlHP2HM21UJR495PsQ26BfaGB2+8QVHbNSzt78=;
        b=vD4zQrD2K4d/nZjcGnKYK12ZqL+AaOsizoSOu4qbXJNIZeQjx7qXNaVWFLXRHH7lvq
         UTKZiiduq1dwv8x6dAOr8tkXt87rLArO860SGXIRoKZpMOI8qrwQJnoxLK9lHqakLiAu
         wmTepyBy2jXU/QUjbmragjbe7vDIZJxTpq86QRYrMySCPnYs6eD3BQ9plllVPzOhrpuf
         iHSsFGkoQELXPqbXwd6JP53OjOQ8bOOzCBE1Nxv+kW0eN0q/c5CptNCub+W4PqPqq0k3
         sViDtN3VkB41DVVqtjADXero1+sjTqjaj6Ac71IozzDUuZ1oStRbG18EHlsJq/2xCHXE
         qrIg==
X-Forwarded-Encrypted: i=1; AJvYcCVYZJvijBe1eS1hm6iIJGJu3ZwExplkBQSTUVBu1DwTvLV5eqYkcv96hgAjrHululCgtmEbK5icdRv+@vger.kernel.org
X-Gm-Message-State: AOJu0YyufOJ3pkv2TdfuV7Pg1uuVu57JvV24YdztDZiVAXt7X8ByRbwu
	8gZhesOPIXUrSyzjOrppTYUbvDIbJs2OsQIgxJ3eyaryj3sDdWMD88CpoJA44hxX+fORM6R/At+
	/0jwoqSmN7y9+JKWw+wGbRDv/TAAFlguI97YxKqU8Bw==
X-Gm-Gg: ATEYQzy2Nawv4lucA/y+GyTjjtewU+YNbJyLPWSqmT6KM689J+dl+caJPvefaR4skJG
	5Ba81u8wg4E747HgeDLiMLYtLe6B+fbBQCyKkK/vBI/6cYVcEygtDxhHp7pLKYnemp2JE7EC4vb
	tXwhTqMmK2OWo7hvMBSnvhFgQK3IgGm6im2Q1RHeyKJtRBsHW1Da8IFGseN9kjoiFJDCLn9cPkb
	x6VkLrACEOJ+Y6QwyxrIYvEXZgsFTaPvI1OZeKc/GUyrsK1f5mN2u0EerYY/bzYzcSt0gMooJW9
	+3B0knBxvIeOqQOX+qlyidq82Vz/P354sCcD8ykPeA==
X-Received: by 2002:a05:6402:460c:b0:65f:7498:389d with SMTP id
 4fb4d7f45d1cf-65f74983abfmr1106639a12.10.1771956581270; Tue, 24 Feb 2026
 10:09:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212213656.662437-4-shenwei.wang@nxp.com> <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch> <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com>
 <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch> <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch> <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
 <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com> <nbzdtngifwrx2kyu4tsiwwua5v4i5cjtaotemq5hubaets3bcn@fk25twf5rv6x>
 <PAXPR04MB9185588C1DB71B1FEFA1DEE38974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9185588C1DB71B1FEFA1DEE38974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 24 Feb 2026 11:09:30 -0700
X-Gm-Features: AaiRm513jfkXhWCicXSxk8RHd0EwNINnculQUiIBSoqo4oda2oGf6hKMPIXU_e0
Message-ID: <CANLsYkxAwgG1WkMRr8EJZuSUnN_jKVnsWhWTakVqhvtMBO365A@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
	Linus Walleij <linusw@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32146-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,foss.st.com,lunn.ch,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7619018B3A9
X-Rspamd-Action: no action

On Tue, 24 Feb 2026 at 08:56, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Bjorn Andersson <andersson@kernel.org>
> > Sent: Monday, February 23, 2026 8:43 AM
> > To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
> > Cc: Linus Walleij <linusw@kernel.org>; Shenwei Wang
> > <shenwei.wang@nxp.com>; Andrew Lunn <andrew@lunn.ch>; Bartosz
> > Golaszewski <brgl@kernel.org>; Jonathan Corbet <corbet@lwn.net>; Rob He=
rring
> > <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dool=
ey
> > <conor+dt@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Fr=
ank Li
> > <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel T=
eam
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> > Golaszewski <brgl@bgdev.pl>
> > Subject: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO d=
river
> > On Mon, Feb 23, 2026 at 03:24:43PM +0100, Arnaud POULIQUEN wrote:
> > > On 2/22/26 15:48, Linus Walleij wrote:
> > > > On Fri, Feb 20, 2026 at 7:57=E2=80=AFPM Shenwei Wang <shenwei.wang@=
nxp.com>
> > wrote:
> > [..]
> > > >
> > > > Is it generic? If it is not, let's call it "NXP rpmsg GPIO driver"
> > > > and rename files etc accordingly. Maybe it can share code with the
> > > > actual generic RPMSG driver once that arrives, that is more of a li=
brary
> > question.
> > >
> > > I would like to (re)express my concerns regarding the creation of an
> > > NXP-specific driver. To clarify my concerns, ST, like probably some
> > > other SoC vendors, has rpmsg-gpio and rpmsg-i2c drivers in downstream
> > > with plans to upstream them.
> > >
> > > If we proceed in this direction:
> > >
> > > -Any vendor wishing to upstream an rpmsg-gpio driver might submit
> > > their own platform-specific version.
> > >
> > > - If NXP upstreams other rpmsg drivers, these will likely remain
> > > NXP-centric to maintain compatibility with their legacy firmware and
> > > the nxp-rpmsg-gpio driver, leading to platform-specific versions in s=
everal
> > frameworks.
> > >
> > > - The implementation will impact not only the Linux side but also the
> > > remote side. Indeed, some operating systems like Zephyr or NuttX
> > > implement the rpmsg device side (Zephyr already implements the
> > > rpmsg-tty)
> > >
> > > Maintaining a generic approach for RPMsg, similar to what is done for
> > > Virtio, seems to me a more reliable solution, even though it may
> > > induce some downstream costs (ST would also need to break
> > > compatibility with legacy ST remote proc firmware).
> > >
> >
> > Could the virtio-based mechanism be used directly (without rpmsg)?
> >
>
> Technically, yes=E2=80=94it's possible to use the virtio mechanism direct=
ly without rpmsg.
> It=E2=80=99s a bit like talking straight to the IP layer without involvin=
g TCP or UDP: doable, but
> at a lower=E2=80=91level approach.
>
> As for the idea of gpio=E2=80=91virtio, which could be an optional soluti=
on that certain customers
> might prefer. I recall hearing this idea from Mathieu originally, though =
I=E2=80=99m not sure whether
> he plans to implement it.
>

As Daniel pointed out, gpio-virtio is already available and already
includes a protocol that is generic - no need to redefine a new one as
this set is trying to.

As mentioned in a previous email, I understand some implementations
will have restricted memory and need to use RPMSG.  For those cases a
generic rpmsg-gpio protocol should be derived from gpio-virtio that
would only deal with breaking down the standard gpio-virtio protocol
into something digestible by RPMSG.  That was Bjorn's point in an
earlier message.  This will allow to use the same interface and be
flexible in how we want to talk to the transport medium, i.e pure
gpio-virtio or rpmsg-gpio.

Fortunately RPMSG already uses channels to differentiate between
traffic, no need to multiplex everything on the same channel.  That
too needs to go.

> As the chip vendor, NXP=E2=80=99s role is to provide all possible options=
 and let customers choose
> the approach that best fits their needs; we don=E2=80=99t make that decis=
ion for them.

As kernel maintainers, our role is to advise on designs that are
generic, simple, maintainable and stand the test of time.

>
> Thanks,
> Shenwei
>
> >
> > If not, it would be good to derive a generic rpmsg-gpio protocol from t=
he virtio
> > protocol, and land implementations of this in e.g. Linux and Zephyr to =
establish
> > that option.
> >
> > Regards,
> > Bjorn
> >
> > >
> > > In the end, I am just trying to influence the direction for RPMsg, bu=
t
> > > based on the discussions in this thread, it seems others share simila=
r
> > > expectations, which should probably be taken into account as well.
> > >
> > > Thanks and Regards,
> > > Arnaud
> > >
> > >
> > > I just want to
> > >
> > > >
> > > > Yours,
> > > > Linus Walleij
> > >

