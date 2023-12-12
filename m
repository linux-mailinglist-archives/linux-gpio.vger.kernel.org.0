Return-Path: <linux-gpio+bounces-1313-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EE680EFD8
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 16:16:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1A2F1F21553
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 15:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB5275419;
	Tue, 12 Dec 2023 15:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f8myZPG/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38842AA
	for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 07:16:01 -0800 (PST)
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-589d4033e84so3344510eaf.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 07:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702394160; x=1702998960; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bu2y1AUsJNWk8AstPvh8v2xS8/lVdDcP9taUC+S7+6Q=;
        b=f8myZPG/wZpDmX4ZqqT2skHndq7vwR/vz7uMC2tym/AVR7ka/VUEPF7arMMHa86J28
         SwBuWUkDv7ljH/Ondlqwr3xloDq7jvF7z0Z7ErKTUKv+HcjitNgd7/pAdJwvvX/iGDFQ
         dKmEaDH+EgAfgiPj5xjCQhCAE7rJDBRNZl196DdDB5ciJsLa/OgM23RMArgB2FPYWaS6
         BSCMtXBZXqO+cQF490CrK048wRhbiSVvgL8kC44CuPCLZNRKj4NtNg7vq6DOfkqL+sTE
         TaoZiiDaqYlORUfMNQCKfipNt5EnxUeRIcUfqHkhC7XU2T/CT0rej50uBgE22XBj5DcI
         LddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702394160; x=1702998960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bu2y1AUsJNWk8AstPvh8v2xS8/lVdDcP9taUC+S7+6Q=;
        b=XvE+4QE4GOZEKFA3pFjf0kygnY9RT1RLpGcyL7c2o+aMkviiWfYhVKaz0fEzWDCXAi
         1G+chan/YVWm4ftcLJ+d2WVbKZ2M3iN8ZnFovDf07zJuRaiu+fbiLzduV1rbkrJMnnDi
         ucHuOefquFcRNMjgvY0ixrbig9MCNKNj66anxmRFoDospP8b49roN9lWPysdgA1s6swb
         9Wy/NMhyFtIMb0OECR7LPTM3Kq/iA4qBWlwvQ+xGLKkWxMM6iC6Z+dDW/8wb1nsoqVdN
         U9xLzRE87tYwOjXwjEAoD3PdyjGIgmCfM/2EXYwRxryE8Cv/3Z6Ys+C7m4caOcjp6Paa
         tqhA==
X-Gm-Message-State: AOJu0YzZ7nUwKkkN7XQz5ALc1B6/nWKzA8TlmckwtefmFND9C90UiPza
	onoLLBMaebhRwA5ustT12EEqWbpebFAGVqqSS0umQA==
X-Google-Smtp-Source: AGHT+IGJ74tt3hwC9hHRGW1AfUWC5AV0gtwz+bPLiRzj9rFt2hVRmvKWOgD+JyHGSzPWBBPtPcr6hKKxTIaAmzB0l78=
X-Received: by 2002:a05:6358:441e:b0:170:17eb:7c55 with SMTP id
 z30-20020a056358441e00b0017017eb7c55mr8117171rwc.40.1702394160488; Tue, 12
 Dec 2023 07:16:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=Me3JV6yjfRK6TaVtVYV0zhbn=274uCzbfYZ-uywaSuz0A@mail.gmail.com>
 <CACRpkdb06kOV82Ssyv4ERPbRorbwj9QdpZtHAEVDv6GMGMhFOA@mail.gmail.com>
 <ZXMgmhTioEQ78Xeq@orome.fritz.box> <CAMRc=MeB9noBavBRiuKZf_6iWZJY0+ZG=n+ddGOs+TVavvuEfQ@mail.gmail.com>
 <ZXNHG0yp9QVflLBG@orome.fritz.box> <CAMRc=Mfg0tYwmiNfTkX+aBJyZSk0TG-EXmnd=3R22wmT7q53Tw@mail.gmail.com>
 <ZXbqjY14ick-3YpW@orome.fritz.box> <CAMRc=Mex=1jWD8OrU8PzkVjk2iCorv=2Kofjo0iD7CJEiBA_bw@mail.gmail.com>
 <20231212101228.GD12022@darkstar.musicnaut.iki.fi> <CAMRc=MfYhOyA-owP=VvXXJqnGc31DCkee0to-hMXreoAPCow0Q@mail.gmail.com>
 <20231212143221.GE12022@darkstar.musicnaut.iki.fi>
In-Reply-To: <20231212143221.GE12022@darkstar.musicnaut.iki.fi>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Dec 2023 16:15:49 +0100
Message-ID: <CAMRc=MeVhjDAZQaz5oYqxToiTVU2vTrQ57yj_S85owqOG05cbw@mail.gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 3:32=E2=80=AFPM Aaro Koskinen <aaro.koskinen@iki.fi=
> wrote:
>
> Hi,
>
> On Tue, Dec 12, 2023 at 12:00:11PM +0100, Bartosz Golaszewski wrote:
> > On Tue, Dec 12, 2023 at 11:12=E2=80=AFAM Aaro Koskinen <aaro.koskinen@i=
ki.fi> wrote:
> > > On Mon, Dec 11, 2023 at 04:49:43PM +0100, Bartosz Golaszewski wrote:
> > > > Aaro: do you still have the HW to test this driver?
> > >
> > > Yes, and I still use it.
> > >
> > > > I understand the need to disable interrupts during writing or readi=
ng
> > > > data - when we are driving the clock line. But do we also absolutel=
y
> > > > need to hold the spinlock when setting the direction of the data li=
ne
> > > > to input? Because if we don't then we could modify the last remaini=
ng
> > > > offender to not set GPIO direction with a spinlock held and finally=
 make
> > > > gpiod_direction_*() functions sleepable.
> > >
> > > Hmm, I think it's required to be able to provide atomic xfer function=
.
> > > That is needed for e.g. for power off.
> >
> > By xfer: do you mean a request-response pair? Or just a single atomic,
> > one-way transfer of data?
>
> It's reading a register, then writing it back.
>
> A.

Well, I would consider it a valid use-case of changing line direction
where it can't sleep.

Maybe we need to have gpio_direction_input/output_raw_atomic() which
would have very simple semantics? Like no locking provided by gpiolib,
no additional flags interpreted (like open-drain, open-source, bias,
etc.) and no mutex held? It would be up to users who *really* need to
set direction in non-sleeping context to handle this correctly.

We could use it in this driver and possibly in any other which would
fail once we mark the original functions as "might_sleep()".

Bart

