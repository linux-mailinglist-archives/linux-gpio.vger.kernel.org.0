Return-Path: <linux-gpio+bounces-2001-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BF47C8235DF
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 20:48:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08F4BB23DF8
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 19:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB771CF8A;
	Wed,  3 Jan 2024 19:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLixBNzT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935371D528
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jan 2024 19:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2cd1919f0acso11994081fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jan 2024 11:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704311311; x=1704916111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ee+tGBq0nwSKNBK0Aoan0iDCSn1AN7fXkS3uqTIYK0=;
        b=DLixBNzTKUU10DzxXPp5H3NWTrxw3rrTO/CkAvciHN54yChhOVh+TUO3+0Sp3SCjCS
         gG5uVDufvmmA7rCJNMyvfWz8N5kLhft7p7Sqf8SSXSBWVY3uAAPtpjXS2YtUWpA/UHue
         pQsB/0msBZei2+ZwGh3xGlEO4eCDYL0Z4ytT/Bz7R7CAQVX+umRUziMYUjz6i8dwH/FN
         TnNSG06wxw/YwHK2PqEVn+8mFZB/g4HQ2LsRkl7KjzwfNGfSKEQqnsG1YsFFeAxfN5Uh
         qiX5vDjZkrEXAZcaQN8cG84wmc5oS69oUHktbQl0k6fwRHuzv5xfanwdP4Agbpuy1tlK
         qHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704311311; x=1704916111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ee+tGBq0nwSKNBK0Aoan0iDCSn1AN7fXkS3uqTIYK0=;
        b=Xs2MAbu5/O37s0MlqnoULw/abygX5bz9ASGAKJdENG5qEl3nFWEpKfclDw3vjoYsXy
         b8dLSg1nkiptHk3Iq9F30YdRcQgIjWhhpH/oe9zLUjOdxCgficuef2FNvK/gbuN9aYpA
         G9b3RWT7s9tOgZAsQUQDfkxFDIKFAJkaens3fTwhAfoJYxbWuYjZxLh6UWHvDd3vGq8t
         IuX18+0GFhiPsleKht9+P9Ldj7dcgyN3lLhn4NO1jkQocsg7+jPwJzvSJyN+o3N/x5zc
         jwfBV9XfyEf9voDm7tgrhvqL7aixZZFHCNcDD5jp28Vr3VvDpuVScF7LIRW5ls2Q4iGE
         LWWg==
X-Gm-Message-State: AOJu0YxAbocd2ejsezCRAfg2t8ITRFYLdHPOe1JyfYlZ9l5iqkXxDN+8
	2D7wsjVHTlh3pJUviyaug7NlCTsmtTCN0N6Yiv2dMOaR
X-Google-Smtp-Source: AGHT+IEPUO/W4nCZsjgFXzmlGR5PtjWdlrsu3bqq04cA2c0lmB3k+kg8JubbZHJtlKB8a3s8prhaRRC+NdrB3wkBrmM=
X-Received: by 2002:a2e:a4d9:0:b0:2cc:f02c:c97d with SMTP id
 p25-20020a2ea4d9000000b002ccf02cc97dmr4067824ljm.87.1704311311271; Wed, 03
 Jan 2024 11:48:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ8C1XPiYYeOzbZXcDFR2GX-CoRFuvJim6QVi9-O-oR4mZBauA@mail.gmail.com>
 <20231228092915.GA67274@rigel> <CAJ8C1XOP+h9iptC2gB0-6+Loaxr3Ow2MXYUjAxqr_t2EgBmDew@mail.gmail.com>
 <20240103094931.GA117646@rigel>
In-Reply-To: <20240103094931.GA117646@rigel>
From: Seamus de Mora <seamusdemora@gmail.com>
Date: Wed, 3 Jan 2024 13:47:54 -0600
Message-ID: <CAJ8C1XPe5nG30O89AVboZa=iqRu=-4=jNtuWj3v6KY921kfq8w@mail.gmail.com>
Subject: Re: [libgpiod] Some thoughts following a brief test of libgpiod ver 2.1
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 3, 2024 at 3:49=E2=80=AFAM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> On Wed, Jan 03, 2024 at 01:51:53AM -0600, Seamus de Mora wrote:
> > On Thu, Dec 28, 2023 at 3:29=E2=80=AFAM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > On Wed, Dec 27, 2023 at 07:19:54PM -0600, Seamus de Mora wrote:
> > > > Hello,
> > > >
> > > > I've done some testing/evaluation of the 'libgpiod ver 2.1', and I'=
d
> > > > like to share a few thoughts from that experience.
> > > > <snip>
> >
> > > Then you might want to update your kernel - the kernel device driver =
was
> > > changed to support peristing [1].
> > >
> > > I get this on my Pi4 running bookworm:
> > >
> > > $ gpioset -t0 GPIO23=3D0
> > > $ gpioinfo GPIO23
> > > gpiochip0 23    "GPIO23"                output
> > > $ gpioget -a GPIO23
> > > "GPIO23"=3Dinactive
> > > $ gpioinfo GPIO23
> > > gpiochip0 23    "GPIO23"                output
> > > $ gpioset -t0 GPIO23=3D1
> > > $ gpioget -a GPIO23
> > > "GPIO23"=3Dactive
> >
> > Yes - the device driver on my bulleye is current; that change was
> > committed back in 1Q 2023 IIRC...
> >
> > I hope I've not already asked this, but:
> > In ver 1.6.X of libgpiod, gpioset exits immediately, and returns to
> > the bash prompt. The GPIO line remains set at the value designated
> > after gpioset exits. AIUI, the driver change from 1Q 2023 was
> > responsible for this.
> >
> > In ver 2.1 of libgpiod, gpioset (without options) does not exit. This
> > means there is no return to the bash prompt. The GPIO line still
> > remains set at the designated value, so there is no change in the
> > behavior of the GPIO line between ver 1.6.X and 2.1.
> >
> > My question is why does the un-optioned gpioset ver 2.1 not exit - as
> > it did in ver 1.6.X?
> >
>
> You did, and I answered on SE.

I missed that - for me I guess it's lost in the details.

> But to reiterate; gpioset v1 exited immediately and that caused
> confusion when the driver would revert the line to its default state.
> That made it look like gpoioset wasn't doing anything or was generating
> a glitch.
> That results in "gpioset doesn't work" bug reports, and we got tired of
> that.
> The decision was to make it block by default to make it clearer that you
> lose control over the line when it exits.
>
> In short, we changed it because people complained about it, either
> explicitly or implicitly.
>
> The -t0 option can be used to emulate the v1 behaviour.

But... you've also explained that libgpiod/gpioset's
default/proper/correct behavior is to delegate the persistence issue
to the driver (or pinctrl in the RPi case) - right?

So it **sounds like** what you are saying is this:

    gpioset does *not exit* because people complained about lack of
    persistence. When the persistence issue was fixed in the driver,
    we also fixed it in gpioset by not allowing it to exit.

Have I got that right??

If so, why not stick by your initial assertion that persistence is a
driver issue - not a libgpiod issue?

I won't make a recommendation - or tell you what I *think/feel* -
because I know "you don't care", but if this is the case...

Best Rgds,
~S

