Return-Path: <linux-gpio+bounces-4080-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 105AB86F41B
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Mar 2024 09:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CDA21C208EF
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Mar 2024 08:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C160B662;
	Sun,  3 Mar 2024 08:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pNA73hkW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37071AD4C
	for <linux-gpio@vger.kernel.org>; Sun,  3 Mar 2024 08:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709455693; cv=none; b=fvb7rSFHy+QlRZ0d7G3hSN2Yszi/6K3UzCqz8EkjEAMfOiZQZ//OsB9DQeifXODHRWgRGJIpFOM5hl0MX3or5ypvOEWWYS73wYQrmu36IAAwHdkXJ3o5aHUK37xRdI5I9CjgWgfN0eO5o/48re7S/0YAa21yAsMEGP+CYbgyj40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709455693; c=relaxed/simple;
	bh=kLYaTjP5R2oq1R/5Twd/mx9E1Qx85BwSSo78QQuvl+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WW19/4RVALwVjaL0iN4tX9S9GW6f0yu3IB/ANwVgoqGwZCyBfxP3rlXrYUveerXv8m02E2J8Cgt2Dq7PxY4GNWMXeCz1sgoRcTMaROIVAp72h+toI37lm8Hcm70rdTcTNgappB9Pk3k+B63VJqnz3EgD6Qe04hfBPwM58K+OjoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pNA73hkW; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6098a20ab22so14175357b3.2
        for <linux-gpio@vger.kernel.org>; Sun, 03 Mar 2024 00:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709455691; x=1710060491; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLYaTjP5R2oq1R/5Twd/mx9E1Qx85BwSSo78QQuvl+8=;
        b=pNA73hkWKG5hBTFzkSQB9Rci2BFiBoAUaoOfrU5+NFg7sEqvm8W29LtG8D9YhmFZy+
         hOQdg7pRinoXHTOYfyWNbU/V4iTQoYflmMgnZJUo4kVqGbqMG1yqAOenq9STYLi2maFW
         ThmZeT1NiYfaaMK+uthM9k0ZRzVsoySAa8FauEAv/tV5m341VcsKvJ4n4ejZSG33NmKO
         BeZ5LP5pUfcbeh6smpK6u8jH1nTU1HGUj6yET6vgPhJwWImVavuf4bpYBQFLlIGBiVwu
         ZPY3pfhIW87JHtiNsJDksyb/oTCKHzOkmnVzxNZ5A3fzQ7fTzq4hyWflh3LRQtyXo6DR
         ISDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709455691; x=1710060491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLYaTjP5R2oq1R/5Twd/mx9E1Qx85BwSSo78QQuvl+8=;
        b=EIS2fmt3PKFNM8rwbOnJFNxO1n7d6Q4eai3BS0aC6rNRAbLIw2RBaH0+3V5Ov4Akkc
         4Z5nFs34AFHwgmPN+k8QAdrkzSPobAaYkJuJvqsK6SQ3BSw2bYR+cFPVzMCAEcL9ysTh
         7nSmNHeoFpxdI9RSCu8RbkvkFS96j18VtiTR7M96I8RCMv9M/BbKDOef9TY00hJ/aO1J
         46JWdfWvbQll/qLPUIGCs1pxAzldv3RwIb2cIfi9L+oK9NrX3XkGg1ane+GAmjCZTSpW
         9SQNBlocyFQw915I/nl7NwsoZRIOCXwfQzllQs1rkZopnoai5uxlQDo66sKiNDnU9U0k
         Sp7A==
X-Forwarded-Encrypted: i=1; AJvYcCXhwODeSLaNw4/IKE7tuuRXBGyfds8rU0Ss2j8S9nRt7TCfO02tqvEIfKEb9pCQzYlXfqfi4GpB2yGLcUyWfhvKZexWn+MmVqqULw==
X-Gm-Message-State: AOJu0Yz2ZlSN5DctNmoxmFPxNQOCwvgUxwufJkZiRBQ+CNedw1e7ljWy
	U7aaoPBjPsJW6NIwn5+1Pr57ZtdMteDdQfp4Wtdn7/T6Btt4QVRNAjLL/kzQ749E+wDbjyF1fBq
	Dgz/6VLyjTehYJoYxjNwbNg4TIUJdFLpoxfydmA==
X-Google-Smtp-Source: AGHT+IHBdRv9QfjCZh/K8ngsmlUj0sB9GmAcizj5skko5rUg2FHag7v7Vi1eEBnFSP2Nv1DpYsQn3HvCRk62lQBOy0s=
X-Received: by 2002:a81:7705:0:b0:604:9d6d:681f with SMTP id
 s5-20020a817705000000b006049d6d681fmr6160056ywc.31.1709455691305; Sun, 03 Mar
 2024 00:48:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240227113426.253232-1-herve.codina@bootlin.com>
 <CAMRc=MeSMTnPUYGyJir4fc=6=Gnw_MVP9wfEKMQ6Ck33FYCrRA@mail.gmail.com>
 <CACRpkdZbGUd-u3ZcmmK1POSEq8z9J1aDhbGPAbcR6guKuEpEFQ@mail.gmail.com>
 <CAMRc=MeqiYZv3ViHRKKUsXTqG5Pc8Ev2jUcN=A4VuX3RU7dDtw@mail.gmail.com>
 <CACRpkdYWDzu+VMQOYO_Sh1NM2ei=VRC-0df4teAZjirfrTB67A@mail.gmail.com> <CAMRc=MdLmU3uezKSg2d83HSZ3wYXFx68oGshx_yJyvJToN261Q@mail.gmail.com>
In-Reply-To: <CAMRc=MdLmU3uezKSg2d83HSZ3wYXFx68oGshx_yJyvJToN261Q@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 3 Mar 2024 09:48:00 +0100
Message-ID: <CACRpkdaQ5OthgFMG+6DNy7BGi+qLMgqNMOfk+cqra37EGyEYRA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpio-cdev: Release IRQ used by gpio-cdev on gpio
 chip removal
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Herve Codina <herve.codina@bootlin.com>, Kent Gibson <warthog618@gmail.com>, 
	Saravana Kannan <saravanak@google.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 2, 2024 at 10:00=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Fri, Mar 1, 2024 at 9:15=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:

> > The problem is that I have never heard about a user unbinding/binding
> > a driver from sysfs for anything but debugging a drivers ability to
> > bind/unbind. Partly I feel that thing should just be moved
> > to debugfs given the usecase and because it just looks like a way for
> > attackers to provoke crashes given how some drivers look.
>
> That's not the only thing - device unbind can also be triggered by
> removing the module providing the driver which is a completely normal
> operation for user-space.

That is one thing, but every time I hear about "have you thought about
users going in and using bind/unbind in sysfs" it's for builtin bool
drivers.

I almost feel like bool drivers should have bind/unbind disabled by
default :/

The introduction of deferred probe has made the situation much better
because it tends to exercise the bind/unbind path a bit.

Yours,
Linus Walleij

