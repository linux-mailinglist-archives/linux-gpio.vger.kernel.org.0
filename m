Return-Path: <linux-gpio+bounces-19385-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 638A0A9E9FB
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 09:49:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7387E168F3D
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 07:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E4A215F6E;
	Mon, 28 Apr 2025 07:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IjNveLpm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702A321516C
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 07:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745826534; cv=none; b=OeCD44F31nfupO8TyzIlxfYpG8m4ovAgolfyiXXFJJkgzambCkbtwvO4D8lDNvUtcjriICBNvzkjpwQ9l5VKkBhmA3d3o/ff0w3pb8wekxVBCoflvbKroWKe3MLQpgCcxSjg2XGVWL8ep6Opm1PSRxlwW8fmHeYETqg1CpeCi+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745826534; c=relaxed/simple;
	bh=0aPbq7QjWZD6WH/+NpInspV5AqubEwAIG6v/0OXrdB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nv8LVf5k9gGHhMxhQgl5bBlWPYBihI171wWQeEsxzoBeoXMsuJvwYec/ss2Q6aRZyWqYs7ML50vzqz760mqhPSGcURf1DwpIyvP/DmSbVxVPCzcpFHRyF/pAl2mJ2WmvMcaZSk8AQmxZreVhBqlT0Rk8C3aoGXkSelVV9S0JnVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IjNveLpm; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54d98aa5981so5604104e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 00:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745826529; x=1746431329; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PCCupPubZed2dSKQMnkWeJ2fjhjsL4Shb7ISSeWciY=;
        b=IjNveLpm13oF5r2UvpgJceynHNCNU8TNihB6eRTsivQQ+/KLBnRoWi9JF/FnpH/Meq
         juVVH0q72HorDvRjQD4atseEsQZYH7Gq1DDsw5VFfWLI/fo6CWmibascIH1Q/7gGO1QL
         AbwVDvoi2M7TDjILYMk+c9s3qI9BrXvmUmQ/Xpx/BE7ATdIle6asMFx7Kr/L5NP75+4a
         +kGWRhtau2Js6PM5jZtR7s0w5x78HD8U5BjiZHFCJbL8JLUmP78DMKV22g1xUqjDRNxz
         hopxodbjKUQ3E82qD5pGWEOIIFZuKpDsyGx7ncF3eb9DmjV+3fPIUEhQWFOKkaQcxGVE
         t3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745826529; x=1746431329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1PCCupPubZed2dSKQMnkWeJ2fjhjsL4Shb7ISSeWciY=;
        b=TupDZ4ZISKlI/WxjIsIifRlQ1XIl4c6CvK8yqIQZmGG/rZkqVzi5AFlF3w02kwqYp2
         qot8YPltJOff3GrcBm3RaY2ZS41jW07Irwmod2LJlmPxrz/IRwp9xnDTivRcbV7oEi9I
         tE484WIpLW0O+KisxdcwDTlse0pE1RlKvpjNJhMCdSfnUE+/naYwRR5YQC8A/3jXyuMb
         2tG57X+X8VXzXW3/qrRkTzj4RD3PlgzhODOLjVGjNnWZ3hg4XrkWKjIvUxWIOCFgiezf
         B37rIsIEt2OobgOyk17kpV94CG8jRr+GlmYuGDBhH2W2AXkUk5T/f1WeJmQWXfNkxVoT
         5BCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+oW//Kg27n15cT50yTzxzhDD117wGb/edIq8ROJdJ3PxYDzpkcUd4BE+IVwRLGGHJlwZf2CiBhyzF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5OOLAonB1CYu9juP73PR4NKAwCXE2treqhh6SCXi4qtPqUJYv
	awSAKBGMGYXMDiegO7Q32+6UTe5BBBkeC5S5NemgjGrZTvAn5W1I7cdgNqznyaZoLoqU8oNlbSh
	qKmlg3ypBGbnM4rPQc7jpXnJF/gKs9gZykrSMzQ==
X-Gm-Gg: ASbGncslfQ0HBlkTwfQnkvMn4qbN5834Yh1HKeHUthAr56syqbuXm0mZnz3rET4HG7N
	bAGJ9zQtu2dFGuIWWYp4VSu5jBteeNj8ns4Sf0foPPEdNhGMIPPjsZTZKcnCjHxzuJ9bmrw+TyP
	YVV6PtnMHtcav0pLr4t5SY7PBy6o5ZH1Jl9xpBqLAQB4vJ7M2eyQQg0tb9L9K9r5Wc
X-Google-Smtp-Source: AGHT+IF0HgPn8OeKW5WS+KDxofSmzOi/8NCd/YBlI5lK1Rs8gPsRVwuBuxWF7hz9jPutkk72Ap10CvMM1TUnDBKdFrA=
X-Received: by 2002:a05:6512:3f1f:b0:54e:8183:eaa3 with SMTP id
 2adb3069b0e04-54e8cc134b1mr3025602e87.57.1745826529270; Mon, 28 Apr 2025
 00:48:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220162238.2738038-1-andriy.shevchenko@linux.intel.com>
 <174582608319.15717.12211907178640999391.b4-ty@linaro.org> <aA8ym3GYoAK4lI2y@smile.fi.intel.com>
In-Reply-To: <aA8ym3GYoAK4lI2y@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 28 Apr 2025 09:48:37 +0200
X-Gm-Features: ATxdqUFRtjOrKeJMUsvJ7WCe4eV9I3R70d8kFAEM_J2BwLrUZ6JPObHuV-g07WA
Message-ID: <CAMRc=MdeVrgzVKSjbNzBz+Kf2SqqFY7KO=yprU7GF0Nbbcq4ow@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 0/3] gpiolib: finish conversion to
 devm_*_action*() APIs
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Zijun Hu <quic_zijuhu@quicinc.com>, 
	Raag Jadav <raag.jadav@intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 9:47=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Apr 28, 2025 at 09:41:52AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > On Thu, 20 Feb 2025 18:20:25 +0200, Andy Shevchenko wrote:
> > > GPIOLIB has some open coded stuff that can be folded to the devm_*_ac=
tion*()
> > > calls. This mini-series is for that. The necessary prerequisites are =
here
> > > as well, namely:
> > > 1) moving the respective APIs to the devres.h;
> > > 2) adding a simple helper that GPIOLIB will rely on;
> > > 3) finishing the GPIOLIB conversion to the device managed action APIs=
.
>
> [...]
>
> > Applied, thanks!
>
> Thanks!
>
> > [3/3] gpiolib: devres: Finish the conversion to use devm_add_action()
> >       https://git.kernel.org/brgl/linux/c/d1d52c6622a61a0ae8dd2bd2097b2=
5c0f553d2f3
>
> Only one? What about the first two?

b4 borked with the patches applied to gpio/for-next through an
immutable tag but all is there, please check the tree.

Bart

