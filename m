Return-Path: <linux-gpio+bounces-14077-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E20ED9F9369
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 14:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF65C1885F3D
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 13:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5471215701;
	Fri, 20 Dec 2024 13:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PlrtsRtp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B850B41C6A
	for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 13:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734702059; cv=none; b=l0OrJbpWm06EayWloG4HT6NhU1Gy0d2sYrLQ018cRRliOSbpV4kGBOywBtK/ZCMxzC9SnV6hGTfo/EcsVxAnzJHfcSnbB1PuT6VgJgy2w4eVb6lL8vqs/rLns5MCXoXxRNhKxQatLrfxXcOaSd6vpHXbiw6ZcQAOLgOV1HJzzgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734702059; c=relaxed/simple;
	bh=Wb7iNHmEf3kwk8PZ83J0Vflb2+dZOrkblrsPmP2Xs6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EliCsuWLZPSXq+xMYZKrBVjGpujnuh3swJ1WcfMGffGIsjE3WSGYebxB4wIw8pzAovYv7NTjXmypjxm2BPbNoCLk3sy/5gpHwnQJFj0KRamF3pITyisujM1tZsLtzrbZZnfUyGdZ3k/T7VBbTGsz+KVK1WMCOz1h0ns0IalZdUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PlrtsRtp; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so2046141e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 05:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734702056; x=1735306856; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wb7iNHmEf3kwk8PZ83J0Vflb2+dZOrkblrsPmP2Xs6k=;
        b=PlrtsRtpJR+MCZuROhIz+hTyRIaxkL7RztJep+rPl0zojLMBYJqI5MfjNBgzmfOu9A
         rCE43D7a9WIShPDLSgWZlm/jWfAzrpHXtDMPcS63mF0i4/80Fyasj01t8zHwP4GCdT0E
         ge/3zETtx+fqW4zao3hIxh07hosx5R4t8TW97T2hvXMgWqqveLgaeEkroouR7MHrp/7f
         7YdYGsHrwE1fo/p7P1X/N9lEx9sY/9Ow+7kwzBFgXiEbeAi2qvoyEq3nQbpSoIrbgW+d
         47VdldqxJ8lhKJf2kTjBZ1nr0RVn3bm/PhtSf6OkXybKa2TRRzOIuYA66jm51HRDRoVh
         H+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734702056; x=1735306856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wb7iNHmEf3kwk8PZ83J0Vflb2+dZOrkblrsPmP2Xs6k=;
        b=kCkVbdZXV6DK7kfd9ytd+BcxmTzC3FD+iNyUpP8nXZy0S5cylRliEAbX2vzTC00WGo
         IlwCLLBMuNKoCbB/XlU8ORSMwV1uV9NUmZUZ1+grM8G81uvlVgFoFMy6qFJbwipsB4cb
         Ojj17CnBOQ2cSLj129Jtain1qI0WRO33mMJxYWfQJfRnHJWW6Ch92xFgRh/OiUSa7inC
         K768HKPepWqHJjTPjAyfHRHad4/cp18kwaczAV1JfNNTjclaNgLaproVv/aJfQAJVb1Z
         jiS0KetM+QCRaUUHD/AYHTaMhUij2+VzAOn/90aGt4hhHW0SQG+6eVJ79g50bSeCDXQy
         xAxQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1FeFd7xmbocSTMdioZUjO7+pMWeezXpffddWiFzIuY/Lsxyqz3M2F/EX9V8R/v+aRcu+jSQ9GDHUY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+g82BAdKrdo7fUHBX37fqercvFAmhteZcZ6Aq2DsGC2h965EF
	bB3A4of/ZowmfM6T5k2FIPpooyJgEQrHNVKv5D5SHHm/KWaxMA3YKKPVJ56puKM6DK84lELjg63
	eMvBo9NKc3Ahwnlo5KS9GYbDGoisjcxg36LNwqQ==
X-Gm-Gg: ASbGncsSQyVy9VtnuJMJ/RhE6+xG9sk6EORbQ6ECwNKsRFkK12AnYe+7UgUUccoYvrB
	eGRaI9q5Q3ZLfs1Kanj8NnYI0uZZcYcdXt6bghp/bMmSrarHEyoKiNk6bQHMTKKcTwMVKIQ==
X-Google-Smtp-Source: AGHT+IEMcr6UeakjvG9LcaBj7crEG/f7t7TlT4cYf0tYtIrj73ltbIs/soNZTMABMCsyh5ylcV4ql8R8oH3XQgmpM/I=
X-Received: by 2002:a05:6512:398d:b0:540:1a40:ab0f with SMTP id
 2adb3069b0e04-5422954b160mr821931e87.27.1734702055700; Fri, 20 Dec 2024
 05:40:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
 <20241212-dt-bcm2712-fixes-v3-3-44a7f3390331@raspberrypi.com>
 <CACRpkdaB9kqcjmhaXd5RxpYvqdSVMZkj0wHAtEgdqDs03+wzJg@mail.gmail.com> <CAPY8ntBJqukSJs7VUXvUFAsiKqNWknL8VjgtQG_VAEmw576EPQ@mail.gmail.com>
In-Reply-To: <CAPY8ntBJqukSJs7VUXvUFAsiKqNWknL8VjgtQG_VAEmw576EPQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 20 Dec 2024 14:40:44 +0100
Message-ID: <CAMRc=McmtEuc06YdEOXho8hkW30hYEYOtbOR3+mttmg4yrzrxg@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] dt-bindings: gpio: brcmstb: permit gpio-line-names property
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Doug Berger <opendmb@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Stefan Wahren <wahrenst@gmx.net>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Florian Fainelli <f.fainelli@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2024 at 2:02=E2=80=AFPM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Linus
>
> On Fri, 20 Dec 2024 at 12:50, Linus Walleij <linus.walleij@linaro.org> wr=
ote:
> >
> > On Thu, Dec 12, 2024 at 7:36=E2=80=AFPM Dave Stevenson
> > <dave.stevenson@raspberrypi.com> wrote:
> >
> > > gpio-line-names is a generic property that can be supported by any
> > > GPIO controller, so permit it through the binding.
> > >
> > > It is permitted to have a variable number of GPIOs per node based
> > > on brcm,gpio-bank-widths, so define an arbitrary maximum number of
> > > items based on current users.
> > >
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Thank you.
>
> > Perhaps Bartosz can just apply this one patch separately?
>
> I believe he already has, but commented against the cover letter
> rather than this patch -
> https://lore.kernel.org/linux-arm-kernel/173434013318.38429.8084137212485=
42013.b4-ty@linaro.org/
>

Ah, this is how b4 works. Even if you apply a single patch, it
responds to the cover letter (or the first patch in the series if
there's no cover letter).

Bart

