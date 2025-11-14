Return-Path: <linux-gpio+bounces-28468-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 05020C5BF88
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 09:23:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F185B4EC3CA
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 08:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3152F8BC9;
	Fri, 14 Nov 2025 08:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HaboKwBA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B202E0902
	for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 08:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763108492; cv=none; b=F9JdhZjopbYlyg5t5v4t9VwOJh8ubqFnK4aKq65gzjYo0RcFfoWHkNjH02YPDKHb25qbL6MF8mil+mBB47BpqeQQ76LLLjONeYusjH79k0hDvFSnFw2kx0G6rEikryShNvsOcyRtYV1LWDCaaOcOFZJpNCv1kHXQgYFaF391FnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763108492; c=relaxed/simple;
	bh=RoaMhfLLVOuHjxOOpVv4CAMRbDMWNeflzHt/GEJb89I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JU71bhmlIGh7vd6Ju0LJAz70Mn9Y27pU3gLAMWT8o0AIGaJnEzbaeoUBO+tJGqgeZsezh1M472G8/3JOu0gDrvgbKB7spTOn4OYGD9xUSubGdOTWn6gJIC9nof9Gfcv51IuCqTU7iPUdmi4owJCiNaHJk7w2mHz009RZkG8rEEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HaboKwBA; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5957ac0efc2so1874781e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 00:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763108489; x=1763713289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoaMhfLLVOuHjxOOpVv4CAMRbDMWNeflzHt/GEJb89I=;
        b=HaboKwBAFBymz7EzW5wv/02tSDSWJluPjTIkvtQDEsYNSQKaR5gWstrid9vLCMMUeH
         rzHw41fvOiM0/DWdnRanPPHzlvd6S59Owdu+k13djbkMlWg3vfWFdEW2fBJ7i+9jhB79
         LsuSrNTvKJ0anT3vpkrx1B4jLEqfY2ypGVMJV9RKJCPJ1ohBfPU4/G6EMWZrIMUQkF3Y
         5BbxR4jevXjd2V9A9unQ+p4Fh4FuKfD8TZeKee/0qoIOQeRj9wgDfafjUYTs8RnnTy33
         SjXmXCDkS6QPHqS966yIBZMGmQOtF1Q9ct+XiItaYyW6R1G0qXwjRuvTlw9VMzSphry+
         kBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763108489; x=1763713289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RoaMhfLLVOuHjxOOpVv4CAMRbDMWNeflzHt/GEJb89I=;
        b=d46F/NnjXtytolCZgFQCrDpBvGMAOypSmZ2PodtzvKxTclHmyfSNwZRRx4mIN8l07q
         sJEAZhjIabCbo26kQIONSkRYOMOBiX4luanCNOwY4pPN8BDq074AK4SDcvJuQMN5jnQX
         AbuCYhG4NMZmnVgUluDZcX4MHqLnSqqd14tA7u6TD1RqlJIpdGiWlYxeG+1yxrJ5u8Up
         8RPZviFnRXWjJnxr8VqgPZFrA45Yc1MId2yJ2KUJSJGKGlqqgwC8LP3KXs2D59HE3HTk
         7wX8MOAzNjd7ihI9rooJq285OoWc+3aquTS5wJoARlVAE0taiSixwHRRFcruw6vkRQIC
         hnhg==
X-Forwarded-Encrypted: i=1; AJvYcCWWFZQKc01uJcmxdZRa+UyetRTDbOYgn64pil2IgTeV2FLIffQ0k0kVrHe7JpoFJhjtYGUySTJXhxnJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnu8CsGTKgnf3kkuAnowdJPU4kQ4W3tlis4Ai/XBuWIDUkQSDL
	8k3Lb+zRXtfBeruJpTVhZRV+Xmuq22gaRMetKNb/McABYdXIrB7zzyY8VKlDXrB1mO6eiUTg0dT
	3JsBFb3ItKP3PWZdqy/B+DjoWdSPAn0ZzAdlfxM4/tw==
X-Gm-Gg: ASbGncumjo1Gm8up/cyhKOhoRh4bKfYDW5tS0RsNZz1Tkjb/v6VLUyxQhwaf0YMoa/B
	9zRPOkSftaoAI5B12xX7m1F+wrD7J8Uc54Zvosyu5+T8xjKwUjB8sOYyU/5WU5jpVdxVbIYp35I
	NViGwoiJn0bdBk29B1/9ZC3ouAv0X+xojoD+ULWjqLa795kiEBoh3q8fsSIu5iEtDb8YolabdbC
	BOyXD3BZESoQpfL28lGmB/10MM20cuNExAyimgPgdcDAFcHP19R9xWYwI4n++pIOnYFmyO0WTrm
	Szl8XJEe8JINQ3wEdACUeNlH+g1VG2myMe07nrTtTOZ4WHZa
X-Google-Smtp-Source: AGHT+IF9LlTTJK0KWvU49K6w/pIWSV4KMl+jVPcAS0Bn57RWse7RUSp6Baoy/D0SVnwtg1MsVhw3r9G172s2cgsE6m8=
X-Received: by 2002:a05:6512:b9d:b0:591:c3f1:474d with SMTP id
 2adb3069b0e04-595841b541bmr818362e87.15.1763108488118; Fri, 14 Nov 2025
 00:21:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018-gpio-notify-in-kernel-events-v5-0-c79135e58a1c@linaro.org>
 <20241018-gpio-notify-in-kernel-events-v5-6-c79135e58a1c@linaro.org> <5d605f7fc99456804911403102a4fe999a14cc85.camel@siemens.com>
In-Reply-To: <5d605f7fc99456804911403102a4fe999a14cc85.camel@siemens.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 14 Nov 2025 09:21:15 +0100
X-Gm-Features: AWmQ_blZSG1drGJV3Qf_JTGtFaAN2cVhfUrbLgQmQo7XYQC6j21Oy8jrKqmmy6o
Message-ID: <CAMRc=McswuxryKqh7-zSc+oKTubu-bKoV40mUMh1tUbTofHA5A@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] gpio: cdev: put emitting the line state events on
 a workqueue
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "warthog618@gmail.com" <warthog618@gmail.com>, 
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>, 
	"bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 10:11=E2=80=AFPM Sverdlin, Alexander
<alexander.sverdlin@siemens.com> wrote:
>
> Hello Bartosz,
>
> On Fri, 2024-10-18 at 11:10 +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > In order to allow line state notifications to be emitted from atomic
> > context (for instance: from gpiod_direction_input/output()), we must
> > stop calling any sleeping functions in lineinfo_changed_notify(). To
> > that end let's use the new workqueue.
> >
> > Let's atomically allocate small structures containing the required data
> > and fill it with information immediately upon being notified about the
> > change except for the pinctrl state which will be retrieved later from
> > process context. We can pretty reliably do this as pin functions are
> > typically set once per boot.
> >
> > Let's make sure to bump the reference count of GPIO device and the GPIO
> > character device file descriptor to keep both alive until the event was
> > queued.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> starting from this patch up to the current linux-next (v6.18-rcX)
> I see the following refcnt warnings + KASAN UAF reports on either reboot
> (when gpio-manager is being stopped) or
> `systemctl kill --signal=3DSIGKILL gpio-manager` (if some GPIOs are being
> requested from (owned by) gpio-manager prior to kill):
>

Hi!

Thanks for the bug report. I confirm it's reproducible on my side too.
It never occurred to me to try and SIGKILL gpio-manager. On normal
exit, nothing bad happens. Let me look into it.

Do you also go by ccpalex on github? I want to give you credit for
reporting the other bug in gpio-manager as well.

Bartosz

