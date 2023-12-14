Return-Path: <linux-gpio+bounces-1493-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11992813551
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 16:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE3781F21950
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 15:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A755D915;
	Thu, 14 Dec 2023 15:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FqXbUWnU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20EA0B2;
	Thu, 14 Dec 2023 07:53:16 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d37a6926f7so1613755ad.3;
        Thu, 14 Dec 2023 07:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702569195; x=1703173995; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wsHrNooczI2aqm3M6rMha8X9i2K4VFA8VCRi3SyFwoo=;
        b=FqXbUWnUJiI7aXKZASy0ignfqPRr+OW35+ut5Khwl2/153B4u0agDQxDKmT8Uz/f9A
         ZUivFqbqTWswwc4PGxuP8b2ynvTappWde6zEQWFomoBLomC/35Lq1z5i+4ZwdpbrdvyG
         eZYLRncsp6SETT8NwJo0DCWsDJLvZx3RLg06kEGRKF1pu3hvEXm4ehVfYym3aj0TrVp6
         n/jTnpFGeZ4jk6LVJFGFVk1t3tm1guNSzOW0vZpmvKf81puw1HY864Q2t8Gp0bSVApIB
         ApQX9xAoKOTxXHz84IqHJuouDjjGhnzL33iqoHaYcXAkA/i9ygJztJ+15KfnAFoD5oKT
         0E9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702569195; x=1703173995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsHrNooczI2aqm3M6rMha8X9i2K4VFA8VCRi3SyFwoo=;
        b=FDydoU8csA/0OtxNizVtHf8NUsxzcd8cJqdk3X7hsZ2U0cFFr7zRqn8+pwt0yDDPMj
         sbrk1fy8FGFOvBJD9KqU0MFKIfGI33iMYE2VmePJtUwEMp7RXSf8jJ3q40R3eRf93TfD
         85FWzpVa8EA2p4zNBIYdPW1E8Bn2l33ZHtbKibJekfBMb/B/7vrBCyDYGIuLCL3LXH37
         Xaa1sXGtqdv9H2nlq2eCzXboKoKzx3rX26rylET+snWc9yU+BOr0mMDzUqU/0lkiNsqz
         fot3yBbtLOQr5pNxE7p7YPrSPeb5yifnSY8VKFDL/MaF9i4DK/xyxBjoYIbvi324h90e
         SkuA==
X-Gm-Message-State: AOJu0Yw63xIiP5L5eEzQ/b615KUNl3F8WtyTPQssv1KHuKd/54DlC5Dx
	/SmjkvUVtYUG4CmSzyc+ldg=
X-Google-Smtp-Source: AGHT+IEBo4BdiAYmx3Bc6qTraGpNE0NfuGJQ08CTLfP/Z2iZcEsK4lBPnIOMnDEC9q7AJ2v/ly7UTA==
X-Received: by 2002:a17:902:e74e:b0:1d0:b693:ae15 with SMTP id p14-20020a170902e74e00b001d0b693ae15mr6461391plf.43.1702569195474;
        Thu, 14 Dec 2023 07:53:15 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id u14-20020a170902e80e00b001d0c37a9ccfsm12521675plg.303.2023.12.14.07.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 07:53:15 -0800 (PST)
Date: Thu, 14 Dec 2023 23:53:10 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, brgl@bgdev.pl,
	linus.walleij@linaro.org
Subject: Re: [PATCH v2 4/5] gpiolib: cdev: reduce locking in
 gpio_desc_to_lineinfo()
Message-ID: <ZXsk5hOxXM7oJIy4@rigel>
References: <20231214095814.132400-1-warthog618@gmail.com>
 <20231214095814.132400-5-warthog618@gmail.com>
 <ZXsa39xneH6Rh7Gd@smile.fi.intel.com>
 <ZXsc5T1G5Y28lVqw@rigel>
 <ZXse4UDKGlVqzsyD@smile.fi.intel.com>
 <ZXsglIJtK50XYCIV@rigel>
 <ZXsjbvUYJGmGU6bs@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXsjbvUYJGmGU6bs@rigel>

On Thu, Dec 14, 2023 at 11:46:54PM +0800, Kent Gibson wrote:
> On Thu, Dec 14, 2023 at 11:34:44PM +0800, Kent Gibson wrote:
> > On Thu, Dec 14, 2023 at 05:27:29PM +0200, Andy Shevchenko wrote:
> > > On Thu, Dec 14, 2023 at 11:19:01PM +0800, Kent Gibson wrote:
> > > > On Thu, Dec 14, 2023 at 05:10:23PM +0200, Andy Shevchenko wrote:
> > > > > On Thu, Dec 14, 2023 at 05:58:13PM +0800, Kent Gibson wrote:
> > > > > > Reduce the time holding the gpio_lock by snapshotting the desc flags,
> > > > > > rather than testing them individually while holding the lock.
> > > > > >
> > > > > > Accept that the calculation of the used field is inherently racy, and
> > > > > > only check the availability of the line from pinctrl if other checks
> > > > > > pass, so avoiding the check for lines that are otherwise in use.
> > >
> > > ...
> > >
> > > > > > -	spin_lock_irqsave(&gpio_lock, flags);
> > > > >
> > > > > Shouldn't this be covered by patch 1 (I mean conversion to scoped_guard()
> > > > > instead of spinlock)?
> > > > >
> > > >
> > > > Read the cover letter.
> > > > Doing that made the change larger, as flags gets removed then restored.
> > > > I had also thought the flag tests would get indented then unindented, but
> > > > if we use guard() the indentation should remain unchanged.
> > >
> > > I'm fine with that as I pointed out (have you received that mail? I had
> > > problems with my mail server) the dflags is better semantically, so restoration
> > > with _different_ name is fine.
> > >
> >
> > I have noted that some of your replies have been delayed, and I can't be sure
> > of what I might not've received. I can't say I've seen one that mentions the
> > dflags name being preferable.
> >
> > I prefer the plain flags name, if there is only one flag variable in the
> > function.
> >
> > > > Can do it in 1 if you are happy with the flags declaration being
> > > > removed in patch 1 and restored in 4.
> > >
> > > Definitely.
> > >
> >
> > Ok will re-arrange in v3.
> >
>
> Hang on - patch 4 has to use a scoped_guard(), so are you ok for patch 1
> to introduce a guard(), to avoid changing the indentation, only to
> replace it with a scoped_guard(), to perform the tests after releasing
> the lock, in patch 4?
>

Alternatively, I can move patch 4 to the top of the series.

Cheers,
Kent.

