Return-Path: <linux-gpio+bounces-2214-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D4D82D623
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 10:37:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D1C8281011
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 09:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE34D2E6;
	Mon, 15 Jan 2024 09:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="z2Sl0dR6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E03DD26B
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jan 2024 09:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-466faf5846eso1414641137.0
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jan 2024 01:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705311455; x=1705916255; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tlxj2hTvn4fIuA7BDx/V5V4zsSiaOtdk7moSm4fH73Y=;
        b=z2Sl0dR6f86DdJQXb6cbMczJ8LvQVxj/neXFGzyj9rMJOx2e1oHbolMszmpZANxFUM
         RhW7drdthmbSGX6Yff7ZkVYwNOl62x2yBGhtKJOWK1ZtpjSjIAPLqXq/ftw+c0EWr4wo
         Tw//qe3cE5Dr7YuOrdCkOdDa6nFuSKHrAqnRZixAQyZkTpR9sQDu5mzk2k1Hk8AaQ6KW
         iLbZe+U8NPc8rmlJ8dR/BzA/iaGaJ98BoCTjamkyV/6RxUsqnl9JvZhRrNRcNp3+l34w
         ++R5U1tR6M6iQGW2fWAJ7bmdNtZSI0/ytzdnuyzX4kz0D1Em2rwaA0K88vEJV/9xOpVz
         7z6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705311455; x=1705916255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tlxj2hTvn4fIuA7BDx/V5V4zsSiaOtdk7moSm4fH73Y=;
        b=WhDgfdo9FntRFX1paRLv7UDcW/v+JAvpvwYnsD9gjmeqJcpdrIYi4v7qLi9df/c7n6
         IRVRxGfW8UhS9REij8YOJ8tteIfzjehoKAXxiqf6c6E8qhTlZKk6kClnH8GmyIkJHVYD
         gkXMCq17/5m4labz+zaSykEPTdg6SjL2YkpEHKm1czp6ra4WkMSN9EYYFRd62LQUgLSG
         9bTL7MLIX6tbltHqUWxjiABWHSDwumFo/VgSAEoILfk2SKUptPHebylcbXHBM/NTrYQG
         MJ4y3/0frv701Atnc3zEVQNe4+iG1OaqMyrwssDDAl+C03DZHRkop4dbMO7L+PJQNm++
         fUcA==
X-Gm-Message-State: AOJu0YzDYs79ni1C0onmVY3HrkpjM+CHjtoEnIfl+Tzbqp25+uy62LBD
	vH+d2nE9DQILrsbGfcgEdiJ2f+hz6SKiUFD+bHAOMLAQh6Zpjg==
X-Google-Smtp-Source: AGHT+IH62HLYQA9a5H8meOq8bxUfHtgO52ju86CtKvzdsjQR5+X3BHaY29Tli0cnjgSzKTzTb/aglvjDV3LPTCdUnos=
X-Received: by 2002:a67:c786:0:b0:468:17fc:f4ae with SMTP id
 t6-20020a67c786000000b0046817fcf4aemr3409026vsk.6.1705311455059; Mon, 15 Jan
 2024 01:37:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240112150546.13891-1-brgl@bgdev.pl> <20240112152502.GA92656@rigel>
 <20240112154030.GA94712@rigel> <CAMRc=Mc0dLkjnOrM2QdVkOhnXccHv6hFu0WPEuL31hGLKkJpbw@mail.gmail.com>
 <CYCV3N24HKCG.1W9TO82K8QOPD@ablu-work>
In-Reply-To: <CYCV3N24HKCG.1W9TO82K8QOPD@ablu-work>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 15 Jan 2024 10:37:24 +0100
Message-ID: <CAMRc=MfjPbePaaD6jW3hM9M7Vq8-DAeyggbmUL1kUpVpM0_UTg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] README: add info about the github page
To: Erik Schilling <erik.schilling@linaro.org>
Cc: Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Phil Howard <phil@gadgetoid.com>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 5:18=E2=80=AFPM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> On Fri Jan 12, 2024 at 5:07 PM CET, Bartosz Golaszewski wrote:
> > On Fri, Jan 12, 2024 at 4:40=E2=80=AFPM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > On Fri, Jan 12, 2024 at 11:25:02PM +0800, Kent Gibson wrote:
> > > > On Fri, Jan 12, 2024 at 04:05:46PM +0100, Bartosz Golaszewski wrote=
:
> > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > >
> > > > > The github page over at https://github.com/brgl/libgpiod has been=
 reopened
> > > > > for bug reports and discussions. Add a link and a mention to the =
README
> > > > > file.
> > > > >
> > > >
> > > > No problem with the patch, but the github page itself seems to have
> > > > Issues and Discussions disabled.  And the Wiki might be useful too?
> > > >
> > >
> > > The Releases section could use updating - it lists the latest as v0.3
> > > from June 2017!
> > >
> >
> > I don't want to do releases on github. The right place to fetch the
> > releases from is kernel.org[1] (I should add this link to README too)
> > and I don't want to duplicate release tarballs. I'm pretty sure people
> > would start fetching releases from github for distros etc.
>
> You might want to delete the old tags from the github remote in that
> case. I think it might be a bit confusing to see v0.3 as "most recent"
> release otherwise.
>

Yeah, I did that and only left master, v2.1.x and v1.6.x branches alive.

Bart

