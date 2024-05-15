Return-Path: <linux-gpio+bounces-6400-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D95A48C677A
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 15:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 930F7282181
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 13:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D861272BF;
	Wed, 15 May 2024 13:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dx+E2740"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661BC5A110
	for <linux-gpio@vger.kernel.org>; Wed, 15 May 2024 13:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715780261; cv=none; b=fXOC6RgIo6mugyXvg3hI+b902yd0eQLYUzsZJhFkaeSF9OnEHQz6Nkt1zMS8fbji1nhuUpiEBCA+8UxSH4QD9FpwhbYTXFkdnUWzGaNxZosyjqgDfm2fk5u59FBXQKRt0z1nwUV2oIJ0/2YsEzPa5VD1Bn7O8TtwRyFuHefQV3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715780261; c=relaxed/simple;
	bh=nACug04dtnIx/aXMrm37lQ6CVlwLc1XVeimZyiQTN/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cjsy4LSXk5GFWplsg6PCOIkzCuwQIPoLGioE+ulxPhjUC2TgPuqyiWAkgxiCqSrCJDozzMoeY5YDe5z1cJ/fFSJtkDZ84VSi7k8j7sJ65bhSkqjiDlFogignKBtQ6ExAyWYm2RUcBvnkybSB/jV6Dm8Ou3F2fViEHGLxGySrs2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dx+E2740; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2b9cdbd6da9so584897a91.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 May 2024 06:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715780260; x=1716385060; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u11egfaMfYOpa0dw6ruuhXKvHwE47RSDMtzs80pcMtw=;
        b=dx+E27404H/ON9zUeeNFmVIVXoEpR6JzNrJPKFLq6OeBvgZI81nWmrQnI0AhCMIMcc
         YEorlygnFlGQJAbz91zzK+S5OaVlT00XAYedp7f0l6M2Q1BWzfmGc4qC0SmpPrZvoImR
         w2E0VE4uYJ3nq3b1dN6MnJLyhUl5yrIdphWTflLtQWiETLo+qAYTxhbbRwXQUw8JOzR3
         T/7htx+BvbH+TFEIHGbJMUmvVOD3ndpLBf1masvsvmkuutYAevOQ8MoOlHRIydb4mF66
         v36Wg42GyTC9qiZj+fLsthJvnXccN4/O+UDpJU7tIMVG5x+M47uDZx3mz11Lu/6QnWxb
         jnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715780260; x=1716385060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u11egfaMfYOpa0dw6ruuhXKvHwE47RSDMtzs80pcMtw=;
        b=fW3aslx99VhQANgb/fK/CfeixBVpMlRFMa6+g+zlfFa7bh8vobo1ocCm4Fuk3X1zCH
         IPg7XsAVgE1RcRSJ1wP71ciFErvCIjn0d9MZAm4QhNQUPiqHjpiZJJXiPLaxAJNxWutH
         wPdmSCSWaJuX7aBDfaFnSyA6Uy/aAj/XzA03NEXb5h+jVc41UlG4v+DKXgBNhSsK5fHK
         J+cs2vQUkVV9acPprtNbIQuSRzVSSv3TS8EHTzX6A6yHIm6jVC+8V10I5MnOwd8pbfas
         Th3wWvk0hWddQ7b7/e+SKkbuig1Vwh2fu7J/nU46DkPBpgrHr92K/aCouxRUm3cEHavG
         MCwQ==
X-Gm-Message-State: AOJu0YwqNCpcNSc8yc3cEkFjqN6hoO6Rtb52EMthRNP6OgiKrHRR6dF9
	GJLev1IW6g8zHmmWjQjNXBLMphtBAFrfXlYP/s5BQXq19ko3y10AaKzxew==
X-Google-Smtp-Source: AGHT+IHZbPFusKujdcQoNhd4Q1Mba0Ma8wS6Va0/8jyzlw066XMCvWxqDiiLoFzqj34AI1Dmgjx3ww==
X-Received: by 2002:a17:90b:438d:b0:2a2:f4f4:2c4a with SMTP id 98e67ed59e1d1-2b66001a442mr26511521a91.21.1715780259597;
        Wed, 15 May 2024 06:37:39 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b67178301esm11609457a91.49.2024.05.15.06.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 06:37:39 -0700 (PDT)
Date: Wed, 15 May 2024 21:37:35 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][RFC] helper functions for basic use cases
Message-ID: <20240515133735.GA337185@rigel>
References: <20240507022106.GC26136@rigel>
 <CAMRc=Men25EQSuUtyf+b-TSfndnmQ8oCfNVU82pq1E-+r64QHg@mail.gmail.com>
 <20240511011144.GA3390@rigel>
 <CAMRc=McwX7f4KNqunRSj6jk=6-6oj9kUy9XJRc=HokyfaiUsmA@mail.gmail.com>
 <20240513101331.GB89686@rigel>
 <CAMRc=MftXh6SV_jNVDaUOwww21gH5gFeb8zGSVBLv=jMP_mFKQ@mail.gmail.com>
 <20240514133804.GA107324@rigel>
 <CAMRc=MdyUmfGaJ_0edvhMYwC7x5HwYyFAdD5EY-13+5yoRUeiw@mail.gmail.com>
 <20240515091848.GA86661@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240515091848.GA86661@rigel>

On Wed, May 15, 2024 at 05:18:48PM +0800, Kent Gibson wrote:
> On Wed, May 15, 2024 at 01:26:32AM -0700, Bartosz Golaszewski wrote:
> > On Tue, 14 May 2024 15:38:04 +0200, Kent Gibson <warthog618@gmail.com> said:
> > > On Tue, May 14, 2024 at 06:31:39AM -0700, Bartosz Golaszewski wrote:
> > >> On Mon, 13 May 2024 12:13:31 +0200, Kent Gibson <warthog618@gmail.com> said:
> > >> >
> >
> > I don't think it'll be enough to re-use struct gpiod_line_request here, you
> > need some new structure. Unless you know how to do it. In that case: show me
> > the code. :)
> >
>
> Sure thing.  This is what I have at the moment (the declarations are as
> per earlier, just renamed.  And I just noticed some variables I haven't
> renamed.  I'll add it to the todo list.):
>

You can now find my WIP branch here[1].  That includes examples for
comparison.

Cheers,
Kent.

[1] https://github.com/warthog618/libgpiod/tree/ext

