Return-Path: <linux-gpio+bounces-31921-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAw3NVSTl2mL1AIAu9opvQ
	(envelope-from <linux-gpio+bounces-31921-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 23:48:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2641635EF
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 23:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 836573010B80
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 22:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB07C32860B;
	Thu, 19 Feb 2026 22:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N7DP7UuP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA88838FA3
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 22:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771541326; cv=none; b=WGJvctxMfnVzTcRda0wpIUxvp/XzgAywa4ApHqFtNayXpnJ5kmLx/+2MPz4/VV3/1LyfcQnEGjUEQCPW7kaTbkR0620rVOSiKGr0PM9RmuuipvTrtH8Vq1ClyXvmRZbIbPr4Y3oZ52qDpEk6tPWQGiQZxFETXz0foVFVI3ItnbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771541326; c=relaxed/simple;
	bh=cvs4w2L2VlSvGc9SNNfllmQbA8qztCm/+q9ZC4YoZAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lk5sYUNcrfJ8M0lP36lKkVap156IhBL55fQ7v+Hb3PPOYjUIbiVc28nsXTy5kX/h4SdMXnV3Sy2PeTHGn3EcbcBJeK3iGNCKT35g7iWIZR8grGMX4tENeuPytJfAdD/nvFVjEvPoW5TB+1UQlWB7zSbNgNHeAizkig03xa1CAHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N7DP7UuP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CAB1C4AF09
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 22:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771541326;
	bh=cvs4w2L2VlSvGc9SNNfllmQbA8qztCm/+q9ZC4YoZAw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=N7DP7UuPkqXnptNeuwRIPSY1I3J1eUK/wEMtd356tqKgFAcL9RLYXPmG2fIcyZ4+o
	 gUyzN+reB6StJaVue07mD12gJWBqq30gtA+YlJAPm5ei4S8RMGjr2vNS1VsNPtEMPj
	 80puDQ2/Y7i0Os8OEXyD6IPc5s3DbHMU7Yqqs16BB1jRieLloInVduvXed9usx6RPC
	 dECZsRDXHkbKGTCYr5Vn6RXUE625rbJPPeGsFOX/hh/ljo2Z7q9lulEucUHVTCcJSF
	 6WEu7mr2YxzMOh/mhT020v8DmUFt3PiNzY1g2YcedJNWB2gUtEorQAe/rmRAmJOznj
	 Q7eR8i/UP3PVw==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-794719afcd4so15070167b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 14:48:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX6aOvKTdJ84WnC4EAJV1TFD0A5haBbbsUijyvepGZb7qK0JLHxq6Cl971xS6WBaFXjeI5m4vmPCjsW@vger.kernel.org
X-Gm-Message-State: AOJu0Yxaz+vtXgCpzg6C4W82jctitWesq6gf0jjK2Db/OLXxjIo6LBg0
	UOKCNu6ot6YiPQaw7PF6aoPy85yy9oBMznXX82Ir3Tkjutbj1CuVlWdDvh+nOi/D4kENttcIXZc
	CoeM+YciuXutOKEu+rZB/8Sdm18NcoQw=
X-Received: by 2002:a05:690c:18:b0:794:de8:cbd8 with SMTP id
 00721157ae682-797a0c20f73mr179084427b3.19.1771541325738; Thu, 19 Feb 2026
 14:48:45 -0800 (PST)
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
 <CAMRc=MfBt3ae2tdRKQT-AvjocN9OmC-jAtw0206rT3qGmSJDig@mail.gmail.com>
 <CAD++jLk4Z1S-3Pitafv8Ok5HCB+K9o8PG53wsqLL1RNXM7753w@mail.gmail.com> <CAL_JsqLR0mcGsDcGeFyS_ZK-hMz6LshTvtETyeNhcq_PCC8_WA@mail.gmail.com>
In-Reply-To: <CAL_JsqLR0mcGsDcGeFyS_ZK-hMz6LshTvtETyeNhcq_PCC8_WA@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Feb 2026 23:48:34 +0100
X-Gmail-Original-Message-ID: <CAD++jLk5tYDsZMns0uibaPX1idLwjZjpb2Sc1irWV=xay64_Cw@mail.gmail.com>
X-Gm-Features: AaiRm52OldWRILHecxQ6VZSLLCnzgmjKZaOaXMPYYYlvVYZvKyTnYkQP2tjHttQ
Message-ID: <CAD++jLk5tYDsZMns0uibaPX1idLwjZjpb2Sc1irWV=xay64_Cw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpiolib: of: add gpio-line node support
To: Rob Herring <robh@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, James Hilliard <james.hilliard1@gmail.com>, 
	linux-gpio@vger.kernel.org, Saravana Kannan <saravanak@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31921-lists,linux-gpio=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.20:email,0.0.0.1:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3E2641635EF
X-Rspamd-Action: no action

[CC Conor as inofficial DT+pinctrl expert]

On Thu, Feb 19, 2026 at 10:34=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
> On Thu, Feb 19, 2026 at 12:23=E2=80=AFPM Linus Walleij <linusw@kernel.org=
> wrote:
> > On Thu, Feb 19, 2026 at 10:15=E2=80=AFAM Bartosz Golaszewski <brgl@kern=
el.org> wrote:
> >
> > > The problem here is that the state of a GPIO that's not requested is =
considered
> > > "undefined" and controlled by the GPIO chip driver. The whole "initia=
l state"
> > > sounds very hacky. You would have a much better case if you instead w=
orked on
> > > a "default state". It seems Rob is not entirely against it. Neither a=
m I. It
> > > would make sense to tell the GPIO driver: "if nobody's using it, do t=
his".
> >
> > Pin control actually has both initial state and default state...
>
> I'm drawing a blank on how we define initial states.
>
> >
> > Maybe it's a bit of a game of definitions here.
>
> Default here means when no one is using it. Default for pinctrl is in
> use for normal operation.

Indeed.

> But I do wonder how pinctrl and GPIO would interact here as you can't
> set a GPIO state with GPIO alone. First, pinctrl might need to be
> setup to put a pin into GPIO mode. And what about non-GPIOs that also
> need some initial and default state.
>
> Are folks putting pinctrl properties in hog nodes?

Yes sometimes in to pinctrl hogs. It's a bit messy so I wouldn't
recommend it.

If there is a device using pin control it is handled
orthogonally from GPIO, just like any other resource.
Sometimes this is affecting the same electronics: e.g. pin control
sets up the muxing and GPIO sets up the polarity of the
same electrical pad/pin.

One way is to associate a bunch of pin control
settings with the GPIO device itself, since it is a device after
all. There all the GPIOs can be set up as a default state of
the pin controller itself, there is no restriction on what the
pin control state can affect, all say 100 pins in a GPIO
block can be configured into a single pin control state
node.

This is necessary for example if the SoC has muxes
that will affect an array of pins and not just one pin per
mux setting.

> > > gpio@1 {
> > >         compatible =3D "foo,bar";
> > >         reg =3D <0x1>;
> > >         gpio-controller;
> > >         #gpio-cells =3D <2>;
> > >
> > >         gpio-line-names =3D "foo", "bar", "", "xyz";
> > >
> > >         foo-gpio {
> > >                 default-state;
> > >                 gpios =3D <3 GPIO_ACTIVE_LOW>;
> > >                 output-high;
> > >         };
> > > };
> >
> > And that makes the name of line 3 "foo".
> >
> > Fair enough, I didn't think of that. This is a good pattern,
> > whether default-state or initial-state.
>
> That makes the node name important (aka ABI) which we generally try to
> avoid. That also collides with the existing foo-gpio(s) properties.
>
> If you are doing all this in early boot, then we're taking something
> that's just stuff some number of GPIO direction and data registers
> with fixed values to parsing lots of nodes and multiple properties in
> those nodes. And early (even u-boot which isn't early anymore) boot
> code just parses the FDT as-is which isn't very efficient. Size and
> processing time (single core, possibly disabled caches) are important
> for boot code. So again, I'm not interested in any binding that can't
> support that use case.

There are some custom precedents, or uh oh we actually merged
something that looks really generic....
Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml

  lines-initial-states:
    $ref: /schemas/types.yaml#/definitions/uint32
    description:
      Bitmask that specifies the initial state of each line.
      When a bit is set to zero, the corresponding line will be initialized=
 to
      the input (pulled-up) state.
      When the  bit is set to one, the line will be initialized to the
      low-level output state.
      If the property is not specified all lines will be initialized to the
      input state.

c.f. arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi:

        pcf8575: gpio@20 {
(...)
                lines-initial-states =3D <0x0710>;
(...)
        };

This was there since ancient text bindings times.

So that solves part of the problem if we only want to configure
input/output, we could use this. I don't know if it's a good
precedent. It does seem to fit nicely with really early dead simple
parsing.

Yours,
Linus Walleij

