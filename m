Return-Path: <linux-gpio+bounces-6427-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B324F8C8522
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2024 12:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DA74284BD0
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2024 10:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A7323AC25;
	Fri, 17 May 2024 10:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Eg5moTrb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9FD3D576
	for <linux-gpio@vger.kernel.org>; Fri, 17 May 2024 10:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715943231; cv=none; b=pp8XMHldo2tHxwNYXUT95RPNhLt2FF1PaeGOxb0AUlPn5cr3exd8Y8GF+RVq0kYTQWT2VpBnWK8NP/1vRn19951ewsLvfZ+STMz8ChqfeGD7abgdu2cKka0TcujiHmZjznyqHrMrPmGp+64cW78lTVAtat/0kStok2T+HARLQEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715943231; c=relaxed/simple;
	bh=781+FiDqwCGALJ3tKo/Rnkg4ZBqX9e+C31f/LjJNIZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sQxFvboTVttTC0pqpwd3uLDYAqyjBpdBr5KzeBNz9DzWm8Vme+VKi9a9jjNQL6OZiKvsRSTNCC3VH5oaiv+ZP/LiKHnQ/17TDkaQYxOQdjSMuEIWRbXrdziwqAhNk03hbRqQLPC7wCPb3NaOjxRw7Soi5ggRGMgYWvqLv/viJhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Eg5moTrb; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5238b5c080cso2279602e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 17 May 2024 03:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715943228; x=1716548028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=781+FiDqwCGALJ3tKo/Rnkg4ZBqX9e+C31f/LjJNIZk=;
        b=Eg5moTrbGgKLQIRN5NvasYYWy4DG2oAD87sGuvooxAKTg2eFkaBq/zBMrRvFOx5gA3
         tbz1vj9tYxUsGy7b7rLvpezgRlZCanjC8MSc7vK65sKJDAlsBD+HnxfVdKjKJDdnZJPO
         PW4riBSDQthUd5MZvEDzBvL/erZco9ptDOkAW5wnuyLBN0rKidLfg1CQs7qdq5cIyAUN
         XBPeTq+m0zoB0jEDfThAVueyYrqWG2TjkAtP2F04qusRENf9qLS2+F7j0EkeIFvah27i
         oE/41ISWBlVIesTbbqaPEDgV/Mis9OOkwbLsCEY+LeCD5gC6S3pKBW/CwWE10BrkGWnu
         fh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715943228; x=1716548028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=781+FiDqwCGALJ3tKo/Rnkg4ZBqX9e+C31f/LjJNIZk=;
        b=BKw4Zro3WVnxcYFMk8oN4Ww+Lk1NO2VHAzrq0/CLd+BLPxPpqfXPDnQfKgor1qP+E+
         uzGQ7sSv1lKVI4UxGD0M6LRyuBWWq7OXllrBRU24CIMpahasqfNEX+MwDrmGNEoKh6Ve
         Bxc94KSyyREr8Z/vZuSc4zVt9S+vLCgbhEQhovlW8ANsY/QiCasgyhbkPV7+PAhYT2/K
         q+4T6Dm3X59dWQqqigsQwj6K6/p9MirIc8XMWopDUXEll0Gm3mmCoRlSC67WzrksXX+p
         Zow66eGMoQDDkEyZmc4RMsSlVlx7ry2YeKxc/+sP953xnQej7tH2tceWrd12IUc/vs8J
         ZNtQ==
X-Gm-Message-State: AOJu0YwNIe+owX/BKev6Z+jZZDB7FXxDqoSSVUHV+1yZH+FNnUgOzUGS
	V3zahgVIdUNDCb+AeQH4hYKild8BN7ynLZGHHfp0gpf9HowWmdc8Dq8RONnuyluxlQiMk7ya91Y
	GYCGnK/jrVRjsTnYz3Zpitj81CPHPbqTBZusj7yY1yZf08qKOvYo=
X-Google-Smtp-Source: AGHT+IEHHwze4UWEGHCdOjgOVhD/gYFjRURhSkNFguYtvTvLb/SmtREu359GDQ91EWaDDbZsqCnxdbIQpNVFHpp+n90=
X-Received: by 2002:a05:6512:32ae:b0:523:8a14:9149 with SMTP id
 2adb3069b0e04-5238a1491b0mr5606305e87.21.1715943227594; Fri, 17 May 2024
 03:53:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507022106.GC26136@rigel> <CAMRc=Men25EQSuUtyf+b-TSfndnmQ8oCfNVU82pq1E-+r64QHg@mail.gmail.com>
 <20240511011144.GA3390@rigel> <CAMRc=McwX7f4KNqunRSj6jk=6-6oj9kUy9XJRc=HokyfaiUsmA@mail.gmail.com>
 <20240513101331.GB89686@rigel> <CAMRc=MftXh6SV_jNVDaUOwww21gH5gFeb8zGSVBLv=jMP_mFKQ@mail.gmail.com>
 <20240514133804.GA107324@rigel> <CAMRc=MdyUmfGaJ_0edvhMYwC7x5HwYyFAdD5EY-13+5yoRUeiw@mail.gmail.com>
 <20240515091848.GA86661@rigel> <CAMRc=MeBGJwyKBTYD1PQkk940t6ECsBxHCprjFUx1KFSKMe7fw@mail.gmail.com>
 <20240515141436.GA349711@rigel>
In-Reply-To: <20240515141436.GA349711@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 17 May 2024 12:53:36 +0200
Message-ID: <CAMRc=Me9ffciaXnOKE+ABLDBVbSRzTAEHRVzpLk641eocF4q8g@mail.gmail.com>
Subject: Re: [libgpiod][RFC] helper functions for basic use cases
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 4:14=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Wed, May 15, 2024 at 06:54:15AM -0700, Bartosz Golaszewski wrote:
> >
> > I think the code should go into ext/, the gpiod-ext.h header can go rig=
ht next
> > to gpiod.h in include/ and the examples can be in the same examples/ di=
rectory,
> > just call them something_something_ext.c to indicate they use the simpl=
er API.
> >
> > Does that sound right?
> >
>
> At the moment I've made the code a conditionally compiled block in
> line-request.c, so it can directly use the line-request internals.
> Pretty sure that can be changed to use the core API, but isn't pimpl with=
in
> the library itself a tad extreme?

I have a strong preference for that code to live in a separate .so
file (and by extension - a separate compilation unit).

Bart

