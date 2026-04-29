Return-Path: <linux-gpio+bounces-35812-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFJyOwNb8mlYqAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35812-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 21:24:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E90499BDF
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 21:24:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DCAB30704E9
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 19:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66FC033ADAE;
	Wed, 29 Apr 2026 19:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J2foeINB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE4D329367
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 19:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777490453; cv=pass; b=pIRO6YL1HsYsTHVxwaeWyBAoqdzbEd9hbI9KQx0gQoFI1DJjllCCx5Uas98yv6Stz0kXjuLxTRd7ux6yA+/tsj0NaLXSfMVqJng3DlkIpfXZ0Ycs8SWhFPz4VfpdoYZhiumUWiZqQ9LBCE6F0jjGJfnLpotAkCxAQ4/eZBiN8QE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777490453; c=relaxed/simple;
	bh=braCilAYzfWSvAWMEDj3jzrbXNaOgTJxXed3C2N+6Jg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bobwk3ZRv/wDv08dUMgOJ0CV8VH9NE+aOvhU08pwoXGV9K06uwlDz2UX93WOJOXPb5Y8VLnBjGTeZdyzqMVM61KkBitl8FSqmQZTjJE6jAaMAOonJQC4SscLS8NsIr7RJcXxbPMEh3dRCLOO8SWZWc9Zm9MhBkUwZ3y3f/K9FA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J2foeINB; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-671dad7cac8so196377a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 12:20:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777490450; cv=none;
        d=google.com; s=arc-20240605;
        b=IbcGVgSxp8wvHXBfy5eEHMJPOasE8bhk+Qh4f95l6iXRRuYPuRuCk/RBgfug42pi3F
         TB9r2jZjKVrrvcKZaUrqX4kTkSY2yG/Fp4c+B+2rMyNgI68sZPzFv+HFej6qN+BS2sND
         ohba6l7KVXLfDdAUwFDuCVTjnPwVOHDrip8qKTc8mU0xedXPOey8PDb+vROZs+xHbzea
         +6LK9cZcCvUfUJStzfPXO17iL8FHDLHm8ZsinPkLquQwDzPZDtVnUIMEhW9z+9AlDfRe
         5i/hu8dvl0aKTCXza6VFBxM+5K7uAEnABbt77PyLagG2gZGLSoCU1J6EjXfSxRBuQGZ0
         m0OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=P1oUs/Abu5g3UxUIAO0ZwpBJwwKm0pg05ZGOCVCeRmU=;
        fh=BeQ2CIJWEdze9UieSXQVqUHAHJJlRJn9QTy4bi86TCI=;
        b=WKwNCZ397f3FgUAGVlWoIccVGTH6a5GFwPsGMtsq5CmGy+KdFndW3/4u1ZssuJaYq3
         hNydqQKQDpa5vArkEA3+JnU0kLov6foflJV6mDCNuNBydbq9NsDwtw01jMWfLMAftUx5
         TgOBIHn4lvs7LB5VykAHKJ0XlGgpbF5aFY3lyCok6fXkdAOSyLW+BFvgNVF9amw3Gyq5
         UtD0EyFjwFr2w7UChd+KeIcV2epN1kpJkx4H2jFH7Loa1ZegbBo+bz7ZdGooJFkS88qP
         4bUowLZp/9z/HUYjEoYn84fq/dzm2Pxbz0BbTcsNe8bY/v8VTNRuB0o84avk4RF1uT3i
         zxzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777490450; x=1778095250; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P1oUs/Abu5g3UxUIAO0ZwpBJwwKm0pg05ZGOCVCeRmU=;
        b=J2foeINBIxLUD/f5R5WCd8ndy0IbWzi/9CzJczqdjXtlw3YvhYiQE77BGYYg802I1z
         FU7njl6BiHtLe3JY6/7kGsC0q7dMD10OotdhXQE1POQ1294rIB/dSnUyv8U9JWzg9I7z
         ei2wT5CCNdjjv7V/7nPaZqlx/s5ohLlUREbCnoy6ZxM5WPZJ3do4UglWe/Q5L6Yh/wG5
         +lVzgL382uWvsVNf56voBRSwgdyTSRe4OQzSinlaX3hYxvfO8bEIDCu0H+9RV5Hp6pQk
         wahqe1IZeEtXZfap/DQ8iXjAABs1J6tBCF+iq5oazzubo8McZnAlVggbYlGFlfY71b7u
         Ie3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777490450; x=1778095250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1oUs/Abu5g3UxUIAO0ZwpBJwwKm0pg05ZGOCVCeRmU=;
        b=TBte9DucGmc2N44IOZLlbxxxoYJCNP+v9Q7t4Txd/Hj6dTfVCT7exx3UsGS1sBGa4u
         EXviog/ZE4VWIcjf6aLMzcGipLJQHr6NvBsLEvFGJ3U/ZiFVdGuiWm0AcR/fAFvXlKIj
         GmbgkjIe9qgv5fWrXjz5UrhnHNoUporaaE+3rLE+hHj85KgALGHOMeOxfuwNNH2iR+cQ
         VqNKJWeQMOWCp/3ZyjKk+pYmFv1MBOzQsj5NhXOUi3tfWqZLBn3fb77y+o0WNzgQb8cg
         0+PkfdiHdi8ocRXzDpVj/rnOxoFnks0heGZk7I6tcsrrushgYsNu1TJBp3mMNOq0lP4I
         O/3w==
