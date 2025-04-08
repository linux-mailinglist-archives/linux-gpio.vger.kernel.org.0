Return-Path: <linux-gpio+bounces-18410-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B52EBA7F548
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 08:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BA4A1894B4F
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 06:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 330CB25FA09;
	Tue,  8 Apr 2025 06:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GIydpwTb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C9E20E031
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 06:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744095147; cv=none; b=rI1qf1HO/CpuFkL9Nc0c1v7Ll3Bom7yKsqxp3MZAMUNuzLl+AqvCIF20pV5y5hzON0V7poi7qw9uJc5iGhyLpxSW29n0M2gBQYFjrpXJq6mDXUEeUbE83PKliZvyGTjo8mNTB0MwNkpzj9W3zBvkZlfPftYIuQEzh742p9NG+Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744095147; c=relaxed/simple;
	bh=vf6oJzq/bPFc/YRQCADH9ZXRKMlsCU0j8KOzZ+98lIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DZ5u5rV+blb4LRcQRj3FQ4uxMYWJG8gv+lEPWi3oSfRD8xwWJydxXbledEjagwEcSc3UdsuSa9QUYImbUVIqnnwHI2e4H3cIoTxLw1w26f2MzWCWe7cZnK6fP7/oUM91jjatckl5fr53bY4J76jfECCLPaP8qf0SyxlpdJ4a6I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GIydpwTb; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so6219492e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 23:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744095143; x=1744699943; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vf6oJzq/bPFc/YRQCADH9ZXRKMlsCU0j8KOzZ+98lIA=;
        b=GIydpwTbNPedqgAnaJIwidgN/W7voMlgFtnLGRtw7G2AmPn7mcXzizlnHOj2gSGU88
         jkkPtcik+b9YZJkjQseDT+GxHKJ/ipaDo5bTyr4HPw/kLvOfwccXI2aUpqsg5WsEvRKp
         JJBev78fFMe4a7Z15hJrtlRhMYj8remMjmX8CgYcQixFk9TUtwtgTxk8THEt+RooapWq
         nb37END5+D7cns9j5cS7cvGwR8Lv5dWK/i1gnvBMGb+RXzfra6Pw6fG3V+f1iRHtpLUD
         hRrgFXO6YRb6HeOygr8JQqf4FeLuuCTmbUiwGqp7kOAVu6PXcWNQM/BAT8KOOKYn/Vzw
         0kbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744095143; x=1744699943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vf6oJzq/bPFc/YRQCADH9ZXRKMlsCU0j8KOzZ+98lIA=;
        b=Ahktsm3e5HUMNP0Dne15PvtNDCKUU3IaLqz73rsKc0KJzUt+OUl0rZE4UD04t2wX+T
         sIZcE3MyyU2dWjn1QJwGacaFHIr1E/oG8DvVh+FBIoIMDTc6N+1LlsO3GmFOIaE5lUqN
         Xy2Ymo51SMK8dVTv9X+hdCmQo2ey8dquCwdHj2RObFPVXh8vPzaKiajxkMRW6qJwdd4d
         waiWwjuI8ZBWEBKReNLBw4FhcONlbYYLnwdMfoNcprWBkPYaEjb1L3f2PpNhm9cxDfsq
         EhwEMw1PsFAa+/dX0znbmVvHaQHSQOZ/osx36kDIDT3nIp+wIObE2EBz/V9Wi7qI5BYG
         dOuA==
X-Forwarded-Encrypted: i=1; AJvYcCWjnOU1HoRKn5+I5LGDzaVs63T+O1IuboxDktdizXpUQOK2FpjAybS97ZLz+YgDBvt7VrhHpmkbZbcu@vger.kernel.org
X-Gm-Message-State: AOJu0YzbVWiAn6p8odyB6EDCcOKFFQAY7mMXZri9+MKMggvqraHlNPDh
	ADll1nztNPsAUIcwiVLuqYbWsXu7bOB0Hq6UJsS7nbBaX9UlECmibyhp6hodB4pNMqo/g3Gph+O
	34smPJumkv+UEf70XBsSZhSS2VPeTn3Ioz+EzrA==
X-Gm-Gg: ASbGnct4mVToxNc9nHpujAYE59GsO5jWCHHEylPWtpwHsTusjzzI8oM4mExPO4PbVOt
	E/RPkEYCtHMCdKFNgV2khVmnbAshVbj0iz4Otl+aauL1dCEcCiZtESbYKQ1IlOGsPtwqgFYVMj9
	S/+zW6KeEkqIuRk9rIH4syNaFd3u7ecBgOStt9cbdvEO9Xtaz0iRp0CZrUFA==
X-Google-Smtp-Source: AGHT+IECuXwUgttIYmipcRZs483+Xh+G6HX0MYQ2jLg3x657dEkCs1xbA89taTjzPBp/9Tj6/5D3zg4rfFi8yu6LhXI=
X-Received: by 2002:a05:6512:1191:b0:545:a1a:556f with SMTP id
 2adb3069b0e04-54c2280c627mr5194521e87.50.1744095143040; Mon, 07 Apr 2025
 23:52:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-hwmon-v1-0-1fa38f34dc07@linaro.org>
 <20250407-gpiochip-set-rv-hwmon-v1-1-1fa38f34dc07@linaro.org> <134ac671-13f1-4d29-a81b-a0b7285fd049@roeck-us.net>
In-Reply-To: <134ac671-13f1-4d29-a81b-a0b7285fd049@roeck-us.net>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Apr 2025 08:52:12 +0200
X-Gm-Features: ATxdqUFQ6EJKtiHczeZsGSim0VXzSIH6RtKdJovw_Wse8g2c6D3jMpykHOalA7Q
Message-ID: <CAMRc=MfUvhPK55hNy2jkBMp4vdaWkyNtn-W6hxzVFvLNU_jvLg@mail.gmail.com>
Subject: Re: [PATCH 1/2] hwmon: (ltc2992) Use new GPIO line value setter callbacks
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 12:00=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On Mon, Apr 07, 2025 at 09:16:16AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Applied, after fixing the multi-line alignment issue reported by checkpat=
ch.
>

Huh, I always run b4 --check, it didn't report anything.

Anyway, thanks!

Bart

