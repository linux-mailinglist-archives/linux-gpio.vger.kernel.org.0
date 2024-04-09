Return-Path: <linux-gpio+bounces-5250-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4113889E17A
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 19:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5025B23864
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 17:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F47155746;
	Tue,  9 Apr 2024 17:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PM/5HHru"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F44515539C
	for <linux-gpio@vger.kernel.org>; Tue,  9 Apr 2024 17:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712683499; cv=none; b=b/2HCOPl9ycz1hUWtdkWZkj4Ifwdr1q+H94UlPVEuzOeiKwal7+KvfD9Te2tsx33tFwaCpdH2IJzNLDacNQn9jdwIIuypHTYNJ2/WFJ5NQxr9ShU/Q6gH19bfDiR551NAkRcNaw+txirlyjgy7uPm9vbFKXBnYnbCGNTzPns3po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712683499; c=relaxed/simple;
	bh=UyS87rbDBP9uC9iF4fOtAuObzBHCSMEiN1ZVJmVrCSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L0U4Z/Egm+WXaG7IpUNSL1swxT836EaMuxQgx4/eJAgFTqXwW6W+mDfzS1v9UiUSmWi5h57Ee/MmL2wzHMht+YAjTLSsp0OmvDUG34djokkZ8KE4m5Fjr3AfAhskfAGGk4uP7KyLvzeMn6ytuAvaoCc7N4LntKE13SWh1G9pvbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PM/5HHru; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d8863d8a6eso42935861fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Apr 2024 10:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712683495; x=1713288295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UyS87rbDBP9uC9iF4fOtAuObzBHCSMEiN1ZVJmVrCSI=;
        b=PM/5HHrumwG5P5otMz8aUqeG3qXEjO7brR/pRbK+oANvrgLuPtwT/aw6+EWRL+4vOG
         ns95h8np+Y9E7GJYjE8jOTMHuKrkbZ37rLYYtOcgy3qbIoagWbUpL1zf0fyBpzuUCMtK
         2Rr1Qj63NQ0GPI2b/6r4d9BPqwquDTICYwz+00ppcO+NW+b7Q9h83Ex9S2rxkoHKLjCa
         ghYdV7Ug24RJ88RyJBslmCCqQ5Kx0oZ9MaxYSrlWMcBcBJpFFsn31GhDZmGEYkkS+GJs
         vcBa94TzgcGcZf44Ziv50t3vbJfnrz6B0JR5AVKYs8ubL12N3f6zSTWWsniQAE6zokDD
         UFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712683495; x=1713288295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UyS87rbDBP9uC9iF4fOtAuObzBHCSMEiN1ZVJmVrCSI=;
        b=P1pq9PUj1mKbJVpshrnyynPJa1qvVdDkGUsYnXFRe8m26Tqm/tP76hyfVXbJTHizpU
         E/QsbRFvoXSPVfAzFwxLxQYlKcyc8k2VPu7WWQof2npCMq7T38ia2wHdX2/yeR5SoxjE
         ccJS98qXoAWx8OV5oAF1sX4QoKLstBbEAk30w02YtEgbQOoiYx71t7/jcb5ZlFEGQykK
         pU9YCRXsrqPDUAe3UPQcQ/uRzK21YseKG0vitHL7nJ2pfc06/f3jV+DmejfYZG0wQNyj
         ob6+jfkv0TR2U1Qh0ema2WWs3Y8+8wNB0r2UgDzMOAxrizNI51m13pTCeF6r2R7vkOe2
         YGFw==
X-Forwarded-Encrypted: i=1; AJvYcCVA1B49/1gE05tgpcFTqxR6pgc0mJ6e8fR9E68+d3Y9LxmaUfmVkIctXhrOdwTcBzxP8a9JySHo9vnWKkOgQREJzZRMHtHgbQ1hxA==
X-Gm-Message-State: AOJu0YyFyzDvkIgbiuRF8+HitVEXn4Yqq79lUkuOgtGtUSig+P92svxb
	2ImkJuZ09HPS3eVQO0aK892IWP7dl3gZzWcp5lxydy2Dad+w1mUpot5Lwo7Ix4rg5lT1UKsCY1S
	dd3U1KB7FwUU1axbTeob7GxBWRqXaKo5mlqqQpw==
X-Google-Smtp-Source: AGHT+IEEk+Uem+ljsUU6dksYPHYe+2B+Sn5U1mgvcDf4WkzCxW2XxuQs2pC7R+713jkzcEUKikScV+uWnh7KOWd7n04=
X-Received: by 2002:a2e:a30b:0:b0:2d2:7702:cb74 with SMTP id
 l11-20020a2ea30b000000b002d27702cb74mr393047lje.20.1712683495379; Tue, 09 Apr
 2024 10:24:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240409093333.138408-1-brgl@bgdev.pl> <20240409093333.138408-3-brgl@bgdev.pl>
 <20240409125551.GA69328@rigel> <3f31c7bc-de8a-4552-ba48-4432b335f413@igl.se> <20240409160516.GA211845@rigel>
In-Reply-To: <20240409160516.GA211845@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Apr 2024 19:24:43 +0200
Message-ID: <CAMRc=Md3U=sEypUOSzSiWwQasOxqLn1LGCCHE2fUU5ohnCkKqg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 2/2] tools: allow longer time periods
To: Kent Gibson <warthog618@gmail.com>
Cc: =?UTF-8?Q?Gunnar_Th=C3=B6rnqvist?= <gunnar@igl.se>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 6:05=E2=80=AFPM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> On Tue, Apr 09, 2024 at 04:58:52PM +0200, Gunnar Th=C3=B6rnqvist wrote:
> > Hi, Got a use case where a hold period is measured in more than seconds=
?
> > Specifically for a get.:::
> >
> > I can see a large number of use cases where the time can be hours, days=
 and
> > weeks. In my case, pin 17 controls a relay that heats water when electr=
icity
> > is cheapest. It is ok to only have seconds as unit but the range must b=
e
> > larger. /Gunnar
> >
>
> I was asking specifically about the case for gpioget, where a long hold
> period makes absolutely no sense.
>

One could argue that this option doesn't make sense at all for gpioget. :)

I don't think it hurts to support a longer period of time even if only
for code reuse and less surface for bugs.

Bart

