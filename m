Return-Path: <linux-gpio+bounces-11552-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 667CA9A24E0
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 16:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D3EB28B502
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 14:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747C01DE3D9;
	Thu, 17 Oct 2024 14:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HnGprQ//"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658891DE3AC;
	Thu, 17 Oct 2024 14:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729174864; cv=none; b=gtYITr7dVJxg9/tqdggZ09nFjMsC3AJCjZUpE695Uz6XI+aXcgQLhK35ck1/5fsK92w3rwsv5kflcrTPMQG6isdDoffEf8woZgkA8Ahs7oYz9R5jw22y18LxZivn/9/iwu68TNrVUcA1cn2J2CpQzXFwwdabp3BuevYhex5+Jcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729174864; c=relaxed/simple;
	bh=+i1+iZgU4s5+YABjJhEG8l/XR+DZP0Rk5slar9YxXlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lc3XoUa2MPkd7V5EmIGZ5Rj2sUoVAJ7s5RlJM36Uz4jONKhq468m0D14XMTnKlGJeRiyYTPFRwzgc3vhy2UtuU07TvDhe77HUCPt9Pw1actT+S+l3J97dG84YiTNbIGaNmgOdtnkSI77+4Fp6hIAG9dNdmi0QfEiCfoWVdOK4WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HnGprQ//; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20c9978a221so12635715ad.1;
        Thu, 17 Oct 2024 07:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729174859; x=1729779659; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x/nghuLwxAlzGHJU3Clv5CuQOvD5vFQQ9Bp/jfeDw9I=;
        b=HnGprQ//CXS3PCKu0Osp4PypJk+8oJyFc/CPAF7OmacfSFbupWjNrFDsG2leZMDlEn
         ixPW8h1mUfesLd8/v8lG+rLINqI0MxAiTAHPUWuLzd8RyZfdPrBypHBoTc/rW6KehwB9
         2xPjh0A/uHJ8m/N9XS3JFpPZ2Jfzyh0ffV78ioU1KjmGuHw67xSTLBKH4rEbPR6/4QUp
         EWaF7slTmYPaB+YO9vdxMSjmQx//0k8HPG6ZSQthh+FNWIqtBeF6gVG5XrWoJPCAcdul
         WTTyrS1qme8jXHePWDTTLOaeclarEy4CSjLDaz6l54Lnh+C3XBNAcUeiNz0y9vgAtsbX
         +jsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729174859; x=1729779659;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x/nghuLwxAlzGHJU3Clv5CuQOvD5vFQQ9Bp/jfeDw9I=;
        b=puAFJfWJaF2iUQo61k584Cw1Hh1MDV6MHO/IkU2rzIhPPR8rQYD/y1ltQ71kw4wIpr
         YTo1PinhMpKdtZfgKYNegqGZqRRUjU5hcSXxq8hQFFNAPp5Cc/5vPmSOvk7suPBMM8K6
         4kbm/4HsW4kbwQDZZmtN8d/2I6UGZdsnMNrTt1US6gn8676xDpXP8VRF3buth7KzzJHp
         zho9QkbgWtxxiKFOAExFdI4E0CEJCKztqf+aFKxkf1fL/toKWjPiqsxsS41eq8X7ZlkK
         v4heu7lN6lxMqHpM+6l8/2E9ikeN1pmQaxYkS+pJ/ChnnW0F7f3FxasKWczHdkeTrkM3
         dABg==
X-Forwarded-Encrypted: i=1; AJvYcCUZHCDVD4smo+RWbyCPyAzs9TwbD0714cbmfxtBJVv5/J5iI2vE1+ZNeeBWPwo14X+pnKuxpQntQBX7KEuK@vger.kernel.org, AJvYcCVmzrcQZ/vcHVapu5+Zlh/9KROAJFJNYfunytKwwRlV0mrE3YJ+c1zXI4wmubx9oKcv8Pog9ZT04ZoI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6SEUSK1vrAoYuyRP1WNJgacQ6QWj/sTEsEuwHqJEyqF6FNfZz
	s+soGsUEqPmXhRLzCFxb8a/PCgD8W65P2BD3vysRptgfCruVjMDPycsNdw==
X-Google-Smtp-Source: AGHT+IF2BSHZjYF3E0lXfXUSyjYzMYs9lF+O3lub1mXer8r94G0iWs2egW53XYAgd2eW6Z81nj+jlg==
X-Received: by 2002:a17:902:d482:b0:20c:c9db:7c45 with SMTP id d9443c01a7336-20d27eb3629mr111562105ad.20.1729174858464;
        Thu, 17 Oct 2024 07:20:58 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d17f9d436sm45007985ad.84.2024.10.17.07.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 07:20:58 -0700 (PDT)
Date: Thu, 17 Oct 2024 22:20:53 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v4 8/8] gpiolib: notify user-space about in-kernel line
 state changes
Message-ID: <20241017142053.GB242458@rigel>
References: <20241017-gpio-notify-in-kernel-events-v4-0-64bc05f3be0c@linaro.org>
 <20241017-gpio-notify-in-kernel-events-v4-8-64bc05f3be0c@linaro.org>
 <20241017125349.GB221864@rigel>
 <CAMRc=McjCinBEFNoHSTyFH7zU=JuyRfu1cfrOxkq=OjciKQkvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McjCinBEFNoHSTyFH7zU=JuyRfu1cfrOxkq=OjciKQkvQ@mail.gmail.com>

On Thu, Oct 17, 2024 at 04:14:24PM +0200, Bartosz Golaszewski wrote:
> On Thu, Oct 17, 2024 at 2:53 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Thu, Oct 17, 2024 at 10:14:16AM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > @@ -1447,8 +1450,6 @@ static long linereq_set_config(struct linereq *lr, void __user *ip)
> > >               }
> > >
> > >               WRITE_ONCE(line->edflags, edflags);
> > > -
> > > -             gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
> > >       }
> > >       return 0;
> > >  }
> >
> > I still get errors from this when reconfiguring lines with debounce.
> > You should leave this notify in place and use _nonotify when setting the
> > direction.
> > i.e.
> >
> > @@ -1436,11 +1432,11 @@ static long linereq_set_config(struct linereq *lr, void __user *ip)
> >                         int val = gpio_v2_line_config_output_value(&lc, i);
> >
> >                         edge_detector_stop(line);
> > -                       ret = gpiod_direction_output(desc, val);
> > +                       ret = gpiod_direction_output_nonotify(desc, val);
> >                         if (ret)
> >                                 return ret;
> >                 } else {
> > -                       ret = gpiod_direction_input(desc);
> > +                       ret = gpiod_direction_input_nonotify(desc);
> >                         if (ret)
> >                                 return ret;
> >
> > @@ -1450,6 +1446,8 @@ static long linereq_set_config(struct linereq *lr, void __user *ip)
> >                 }
> >
> >                 WRITE_ONCE(line->edflags, edflags);
> > +
> > +               gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
> >         }
> >         return 0;
> >  }
> >
> > Given that, all my current tests are passing.
> >
>
> That looks good - after all we no longer notify from any place in
> gpiolib-cdev.c anymore - but I'd like to learn what's wrong exactly.
> Are you getting more events with debounce? Are you not getting any?
>

In linereq_set_config(), the notify comes from the gpiod_direction_input() -
before the edge_detector_setup() is called (not visible in the patch) and that
sets the debounce value in the desc.
So you get an event without the debounce set, or with a stale value.
Keeping the gpiod_line_state_notify() and using the _nonotify()
functions means the notify comes after the debounce has been set.

Cheers,
Kent.


