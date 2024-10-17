Return-Path: <linux-gpio+bounces-11560-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7529A2628
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 17:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F6A41C21643
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 15:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159DE1DE4E2;
	Thu, 17 Oct 2024 15:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dI1dX0gJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F0D1BFE18;
	Thu, 17 Oct 2024 15:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729177947; cv=none; b=b5n6ywg0SuRWma/7xuKoX4ZVdU0WiuZ7FMxnA7FQ9equ+hk5+2K9ZZcLmG0GDHC1JHhXdjfdPSm3lWj7RrIPfLMDywjmgIrpfTTqcyS5FBRYtQZB4drvDN1stzI8fWxW9xGezSdzGDwEDG95KSUJun/U7VDYvUCWzUtHG93YoEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729177947; c=relaxed/simple;
	bh=3/l/H9hXEkJikgLfAi0IjPLof29qAwAIfYSOGhV/fSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rIq3aLAmX+91MXn4YwJLqxI7etcpuB9AaBZ1Fot8wN/VaIGs3wLYapMA/vIa9gP2dHAOQ8dTPywGWtUvc67i2IAPLqUMCaK07+k+JuI81lrF8MH5/crEwnrVSiEP4N+B3OsqIPZA4u9oaqeBTBKmgQ8fuTWqMlYTY8AW2a7iEaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dI1dX0gJ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20caccadbeeso11798785ad.2;
        Thu, 17 Oct 2024 08:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729177942; x=1729782742; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rffj0ZUEHOul+t9qn5Q2dRlgnxSveJ+h4MaJ5aZFN1c=;
        b=dI1dX0gJEp75Q1oe6XWrfMBJ1ClDdS+1FHlkwgfzW8TS1ZbzJ6JBkvnIMEsktVqC2t
         Eh5wAhYmEBo1tNDUJiULpcnt/JXvhrci4qZl1fX1ba+8VLn3p5ZmyGrClGd1yyqLl3+Z
         e1s1kmZal9aca2a0i0pwlpD+sEvQmM7Hn0bWQxqA/8jOWY/9SNtNozfpK4g7JEsdWN6Z
         tniOHKrwQCWcXr4X44RNgB+L6s1aLhF0jfgA+T6FcJ94NARxth8rxCTF3n1sl+h/tIbJ
         BNj8ICRj3huubhOaNm0jQ3am/buNbSj4ssn1H2s9GSYnJ5Maxzc17U2c1kzqUULMg0oI
         N7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729177942; x=1729782742;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rffj0ZUEHOul+t9qn5Q2dRlgnxSveJ+h4MaJ5aZFN1c=;
        b=CeW3SP6/aszWySybNXDk+qFkrNAdzrDkt7owyU92vQg1G4/n0KBTw+7Kn+dZW2YPG+
         nJQUj+YYgUdwP8RsH0TFEIzigwCn7kGvhdxC5ZvYkMCNtAv4NRSMYSh1KDZOsltYua9Z
         3y3WBroqIhlkvpFyIZyUeo8N2cP4hlq40yB/MTAy37fxObqsjIxaqqprNnSvsBTwihSQ
         MsJAqLqZtr/mFQ4dFJ6lhl4tAFxZD73lq2F9KD5eMXYlt0NbkZJ2Tnwza7lJk00J2FsI
         ltodxqQyDnjeuC0oiT57igbKlAQAanaSK/Y3OpuLpJjVG8i0eJjqHOSz7IV4/rYp0IBr
         DsWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPKbw/l4T1dknKKMn5VD37WIXrvW8kZcKXI5hvoaB9umJ+bW9/9yoDwUrdf27xNRF56Y1Va/x/Ts96e0h3@vger.kernel.org, AJvYcCXZV3IjyRrEnhW4zTmxMEgwGwcdnb+3k4L2pXpq77PQVyLVYhAUd3kR5h1/V2oFUkpdcv64Rer2Ux2j@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbc+BoqhGfcCPmdEG4O5maGiH31s3vgB43qejMxEdGCDb2pjmQ
	hCT9aujy6UKGUM7JKolqcy7CGXGR+BdUaZPwK6QifR1SZQfR+GiaoHf/yA==
X-Google-Smtp-Source: AGHT+IHs+lCCGMsY7gtwMgd2skVYLnH/WaebJzEFJjh7hgkN5v54jwCocHTMiZ7C6vdYJyVcEEe9Dg==
X-Received: by 2002:a17:903:986:b0:20b:707c:d688 with SMTP id d9443c01a7336-20ca145962bmr282678465ad.18.1729177942231;
        Thu, 17 Oct 2024 08:12:22 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d1805ca60sm45252715ad.239.2024.10.17.08.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 08:12:21 -0700 (PDT)
