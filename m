Return-Path: <linux-gpio+bounces-11557-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 170949A25F5
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 17:02:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB957283B16
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 15:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B428C1DED4E;
	Thu, 17 Oct 2024 15:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kVcjTUTf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2241D966B;
	Thu, 17 Oct 2024 15:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729177348; cv=none; b=bPt2DLOOgDyA+bQN3QWPJAho3KpdhpKr2g/vhBbV+NfosKxu9SvoYezEepnIHBj/XsB/0oKVXOqha7bKjQ7J0eVv71nI73kQ7es/RnYQcVb26IWruSiaS1uSytZWieoPmi8Up7sTcdFt1bm4/sIRI+d2LQ7LeOXjEx0fJrPMuso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729177348; c=relaxed/simple;
	bh=c+U48QVgTb45Soxm2r96FLpCj4UVBLV9uv9mx+i3GHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYx+fzaCkIrsIYHDnzYSyVqC2no8MB6NofgKTPztwyNZbKXVApZVCm8hjbPDh2HPdwCmRew7vEuKxn5j1UTY86WGr768u3xk3fwNj91fm5qz0kzFd8kq+xhcsq7aMEwxPk+MET51PsiaHK0HWCurp+CdwhXpJeoid8PoOAyzy3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kVcjTUTf; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20cbcd71012so9939815ad.3;
        Thu, 17 Oct 2024 08:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729177343; x=1729782143; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=By5LrVGQJ7SUgoS/IDlnafWFvBxuiZQT6c4rVlicH+8=;
        b=kVcjTUTffzOVUtfh/ZXXAa3wPY/xHQK1cZijzs1P+W0zRZorDNh5dy4AhdB/2zLnNF
         1n5QocNLmpQFLhW/VGqojVErfa+Jct48Eliicqk7jbc/HIsfFfM0O2wcWZV837sX6oYG
         6V2+6PiGh8kBDVNi4BtZTMqgNF3Gv1DjsKBlaQNNQePicrIf2YkHVIw76kNKY1Kj26iV
         R/+ThJJAGsGTgtKCc95s0D7Ay6V3Ll4VwxNTwFD+9MnGpy7owW011oK7lD3KEgZXjXHe
         IRpyECSa+fZyYephj0E5XYg+dRqZsQEHBj8y74Rdog6DejscHrLG1yqxvvzxx+EgR5Ji
         lvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729177343; x=1729782143;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=By5LrVGQJ7SUgoS/IDlnafWFvBxuiZQT6c4rVlicH+8=;
        b=cfA9vM4nDdI/sMEQmNKV38FJdvew2Xy9Jz1HhCXs9OKmPygxq3MX1LyV5GD/x3qVgB
         2WFxs/9mwOccYSCPGThi8aqwfpv2XFm8vxOZ0OmBb2opgBLmPNQHAzkW7mhlPZ+bXBEi
         UhKDP7KjPRDTxpCa95H4Ytfs4sTnBNZq+0cGDdxpC/4a2ZB9NaDYwLtv69e5MocJjkmf
         18pK96831YFI0JoGxdwt+VGPgoeQC2bPa/3232WNDlvILTzICT2mT4lCjxvYQYjJwh88
         wILWzcsFCFXOw8iSzkRniMERsE8S3W1fzLVCTUgiqfmngmUT1aRfaXPTIjCjPW6cR9MS
         DoOw==
X-Forwarded-Encrypted: i=1; AJvYcCWOu4q4p5fs/gEuMITsdVF2Xgbks65JWiU2nqIRKOM98rRuBybnvJb4eU/VU66BqaVWNk3j5SFQd6xYcEVw@vger.kernel.org, AJvYcCX+7X6uedJXyVFaGnRGmXyEgBBG6K3imR70lpbnJdBY+Wy1u5k2zbyX7kPhvcMIWh8iM/wx0mAzcCxH@vger.kernel.org
X-Gm-Message-State: AOJu0YxxnOdYJQikbsuwpoCelBCrQTpigOdZ1fpGtWCXNkBUvMN9oMHL
	WWAVRAEjhHqmDEFOusIalQr8vEO4MVhDVSZ2py0X7pTI47WWVYs5
