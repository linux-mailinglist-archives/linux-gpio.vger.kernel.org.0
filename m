Return-Path: <linux-gpio+bounces-1731-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 618BE81A032
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Dec 2023 14:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D315283165
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Dec 2023 13:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE4F36B1F;
	Wed, 20 Dec 2023 13:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SOm0uf08"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4F7364C0
	for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2023 13:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4b6cdb1729cso745120e0c.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2023 05:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1703080076; x=1703684876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Rpx86TDGkyKCh1KoU86Rs0GjXZN/8zMfFkGEuBxOWA=;
        b=SOm0uf08sIy3DftbBrnHwUGa0nC88Pmu7B/snF6HC4bY7itCrNyXE0SKIIcBfdqgH5
         sBatMBoijZjyvvRUKtxwOXFbPxPJx5zL8C8k8SR0FFjayiiJQOaaOCzPFCXIeVXUlZ0m
         EK2x9YmsXVf4PSbMxJAgeBevcsKbDemNa730H+ObJzxWA0jXYoSnf9krz4+B6q597Go9
         m7VxKnIh3NKfxN0H0wIdMInoAo2WV6znKPohB4VgOn1LKehkAr8ypxEPAWr6P1m6QMpo
         3EJ7oCSf/RSvb7yr/1HBn8acvnrlghpUv15uwCz1a6EEyqaJGWIVHfzh+JqmwuRU94Lz
         8+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703080076; x=1703684876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Rpx86TDGkyKCh1KoU86Rs0GjXZN/8zMfFkGEuBxOWA=;
        b=pVBQSyHYUlUTfCT566qyt5e7/CTKQxWZ+62tOoNldT7tU7wcicaI3CoYjD9WhCjWb3
         g1IO0dciw4iOaGIlzbT1+F3EZi5YSi1ejCfTxsy35CDd31Ir0hFmV/6tIKA008kHaLUP
         ALE/gfEoqg5Lb4G0qI5BbTO87VIFkDn8xDf+RlFE75GiGoi5WzBx8JQrMjh8gdO0vWD9
         bRr675HZh+nKXdqdAmdKLvrz8LyAhTmiNg/b+4f8Ic94s+2+8C5KIM/INTvjjWVY2ab2
         Q9jLyXsg68Gjx9q/UruTt8oBh8iW2SCS9F5YKMwS7R4cczN3WtPuYe/gUn+eBlhpfcCz
         TBig==
X-Gm-Message-State: AOJu0YwgUwpuIzrWivYt/10fEJy8/AmDySNA5nn93gnXoHFknGr0wmfk
	nHZgRMtlIA42VtpPDEtDXoV/ZmBgtHlucDJsRHl1PA==
X-Google-Smtp-Source: AGHT+IGp1MNFiV3xzJ3WLnvvdWs0aa+08PNxuiZtZ+di+fhoVkJOcDsy/rn1TKxiViwMbXUGZPzjWiZu+orHMGolc8c=
X-Received: by 2002:a05:6122:1b85:b0:4b6:f13f:8cd7 with SMTP id
 es5-20020a0561221b8500b004b6f13f8cd7mr938264vkb.15.1703080076171; Wed, 20 Dec
 2023 05:47:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231220015106.16732-1-warthog618@gmail.com> <20231220015106.16732-5-warthog618@gmail.com>
 <CACRpkdZ5HzOxtbexQNE-A-bKhiUW1nHjvJQA_CCnmVXf+R6dbg@mail.gmail.com>
 <CAMRc=MfvKzOxPrmz1wmgWMwYUbNhWAjqoKOmcaggQntcDprLmQ@mail.gmail.com>
 <ZYLaayENrvL1Nh6H@rigel> <CAMRc=MfyCBpZ07SYfxMtug6FVYiKA0MRgvjMTOAzKiVLGdPM+w@mail.gmail.com>
 <ZYLczeiVDjd2cWQF@rigel> <CAMRc=MeXa5g6iQNYF4W+vGL+kgRTyVjFB-yXE_UBpuTnn2ZKng@mail.gmail.com>
 <ZYLjuqxXylKPYeYP@rigel> <CAMRc=McNMLmiUsGj8HmCqiwv-9K6EbMrmHpHMaMeFHx9BFX8gQ@mail.gmail.com>
 <ZYLr-LrZ_NurJXHi@rigel>
In-Reply-To: <ZYLr-LrZ_NurJXHi@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 20 Dec 2023 14:47:45 +0100
Message-ID: <CAMRc=MdvPA7Km-029-AF36Vh7sWs-j3ft+equiGVMg4_Na3LgA@mail.gmail.com>
Subject: Re: [PATCH 4/4] gpiolib: cdev: replace locking wrappers for
 gpio_device with guards
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 2:28=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Wed, Dec 20, 2023 at 02:19:37PM +0100, Bartosz Golaszewski wrote:
> > On Wed, Dec 20, 2023 at 1:53=E2=80=AFPM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > On Wed, Dec 20, 2023 at 01:30:57PM +0100, Bartosz Golaszewski wrote:
> > > > On Wed, Dec 20, 2023 at 1:23=E2=80=AFPM Kent Gibson <warthog618@gma=
il.com> wrote:
> > > > >
> > > > > >
> > > > >
> > > > > It would be read and write guards for the gpio_device.
> > > > > cdev would only be using the read flavour.
> > > > > And possibly named something other than read/write as the purpose=
 is to
> > > > > prevent (read) or allow (write) object removal.
> > > > >
> > > > > I though that would be clearer than having to reference gpiolib.h=
 to see
> > > > > what gdev->sem covers, and allow you to change the locking
> > > > > mechanism later and not have to update cdev.
> > > > >
> > > >
> > > > I still prefer open-coded guards here for clarity. I hope that with
> > > > SRCU in gpiolib.c, we'll get rid of locking in cdev entirely anyway=
.
> > > >
> > >
> > > Ok, it is your object so I should use it the way you want it used.
> > >
> > > Btw, before I go pushing out a v2, do you have an answer on whether
> > > gpio_ioctl() requires a guard, as mentioned in the cover letter?
> > > Is the fact there is an active ioctl on the chardev sufficient in
> > > itself to keep the gpio_device alive?
> > >
> >
> > AFAICT: no. I think it's a bug (good catch!).
>
> The wrappers made that harder to pick up.
> It kind of stood out as the exception after changing the other ioctls
> over to guards - where was the guard for that one?
>

Yeah, it makes sense. This is precisely why guards are so much better
than hand-coding locks.

> > Can you extend your
> > series with a backportable bugfix that would come first?
> >
>
> Sure.  That would still use the guard(rwsem_read)?
> I mean you don't to go adding a wrapper for the fix, just to
> subsequently remove it, right?
>

In master - sure. But we definitely do want to backport that to stable
branches and for that we need to use the old wrapper.

Bart

> Cheers,
> Kent.

