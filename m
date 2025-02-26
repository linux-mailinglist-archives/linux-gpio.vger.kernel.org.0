Return-Path: <linux-gpio+bounces-16655-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 542DFA46A9D
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 20:07:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B6031889893
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 19:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0967923719E;
	Wed, 26 Feb 2025 19:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qqjLYAim"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043002248B4
	for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 19:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740596866; cv=none; b=MByr3qi3phDXo7dzZfISaCEserCCyuGHBON7W9QuXkEQMTb2+/HHzYmIIcPYixqah4JDlCNzyDzdxwlPQ6C9pQw4h0lesQ9DbrE5z2QvB0caLcAoTgB9ILBo0uGEYx5bMImE+21JMn3CAseWvwzILPSnkrY0j/4IQimsRxn5eo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740596866; c=relaxed/simple;
	bh=74iTAcb/Cx8HOEokwXjdVt5/pJFLEKIE+9hI+X9PkRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jeochAJdnFNxN4NSR+kk3CvlhiMowf6LeApNRAstgVTTWZ4KcinaPYkO0ZkmDWej1bAFmlAGfxAV5KQZkPH2ZWNaNV2vVdkmMtDIjfEfU7xxdY/DzjCGZDbxwMItX4ShTqav12ky7+6HrY+6Cd3eV1M9fWBaIGwFfbA0Vms/f6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qqjLYAim; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22104c4de96so1500625ad.3
        for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 11:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740596864; x=1741201664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74iTAcb/Cx8HOEokwXjdVt5/pJFLEKIE+9hI+X9PkRU=;
        b=qqjLYAimYhW4reXbg09qVUQCqrEToARSYK5rDCwtVrUNeyaUPY+18h1sbHoyWUJbjU
         G5guAP3sasZuRYJARas/ODAcDavNoucpY0w0PcK4SIn7UyEwbIAONhXKXk3WyWfQfUB0
         hLCu8BX0vAICYR/fdEO4bR6Y7JVvR7Y5XbQCrlkGTyilfxkPKFA3KImfAJkFTiW8aTKs
         tLmMEVRAf31HmG98h0aBW9oOlnW+ky3F3ivFmj9E4cJKtwpnKrx52lSrquUmVh0bWHMq
         Kab5ZUwZHk/RA4jNGZpfKCU/0D2qeu4bo8QtvAk6nPVDGY+c54278x8uinoHcfd7Wxsc
         Y9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740596864; x=1741201664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74iTAcb/Cx8HOEokwXjdVt5/pJFLEKIE+9hI+X9PkRU=;
        b=Jj1RTS2Jqvf9cQHwHpF/Qsi+RcrbavXNWjiBsbh7beuJ8cgelU51IzDUxTVtAfk/AZ
         LMf9HzHO7Qi7pL0yfAPO/+S9lo8+uOaCzR8XGhosKem8Tp0VcPe344leyIm+iwKWofo8
         eoBw7FCVyteiCMa71z3+PvyWeOC3byvNlpXLyotgyAYsg++pQ/omE+Amc62qGjQn6jLx
         eNm1Ik0h+n9XwdgzTXEULfGXUikCM6RIbm8tLmBV1QoQ6zywPELfLU2DB5R2Mxzk059Z
         o+S6sHtNxT4N3Q3YZLF1FvM9ENIM0XL9W24KSqkuJQJGJd5sFo9Z6FG4ASpueshytrxU
         x62w==
X-Forwarded-Encrypted: i=1; AJvYcCXkACM/UUEXD8guGCA1GVFuEyt0vTGpQ98Ff3qLVI2aqp/NLuMcge5ZK5ay8BuCZJ9hXVlsiGpT3UN0@vger.kernel.org
X-Gm-Message-State: AOJu0YzA52cEpLbaeYHEnYhj5TldwjmGgjXOWw2ENy0MXk87pmZwjKTH
	59YgVj36NMQtmpso8j9x9t7fCknh3RpyRYX/AF3UFme3MkmipnSnAtOSvzBXKbPmXCC+FtTfTyF
	F8HS3OzvlGutcebG6AGmaCCJDSHqmEoltpt4i2A==
X-Gm-Gg: ASbGnctQ6191hUjrwYX+a0jr+3mSiOVJGdppsseWoyt9tc9KEMGHLhJBOklcQ3cw2q8
	MyzQNHBudqNJ5JRMKGSl9fmCjs8yOaDhSis5Z9Ln7Zuy5lwjClneBEQXWiA3A3hi52Frx7gXlR1
	+M8gAmZC5PWygWM0/TQSuTQYr5iXFaog2Kq141
X-Google-Smtp-Source: AGHT+IF/ZlqbZNscuAv4y5BKa5uBWniMfO9yRLHzDDScht9h/n342Sm0PUkRrR/hUrDnEqmmBESHynimK4vYkACYKxk=
X-Received: by 2002:a17:903:8c5:b0:215:8d49:e2a7 with SMTP id
 d9443c01a7336-22307e72899mr127525345ad.50.1740596864185; Wed, 26 Feb 2025
 11:07:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com>
 <CACRpkdZXm9eFJ2nzb5Gsm_ddirt6XZTQyu2G+vX2FB+=L6Lttw@mail.gmail.com>
 <e5bdcca6-4d1b-451c-8fde-990db9db23d8@denx.de> <CACRpkdaGeV3v80QuWwus5rg9GfKkT_gzhvRgfOobnDMUO2cPEQ@mail.gmail.com>
 <d29f36d1-53e0-42d3-beed-cc228553f658@denx.de>
In-Reply-To: <d29f36d1-53e0-42d3-beed-cc228553f658@denx.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Feb 2025 20:07:31 +0100
X-Gm-Features: AQ5f1Jq-pWyD3sWfp-8VhRDp2Dzqg7xfBPFVcesQuuBtaE4ZW4iZN8XjCHyrFIc
Message-ID: <CAMRc=Mf2Lagr7d4hyg1epAVgABim1WCp1ZWipdnTGUP_qGsS2w@mail.gmail.com>
Subject: Re: Replacing global GPIO numbers in sysfs with hardware offsets
To: Marek Vasut <marex@denx.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	Kent Gibson <warthog618@gmail.com>, =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 1:43=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> Can we really make do without export/unexport ?
>
> Consider this scenario:
>
> - User open()s and write()s /sys/bus/gpio/gpiochip0/gpio0/value
> - User keeps FD to /sys/bus/gpio/gpiochip0/gpio0/value open
> - Kernel module gets loaded, binds to DT node which references the same G=
PIO
> - User write()s /sys/bus/gpio/gpiochip0/gpio0/value open again
>
> I wonder if this could pose a problem ?
>
> I suspect the kernel module loading should fail , right ?

If the kernel module in question registers a driver that will bind to
a device which wants to request the same GPIO that sysfs already
holds, then gpiod_get() will fail with -EBUSY. In other words: even if
we drop export, there still has to be some way of "claiming" the
GPIOs. /sys/bus/gpio/gpiochip0/gpio0/request? I think I prefer
export/unexport.

Bartosz

