Return-Path: <linux-gpio+bounces-12459-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 341989B9164
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 13:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFC691F22741
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 12:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9297D19E7F7;
	Fri,  1 Nov 2024 12:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1De2YMJz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A56D199E94
	for <linux-gpio@vger.kernel.org>; Fri,  1 Nov 2024 12:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730465808; cv=none; b=QIjIUpaiKmriN4dkdbyzNhQBUFkgaNI9pJ2zvVa0A5Xvck4HltyatamEJb0M4PN6X9fvtR6bY5LhaeRZsC5IwPUxkBDVUfYlUrjg4Wi7o6Aw5hx1lDXB5Qoot7cteR2pWmO2QLMS5gFo8qTRKGmC6cC++x+r75mG9OJIeOiT1BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730465808; c=relaxed/simple;
	bh=gTqZJ827CF4psA8k3dkMwZbTk/mKzRLSWPTcMyg0Avo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c8Lrq+M+XwSc6nKMHeGMO5NSG57bkba+73V02tOUdBuOesWpQUoyrMm4xfX6lxEtZ4J2cbqhD/WplUKfLGimjniA8hlWvL/v2gTLs781NGMp1yY65jLixmZHbioshX+fLhb5C3tGuT0CyzvXCyArrsiZAq2qpPnfM4Dz3zNaAww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1De2YMJz; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53c78ebe580so2035065e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 01 Nov 2024 05:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730465804; x=1731070604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcbC5Kzt7xtHst+nDuMhIvjMwvrGD5IjyhOSr65wC/I=;
        b=1De2YMJzdYKid+RNL7Cq86PVqh5o3v5DIIiOsHT1aD1rW/jWs+hzSzsVxhGeGjrYUq
         rFUlgjqd6RUYrehxVRF/sw3MHMtuKGgsdj6C+IGqJVjdMunoc9CiuRTI7wdUdUOWWmS7
         R/o7BLCbcEIhTmPpWGowCICnn27JCeSczQPMIPeGl3cs5EeVvZQUd2hhM05oYrh9ruw5
         GwqYUYqWJHXqzzNl19BycPy7QtpY8/o3+g5P5KRC9UShevsDfrYo3PBfhB7uB67NahkC
         O1w02n3b7F46yJG0V7c15BZhugqKk4/CV+ahXoss57k6xcVyy2a7rwlJbDJ+j1+HkMp5
         WasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730465804; x=1731070604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UcbC5Kzt7xtHst+nDuMhIvjMwvrGD5IjyhOSr65wC/I=;
        b=MeBJOEXg0KkwMWzcxuZYevKOi07aorpzOn7ZmatYX5Ki6p+1SP96vE2Gtdyb2pIWOv
         PWO1LPcDe9FVS0CUpz3QOISJLV0dl/laTPkxXASA7WZIZYSTPxFS8Qz2RI6tjYWkIdxe
         xVYw5uFHWkZkxoykgzBp13I764MdPrsW/C3vZHw2+4ttWdPm7sTJWdDPamhTirkR1cJM
         wyFXvZh+eAK5HuNeFjJlZGg4wAQIzU4gXNw6VbcQBqKOxGZcng2U/9pFkNPdVnE33DrJ
         OYGXr5XGvPFdCnXig6q6hHBAwIEkPRLNlY7X/PiQ3/aSYMMnipH0QVUGiXir/IvzGida
         xibg==
X-Forwarded-Encrypted: i=1; AJvYcCUSziNB0iKTJuhD0IZGBkD4aFMQCttnoL/ZttueycD5iqsvhrIMSa124Jn2hT2Jdo5TjqweC04KlDMl@vger.kernel.org
X-Gm-Message-State: AOJu0YzQtg1JOsGG840zPf8TWqgDQjxUa44wCCCO6PL4ElEdLjvm450F
	V33knwcloYHwCZZjKicNHw5XHCkJCxe5xSSr73nudiyAt4u8MXXT8wiVvbC2b7d7nrzwymwlbTM
	Qlhbw5g2I3+Y9CrVWux160pqqo5hHY02lbrNUVw==
X-Google-Smtp-Source: AGHT+IE7kl8dpN1cMEpI37NhROwIbEOKA+43ZYl20abHXLitFsMuMRydI+EPDonSAB1LVUcCnCdu1zofVeKTMG1zQtY=
X-Received: by 2002:ac2:483c:0:b0:539:e94d:2d50 with SMTP id
 2adb3069b0e04-53c7bbecbc0mr1946518e87.15.1730465804459; Fri, 01 Nov 2024
 05:56:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241031092154.2244728-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MeiZ_U0UoU1atWxyWxEhcKwUcCK_cbYu_p-DQar27Fw+A@mail.gmail.com> <ZySOMUs4URLBevtx@smile.fi.intel.com>
In-Reply-To: <ZySOMUs4URLBevtx@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 1 Nov 2024 13:56:33 +0100
Message-ID: <CAMRc=Me7FFawu1wozyN5b9eLYNpaL9iOGLzdc4BAh9Ckw4tycQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Deduplicate gpiod_direction_input_nonotify()
 call
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 9:15=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Oct 31, 2024 at 08:14:56PM +0100, Bartosz Golaszewski wrote:
> > On Thu, Oct 31, 2024 at 10:22=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> > >  set_output_flag:
> >
> > Ok, I'll take it but please change this label to "emulate_output" or
> > something similar that's more indicative on what the goal here is.
>
> It's out of scope of this patch.
>

It is not though. You are already touching this code, make it even better.

Just say in the commit message: "while at it, rename the label to ..."

Bartosz

