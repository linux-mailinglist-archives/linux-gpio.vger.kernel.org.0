Return-Path: <linux-gpio+bounces-5223-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E19A89D5C0
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 11:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D1FC2826A3
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 09:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D600F7FBDF;
	Tue,  9 Apr 2024 09:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="24aIgIE5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1848D7E774
	for <linux-gpio@vger.kernel.org>; Tue,  9 Apr 2024 09:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712655771; cv=none; b=hGIjRE/ob3NlRnm/+TaORu+rHQYNgLzlbkaWWXTwuEkgsJ3Ot8sCo/F1s9um/ZzNHYaT0cY5ZAlq60fH8VPhRUTRvZ15sLnAvj8RtcnLH1g88kBeNC60iPWS8yBi1nmQNyNkNidkvt2JapYcH07nVJvIF/5N1pXZVHdAPc/3RaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712655771; c=relaxed/simple;
	bh=ytL7QdYp2hCqyew7adjYY1rWgd8CDCZw9v1gyruAj60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c6o3XQIAW2T/KffVJgCrW1M52Gint+xf+a14k9HBjNvX6/rfKXCUHkvEb/umK+58t0OwnZjPVS5Sv+kLnfiCy1vz4NFky4iKa/RUeOeFFl9CGAA9vuHwdvMV0W2LuD8BTKQHB03CzZWIGy8SAqTeCSi1+i0qf+qLY/NgFnQ/NP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=24aIgIE5; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d700beb6beso58979631fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Apr 2024 02:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712655768; x=1713260568; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRkNsSj/lYNCA3MRycU0zvpqCVRND9tlWV8O4KsTnlc=;
        b=24aIgIE5l28MQNHvET+s3C24ag0SoSC46oVvfz/e4VBtyuEWZ5PbH/Omv9IktBmAXW
         fPCm2/G4EdjNcxxrfkZHCIucBiZmWMnVAcGrezFIQCW1EeSrebkCULblOK2ow2AEBZA6
         ScKTVLz8SkDxV3ZuI/GnoQg7FTwAtHEaWGLfU+2tVv+Y/x4sRsWbd2dBM1008heX5Ekz
         xQpF3v9tAGD+bSzz9zfYR5p96a57/H6Qd4xMkK4LrIPSj5bFiYYbEgMztmrPgMkRAu8k
         smePAjVlnlP5QSduD0z1R3/IkWL/t6F7AUvnkDwAsT40D/0PbwpFw1swGMm/RYlr2pLM
         yMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712655768; x=1713260568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FRkNsSj/lYNCA3MRycU0zvpqCVRND9tlWV8O4KsTnlc=;
        b=Hx33G928jM71792oIyccjaST62OyFBsc/ZOiUChHhN4Pd9lZqUHVE5DPWx43ZJ7G4z
         ThyVjDayMx1QV+HI1k72uzqeLy4Ssr7ciJwSN2KwLBafd8qmhTAjbAoX7SkJuhM6YKf3
         qBYc6vdljV9Pp0eqiIGIzFAC4zIiww/ptdVIyu0KD7yFQr4l50dyNf0m3KZu3UdmG2RT
         e93tIMPh5rcR5FoZ4PoEyCPYsc2TJK4CR3jmv9PSXc+PegZf8snRfdTVQlBi7poRvg2R
         XTrZDgVygeMdtqhw5wfxrzCzCscKzY/Ad02rnf5Nf4ZEeAhQ+5A7IciXupYmBp+c7+Me
         PxQA==
X-Forwarded-Encrypted: i=1; AJvYcCXH6DsoVnJHobycAQz7ah7WCUEOUe53N36sVo5gtA123f3z7zGfQilNTv8h9q03GgXihcvjmXLoZcFkaNatV032Oy6ErkBb5JDpSw==
X-Gm-Message-State: AOJu0YyQDlBqi66G0+wn/Er2+Z7dagqtWmaHKNGpVI1/ok22IukIkkxI
	sITXreATdJzEKW1e/YyC/BzgDQ5UDq3lypCyGFhtVCacQMmzIBUvJaE/RYpZJCy+nuELfC/0Y6w
	ko7t+5PnAMTg0D7w2nYjNr00Uvj/gU6jZZ8WHyA==
X-Google-Smtp-Source: AGHT+IGLok3BTsdCtcp+mQF0FlIfpGRtTXkNrJj6FjV/E2JhCIYngUvEmtKxHaZSUGiU6FzXlS6ipOOBorjeZLPGLJA=
X-Received: by 2002:a2e:854c:0:b0:2d8:5af9:9097 with SMTP id
 u12-20020a2e854c000000b002d85af99097mr6406610ljj.42.1712655768359; Tue, 09
 Apr 2024 02:42:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240408231727.396452-1-andriy.shevchenko@linux.intel.com> <20240408231727.396452-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240408231727.396452-2-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Apr 2024 11:42:37 +0200
Message-ID: <CAMRc=Mf73fFHo83gNvDXGy9BosB1MNz_=8kt56hLA12bPBb8CA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpiolib: Fix a mess with the GPIO_* flags
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Kalle Valo <kvalo@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 1:17=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The GPIO_* flag definitions are *almost* duplicated in two files
> (with unmatches OPEN_SOURCE / OPEN_DRAIN). Moreover, some code relies
> on one set of definitions while the rest is on the other. Clean up
> this mess by providing only one source of the definitions to all.
>
> Fixes: b424808115cb ("brcm80211: brcmsmac: Move LEDs to GPIO descriptors"=
)
> Fixes: 5923ea6c2ce6 ("gpio: pass lookup and descriptor flags to request_o=
wn")
> Fixes: fed7026adc7c ("gpiolib: Make use of enum gpio_lookup_flags consist=
ent")
> Fixes: 4c0facddb7d8 ("gpio: core: Decouple open drain/source flag with ac=
tive low/high")
> Fixes: 69d301fdd196 ("gpio: add DT bindings for existing consumer flags")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpiolib-of.c                     |  5 ++---
>  drivers/gpio/gpiolib.c                        |  8 +++-----
>  .../broadcom/brcm80211/brcmsmac/led.c         |  2 +-
>  include/linux/gpio/driver.h                   |  3 +--
>  include/linux/gpio/machine.h                  | 20 +++++--------------
>  5 files changed, 12 insertions(+), 26 deletions(-)
>

I don't think ./dt-bindings/gpio/gpio.h is the right source of these
defines for everyone - including non-OF systems. I would prefer the
ones in include/linux/gpio/machine.h be the upstream source but then
headers in include/dt-bindings/ cannot include them so my second-best
suggestion is to rename the ones in include/linux/gpio/machine.h and
treewide too. In general values from ./dt-bindings/gpio/gpio.h should
only be used in DTS sources and gpiolib-of code.

Bart

