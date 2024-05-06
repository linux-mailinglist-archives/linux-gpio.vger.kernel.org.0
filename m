Return-Path: <linux-gpio+bounces-6159-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E7A8BD40B
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 19:46:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC071281B80
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 17:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C501157493;
	Mon,  6 May 2024 17:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yLfzTcqP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979BB156962
	for <linux-gpio@vger.kernel.org>; Mon,  6 May 2024 17:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715017593; cv=none; b=Va1SpeoelxLTTGFvjcYlKgVsJuqwJqPINJVXD6qeY7v4V49oadeOHAX+IdncpAyZXKripajO1rp1cVq2sz33P580mupijBGwnq8BSxmQ61giQ4CjSAUHyqBFn9aCldXE4pH7nkCm1yATs0j8h1AV/zOjf4r0rBP/FsRbYcTzJJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715017593; c=relaxed/simple;
	bh=4U9lsI4vCiFNxjVUO4V5H25w7AvN8EpkvK8RCJ5M7Vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aifH1EvhkXvmYLJnm6c3D4XA8GZT9LQqVVZJLYui+o569ieB24dNzEcHHBu3Inv4DQseuGFIMeHR8/XbWisME7ORLMq31ZfPih5iElApth0rHoGvcuQbAh6YwX7o2z5FGJj09WG4Ik5rFf5+myuYkUYz/o+bOn8cIql2aq9/lbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yLfzTcqP; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51f40b5e059so2725453e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 May 2024 10:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715017590; x=1715622390; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Y2WbQExeE//tKYnuddqR7gNVk6iJ74yQ0LHu7IR5Lo=;
        b=yLfzTcqPVJXG2jR9dS0feCZypNKX3N78fI4tAnoHUT1V6TSgO800Dngq0DjI8vT+u2
         Fy7ATUAyBA6m1khWbzADSpOcVlpsE38Ak4ECCRIy9MBGP3XBhwvg5iFsoGu6DYOSG4xS
         +MxEzSTEDBZwfmwRzuDbkIyucaMO4ZuqWJifaOHiRA854d22KY/lMX1gmm2nrx6YLi/y
         5/p8JRqpRmuJ7fQRs4pWBcxQIrF8Q/YDM+gWxk/GrNSfSDeKn3li/xWY2v6eC4NZNX5S
         nm6NmUWIyDuJAVEt8hxNdCIcVx4HjZbC2kYpQmRLyFI44Sv/+MXdnbAg7c+42OtmEhUU
         uMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715017590; x=1715622390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Y2WbQExeE//tKYnuddqR7gNVk6iJ74yQ0LHu7IR5Lo=;
        b=v12HVPex41PEzSDPvNmHb4hLBdHSUiJCbsQMNEgwtvP6CbmtrBO0YVsMsFUj4W/jgs
         K2OtBjD4au+vYb3ZRinZyD7fty1IUKWgJI5kIJqOHBd9lsfKuBFSwm7B004hW47KCZqL
         kYKy0ZU5gKalDMTN1Gkrn7iJ1dRR5OAWrMuFUr2uI6tCF1qe6rY9IRUV9RjtGYgqAzBC
         7tkLnNgLYclsGInzWfgnpBLmPptT22uuF5Lbm/94i4jSRd1PAiU/keyHOcvjAXr4WZM+
         xd7GzkrqP0YTs+UKpBZEyJhKO/W4S53weDEZECkLAmuBekjWmm7qAlUP6rDM/Qtphkmj
         tzLw==
X-Forwarded-Encrypted: i=1; AJvYcCUmq16BrSEi94twguGh7L41ztJgPWCmL2IIpt9HIqZdleg/znYxS+SmOM0FmNaGHR4bwGTtx7gz6gIL150CeIHBHG7gnokMrjN6Uw==
X-Gm-Message-State: AOJu0YzOB9RAqB4gDlFL/27C96JTRTd5qfM3yb1LYIxgaaX+FDqlNT2D
	ZhVkqKXWc4AeGJjSHVbATjv7c5tOPt0tYZYTbHJxDhH7WLxBgaHvfayQR4LRC3A1A+RV7iCmlFT
	QUBNOSzehLBN49DdTjPw25eLHesXim9hW5KkIM24Ud01EMn+2
