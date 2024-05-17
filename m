Return-Path: <linux-gpio+bounces-6428-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD258C865E
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2024 14:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A04D7B21155
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2024 12:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A54B3D546;
	Fri, 17 May 2024 12:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EdVe7bEE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78BE7F9
	for <linux-gpio@vger.kernel.org>; Fri, 17 May 2024 12:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715949458; cv=none; b=b9xeR2fZtTdpcWxJInNVgttAUfyiiL41GRy62L2nDfGBUO6FALAagyVZm8nTrvlzwWeZBbZiBF03RY5HJwHWRiCESiFoqOGtCQWUBsXTT4c5kZfNOgZwBKxFUR6tfYAwMW7TWDU9j7iXlZBgB4Xqmvxux384xK+9jjRc+1Azc1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715949458; c=relaxed/simple;
	bh=ltDjdsoDx98uTfjcL6bDfPo8uHFY9CS6UUJ+vCoY9oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tdBPhGlh6y7ETj4q7kpZDD1qHX0Lc3WOGMBTSlyrdBKKJNfRyai8Ug2vM1smC1D4zlPGrrfgMXQrik5Ps19zwNm48Ts+EXIKdpwjtXD7p2cbEUfBqYlt5EEk3DiA7kgX7Q4bIYc6CDMDSZvP/1bvXa5hSdSu5ETSWnVtcpTeL2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EdVe7bEE; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1e83a2a4f2cso5122325ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 17 May 2024 05:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715949457; x=1716554257; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NuOZ09fuJTTC1qM02ZVih2dkRqXAwOdFM4LjojYVD5k=;
        b=EdVe7bEEScGgoKefwpgxVK3l8uqMFmKCu6Ya9Z6+AIHbHpjCLbMjQDy1UEE92NgIKR
         JaGSnxkpzZRmbHPzkAzL0mDFLxdZ1ipNBrwliDxmqimQDPmxN7lyeCW0KR+zP006L2yn
         M3+OHIetspQNuuZ8b0h/x77i4OWkG5VQrMxjg+VfJzvaX84RqmELql7S6oY106E/TwC5
         s++Oo9ohl7bd0IBHpgreX8i+R9mnVA8JcfeD4aJ9zkxvqg7OtuMxC5cuWhRAeHV0wH7l
         Uv7HE0xhlZ8LnHaQLnm+SyA0MLD9O3Az0mXf4J0X4cx0MQZIFDsmLyKEKhefWE4mNCiw
         yuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715949457; x=1716554257;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NuOZ09fuJTTC1qM02ZVih2dkRqXAwOdFM4LjojYVD5k=;
        b=ibRxGOK72U2hYwGDEvLWFz1WX5p71278Iktt4XarAlu2HHUxmVqSWgl9/tffzRMijz
         2q6yNYFf3pd/yRiKUiJ7eqK7zX91o2qb/pXySm+KhMOswPNIHZa5WnEZTqacSYSzZ2FP
         EC5z8jrBRashfsNzWVTuN1e7fkEt5IDLMwlyPNuh5hgKRRNmq5Qpif3Dn9ef7qmJgFVu
         rswkiHrIDn77+xboecYuB3txsC8Om2Q864YZ1OWzK7V4NdQwwgIWvqU48CGD467IitdB
         cAJ1Wnyx2XSGE+WvZeUF09tqJolKQ9T+BEZOjkgp55QxnNZnqImcw3NKidRRRgxm5AXW
         ZZnQ==
X-Gm-Message-State: AOJu0YyaTKmSNce1SoAKuX7ciVTxXvYdCXhAPDBK8aV0sdTdyolyQI+y
	e5uG7EwgY8B05gOht6YhWGdyAIHO0TOAr/vcC7RKa6i00QtOjmqHR181aQ==
X-Google-Smtp-Source: AGHT+IHGnEHRBHYvv36U2wA2Gk6IMHEjDaABZn7MSkRsusu54cVXOq9STwlDUrymcc8RSt9x36//QA==
X-Received: by 2002:a17:902:d485:b0:1e4:200e:9c2b with SMTP id d9443c01a7336-1ef43d15794mr283383875ad.21.1715949456913;
        Fri, 17 May 2024 05:37:36 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c03619csm155636525ad.209.2024.05.17.05.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 05:37:36 -0700 (PDT)
Date: Fri, 17 May 2024 20:37:32 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][RFC] helper functions for basic use cases
Message-ID: <20240517123732.GA423787@rigel>
References: <20240511011144.GA3390@rigel>
 <CAMRc=McwX7f4KNqunRSj6jk=6-6oj9kUy9XJRc=HokyfaiUsmA@mail.gmail.com>
 <20240513101331.GB89686@rigel>
 <CAMRc=MftXh6SV_jNVDaUOwww21gH5gFeb8zGSVBLv=jMP_mFKQ@mail.gmail.com>
 <20240514133804.GA107324@rigel>
 <CAMRc=MdyUmfGaJ_0edvhMYwC7x5HwYyFAdD5EY-13+5yoRUeiw@mail.gmail.com>
 <20240515091848.GA86661@rigel>
 <CAMRc=MeBGJwyKBTYD1PQkk940t6ECsBxHCprjFUx1KFSKMe7fw@mail.gmail.com>
 <20240515141436.GA349711@rigel>
 <CAMRc=Me9ffciaXnOKE+ABLDBVbSRzTAEHRVzpLk641eocF4q8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me9ffciaXnOKE+ABLDBVbSRzTAEHRVzpLk641eocF4q8g@mail.gmail.com>

On Fri, May 17, 2024 at 12:53:36PM +0200, Bartosz Golaszewski wrote:
> On Wed, May 15, 2024 at 4:14 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Wed, May 15, 2024 at 06:54:15AM -0700, Bartosz Golaszewski wrote:
> > >
> > > I think the code should go into ext/, the gpiod-ext.h header can go right next
> > > to gpiod.h in include/ and the examples can be in the same examples/ directory,
> > > just call them something_something_ext.c to indicate they use the simpler API.
> > >
> > > Does that sound right?
> > >
> >
> > At the moment I've made the code a conditionally compiled block in
> > line-request.c, so it can directly use the line-request internals.
> > Pretty sure that can be changed to use the core API, but isn't pimpl within
> > the library itself a tad extreme?
>
> I have a strong preference for that code to live in a separate .so
> file (and by extension - a separate compilation unit).
>

Oh, I agree - that makes total sense.  The direction I was headed felt wrong,
so I figured I must've misunderstood what you meant.

I'll re-organise it into a separate unit.

Does that unit have to act through the core API, or can we give it
access to the internals?
And where do you stand wrt the idea of adding a config pointer to struct
gpiod_line_request itself?

Cheers,
Kent.



