Return-Path: <linux-gpio+bounces-1378-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF7A8115D9
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 16:11:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0900F1F21441
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 15:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1215430F9B;
	Wed, 13 Dec 2023 15:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bwI9BR7z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C49CA0;
	Wed, 13 Dec 2023 07:11:40 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6ce9c8c45a7so4399286b3a.0;
        Wed, 13 Dec 2023 07:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702480300; x=1703085100; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MVoGj2D2DMUo44xl6GAyPl6zTtJUXg2mVSdeTOQeduo=;
        b=bwI9BR7zEVOMYzoiLHbLanlPztr52jbM8D9MdL6cbYztUnsShcnsq9T6I8Sno/kCml
         b4JJh1/wtmHm1Y0vZXLEZ5FxIVktOwJ5o5s8+SFqFFFYWKqcdTDj/NvMSIqCCWB4o3wX
         vjnMpglXXx686FnV6h5SL+KHvoBNWKuKwsNs+TmkHuWAw/Z0Eh28K1izubToTEy8dMRZ
         BDJS4/ryb54dlD1mbhoGediJ1A5LAVdDaAvsdFGZ9K1uu61Ip6aVEYT3Bt0Ln0kuCpsX
         g+RmNGbOECBgo6hHktt/Sqyr/qjYkkreyhX/dxS149W+AAX7UDY2bCC9qvHulwR2U368
         Svkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702480300; x=1703085100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVoGj2D2DMUo44xl6GAyPl6zTtJUXg2mVSdeTOQeduo=;
        b=ufoXCNeFt7UiygDe0cyFse08d8VKq0VORAIA9PS27w22oTOJRTZh9CVQorFTIvJCWW
         NwL3jzcHfxiz927lzVprjg32Q1o2V8r1oKTAQpU9FabU0kzRf4yEh3RF4EmkVHk+JhvB
         FL2QvuBboPmT10aKjXbnzo7/LriUG+1VoCwbveciCOgR/JkWtXEwBuXia2GAmknGTdX6
         visR2HPsljn3YyeOSiK06YwvnvwTaQ3cDKHqXSx4c1yjo3feGW74X/bkvLTuIexPdwIx
         lBqLZ4Ue66nUNQ1YZBGZGBEw5lk/ndPOk36lIjVMfdU29q51jiWgdeGwnPm9GGFLe5ip
         j9Iw==
X-Gm-Message-State: AOJu0YxM1DQK2hUVLl3OUGe5QRs0ftgWBCjXfOMyFUE/wtk5ZP6PRpWr
	TFa7C/1UqN7pkOlS4wrfmxF7ook8B70=
X-Google-Smtp-Source: AGHT+IFkfYSwGPDQjq6tPndqIEs9YjrBQhCIDruTbK01vdsPqTRY2vSH8jhBHfinjmh8CGjzZVbc1Q==
X-Received: by 2002:aa7:88c8:0:b0:6ce:53f6:1eee with SMTP id k8-20020aa788c8000000b006ce53f61eeemr4612365pff.31.1702480299807;
        Wed, 13 Dec 2023 07:11:39 -0800 (PST)
Received: from rigel (194-223-186-106.tpgi.com.au. [194.223.186.106])
        by smtp.gmail.com with ESMTPSA id u13-20020a056a00098d00b006ce455a7faasm10154893pfg.150.2023.12.13.07.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:11:39 -0800 (PST)
Date: Wed, 13 Dec 2023 23:11:34 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, brgl@bgdev.pl,
	linus.walleij@linaro.org
Subject: Re: [PATCH 3/4] gpiolib: cdev: reduce locking in
 gpio_desc_to_lineinfo()
Message-ID: <ZXnJply1tPnTN_-O@rigel>
References: <20231212054253.50094-1-warthog618@gmail.com>
 <20231212054253.50094-4-warthog618@gmail.com>
 <ZXm4C7KVkMwL4_sX@smile.fi.intel.com>
 <ZXm6oHjb7CRZ8-0f@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXm6oHjb7CRZ8-0f@rigel>

On Wed, Dec 13, 2023 at 10:07:28PM +0800, Kent Gibson wrote:
> On Wed, Dec 13, 2023 at 03:56:27PM +0200, Andy Shevchenko wrote:
> > On Tue, Dec 12, 2023 at 01:42:52PM +0800, Kent Gibson wrote:
> > > Reduce the time holding the gpio_lock by snapshotting the desc flags,
> > > rather than testing them individually while holding the lock.
> > >
> > > Accept that the calculation of the used field is inherently racy, and
> > > only check the availabilty of the line from pinctrl if other checks
> > > pass, so avoiding the check for lines that are otherwise in use.
> >
> > ...
> >
> > > -	bool ok_for_pinctrl;
> > > -	unsigned long flags;
> > > +	unsigned long iflags, dflags;
> >
> > With a preliminary conversion to cleanup.h this whole change becomes cleaner,
> > no?
> >
>
> You mean the scoped guards?  Dunno - haven't used them.
> Care to provide more detail?
>

Ok, so changing the spin_lock/unlock to

       scoped_guard(spinlock_irqsave, &gpio_lock) {
       ...
       }

you no longer need the iflags at all, and can rename dflags to flags.
Got it.

Cheers,
Kent.

