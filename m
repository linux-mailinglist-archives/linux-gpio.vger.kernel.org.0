Return-Path: <linux-gpio+bounces-26680-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DF1BACDA2
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 14:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2029B7A204C
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 12:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455BE2DCF7D;
	Tue, 30 Sep 2025 12:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ch91hNZI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3433C2C11C5
	for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 12:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759235701; cv=none; b=XKrMiR65AS/UUraz8kIjKSqv8daTdzAUWm9Sbhan3xgDoqTWBj69x0Xci2fhuhzybzVwnFLL98geElzESdfYlNDMuiRe/n6+mwFUqtrJuOVZrhrmpjSxvWmUt4U/tWqomeKgQc067lrYgI2WQFD7zBEo/K5t93rOGQ4BziTl1vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759235701; c=relaxed/simple;
	bh=hQHCtgoQk3zqFHEz812bCMjEr9bOmzY6j1w2qd3TfmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i1pk8lTqDhwBQFMh7gBzSKGs4SCrUQkBc8CPzB+sPUwN/uqdvcbx+ks8EQLgTyU6/3CnNRh+AD38lvV64G32C+vzAJH0wkY3fk2vCYhPaBFflUGT3I2Y1yXJ4qOS4Z/AklGXNUkX8c9dmPvnev5uJGvJIW42RZWa0PFSeQ/l1aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ch91hNZI; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-36a6a397477so56861541fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 05:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759235697; x=1759840497; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//xkitOYEIBnBowE0figA5jcXr1QSGKbTFftNJcWdSY=;
        b=ch91hNZIMmE/fJQQay1+iKdIS28/QXgL1MzZJmcKBZnWpOCyDLyq0s2hD6pAFs8Hx9
         M3rRLkKePh193MAijdH1+DnvyLQ9u78L5ota2m1O0SoPeIPz5SVV88ZbnhaFyqrNfNxj
         G47hugYMOQIyyESCZCZDkceXxNmpcYoK1vLxuRXvTu/LSjy281WQ9wJWgVvYh5UznJay
         6tN6RBNyLWS0qc4rjypAOotwxh8thNeTgzstGt2idiJlInxH4K6m4sl3Lwgm7EUhxHXu
         CoghBu98adCQiEMuA2WyzBfnTEdx/N9F7ieKeCuTs6pjPqU5syH3KjLJUb9B+DHd+her
         e1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759235697; x=1759840497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//xkitOYEIBnBowE0figA5jcXr1QSGKbTFftNJcWdSY=;
        b=owbI9RDbaBK4wbY/J85eGuylMZkw+MlWDHojwuqsVdShx1EX0bqg49A6y+ApbrMM4R
         YkIBLCaisaRAbNvLHWnfsZpjHunBoYBDwg8Ssdzn8QsLnn8kAFP4L4aiMU/ncIef1xna
         h/F3FPqsVNnp1yFApmUtAiYLaFM71zENJZ8+jTlEZEjVSNSUGhWnBqU7VegCH57J+Mnl
         MLaVJtTA04AMPjcJzqwDwS29x1v7I8AhSxPrB4jTLWOdAvqE1K5e5cIop6DffIlIlkuY
         S6TpBtu5cIMehF1X9ifW9JGMGh0+VRBpz63FxXhzRkBFU3NHWBmlRroQl5r6NQP2D3m2
         FwTg==
X-Forwarded-Encrypted: i=1; AJvYcCVe9w/+EWe1P12XPBAWGd9tgvVZ6Ux2sbvncgcUPHNh21P/nG6zW1zmzTgb1wlqn3dL23lsGZU5jKLz@vger.kernel.org
X-Gm-Message-State: AOJu0YwFnPbP92JMiWzOpNiJ2fSgNbn1n84UXFBByVsSNnw/xi2RgGtG
	6NuAYVuc9e0z/aSJ/h5Zno4xFT/t76NMO4Boh7+SQCIG+KXoTVTZlVKyswPpZUBwxbXp7JPBkAp
	vwR1qpESV3zW3tjdNLomExLoaEdLNirN9yoHXfxm6Hg==
