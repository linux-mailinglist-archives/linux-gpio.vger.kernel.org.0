Return-Path: <linux-gpio+bounces-6205-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F47B8BE845
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 18:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7D301F2D4D1
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 16:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79DD216DED9;
	Tue,  7 May 2024 16:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gQtEBHZ2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A816C1649C8
	for <linux-gpio@vger.kernel.org>; Tue,  7 May 2024 16:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097837; cv=none; b=QdAXdCPzD3po3mB09Mju6D2oHtShqyHf+WogDlH7COxyFoNkY5gLUHdc2u8xbIyow3yxXa6wDRyIc/pq5MAitmT2OZMfEEOFnFBVToZLRLmTgNI2VVqZYh/PPT6l7ETEdMfQzr3cPLR9Pef0DDt1Ar5Sgg5PBf1cHTdlm4SYC6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097837; c=relaxed/simple;
	bh=h+WqAWK6+Iq0LII86ex6fvk5kOnBUciVEWM46Us+Rlg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rQtHJoeUgtKDW9FlmnZB4UC+5d6Cmcr/1ITvgd4ePLfRIdEve5YpqexFdz+fBH8PQOn0JlBF14iKFUzaiTRCnxFbzzQw7qxX8ugAHBWDCLLnEJyWwb9pSROH5g57iosTjGmy5hlcIK1mwyLT4MhQj8SfBJq5I5nJVX3pEPdDTg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gQtEBHZ2; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2b346712919so2505062a91.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 May 2024 09:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715097835; x=1715702635; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prrKZSc//t1JzRyJTp2WY1pgcPIExbpKnpjhUVcrR+g=;
        b=gQtEBHZ2LeO9afPUKzZmCQFLZOc0jlxBnQMV03Dvyy5/i8pPxTXGfAGKqE2nPESiYL
         qA8LV0XCAhFj6AJEJgBcJ/e1ecoJmMmc6oaoQK1r7NOVr8+BYnekjOECquOTneUNLdcx
         DUGwU5cPHB8m2nPJI8wzCnvbBqmw7Sw4o9f3PWGReCVthdGmnmmAbLc3ftk1YAsiuKzb
         ixEGD3JKV3cVYsN+H243k1TrOMzdt9hhl6BBpdPT+l7M43gOHP4Xy2/mdu8FH/M4voUr
         A5ne92hrF9lo+P+wt0C7o9oSsnKdGiHfkAJtBG3sY5j/k1DSIBQbDkw6LGKA2BJga0Od
         ox1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715097835; x=1715702635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=prrKZSc//t1JzRyJTp2WY1pgcPIExbpKnpjhUVcrR+g=;
        b=PYBIBbQFsdtR4KJFLBL6My7GmKB4JjgDxRCiw7K8sDTBOMPqTsmN80oGDzIByOvbCx
         ZMxCWJABclhhZE1m4TwnhAIO0OB4LkOzOOhkpp+QpuaiO8UrpgqBv1+BUt1oyW6Y5wWL
         5xA7Lj0k6fufQwJJvNTmZhLwaFkvopJph/ciDDxHYSruwH5P7AACOG9TljN5tbsb9f27
         UGnSgVkftDdXqrJnUEAMJVRx48OnhajofvhxxD+Od0+RVyOHWTq8uEyq0bhZ0k134Ru6
         kjWgtcnUTIyBIL/EcIVbzaMd+4uh2Z5zr1rLpp99EMpZ684tM1eymZ31OwPIXzHd+pHo
         4SNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQ+v52UVNJ1crfzt69un3E948v32vnVtRclauslNhE1otYb1EzkNKolTAa8EsQ+CmEY5utgR7zDD9shG3+owRBj9GsvXLcwLiTIg==
X-Gm-Message-State: AOJu0YwYbqxF/zYX1v27539sslBYhAun9deEe3CNx7OcFFSv068MktyV
	HFiJLvCbfeSDov90ubjsMni+hFmNgyuVD/Yw2s8cjte8nllmq+IQVPnHOpN8DyueZ+I48283Cll
	fwAjPfjAza9wm+04mDuJ1Lx5AbGnzNZOidWxzBQ==
