Return-Path: <linux-gpio+bounces-17413-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4823EA5BDAC
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 11:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7043B3AF4D5
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 10:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D96E22FE06;
	Tue, 11 Mar 2025 10:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Lc8tyR3T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBAB22F384
	for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 10:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741688485; cv=none; b=W5rMKFcmuhlD1tnfOtPGVaTB5F5GhOaHhPjsqwfoqJg5icOihvB5fWYSUwb+0S26sZq2oE51wqbbfZKTljimB4b64vJM3XO5xSwC44zIDuY7NHcJryh65ZdRVvw1g3oDKj5/yOeGtbo3rsBmvKmplGqLIASmTof4lzNqUtYZYgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741688485; c=relaxed/simple;
	bh=qFuZvUC7TOqU9SduHNs/PMCAxK1aOpCzKeMcc0YihlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EbsfeueS1lGrlgj2J65cCH7MyALiDv1/I4uCQk8x/8Uy89O827/idc9tWrPjJ2s7MSpjRx9G/V0MRHZUfMNuE6As9CNsP+A2NhEqh1ZqJe36L6xuVNBnR5LxfsCal0URFLE7NLoH6J5OZYsAuNfMTEyf2byUFbq8VJyNbKUxdQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Lc8tyR3T; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54943bb8006so5859606e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 03:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741688482; x=1742293282; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foWyTmy8PqiEjMoKnDTPdqja2PZrapAQLo9RLC3uipw=;
        b=Lc8tyR3Tt3KgPjatg6oAhFfx67vvKRMHmChjv5m3kyrZ7zOX8ZnrGAGcmLFQqO++Kx
         GDivUqWPsdnWgz+T0cbYiy8VYB3cjrECtB7YDH1oOkjeNrTJMSwrHrZ9YwDsROZiA2Ap
         rr+AA3zszR4DHFsLAxJg7KiZMFeAWn7bqPhI1Sc4wdon8sn6d4fSJjDk8D0ZsLFGo3Yj
         YLtq3jyCzIjeI0jmgTbnP+GiD91sMs/c9JT4jEdz4XGQgFl5iwE4jo+2uzq4iukEEsFA
         HhcvazwMibXZLA0LLh2ppoaHqZeFpYXpKZ4j3DKK2XQQ4dHNQja6YJtWFYr1oaYYaIup
         g2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741688482; x=1742293282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=foWyTmy8PqiEjMoKnDTPdqja2PZrapAQLo9RLC3uipw=;
        b=bFsoBiXE7SOLMAVYsJGxKes0QzkJcWIYmsI+Y7cCLWNCkrW0QxvPPvoPtB0Mo/IMX/
         NdEwQsb0NbeTz46Aii6Wnoc9dfLis55dfQJsePGrQbLiGObKGY4zxZXZrdHaTjfu7nK8
         cxotQcS7jp9LMHDkMfTiS7cGnTeFVpOwA1RIv5nkAA0L6/HjNaoXtEI5QCXJvZlWoyZq
         NxwelDTlt2yw7nMAQ67H9dtRjKzTz/usHVblAAvQV50gH491Z3SJg8mc/ZyhMofyDyox
         0ojhu9nzYm1zdRz2Sh6Zlo4xDytO4uons5ATOuVbuj1zdUocRazQJYpOBUKeozBCiwn7
         Gc8w==
X-Forwarded-Encrypted: i=1; AJvYcCWurLo6fppqhEfhjiaIeqVHLP+f2t8LEzyMXgddb1pWxL8anrtFmIiv1xHc7F+KmGN+OhYw41Rq42Qn@vger.kernel.org
X-Gm-Message-State: AOJu0YwKIH/LMgY+vAv7AVXe4ZU7mMmfTK7N058oljMKrcLN6HmS1ZoG
	uyBbTshLbKuUSXQeGnIAQ/AghebA62j5f8sXMu7llMQlYa0P/1HBlxU6yXNbtCCGtsL8uGdai0T
	WOQeSKbodv0X9otQ6oLxxwpI+YHjM0SF5+iEXEw==
