Return-Path: <linux-gpio+bounces-2002-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8720823780
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 23:10:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 489951F25E7E
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 22:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A70A1DA40;
	Wed,  3 Jan 2024 22:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cM9RdSCH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752CF1EB20
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jan 2024 22:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e7f58c5fbso8622012e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jan 2024 14:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704319778; x=1704924578; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1BKUchvbI644CL3+pT0E6/gYj6lvjAPZCKAsB+0v1g=;
        b=cM9RdSCHMufkiX5JFrQmru05RB0HbOcEd3oHhr2Cbrq28lJv+oXGQTJrGr6IIadA7j
         zWcK7fqUq44j+/tCw5/W7G4/v8yE12ZRzD+8Mss/pzdEyN9R+r2qZF9Z9hURFVg39sd6
         8/i7LuhnQV/jE6AcNEoKN6G7WzDlA9utI3ylo5NFCUwzPRAVCB9QSot/kQiJgt2twMtt
         PUdhH9FpbMQ21rAaGDrBIiNSGFJ02j/UNP4VjJb1NmcDGZ10j9NIrVJlgtpoEp6vRw3B
         hmQkwCKAXWmUrkcS+/O8CBwneUftlckwvSAyN5GA0lqVh+W0P/ZE1ZhUkhjOFkc2aysX
         dAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704319778; x=1704924578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d1BKUchvbI644CL3+pT0E6/gYj6lvjAPZCKAsB+0v1g=;
        b=hwpyv9G1y/9RKBeu/u+mbfjyr4HrWJODgXcsKp4kBWWnR92enY3Wi+71kdYUtRSF5s
         4UGFGmz+RXA60EmPwy9L9e0Qsnqnh3I764VCGy1maE5cveqeh6ZeWmrYHJsroZ78Fxma
         BuL5kNHt7tHwPTIyQgULVd6f7ZswvCrkJ/RC7ETT5muGzCU1NvEq0y8xFtu7pdy1dCJP
         wwefaZVcReBojfzL2T4/k/DBd6JyEWq85DKF4SxdC+F1kJg6mcz4H+TXOHKghiq2un7l
         X73kc6LXSOZE8Ajf0DQ6PnouYemRmzrJDlzT8w03Dsnbsc5RSfJMCRv8IEwjN+vf3HxH
         f5mQ==
X-Gm-Message-State: AOJu0YyN2BDQyziz0kzsIGKvSu8u5I1YaHk/Nl3x1jnDlllyi+3n8ZrL
	1JvllyzgkB/3uTsyGyF30GtOWg12X85gG5vsmBacWO4p
X-Google-Smtp-Source: AGHT+IEHIimY8+Ob26odK9TyTQhKhhMCigHHnyLmsT23ePqdhNOS4yWT7RPhF+Orv791lVx+ZgZ96ACOA5DF+k29Qo4=
X-Received: by 2002:a05:6512:713:b0:50e:7c08:4364 with SMTP id
 b19-20020a056512071300b0050e7c084364mr6093612lfs.45.1704319778091; Wed, 03
 Jan 2024 14:09:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ8C1XPiYYeOzbZXcDFR2GX-CoRFuvJim6QVi9-O-oR4mZBauA@mail.gmail.com>
 <CAMRc=Mfmf1pPnkGkyZZKmucOprq4cLnnfxSLaSxSB3Ra_3iYeg@mail.gmail.com>
 <CAJ8C1XMySRzbM1Unj+7LhY9_0AiSyAjoJC-qMQvUAPQfBcu5Wg@mail.gmail.com> <CAMRc=MeyHkHyK7YVx_5YpPxvgY4b2XTBtNVHDrC3FNxiEg4Bjw@mail.gmail.com>