X-Google-Smtp-Source: AGHT+IEtKJei6fjN+ouXRFWqqq69eab0KZdm2aJcHZBB47HOCu1RE/4GLccw6fVSiUywrqahV/kdF+Cu6Xbhw2E9v64=
X-Received: by 2002:a17:90a:f0c8:b0:2b4:e4d2:c9a1 with SMTP id
 98e67ed59e1d1-2b6165a13c2mr176a91.12.1715097834638; Tue, 07 May 2024 09:03:54
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507121346.16969-1-brgl@bgdev.pl> <597f5da2-71be-4144-a570-fdc4f06c4cc6@paulmck-laptop>
 <CAMRc=MexihBpLBcY-8aX06buUYmtE07ZpkMq0Ho3jrHb6VE7Sw@mail.gmail.com> <1e9042a9-f8ba-4ca9-a5e3-5eed1a02e1ca@paulmck-laptop>
In-Reply-To: <1e9042a9-f8ba-4ca9-a5e3-5eed1a02e1ca@paulmck-laptop>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 7 May 2024 18:03:41 +0200
Message-ID: <CAMRc=Mc0FLXtmiD0GhYbc8Wna+rAM+9dUF6JrdtZDQttBMgXBw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: fix the speed of descriptor label setting with SRCU
To: paulmck@kernel.org
Cc: Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2024 at 6:01=E2=80=AFPM Paul E. McKenney <paulmck@kernel.org=
> wrote:
>
> On Tue, May 07, 2024 at 04:48:04PM +0200, Bartosz Golaszewski wrote:
> > On Tue, May 7, 2024 at 4:24=E2=80=AFPM Paul E. McKenney <paulmck@kernel=
.org> wrote:
> > >
> > > On Tue, May 07, 2024 at 02:13:46PM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > Commit 1f2bcb8c8ccd ("gpio: protect the descriptor label with SRCU"=
)
> > > > caused a massive drop in performance of requesting GPIO lines due t=
o the
> > > > call to synchronize_srcu() on each label change. Rework the code to=
 not
> > > > wait until all read-only users are done with reading the label but
> > > > instead atomically replace the label pointer and schedule its relea=
se
> > > > after all read-only critical sections are done.
> > > >
> > > > To that end wrap the descriptor label in a struct that also contain=
s the
> > > > rcu_head struct required for deferring tasks using call_srcu() and =
stop
> > > > using kstrdup_const() as we're required to allocate memory anyway. =
Just
> > > > allocate enough for the label string and rcu_head in one go.
> > > >
> > > > Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > > Closes: https://lore.kernel.org/linux-gpio/CAMRc=3DMfig2oooDQYTqo23=
W3PXSdzhVO4p=3DG4+P8y1ppBOrkrJQ@mail.gmail.com/
> > > > Fixes: 1f2bcb8c8ccd ("gpio: protect the descriptor label with SRCU"=
)
> > > > Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Looks good to me!
> > >
> > > Acked-by: Paul E. McKenney <paulmck@kernel.org>
> > >
> > > One semi-related question...  Why the per-descriptor srcu_struct?
> > >
> > > If the srcu_struct was shared among all of these, you could just do o=
ne
> > > synchronize_srcu() and one cleanup_srcu_struct() instead of needing t=
o
> > > do one per gdev->desc[] entry.
> > >
> > > You might be able to go further and have one srcu_struct for all the
> > > gpio devices.
> > >
> > > Or did you guys run tests and find some performance problem with shar=
ing
> > > srcu_struct structures?   (I wouldn't expect one, but sometimes the
> > > hardware has a better imagination than I do.)
> > >
> >
> > I guess my goal was not to make synchronize_srcu() for descriptor X
> > wait for read-only operations on descriptor Y. But with that gone, I
> > suppose you're right, we can improve this patch further by switching
> > to a single SRCU descriptor.
> >
> > I'll send a v2.
>
> My guess is that a separate patch for each of the two changes would be
> best, but I must defer to you guys on that.
>
>                                                         Thanx, Paul

Ok, makes sense, I'll apply this and send a follow-up.

Bart

