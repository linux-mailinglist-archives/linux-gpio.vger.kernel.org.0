Return-Path: <linux-gpio+bounces-30590-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0425BD241C6
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 12:16:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B74FA3025716
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 11:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8670F378D8F;
	Thu, 15 Jan 2026 11:14:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6293378D61
	for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 11:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768475680; cv=none; b=K6gkLZsFFcHpUoOrmhvcv83sTJKcHD/hsn7MB/3cQ3/6NLzm3tbqjmZ+rsyE5t4mvuU8PlYZrolIk9zyC3FoVKZXLyYd0ACg0chS842fbo69MfmXfA+u4cbo6PWGIVZo/cPTZ3u/OBgcIlISeJsnG6ioNS3fQ/B/GJb5r89+Vw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768475680; c=relaxed/simple;
	bh=4Xv+kiu1PsewV9Qo5HqVVMC1TkAVawqiz071ud8smLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fZuZO80+fgYpqhfjLj+cGk6dFs4j2ys/ojhPyKGTg6TI2Bn3kRwoA8INyBsVkwRHCz+xlgPqGJNtY2hEbZTdFllbjgHoYQ1ygUIgF+Fie4Et1U4Y8NkTfN7ODZyHjIADUsUv4hlKnGreDCwXUX3/niBGDKJ0e8Q8T8nU6gaMBx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5014e8a42aeso8080571cf.2
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 03:14:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768475678; x=1769080478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bt+YNNG27WZEvGUwZk4TYJG13mQxJAZnvV5f9yUtP/0=;
        b=wXh0FcjD8dOZeRECWf9EBLjESPH+9genC7l/ZzRPqWRYFYnRhkojtwcfqfd/rDqaYL
         N33zd2KmlxgK1omO2lVX3gDYKWBebLjlWsZK+iJOUn+OuG4TMZGqHeGtKpS2ibFdr9ro
         YOKqsO1dBbQUNwqpzipgFQ1Bb9avxhVF6ZV+bsatib6JR2qpzA3LsW0QkflStmdKDzKR
         JAIk00McglNQSC/pIKrYRVhUL/bc9xe5MyWItmgMPNWnOcA4anLrrtU/rck5b4zB5e6t
         SYL8E/oTrMDf5s9q5ITikVvSkdmZoia5WeE/jU/75eGuo4ARbs+tLZ7Bm5+DqT2fOwXo
         rGpA==
X-Forwarded-Encrypted: i=1; AJvYcCUkze/k2UQqlKHqjiY/wspj1bJaURGGvrekYKKj97PAtZrYviOLvqriJ1rov7DoO+qTQ/k1usIVzqvF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3hQQRMy3aR3ywXkKFs/DePdCwRpTC9ubvaa+lMN3bOP+jT3m0
	TRMKpwfMvEe8AJHRsRycH6w4Y6FzVbJTBNCQ+Cfh6zbEvBPAgs3TWxKDHnfjh8xIBnk=
X-Gm-Gg: AY/fxX6Z5HSnlij3RtMdiAQSGlKVgV+SiSVybxFoPJzng5QtnPZBIhH4dvR2CVW7icM
	FXz4Yaw/rpk5JD1eiG3LZMAA94ymaaIl9iRhkIpwSguFkSeHwfAURvLhSxoKxFI7HXL59un+OFo
	1Ngk0DL+qC1i5N2uZ5kyjtoyMk5gz5hLm2/w13dN1rkFF1dDeavGNF9qCQXSCcuV5lzbhMr9bi3
	pb4jfJl1lcJZu4rxbLYL9rtHs9kabz7x3kJAG0wKWD1n6MjtOy6daSZFbLrP1kGD5hYtoQPMzNb
	3LZTMkjbpAKF28ro83j4Jdr10wlrNt8MAd1HDS1cLkhX1k71bLgHrvUs5EDoxivc2Cc5MxeYwnO
	SFvfetKoPdEwAaJPqNNfICCohX4dI7/ti0VSI/J3CAi4Mubb5CpY81K6EJG7yADLheUGaSyeoGV
	ZXiwt4+vOiE0S5fiYE2C600j6uUnsq+ZXJhwYrdZxHAUxsgQ8imWMt9icn8ygFyIY=
X-Received: by 2002:a05:622a:341:b0:4ed:b5d8:a192 with SMTP id d75a77b69052e-501484689b1mr76329121cf.38.1768475677762;
        Thu, 15 Jan 2026 03:14:37 -0800 (PST)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50148ebac91sm31933261cf.21.2026.01.15.03.14.37
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 03:14:37 -0800 (PST)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8c5320536bfso93235985a.1
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 03:14:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW+lwVHOvxE4+aLUvJ9yZSSDzMN2ImUHuw2Dom8VvDSeuNbAZDRjB3A016q9mZ5r2WN+8NxJgQf1PM5@vger.kernel.org
X-Received: by 2002:a05:6102:3906:b0:5ef:b3da:1634 with SMTP id
 ada2fe7eead31-5f17f68f312mr2498241137.43.1768475230982; Thu, 15 Jan 2026
 03:07:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114093938.1089936-1-herve.codina@bootlin.com>
 <aWdp_jMVUBN04is3@ninjato> <CAMuHMdWkGevDsBuUs1k=r5yeKJZHvs93b2SDfPwKoF4fFr-3Ow@mail.gmail.com>
 <CAL_JsqJwGLXPCtSabkeD26Ct3MrzFBdU-3-gJbGEpRQcmL1LWw@mail.gmail.com>
In-Reply-To: <CAL_JsqJwGLXPCtSabkeD26Ct3MrzFBdU-3-gJbGEpRQcmL1LWw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Jan 2026 12:06:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUuQmMKyg2oc6jw9Tgsct9ZimjkL5PYw1OyHAgODL==Og@mail.gmail.com>
X-Gm-Features: AZwV_QgN5zpuxnXc64xxS7FKteaOjK3XvNGTF8daKF3483kVmVRKJhptLCCbWv4
Message-ID: <CAMuHMdUuQmMKyg2oc6jw9Tgsct9ZimjkL5PYw1OyHAgODL==Og@mail.gmail.com>
Subject: Re: [PATCH v8 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
To: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 14 Jan 2026 at 23:21, Rob Herring <robh@kernel.org> wrote:
> On Wed, Jan 14, 2026 at 4:47=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Wed, 14 Jan 2026 at 11:03, Wolfram Sang
> > <wsa+renesas@sang-engineering.com> wrote:
> > > > Rob, Thomas, this series is blocked waiting for your feedback and y=
our
> > > > acks if you are okay.
> > >
> > > This was a little hidden between the other text, so let me emphasize
> > > that these acks are needed. The other option is to send the irq stuff
> > > and the SoC stuff seperately.
>
> Reviewed-by > Acked-by

It does have different semantics...

> And if it has either, I stop paying attention. So I was assuming this
> all was going in via not-my-tree...
>
> > The irq and SoC stuff depend on the of stuff, so doing so would
> > delay the former by one cycle.
> >
> > On IRC, Rob sort of agreed to option A from my proposal (see v7 cover
> > letter):
> >
> >   A. Rob takes the first two patches, and provides an immutable branch.
> >      Then Thomas takes the irqchip patches, and I take the rest.
>
> Until this...
>
> > Unfortunately that part hasn't happened yet...
>
> And then a new version came in... Why a new version only to add a
> Tested-by tag? That sends you to the back of the queue in my normal
> workflow (which this is turning into anything but).
>
> Thomas has now provided a Reviewed-by. I think it is easiest if you
> just take the whole series via Renesas tree.

OK doing so...
Thanks!

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

