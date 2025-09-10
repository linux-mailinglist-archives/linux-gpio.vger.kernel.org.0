Return-Path: <linux-gpio+bounces-25891-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BCDB517B8
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 15:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 751D91C8143F
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 13:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7103E9463;
	Wed, 10 Sep 2025 13:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WWMGTWSR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACD72F5E
	for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 13:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757510162; cv=none; b=dBFJ9nSBBuNGkQ4RtTl91BCMTwVlgB4FxUgSZnSJwTk2enihYPQoIAZ8erQWiCfGASn2qsFywhOnGIJCz2t6tatUcs5QpZfTjWt0qJ8hO7glqlf2Tr/Wn83hC2+pThyFCSWLE2YAkHDXRKXQPSyRC+S6ElYmLpAClLwFZoOeerk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757510162; c=relaxed/simple;
	bh=yo7Oay2v74xec488RZqxezoj+sNijMpCAf5uHiFSGPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XgAt7/+3Kb1A2vFpDAgVFcwB7sDcqH8HEwfrRDhVMtQO97BsgztuIqrJ6pQPS78Gip0gdeJ1NAUH0Z0WscpVOaHQVliyBs48BNs38qVlZ2TXCDGwoELJ+x+WVwxF/R7537LNYmWKdjG/gCEwYz2Znl/a1GzmIGD5EatP/bU0gIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WWMGTWSR; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-33730e1cda7so61983871fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 06:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757510158; x=1758114958; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Peu4zI84KpRcObnkHpqIQWTW+16o2UvKwBzcfExZiyk=;
        b=WWMGTWSRBbC5vzrBgNnTdpLZwS3NRseV96mkzGmml4KBUKHAZKcuwYP4fmhmbGWQeK
         tVEk2RkxevMzUrxZQD9R412XOywR5iOMYqLwGwnlEfX2ULLJzkq8kwGJJG0cPAqcYZ5Z
         OfiOVtioxsqA17tStzq1ymqmBa6o3Nd9bSSZv5+ZMvKCl6IzfqZngyE1wT0Ft/YWzTv+
         HYqpg52nyJvYkpyskrb8Q4MSe+3t2fNuancSqo2C8Ndy3oQQWonat6j2Uzsok7jwCYOO
         lOMkNo5lnD/PiNGHi1XFtjUvf5Xb4StmYpvsObY4WZLJCsDrkB7VHDuUq36rikIHIl+6
         7qfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757510158; x=1758114958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Peu4zI84KpRcObnkHpqIQWTW+16o2UvKwBzcfExZiyk=;
        b=mf5I/J/QBUTUVyCx3jHE3WXYk/gOHQEmh8aBHGFF+v9hnCl8LAC7ODUs2fDX+najI+
         GGonXGubS3Sl+67+jOLO4S3DMSMpR+Ti2spRayoIt848p8p0FCkHJU76s8o1h/HCidy3
         4k8lhvO+7iCK1Cz72wLpnJgOwcka0jeKrTG7FUY9TMVoN0598iYq5ccHcvtUD/i+fXI6
         /MkuExesITkrwTPKgZOL4CaNC+bERl2BX2dXfoua+f3PSuGmGWyT2nNWDw2Osy7DqLtz
         Dwn2KAko4kaGH03BpGgglSDWn3PxfQacKVxwFcW7cIYa3hPlc1INA+G+K4vtWGctwO+W
         yDtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRL0gIZ3NRQIdE7fJ3vRIWUcWq9wME3OPxXOopwsIyxrBmsSYD7MKc+oyF38Vp5w4cd1TNWFSFnD4X@vger.kernel.org
X-Gm-Message-State: AOJu0YzQUS25AxxEbmxGmGai0lr1AAm36iar5+K5kQCpBTGECkQu7mnI
	vLWCR+7q2N9tc9EaVCx4l7JgIcwikYOBfwTsPC3kkM6LhfrSCoOQW2kq68GZzQJoQTAHOnnjHv1
	8auOlRp7QaCiA+JyNjGYUA4L9wKTBI2uS1fb295zshA==
X-Gm-Gg: ASbGnctRH+uV16kNgmQh1QKuFYD5toVMOqm/yLt/F1lJskf4t9+phVy18x8926EQQMU
	ee8HfmsalYL1bsD2CRsRMPbH4xZD1gEnm7szTUjR+aIpixQqmSRNz7/atEKO2GekO+aiQkmOwXr
	nppA7zO2cJYQLE4N2PglcHmnXFVvltzjAnB4x4KKeKLKK8LjeLm1EJ7EjhyvfucvabTnGzlnAd3
	wRbQJU7K9FqmyGZaKWStvKqszS6E1A/LagNlh9yEbj3zFOZ6Q==
X-Google-Smtp-Source: AGHT+IEnayP778KTGlDRKFGcnE7OiZz5Ap6nrCq5CUhddnBoMttgXnm1cRJ/L73LzdvJ7nxyXI2sQjhe/45Ih3WDiuU=
X-Received: by 2002:a2e:be91:0:b0:33b:6384:128c with SMTP id
 38308e7fff4ca-33b63841617mr51366531fa.18.1757510158259; Wed, 10 Sep 2025
 06:15:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908173804.3816149-1-mstrodl@csh.rit.edu> <202509092305.ncd9mzaZ-lkp@intel.com>
 <aMFzTaO7zGVgWNRK@ada.csh.rit.edu>
In-Reply-To: <aMFzTaO7zGVgWNRK@ada.csh.rit.edu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 15:15:46 +0200
X-Gm-Features: Ac12FXyQUcE4PEKS9I4klpj25TQWTsxm52DQhqCNvgW7RhiFrEgsQd7rQ7d9w4s
Message-ID: <CAMRc=McBdJ16RYvJM_R7pL+u3zcs_+A0nj5_5twP7KxWhW6VDw@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpsse: support bryx radio interface kit
To: Mary Strodl <mstrodl@csh.rit.edu>
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 2:47=E2=80=AFPM Mary Strodl <mstrodl@csh.rit.edu> w=
rote:
>
> On Tue, Sep 09, 2025 at 09:32:09PM +0800, kernel test robot wrote:
> >    drivers/gpio/gpio-mpsse.c: In function 'mpsse_ensure_supported':
> > >> drivers/gpio/gpio-mpsse.c:211:25: warning: format '%ld' expects argu=
ment of type 'long int', but argument 3 has type 'int' [-Wformat=3D]
> >      211 |                         "mpsse: GPIO %ld doesn't support %s\=
n",
> >          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
>
> Oops. Turns out this is m68k-specific weirdness. v2 will convert the
> result to an int and use %d.
>
> I'll hold off on posting it because I'm anticipating there will be some f=
eedback
> on the actual code changes that will need a revision anyways ;)

I cannot really give you much feedback because this patch should be
first split into smaller chunks that explain what each change is
doing. As it is: it's so complex, I simply don't understand it and
don't have enough time to try and decipher it. Please try to make it
into a series of smaller patches.

Bartosz

