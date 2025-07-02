Return-Path: <linux-gpio+bounces-22612-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0662AF15EE
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 14:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BFF31714D2
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 12:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9321274672;
	Wed,  2 Jul 2025 12:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GN4dmzZz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C122727E7;
	Wed,  2 Jul 2025 12:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751460166; cv=none; b=fSw3fAOnfh7N4oPxJ4OeoTLEinx6xPMbGJ8WSDVwZYWKcTyhRS3QkKuFeUV1zuoDqhm3nf1LbhXuoH+s7FxmuSmEtbYW+vVrnrT7QX7jyv54VnKts54RuvywAV0w8OsrHDlJwLrD+zFIUDnQaU+rauCdO4GS3ujw8AeZXfBcn+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751460166; c=relaxed/simple;
	bh=5eUumHTfRwYyFBHj2qxGqPbVjctpK1aEYXf4ivcPU5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVNCglQCec54RI0y0Nyjs4PDSSp17ty0Zj22cjGchWljmeZZKn1TSENHbBnAPQI5LX7HN/cqcwaeCtP3QoxkTsZsggInCOGEwza2xTNxZUPlBOMeReVot9Y7FNx+1bHW6q4cti9AcQ2jjHyRMYHW+7FdKowUt+OD0bpUp+xpBQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GN4dmzZz; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-af51596da56so4267612a12.0;
        Wed, 02 Jul 2025 05:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751460163; x=1752064963; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yvTIRW/PlaL/Coal9MnMXfGSJFOe2gEx2uCOoGU2HTc=;
        b=GN4dmzZzzdGrhBlcBLiZJ/JJhz0Sx2QPJmnv8C9ZRysP+k6HX2gZG2z8OF8Zvw1/Cv
         76yk3r1nY2rEpoMXc0wDlBZBObjEYMs+P8z0FuEcPxy+lzc3S/4cSYbNYse71dENI79p
         GbdOojw0T2Qo4SSA9/zIQLN4Ub0+IjkeeWfk4YY3nA+CdgoI1gsHFzfo0ehqN5hptYc1
         WWoz2jPN2xqvEDcEAXJURKzJfprQb1hvLKECOcI6xJAkpWzEW4ewCz7oWV3H1cBNe1yH
         FUexB/dDDGflInaTh+S2QLP58mQAgcP8sUQyu/P4tZNzVCT1ZGkaDIBgJ66TwY5QDnhI
         K1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751460163; x=1752064963;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yvTIRW/PlaL/Coal9MnMXfGSJFOe2gEx2uCOoGU2HTc=;
        b=JUjDr9x6NoWDxsJK9WSvKo5JkBUbS6CFOhJRNUCrIOcwvFVY5eoe7DMeddCfy2u3k7
         igMYH2d3TqqRsrDvAZBzqoMU4tsNESGAHzeh3ytW5TBay1FCWZUENiPg5M7Nsqh3DHZ4
         3rgLDoTPbWZsCVMzGAqtCGIJWy24YzWZaDKYKd8GfUfAItHle6tPgoXid3MQ68I/xdKR
         uepRvPJNWzoJBFxJwKZJ+1mriUUuDEouIy+cSVJmBxv80ClCqe9bYhO7cx6fSmrCFxf2
         /6L+OiLjxqxWvs0Qnp20vwR3xcFJtBg2ShnwH0VcIl5dQ1SazfqgPVP4JhFD86UebvIM
         AyRw==
X-Forwarded-Encrypted: i=1; AJvYcCWDifH0MouWcdIcWB3oR7azL/bfRHQtkKaKp5KM0lhnMVsW+Gs9wlSSpcKq/G75j8Hw3qZ7MNs5NFG1@vger.kernel.org, AJvYcCWNbOZxx8vmDVATnS4kKTTw5ti3nShfzT1H+2TE6Im842JLJ5fEto3TI3bmMd4+ZbaPs1e7nY4ofoGYp7k8@vger.kernel.org
X-Gm-Message-State: AOJu0YwKk88F5io27YD+Kj3FYYj3o1+/vVbPMNCI16woxp8GPOtanzAY
	oSAcRw06ULx6Ulx38U7/sqN8zdKfKCI4GuGyaWCj39hFk1O55pdJ2dR2
