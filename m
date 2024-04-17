Return-Path: <linux-gpio+bounces-5632-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB038A8D3A
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 22:47:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 390AB285CE1
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 20:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D5D47F5F;
	Wed, 17 Apr 2024 20:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="aQ94PS7H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B1C40858
	for <linux-gpio@vger.kernel.org>; Wed, 17 Apr 2024 20:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713386857; cv=none; b=HX+2EeOZwkrZ3BYsJF1hV4LBss3v3ks3saiSZI05MMmH03v8o4rRKCI0mzfkpZM8wXuS+pgbVGYComjFv8es8fVlnqbnuoHYzockqkLAUMOhBRjKQOZPXrgSGdrD1JEwckX6tQUkH0u7BXy96i8SEy71NYVDizrbh1/UfG6cKVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713386857; c=relaxed/simple;
	bh=WDdRomGwYIj9LAM5YN6npSc5eONnLOEwIE5znWDSutU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CCx27iWQnWzr7Ulpooh9GTzAdxmp9ZzR9w2gB4STBbXJFC0jRMt9g7B+v5R8X7WyEPr9NNwo1wYh3ELbg3mIjJ3u0wE4AdyP6Q0YAmZRYIWyt9eMHnxFoQlxgXTh8KpVsEOv4sLLHKdizJCOxQqxzgLaKcS9eJzfV5/VriJmHoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=aQ94PS7H; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-516d1c8dc79so107595e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 17 Apr 2024 13:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713386854; x=1713991654; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDdRomGwYIj9LAM5YN6npSc5eONnLOEwIE5znWDSutU=;
        b=aQ94PS7Hlq72H2jimONDaLrmFvoGNwMzNezPgigXjoHjEImsMafYALMRuR8GKvQjTk
         O9f9ErJz0SCUF2kq/rPxXY2K0yAas2vPfEfL0AIZZYI4SurgHKIYO5o/h0SI+fRcrVZ7
         wZ4JUmsNVKF+LJuQuLsDwbAlu9qity5IHXi+pm7s9dTJp5itrTVQc+lcW66mzfv8ysLd
         4Y8MygcE48nRaS/oYlg0gEZSqnuz2YTZUK+J3vAjRCK1H44YanpD6Aj/mG+ySblUAFt2
         4QGQ/q21pmGi/c2OdMy4Ydfa15K9OPobbgcnT0u8KlxocIx9Z18TGpYC6LgSeM7DGdOG
         LDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713386854; x=1713991654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDdRomGwYIj9LAM5YN6npSc5eONnLOEwIE5znWDSutU=;
        b=c3HreuqKcCzv0FcGKlhF4jYhFEP+XiJelvb8EYLiXUaDazQoK/9Zj9ZkOLBK3VetFE
         0J347nDxxcj2qekeN/YZDIJIeHa3AnnJZWIRi2FZaz5QgM1v5dJva1lv9MRnMq+J5JiM
         OwNyzs05BPV3ZyFqSfO6XqANd3kxk1F7/bfbLot++FeGv2UOGAKpF1nfASlGSBufavwU
         uX1vimLeBEnIIvxU2SHdazwwbYWiMky8NH110VpBcW4GVHDp9iO91Rhiw324q43/W1R7
         T3QsfyJZP7OQgzl6jvSRQ7vPRytljEJyce/e9csBYypgwG/w+KhgY6/Qm7GjCoXVtmxC
         HT7w==
X-Forwarded-Encrypted: i=1; AJvYcCXTEJoPxMgyZHeepZTnMmipz9WKvo6TqmJJfuppU6rVV8p5bbrmD8UrW5w00UceVoSRBb/xQvbHngsSc0oA1p9IrDStFMJhJuywrg==
X-Gm-Message-State: AOJu0YxswrLcShgkCfhJ/g5vS/2w1J6kCZ5Cu3+TOmHg3I5fzaYwOMs0
	2HR1en7tcDorSNvEF8cUysW9hayzvwkrKIs/f/X12Uh/kgc3QdIYks+YYAyyAPKDjcUu+7ikrMa
	9mg/pFKC2ibNZ2EnTzC/LMbjcFRUR5JJjfglpsg==
X-Google-Smtp-Source: AGHT+IF2JtxDcBcGf5KQ7m9jQ2Ck/N7MLJAwJpQMTOQIh1QEQUjpIuMwqAGFdic86q1ciV1N+WqGSAPC6I4bcJOi3qc=
X-Received: by 2002:a19:4310:0:b0:518:6f95:1a37 with SMTP id
 q16-20020a194310000000b005186f951a37mr239045lfa.33.1713386854355; Wed, 17 Apr
 2024 13:47:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221213208.17914-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mfh-ojboNUELXfszKUbZRfeZn9vsN-HMTdMQv6my6ZrdQ@mail.gmail.com> <Zh-oku-XzpcH_8FH@smile.fi.intel.com>
In-Reply-To: <Zh-oku-XzpcH_8FH@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 17 Apr 2024 22:47:23 +0200
Message-ID: <CAMRc=MfO_7smzcG2+FM2EHNb1FbqS7PbfJuzBH6gL6KXT2fVUQ@mail.gmail.com>
Subject: Re: [rfc, PATCH v1 1/1] gpiolib: Get rid of never false
 gpio_is_valid() calls
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2024 at 12:46=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Feb 27, 2024 at 02:06:05PM +0100, Bartosz Golaszewski wrote:
> > On Wed, Feb 21, 2024 at 10:32=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > In the cases when gpio_is_valid() is called with unsigned parameter
> > > the result is always true in the GPIO library code, hence the check
> > > for false won't ever be true. Get rid of such calls.
> > >
> > > While at it, move GPIO device base to be unsigned to clearly show
> > > it won't ever be negative. This requires a new definition for the
> > > maximum GPIO number in the system.
>
> > > ---
> >
> > It looks like a risky change that late in the release cycle. I want to
> > avoid some CI problems at rc6. Please resend it once v6.9-rc1 is
> > tagged.
>
> Not sure why resend, but I missed that somehow. Can you consider applying=
 it?
>

Applied, thanks!

Bart

