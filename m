Return-Path: <linux-gpio+bounces-7428-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5556907463
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 15:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D26F11C244B8
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 13:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63223145B20;
	Thu, 13 Jun 2024 13:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="B04IwCKD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1A0144D18
	for <linux-gpio@vger.kernel.org>; Thu, 13 Jun 2024 13:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718286734; cv=none; b=O0Exbulsw8aG+pu0sX4u3ErsgI8O4xD0fGSH41WrhbqVrkjPszjG6RjEzgey5rKezHceCdu1+5hI3S76zls8IqsKRZ5Flla/2s0OIxYuDLBI53FW9PpYlmkHhERwKhteebeFov1XnSPrTaBGgzOD2je9x5XWMjVKeIkLc9+TEBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718286734; c=relaxed/simple;
	bh=Drw+bh0vFOGcaS/1pHzqey5YbazBzVY0YTip6dwSx54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oyfAcVy6cdj4WsI2GVaQfTg0t/gX6qEl+PQjeR6vdcAnOxWzV9MOzuLygHbavIg1uw8qqzixAlMaJlGL21CmJnorj3ayOnjq1CZLfMa48s7WM4EhZMM2yDw9ih2uxxyVl8uiCFGUaEq6RFTvKpXr2oe/5lYbH0BKZkk4ASFyvQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=B04IwCKD; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52962423ed8so1310124e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jun 2024 06:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718286730; x=1718891530; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Drw+bh0vFOGcaS/1pHzqey5YbazBzVY0YTip6dwSx54=;
        b=B04IwCKDjg/tg2e9IGGzOrQ5wmROWb8oVRR3FGyae9jkSvexAMBHD6uxf4u9F+v7F5
         hdPmxYA5aNPUPcXmmg9bdoZnVx/uPwH/S5Ha/iO233m3Ef38JloMZ6Hv7UyBvvsHNt5O
         YqDWBMpa/uBFlDBKT15fNDVD/nRVIa16injiY4hhYAsywt1w49MupC07nnjKMCl2/hKG
         cB+/EKFKaPxzv24hG4rm6W3NRibwm3PwVZmLX7DOscGePHpWAyR1gC4PtFqo+pE+14Q/
         KPVFv3hpLiDNzuhGX1Yp2gP6iEQwtYYrkq3hLXR7596eTdexxp16vmbNQrZWoqzVTjUI
         ZJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718286730; x=1718891530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Drw+bh0vFOGcaS/1pHzqey5YbazBzVY0YTip6dwSx54=;
        b=JOyfXd3/BFPD5aP5CTuw1I5aLBG2mP5OzSY6RDEeLxVfwdRYw7HvGOJSmqW9IBPI0E
         lvb0Vg6lrg12eYt2fWiBMsINXign4Z5ep5wOATZIMSxQZbVkC4Xonq7Qj/kgl/p9DRya
         TFEvIiuLAT4+UfOyqHiHmGwE614Zp8Q6jeWF9ujE4ZKfPq/3rppFJMRRonyfKhWAcvh2
         xWKuCB5D6WO+1t6wmxOVjAJm5uko8vzNPzjQGYPy1cJFCM/XYG87YxDRjZu6KwRNoPVV
         l6bs3tc4kEZH/LhH7POM0AQTlyHAiCUh05I9AOkCr1lQjKLdnPybD/oOmgtnC+wyOcVt
         JSTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7/TPPufKbqSOuzMUNNCWkXR6MXaMhKjzj8IkmuJ+g6juCElji+yiRpMNh+qXhiONPQE049MyocPDQaaTrcyspS/xm2EJDlrAUZA==
X-Gm-Message-State: AOJu0YwSACYPFpALez27Y6kcW+51BCsb6AFcBaKmOAmu1V6zf7vtZdPT
	MebOiQnQml5v6E+PQJJDzWi0f5lF7CoC1YCUN4qyWKmdsSKVm+o0LXBlEMbD9oTN79EPTHgvd4o
	Nlo668xXRDCqcjuKOIUbeFlgM73G9wj/ErqETNg==
X-Google-Smtp-Source: AGHT+IG0YXfW5J48LhqDyLUpQ92RDHLHqz9rgqm6jSFjDn0RmWaxIXpuWTs4/nVwj+KKnHLtEzbv/tMmMCsmcr7MsEs=
X-Received: by 2002:a05:6512:b24:b0:52c:9ced:7508 with SMTP id
 2adb3069b0e04-52c9ced7552mr3490962e87.13.1718286730432; Thu, 13 Jun 2024
 06:52:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610112700.80819-1-wsa+renesas@sang-engineering.com>
 <20240610112700.80819-2-wsa+renesas@sang-engineering.com> <CAMRc=MfZ11U+kAh1+K=DxtJ=QL+cY7Q_sBN4sQDF-RNgjpV0QA@mail.gmail.com>
 <jvnvx7a4pn6evrp5ehfrt4qsiuprq6ogvrue2a3uupwtydmgcm@2rvat7ibvgb4>
 <CAMRc=Mc4__0zzJZG3BPnmbua88SLuEbX=Wk=EZnKH5HQvB+JPg@mail.gmail.com>
 <CACRpkda==5S75Bw6F3ZLUmf7kwgi_JkByiizR=m-61nrMDWuvQ@mail.gmail.com>
 <ce1d8150-c595-44d5-b19a-040920481709@app.fastmail.com> <CAMRc=McpRjQO8mUrOA4bU_YqO8Tc9-Ujytfy1fcjGUEgH9NW0A@mail.gmail.com>
 <CACRpkdYtLDA3518uSYiTpu1PJuqNErHr9YMAKuar0CeFbfECPA@mail.gmail.com>
In-Reply-To: <CACRpkdYtLDA3518uSYiTpu1PJuqNErHr9YMAKuar0CeFbfECPA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Jun 2024 15:51:59 +0200
Message-ID: <CAMRc=Mem6HN13FOA_Ru8zC-GqGGLTsQiktLWs5bN4JD1aM3gHQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/1] gpio: add sloppy logic analyzer using polling
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 3:47=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Thu, Jun 13, 2024 at 11:43=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
>
> > To prove this point, I even moved the gpio-virtuser driver I'm working
> > on to drivers/misc/ too as it isn't a GPIO provider either and merely
> > a GPIO consumer with a one-shot user-space interface not conforming to
> > any standards.
>
> We *could* just create drivers/gpio/consumers/* and an entry into the
> top-level drivers/Kconfig to have those appear right under the GPIO
> providers...
>
> Yours,
> Linus Walleij

That would just add to confusion. GPIO consumers are all over the tree
after all.

Whatever, let's keep it in drivers/gpio/. Greg KH just shot down my
idea of putting gpio-virtuser in drivers/misc/.

Bart