X-Google-Smtp-Source: AGHT+IGj56shK9XcBR8Lv8YfYN0FRqoo4ldjihQ4EE50iB5teYmp8tf6YBAZhP7ZBKjxFWh4o7Q3WNIE/NYvQi+phCQ=
X-Received: by 2002:ac2:522c:0:b0:51c:d876:710c with SMTP id
 i12-20020ac2522c000000b0051cd876710cmr6386222lfl.37.1715017589571; Mon, 06
 May 2024 10:46:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=Mfig2oooDQYTqo23W3PXSdzhVO4p=G4+P8y1ppBOrkrJQ@mail.gmail.com>
 <2b2eb5f5-af66-4ba3-bab8-c34b680d8715@paulmck-laptop> <CAMRc=MfnSc1WWg47g-SZqqgEQPUQG-EfHEQxEqvvmRA1ksVnDw@mail.gmail.com>
 <4c2ea46e-8062-4289-bcf8-c3cf6ebedb9e@paulmck-laptop>
In-Reply-To: <4c2ea46e-8062-4289-bcf8-c3cf6ebedb9e@paulmck-laptop>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 6 May 2024 19:46:18 +0200
Message-ID: <CAMRc=MfF4kkXToy+RSt4QPXPtsOEUcM4xpXdosWTxtjUy9x6CA@mail.gmail.com>
Subject: Re: Performance regression in GPIOLIB with SRCU when using the
 user-space ABI in a *wrong* way
To: paulmck@kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 7:01=E2=80=AFPM Paul E. McKenney <paulmck@kernel.org=
> wrote:
>
> On Mon, May 06, 2024 at 06:34:27PM +0200, Bartosz Golaszewski wrote:
> > On Mon, May 6, 2024 at 3:55=E2=80=AFPM Paul E. McKenney <paulmck@kernel=
.org> wrote:
> > >
> > > On Mon, May 06, 2024 at 02:32:57PM +0200, Bartosz Golaszewski wrote:
> > >>
> > > > The offending kernel code looks like this:
> > > >
> > > >     old =3D rcu_replace_pointer(desc->label, new, 1);
> > > >     synchronize_srcu(&desc->srcu);
> > > >     kfree_const(old);
> > > >
> > > > I was wondering if we even have to synchronize here? The correspond=
ing
> > > > read-only sections call srcu_dereference(desc->label, &desc->srcu).
> > > > Would it be enough to implement kfree_const_rcu() and use it here
> > > > without synchronizing? Would the read-only users correctly see that
> > > > last dereferenced address still points to valid memory until they a=
ll
> > > > release the lock and the memory would only then be freed? Is my
> > > > understanding of kfree_rcu() correct?
> > >
> > > It looks like kfree_const() just does a kfree(), so why not use
> > > call_srcu() to replace the above calls to synchronize_srcu() and
> > > kfree_const()?
> > >
> > > Something like this:
> > >
> > >         if (!is_kernel_rodata((unsigned long)(old)))
> > >                 call_srcu(&desc->srcu, &desc->rh, gpio_cb);
> > >
> > > This requires adding an rcu_head field named "rh" to the structure
> > > referenced by "desc" and creating a gpio_cb() wrapper function:
> > >
> > > static void connection_release(struct rcu_head *rhp)
> > > {
> > >         struct beats_me *bmp =3D container_of(rhp, struct beats_me, r=
h);
> > >
> > >         kfree(bmp);
> > > }
> > >
> > > I could not find the code, so I don't know what "beats_me" above
> > > should be replaced with.
> > >
> > > Would that work?
> >
> > Thanks, this looks like a potential solution but something's not clear
> > for me. What I want to free here is "old". However, its address is a
> > field in struct beats_me and it's replaced (using
> > rcu_replace_pointer()) before scheduling the free. When
> > connection_release() will eventually be called, I think the address
> > under bmp->label will be the new one? How would I pass some arbitrary
> > user data to this callback (if at all possible?).
>
> You are quite right, that "&desc->rh" should be "&old->rh", and the
> struct rcu_head would need to go into the structure referenced by "old".
>
> Apologies for my confusion, but in my defense, I could not find this code=
.

Sorry, I should have pointed to it in the first place. It lives in
drivers/gpio/gpiolib.c in desc_set_label(). So "old" here is actually
a const char * so I guess it should be made into a full-blown struct
for this to work?

Also: do I need to somehow manage struct rcu_head? Initialize/release
it with some dedicated API? I couldn't find anything.

Bart

