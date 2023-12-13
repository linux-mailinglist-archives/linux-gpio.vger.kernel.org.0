Return-Path: <linux-gpio+bounces-1351-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCBB810DD2
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 11:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 579351C20952
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 10:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA49222313;
	Wed, 13 Dec 2023 10:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mB5aZ8hh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFE18A4
	for <linux-gpio@vger.kernel.org>; Wed, 13 Dec 2023 02:03:51 -0800 (PST)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-7ca9c5921ceso2058572241.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 Dec 2023 02:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702461831; x=1703066631; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/qPaIfmghWpTcqxcVuuhDpPLoLBeCE+kTWvQmM/68A=;
        b=mB5aZ8hhw7+zC5YruVNA2JWNN/+81p4tppiYN04VmoiaOKPhbTP09KNO9KKEXxwbvg
         T0RFtsLYvn5Jy95so7ExV3Sk7DIKpKMT9k7vsTKQGCW693xqNDYMbuFcNfDtlAFIE+y0
         ukyxS2VN484hlFKwCIKgDvpvRPjsPIB4De8Vnn6tbxFVvOj+npr2OLN7OceRfxN0pJiV
         Md0bho/E7IRH79XTo4s08GG5EHJA9YTng6zA0nU0MCiP9qV7BcLpsmRveENws7uKXPUx
         GxwfIJszvMfK40uilqAUDIEzOPcdmZvg0tfeabXhTGvKOVvxB9B0I8W/26K9KCegsy23
         mAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702461831; x=1703066631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/qPaIfmghWpTcqxcVuuhDpPLoLBeCE+kTWvQmM/68A=;
        b=JD7rj2de20HD1KsOBVKh9lqaMNqPyuM8UK/6HvqRvd9l739XQ9f7BAQ9bpwijMeePw
         /B06+xpaPeANnfQK0BKgeAPoahBBn/Ip3eXzkrZrWlRHsR17PfzmfkPBXqawtooB7UgH
         N813x7tBLNqE5kaK4QPM50QS7hoBfxJuQum/A4V9gJtrTETDrnQoZL+rtR2DFdHPKRYh
         JBLoBl/33bBrpk3KYfnvxrT6Jw66BfiZoxPh/f6L/3OTQHWB/SvYmaD1FBFmzyR/1VpO
         LOlPgY1tnbH479qhZBdH/BVu9qTu7hXQc4vBzFW8y+9Hhqagkal5//LYSDscSI3jfSUv
         +8lg==
X-Gm-Message-State: AOJu0Ywc1x3P2MYlHt/Ipvh/Fq9DW469Y+SpQcWilEk6hq5Hb5i7QUYe
	+EkNd/dLFgDand5NqixQdrjLp/c7P6KHOp7mj7fyZQ==
X-Google-Smtp-Source: AGHT+IG3ImtM5KXcZ7eTb8vW10Gvrumis+otVhTYGJe6eSKBhEy2rOOc9T3pTbOBsxNp/lr4gzSTWkji28AMoMKXwgc=
X-Received: by 2002:a05:6102:3a0c:b0:464:865e:6aaf with SMTP id
 b12-20020a0561023a0c00b00464865e6aafmr5265030vsu.1.1702461830883; Wed, 13 Dec
 2023 02:03:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231212054253.50094-1-warthog618@gmail.com> <CAMRc=Me90Lu7Duc8-4xSfDcHQd6M7+0t0O8FAa6jiizp-OO5=Q@mail.gmail.com>
 <ZXjzjOtKFoMRhKA-@rigel>
In-Reply-To: <ZXjzjOtKFoMRhKA-@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 13 Dec 2023 11:03:40 +0100
Message-ID: <CAMRc=Me1czOqnJUG3sth6kZh=G+iXAHp7HHL1u-Oy3=MwkCPug@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpiolib: cdev: relocate debounce_period_us
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 12:58=E2=80=AFAM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> On Tue, Dec 12, 2023 at 06:09:00PM +0100, Bartosz Golaszewski wrote:

[snip]

> >
> > Patches 2-4 look fine, I was about to review patch 1 in detail but I
> > thought I'd just throw this one in here before we commit to a specific
> > solution.
> >
> > For some reason I thought this would not work but I'm now considering
> > it as an alternative approach: is there anything wrong with adding
> > struct kref to struct line, allocating it separately per-line when
> > gpio_chardev_data is created, referencing it from struct linereq when
> > the line is being requested, and dropping the reference from
> > gpio_chardev_data and linereq when either is being removed? Other than
> > the increased number of allocations?
> >
>
> The collection of struct line always has to be global, right, as both
> gpio_chardev_data and linereq are ephemeral.  e.g. if one process request=
s
> a line and another checks the lineinfo, those will have distinct
> gpio_chardev_data.
>

Strictly speaking at least the supplemental info has to be globally
accessible. But I get your point.

> But the key issue is that the linereq and struct line lifetimes are
> strictly tied - a struct line does not live beyond the containing linereq=
.

I was thinking about decoupling one from the other actually.

> Leaving the struct line alive after the linereq is released is just wrong=
.
> The line has been released back to gpiolib so there can be no
> supplemental info left.

Indeed.

> If you want any such info to persist beyond the line release then it
> should be located in gpiolib itself, not cdev.
>

Right, we even zero debounce_period_us anyway on line release - just
as if we released struct line.

Bart

