Return-Path: <linux-gpio+bounces-11261-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9856E99C1E9
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 09:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 371B9B20FD2
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 07:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA15148FF3;
	Mon, 14 Oct 2024 07:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hFVdaVSm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE9C13C9A2
	for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 07:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728892110; cv=none; b=Urb8wWBipzWIU6Y86WjFCGmPGlqi+wawFSot63m0/toG44NrU0QjFTyJEMtqaTxV4pSASxSiMckUeCYxGgiMZ6f5LiVJXVYyQPUyG5ATLA6xjd1FKi9/UGzf3tFrMSnfGbQqZ91PvjxUv6pEvi+RNA3D+jsGWc1T75OTF7lNKrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728892110; c=relaxed/simple;
	bh=upEQUkYCFV1oHJzp9bR0zgTsOO8SYuJcCVkih8ztM1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IvhO3mHOO1Xy5C+6lCldPa0fb48yOS24rPZGqBqySDgpQKtdByWLsfvlhM3EF1YcZWigaWFS1Fq8RT3s3AjW4cHUcN0c+ww6yZuSe3111VEZFlHDAUw/HYUfginww6yHgBuMNXIUGC79RcjBAP0nPTbubB8M+lBgJMM4Ato2LLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hFVdaVSm; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb49510250so5633821fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 00:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728892107; x=1729496907; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iO0qmb5fFaS9ZoOrx/2QCeJGDKpLdz16K/FEngmHUvY=;
        b=hFVdaVSmuN+2stppOmy87Wbtj5aZjvQlvnprFnFmcKnM4kIOrbmC1rHKv7zyvqHCW9
         kJbGdCbjDqllCaPc37/FLXfa6tKzBM2qoKfupDdcq58T8WemFgQH/6ImM5xqBjWxUaT0
         y9zlkgltzX8/SAbKSuTumdBemk0A/yL0oC+3tiKrUf4+G8/WUyJ26aaSZwgzIUga08wg
         1/GBZzwnQSHfT8nwq7qxvZHiH/aSie0FJIew30Laf/dP6pLmwHtwavOKr90zQVU+QMZ9
         8WDOp+8bhRyL3M7LjJ9XTQQiQ6eghPPlCPr1xETepihxCOg1U2vg2CCuWdIJyDxpqpuZ
         qEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728892107; x=1729496907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iO0qmb5fFaS9ZoOrx/2QCeJGDKpLdz16K/FEngmHUvY=;
        b=JaRUIDYgCJJ36+UiNEQAqlOrFXhUDL52cVS0AABHH2501WuMZfBB+9EVWCCyYwlLdP
         Zv5Qxdc4zRKF7Itn+aEeiu1kj1i146zdXCwc67cg9gjKaupUMepu96TsGtYfJpQLAnx6
         K2yNtMyfaNLYSHTKZG/kzEO5C2ftttK/nwBWwp3HlhHHUzI9fbW2btmz3pcJE/Ly/BZf
         85ZplcDQD/PFAsmgOxjAQXWo5rFgKQjJBfRDm39rOC9LNeAE6kt7P3h88QquVcmQTiiN
         /MQQzPRraho4K7uD7qFMcdT3nrMq1JFI69rh9kkEowJnHmFk7OqM6qCZ7FXQ+87dDi3H
         CJDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk2iM2dcU3wKIc5mSWWXSnDU0XdPh+Rn+PcK4kvs+fSVNfhc/bdMLkXVRjCXWE4MZ6qSzJME37sVFL@vger.kernel.org
X-Gm-Message-State: AOJu0YxUdCd8Gmnf462eXYEvvXUnl8Iy3Ddzrb1OW8hr1WuoVtzSA/+Z
	Rqw70ZTRQMNTZc9JP7ca6yxH4jW7RtJtZgefzPzt0p2R4FFcQEY+yz6df7FDZMqAeSZg7aj9rtG
	r39xUORwH9+Nfcv1Tlv7nmaokRpQ2536md4dUBQ==
X-Google-Smtp-Source: AGHT+IEaaSunZ6gUh3hegbA9fiDYoPVMZ9khBUiKHCQtjENpWK/DXfFqz6e7LMXXcZPy6PPz25DZFi5RAM4eYExh368=
X-Received: by 2002:ac2:4c4c:0:b0:539:8e77:9129 with SMTP id
 2adb3069b0e04-539da583e0fmr4525672e87.44.1728892107581; Mon, 14 Oct 2024
 00:48:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010-gpio-notify-in-kernel-events-v2-0-b560411f7c59@linaro.org>
 <20241010-gpio-notify-in-kernel-events-v2-5-b560411f7c59@linaro.org> <20241014021140.GC20620@rigel>
In-Reply-To: <20241014021140.GC20620@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 14 Oct 2024 09:48:16 +0200
Message-ID: <CAMRc=MeoSnr-z=fmfRoTU-vdL_BAkTAE+0HiBaVUWmFG-bOTPw@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] gpiolib: switch the line state notifier to atomic
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 4:11=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
> >
> > +     /*
> > +      * This is called from atomic context (with a spinlock taken by t=
he
> > +      * atomic notifier chain). Any sleeping calls must be done outsid=
e of
> > +      * this function in process context of the dedicated workqueue.
> > +      *
> > +      * Let's gather as much info as possible from the descriptor and
> > +      * postpone just the call to pinctrl_gpio_can_use_line() until th=
e work
> > +      * is executed.
> > +      */
> > +
>
> Should be in patch 4?  You aren't otherwise changing that function here.
>

Until this patch, the comment isn't really true, so I figured it makes
more sense here.

Bart