X-Gm-Gg: ASbGncvEpeFVw0UrJPPTaxOgF6p+h+Chv1YYiiLz9ioCyGben/G3ao2L6VOT1p/YYGo
	AR/NX/wDp4rSMrFxMYPJVeQ70r4WpKUJ8xqs7QncWNc22jcsle3L5+rg8hXJPnjDRoxgw7cD+dy
	FsXYUcf25+Wurnmbk3LxtDovyEj3gT96hGCsv4U3uBKOtpiVOLFla4hCs5oHdoWhtzknje6Cx7A
	CJqLUeYstSBe3rR+5EHQfa/lehAJIuWuDw3CMyYWmc30kzR5UQeIyycPhQe0MBR9AtcVfDHMLuz
	mHmALwGbkb8Utxs8JDPP0YLT9twV0GMZP4gOc/hbLjAUZe6zuG3V+vR/PDhHSROhRARUFbQESD6
	1LHnaoGQonCuHrw==
X-Google-Smtp-Source: AGHT+IHCLbSuVYTEllDjQ5dQJ3Hrz7B1hmUNm2J0NtG+6yotf9hfynzzqby2EJpBb4NM6UwXdLhxFQ==
X-Received: by 2002:a17:90a:d64e:b0:312:18e:d930 with SMTP id 98e67ed59e1d1-31a90bd4c31mr3631485a91.19.1751460163381;
        Wed, 02 Jul 2025 05:42:43 -0700 (PDT)
Received: from rigel (61-68-193-107.tpgi.com.au. [61.68.193.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c14e18bbsm13578241a91.23.2025.07.02.05.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 05:42:42 -0700 (PDT)
Date: Wed, 2 Jul 2025 20:42:31 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Jan =?iso-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>, Marek Vasut <marex@denx.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 00/10] gpio: sysfs: add a per-chip export/unexport
 attribute pair
Message-ID: <20250702124231.GA55860@rigel>
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
 <aGPrFnDxG4W7S9Ym@smile.fi.intel.com>
 <20250702035439.GA20273@rigel>
 <CAMRc=MftawBB4rtj4EKS_OwMCU9h53sA8QxcFq_ZY0MRg2OLag@mail.gmail.com>
 <20250702101212.GA47772@rigel>
 <CAMRc=MeuMpo0=ym+FvDh5sCNXM00+iOSNFgTxMqagO78ZS64_g@mail.gmail.com>
 <20250702110127.GA51968@rigel>
 <aGUfL5DDZrhSG788@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aGUfL5DDZrhSG788@smile.fi.intel.com>

On Wed, Jul 02, 2025 at 02:59:43PM +0300, Andy Shevchenko wrote:
> On Wed, Jul 02, 2025 at 07:01:27PM +0800, Kent Gibson wrote:
> > On Wed, Jul 02, 2025 at 12:28:01PM +0200, Bartosz Golaszewski wrote:
> > > On Wed, Jul 2, 2025 at 12:12 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > > I tend to not interpret it as adding new features. We really just
> > > > > *move* what exists under a slightly different path when you think
> > > > > about it.
> > > > >
> > > > > So what are you suggesting, remove the `edge` attribute and polling
> > > > > features from the new `value` attribute?
> > > >
> > > > Exactly. I'm not suggesting ANY changes to the old sysfs, only your new
> > > > non-global numbering version.  The idea being don't port everything over
> > > > from the old sysfs - just the core feature set that non-cdev users need.
> > >
> > > I mean, if someone shows up saying they need this or that from the old
> > > sysfs and without they won't switch, we can always add it back I
> > > guess... Much easier than removing something that's carved in stone.
> >
> > Exactly - expect to be supporting whatever goes in now forever.
>
> +1, this is my biggest worries about the interfaces proposed by this series.
>
> > > Anything else should go away? `active_low`?
> >
> > I don't personally see any value in 'active_low' in the sysfs API if you
> > drop edges. It is easy enough to flip values as necessary in userspace.
> > (From time to time I think it should've been dropped from cdev in v2 but, as
> > above, it is carved in stone now so oh well...)
>
> But in cdev case this is different. Active-low state is needed to be
> HW independent. For sysfs I agree as it's _already_ HW *dependent*
> (due to global number space in use at bare minumum).
>

As Geert pointed out, userspace needs to set the 'active_low' itself, so
it isn't really providing hardware independence.

The issue isn't whether the logical/physical mapping should exist, but
whether there is any benefit having it baked into the API.
It could've been added in userspace instead and made the uAPI a tad simpler
with one less source of confusion.

Cheers,
Kent.

