Return-Path: <linux-gpio+bounces-5203-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B4B89CC19
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 20:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8BB31C20D3A
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 18:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A3CB146A9B;
	Mon,  8 Apr 2024 18:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="h/DtSveP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39831448FD
	for <linux-gpio@vger.kernel.org>; Mon,  8 Apr 2024 18:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712602672; cv=none; b=lHc4khEBm7XDL4siZt0icywF9rwT+tVxjI7gbZoyGAHsar7AeRSf8bTSiAitabGSE/Y6OpZ591Fyc4fv9bs5vUYSavXffUj+Pu1UVAo423saQW5wT5+t0gno7nWtrW2BacI7DFRqZw+WK4x5dU1nAqBZjT2rKKAGVp690gmqjmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712602672; c=relaxed/simple;
	bh=qzMVtomWBHH/q1o9JN5nSI2Ab8UZERfcb/xKvfW9GNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KZbVa4J/vyMxIDbbSsxTGlGDYE4DNZRwM5GqRRZ9lTSUQgwja9hKK4PRacxovAlVah5J1dlDQ2m2V+xOud/1eFxBysvzj8UxP2qhz3fijBYwrRTgPiX0rWxfXS0RSKovWHQeO/x8XgOzhFiSNfo90geWn2KR9kav+xI0LjDto1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=h/DtSveP; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d872102372so20320011fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Apr 2024 11:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712602669; x=1713207469; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzMVtomWBHH/q1o9JN5nSI2Ab8UZERfcb/xKvfW9GNk=;
        b=h/DtSvePK8C31RgvULFRldIiryumbz88mvrezBNxLvUbqW8JDPh84WjSmIeXCJ5JOz
         TcC5NUG2taiz15xRljkM/2zFRuemHUIZ0lQBdbVYb7u0eRubdpYlgSDIGSW4JD9imnEe
         Jyxehwg7rJmrAxQ4J16UH8T5UAxRu4BmNlinK3OPqP7tvnClUjTCWb6Gh9Z8PC2zihoV
         FSunroSpeciaJ72P+Va33wZ3sdGv2OEHx63qvsn6Ialyd2GZjHcnYONPIDEEyzQ/08ND
         13Bci++9s9C/pAaJcGf9PRDOr6yp4R4DTWRkijBvXCxkeKgDWkXuEStD3Bs0ypDXwK9V
         YgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712602669; x=1713207469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qzMVtomWBHH/q1o9JN5nSI2Ab8UZERfcb/xKvfW9GNk=;
        b=BTI+J4pYMCBO1FqB2LdZfGgUUEJFSNpjvD1Wg5wYemnLuWHZADKMRyO+Jdh5yonp89
         ccv3tdsY1xLu79L7yF7QnWOVKbh+iYonKgDGe7FAwsGjJiroc7P/kWoQ4n51LjOhS3Gr
         NSdqG6Gp8H/JCGZhhsyFRdNcRirefXZk2RfZijA7f8VJlUtVH2/VkcfF6LuAkBVBHofz
         Sc4UMPHYje9WCPliJCwkoMVtADDXVNChRSxqGkt+Uj6lD3QZBP9DN4jMQkKxZfSWp8/h
         9HP+MiKADAsnQv7pUqIie9nG6Z7QTrWhzzFdiIwnihOkF0dJ8C+nMdFejxmeKjSgw+hh
         7xFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvj8UzMfklz9iw2bJ0mTYzXLtvlhEpoacswDiSNzIgcV/Qq3lpul5YE4DGdR4rua2mwdO3nmdXnLDZZYQVzjdOZTENXil4vul7tg==
X-Gm-Message-State: AOJu0Yyav+a0KvlbCLF5SPGxo++41WOETUYsZzZ4SlK44cJrh2zjAAia
	/Qajiq3d0uQhk9yn7iLhaJAlNWWvRHKW6LbMCbh5M3MBEndEJ+nj3pR7QIkvmewwiTntLlPtjdQ
	IzgvL6hFHkOhE5yTHvLvI3k190S9PlMnK9654XA==
X-Google-Smtp-Source: AGHT+IG/V0WevA+gGnLBGUVboZpOtRSJTBPnNbrVTs6uKeBTGnC1leaKVEdfjKZdiI8D3lc/CAFmDjpZA1HPNLx1mCM=
X-Received: by 2002:a2e:7202:0:b0:2d8:7c80:5cb4 with SMTP id
 n2-20020a2e7202000000b002d87c805cb4mr141766ljc.11.1712602668954; Mon, 08 Apr
 2024 11:57:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240227113426.253232-1-herve.codina@bootlin.com>
 <CAMRc=MeSMTnPUYGyJir4fc=6=Gnw_MVP9wfEKMQ6Ck33FYCrRA@mail.gmail.com>
 <CACRpkdZbGUd-u3ZcmmK1POSEq8z9J1aDhbGPAbcR6guKuEpEFQ@mail.gmail.com>
 <CAMRc=MeqiYZv3ViHRKKUsXTqG5Pc8Ev2jUcN=A4VuX3RU7dDtw@mail.gmail.com> <20240408152715.37948577@bootlin.com>
In-Reply-To: <20240408152715.37948577@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 8 Apr 2024 20:57:38 +0200
Message-ID: <CAMRc=McFOe+B13Q7t1wdL3DiF21ga5+Maq59yXhZ_F7B0TKxEA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpio-cdev: Release IRQ used by gpio-cdev on gpio
 chip removal
To: Herve Codina <herve.codina@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Saravana Kannan <saravanak@google.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 8, 2024 at 3:27=E2=80=AFPM Herve Codina <herve.codina@bootlin.c=
om> wrote:
>
> Hi Bartosz,
>
> On Fri, 1 Mar 2024 08:21:09 +0100
> Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> ...
> >
> > I DO want to fix it, don't get me wrong. I don't want to just leave it
> > like this, especially since we've made so much progress with
> > hotpluggability recently. I just don't believe this is the right fix,
> > I will try to come up with a solution that addresses the issue
> > globally.
> >
>
> I didn't see anything but I could miss something.
> Did you move forward on this topic ?
>

No, I'm currently spending almost 100% of my GPIO time on getting the
libgpiod DBus API ready and I should send the first version by the end
of this week. After that I'll be at EOSS and then on vacation, so the
earliest I will get to working on it is early May.

If you feel like giving it another shot - go for it. I believe the
device link problem I described previously[1] must be fixed first. I
would also consider a more generic solution in the interrupt subsystem
that would make it aware that interrupt controllers may be torn down
with interrupts still requested.

As I said: I will get to it but not in the following couple weeks.

Bart

[1] https://lore.kernel.org/lkml/CAMRc=3DMf5fRWoOMsJ41vzvE=3D-vp3wi-Obw=3Dj=
5fBk3DuQaZNQP2Q@mail.gmail.com/

