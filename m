Return-Path: <linux-gpio+bounces-5242-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D428989DBAC
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 16:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C514283CBF
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 14:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F6E1304BE;
	Tue,  9 Apr 2024 14:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dfRD+fXp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4694F1350FA
	for <linux-gpio@vger.kernel.org>; Tue,  9 Apr 2024 14:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712671320; cv=none; b=Xq7YFeyQAgXsxj5pY9d+1JPGG1KyCRXlUs4TYv51PkBpgM6y+4sEQPod5Ii96mSY7LZEyY0PnL+cAAFD9T4Lp4x55qTTnfsKlUfnWH13y1mDv7Q8EcN0wEvSl39xF3EEIDYB2jQmYVWqq0+Ua/Bj7843viZPlELiAiVBLW/aBTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712671320; c=relaxed/simple;
	bh=WVcmmCzMCx0qOzeVSGr+rFq9VNZEW9SgsVKpHYBH4Jo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vCdx3V2XnusSjcG+dwa74nnt9e/UPWYm3Q2ue4e+OZtDBNUfGllWQ/YKQ7iQkwv2E7qFb0I2fr67YXdTeF+vwhraUrbYBJqUBwYn+2C0BC99SNdjeFXjBLRTZTpis8l8A7TN12ckc9Tc4nEEI9amKwUYuwBAsx9anjcEBy3Ztcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dfRD+fXp; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d4886a1cb4so68301981fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Apr 2024 07:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712671317; x=1713276117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVcmmCzMCx0qOzeVSGr+rFq9VNZEW9SgsVKpHYBH4Jo=;
        b=dfRD+fXpAgYjnTaHkUdHzodjelmUp4pd4WAFcvDQ4Sj6Lvsxn3nJOE3CHClSSQn0w+
         kX1yLioAkFOjRLerXu5snTE3nD2DvT98HeSf34+INqpewCK7pn3kPUvIWE/YBRrvKwTf
         5bzx8dCcaffaSDdF0+A6tTmAZdng6bUE/oT5hmrZgn7RyzMfldG0NPnKClRZn95RqZOY
         +ERS3W/ufcgw9xI5WFFi6YGa+FEhrSuZsET7YEq2s9Fu791vIJOoAC5q05AQomNHjKU0
         vHVtDJjrhlPugxjd7/elhBZMZ0gV8k0MbkdLK08i3LoUIo0ylqCPiXqqPnr29G5zgzva
         UTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712671317; x=1713276117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WVcmmCzMCx0qOzeVSGr+rFq9VNZEW9SgsVKpHYBH4Jo=;
        b=bWyUHyYyahmr6ra4mZGwzkw6v8DW5Z8KzUR5B20Eo0bcuU99zbJRps95Z+sVegMwAl
         9ljiWA+wBZeh0yvYRmUX/iSk5f+leGO2MU0v4y7Xo6VJUTW5EpiSw7xht0O4h0BmmSDq
         yQvhNrrhEYY3HiO13719+TEiH/eXCYE8YARusuZTJZE3/j+cFt4yW3YFhyTLUDY+1BAU
         cCxcSr5fxgC+EshBULgODgiSuDRFBMqAK1v/apenPnCfGiJl7fnhUwyVfdYMmf5AsIY/
         TIE0qLe4Y81mNEXBdRQnc3H8UZShOj92MdXxrAaHrhsb4bOS6yJPUpIcMMZnjBcwL5ES
         Hkhw==
X-Forwarded-Encrypted: i=1; AJvYcCVtKy20iHhNTLjbwbImOJQvxF01tD8k9L/26eFodzbr6JwEBK7EtuBJ+Rkjk/SP4BlvawlZVoahqfp6CTcQ/I6mjG89GtOx5gsetw==
X-Gm-Message-State: AOJu0YziEPW+nTVJGRKmXJ2Utuo2yK/x57WoZrNLAZVQERqUWT3TGEyF
	Vl62LECvBwN07lxfT4ODb2FFfJcjRmcPr5xQCuA5SQj0X3scLXYcpws0yIId8QOWg/sQVCVQAZl
	QQqUCErmFHJauPp3Q1y8uBQ3+b9dPx2pIaD9gCw==
X-Google-Smtp-Source: AGHT+IE0BTLqNhCg/BINBcFyauRaMvF/trglatuDvkvJ1Zps7+gNBKvwiRvgYkhWF8C4ymW2ozFLRyADZMwLTSRX/9s=
X-Received: by 2002:a2e:87ce:0:b0:2d6:dac4:7d4f with SMTP id
 v14-20020a2e87ce000000b002d6dac47d4fmr10185577ljj.4.1712671314663; Tue, 09
 Apr 2024 07:01:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240408231727.396452-1-andriy.shevchenko@linux.intel.com>
 <20240408231727.396452-3-andriy.shevchenko@linux.intel.com> <ZhU57jB_pVvDz0ZR@smile.fi.intel.com>
In-Reply-To: <ZhU57jB_pVvDz0ZR@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Apr 2024 16:01:43 +0200
Message-ID: <CAMRc=Mdzc2gSEX0h0Uwcxr2qMgwLLXfhJda=3AkNNYsDBQre7A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpiolib: Update the kernel documentation - add
 Return sections
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Kalle Valo <kvalo@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 2:52=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Apr 09, 2024 at 02:12:51AM +0300, Andy Shevchenko wrote:
> > $ scripts/kernel-doc -v -none -Wall drivers/gpio/gpiolib* 2>&1 | grep -=
w warning | wc -l
> > 67
> >
> > Fix these by adding Return sections. While at it, make sure all of
> > Return sections use the same style.
>
> Since there shouldn't be hard dependency to the first one, can you consid=
er
> applying this one, so it unblocks me?
>

I'm not sure what the resolution is for % and HTML <font> tags in the end?

Bart

