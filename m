Return-Path: <linux-gpio+bounces-6382-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E925A8C63B4
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 11:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17D2B1C22238
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 09:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56EFF57CBB;
	Wed, 15 May 2024 09:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EC29zX6Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEF25A0E0
	for <linux-gpio@vger.kernel.org>; Wed, 15 May 2024 09:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715765531; cv=none; b=dh2cahcntFhCWivv+6dioL3uyC5EV7kNyVzUy46cCUaVn/lr27kn2YZOZu6AP7Wb2xtSMcJOyLzAi3BXsqBwCLhUhRIFQbbSHHK9hPRrWxcmmRYfTjdEx4Q8/T9k+gdDk73kN1CyppRkMtd91uJ2f+8tbUmOqUkX7eSwhYva4Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715765531; c=relaxed/simple;
	bh=/8nWrlNevjfmFeXP86yVz83E7KxrFt76SJOu9tuhgvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHMP8anOzB1Y/DJ/GdEOr75mDA74TCfhy7zzx2tq5Viv3TRJDN2W0yJU/yZqAtKca5zN4SAsr6I1Uy8L7VbW0DACe4N7Fr+D35xSilD/CVV9CUXy21iZRXe+d+st2HBIkSLhrESMcalWcMd+8DxWaTCvnR465YP+g58u725dxP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EC29zX6Q; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6f453d2c5a1so5370853b3a.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 May 2024 02:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715765529; x=1716370329; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L8DeMJoyaBYFB/RLRi7kFt2+HFAH8WGdSSSJM36iCoY=;
        b=EC29zX6QkyKSgp8vtFFhdIQAyWUfGLy89nzTrKE2AwG5EIC9Mqt0SZZ03Y6zsWbFcO
         5alhX0C8wO3wwYCMiNKYzPSJTpB8kfMcjJjitAVEqRHtspq1m6jctYW6GG8DRwakk6iJ
         K4OgLNZhG+QH5xZ/RrfnKqM/q5Y1KAhezjhGSOyjuBh73IIg+Omm9wlYwE8zJBbsLHmp
         6FOln+1HjRkzEBGgQ62p/sq6LUqEgbIsQGmgBNZJTqkz4Rrd4qx/NzVbmv85YujCzgHR
         ye2arhyx6X0a8QEyVQLoVHimKddIsz+FdQemi1PtnzMlVuC+LZG7jwg0ma3M+jRidq/Q
         1smg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715765529; x=1716370329;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L8DeMJoyaBYFB/RLRi7kFt2+HFAH8WGdSSSJM36iCoY=;
        b=VKrrmaclsnCv/u2J5BAhvRp1nZOcQnzjszEfDsnBiGhXPJkpXCjm12gZc6zOdsTa3P
         qpKdd2/IfC+4MGboUmJCMdqq3APCBifSdcy3m/qcdiaoxMLLTNz70mCsGIMJAaG/sebO
         bn9zMQDBpI64n6MEgwqyKzE5gki8eFGVDZz8jpkZ27W+dgoqhu34qwn7IhLCqVxLeAIt
         0oxaUmFIBV0QelkT5E6LEI6gJF5kh5K6AnuCVGfbxTMrDkX+5wPutnfx4OeTtubAPQc2
         iM9fxpLLUHfki69z5wpdNHqWA7wJwI96GvERLcAoksSaQv/NZKl8LZfG2V4OkHta+Syq
         Q9MQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7xAgLuA39C8uPD0xL8PCDLDkAOY1hQ/SXNDgNGFfZbzWh8kZW2S4YzJ46cQabKuvxFqstj5yYN/YKNGpQeIjyVJsAxxQ92pAQsQ==
X-Gm-Message-State: AOJu0YyrJRvzy3fnPeOoshskR0yACFSL29izN/kCj1yH9++RI0Za6NqS
	dplK5PmO7SdePyN70VZge9HzSJsKe/ucfqv0Fufbm0opapmoUQ6jtWvJDg==
X-Google-Smtp-Source: AGHT+IEiL++uZcd7IgUKPA1R2thSFbogQxLIbHDd8cVg4MxPlrLCn3y4jNqaUZUoTTjIOSRqKPtLTQ==
X-Received: by 2002:a05:6a21:2d84:b0:1af:f89d:831a with SMTP id adf61e73a8af0-1aff89d83b4mr10497643637.50.1715765528056;
        Wed, 15 May 2024 02:32:08 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c03619csm113288025ad.209.2024.05.15.02.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 02:32:07 -0700 (PDT)
Date: Wed, 15 May 2024 17:32:03 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Martin =?iso-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	Esben Haabendal <esben@geanix.com>
Subject: Re: [libgpiod][RFC] helper functions for basic use cases
Message-ID: <20240515093203.GB86661@rigel>
References: <20240507022106.GC26136@rigel>
 <CAMRc=Men25EQSuUtyf+b-TSfndnmQ8oCfNVU82pq1E-+r64QHg@mail.gmail.com>
 <20240511011144.GA3390@rigel>
 <CAMRc=McwX7f4KNqunRSj6jk=6-6oj9kUy9XJRc=HokyfaiUsmA@mail.gmail.com>
 <cfa1d2cc41a4c5f924f1599a4da0c8e6fbe00eba.camel@geanix.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cfa1d2cc41a4c5f924f1599a4da0c8e6fbe00eba.camel@geanix.com>

On Wed, May 15, 2024 at 09:06:50AM +0200, Martin Hundebøll wrote:
> On Mon, 2024-05-13 at 01:28 -0700, Bartosz Golaszewski wrote:
> > > Anyway, have a think about it.
> > > And I'll go take a look at the GLib bindings.
> > >
> >
> > I have thought about it. I agree we could use some simpler
> > interfaces. I don't
> > agree their place is in core libgpiod. I understand we want to make
> > this new
> > interface seamless to use for end-users of libgpiod.
> >
> > How about introducing a new header and a separate shared object:
> > gpiod-ext.h
> > and libgpiod-ext.so respectively? We could put all these new helpers
> > in there,
> > use the gpiod_ext_ prefix for all of them and distros could package
> > the
> > "extended" part of libgpiod together with the core library to avoid
> > having to
> > install multiple packages?
> >
> > We'd keep the clear distinction between the low-level, core C library
> > wrapping
> > the kernel uAPI and the user-friendly C API. Though the user-friendly
> > API in my
> > book could be the GLib library but I understand not everyone wants to
> > use GLib
> > nor is familiar with GObject.
>
> For our embedded use cases we would go far to avoid GLib in our root
> filesystem (and our initrd too). This means relying on libgpiod only.
>
> With the current core API, reading a single gpio line feels cumbersome.
> Especially because we often use gpio labels to run the same binaries on
> multiple hardware variants.
>
> So we would really like to see an "extended" API, with wrappers to:
>  * request a single gpio line from chip + offset

That is in my proposal.

>  * request a single gpio line from a (unique) label

That one would require migrating a fair chunk of code from tools into
core.  Though that deals with multiple lines in parallel, whereas this
would only have to deal with a single line, so could just be a simple
interation to find the line.

Would a function that finds the (chip,offset) for a name be sufficient?

>  * read the current value of the requested gpio line
>  * set the current value of the requested gpio line

I did consider these, but didn't see a huge advantage over the existing.
gpiod_line_request_get_value(req, offset).  Too complicated?

OTOH, if you want to get the line by name then you don't know the offset
:(.

>
> Having those functionalities in a separate shared object is fine.
>

Good to know, but my intent is to make these ext functions still use
the core object so users can still use the existing core functions.

Cheers,
Kent.

