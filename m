Return-Path: <linux-gpio+bounces-1488-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE98813526
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 16:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E634B20E2F
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 15:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C465D8FA;
	Thu, 14 Dec 2023 15:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jl9Uri0H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2386115;
	Thu, 14 Dec 2023 07:46:59 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1d0b2752dc6so74222935ad.3;
        Thu, 14 Dec 2023 07:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702568819; x=1703173619; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QTLSA/5Au/MFq4YJd5jR9otFaawbNkkP53RJQOluPHw=;
        b=Jl9Uri0HSnmy/7g0P9SS9HXK3oTraVXZMXk+ZtPvBA9o4WO19IsIC3wqSHNIK32fu7
         srf1sjfXGkRSQSyu5aVaf803r3iq/Rpfpbhip33dGDPUDtE9/bFhK6H5O9L/xCYip/HS
         qxtRuIOXYGxmQGbudXmP5KcNT4dumoX+g4XFnoUbobWiIne4VcGBBOU8v4P8h8iZEOEW
         L3DBvcsk1LPXNxK5udc3OaQjji9o7eJke/OKyeYRjIfENd6oyJ3L6CZIIkZtvO/mN3B3
         JO/dQE7uPHNx1lHBHBRfakC5mx5WgPR+fi8MuuY+FecyFfbrWA5Fp00We5sbsz9Nqaxr
         ku8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702568819; x=1703173619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QTLSA/5Au/MFq4YJd5jR9otFaawbNkkP53RJQOluPHw=;
        b=IeOi32xEwNgQDY9xsOPNsMhaqH5905MZKr8eOQfxTbNOsi6M2fh2kYjdMXH8kIVjMz
         NMc/BSuVktwgYp0HYSr1pQdX21fSnnWGqmqw9Dk2rbO3pyWL2eQpX7VTE03arKbVxNjL
         w6+NS/yF3YbclOetjj+P5pYLmJrTgFLRZLjYdFvshEGoXMZHUw1P/ph0T9Bt4HwbJcuE
         lny+p2G/4Y+0PSZOrQEXPNAAyAAM0tVieE/CdKgr3Q9FGSmQiXjqCWVyf2sGSvYk91aA
         VbUa4cb3sAN3JWCOxeFvbxam/U+d9YoIs21s4Px+VHM09nDjHKDk14eXQ9ZEBRwBZDEB
         o9Nw==
X-Gm-Message-State: AOJu0YyLPJ4A5F6wAxwGnqQi6olM5ClpCFaULUCIUMAJ6OqzAVLv2+xw
	5eOOVS6k9woivKSrFL2nTKM=
X-Google-Smtp-Source: AGHT+IFLo6cnTA+JoGLmu2BD08QC009Br4AybD/FVUxOYZDoT8N/eTA5x3KnjZeP/95vxzgkQmyt9A==
X-Received: by 2002:a17:903:2b0e:b0:1d3:6b17:5eb with SMTP id mc14-20020a1709032b0e00b001d36b1705ebmr1378286plb.49.1702568819340;
        Thu, 14 Dec 2023 07:46:59 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id r2-20020a1709028bc200b001bc6e6069a6sm1475008plo.122.2023.12.14.07.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 07:46:59 -0800 (PST)
Date: Thu, 14 Dec 2023 23:46:54 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, brgl@bgdev.pl,
	linus.walleij@linaro.org
Subject: Re: [PATCH v2 4/5] gpiolib: cdev: reduce locking in
 gpio_desc_to_lineinfo()
Message-ID: <ZXsjbvUYJGmGU6bs@rigel>
References: <20231214095814.132400-1-warthog618@gmail.com>
 <20231214095814.132400-5-warthog618@gmail.com>
 <ZXsa39xneH6Rh7Gd@smile.fi.intel.com>
 <ZXsc5T1G5Y28lVqw@rigel>
 <ZXse4UDKGlVqzsyD@smile.fi.intel.com>
 <ZXsglIJtK50XYCIV@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXsglIJtK50XYCIV@rigel>

On Thu, Dec 14, 2023 at 11:34:44PM +0800, Kent Gibson wrote:
> On Thu, Dec 14, 2023 at 05:27:29PM +0200, Andy Shevchenko wrote:
> > On Thu, Dec 14, 2023 at 11:19:01PM +0800, Kent Gibson wrote:
> > > On Thu, Dec 14, 2023 at 05:10:23PM +0200, Andy Shevchenko wrote:
> > > > On Thu, Dec 14, 2023 at 05:58:13PM +0800, Kent Gibson wrote:
> > > > > Reduce the time holding the gpio_lock by snapshotting the desc flags,
> > > > > rather than testing them individually while holding the lock.
> > > > >
> > > > > Accept that the calculation of the used field is inherently racy, and
> > > > > only check the availability of the line from pinctrl if other checks
> > > > > pass, so avoiding the check for lines that are otherwise in use.
> >
> > ...
> >
> > > > > -	spin_lock_irqsave(&gpio_lock, flags);
> > > >
> > > > Shouldn't this be covered by patch 1 (I mean conversion to scoped_guard()
> > > > instead of spinlock)?
> > > >
> > >
> > > Read the cover letter.
> > > Doing that made the change larger, as flags gets removed then restored.
> > > I had also thought the flag tests would get indented then unindented, but
> > > if we use guard() the indentation should remain unchanged.
> >
> > I'm fine with that as I pointed out (have you received that mail? I had
> > problems with my mail server) the dflags is better semantically, so restoration
> > with _different_ name is fine.
> >
>
> I have noted that some of your replies have been delayed, and I can't be sure
> of what I might not've received. I can't say I've seen one that mentions the
> dflags name being preferable.
>
> I prefer the plain flags name, if there is only one flag variable in the
> function.
>
> > > Can do it in 1 if you are happy with the flags declaration being
> > > removed in patch 1 and restored in 4.
> >
> > Definitely.
> >
>
> Ok will re-arrange in v3.
>

Hang on - patch 4 has to use a scoped_guard(), so are you ok for patch 1
to introduce a guard(), to avoid changing the indentation, only to
replace it with a scoped_guard(), to perform the tests after releasing
the lock, in patch 4?

Cheers,
Kent.

