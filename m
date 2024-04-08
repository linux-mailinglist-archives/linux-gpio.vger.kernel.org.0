Return-Path: <linux-gpio+bounces-5156-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2290889B9B0
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 10:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0E81281F10
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 08:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D6129CEA;
	Mon,  8 Apr 2024 08:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="F4OgANhf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F003B25632
	for <linux-gpio@vger.kernel.org>; Mon,  8 Apr 2024 08:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712563660; cv=none; b=nsRxjC0XANrOk5iCuaKSxj14EPWxG8vz2sv2Owm3hQfopUH+BP8h8vd7ySq/0a6RV3KrQJts6htTGJXZlYk+77gem1HMqQFN20xhdcbWJSsh+Rqu21bB1GeeP2rCxjeuyzKfQ64O200rHCDyTnuDd79883+ePq58rMU21M34Et8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712563660; c=relaxed/simple;
	bh=hle1OaCm4PxWWaUzzFx8QGGMyJX9wnDudPxqleMJ3wY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AY1VxW/iWDeq3Lhi5VstGSw87Ee4Z40aK47EaZsouObnyHrM3kJ0QO0q5kCjt6EaxDVDTdrPOkPiV3Y2Q3MHGAzIntVXngAbptHoGriM4x+4atMLxrWJWaE6Uxq4JLh8X/vH/4p3Cd3UpOw1NFj2zoBk3vg1RNmLyi8pYCks7jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=F4OgANhf; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d895138d0eso2997231fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Apr 2024 01:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712563656; x=1713168456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eyz37Re5UIVTJ7PRV5U1uvBtKlilZQQUm2jHTs35Zmk=;
        b=F4OgANhfcxwsFALwLczotv/EwfIydxZ1L+ydJjZXysD0m5Qsl87wuCkpu9E395lTAf
         3hvR9jnTrC6I4J9EA5KHU4fax5sDq3VubibVLteuT+o8kSYwTcXDVEKmj56HZ1CYtl7U
         RRAQuMg9lx9ftFt+MnuqDswTUk+fV74+bWhd4jHl3GUc14z8EHJEwJamLKUO5kS7Wdvj
         FF8KCcyAutqCWKoqOWRhebvy9VOu9qfLcJK68yNPuddR2bVBpIyjNeHdF7SIXxuspW/M
         dXbF0CgStUEHNmlsjD2FeoYNVELeKAnwyHzxQ051R9l5R0TICtTOdWENDpVzbAieVoa+
         xS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712563656; x=1713168456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eyz37Re5UIVTJ7PRV5U1uvBtKlilZQQUm2jHTs35Zmk=;
        b=G40R2IbmqtPqBSROMKLoHgVT01TIZk8Hs2r/na5wO16vpfgr2lTI8gv16VcFxtAfiZ
         pN5iC0dVIgebF9SJIMxk6hREccMvB7j2ifXc4HQrVjsXeKdZJalWeAtGq4OW/h2xCBh/
         vxBRue6d3LYNMkOfvY0vZ3OFqqsF3NRNqny2M/A6jvaQWymWDjRlzEBqKd7Qu2iyGVHx
         0Ql9O3TAgqhphDjQLEM+mrQzIRWW5ohRufqASuW0OZNVu1YO2luppcJHsicSHB8gNM6/
         8Tqw/Tz7QPR7Im9lWo30EZpmw/Wf2XBfiTa0ip/nednRnHbcUKp3nY8qnF/t58q26h5N
         QrnQ==
X-Gm-Message-State: AOJu0YyGZWM9CfalEAsaNhJNCWOiPXy1R7f9I4UmqWBMu1xxh/L1Ruo4
	Ibn6HEae/dpA0QN1alGoVlJRJH2tbLE0to03VO/hCHwL7g4A7tSX7U2dikH40XACoytWT/dSSZr
	2kqTviEXhNg2R/rCR9KJKmu4i2Bu9Vca73uK6/g==
X-Google-Smtp-Source: AGHT+IGkCk+VRrSW8wTtvW7ysPs29MQWqFjWhsv9tXK3tGOOM9aSL8lm+NUeSng5o9xMPSgxrg/9PbSf56JxYbqaJX8=
X-Received: by 2002:a2e:8084:0:b0:2d4:3c32:814d with SMTP id
 i4-20020a2e8084000000b002d43c32814dmr4848412ljg.26.1712563656064; Mon, 08 Apr
 2024 01:07:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZhA8yEWemLejQ_BK@black.fi.intel.com>
In-Reply-To: <ZhA8yEWemLejQ_BK@black.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 8 Apr 2024 10:07:25 +0200
Message-ID: <CAMRc=Md=v=-4ku2VghcEKu82UPkS3A-kfWsvq4zs-yk0VK77kg@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 6.9-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux GPIO <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 5, 2024 at 8:02=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi Linux GPIO  maintainers,
>
> Fix error codes in couple of drivers, so all the internal check will work
> correctly. Please, pull for v6.9-rcX.
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>
> The following changes since commit 4cece764965020c22cff7665b18a0120063590=
95:
>
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git=
 tags/intel-gpio-v6.9-1
>
> for you to fetch changes up to ace0ebe5c98d66889f19e0f30e2518d0c58d0e04:
>
>   gpio: crystalcove: Use -ENOTSUPP consistently (2024-04-05 20:12:39 +030=
0)
>
> ----------------------------------------------------------------
> intel-gpio for v6.9-1
>
> * Fix returned code in the error path in Intel PMIC GPIO drivers
>
> The following is an automated git shortlog grouped by driver:
>
> crystalcove:
>  -  Use -ENOTSUPP consistently
>
> wcove:
>  -  Use -ENOTSUPP consistently
>
> ----------------------------------------------------------------
> Andy Shevchenko (2):
>       gpio: wcove: Use -ENOTSUPP consistently
>       gpio: crystalcove: Use -ENOTSUPP consistently
>
>  drivers/gpio/gpio-crystalcove.c | 2 +-
>  drivers/gpio/gpio-wcove.c       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Pulled, thanks!

Bart

