Return-Path: <linux-gpio+bounces-1487-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 445298134DB
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 16:35:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 004C9281DD4
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 15:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1DE55D8E4;
	Thu, 14 Dec 2023 15:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJuFBuJF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D29C198;
	Thu, 14 Dec 2023 07:34:49 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-28694702c18so8020096a91.3;
        Thu, 14 Dec 2023 07:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702568089; x=1703172889; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4wBI1ds+dJ8NsQvuIecgk+p/aVllpdk4KE/JP6rxRYk=;
        b=RJuFBuJFqLNGm2xOQxH3VyipMfTVZ/V4XRlVPkgreFpxYUR0kWLghNNgsXS5CRNGkY
         Cy5mbI66mR4MzwJOsbpFjQp0Yrq10/jqE0Dy+Z5DRp4scuDWSq4HDUQzm/zK3Pp+pLNi
         AGcxPQXrJpSRNxVJc5iclIPabRX0U7XpVx9hxphSQ8wAtqrTX7CH7a67cB2LYvbMoSWV
         ITpCKXzFsSYKAPDmp89EKBX+29jOOMYZCs9ZM0WmQtF/Vt3B7coNDhDhR1xop2or5s6o
         ji8uDgy3vj2Cdf7yguqIgomE0coJ5roQgxbaccmj9+vHcqII6fUmf3GCUe/Pgz5ZAiK4
         O7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702568089; x=1703172889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wBI1ds+dJ8NsQvuIecgk+p/aVllpdk4KE/JP6rxRYk=;
        b=ubKDSiP3P66QQ+KoiX+FQSYkOfsTWLBMHbfDtUBLTAveuzMKdoztBMG3Z53GmBFa+z
         veU0JXuHiP2H8JLQDg5ytRIZO2ZVsTwN9jWvxSSTEiJh9h9ZgbFu0v6HvS9UxzgLjUGt
         Dv1bHuOYTmw0/tBnvALBoT++oPOOvAoT2F0x4gNfNMUutDXKuWK/9q3MXoq3pQJC3HIL
         4/hNn4mTxg0lX/0gFgkArpz1mcb+YWO7Xc6EcebzE9mbnF6I4s59pj2LEAqn7Fo1r/6r
         tykDBKJwWT0Yl2yu1a+MLIfCJBkrWnauzIognA9957/lTE7UsmFfngR/y8GmKZJzK7gi
         4JKA==
X-Gm-Message-State: AOJu0Yw13vPFxzaFD1TWtITGX83u5ZrC0OL8kkQ7O9Qtqvl1z2SeI9yR
	8RAzt/09W1PEiE/4G6Gs5tc=
X-Google-Smtp-Source: AGHT+IFqvn3ME5ZZYZZ/qZrbge3ZEiH8p/nStQtrHIV8ES+afCzbUNHSNNLEzu3EpLjp6NuCZfLzng==
X-Received: by 2002:a17:90b:ec8:b0:28b:c4e:9378 with SMTP id gz8-20020a17090b0ec800b0028b0c4e9378mr664954pjb.46.1702568089269;
        Thu, 14 Dec 2023 07:34:49 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id nb11-20020a17090b35cb00b0028017a2a8fasm13426949pjb.3.2023.12.14.07.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 07:34:49 -0800 (PST)
Date: Thu, 14 Dec 2023 23:34:44 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, brgl@bgdev.pl,
	linus.walleij@linaro.org
Subject: Re: [PATCH v2 4/5] gpiolib: cdev: reduce locking in
 gpio_desc_to_lineinfo()
Message-ID: <ZXsglIJtK50XYCIV@rigel>
References: <20231214095814.132400-1-warthog618@gmail.com>
 <20231214095814.132400-5-warthog618@gmail.com>
 <ZXsa39xneH6Rh7Gd@smile.fi.intel.com>
 <ZXsc5T1G5Y28lVqw@rigel>
 <ZXse4UDKGlVqzsyD@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXse4UDKGlVqzsyD@smile.fi.intel.com>

On Thu, Dec 14, 2023 at 05:27:29PM +0200, Andy Shevchenko wrote:
> On Thu, Dec 14, 2023 at 11:19:01PM +0800, Kent Gibson wrote:
> > On Thu, Dec 14, 2023 at 05:10:23PM +0200, Andy Shevchenko wrote:
> > > On Thu, Dec 14, 2023 at 05:58:13PM +0800, Kent Gibson wrote:
> > > > Reduce the time holding the gpio_lock by snapshotting the desc flags,
> > > > rather than testing them individually while holding the lock.
> > > >
> > > > Accept that the calculation of the used field is inherently racy, and
> > > > only check the availability of the line from pinctrl if other checks
> > > > pass, so avoiding the check for lines that are otherwise in use.
>
> ...
>
> > > > -	spin_lock_irqsave(&gpio_lock, flags);
> > >
> > > Shouldn't this be covered by patch 1 (I mean conversion to scoped_guard()
> > > instead of spinlock)?
> > >
> >
> > Read the cover letter.
> > Doing that made the change larger, as flags gets removed then restored.
> > I had also thought the flag tests would get indented then unindented, but
> > if we use guard() the indentation should remain unchanged.
>
> I'm fine with that as I pointed out (have you received that mail? I had
> problems with my mail server) the dflags is better semantically, so restoration
> with _different_ name is fine.
>

I have noted that some of your replies have been delayed, and I can't be sure
of what I might not've received. I can't say I've seen one that mentions the
dflags name being preferable.

I prefer the plain flags name, if there is only one flag variable in the
function.

> > Can do it in 1 if you are happy with the flags declaration being
> > removed in patch 1 and restored in 4.
>
> Definitely.
>

Ok will re-arrange in v3.

Cheers,
Kent.

