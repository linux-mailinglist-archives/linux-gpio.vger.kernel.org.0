Return-Path: <linux-gpio+bounces-11549-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0059A24AD
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 16:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22D00B28272
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 14:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30231DE4C0;
	Thu, 17 Oct 2024 14:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ry8SfnEC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F178B1DDA39
	for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 14:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729174413; cv=none; b=b9S9nw5KUZBnZnq6QaZJsTBQzyqJjboKWqnfr9UPEwbT/TPhalqbjL6bzIF3zt9MX0WvyM5MmupvTfQCn60AYJc3oBd3OH1dDInwN0Opp4n6H+g3iSb7+L+TsZz1/E7OQ4cwYdkTBvFJC6BDcz36vIW3fDlSJp6sKfNBCZTLgSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729174413; c=relaxed/simple;
	bh=MYY3u3m0sN8eT40Xyy56cy89iT3Em1o4v5OIylPyLAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XZSJ4H51PMYAxn+VlVY5N9JjA6eb+toqvNMsxtVdzMwPG61uewqeBavXnXcBq7GmpU8XKN7gWtrLIDnE3QF8dPrV2HwiHQKu57k+nrwsff+WCx1HHmBqGtpjt2QU64PCVFXoHChF9dIOfcq/EKsvUlF8kgmm+brweSlw7UCSWZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ry8SfnEC; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb3c3d5513so11307761fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 07:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729174406; x=1729779206; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6QmPAb0BP9OyVfiaktWLNoUa/mBBCtoitGiIVZn3pg=;
        b=ry8SfnECCYY3BqOSSEQIludksINHZXh/ELUAPEWc5I52mZ9+w/ab15j9JIO6x8dxQM
         XvrWSNh2Hd9gVDE95JZEoQXx/GiPIHcq+NsBLkt7yQ8jmEG0DJfbAAjh/DRQ/3833+35
         5Ceuo8Fj0QCY7weOURMsZLHA3wm9RhtJTG8aBT/ss5XyVphIOmPQX5uslm5azgUEPkls
         h4E1jyUO1O167/iFXSQO8qf3z+KYUbQHy3V+z8O06+zE13Vf4hI3TS5Z8wfQMTMkLKnz
         bPTjfW7gibiqWJxw3qFoAOFdnHRPy4TSO4FCsgALMyW82MoRFTsH5cwuGMWDxxIUUvqk
         M5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729174406; x=1729779206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f6QmPAb0BP9OyVfiaktWLNoUa/mBBCtoitGiIVZn3pg=;
        b=t5ukUURG/IQlbqe0dBKhwJzfPAN2+51fnP9Ye/DK7cyKfjXMUlCVXdJbaTucXKSpAv
         BI9hzpLNW1gfvbMx5TqTz/rUzTrlLDZThmAGtXBMRa97OMX53emZGURKCc3+iPYod/zP
         1UVHWxkCNLZjqG92vphDoPZgCgbmdxsnf7iOFwbEYHI1K7XahWP/2RXyHGOt944Ptur9
         3/rrUGhM3pEv3svvv5OYBw/gsmUL6vhfCHpt+5gbooA4bQmyhKPOvj4Dz2Ps2Y/sVz2Y
         aDZse8sZ7f+J284HIJXpQ85rQYGMfoYUhSOMa8yZqjRLkXcK/0D71WisN6PUErzy36aZ
         FZBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfN1Vt3LaZ33uv6L2uYeLwAdv9Gl44K12kXq1TDS5HpZ6t0Gie9CeeKV3gCQLZblI8szR8eASxAp2D@vger.kernel.org
X-Gm-Message-State: AOJu0YykhSFdKzbgKmCijxKSuTyxYoKGBQog6kjqCw8GzyNMkh8+NhBR
	PeSjiAizVjduztFg46WGBIikZibF6SeQYvsToRoUB5/ttzr35JuXwdl9hTmpOoLDJOAGidP/9Ma
	Ed9I8/X+ot7dwwx5d7KFa/oKGsYvdAzibR4xc6Q==
X-Google-Smtp-Source: AGHT+IGasRlVWjg0DCU29pOCQDPpJv3KcR3BzhWJdTreoQf1bl0s7y4P6K2Scm5i1P1Syk2YxvoA5cnplesvFBL3WF4=
X-Received: by 2002:a2e:be21:0:b0:2fb:50e9:34b4 with SMTP id
 38308e7fff4ca-2fb50e93dfamr75902601fa.8.1729174406069; Thu, 17 Oct 2024
 07:13:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017-gpio-notify-in-kernel-events-v4-0-64bc05f3be0c@linaro.org>
 <20241017-gpio-notify-in-kernel-events-v4-3-64bc05f3be0c@linaro.org> <20241017124418.GA221864@rigel>
In-Reply-To: <20241017124418.GA221864@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 17 Oct 2024 16:13:14 +0200
Message-ID: <CAMRc=Md=6WkwJRt7-7K0fTqOUMz3EzzOGLPbiq2SEw1+1Acc4A@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] gpio: cdev: go back to storing debounce period in
 the GPIO descriptor
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 2:44=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Thu, Oct 17, 2024 at 10:14:11AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > @@ -1047,7 +925,7 @@ static int debounce_setup(struct line *line, unsig=
ned int debounce_period_us)
> >       /* try hardware */
> >       ret =3D gpiod_set_debounce(line->desc, debounce_period_us);
> >       if (!ret) {
> > -             line_set_debounce_period(line, debounce_period_us);
> > +             WRITE_ONCE(line->desc->debounce_period_us, debounce_perio=
d_us);
> >               return ret;
> >       }
>
> Not related to this change, but this check looks redundant to me - the sa=
me
> is performed where debounce_setup() is called.
>
> Want a patch to remove it?
>
> Cheers,
> Kent.

Sure! Can you rebase it on top of my series?

Bart

