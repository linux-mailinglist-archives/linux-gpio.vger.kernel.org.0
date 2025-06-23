Return-Path: <linux-gpio+bounces-21996-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A109AE37AD
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 10:02:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BF661892B38
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 08:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C7621F6667;
	Mon, 23 Jun 2025 08:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="D4YRDySO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968801F3BBB
	for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 08:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750665742; cv=none; b=jhe30Bsf1rQ1XCwwXYwVZQgoiICrLYX5a7ANzFrL9J+xcf8iFoOT6bFwiwqzwYQp1MBoJRBkv35tfeYk3I8KVSm4kxJBwULw607LvU51UFU4BxqM1CttAFcPbeSFPbA8AZehmguURjyK+13fnNgeQxHR0iiSwMMdCXm5m2lvCRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750665742; c=relaxed/simple;
	bh=Q1XA+JXOXCtWnCp7t/Ht+LN00pee1Odcfo7xDqQpe9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/K4sLbovD69sOQmj1C+/8JDsa+lj1esWEbtLvPGAItAU3w+0lUpz4x3r71nQPF8qlXZVl3JlK056VlwhKeZssiefwmJctRkfyoCY3ITegu6uWeWQtoSrH42iVByL/0UvP/RK3W+K2W7geom1cvVYaDsnuH71UMHZN3NEFBWhWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=D4YRDySO; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55351af2fc6so3955570e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 01:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750665739; x=1751270539; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90hYW1+aPldHsph4xdNI+bk1oOWB4WZEP2NZvvKLy10=;
        b=D4YRDySOH9FmimArWTAMwZnEKhzSqXMdMjCSFUeHq+cvo21FE+OnsuSMgzWsW2Y1IY
         Yw5YA2stcOLa7+MnvzxbFQsWjZNvMcjpJkxxBbsUpOeErSaHaDgA4oGylByJFsUcJ3ad
         IQtISQ76Yjtp6O0m6tiBKpqrl+MoEvhx7gnDqwSouIlSIQoy0tdTdcI85ewXzuMehz/a
         3rFMBTE39bkRSW9RuB7PIA2iKouHOrWgvMTfhNMHjeQO59bDKaz7BO5nhxtm8o6wyem8
         oGyY2h26qZz3wqFDx1AtwDFT4xBajozUSf5aab35U4tX0SmLF8akfz9W2a5eGDJGbRRg
         ZlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750665739; x=1751270539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90hYW1+aPldHsph4xdNI+bk1oOWB4WZEP2NZvvKLy10=;
        b=S7a4LSlT5sOXIbT2J9xwT/w+cuRUr45uxD6Jg6bmqJF4HmTtMpayvyXIEGxUD8NuJ9
         oi8PcuMYTdRuS744mc711zEkGnVUzEY6T87aK286BtwqY6cKRkvCqa2uXg4PwYlLzgEm
         Zlty1m03tOIXhB3RLQPkBBnWyAyDEctkqj88rSFjuzqJJtXakr1lddFS52uyiUrAGvil
         n8u1jZasMzGk8SjHfnGLDfdy56QPzKM6SJZQag5J0e5ZjzP4ebsbKGchx0hlvEUT9uCM
         i9q1gewJnlg3KFl88T1I1BaC4tD8CWMXfz6sAwHNVUMEY/Is0dlxpfEuwYjanusYu5Lh
         ytbg==
X-Forwarded-Encrypted: i=1; AJvYcCVTBYOSPEAMd/swGlpgoAcEgPm0qBf3+MAghYW0pUGYUYCZVkLu2+yf3lnrkCY3NXPO3YxIbrDkhkI8@vger.kernel.org
X-Gm-Message-State: AOJu0YytbY7neMCtw7Jrf1jCBMYrP1D9e0itapNa2BKT+SqCrNzXlCXB
	njxG+PRnqHnELF0OU2++7RhzOBqjnaC3vipNhjz1XKWL9Z25QvAECKv8TaFqPiPmgZZD3fKWOBm
	JxUgAsssubClnbZY3mzKHT5OkztJRZt1yctVFDFVZQw==