X-Google-Smtp-Source: AGHT+IFGucgTJsNkiPqP4uS26G6H1vlEDv2F/L4gcqN73AsGpadqRbk5Yy7dph9ODLicjOME7Vuyzw==
X-Received: by 2002:a17:90b:1005:b0:2e2:e0c1:4452 with SMTP id 98e67ed59e1d1-2e31539036fmr21427092a91.41.1729177342755;
        Thu, 17 Oct 2024 08:02:22 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e3e094a1b1sm2033066a91.49.2024.10.17.08.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 08:02:22 -0700 (PDT)
Date: Thu, 17 Oct 2024 23:02:17 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v4 8/8] gpiolib: notify user-space about in-kernel line
 state changes
Message-ID: <20241017150217.GA262603@rigel>
References: <20241017-gpio-notify-in-kernel-events-v4-0-64bc05f3be0c@linaro.org>
 <20241017-gpio-notify-in-kernel-events-v4-8-64bc05f3be0c@linaro.org>
 <20241017125349.GB221864@rigel>
 <CAMRc=McjCinBEFNoHSTyFH7zU=JuyRfu1cfrOxkq=OjciKQkvQ@mail.gmail.com>
 <20241017142053.GB242458@rigel>
 <CAMRc=MeXe2XE_PEJm7iu1K7M=Tv0cWs2wd9pNzJk87dTyqGzeQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeXe2XE_PEJm7iu1K7M=Tv0cWs2wd9pNzJk87dTyqGzeQ@mail.gmail.com>

On Thu, Oct 17, 2024 at 04:59:46PM +0200, Bartosz Golaszewski wrote:
> On Thu, Oct 17, 2024 at 4:20 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Thu, Oct 17, 2024 at 04:14:24PM +0200, Bartosz Golaszewski wrote:
> > > On Thu, Oct 17, 2024 at 2:53 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Thu, Oct 17, 2024 at 10:14:16AM +0200, Bartosz Golaszewski wrote:
> > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > >
> > > > > @@ -1447,8 +1450,6 @@ static long linereq_set_config(struct linereq *lr, void __user *ip)
> > > > >               }
> > > > >
> > > > >               WRITE_ONCE(line->edflags, edflags);
> > > > > -
> > > > > -             gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
> > > > >       }
> > > > >       return 0;
> > > > >  }
> > > >
> > > > I still get errors from this when reconfiguring lines with debounce.
> > > > You should leave this notify in place and use _nonotify when setting the
> > > > direction.
> > > > i.e.
> > > >
> > > > @@ -1436,11 +1432,11 @@ static long linereq_set_config(struct linereq *lr, void __user *ip)
> > > >                         int val = gpio_v2_line_config_output_value(&lc, i);
> > > >
> > > >                         edge_detector_stop(line);
> > > > -                       ret = gpiod_direction_output(desc, val);
> > > > +                       ret = gpiod_direction_output_nonotify(desc, val);
> > > >                         if (ret)
> > > >                                 return ret;
> > > >                 } else {
> > > > -                       ret = gpiod_direction_input(desc);
> > > > +                       ret = gpiod_direction_input_nonotify(desc);
> > > >                         if (ret)
> > > >                                 return ret;
> > > >
> > > > @@ -1450,6 +1446,8 @@ static long linereq_set_config(struct linereq *lr, void __user *ip)
> > > >                 }
> > > >
> > > >                 WRITE_ONCE(line->edflags, edflags);
> > > > +
> > > > +               gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
> > > >         }
> > > >         return 0;
> > > >  }
> > > >
> > > > Given that, all my current tests are passing.
> > > >
> > >
> > > That looks good - after all we no longer notify from any place in
> > > gpiolib-cdev.c anymore - but I'd like to learn what's wrong exactly.
> > > Are you getting more events with debounce? Are you not getting any?
> > >
> >
> > In linereq_set_config(), the notify comes from the gpiod_direction_input() -
> > before the edge_detector_setup() is called (not visible in the patch) and that
> > sets the debounce value in the desc.
> > So you get an event without the debounce set, or with a stale value.
> > Keeping the gpiod_line_state_notify() and using the _nonotify()
> > functions means the notify comes after the debounce has been set.
> >
>
> I see. I guess I should do the same both for linehandle_set_config()
> and linereq_set_config()?
>

linehandles don't support debounce, so it's good as is.

Cheers,
Kent.