X-Forwarded-Encrypted: i=1; AFNElJ/bAWZYJe8PDuVxeK4rKzXCs3qzye6lVyI7boA5glaKp/jWaTIkhh7hQ5VyM796C4e/GJHxba0m6unq@vger.kernel.org
X-Gm-Message-State: AOJu0YxEcguKwpnGcItM7GHPx84XYZgKUM/POagV7uuqsNNnpJK3HORt
	0mZMjgndQHxkPPl07256busQeyUlXwx9RmVVyFm9B2E+2GccSktUuSD1L7J7MEo47zt9qZAmSJW
	gAoz5gMlugAHbeQOU5ZVYAbPblXx11wDh0IquImfKUg==
X-Gm-Gg: AeBDievZNjY/QoVos3F7vFFpowMTv7IoSw6fsrykGjJW3vRp2fRbVnrlZB4wW5fpN+8
	GUmQk1+hqn3gtK7b8qa+QeWowSDxLpMlL41w4z5I/IQgoCPIj9qo1TGER2uE+XsMhEXVAbAjc86
	NOMN5Zjj2OtoMcepAvt/xuKvmqZ6/bbY0yDdcObydNQBpqnZ10YpZe5wIxWJHNayWmhtLx+vQUW
	Yp4C3eqh52EQfHKnJ9MYOokHTWDCPWxrLPecDYGE+TQWpV67abap/VTR2ktzyA2D8CnA61bV+4y
	nIaCxLurPyeEC/pwmkY6QXGVHbuCdzYhdOVGrC/1FhLQDUgOWZ/B5dCZOOEt2Js=
X-Received: by 2002:a05:6402:5024:b0:674:2565:f27a with SMTP id
 4fb4d7f45d1cf-679bb095b4amr4292362a12.19.1777490449661; Wed, 29 Apr 2026
 12:20:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com> <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch> <PAXPR04MB9185009A17DFDF3D6C8B44E789362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6e01e114-e336-4744-b6b4-563ec42e321b@lunn.ch> <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <afImuoeHolxGgw3H@p14s> <PAXPR04MB9185F2F6DDB55AC56C92D63B89342@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkwvL0Z3+12MD=J+Dc2yAU2T8ypizyG=6AhYoWOh55odHA@mail.gmail.com> <472f85bd-42c2-40c6-abfd-b76924797069@ti.com>
