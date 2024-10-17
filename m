Return-Path: <linux-gpio+bounces-11553-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 515CD9A24F0
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 16:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8CB6B25095
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 14:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91A731DE3CB;
	Thu, 17 Oct 2024 14:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9VbtxVo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC051DE3AC;
	Thu, 17 Oct 2024 14:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729175118; cv=none; b=B34IkA76MThdDEBIW57iZTJSgQ1Rz71ib+btbDfof2mDb0Y3vFjf2ulQReN0IqIlbajXbEiYvb663aP0K2M92dESjYO6ltxwfvHEcUhM+PdA2EKcAhdLXXoBgVs37BLtYjqeIzYq8zb++VXNnGldmkznoClk5zhF+AlJEEziunU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729175118; c=relaxed/simple;
	bh=COGNHAe7lodcFPyYT18oj6HIzA5I3YsAW3eM8hHWXTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vyrn0vI4hX4pjQEOqTOqC9sVXWec+R0T6e3n70RYnPR0uOLwfbehoC+FMsBqEyPk5oDLUlgn1WNrtmTStFDNK4DPs07EeCB8kWjvXNOnuQ+y7i0OFrFGGEkKc9EQHXtoaU+o94UI8v4+emitwsW2JHzN0OFqCMt09D+m20CTp0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9VbtxVo; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3a3bb6a020dso3971475ab.2;
        Thu, 17 Oct 2024 07:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729175112; x=1729779912; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KOtiT9HVH6rqSS6Gsqti/X1HA3JpMBABi60k7f393as=;
        b=X9VbtxVodfM5lYQzCZ+YjgAtXDu4Fd+sKUBn94HS6CwxtbItXmoflfkpeWdPzdQOQs
         JBMIksaC3bixhMZISMwMai9NPc/zQln/Gmq56+4ybu7Ssyuc3Mp7KucoGvLqrrzTW3T9
         Kjw2KL0/yq9QTh4K3R841l191Z90kh8fswLJdchy9F34RfG1HA34klzLyVh8XvFqrCum
         4IQlfyPvDCq11O09yjKVfQxYhOY7+pStat04yXgsWwGPdIiraPxq+/gcFhnYLmRVcfZ5
         dwfPHCGxJ/O4YiL4IT2hx1Ybfxz0koZYGz9yUlegfBbqtXwBk02pxvKXRlQYEVjipWcM
         yJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729175112; x=1729779912;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KOtiT9HVH6rqSS6Gsqti/X1HA3JpMBABi60k7f393as=;
        b=JuBAoTa24mw32aBP+NP15mlK+Ksd0z87pEIhKDulLPQl/p44Yiof+hcoDadYPsNsK1
         PfvWUhmwoTCoL8L1z9Iq07ShBfFAM762mtnTXcxoraI493w/smCPcYjarp3ofqgCp5RO
         nPUDpo3l3uxvyEt9qJq/HE70daR1b+aLchigspEJv+gIZYLuU7fcjl9hypjuYJfWKea9
         dBNvGUGKhqGb1Z8Q1S0niSyIPzkg4Xzq0BXCgQ17Wwr3Era+YdX3o1YD2hPq0y++yqmw
         8EyWmo1w6issu8dqUdP74Y6u0Y4YKqXfed/rijbvsHojgLLHqzVd6ur/mbja4bat8edm
         5ePQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlxnUwVVM+ue8pZHWAhZq2mjfxfQCfz9s7AtDfgmfFKqOXNW4fiCO5KVyJoyb7oEMF44L+bnKrnm8e@vger.kernel.org, AJvYcCV2ISOk4tBBKRQ2Xwg/HHmlFmV6I7jDqD/+rx1maTX3sha7Zttc1y7rH3aBa5fspROM9Sspq0r0Y3Kl6Wmx@vger.kernel.org
