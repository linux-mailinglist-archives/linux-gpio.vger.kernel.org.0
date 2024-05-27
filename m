Return-Path: <linux-gpio+bounces-6704-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7148D10AA
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 01:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47DC0B21BA2
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 23:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890CD61FC3;
	Mon, 27 May 2024 23:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BaATcfsi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8FF17E912
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 23:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716854073; cv=none; b=uU3mBRyTWXv6XjcNJdXKDmr9ic/QzCuwrKm+gJQ698IQbpE8EX+7j+gNjx6BhpSjUsU5QBg4Cz8T+opwbqUx9mS/xz7HBCHT5MVY7kAwcaVFl88/l1JhO8h0mXVkiwiurwkEgZA4NP8p4ZlMOuoN5BiTdEnjQaVkwciVjEDDboo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716854073; c=relaxed/simple;
	bh=f9bPEqAvqpdr6Jmp0zzBmuf2w0PaIiChVw7UbAt1lUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4kwA7En1il1hSgcFelMlzZE/8rPPVemuK4YTY3/gMjrtR0ctrHz/G8JeK6u984ivibXeuJ60Q7Mso+RfZZMmLhyAxaNfINoCvASHfmrjXbc9v20dl+YB3eurm9GEXWMztRwdqlowNN/s5jdkrg25vKAyFhUciGm5H9Z/HKzBgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BaATcfsi; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2bdf3f4d5ffso162264a91.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 16:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716854071; x=1717458871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lQu8d79VHiEJaCBlF7gezO4BajGCamoA7yv50DWYT00=;
        b=BaATcfsiyIURZ9LAHgkSKRrzOivJkoCgEcQMt/ma7NBMqwoDjhqs0FJ+WFARfEqPuY
         U+h9gy3qu7Op2skpLPb2QfKZaBSwaYPpc1itDwWuwPkSPEM4/JCTP+oh7n6naJNViABe
         dB9DNA701b3UpTwEWgLtkI6d/e4LenkVMUbAbsMMIcVqs9NcBN3QwECwWQqRoJdqlowJ
         IU/VpkaSOvf4UDoqmV+9GwU2VpAs+GCjvYNir4YeN5Hkb4vWLGXzoO1BwU/jnZmwgNoA
         QxbzeGh1vX0aE2pvV8gMwOBGsIgSZwfIukHi5OX2BBqm3gT0C3rHXeH4M2iyg0LSAPaz
         /x2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716854071; x=1717458871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQu8d79VHiEJaCBlF7gezO4BajGCamoA7yv50DWYT00=;
        b=jEb8W3EmeC2clTlxGNlFN7MDDruLG8bw++gxAlOuJ2mUHduKeYVwbYwCW4YujYGBuq
         2p5CXs73J+RG391dhgHt9iKJSNM6tiVKmgZRZRA+EatajenEvEgptw1gbR+v+Xim8M+h
         e6dSR6cebRpdGMOeL3e8EGRIqbuZ9Fn7qoaH8ENUn8vXUbMWK2bHP4cbHPx8zTcaYzb6
         rDahIfa+r7iw+IvfrchWLqV9ILP5MmTsC1giX76XyqFcqPx2h/0j1It/vwXGi3amASHR
         UH9VvEYg6oGlSszAG5X8K4WwkuESdIpDFdqRAmqPrxWVYYPUtwyR7VZtTdst1VEFs0+X
         uOaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyOUgCsFerqVh6CLc+IKWDroEYdRm/ofcgZ1i8qHV/YX04+K+L4w58cvZZx5uzhtR8J0ocsVN+0VMZGuVhPytUIdWCiEyT641I7g==
X-Gm-Message-State: AOJu0Yy9PyctU/lDsOBIPDV1XVC4vuArvDlHViWDwYqbrmssN2ImqpQU
	XPLakVQg9/epU7c1OxwcFpGT1+FGi7bAla5WMwU0x0djfH8NQAgDBAd3Pg==
X-Google-Smtp-Source: AGHT+IHe85VReDC2nptqNnJg3Xb4+5NFz7zMs2NdG3hBYDmeOlAKUqrgOwAwnsf2DAodURq73qR5Sw==
X-Received: by 2002:a17:90a:cb0b:b0:2b1:817d:982b with SMTP id 98e67ed59e1d1-2bf5ee1467dmr9292110a91.14.1716854071312;
        Mon, 27 May 2024 16:54:31 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bdd9f4e007sm8284730a91.45.2024.05.27.16.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 16:54:31 -0700 (PDT)
Date: Tue, 28 May 2024 07:54:26 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod v2 2/4] tools: tests: use "$@" instead of $*
Message-ID: <20240527235426.GB3504@rigel>
References: <20240527-fix-bash-tests-v2-0-05d90cea24cd@linaro.org>
 <20240527-fix-bash-tests-v2-2-05d90cea24cd@linaro.org>
 <20240527124420.GA108041@rigel>
 <ZlSyscNCrZv0LRHL@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZlSyscNCrZv0LRHL@smile.fi.intel.com>

On Mon, May 27, 2024 at 07:20:01PM +0300, Andy Shevchenko wrote:
> On Mon, May 27, 2024 at 08:44:20PM +0800, Kent Gibson wrote:
> > On Mon, May 27, 2024 at 02:02:34PM +0200, Bartosz Golaszewski wrote:
>
> ...
>
> > It also doesn't like looping on find results in patch 4[2], though that
> > is not related to your change, so leave it and I'll fix it later?
>
> Does it really mean _to fix_ rather than _to "fix"_? I mean how do we know that
> shellcheck is 100% correct tool and has no bugs?
>

How do we know anything?

In this case you can read the description of the faults, which I had linked,
and see if that makes sense to you.  And we test the fixed code to ensure
it still works as intended.

I'm not claiming shellcheck is fool-proof, or 100% correct, or 100% complete,
but it is more available and repeatable than Andy's Eyeballs.
And if we do find bugs in it we can always fix those too.
As I stated earlier, if you have a better metric to use then I'm more than
happy to compare, but so far shellcheck seems a reasonable option to me.

Cheers,
Kent.

