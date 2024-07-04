Return-Path: <linux-gpio+bounces-8046-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A639279A3
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 17:10:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04B65281D46
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 15:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D011B0117;
	Thu,  4 Jul 2024 15:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMcVToOe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C271AE0A2
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jul 2024 15:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720105820; cv=none; b=Uhr+oYtR+w5GeWM/qQfsUqj7RkXP93DT9t+AbXOojqqzzcgBp1etWPqO7natHUYmzRbQX3pl4BcWMjj3/BD3k9dYlkgVlu4Qk3BD0qGMrKjyFnUzTIxD1Y4a/jFfvkh7YipPkAKILUkEk/BzsIqabHLhdMk3Xx32xAELl0Ab110=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720105820; c=relaxed/simple;
	bh=lF9mmSD8tlcsrwH/wcFGZbSgnOGho9lo2mIVfWS1joU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dqcHRC4ndjiJBxqXfdjuZlOitjmmoFQsglNY5zcxSq4z3/l0KltWvbMbFwri18z4P8Zv3UgqCFBmccvF+f470VFmL+D7XleFLWmbvfisDdM7hSX4smBVMlbZqtyKVxAmDSbuIc4qxbYZh04J37wyoWXlg713UWKLwUeUqH87xAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LMcVToOe; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-75ee39f1ffbso471344a12.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jul 2024 08:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720105818; x=1720710618; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EV9Go3vYL1qsQ9ZARqL7/xb2IzV62u0mks16aLteFVc=;
        b=LMcVToOeXFazAdfKEfNLgoHd3G5sig3Dk6pETnLlFPnNzdNr02fjCk9FDUOZ/JT10m
         6P2XL66l5xFZBETmWTF21X7rwfBTRU3qmfesyF19fVVpLDks+Jy//qwcCs2V1L71zEkk
         eDEBZDq1rmwi8V7Jy8sUFmRTPXqLA668kx1zeq+qLnvB4qkGdMVkeA5uSKak9TU+JW9S
         CDIjlWLBu9/0FlYxm1Sm2JsRTsBbtjpGbe2Fpbwm0FyJ9hrEzrTZHA+4XFCbc8ed2YYC
         anMRlombLxiiWEtxeWTW/H0/vsU0iMQscP8uZk0CFNcyD2cp0wBEnKEKzsd85cC0Bmzq
         3v4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720105818; x=1720710618;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EV9Go3vYL1qsQ9ZARqL7/xb2IzV62u0mks16aLteFVc=;
        b=TekrLKNX7M4a/eXrwKfhq5cn/ZWCZTmyLLhAvzx5mPvbdiD4rE4BA1vCR/sf4gq1fK
         WmGCTexXBm32WJtZElnmyd/Y+0DRoPTf2zRP7p2ejPLaIUR1KRdrys9jomvQjrsGmAjc
         t9KdkIq1x6ZBpxqzP4urE32Rsl/E4fxSpi8PSE/7l43LOxjTiOsk8wtnlnugUEve39qU
         qDc6/AEItrwp6iOuPuOnFOmAVYfuKBRBya6Gujd9nS1XC/Y64fHtJFOdty5wGlHLvSVn
         FAmXWPxcztehuStzus02en1P94mHHguUPMMTEZVUfdHd2FEcYgIC1pibW2zRfPhqUulB
         6jdA==
X-Forwarded-Encrypted: i=1; AJvYcCWFM+yzowMLyqbRRm75bhcZHrYJNn0W8yzwaOgcvNEumcn4fl1JpCoQKj6m1B0IPlGB9E3qPxYhRVXVnKYEKhCvoobJaulpqf2how==
X-Gm-Message-State: AOJu0Yx0bwCMvoiuXcpZkIan0paKeJUa+Fi6LqWrQE0EwiVY32ugog6z
	4fkSu/ts4KTYAajxWad6DzfG9S+Wm2pijT7rvwI7iK04iK4wdWj7
X-Google-Smtp-Source: AGHT+IEcKreN8RJrTSWM6pwqFi4VMiDQjGP2pdsWERqyqWtg8W5Vy7a3iFOsoGnU4gWlz+oagz5Jcw==
X-Received: by 2002:a05:6a21:3384:b0:1be:c3ca:bc30 with SMTP id adf61e73a8af0-1c0cc727182mr2170698637.2.1720105818363;
        Thu, 04 Jul 2024 08:10:18 -0700 (PDT)
Received: from rigel ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb1a075b44sm34154755ad.17.2024.07.04.08.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 08:10:18 -0700 (PDT)
Date: Thu, 4 Jul 2024 23:10:13 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] README: list the development packages required
 to build the library
Message-ID: <20240704151013.GA98743@rigel>
References: <20240704142451.28400-1-brgl@bgdev.pl>
 <20240704145051.GA95228@rigel>
 <CAMRc=MfB==pSWJHM19dNjXxGV5v+pUsG=v82dxi6Bd1f4U3sqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfB==pSWJHM19dNjXxGV5v+pUsG=v82dxi6Bd1f4U3sqw@mail.gmail.com>

On Thu, Jul 04, 2024 at 04:57:40PM +0200, Bartosz Golaszewski wrote:
> On Thu, Jul 4, 2024 at 4:50 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Thu, Jul 04, 2024 at 04:24:51PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > The error messages emitted by configure when either libtool, pkg-config
> > > or autoconf-archive packages are missing on the host are not very clear
> > > and seem to cause confusion among users building the project from
> > > sources. List the required packages in the README.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > >  README | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/README b/README
> > > index a6f24d1..a20e801 100644
> > > --- a/README
> > > +++ b/README
> > > @@ -34,6 +34,11 @@ BUILDING
> > >  This is a pretty standard autotools project. The core C library does not have
> > >  any external dependencies other than the standard C library with GNU extensions.
> > >
> > > +The build system requires autotools, autoconf-archive, libtool and pkg-config
> > > +to be installed on the host system for the basic build. Development files for
> > > +additional libraries may be required depending on selected options. The
> > > +configure script will typically prompt the user for them clearly when missing.
> > > +
> >
> > typically?  Shouldn't that always be the case?
> >
>
> I used the word "typically" because I am simply not sure if *all*
> potentially missing dependencies will get reported correctly. We
> identified the ones listed above as causing confusing error message.
> Maybe there are more, just unreported (yet)?
>

You have covered the core dependencies, required just to get configure
to run, so you can assume those are present.
I would consider any other that case produced a confusing error to be a bug
to be fixed when found.
The problem with the "typically" is it normalises such a failure, so
then it wont be reported.

Cheers,
Kent.

> > "prompt" makes it seem interactive.
> > I would reword as "The configure script will report any missing additional
> > required dependencies."
> >
>
> Sure, can use this instead.
>
> Bart
>
> > Cheers,
> > Kent.