In-Reply-To: <472f85bd-42c2-40c6-abfd-b76924797069@ti.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 29 Apr 2026 13:20:38 -0600
X-Gm-Features: AVHnY4LS0q8rVhCWEM9jcgreDzRj6jHlyTeei6srw2bJ0kIdi0Mr181JcAK3ylA
Message-ID: <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: "Padhi, Beleswar" <b-padhi@ti.com>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew@lunn.ch>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
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
X-Rspamd-Queue-Id: 89E90499BDF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35812-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,lunn.ch,kernel.org,lwn.net,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Wed, 29 Apr 2026 at 12:07, Padhi, Beleswar <b-padhi@ti.com> wrote:
>
> Hi Mathieu,
>
> On 4/29/2026 11:03 PM, Mathieu Poirier wrote:
> > On Wed, 29 Apr 2026 at 10:53, Shenwei Wang <shenwei.wang@nxp.com> wrote:
> >>
> >>
> >>> -----Original Message-----
> >>> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> >>> Sent: Wednesday, April 29, 2026 10:42 AM
> >>> To: Shenwei Wang <shenwei.wang@nxp.com>
> >>> Cc: Andrew Lunn <andrew@lunn.ch>; Padhi, Beleswar <b-padhi@ti.com>; Linus
> >>> Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
> >>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> >>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> >>> <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> >>> <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> >>> gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> >>> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> >>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> >>> devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> >>> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx <linux-
> >>> imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
> >>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
> >>> On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wrote:
> >>>>
> >>>>> -----Original Message-----
> >>>>> From: Andrew Lunn <andrew@lunn.ch>
> >>>>> Sent: Monday, April 27, 2026 3:49 PM
> >>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
> >>>>> Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij
> >>>>> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
> >>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
> >>>>> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
> >>>>> Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> >>>>> <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha
> >>>>> Hauer <s.hauer@pengutronix.de>; Shuah Khan
> >>>>> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> >>>>> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix
> >>>>> Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> >>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> >>>>> devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
> >>>>> imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
> >>>>> dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
> >>>>> <brgl@bgdev.pl>
> >>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg
> >>>>> GPIO driver
> >>>>>>> struct virtio_gpio_response {
> >>>>>>>          __u8 status;
> >>>>>>>          __u8 value;
> >>>>>>> };
> >>>>>> It is the same message format. Please see the message definition
> >>>>> (GET_DIRECTION) below:
> >>>>>
> >>>>>> +   +-----+-----+-----+-----+-----+----+
> >>>>>> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> >>>>>> +   | 1   | 2   |port |line | err | dir|
> >>>>>> +   +-----+-----+-----+-----+-----+----+
> >>>>> Sorry, but i don't see how two u8 vs six u8 are the same message format.
> >>>>>
> >>>> Some changes to the message format are necessary.
> >>>>
> >>>> Virtio uses two communication channels (virtqueues): one for requests and
> >>> replies, and a second one for events.
> >>>> In contrast, rpmsg provides only a single communication channel, so a
> >>>> type field is required to distinguish between different kinds of messages.
> >>>>
> >>>> Since rpmsg replies and events share the same message format, an additional
> >>> line is introduced to handle both cases.
> >>>> Finally, rpmsg supports multiple GPIO controllers, so a port field is added to
> >>> uniquely identify the target controller.
> >>>
> >>> I have commented on this before - RPMSG is already providing multiplexing
> >>> capability by way of endpoints.  There is no need for a port field.  One endpoint,
> >>> one GPIO controller.
> >>>
> >> You still need a way to let the remote side know which port the endpoint maps to, either
> >> by embedding the port information in the message (the current way), or by sending it
> >> separately.
> >>
> > An endpoint is created with every namespace request.  There should be
> > one namespace request for every GPIO controller, which yields a unique
> > endpoint for each controller and eliminates the need for an extra
> > field to identify them.
>
>
> Right, but this can still be done by just having one namespace request.
> We can create new endpoints bound to an existing namespace/channel by
> invoking rpmsg_create_ept(). This is what I suggested here too:
> https://lore.kernel.org/all/29485742-6e49-482e-b73d-228295daaeec@ti.com/
>

I will look at your suggestion (i.e link above) later this week or next week.

> My mental model looks like this for the complete picture:
>
> 1. namespace/channel#1 = rpmsg-io
>     a. ept1 -> gpio-controller@1
>     b. ept2 -> gpio-controller@2
>

I've asked for one endpoint per GPIO controller since the very
beginning.  I don't yet have a strong opinion on whether to use one
namespace request per GPIO controller or a single request that spins
off multiple endpoints.  I'll have to look at your link and reflect on
that.  Regardless of how we proceed on that front, multiplexing needs
to happen at the endpoint level rather than the packet level.  This is
the only way this work can move forward.

> 2. namespace/channel#2 = rpmsg-i2c
>     a. ept1 -> i2c@1
>     b. ept2 -> i2c@2
>     c. ept3 -> i2c@3
>
> etc...
>
> This way device groups are isolated with each channel/namespace, and
> instances within each device groups are also respected with specific
> endpoints.
>
> Thanks,
> Beleswar
>