X-Gm-Gg: ASbGnct+l6fagkXXhOUEmqY6i5bfjHwlKlsUMTUDpF4Q2rjKm51cnBuiHu4G/Eqr+oi
	8B1HfXhNyaCyykUy4NhYPJoE7aDY/dlzWrjk+PXWSIW2aY8+xUd6VppAt4NZUzNWOmb53bR+hd3
	ej6QTSCGlup6BzfkVFb2pOww6vAhb3kEtwcOtoJKrPFVnj+CVjhvDy7/CwdZ96VJsjhMXMnftOU
	SzrVRyPQFm/dbn0EO5DtHmcbsQfH9nezcSqYsQn+g==
X-Google-Smtp-Source: AGHT+IFkGyQJTXX+l3/fVG1kpg3S7XkLrTud3tl3gd71kpZbk5gd/flj5ygP5W+NqOo2/jq0RMyArIGv0CKoRXGvQt0=
X-Received: by 2002:a05:651c:1545:b0:36b:ce19:d853 with SMTP id
 38308e7fff4ca-36f7ff20073mr53691811fa.45.1759235697194; Tue, 30 Sep 2025
 05:34:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912060650.2180691-1-gary.yang@cixtech.com>
 <20250912060650.2180691-2-gary.yang@cixtech.com> <CACRpkdYgTjerG5mks_+3sjhKKYtCsFY=1NWhgw_YEuib7gZm3g@mail.gmail.com>
 <TYUPR06MB5876BB28E3C30EEB9BB05997EF15A@TYUPR06MB5876.apcprd06.prod.outlook.com>
 <CACRpkdYKnFAyq8C5h2=5NQ8AU92RmzShNHd6+=21rWednjv-fA@mail.gmail.com> <PUZPR06MB5887DA8FE0E128993F11E2B3EF16A@PUZPR06MB5887.apcprd06.prod.outlook.com>
In-Reply-To: <PUZPR06MB5887DA8FE0E128993F11E2B3EF16A@PUZPR06MB5887.apcprd06.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 30 Sep 2025 14:34:46 +0200
X-Gm-Features: AS18NWCe8gc0I9F23q-ySgwePTXWrU-J25uwnqfg_Oxcxpo9nPVmUWN-Gc4LkU0
Message-ID: <CACRpkdaQYb+tB+a9Q6j3xPq=BHbQV5-3hu3XiJkSU9CGtcHpiA@mail.gmail.com>
Subject: Re: [v2 1/3] pinctrl: cix: Add pin-controller support for sky1
To: Gary Yang <gary.yang@cixtech.com>
Cc: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gary,

thanks for your efforts!

Sorry for taking so much time to respond. I was coding.

On Thu, Sep 18, 2025 at 8:17=E2=80=AFAM Gary Yang <gary.yang@cixtech.com> w=
rote:

> New scheme with macros has verified ok. I just want to confirm with you b=
efore submit codes

No need to confirm with me just post it!
Better one post too much than one too little.

> > But I think you can still use a macro to define the long pin tables?
> > Albeit macros with flexible arguments is a bit hard to write.
> > Save it until everything else is working.
> >
> In header file:
>
> struct sky1_pin_desc {
>         const struct pinctrl_pin_desc pin;
>         const char **func_group;
>         unsigned int nfunc;
> };
>
> #define SKY_PINFUNCTION(_pin, _func)                            \
>  (struct sky1_pin_desc) {                                        \
>                  .pin =3D _pin,                                    \
>                  .func_group =3D _func##_group,                    \
>                  .nfunc =3D ARRAY_SIZE(_func##_group),             \
>          }
>
> In C file:
>
> static const char *gpio1_group[] =3D {"GPIO1"};
> static const char *gpio2_group[] =3D {"GPIO2"};
>
> static const struct sky1_pin_desc sky1_pinctrl_s5_pads[] =3D {
>         SKY_PINFUNCTION(PINCTRL_PIN(0, "GPIO1"), gpio1),
>         SKY_PINFUNCTION(PINCTRL_PIN(1, "GPIO2"), gpio2),
>                 .......
> };
>
> What's your suggestion? Thanks

It's OK as-is if this is how you want to structure things!

Yours,
Linus Walleij

