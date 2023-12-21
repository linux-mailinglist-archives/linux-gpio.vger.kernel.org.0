Return-Path: <linux-gpio+bounces-1778-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F7381B950
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 15:08:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17A461F2922B
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 14:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3CCC6D6C9;
	Thu, 21 Dec 2023 14:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="J8oBeN4B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1B16D6C1
	for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 14:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3DD813F73C
	for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 14:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1703167660;
	bh=YSFGFVOxlECeWrb1201TBHQMqNul2EH+RYRBpW3Owdk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=J8oBeN4BFAcMmrF2xmdQa3RqsJwHgt+RclA2WQCUc2RyWVrs9rO4Pp8BcBTTZl3yi
	 zZ9bTyuOfSDgnBbfpFVLt1Qi/SAn7OmldDBoj+6G2N5OkBu9Dxg4fCk5P8HsFvW1V0
	 4gONjHm/XXDLj0pd5297F3tLbadRnG8nEaj8F6lBimIn45B/sgOoE/Lcn60NI96QcE
	 Y4ZvSJ8CHVCaPcmk+Gk3ZP6IDK+rSTzit5OGs1InymXHmrmvld6u37/aLcBFuZeQ9l
	 OaDaLMuk6JPA2YdHWj2S6q7h3FFi1JPOnCuAc+qnEi1Kq6Pf+xQMUtNGtsiqOjFG47
	 gvCMzTcrrqlbQ==
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2cc83b19edeso6022981fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 06:07:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703167658; x=1703772458;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YSFGFVOxlECeWrb1201TBHQMqNul2EH+RYRBpW3Owdk=;
        b=lEeZQYhKj3D0DKp4wt4W+pJV29K1A6OlZDMvdpp83blL7i8xvAN6EBOTOByeUaqqly
         b8J86ZtPYO7hI1opU3lr+Y9W9wmN3sRxk9qvp9OQLAEtb7Q3LchY04RV+kxz/OXlQkmq
         rOxMmTd99BBy9+a31qtPgxe/jXrs2aDbE/K8Q8HwsrJYHtTHADTpSV/IWh9X1hdG/5Fy
         /c/6FO0W+uCJgRcnW3xmvyYuzo7btIqPOH1QcuvfYYya2nhvfu0b+cuyjXxII1RJTtRB
         cy/iJZLgaZUO7yoGA9Jd9fAwMiQYyq3ZvmhNfbgPTSyHUHbYwmefiLnax5M2EhVXI02s
         CHgQ==
X-Gm-Message-State: AOJu0YziqjInFCzv7a+vijYhOi8QaMu8UkSk2STo2cg9KlvjAQOCbAtr
	Fc3CfbM0D91vklqeaqIOMp9uInPXBxT29sQ/qzPNTohZWb292gDShYCogPAzq0fjNFnIf7t3ycF
	LzwH/jLHH8ZXxfUXgJLX0JwsjHIZSc+HU+2n9M2t+DmYSA+ReDdoRtjuhk0WgQkA=
X-Received: by 2002:ac2:5617:0:b0:50e:29c1:f829 with SMTP id v23-20020ac25617000000b0050e29c1f829mr3635661lfd.74.1703167658223;
        Thu, 21 Dec 2023 06:07:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGplfpPbW0FT9ATmbiZqm1++et4V4L718raZzPodJBABIbwHrAdrNT6mNWONQxZ+jsDmjLpy/oSnYqjsp61ks4=
X-Received: by 2002:ac2:5617:0:b0:50e:29c1:f829 with SMTP id
 v23-20020ac25617000000b0050e29c1f829mr3635656lfd.74.1703167657892; Thu, 21
 Dec 2023 06:07:37 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 Dec 2023 09:07:36 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <CACRpkdbx7BOoHzbGd6n5p=Ho3GhMcujwUzQam0jLe6Ysg+xsNg@mail.gmail.com>
References: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
 <20231215143906.3651122-2-emil.renner.berthing@canonical.com>
 <20231215202137.GA317624-robh@kernel.org> <CAJM55Z9pBpYfwpxPH7bUumuosVDn9DHLSBngW6CtG7aK_z+_bQ@mail.gmail.com>
 <CACRpkdYT+jf4=dk3Y9cwa_=aYCihVq93N-iT0RUbtT2-+PX69w@mail.gmail.com>
 <CAJM55Z8osSFxKi_7=aRkEr+U3vAq0TS93OggnRzyPpssNuuJ3Q@mail.gmail.com> <CACRpkdbx7BOoHzbGd6n5p=Ho3GhMcujwUzQam0jLe6Ysg+xsNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Thu, 21 Dec 2023 09:07:36 -0500
Message-ID: <CAJM55Z8SwyNEqw4HWRd7G8Y9rdtOGtKy-KbzDorqohdK3nZg0A@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] dt-bindings: pinctrl: Add thead,th1520-pinctrl bindings
To: Linus Walleij <linus.walleij@linaro.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Hoan Tran <hoan@os.amperecomputing.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Linus Walleij wrote:
> On Thu, Dec 21, 2023 at 1:28=E2=80=AFPM Emil Renner Berthing
> <emil.renner.berthing@canonical.com> wrote:
> > Linus Walleij wrote:
> > > On Sat, Dec 16, 2023 at 2:57=E2=80=AFPM Emil Renner Berthing
> > > <emil.renner.berthing@canonical.com> wrote:
> > >
> > > > > > +          thead,strong-pull-up:
> > > > > > +            oneOf:
> > > > > > +              - type: boolean
> > > > > > +              - $ref: /schemas/types.yaml#/definitions/uint32
> > > > > > +                enum: [ 0, 2100 ]
> > > > > > +            description: Enable or disable strong 2.1kOhm pull=
-up.
> > > > >
> > > > > bias-pull-up can already specify the strength in Ohms.
> > > >
> > > > The strong pull up is a separate bit that can be enabled independen=
tly from the
> > > > regular pull-up/down, so in theory you could enable both the regula=
r pull-up
> > > > and the strong pull-up at the same time, or even the regular poll-d=
own and the
> > > > strong pull-up which is probably not advised.
> > >
> > > bias-pull-up; <- Just regular pulling up the ordinary
> > > bias-pull-up =3D <100>; <- Same thing if the ordinary is 100 Ohm (fig=
ure out what
> > >   resistance it actually is....)
> > > bias-pull-up =3D <21000000>; <- strong pull up
> > > bias-pull-up =3D <21000100>; <- both at the same time
> >
> > Hmm.. the two pull-ups combined would be a stronger pull-up, eg. lower
> > resistance, right? So you'd need to calculate it using
> > https://en.wikipedia.org/wiki/Series_and_parallel_circuits#Resistance_u=
nits_2
>
> Yeah hehe elementary electronics beats me, of course it is in parallel.
>
> > The problem is that the documentation doesn't actually mention what wil=
l happen
> > if you combine the strong pull-up with the regular bias.
>
> So why even allow it then?
>
> Do the people designing boards using this have better documentation than =
what
> you have? Then either get that documentation or just don't give them
> too much rope.

We can certainly prevent Linux from ever combining the strong pull-up with =
the
regular bias, but that doesn't mean that the vendor u-boot can't find a use=
 for
it and might hand over pins in such states Linux then wouldn't know how to
handle.

If you think its better we could just postpone that problem to when/if it e=
ver
happens.

