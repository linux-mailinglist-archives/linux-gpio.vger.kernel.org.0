Return-Path: <linux-gpio+bounces-6558-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 431DC8CBFC8
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 13:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74FEA1C21CD8
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 11:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B0A824BF;
	Wed, 22 May 2024 10:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PdY5IoCY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663F98062B
	for <linux-gpio@vger.kernel.org>; Wed, 22 May 2024 10:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716375594; cv=none; b=sFVesTlvWeeb59Y4kVk8/IFcu6+ZJjOH2X404XH01V/mEm3Bzx6azATzRzbLqCjrwZxRIwCbH44oOhvcjACPeKPY7HcybEOwqxKjukGVKoPUBEV7Vs1E5G7nfVTpOxuNYvh/pG0d9P1xReLiRUmhP3xxl9SSvd0jatAhf55bE/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716375594; c=relaxed/simple;
	bh=IPhQUWhLvaMh+UJE8aZ8RgjY1xis0QA6NKil/djKaQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L+O/eqaTAknMk+3tQBbFzRY0BE2W6WKHf378kTIG69X6gMOaEj3fgJ1xwOykBa1MTSJrSZiabSKLfwDvhJhfOT0eU0zeQFvlwlnfU8V6lgEiqCcDeWdBaM6N902cjz+DnATq3+sVq1PKWJOUpmL0qBmoA/+yGsjtCUwsC5Xo8U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PdY5IoCY; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5238fe0cfc9so798429e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 May 2024 03:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716375590; x=1716980390; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysxzhAAkjCPK5L/c8Pn6sm+5f6CCYebW1vFWzyTda3w=;
        b=PdY5IoCYPnFbd2BNAKOImzaig4rnBm1WSYaflOc/aq9gCg5Y3XRDflFmolbP9uu0c1
         9m9lnhhCwRbtbu1ANorPt66MVnMmznpjoANVHjYT4r7MSCtysm/wXmZF3DPtv5zlsBmj
         QR9GcH1LuVOtYejjRCDNlQxhOCqcBSMPrurVjuOJeru8frIehIU4PVbBvp5i1q39mhTk
         jW5NQwM7jAcUT3WqCVnGFlm12MKKhe77mLAe5Y/WQ2H5gFgcus1Zlm/3cHCh0TMJQ9kJ
         hU7dusHvl2bjsMmTGDrqTIYzqXEX3Uyv7sv3l4Z9XETDKr1PtJPBQ1OpZNz0j/XBReWD
         EL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716375590; x=1716980390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ysxzhAAkjCPK5L/c8Pn6sm+5f6CCYebW1vFWzyTda3w=;
        b=ePwwfD85c4M7Pk/sUPKsvpXsTvsk35KKGyu2PD2WcY7m0x/iiptUmH/c4PednQF/K/
         m861eo8mNMXhuHHcb5wVxlFQ+T3suWE2yay3kXQGhWuNMZlm8kYUHgeGNnZhevfUVKGf
         pXDr6P+DDo+iJLAgHiHTbqT+4hSR9fggQaxdhkRyoLYLztNzEQ+SZTpZTBEIPEHFmbou
         cWkvNvVaj9yNf7Pug1YYG5PoOuAIiZp7phfWZlo0Be26ZC+GgpqbzuNichd3s978vXIC
         310f6M/8gd731LRkp5zc+ycvjpGrrsi1I3389qVUAfl9GExDaxi2TwYP/2Nud7nXgJ3x
         fMNg==
X-Gm-Message-State: AOJu0YwamnFaxRitIdkXq6QzXS9Sz/uS3OFS3xbu1PmkB1o7vV8OrQz+
	U2EkGWiInWYew2ngclGvhdOhEqFGJGgXBQW4t/X5ntQFqHdMl4WVgHzTnwSxbyknBTlQeMGVQK8
	PFMCEET/aC+D7SOOI8ojoLZF5V98VfLQx2mNU9/ape5RxjKgV
X-Google-Smtp-Source: AGHT+IHW90iyp5kkHTEv7vZDuU8XeJcXJgVwQVl4Tp40VZSR5hfESidPOiTwOlKngxFtHYj0rRNdb2N8UIvbsZN4CPg=
X-Received: by 2002:ac2:5332:0:b0:523:89b0:9b5d with SMTP id
 2adb3069b0e04-5269b2e625emr494717e87.9.1716375590432; Wed, 22 May 2024
 03:59:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240511011144.GA3390@rigel> <CAMRc=McwX7f4KNqunRSj6jk=6-6oj9kUy9XJRc=HokyfaiUsmA@mail.gmail.com>
 <20240513101331.GB89686@rigel> <CAMRc=MftXh6SV_jNVDaUOwww21gH5gFeb8zGSVBLv=jMP_mFKQ@mail.gmail.com>
 <20240514133804.GA107324@rigel> <CAMRc=MdyUmfGaJ_0edvhMYwC7x5HwYyFAdD5EY-13+5yoRUeiw@mail.gmail.com>
 <20240515091848.GA86661@rigel> <CAMRc=MeBGJwyKBTYD1PQkk940t6ECsBxHCprjFUx1KFSKMe7fw@mail.gmail.com>
 <20240515141436.GA349711@rigel> <CAMRc=Me9ffciaXnOKE+ABLDBVbSRzTAEHRVzpLk641eocF4q8g@mail.gmail.com>
 <20240517123732.GA423787@rigel>
In-Reply-To: <20240517123732.GA423787@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 May 2024 12:59:39 +0200
Message-ID: <CAMRc=McuzzzRF8ttRKZWouayF250p8V2OXwmyjSrKOYe95Mn+g@mail.gmail.com>
Subject: Re: [libgpiod][RFC] helper functions for basic use cases
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 2:37=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Fri, May 17, 2024 at 12:53:36PM +0200, Bartosz Golaszewski wrote:
> > On Wed, May 15, 2024 at 4:14=E2=80=AFPM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > On Wed, May 15, 2024 at 06:54:15AM -0700, Bartosz Golaszewski wrote:
> > > >
> > > > I think the code should go into ext/, the gpiod-ext.h header can go=
 right next
> > > > to gpiod.h in include/ and the examples can be in the same examples=
/ directory,
> > > > just call them something_something_ext.c to indicate they use the s=
impler API.
> > > >
> > > > Does that sound right?
> > > >
> > >
> > > At the moment I've made the code a conditionally compiled block in
> > > line-request.c, so it can directly use the line-request internals.
> > > Pretty sure that can be changed to use the core API, but isn't pimpl =
within
> > > the library itself a tad extreme?
> >
> > I have a strong preference for that code to live in a separate .so
> > file (and by extension - a separate compilation unit).
> >
>
> Oh, I agree - that makes total sense.  The direction I was headed felt wr=
ong,
> so I figured I must've misunderstood what you meant.
>
> I'll re-organise it into a separate unit.
>
> Does that unit have to act through the core API, or can we give it
> access to the internals?

If we can avoid it accessing the internals, that would be awesome.
Unless you hit a road-block, please try to keep the core separate.

> And where do you stand wrt the idea of adding a config pointer to struct
> gpiod_line_request itself?
>

We'd need to make a deep copy, otherwise it could be destroyed and the
pointer would be left dangling, right?

Bart

> Cheers,
> Kent.
>
>