In-Reply-To: <CAMRc=MeyHkHyK7YVx_5YpPxvgY4b2XTBtNVHDrC3FNxiEg4Bjw@mail.gmail.com>
From: Seamus de Mora <seamusdemora@gmail.com>
Date: Wed, 3 Jan 2024 16:09:01 -0600
Message-ID: <CAJ8C1XMsjLNdRFS8dDCua7=zha+LnuOcWCy-7W_uU5+LWgqpxQ@mail.gmail.com>
Subject: Re: Some thoughts following a brief test of libgpiod ver 2.1
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 3, 2024 at 12:35=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Wed, Jan 3, 2024 at 6:53=E2=80=AFPM Seamus de Mora <seamusdemora@gmail=
.com> wrote:
> >
> > On Wed, Jan 3, 2024 at 4:47=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> > >
> > > On Thu, Dec 28, 2023 at 2:20=E2=80=AFAM Seamus de Mora <seamusdemora@=
gmail.com> wrote:
> > > >
> > >
        [ snip ]
> > >
> > I thought this issue of line ownership had been resolved...  i.e. the
> > system driver would take control of the line once the user's process
> > had exited? Maybe I'm confused on this point, but I *thought* I had
> > read that somewhere else?
>
> The driver is just a low-level interface between the core GPIO code
> and the hardware. It does not typically take control of any GPIOs
> (unless it calls gpiochip_request_own_desc() but that's an internal
> detail).
>

OK - that *sounds* like a different story than the one your partner is
telling... do you guys ever "talk"?

> >
> > Nevertheless, to address your questions: No - I didn't mean to infer
> > that there's only one user. I understand that you (library developer)
> > need to account for different users. But GPIO control is not a unique
> > issue in Linux (or any multi-user OS). It is the same if we were
> > talking about control of a serial port/UART... how is that arbitrated
> > between users?
>
> It's exactly the same. The first user to claim a serial port (be it an
> in-kernel serdev or a user opening /dev/ttyX) takes exclusive usage
> and keeps the port until it releases it.
>

OK - we agree on that much.

> >
> > WRT a GPIO line, I'd say "the user" is the one who issued the gpioset
> > command. In the context of your example ("When gpioset acquires the
> > GPIO for exclusive usage"), why could gpioset (or the user who issued
> > the gpioset command) not 'make a claim for exclusive usage' of the
> > GPIO line? If other users/processes subsequently attempted to claim
> > the same line, their claim would simply be disallowed - unless they
> > were `root`. Is there a reason why this model of ownership could not
> > work?
>
> This is precisely what happens though (except for root being able to
> override a regular user)? Or am I not understanding this paragraph?
>

I think you and I have a common understanding on this point. I only
brought the root user in because the primary concern seems to be
"ownership" of the line, and I thought 'root' could arbitrate that.

> >
> > No - not referring to sysfs... and I'm not sure I'm following your
> > argument here. But the only point I'm trying to make is wrt
> > 'persistence': First, I'll assume that you are saying that gpioset has
> > a role to play in persistence, and that it does not delegate the
> > persistence question to the driver. Under that assumption, I am
> > suggesting that another model for persistence is as I outlined above.
> > And I'll ask again, "Is there a reason that model could not work?"
> >
>
> I'm sorry, I'm not sure what *that model* is. Gpioset has no role in
> persistence because it's merely a wrapper around libgpiod which is a
> wrapper around the kernel uAPI which - by design - offers no
> persistence.

Well - we're back to 'square one' it seems. There must be persistence
in GPIO control. It gets back to my example with the bedroom light.
Do you agree that persistence must exist in GPIO control?

> FYI I understand the need for a user-space GPIO authority that's more
> centralized and am working on a DBus daemon that will become exactly
> that. However my cup runneth over so it'll be some time before it's
> done. :(
>

So - does that mean that we're going to have to wait for version 3 (or
4?) of libgpiod to get something that provides persistence of GPIO
control?

I apologize if this sounds "short", but if we cannot agree that
persistence is fundamental to GPIO control, then I'm at a loss for
words.

Best Rgds,
~S

