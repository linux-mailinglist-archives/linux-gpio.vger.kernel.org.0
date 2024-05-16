Return-Path: <linux-gpio+bounces-6406-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9438C6F71
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2024 02:19:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C14F51C216C1
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2024 00:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD2FB391;
	Thu, 16 May 2024 00:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tc0WWOZq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50045389
	for <linux-gpio@vger.kernel.org>; Thu, 16 May 2024 00:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715818753; cv=none; b=Xh9btamq0HNZJctRxTd3dDpsm7x5kY2JUXZd/xeoG2H3IEb0LwGawj5dxmZRsNS88KMAcgsQDWpT0+iaTxou6q1QLyoOmbg8IPc5VC6fNrs9dEQjHD1V6cPZFv8tAqdoifjnUHQPywujy3Z5t/5pNi0knE526GdJniD4wwU4gFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715818753; c=relaxed/simple;
	bh=9Abxnb+VqZx2S7uzGx6q4aREDkA97dvn7k8vn2uSGkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kug9dNIUZnvd4yy9DsrN41ZsyslTMQnMRORUkOazyq0AYIg7F+L5SnUxRg+7cAvgZ4Py8ghk1CuJTrRl1w5qM6oWS6c2+pS4PqfuBiDFM3mUEkKdFyje+IhAqJFJH/vE6kwG1iTweh4Zz0x3H7JjKYh9QpLmbdN2dVFxZoRaMNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tc0WWOZq; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-241572c02efso82214fac.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 May 2024 17:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715818751; x=1716423551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJpFhHVzlJ3eO6FFa/Bq92NCOSKlmExMi0dCAXfo83w=;
        b=Tc0WWOZqR0UGQ700KpzAUDI/im3KokVHBPBSnES2mtE9+zITHFpqfFwXLcsCXhYqHg
         /2uhvnG8tQHJTO4+D8PFEdYKIjlt4o1Lf0OEqNBVBkpzC9sLtIlHz0E55YTKi+y5Cu9r
         5Qh10W/XW1/jsCZQdRA8rSPJRYVUyDVjkAgitH+udG05Lhfj/cfpwSnHCVcZid2hmghJ
         lDTrb7/NIn49r60Gg29Rdin45Bjge/SP2Dji1cjgbA4E6LP4hQFUes7FsVQz4A8CjiK2
         zlROCJUCTNNmBIotvgYuVoSbGOsafOCo089c1fO59UmsSCSsOCALu7D/tTFtU1zMi7XL
         bTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715818751; x=1716423551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJpFhHVzlJ3eO6FFa/Bq92NCOSKlmExMi0dCAXfo83w=;
        b=rgkaygX0eWR3VVnClz13k9LTk6hdtrPgwX3rAGHoYlBuu0DU8Azx18eqV3lmtG9kJJ
         nKA3zb+uPXdy2ode5XmgHpgKsQeWeiHrgZvZmD5JuR95rARdt/GqL8+F3d9F6N2oidI+
         CcXJTH2ZwZw0sBrhdjlLDmX9TCx7fLjIjKlcjBZ2WujTIZlv/Vl/CmwArcMDEGKJYj6T
         kygsvfKGyT/z+SpWZoCyjcGB9LHIZ2WhcYqWyXUPXeQ6wxvy7M8TnQzWa2Zyrgeis8jh
         t1Ib21uldWmUqZecs4QOBKLuLR9jd8LQKcTWyv3AoCXnSb2qGRu+6TSWXht/vFL0jYlT
         Q2lg==
X-Gm-Message-State: AOJu0YyVTGj7U8eephqXkAQSZgl3L52GMshKpL2ehQrSInlp2/Mik0D6
	FEcvFcKg+xLMEPaN6mebl3k104OILYTVP5DV7L+/bQmfAVPhsWfKSjuRxQ==
X-Google-Smtp-Source: AGHT+IEq383gjWEmjv0dGtvS/Xj3AGF21tjYMagSvbnpj/6uPe7WsRFvd4G5DqLUZQHjQ4LtfspVGA==
X-Received: by 2002:a05:6870:b6a7:b0:23e:6d9a:8f45 with SMTP id 586e51a60fabf-24172f79503mr20285677fac.48.1715818751224;
        Wed, 15 May 2024 17:19:11 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-63411346dc1sm10487007a12.83.2024.05.15.17.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 17:19:10 -0700 (PDT)
Date: Thu, 16 May 2024 08:19:06 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][RFC] helper functions for basic use cases
Message-ID: <20240516001906.GA5963@rigel>
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
> >
> > Yeah, I hate it...
> >
>
> I wasn't expecting any love for it - it is ugly.
> But it does the job.
>

An alternative is to extend the struct gpiod_line_request to contain a
pointer to the config.  The ext constructors would store their config
there rather than free it.  The core constructors would leave it NULL,
though you would always have the option to keep a copy there later if
core wants to make use of it.
And gpiod_line_request_free() would free it.

The ext mutators would only accept requests with the config set.

That can all be conditional on extensions being part of the build.

So taking advantage of the pimpl interface.  Yay.

Would that work for you?

And I think I mis-interpreted one of your earlier mails - you want the
extensions to go in their own shared library, not bundled in libgpiod.so?
Though if that is the case it would be helpful to relax the use of pimpl
within the lib so the extensions can access any fields not made public
through the core API, as well as more efficiently access those that are.

Cheers,
Kent.

