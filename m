Return-Path: <linux-gpio+bounces-6703-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E918D108E
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 01:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 785DC283199
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 23:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E806381BA;
	Mon, 27 May 2024 23:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EbwN1iHw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB52017E8F8
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 23:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716853158; cv=none; b=Yrbx4BHyM3NPwe8vKPfVAtvsRmn1hZgBYeGjXsDjNa/hb+6EPYOmg7zmJtXKMCDjV/XR7N+WiKdSlQBLkJbyoC1K+xYwa4l2Q09JLoKBING1U2QncbFd8+WtXsbgDXZihmwji68Mol3OM0RHdBaB9PHjhlfqTGPm5PQhYdQtL6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716853158; c=relaxed/simple;
	bh=hSWaXtzxI+ITLQLvY04FRcEoEsY91mjaGmzxY54cG2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rLZQJmlgpqBt8AQVIzRJx4fQAMrufBsJz2v8x62FPq0QMNGfli4w8m1ze0uVTMAah6IjdcmnK0VLqVqEvIcD4JjrFcu7O8+cDPqAMoJs6iZx89B/OHt3qQqxN/DdgP7ByLDN+Gf3V4dbkEkaEZc1arww2ovHNzcvNISgLED1bPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EbwN1iHw; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2bf9753a00fso159278a91.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 16:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716853156; x=1717457956; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jJ8c27X5XYUeImKUu+wkB/1ZSTzuLQ/7lfX7amsuVss=;
        b=EbwN1iHwweuX2Z+NRnfALCaMaSznJsWDCdEBsKeJ94ObOyUYhiOS4dLTJp7p/rBfxm
         t5+AFStPHDCN7U/9BhSYEFcKW1OUpjWLNiye3fQBygDrKnr3TXjfLwuGkEG7ys9OCTvg
         8352JSo/U20JzTaK3s9EJDWy7g52KLbVJINKQnh5w6vCuYHQzOXxIryr6rvKmk3HDkuy
         JD2us9vfBvPDVdJBMKbR0yBXJM40pS26N+nkiFghHCg2SQBlKcHz00BAJOj8qH93rUxt
         6M/D46yyjT+EjrkAFkhzM34w8b4GipUCEuSg9iIdNNoWnLR9h/c3VRGTTK7mNwv4iJLd
         ucJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716853156; x=1717457956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJ8c27X5XYUeImKUu+wkB/1ZSTzuLQ/7lfX7amsuVss=;
        b=cLLK5kJGaiBzYobLfLhgJoi/zecBIREKsEJftGnBtjIEQyGl6C6mUgtMvCguPAmYRc
         bOn0v5Pmq4nxSSLZTfLLDc3g7swdegCAzD6m6tOX7nXw7QRm3CLf6WRffVJAWSXGc+Kp
         tSEnFsBzrLpVKuMymzdNy780DKgoj8SiWze6Ngkj7o2QpoH2o8eAe+pKMy6QJ+v3DeMl
         x0N+J19CPYTqRFnin+eranjrpwbrGvtDtwxMBXVVp/p2R25ZoCrRNJBgw9KcD1kkTGOi
         qIkPbRZ5q4zbyjxSV8omtJKYN6bFSsqqqhaJ9fgGKjRZOhplo1Ku3uJZMvWRiQwaA3Eh
         yZ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZgJa4L/JheJFtHAupjid/BHruCUJpDntcKXFTg5/itN8gFT+XUgb7C+VDv3kmXZXVot3k737QpuLVjJszJhz55OwxNoyXauKQ1w==
X-Gm-Message-State: AOJu0YzrtazdNdMWB8FplHUuXIWgw9RMWZmdob4J00f5JxIC7Lw4eb9y
	+Lhcp1GslIj0YH4ejKp998+qMBGLEpfv9MSz9QMRWouEIJ1AkrFw
X-Google-Smtp-Source: AGHT+IEcHERd8FYigr4OW5vXgSHxpJoeOTSEuJCU4zvJNdTqy/dd9/6NwlO6cBIpgtXkdDvjJRe3Gg==
X-Received: by 2002:a17:90a:db93:b0:2bf:5977:931a with SMTP id 98e67ed59e1d1-2bf5ea3ad51mr9341760a91.10.1716853155933;
        Mon, 27 May 2024 16:39:15 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bfe9cde525sm2018772a91.1.2024.05.27.16.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 16:39:15 -0700 (PDT)
Date: Tue, 28 May 2024 07:39:10 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod v2 2/4] tools: tests: use "$@" instead of $*
Message-ID: <20240527233910.GA3504@rigel>
References: <20240527-fix-bash-tests-v2-0-05d90cea24cd@linaro.org>
 <20240527-fix-bash-tests-v2-2-05d90cea24cd@linaro.org>
 <20240527124420.GA108041@rigel>
 <ZlSyIWorOYQZX25a@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZlSyIWorOYQZX25a@smile.fi.intel.com>

On Mon, May 27, 2024 at 07:17:37PM +0300, Andy Shevchenko wrote:
> On Mon, May 27, 2024 at 08:44:20PM +0800, Kent Gibson wrote:
> > On Mon, May 27, 2024 at 02:02:34PM +0200, Bartosz Golaszewski wrote:
>
> ...
>
> > >  assert_fail() {
> > > -	$* || return 0
> > > -	fail " '$*': command did not fail as expected"
> > > +	"$@" || return 0
> > > +	fail " '$@': command did not fail as expected"
> > >  }
> >
> > Ironically, shellcheck doesn't like the '$@' in the fail string[1], so you
> > should use $* there.
>
> But why does it do like this?
>

Read the link[1].

Because $@ is an array being used to build a string, and that may not
work the way you expect.  In this case $* is clearer as that has already
been concatenated.

Cheers,
Kent.

[1] https://www.shellcheck.net/wiki/SC2145



