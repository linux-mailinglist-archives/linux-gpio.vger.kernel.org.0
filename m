Return-Path: <linux-gpio+bounces-31911-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFU7ENGBl2kOzQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31911-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 22:34:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA1A162D26
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 22:34:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2239A3007495
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 21:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6897B32AAB5;
	Thu, 19 Feb 2026 21:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AQN+sSyq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCFE329E5A
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 21:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771536846; cv=none; b=PAYNfPnxGQi2oT0/TfGTr8WZWBLLxZXYquq9fkERs/jbn3MVOQR+7zMV5J4MdyBC5doCgeyacBPFiJjeqVDfl8C9LACUqPCBTI2Vwz1dLEpowOlmQh3cl/K6aHhwpnz03gzkNRa9i0dkB7Bnmqb6Cap4QgiHN38u/1SvWeBLqDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771536846; c=relaxed/simple;
	bh=uMHaZcAOYrpN7P5ZdCKx9I0gRTqmqJT4tE+lEzFJ/ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dqW7u+pGuX2QYeg/eG7OXXJxtMJsyjmPqqNawmdZ2Dxcuzu3pN+qIDkdXhY2+uql+15S+qpd/2lljb7m+/mxl+1if6h3qqaOzrUIoREo/dc2LajlOJxAQxM4710ISVnD6pu933TJ7drDYVh35UlFF2RjzMyebrLr/QsKFKtVxEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AQN+sSyq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7DB2C2BC87
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 21:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771536845;
	bh=uMHaZcAOYrpN7P5ZdCKx9I0gRTqmqJT4tE+lEzFJ/ps=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AQN+sSyqjzkBSpuIlV9eMaIP7cmoj6UGNl5f7Ypx1uGsYhgchrp2i7dn4q9Ga9ASE
	 fK1LAEW9B0hdDi1bdmZfawnKAJmVTnzeOqUUdVkxVIQdN+ny90ZbHmuTcm23WRKyHD
	 27+HGJSt5zlIA47gp1J3HXMRQKZg2SUEeiqNg9ntRx3sSfs2K3mExyGaydyj3K2+cr
	 xkZt+EGVWLIQrPdi6Fq8JqIs3JC2eDBwsjrOXGu42YS4Kt0/IPnBST/H/rY8lZj9XB
	 zmWOrhLq8uRbzv8W84f3v6KG8EcJ2ZSwaX7J9QzAQ1VKR7g/cP8EGjcXgZPCSTxgiV
	 m7QgOC84UVQSQ==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-65bfe9c585cso2201799a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 13:34:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1Qw1Zj6OfIQb1PMTftX0jVTkXD2Zigf6xljK6CbGKL0zzgvwrfYcArj5fQJ/NpUTWV+51M8zKsVgd@vger.kernel.org
X-Gm-Message-State: AOJu0YzXrvoImG7v2Py/hoohbm1aCu+xSl7UPm1Yq0BMecPD+tQSnYYq
	2B2h32ZyauJW52vSwoy5L7MBqopI0KnB1AZ/LtBJ384uFSWvJOo6rlCkxOowVHmwEnmvW8XRdHm
	AahUtrTmOACxasyGNPHZrdc/mQDirPg==
X-Received: by 2002:a17:907:3e8f:b0:b88:5b21:b16b with SMTP id
 a640c23a62f3a-b8fc3b59ed1mr1249300266b.25.1771536844305; Thu, 19 Feb 2026
 13:34:04 -0800 (PST)
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
 <CAMRc=McR613nBkUehva0bidxrUz2eQ1Ud9g1m4gKdXyGzHo_PA@mail.gmail.com>
 <CAL_JsqLEKr6G4qZe=vvJzP+KC_WWh0SHOjg14rxQvAvxV7wNUA@mail.gmail.com>
 <CADvTj4pfuV1s7VzS-cw+66N9HxijZ8x4Gr_jgTqPEqDvpz-hqg@mail.gmail.com>
 <CAMRc=MfBt3ae2tdRKQT-AvjocN9OmC-jAtw0206rT3qGmSJDig@mail.gmail.com> <CAD++jLk4Z1S-3Pitafv8Ok5HCB+K9o8PG53wsqLL1RNXM7753w@mail.gmail.com>