X-Gm-Gg: ASbGncsBt9gS6Vf3ErsnczVtUAziL/TjoP+KdKwzkffhGg2JssQFiWIHGmrPON6OIZf
	Z6tSLVmWj4d12i1D5uzdY+5LFTDwgpKglWaTe2GC0Vx6Zjh7hlaVJgqFgzDJn5zn4xPmUvWGIM/
	uwg7hKOrEAxsoLDOK73thDo30Zurz2Q1rvRPidtlSwJI3UW/UJVfA1Ot7+
X-Google-Smtp-Source: AGHT+IGllA6yhtds8VMT2lHADXWnS0biqa6Ag9pw1v5+ViCqZafTFWoccQ/gu6d8kouYvytw814JiHgaPZHWxthinyQ=
X-Received: by 2002:a05:6512:ba6:b0:549:8f21:bc0e with SMTP id
 2adb3069b0e04-54990eb1987mr5783501e87.32.1741688481654; Tue, 11 Mar 2025
 03:21:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311110034.53959031@erd003.prtnl>
In-Reply-To: <20250311110034.53959031@erd003.prtnl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Mar 2025 11:21:10 +0100
X-Gm-Features: AQ5f1JrWVQASCgzejqti64i4A72raQlwhGXInyikYOegJnvRZTGZ_KLvydvK8SE
Message-ID: <CAMRc=MeWp=m1Bi_t_FCrxFOtiv3s8fSjiBjDk4pOB+_RuN=KGg@mail.gmail.com>
Subject: Re: regression: gpiolib: switch the line state notifier to atomic
 unexpected impact on performance
To: David Jander <david@protonic.nl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 11:01=E2=80=AFAM David Jander <david@protonic.nl> w=
rote:
>
>
> Dear Bartosz,
>
> I noticed this because after updating the kernel from 6.11 to 6.14 a
> user-space application that uses GPIOs heavily started getting extremely =
slow,
> to the point that I will need to heavily modify this application in order=
 to
> be usable again.
> I traced the problem down to the following patch that went into 6.13:
>
> fcc8b637c542 gpiolib: switch the line state notifier to atomic
>
> What happens here, is that gpio_chrdev_release() now calls
> atomic_notifier_chain_unregister(), which uses RCU, and as such must call
> synchronize_rcu(). synchronize_rcu() waits for the RCU grace time to expi=
re
> before returning and according to the documentation can cause a delay of =
up to
> several milliseconds. In fact it seems to take between 8-10ms on my syste=
m (an
> STM32MP153C single-core Cortex-A7).
>
> This has the effect that the time it takes to call close() on a /dev/gpio=
chipX
> takes now ~10ms each time. If I git-revert this commit, close() will take=
 less
> than 1ms.
>

Thanks for the detailed report!

> 10ms doesn't sound like much, but it is more ~10x the time it tool before=
,
> and unfortunately libgpiod code calls this function very often in some pl=
aces,
> especially in find_line() if your board has many gpiochips (mine has 16
> chardevs).

Yeah, I imagine it can affect the speed of execution of gpiofind,
gpiodetect and any other program that iterates over all character
devices.

>
> The effect can easily be reproduced with the gpiofind tool:
>
> Running on kernel 6.12:
>
> $ time gpiofind LPOUT0
> gpiochip7 9
> real    0m 0.02s
> user    0m 0.00s
> sys     0m 0.01s
>
> Running on kernel 6.13:
>
> $ time gpiofind LPOUT0
> gpiochip7 9
> real    0m 0.19s
> user    0m 0.00s
> sys     0m 0.01s
>
> That is almost a 10x increase in execution time of the whole program!!
>
> On kernel 6.13, after git revert -n fcc8b637c542 time is back to what it =
was
> on 6.12.
>
> Unfortunately I can't come up with an easy solution to this problem, that=
's
> why I don't have a patch to propose. Sorry for that.
>
> I still think it is a bit alarming this change has such a huge impact. IM=
HO it
> really shouldn't. What can be done about this? Is it maybe possible to de=
fer
> unregistering and freeing to a kthread and return from the release functi=
on
> earlier?
>

This was my first idea too. Alternatively we can switch to using a raw
notifier and provide a spinlock ourselves.

Bartosz