X-Gm-Message-State: AOJu0YyssPe9b2Ig2I7ZkdK+u3YRBqjxH3+j8LWP2DnnhPNcgPJrNB/g
	nX0tf3A/59adcAJQR7ZbPVC0HuGUM9WzZ3OYAhhjs55a5q3U0iIoRLLH0A==
X-Google-Smtp-Source: AGHT+IFQy6XuSUqGxOu0tqgyRW0RqxHIjLS7p8ncuS58xfOJUQT76Tr1A+O/qS1tR1Mh+o22lsptgg==
X-Received: by 2002:a05:6e02:1a0b:b0:3a3:b4dd:4db with SMTP id e9e14a558f8ab-3a3b5c73b7fmr243339385ab.0.1729175112313;
        Thu, 17 Oct 2024 07:25:12 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea9c6c10aesm5062982a12.21.2024.10.17.07.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 07:25:11 -0700 (PDT)
Date: Thu, 17 Oct 2024 22:25:07 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v4 8/8] gpiolib: notify user-space about in-kernel line
 state changes
Message-ID: <20241017142507.GA247028@rigel>
References: <20241017-gpio-notify-in-kernel-events-v4-0-64bc05f3be0c@linaro.org>
 <20241017-gpio-notify-in-kernel-events-v4-8-64bc05f3be0c@linaro.org>
 <20241017125349.GB221864@rigel>
 <CAMRc=McjCinBEFNoHSTyFH7zU=JuyRfu1cfrOxkq=OjciKQkvQ@mail.gmail.com>
 <20241017142053.GB242458@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241017142053.GB242458@rigel>

On Thu, Oct 17, 2024 at 10:20:53PM +0800, Kent Gibson wrote:
> On Thu, Oct 17, 2024 at 04:14:24PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Oct 17, 2024 at 2:53 PM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > On Thu, Oct 17, 2024 at 10:14:16AM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > @@ -1447,8 +1450,6 @@ static long linereq_set_config(struct linereq *lr, void __user *ip)
> > > >               }
> > > >
> > > >               WRITE_ONCE(line->edflags, edflags);
> > > > -
> > > > -             gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
> > > >       }
> > > >       return 0;
> > > >  }
> > >
> > > I still get errors from this when reconfiguring lines with debounce.
> > > You should leave this notify in place and use _nonotify when setting the
> > > direction.
> > > i.e.
> > >
> > > @@ -1436,11 +1432,11 @@ static long linereq_set_config(struct linereq *lr, void __user *ip)
> > >                         int val = gpio_v2_line_config_output_value(&lc, i);
> > >
> > >                         edge_detector_stop(line);
> > > -                       ret = gpiod_direction_output(desc, val);
> > > +                       ret = gpiod_direction_output_nonotify(desc, val);
> > >                         if (ret)
> > >                                 return ret;
> > >                 } else {
> > > -                       ret = gpiod_direction_input(desc);
> > > +                       ret = gpiod_direction_input_nonotify(desc);
> > >                         if (ret)
> > >                                 return ret;
> > >
> > > @@ -1450,6 +1446,8 @@ static long linereq_set_config(struct linereq *lr, void __user *ip)
> > >                 }
> > >
> > >                 WRITE_ONCE(line->edflags, edflags);
> > > +
> > > +               gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
> > >         }
> > >         return 0;
> > >  }
> > >
> > > Given that, all my current tests are passing.
> > >
> >
> > That looks good - after all we no longer notify from any place in
> > gpiolib-cdev.c anymore - but I'd like to learn what's wrong exactly.
> > Are you getting more events with debounce? Are you not getting any?
> >
>
> In linereq_set_config(), the notify comes from the gpiod_direction_input() -
> before the edge_detector_setup() is called (not visible in the patch) and that
> sets the debounce value in the desc.

That should be edge_detector_update().

> So you get an event without the debounce set, or with a stale value.
> Keeping the gpiod_line_state_notify() and using the _nonotify()
> functions means the notify comes after the debounce has been set.
>
> Cheers,
> Kent.
>

