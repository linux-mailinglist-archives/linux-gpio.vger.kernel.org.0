Return-Path: <linux-gpio+bounces-11298-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA07799C5AE
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 11:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B7921F22AF9
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 09:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B0015821A;
	Mon, 14 Oct 2024 09:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqjpL8cv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082A014D428;
	Mon, 14 Oct 2024 09:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728898202; cv=none; b=KShj6h0azndrZKaMohmywtpOxXJTLFfUO10zUIRNI03iObjteuB0ir6ArsSIjAoiaX6Trb/dEh2ihiqLs5kPFa0e+o0EfZ2skKBBs4QehqbKblSVZ1LAniRAC80EMKI2mfJs3CUoGE54J1lmNvREJ5azIKmh+G+U38dbq0bUz0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728898202; c=relaxed/simple;
	bh=E4gGyp1kFMT29RX9LkFy6w4WMuKXl+a1iLt/QtzPMjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/DNh2azdqguCtM2kzNsBEAFFg0hCZzWzfhWA1i7XCzHrcGlwGRW099AGTSGPl0Ignt5Most2t3eX6KWZDPI2xr+eNvNUh3nbuU/952hLQkh1Wd4uJAc3L5A0Ui4yiVaNjtjFgHR5593gjdzYERphlWP04noj6vd9Qh3uF6+zf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqjpL8cv; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20ce5e3b116so5760445ad.1;
        Mon, 14 Oct 2024 02:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728898200; x=1729503000; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Copm9PeaBu2YlnSH1o7kgjbaNvSNFIBoD2tI4a3XUaY=;
        b=EqjpL8cv7p0nShYeI2oGJrV6X3FKqeR1n6an+71OBtxMXrQlHJdK0ScP8EQhsyXhIj
         f/uBaDtKhpBtMnl6mgVtAAk1hP2depNX9l8gprmhPkDUZ+LN+nH0AxO6McGZj4y85Kd0
         I+hhmkJcrm0qbOl+25WEbGkjsBtLzaUDAxh0fftojpUZ++tuF0GnrWEZj0Li52K25Fcv
         QHdzPkbbTxcib0NC935MITvtiVai8Wwcwls5RBLy4FdFhBoK6TiqqjvEbMBBb/KxcfXu
         QiDXW9+Wzc4Ni9Lsc3YaG2t7F1ko+wXivGGgNlpcjb9UbwKmZIM9ADiIYczpAyLfG0K9
         0e7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728898200; x=1729503000;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Copm9PeaBu2YlnSH1o7kgjbaNvSNFIBoD2tI4a3XUaY=;
        b=xIxY/L0HkGiwkdIdR5Zc8/ishHMxgeSkg2TL28nCiC6XAGYLRasper3RI9o5HULHUM
         MSoyI5na3tu48EEFTjsgEEyMdf3AxFM3iDyUnPixPqWTcb1eRRUBWvgm/Q/OuZ1v595z
         UsFvoMaY9pOBDvXTe8WkpSegp8rQ64Og5J0z5k+UNDSdwuJSqFyDDXocGFVJ2BUyDM70
         huTN9FToEPJ7A3C3W5c6ykGW8OU21Bm3nMS29qzixeiNt9Hhdm9fGScg7CkA2Hy/V7EF
         SWND48fecfdqo9vHPDHshEAusP+S6y3Mn9Z9qOB2lkZPQ5TPr6hWjA5MikP6AzRGpVtu
         MiQw==
X-Forwarded-Encrypted: i=1; AJvYcCVdxGU/a5KBWnLM4jC8xA+HTKLLt7YSurv9Ya0eTVdZ68t3CzsjtTcVTb+I6aitAQKZ1jHJBcxUkI3O@vger.kernel.org, AJvYcCXkpTKZ9xfE1/1T9FotkeAxtyE3KMz6O3TRa/ChGl2ttpxOEiAq3gqL8k6WM7n14vacY7roAv7b6kIpqXb8@vger.kernel.org
X-Gm-Message-State: AOJu0YzLTR5tc6l5pAHFv/+jI8w5DkixBAiOA9Yo2ngtHF+iLnlZkxJd
	ATAOEaRPpOQ3iVGUSHuFy7RNqk90gF46uns6Sut+DI7e/zPJDeOg2Kiidsf5
X-Google-Smtp-Source: AGHT+IE8r9gDdGftRQDa0cWECRgzWkvWID3Rvrb1GMjo6E8U0BxbDfPZHbHyYsCEGEM7DfD1z/TVjw==
X-Received: by 2002:a17:902:ce87:b0:20c:9ec9:9a77 with SMTP id d9443c01a7336-20cbb22f313mr104110035ad.37.1728898200364;
        Mon, 14 Oct 2024 02:30:00 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c215ed4sm62478515ad.217.2024.10.14.02.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 02:30:00 -0700 (PDT)
Date: Mon, 14 Oct 2024 17:29:55 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 5/6] gpiolib: switch the line state notifier to atomic
Message-ID: <20241014092955.GA105498@rigel>
References: <20241010-gpio-notify-in-kernel-events-v2-0-b560411f7c59@linaro.org>
 <20241010-gpio-notify-in-kernel-events-v2-5-b560411f7c59@linaro.org>
 <20241014021140.GC20620@rigel>
 <CAMRc=MeoSnr-z=fmfRoTU-vdL_BAkTAE+0HiBaVUWmFG-bOTPw@mail.gmail.com>
 <20241014092450.GA101913@rigel>
 <CAMRc=Mdf8CLQDPL8RMyWPyx8362xS3jEBe4zM=JL_dzRgF5wow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mdf8CLQDPL8RMyWPyx8362xS3jEBe4zM=JL_dzRgF5wow@mail.gmail.com>

On Mon, Oct 14, 2024 at 11:27:05AM +0200, Bartosz Golaszewski wrote:
> On Mon, Oct 14, 2024 at 11:24 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Mon, Oct 14, 2024 at 09:48:16AM +0200, Bartosz Golaszewski wrote:
> > > On Mon, Oct 14, 2024 at 4:11 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > >
> > > > > +     /*
> > > > > +      * This is called from atomic context (with a spinlock taken by the
> > > > > +      * atomic notifier chain). Any sleeping calls must be done outside of
> > > > > +      * this function in process context of the dedicated workqueue.
> > > > > +      *
> > > > > +      * Let's gather as much info as possible from the descriptor and
> > > > > +      * postpone just the call to pinctrl_gpio_can_use_line() until the work
> > > > > +      * is executed.
> > > > > +      */
> > > > > +
> > > >
> > > > Should be in patch 4?  You aren't otherwise changing that function here.
> > > >
> > >
> > > Until this patch, the comment isn't really true, so I figured it makes
> > > more sense here.
> > >
> >
> > So the validity of the comment depends on how the function is being called?
> > Then perhaps you should reword it as well.
> >
>
> The validity of the comment depends on the type of the notifier used.
> As long as it's a blocking notifier, it's called with a mutex taken -
> it's process context. When we switch to the atomic notifier, this
> function is now called with a spinlock taken, so it's considered
> atomic.
>

Indeed - so the comment is brittle.

Cheers,
Kent.


