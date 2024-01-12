Return-Path: <linux-gpio+bounces-2177-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D56E382C360
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 17:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86D721F25578
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 16:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDEF7316B;
	Fri, 12 Jan 2024 16:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C6KzxPfs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB3373169
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 16:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a2cea0563cbso78518366b.3
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 08:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705076019; x=1705680819; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rX9NKhfvtetAKOMUhRqjAWfJ/mnYrzBaF7e0SKu0UY=;
        b=C6KzxPfsXeUYXUlK+RN4FWRVv+BKknLRTmr314LSNKFqbdiPGVBig72e9RPuFeXCpq
         RWijfbObs4CqjubfznmQ4bY1eU0IFEHDqFW6vX5TAMBZYdgiDZqqPFqr05zXXQovPdas
         FY6ubQ9m+C9SZ105YnyVJfr7h6fq/T00yF4KAsox5OX0wd51V2Aaaia5ZACJ5zYg+Z4D
         g2i71T1gtGT+wdYsqIgY+kPdmiljNH4ujHoplKRPDPNwwA5gBZH69OfYotMBWDuY5kYu
         M2TvOUrFLpdUlYcU/jNovzPdLccRPtsGqXOqCf7BoN/YuQUjtEYXk8EokgUrDJcwmxax
         0ORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705076019; x=1705680819;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4rX9NKhfvtetAKOMUhRqjAWfJ/mnYrzBaF7e0SKu0UY=;
        b=eiYYBexbBR89L1BApy1o6HMUK3vSWIkEOHDKJTEBM3ccBgCuccxTP1qm9+2Q8QVdQy
         d8CR0Wtw1jTLgZ5xb4QH9W96yfuTL6wQYuQGGM/LYZS5B7iLQLXplnydRSD0btqxQD1a
         5g5DWsvQA4MZEL4wNmOikZZCU231JTzPARUw0mSonnPimGw/IuuYXNpQPucS7UnlIUlj
         vaZ7D9tcs4PiznL390aJJGEDYVLK2I+2nSEX4J+69RUAzdt2Nw2i+3aUoT+j9CBeUwtU
         VYBC1HJ6PlYiuYUOH9GceBQYq01/fanVm505CM131SNxNej5rD223uR1scJ1h29PX6EP
         mdgQ==
X-Gm-Message-State: AOJu0YwwhdVXkuIkon9e8Z8kr0UzYWQnyhuPPk/gMFbXku2UZF5d4Ifg
	KkavdJ890vqi+VHJel8Daj7bYbFMiHUc8Q==
X-Google-Smtp-Source: AGHT+IHAjhX/rWSgv8Ex28h8tUAn9srpcbZo1z0Zx7sFcYuHQCswjUXjfNWRVk5ZwZjyDi2pcxGWBA==
X-Received: by 2002:a17:906:6049:b0:a28:c217:ce8e with SMTP id p9-20020a170906604900b00a28c217ce8emr870741ejj.124.1705076018660;
        Fri, 12 Jan 2024 08:13:38 -0800 (PST)
Received: from localhost ([2001:9e8:d586:b800::f39])
        by smtp.gmail.com with ESMTPSA id j16-20020a1709062a1000b00a2c467ec72bsm1934409eje.60.2024.01.12.08.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 08:13:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jan 2024 17:13:37 +0100
Message-Id: <CYCV04Z0DTXJ.EL52UULK796I@ablu-work>
Cc: "Linus Walleij" <linus.walleij@linaro.org>, "Kent Gibson"
 <warthog618@gmail.com>, "Phil Howard" <phil@gadgetoid.com>,
 <linux-gpio@vger.kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>
From: "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod][PATCH] README: add info about the github page
X-Mailer: aerc 0.15.2
References: <20240112150546.13891-1-brgl@bgdev.pl>
 <CYCTZY7PE9TQ.1SJWALQUCVPAC@ablu-work>
 <CAMRc=Mc_-0FiB16afOgUxyX3ic07EKbH08Z1Y2aUSoPkzBQm5g@mail.gmail.com>
In-Reply-To: <CAMRc=Mc_-0FiB16afOgUxyX3ic07EKbH08Z1Y2aUSoPkzBQm5g@mail.gmail.com>

On Fri Jan 12, 2024 at 5:05 PM CET, Bartosz Golaszewski wrote:
> On Fri, Jan 12, 2024 at 4:26=E2=80=AFPM Erik Schilling
> <erik.schilling@linaro.org> wrote:
> >
> > On Fri Jan 12, 2024 at 4:05 PM CET, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > The github page over at https://github.com/brgl/libgpiod has been reo=
pened
> > > for bug reports and discussions. Add a link and a mention to the READ=
ME
> > > file.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > >  README | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/README b/README
> > > index 69128dc..41237f4 100644
> > > --- a/README
> > > +++ b/README
> > > @@ -294,9 +294,14 @@ Those also provide examples of the expected form=
atting.
> > >  Allow some time for your e-mail to propagate to the list before retr=
ying,
> > >  particularly if there are no e-mails in the list more recent than yo=
urs.
> > >
> > > +There is a libgpiod github page[7] available for reporting bugs and =
general
> > > +discussions and although PRs can be submitted and discussed, upstrea=
mbound
> > > +patches need to go through the mailing list nevertheless.
> > > +
> > >  [1] https://github.com/kward/shunit2
> > >  [2] http://vger.kernel.org/vger-lists.html#linux-gpio
> > >  [3] https://docs.kernel.org/process/email-clients.html
> > >  [4] https://docs.kernel.org/process/coding-style.html
> > >  [5] https://docs.kernel.org/process/submitting-patches.html
> > >  [6] https://lore.kernel.org/linux-gpio/
> > > +[7] https://github.com/brgl/libgpiod
> >
> > The repo only seems to be configured for PRs. Issues and discussions ar=
e
> > disabled for the public.
> >
> > - Erik
> >
>
> Should be good now.

Reviewed-by: Erik Schilling <erik.schilling@linaro.org>

> Should I create a wiki too?

Got no opinion on that.

- Erik