X-Gm-Gg: ASbGncs/FfvkHIhiHNTJxI+oeJdTpGfmR+pR4qFyvxpi7RH/eqsjnn2/Ev5JOnbNKaX
	i1D82ca1I2b/D4HwPzo1wgSAuQ++wXaTBT/bywXAc5J00ONvYHRc5MmeDl9xT1qV0MwSoHqZ0VB
	yqjlcnh0YMwBKnd+7mOmku+O8TgmiVWm+YaRLbS90oRgG+SgB3s/QIcVDp/asssZiDy2hV/0htq
	iIlvIHDchFP
X-Google-Smtp-Source: AGHT+IEFylPNpljR3XEed8pOfJjdvyjRz09M/WdcYWwyhunaD1GCVyLqOiEz7HDVLXwhU8X3xjf+1mUDhqvI4bVZzDk=
X-Received: by 2002:a05:6512:220b:b0:553:5e35:b250 with SMTP id
 2adb3069b0e04-553e3bf3becmr3556332e87.32.1750665738699; Mon, 23 Jun 2025
 01:02:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
 <20250610-gpio-sysfs-chip-export-v1-7-a8c7aa4478b1@linaro.org> <CACRpkdZ0W10E7UX7KDnej0SX_Jtuo8r1xSTJsGmXDrDYwArO7Q@mail.gmail.com>
In-Reply-To: <CACRpkdZ0W10E7UX7KDnej0SX_Jtuo8r1xSTJsGmXDrDYwArO7Q@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Jun 2025 10:02:07 +0200
X-Gm-Features: AX0GCFtqPzZP2-oWr-aSqSDePQwxUQnU63M4YMuZivBMwcnE-5malFS4943V3L0
Message-ID: <CAMRc=Meaif1zDeV5mQj3sdJB5et36a_6RctLoVLQc+EH8ig9LQ@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 07/15] gpio: sysfs: add a parallel class device
 for each GPIO chip using device IDs
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 10:27=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> On Tue, Jun 10, 2025 at 4:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > In order to enable moving away from the global GPIO numberspace-based
> > exporting of lines over sysfs: add a parallel, per-chip entry under
> > /sys/class/gpio/ for every registered GPIO chip, denoted by device ID
> > in the file name and not its base GPIO number.
> >
> > Compared to the existing chip group: it does not contain the "base"
> > attribute as the goal of this change is to not refer to GPIOs by their
> > global number from user-space anymore. It also contains its own,
> > per-chip export/unexport attribute pair which allow to export lines by
> > their hardware offset within the chip.
> >
> > Caveat #1: the new device cannot be a link to (or be linked to by) the
> > existing "gpiochip<BASE>" entry as we cannot create links in
> > /sys/class/xyz/.
> >
> > Caveat #2: the new entry cannot be named "gpiochipX" as it could
> > conflict with devices whose base is statically defined to a low number.
> > Let's go with "chipX" instead.
>
> That's unfortunate but it's good to separate them, and
> gpio/gpiochip is a bit tautological so this is a better sysfs name
> anyway.
>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> > +       /chipX ... for each gpiochip; #X is the gpio device ID
> > +           /export ... asks the kernel to export a GPIO at HW offset X=
 to userspace
> > +           /unexport ... to return a GPIO at HW offset X to the kernel
> > +           /label ... (r/o) descriptive, not necessarily unique
>
> Not necessarily *globally* unique, I think it's required to be unique
> per-gpiochip right? Otherwise it will be hard to create these files.
>

Yes, this must be updated as well, the labels are of course unique.

Bart

> > +           /ngpio ... (r/o) number of GPIOs exposed by the chip
>
> I like this approach, it's a good compromise between different
> desires of the sysfs ABI.
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij

