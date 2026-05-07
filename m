Return-Path: <linux-gpio+bounces-36362-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNEGAeJf/Gm7OwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36362-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 11:48:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D8C4E63AD
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 11:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28A5F304293E
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 09:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E24A837105A;
	Thu,  7 May 2026 09:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qqjGNMvV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D3D389444
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 09:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778147085; cv=none; b=MZ/pkVJY7QJo/TBBCE26wsQN6LqjJf0wFRQ9/2+b9NnPtNEuei8MPbuiz/CwOy40zSMWvGdGy1wYtqj3xt5Z/8F86Aq1kf5E9bE3n4S9GWqdUIReZ0ZBt+GcvRk4I7uS/j8nb+F9Cj2ds5zJ0mmDafmpP7en247r4btC1qsJ8+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778147085; c=relaxed/simple;
	bh=Jjnn4yrDTrZX08ni2x7bn720XfEgnPw2PfUE6M7ahIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LNUvWONyOaRkxHpNkBMm6J0SUBL7uUaJBHtFZNG85S0TRQzcYe7tgwVFmv0Jivk5J6y9W5yQMNpsk4s3IxWxEODYwrCw34f3LG0BtmJ8qlENMKktHS+OatmpM4rCcHKGzfXGUhVecWDwhr/1xlIjC3i7vWyYEXXYnHRln26McAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qqjGNMvV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54552C2BCFB
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 09:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778147085;
	bh=Jjnn4yrDTrZX08ni2x7bn720XfEgnPw2PfUE6M7ahIw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qqjGNMvV31nKILNRLnEfl9xhDx2UrF0buO2OdXbecwgZvZpWUc2PWF6VcD/Xi9zdW
	 w/J/5Tu1wRL5Ce2ZE7Hc5gQj4uYOVCR4KwpaxbwrPzqMjZptUDDcqSFD5NnxcA+1k3
	 uZ/p+VROYY7lxK7Jp0fD6gcBcTEYDUAGnBEhudvQ8vdP8/OlxK8XKvh8PhjO3v2CVb
	 D6mbYl3pQd16JmGt8gkQZiUWmRSBePbLKnlDI7l3IHazpidknz+dxXQj8PwBgzZBOJ
	 UsBlxairo1QZyNDZilFJT5OIGw61w+FDKPcIz2vkDPtyw8K1c9kncnO+nmwl5jAMve
	 mi82bMQ+wqhkw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a887ebb416so550151e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 02:44:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/b7WUeEDigRJ3H4mWp8zCM0sRL+5FF4Y6/wqlQ+KTYqwQYxbpYMXZ9aSsW9Qta0MmvdQ6ay7XXajKP@vger.kernel.org
X-Gm-Message-State: AOJu0YzvhBoEZVmVCJeXc2W8TWfOBlZhMWS9ssA81GlJxuedINAkQyVY
	9dH0GUk0PJQrMxfzbKoCAts7zAL7RFf0YFlCnS3jsU/OehdvGTkGgheo0aDl7hGk5BO6x5JzCPk
	lv3L6kSZ6rIbsRYvZ3SLf4HzyejcQTmw=
X-Received: by 2002:a05:6512:3f23:b0:5a8:638d:6f53 with SMTP id
 2adb3069b0e04-5a887adaa88mr2727485e87.6.1778147083932; Thu, 07 May 2026
 02:44:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com>
 <20260414-axiado-ax3000-sgpio-controller-v1-1-b5c7e4c2e69b@axiado.com>
 <CAD++jL=yc4rmNELLKUpreUqRbQ1Krg95C-o1xSrnD9Aicm4wgw@mail.gmail.com> <106b7b64-ed6e-499f-b5ac-60c1277f2f03@axiado.com>
In-Reply-To: <106b7b64-ed6e-499f-b5ac-60c1277f2f03@axiado.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 7 May 2026 11:44:32 +0200
X-Gmail-Original-Message-ID: <CAD++jLn4R9ubqHsek-56s1sF9YhxYt4-C2TPdYGcYjy2MC6q_Q@mail.gmail.com>
X-Gm-Features: AVHnY4KA8TveR2zDsS46EaI7LI2muWnzNFMg-HaAe4yTbCLUY8SRows5ieuqqDs
Message-ID: <CAD++jLn4R9ubqHsek-56s1sF9YhxYt4-C2TPdYGcYjy2MC6q_Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: gpio: add Axiado SGPIO controller
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, SriNavmani A <srinavmani@axiado.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 91D8C4E63AD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36362-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,axiado.com:email]
X-Rspamd-Action: no action

Hi Petar,

On Thu, May 7, 2026 at 10:06=E2=80=AFAM Petar Stepanovic <pstepanovic@axiad=
o.com> wrote:

> >> +  '#gpio-cells':
> >> +    const: 2
> > Are you sure you don't want to use 3 here instead and split the 128
> > GPIOs into 4 "banks" second cell being the bank number?
> > <&gpio 2 4>; ?
> >
> > Maybe this also solves the 512 GPIO by grouping the GPIOs into
> > 8 banks...?
>
> Thank you for the suggestion. We would prefer to keep #gpio-cells =3D <2>
> to stay aligned with existing SGPIO drivers and current DTS usage.
> A single linear offset is sufficient to identify each GPIO, so introducin=
g a
> bank cell would add additional complexity without a clear benefit.
> Any internal bank handling can remain within the driver if needed.

If each bank also has its own associated IRQ line, for instance, then
this also reflects the hardware in a better way. But it seems this
controller has just one single IRQ line for all GPIOs, so maybe
this is better.

> >> +  ngpios:
> >> +    description: The number of gpios this controller has.
> >> +    $ref: /schemas/types.yaml#/definitions/uint32
> >
> > Same here, certainly the 128 variant has 128 gpios and
> > the 512 has 512 GPIOs? Just use the compatible string
> > to infer this.
>
> This seems to be platform-specific rather than strictly hardware-dependen=
t.
> We were considering keeping it as a separate property (possibly renamed t=
o |axiado,sgpio-ngpios|).
> Would you prefer that, or deriving it from the compatible string?

In this case it is fine to use ngpios.

ngpios is used when the hardware can actually do more
GPIO lines, but they are not routed out on the package of
the silicon, for example.

> >> +  dout-init:
> >> +    description: Initial values for the dout registers.
> >> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >> +    minItems: 4
> >> +    maxItems: 4
> > In:
> > Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
> >
> > you find:
> >
> >   lines-initial-states:
> >     $ref: /schemas/types.yaml#/definitions/uint32
> >     description:
> >       Bitmask that specifies the initial state of each line.
> >       When a bit is set to zero, the corresponding line will be initial=
ized to
> >       the input (pulled-up) state.
> >       When the  bit is set to one, the line will be initialized to the
> >       low-level output state.
> >       If the property is not specified all lines will be initialized to=
 the
> >       input state.
> >
> > If this is what you want, use this standard binding instead.
>
> In our case, the hardware provides dedicated DOUT registers where
> each bit directly controls the output level (0 =3D low, 1 =3D high).
>
> The lines-initial-states property also encodes input state semantics,
> so it does not map directly to this hardware.
>
> Would you prefer adapting to lines-initial-states despite this,
> or using a separate property for output initialization?

Please use lines-initial-states, support also input mode setting
and write more than one register if necessary.

Setting up the dout-states for lines which are supposed to be used
as inputs just doesn't make sense does it?

It is better if the device tree has this deeper semantic which
provides useful information for the developer and makes the
author of the device tree be more careful and detail-oriented
around the actual usecase.

Yours,
Linus Walleij