Date: Thu, 17 Oct 2024 23:12:17 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v4 8/8] gpiolib: notify user-space about in-kernel line
 state changes
Message-ID: <20241017151217.GA266034@rigel>
References: <20241017-gpio-notify-in-kernel-events-v4-0-64bc05f3be0c@linaro.org>
 <20241017-gpio-notify-in-kernel-events-v4-8-64bc05f3be0c@linaro.org>
 <20241017125349.GB221864@rigel>
 <CAMRc=McjCinBEFNoHSTyFH7zU=JuyRfu1cfrOxkq=OjciKQkvQ@mail.gmail.com>
 <20241017142053.GB242458@rigel>
 <CAMRc=MeXe2XE_PEJm7iu1K7M=Tv0cWs2wd9pNzJk87dTyqGzeQ@mail.gmail.com>
 <20241017150217.GA262603@rigel>
 <CAMRc=MfrGynY0J6ozG0B9GiPJgqLJywaT-Fw0_O3zZNKrsALAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfrGynY0J6ozG0B9GiPJgqLJywaT-Fw0_O3zZNKrsALAA@mail.gmail.com>

On Thu, Oct 17, 2024 at 05:04:13PM +0200, Bartosz Golaszewski wrote:
> On Thu, Oct 17, 2024 at 5:02 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Thu, Oct 17, 2024 at 04:59:46PM +0200, Bartosz Golaszewski wrote:
> > > On Thu, Oct 17, 2024 at 4:20 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Thu, Oct 17, 2024 at 04:14:24PM +0200, Bartosz Golaszewski wrote:
> > > > > On Thu, Oct 17, 2024 at 2:53 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > >
> > > > > > On Thu, Oct 17, 2024 at 10:14:16AM +0200, Bartosz Golaszewski wrote:
> > > > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > > > >
> > > > > > > @@ -1447,8 +1450,6 @@ static long linereq_set_config(struct linereq *lr, void __user *ip)
> > > > > > >               }
> > > > > > >
> > > > > > >               WRITE_ONCE(line->edflags, edflags);
> > > > > > > -
> > > > > > > -             gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
> > > > > > >       }
> > > > > > >       return 0;
> > > > > > >  }
> > > > > >
> > > > > > I still get errors from this when reconfiguring lines with debounce.
> > > > > > You should leave this notify in place and use _nonotify when setting the
> > > > > > direction.
> > > > > > i.e.
> > > > > >
> > > > > > @@ -1436,11 +1432,11 @@ static long linereq_set_config(struct linereq *lr, void __user *ip)
> > > > > >                         int val = gpio_v2_line_config_output_value(&lc, i);
> > > > > >
> > > > > >                         edge_detector_stop(line);
> > > > > > -                       ret = gpiod_direction_output(desc, val);
> > > > > > +                       ret = gpiod_direction_output_nonotify(desc, val);
> > > > > >                         if (ret)
> > > > > >                                 return ret;
> > > > > >                 } else {
> > > > > > -                       ret = gpiod_direction_input(desc);
> > > > > > +                       ret = gpiod_direction_input_nonotify(desc);
> > > > > >                         if (ret)
> > > > > >                                 return ret;
> > > > > >
> > > > > > @@ -1450,6 +1446,8 @@ static long linereq_set_config(struct linereq *lr, void __user *ip)
> > > > > >                 }
> > > > > >
> > > > > >                 WRITE_ONCE(line->edflags, edflags);
> > > > > > +
> > > > > > +               gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
> > > > > >         }
> > > > > >         return 0;
> > > > > >  }
> > > > > >
> > > > > > Given that, all my current tests are passing.
> > > > > >
> > > > >
> > > > > That looks good - after all we no longer notify from any place in
> > > > > gpiolib-cdev.c anymore - but I'd like to learn what's wrong exactly.
> > > > > Are you getting more events with debounce? Are you not getting any?
> > > > >
> > > >
> > > > In linereq_set_config(), the notify comes from the gpiod_direction_input() -
> > > > before the edge_detector_setup() is called (not visible in the patch) and that
> > > > sets the debounce value in the desc.
> > > > So you get an event without the debounce set, or with a stale value.
> > > > Keeping the gpiod_line_state_notify() and using the _nonotify()
> > > > functions means the notify comes after the debounce has been set.
> > > >
> > >
> > > I see. I guess I should do the same both for linehandle_set_config()
> > > and linereq_set_config()?
> > >
> >
> > linehandles don't support debounce, so it's good as is.
> >
>
> Right, but I'm wondering if it isn't better for consistency.
> Otherwise, someone may ask themselves why there's no event being
> emitted if they're not familiar with the gpiod_direction_*()
> internals.
>

I prefer the more succinct form myself, and if you are working in the
kernel you should be capable of determining what the functions do, but
whichever works for you.

Cheers,
Kent.


