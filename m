Return-Path: <linux-gpio+bounces-13534-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5AB9E523B
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 11:27:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F8A41663EE
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 10:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C58B1D5CFF;
	Thu,  5 Dec 2024 10:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JofWgZfK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5198E1D5ABF
	for <linux-gpio@vger.kernel.org>; Thu,  5 Dec 2024 10:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733394439; cv=none; b=LlgEDh+HD1WMgW/HcLM5JurSVVLr5Tk4Z8u0ffd2hOmNrvhHc7Ba37TvD8fmp7uBrciPhjbl7ANgzravHQ3FUMtA1j06pQ2GSV73E9JiMnjroT1z3h2NbfpjRjHlok4OStYztUo4dWjcT+YC6RWPBXu+HNY6QMk9/opheOmCc7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733394439; c=relaxed/simple;
	bh=8q46dqRV1v2ND/3kJc778fBE2wfFmek/CR405bLPtMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uQWJ3ObA9FRHQAbdfm4OLbBAqBuP9IfRpg8HpKPq4SQRWhoY2zGNN+yF9rUg8mkDhawxFlj5vyYRDQ0O8u1JNJ5dIdS6AjjHa0UJilMrHLYw/rqb3MPVcDi9/kGXycQtWkPgN46mFVdq2qRerjzO19ACt3OJpFKp7BQ2+U3mmz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JofWgZfK; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53e1c3dfbb0so711623e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Dec 2024 02:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733394435; x=1733999235; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWr2sPdmT358XoDKa9V480ufmwo78bf7Tj2jfcCUPKQ=;
        b=JofWgZfKJr/hMvKcIYz1asdNoppYTpgCstHlvRTRmAsIdRmkvoNUUXKuL6sziGiLfv
         KSnUvmXpULP/UT1w9wfxFw5HtCHW49Sw8EGzRt8HDOWhwXaFcn4Tpzb4Wz6Q6JZTugds
         rQ0Fh5x7/5XwZw9JFIvYseRJRM8rm7ifdSOBHeKWvoitWq/DxqqSqVOC2B6cLSVHMWCZ
         SIycHzQmuLvfqQILRRkJi77BhYWO75ydVxAIFfb9HvSEfBhl74FIlBbpysvnG2iAVgvV
         +SccNVaRWPtpoDYxx1Z2lpGuw5v7tH85GLhhVGV8cwIYFcK9tJoRSE2M7rO02Y4u9RTi
         7aVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733394435; x=1733999235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWr2sPdmT358XoDKa9V480ufmwo78bf7Tj2jfcCUPKQ=;
        b=j5XX1XaWppv7pufUqF3T96Ya9EYutpGLWtBirLbcwU79E1/q7G/LrOGO2YJXJeIlY5
         IRDbBBIWFBDenQbxdEquH6AzKJpF/njG8oL7AhKsTcP0Hx8lEVdMUYscRgkr3hORoqI/
         B2FLH9LM8D52eDMgGAn/octMicROxmxzyflWnJU/316a5GjBCdDEfvU4n3uV9iM3j6Np
         KUDkO/k8kakhgt1n8im/6IRYYQkRo65kpu5kAOe/43S8auRMds9cJKhTgACf+CgbKjwY
         um+YCcYmMq2O0/2QGV5esTvqK8m/W7YdoD0gjnkG5kcAwK+wm6Z8mHyqywXz5xvaw9um
         HtgA==
X-Forwarded-Encrypted: i=1; AJvYcCVXKsq9TFDZnqxoD9II3FPjQNxbmkAaBBaIDb8ugtNk0b//wlDodLXaigqUWlAtWRFH102iEDVG2YAr@vger.kernel.org
X-Gm-Message-State: AOJu0YwaC4worV7/KSiWPSdOWAyDvGDVcvRdY5mv1J7WnhwWCbfvzn9K
	rPodlsZTmQ8/6TE60eUjZjIMhRqjxpK4HmSHvsSFzNaJCi0MnIyQgXpS3J7MppZ5O7t+YqjcKH5
	OC5yct+VKDOBLrtSkrqpWQO07QlLZ9A0AkREs0A==
X-Gm-Gg: ASbGnctP1o6UCIx94VZC5MeXA5VrqjphJpgUov1sfHLRo9ztMQG1XmSDUqvJquwujQY
	KtGbObOjElKXE7Ltzu2OzGlKBzinokYRuGx8ELtRetVfI0OG1DSQzNCIN3k1W5Q==
X-Google-Smtp-Source: AGHT+IGUNiZ2Zr0AGmSGs2mdBuCRnV4lKq45/HGJjBiaJ21c71eSWgLHkCTxlmAm2wmJM4o2z+eKzX5aHRxBC7VjXr8=
X-Received: by 2002:a05:6512:39d2:b0:53d:cefe:ffbd with SMTP id
 2adb3069b0e04-53e12a34417mr5547500e87.55.1733394434644; Thu, 05 Dec 2024
 02:27:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203164143.29852-1-brgl@bgdev.pl> <213de4bc-3706-4bb0-a827-06c63bfe0294@ti.com>
 <CAMRc=Md_u3YmseW5kV5VH4F99_0P=tc4pWty_fB3dVfv_JDxWQ@mail.gmail.com> <37f90519-48e9-4caa-80c6-9f6ae61aae0a@ti.com>
In-Reply-To: <37f90519-48e9-4caa-80c6-9f6ae61aae0a@ti.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 5 Dec 2024 11:27:03 +0100
Message-ID: <CAMRc=MdMiYE6xmmPqvZcx7MRjzppWkdWerxTiqn6Z9kmiUruwg@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: omap: allow building the module with COMPILE_TEST=y
To: Andrew Davis <afd@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 10:54=E2=80=AFPM Andrew Davis <afd@ti.com> wrote:
>
> On 12/3/24 2:36 PM, Bartosz Golaszewski wrote:
> > On Tue, Dec 3, 2024 at 7:41=E2=80=AFPM Andrew Davis <afd@ti.com> wrote:
> >>
> >> On 12/3/24 10:41 AM, Bartosz Golaszewski wrote:
> >>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>
> >>> For better build coverage, allow building the gpio-omap driver with
> >>> COMPILE_TEST Kconfig option enabled.
> >>>
> >>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>> ---
> >>>    drivers/gpio/Kconfig | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> >>> index 56fee58e281e7..fb923ccd79028 100644
> >>> --- a/drivers/gpio/Kconfig
> >>> +++ b/drivers/gpio/Kconfig
> >>> @@ -530,7 +530,7 @@ config GPIO_OCTEON
> >>>    config GPIO_OMAP
> >>>        tristate "TI OMAP GPIO support" if ARCH_OMAP2PLUS || COMPILE_T=
EST
> >>>        default y if ARCH_OMAP
> >>> -     depends on ARM
> >>> +     depends on ARM || COMPILE_TEST
> >>
> >> Why do we have this depends on ARM at all? It already has that conditi=
on
> >> above on ARCH_OMAP2PLUS which limits to ARM outside of compile testing=
.
> >>
> >> And anything that selects ARCH_OMAP2PLUS also selects ARCH_OMAP, so we
> >> could just do this:
> >>
> >
> > I agree we can drop that bit.
> >
> >> --- a/drivers/gpio/Kconfig
> >> +++ b/drivers/gpio/Kconfig
> >> @@ -528,9 +528,9 @@ config GPIO_OCTEON
> >>             family of SOCs.
> >>
> >>    config GPIO_OMAP
> >> -       tristate "TI OMAP GPIO support" if ARCH_OMAP2PLUS || COMPILE_T=
EST
> >> -       default y if ARCH_OMAP
> >> -       depends on ARM
> >> +       tristate "TI OMAP GPIO support"
> >> +       default y
> >> +       depends on ARCH_OMAP2PLUS || COMPILE_TEST
> >
> > This would default to y with COMPILE_TEST. We definitely don't want
> > that. IMO it should be:
> >
> > tristate "TI OMAP GPIO support"
> > depends on ARCH_OMAP2PLUS || COMPILE_TEST
> > default y if ARCH_OMAP2PLUS
> >
>
> Looks good to me
>
> Andrew

Nah, this is incorrect, it doesn't build gpio-omap for
omap1_defconfig. I has to depend on ARCH_OMAP under which all omap
platforms fall and they all use this driver.

Bart

