Return-Path: <linux-gpio+bounces-23934-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5869B17FD7
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 12:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 916253BE969
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 10:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 000AF21D3DF;
	Fri,  1 Aug 2025 10:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oRQ3WxiZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4F020E030
	for <linux-gpio@vger.kernel.org>; Fri,  1 Aug 2025 10:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754042455; cv=none; b=EOCPoKt6xoGjkAjEZtjalLx40bXqFGL00bQ7WpkYDlssEUoyoR21y+znQhE58V8Bl4ni3+SbIAzHKtekGAE22yZXBG3/4ZfCIKAKHzxseWKgbJTIDXUs8VzRVCvwyoyyN6GuQYW4K33ZTKiyjojTp/rIwL5BQCEx67kKBqGgnkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754042455; c=relaxed/simple;
	bh=4XYhOafYN+ZHDRA+V7FvzuQA5dE7qf9zd85mMyDYO00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fJJt6+wGcY++prZaHdl8GcCWQ90NwXv8HFyX4R0j06YQYPyL05H3xoIzYoYZVYto3uLQTReOz3C52QT3I87CmA4GY/JE4RPnPOla/BsA88DOM1WQJn0EWR7RwAB9RQffTkYaDiSrCe695CKVbYfCRblM5tSu2pl7CtoCBkCkapg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oRQ3WxiZ; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55b8b8e00caso1424457e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 01 Aug 2025 03:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754042452; x=1754647252; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XYhOafYN+ZHDRA+V7FvzuQA5dE7qf9zd85mMyDYO00=;
        b=oRQ3WxiZ5Z16m4oVlBI8RKRve+08ln1Of9iL087TJNpKt4CB+wxtDO6KABSZGWzRZL
         XlIMO8gJKmtHgNqgtmzC71QuUwzGAY3AoajM5QEqdPdhnALuc1f66VTQARROrklQetAl
         NBcGyMhpVF6khZZitTANN/W/+VbbI7mynNQCsrKqev0jJz4E29VrqaR2Mpe9Y7SNb8G1
         adOuvl9F6QZ0g31pg/GloOjow1yUKSaE2unrgSpyzmVYxmzp3mtMW/n3OMlDnNgXIiCW
         0d16lIfac/Yd9X4JEDWFN7gNtaxgOAQ32xrlZYWqqKmkDSGOjNTk7kgby6w7yRbVpvrS
         8iOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754042452; x=1754647252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4XYhOafYN+ZHDRA+V7FvzuQA5dE7qf9zd85mMyDYO00=;
        b=JZztkjG9L74fktm3fe+aMFOZeKYBbziDHs0dD1MA+dk4K4o2aqAJlsM/GhCGD0oYyD
         LE4RAo7lwBWWg68ttympMMbYLQ8cLuW1i7h16ABHQGh7lFbIXra+XaU/3pj9EdBtuRcX
         Ox4TN8+Ygcqg1MebRudk0felB7Ko1yOF7/wLzQ/xDkv4oKYJvJngafGNK2TFL/YaNZHA
         Erd/SxIfWzS9ejsxHlcE35vg+BwdCIP54sSFAYwHTRQpaMZaAME3tLKDXOZ4lQK7TYSD
         U3pRN/Oz9ThOxb5vlogt4zAMSUsWm2nHGU22U0BBfqOSXVfjsKnWJfqczRnWKN2pu4Kk
         WQ4w==
X-Forwarded-Encrypted: i=1; AJvYcCUULxQsBqppqor/XWbhdFG8Dfmdg9ioZLMnEewOSwyyiBT3IZGaQuaYvF9uPlg7oLo6q13cvIByJ3cN@vger.kernel.org
X-Gm-Message-State: AOJu0YxVmf4k072CV0hp315rQgqke85fNqi0qtyswaihV3rYp24L+Js2
	/BVFE18+MTGkvhfV/AZg+Yb49uteWCVnCOaNo5Z7yxhPnYaBTy4ydqS7lEWhnYgFUuXWkAd47Gv
	1yUxcJ5EgnFcJDmVn5BvqFa7usgWP3KAwlhEvWIxtIXC3NUSuIi3vdXE=
X-Gm-Gg: ASbGncuDZuvr0Oe53qq46SbY1WsiF/PZM2tLZBT4QJbTsna6di8ftcopTffLJlWzivE
	PBtb3KURG5pSGB9SmW5iXRVhR41QsBQ0jExkLUzjannpMofUjiKCH7Pc2HBcGKrYl2VkKNx6FIS
	8g/NWXeQP0jYznpqHur67lG3vYZlZB5ttjx2biiJL9uFXg3MxSrLvNVMNZbh1iIWaEd21RCb+J4
	KjvHCh0Q74DMCIwcNKY5SLpNG2UUVipbHN5zbw=
X-Google-Smtp-Source: AGHT+IGsfrj9/UcZZ3IT9iN0ClFRP1dOgRmNT9aB9KdZPdUecIUpJsmwJ7SM430Goouo+yALYiWE6n4XHTxcPyFccvA=
X-Received: by 2002:a05:6512:6089:b0:55b:8e2e:8cc7 with SMTP id
 2adb3069b0e04-55b8e2e90ffmr768638e87.42.1754042451689; Fri, 01 Aug 2025
 03:00:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717073859.1777226-2-u.kleine-koenig@baylibre.com> <yr7eydif5mguqpflydthhigpsenfum3agqie4wufbf3624tvjb@3kog3guxiwin>
In-Reply-To: <yr7eydif5mguqpflydthhigpsenfum3agqie4wufbf3624tvjb@3kog3guxiwin>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 1 Aug 2025 12:00:40 +0200
X-Gm-Features: Ac12FXyybl5vv3P0ZuJnGuswI6rYy8pXe3j6y__RU3PEiUiKTCeBq9RQGvo6Nl0
Message-ID: <CAMRc=Mdz1b4UxtQBTc2j7HjQQDjxmwODjZSEhfmiOMnJ4aSZPA@mail.gmail.com>
Subject: Re: [PATCH] pwm: Provide a gpio device for waveform drivers
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-pwm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Clemens Gruber <clemens.gruber@pqgruber.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 1, 2025 at 11:58=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello,
>
> On Thu, Jul 17, 2025 at 09:38:59AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > A PWM is a more general concept than an output-only GPIO. When using
> > duty_length =3D period_length the PWM looks like an active GPIO, with
> > duty_length =3D 0 like an inactive GPIO. With the waveform abstraction
> > there is enough control over the configuration to ensure that PWMs that
> > cannot generate a constant signal at both levels error out.
> >
> > The pwm-pca9685 driver already provides a gpio chip. When this driver i=
s
> > converted to the waveform callbacks, the gpio part can just be dropped.
> >
> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
>
> Applied to
>
> https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/fo=
r-nexxt
>
> as 6.18-rc1 material.
>

What about the v2[1]?

Bartosz

[1] https://lore.kernel.org/all/20250717151117.1828585-2-u.kleine-koenig@ba=
ylibre.com/

