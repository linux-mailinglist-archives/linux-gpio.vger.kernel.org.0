Return-Path: <linux-gpio+bounces-3168-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EE4850416
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Feb 2024 12:08:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B13828615A
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Feb 2024 11:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E79036AF2;
	Sat, 10 Feb 2024 11:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MSHE69aY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B074376F2
	for <linux-gpio@vger.kernel.org>; Sat, 10 Feb 2024 11:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707563273; cv=none; b=jkl1He269KLQldmPbTpVzYRACLX3WGGG95iaq9uaIH8K1jPgz9fs1sy/e+hple3fRUmAV2woaZAyAFYy138obZpBKPg1NhDpuHJrIKwDCFwQjZNzariHblUphTH4hazL5sZjUpc1rA/O3OrkDqkEIUDEpqWdvEscegCebjfS6VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707563273; c=relaxed/simple;
	bh=ctXQBo58n7cMBYn+bE4PgohJoraE6MPOMpZUkB7Qw5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BM8netvpHYBNqpc7T5Xd2bX6uZ4nrOqx+Taj9xrP3K4P05n6p5IJzYvQxVYA6TrjauzF2SaqPiBvvnidMf2rLUl46byLcVp3FSsm7+fdxlx2UWDndmi3SqLij6SsnfTmKqclfbw94Oou5QVvp96pdHlCjIsNg5pHlxOr0W9rHcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MSHE69aY; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-7d2e21181c1so853790241.3
        for <linux-gpio@vger.kernel.org>; Sat, 10 Feb 2024 03:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707563270; x=1708168070; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsm2tEPYKEgW6cEX68WW3Yx7RVgTbGyckgrh2z8CJ7g=;
        b=MSHE69aYn8sHF31C4u5m61AHQM7cRVNvB8reYX70GGfCiRvZs8Oe43VxEsW0PtZPHX
         Kkp2nOAKFGeuSiOr1/tpS+UmcmWtTAdwixN3A74tPM93ZhUJ1c982yM42Nl4Vtb0Ahyf
         88Gn+ejrqK5+GAvZOSDGZFYtIdf7LKYNYt+3g6w0XVr4w/hgEac453JmIx3oyoKMWObX
         StSmpWyuRvQ7pNgD+VUzhfdAOBetxblvIA5UYr+ebYXyK1mh/DFxqQbWGd1wSMcJmWJY
         YBdQ6qB4AkToOF+azYeq8GXz0Oyq97cB4b9iT0zD2AND/0RM+Fc1wnRIepmTAfxOjIZ/
         DQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707563270; x=1708168070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nsm2tEPYKEgW6cEX68WW3Yx7RVgTbGyckgrh2z8CJ7g=;
        b=K18a+8qWJKzrVrTq3Jdnxi1z44kxJvL+/S+h0v6AUL9cNCcqTXBgpUb7mi6bibJDqR
         adiEVg1qejL6mqIHKO+Q4O8tKg0jRuEXtcQc30M2WFT+LmZDgP/mjG1iJIAw0SNkr/qg
         Q1i2XaICmO+iPacSgGFXGWL2+jLGaESePfcCmSJ/SfM1AELMAwGK1SCDwBU0YsL/O04h
         Ke3jNDwhp5bfYMWt118cfuR7YYiJpIb1uHfgi/PTpiqE94cM5JNsnTafwzR+4EQy3mHU
         RSjKx2zFcmNOnZ8DQdi9zOj7P99Jsd9cyICACPuasvfCZy8DM1IWOO8r4ZHjFn35nuxf
         sizQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjUThSYRBoL9vBig0B2AmIy3KrnRv8OvkfAeFX1f3oq3TEDpE5+xMCQaBa97xuK4Wf27LfG4yLuffjJ5/IkJ/PWbd2c5oz67B9yA==
X-Gm-Message-State: AOJu0Ywq50xUXVIo9CXs/yNZ4cOI/o8ktQGPUdzAUMZCd+GBDWXR5GO3
	FZpBfKY0CxVL5WpT1ICwUozBmC+iEq9VFh8StfaRzaf6lxMF9qXWq5UWSEBA4+qHa4q1zLwvO47
	VOjrTpDm0n9qxIt9Sz6UfoJfKHoWrrrzUkRflLg==
X-Google-Smtp-Source: AGHT+IEAFG/Qa3AvkUwty21ETlqJzfOSzW2WTAImfTGslFJ/Gq5J2quKVu0/vPOz8BkrR2Y5/oJTwC/Tsk4Ha4OkecA=
X-Received: by 2002:a05:6102:1147:b0:46d:1f47:8a33 with SMTP id
 j7-20020a056102114700b0046d1f478a33mr1384506vsg.30.1707563270353; Sat, 10 Feb
 2024 03:07:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208095920.8035-1-brgl@bgdev.pl> <20240208095920.8035-2-brgl@bgdev.pl>
 <20240210110043.853-1-hdanton@sina.com>
In-Reply-To: <20240210110043.853-1-hdanton@sina.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 10 Feb 2024 12:07:39 +0100
Message-ID: <CAMRc=Mc2MjvicHyWrt813LRHqzfexUUcR49N6+JF62f5tPYt0g@mail.gmail.com>
Subject: Re: [PATCH v3 01/24] gpio: protect the list of GPIO devices with SRCU
To: Hillf Danton <hdanton@sina.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa@the-dreams.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 10, 2024 at 12:01=E2=80=AFPM Hillf Danton <hdanton@sina.com> wr=
ote:
>
> On Thu,  8 Feb 2024 10:58:57 +0100 Bartosz Golaszewski <bartosz.golaszews=
ki@linaro.org>
> > @@ -382,11 +389,13 @@ static int gpiodev_add_to_list_unlocked(struct gp=
io_device *gdev)
> >               /* add between prev and next */
> >               if (prev->base + prev->ngpio <=3D gdev->base
> >                               && gdev->base + gdev->ngpio <=3D next->ba=
se) {
> > -                     list_add(&gdev->list, &prev->list);
> > +                     list_add_rcu(&gdev->list, &prev->list);
> >                       return 0;
> >               }
> >       }
> >
> > +     synchronize_srcu(&gpio_devices_srcu);
> > +
> If not typo, could you shed light on why this sync is needed?
>

No it's not a typo. I'm not an expert on RCU but I figured that right
after we add the new element to the SRCU-protected list, we need to
wait for all read-only critical sections to complete before
continuing? Is that not correct?

Bart

> >       return -EBUSY;
> >  }
>

