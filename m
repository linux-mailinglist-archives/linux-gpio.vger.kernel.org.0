Return-Path: <linux-gpio+bounces-6411-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0768C77F7
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2024 15:55:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E1BE1C21FEB
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2024 13:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE07B147C6E;
	Thu, 16 May 2024 13:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5nlVcEG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B21A146D51
	for <linux-gpio@vger.kernel.org>; Thu, 16 May 2024 13:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715867710; cv=none; b=Hb0a6R7Z6tNsJhAd4QFk3saRo7gVEWe6yO9gB5YcvGwJ2NPyztmgSUzEa3X+mG1Qr8jtCzpkBktNynnhxj+SLRuGEAnmhjdNKXbbzaUNgJp0z159lpi20OY4UMwPyUaPUb8OfOvEVlvANJzn8J+7F7PCUCsrdM4km+/P3dT6WOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715867710; c=relaxed/simple;
	bh=h2xHbD7jFqG3OipOsS3B/H7hDWvwRYAPcPHH+mpOByE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LL3jZXG9OfYLH8QB5lDNOx4KNov04GCsGO07zENTog27MIz6aVEMEzZMfiJRbSQfL648gURLFwJARwhpxC5KK6pm3QYEOHWvJJIDFrKjrOx/r35s29zOqq7lz8V2nqNeEfz97G6X7B5d8aRjx4PUYgg0v5KfmWXHx38vbrqeXvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5nlVcEG; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1e4c4fb6af3so48476345ad.0
        for <linux-gpio@vger.kernel.org>; Thu, 16 May 2024 06:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715867708; x=1716472508; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tRD6BNV6xcrjJCAsPONx974UnElTqwR5pUcvXzcGjEw=;
        b=a5nlVcEGAEgCXHFBhrEaVLTYg+5ShHWL59O5QiDf6j77dhnliJXk/mV5ZLU1s4SWcL
         3fHlrXziioDXEumlCe1LBYwGQp50/mWGlEvklbQd13t4s6If/75aF0iklvyDxSb0hZ1j
         rMQoIBqLqsJmjpofrZGIpvQ1/xukpFJen7JNCfU/MHR062ahJfkR5EnFAOOLvukGru/X
         8hZ0gTOArXgn3BhP9YoWdxrDLey1xcxcNDu0nsXI9R7qUpwUHKnLNKgT+dshCVmHm414
         Dw8zoM2juiXWrr5GH+KJfVMDNdoeUdA7Ixu/tnltn2RvINanXtqsiiURsI4gFC2q67zm
         iiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715867708; x=1716472508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRD6BNV6xcrjJCAsPONx974UnElTqwR5pUcvXzcGjEw=;
        b=aJ+n1llAhT6ZQ7bzeY3JBAKnV6gBVqZoMeORiynUfCCqO9IdUShYqrTaB6Q5fl0meF
         OzZgv56QXKD/p+88ftf3eDHb1WnPsZaKUCU+faHlHApIvZu7GQ4yA4RxaEFP2Mf7ELcm
         mZ1+WD0I7PJZZuzY7WbOulKKqs3K1abzjAvnDaA2dxw7aw4EaSkJ1+4WGaRydK3Ji+B/
         Bg6/exaz9B9B2uUtTsHvAzt5/vqF+AS6D91fJ3QMiq/svyxrGgD50ELfcfxqEWorE6Kl
         CTibfp7JY/30Y2skV5hRzy+rvXeCbVpVgNkWczn9VxNej8r4ncoBxE9/nqXcqR4oIGIg
         OKPQ==
X-Gm-Message-State: AOJu0YynSJ7uGyH1z76fcPEnt2xUgOfK/qxzJutJaY8S24qYrRybndRM
	nbbj8u0eF8tgAZ/dqs+Pkao4PJkZDzmWHhOy1VutoJVLSObTIVghENjTWA==
X-Google-Smtp-Source: AGHT+IHXOMxVVAqoIH9aikhw6OZyFroH47i3JtUjGzpqMq9SiJ8kN48RGDq/ltDUE9gv4qIAcYoedw==
X-Received: by 2002:a17:902:f545:b0:1eb:6cfe:7423 with SMTP id d9443c01a7336-1ef42f7584dmr284964875ad.19.1715867708409;
        Thu, 16 May 2024 06:55:08 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a67sm142336445ad.149.2024.05.16.06.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 06:55:08 -0700 (PDT)
Date: Thu, 16 May 2024 21:55:04 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][RFC] helper functions for basic use cases
Message-ID: <20240516135504.GA110959@rigel>
References: <CAMRc=Men25EQSuUtyf+b-TSfndnmQ8oCfNVU82pq1E-+r64QHg@mail.gmail.com>
 <20240511011144.GA3390@rigel>
 <CAMRc=McwX7f4KNqunRSj6jk=6-6oj9kUy9XJRc=HokyfaiUsmA@mail.gmail.com>
 <20240513101331.GB89686@rigel>
 <CAMRc=MftXh6SV_jNVDaUOwww21gH5gFeb8zGSVBLv=jMP_mFKQ@mail.gmail.com>
 <20240514133804.GA107324@rigel>
 <CAMRc=MdyUmfGaJ_0edvhMYwC7x5HwYyFAdD5EY-13+5yoRUeiw@mail.gmail.com>
 <20240515091848.GA86661@rigel>
 <CAMRc=MeBGJwyKBTYD1PQkk940t6ECsBxHCprjFUx1KFSKMe7fw@mail.gmail.com>
 <20240515141436.GA349711@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240515141436.GA349711@rigel>

On Wed, May 15, 2024 at 10:14:36PM +0800, Kent Gibson wrote:
> On Wed, May 15, 2024 at 06:54:15AM -0700, Bartosz Golaszewski wrote:
> > On Wed, 15 May 2024 11:18:48 +0200, Kent Gibson <warthog618@gmail.com> said:
> > >
> > > Sure thing.  This is what I have at the moment (the declarations are as
> > > per earlier, just renamed.  And I just noticed some variables I haven't
> > > renamed.  I'll add it to the todo list.):
> > >
> >
> > Can you post an example of how this is used?
> >
>
> Sure [1].
>

What was I thinking - you read the uAPI event and convert it to a libgpiod
type, so that wont work.  I obviously haven't tried running that
example.
Forget I suggested it - if the user wants to avoid the event buffer
complexity they have to read into a struct gpio_v2_line_event, so no
libgpiod involvement at all.

Cheers,
Kent.