In-Reply-To: <CAD++jLk4Z1S-3Pitafv8Ok5HCB+K9o8PG53wsqLL1RNXM7753w@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 19 Feb 2026 15:33:53 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLR0mcGsDcGeFyS_ZK-hMz6LshTvtETyeNhcq_PCC8_WA@mail.gmail.com>
X-Gm-Features: AaiRm51hHQngkWKqO2Zli8sMCEqc-0XS_FMWPsa2jUBIlM58SNPGUVt-842hqLY
Message-ID: <CAL_JsqLR0mcGsDcGeFyS_ZK-hMz6LshTvtETyeNhcq_PCC8_WA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpiolib: of: add gpio-line node support
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, James Hilliard <james.hilliard1@gmail.com>, 
	linux-gpio@vger.kernel.org, Saravana Kannan <saravanak@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31911-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.1:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: BEA1A162D26
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 12:23=E2=80=AFPM Linus Walleij <linusw@kernel.org> =
wrote:
>
> On Thu, Feb 19, 2026 at 10:15=E2=80=AFAM Bartosz Golaszewski <brgl@kernel=
.org> wrote:
>
> > The problem here is that the state of a GPIO that's not requested is co=
nsidered
> > "undefined" and controlled by the GPIO chip driver. The whole "initial =
state"
> > sounds very hacky. You would have a much better case if you instead wor=
ked on
> > a "default state". It seems Rob is not entirely against it. Neither am =
I. It
> > would make sense to tell the GPIO driver: "if nobody's using it, do thi=
s".
>
> Pin control actually has both initial state and default state...

I'm drawing a blank on how we define initial states.

>
> Maybe it's a bit of a game of definitions here.

Default here means when no one is using it. Default for pinctrl is in
use for normal operation.

But I do wonder how pinctrl and GPIO would interact here as you can't
set a GPIO state with GPIO alone. First, pinctrl might need to be
setup to put a pin into GPIO mode. And what about non-GPIOs that also
need some initial and default state.

Are folks putting pinctrl properties in hog nodes?

> And for Linux: if nobody is using it ... is that after all deferred probe=
s?
> Someone can load a module using these lines at any time. Etc.
>
> > Please don't use a property called "gpio-line-name" to define a state o=
f
> > a GPIO, it makes no sense. The line-name property of a GPIO hog is the
> > label we assign to the line when requesting it. There's no requesting h=
ere
> > so let's just not use any new line names. I'd go with something like:
> >
> > gpio@1 {
> >         compatible =3D "foo,bar";
> >         reg =3D <0x1>;
> >         gpio-controller;
> >         #gpio-cells =3D <2>;
> >
> >         gpio-line-names =3D "foo", "bar", "", "xyz";
> >
> >         foo-gpio {
> >                 default-state;
> >                 gpios =3D <3 GPIO_ACTIVE_LOW>;
> >                 output-high;
> >         };
> > };
>
> And that makes the name of line 3 "foo".
>
> Fair enough, I didn't think of that. This is a good pattern,
> whether default-state or initial-state.

That makes the node name important (aka ABI) which we generally try to
avoid. That also collides with the existing foo-gpio(s) properties.

If you are doing all this in early boot, then we're taking something
that's just stuff some number of GPIO direction and data registers
with fixed values to parsing lots of nodes and multiple properties in
those nodes. And early (even u-boot which isn't early anymore) boot
code just parses the FDT as-is which isn't very efficient. Size and
processing time (single core, possibly disabled caches) are important
for boot code. So again, I'm not interested in any binding that can't
support that use case.


Rob

