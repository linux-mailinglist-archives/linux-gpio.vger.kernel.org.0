Return-Path: <linux-gpio+bounces-1305-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F3B80E993
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 12:00:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E73AB209CA
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 11:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C805CD13;
	Tue, 12 Dec 2023 11:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="j0EvEMBQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FDB3AC
	for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 03:00:23 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5d05ff42db0so54377757b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 03:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702378822; x=1702983622; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oS4wVP35PVGO59/b7c4+3ecHSQ6XQIEYerGoZ3jwyuQ=;
        b=j0EvEMBQlNawsmWql4qefyfzSBpUfyIrSTKebIRhGh/TZv1Fg0A1MMXRpcJL9en7Dk
         3AC0lEN0WPN826u+WHmkeujX6qJ+NuxCQgw5xseHmxOOfxRaT5M0rOxF+7CFK26K8684
         1LILce77vMfeoyhveVrhn+BO2zjJW3oRU69F4VuPwmzDGwYHISX7piib+BzZJBxiI79X
         /TAtXdx4rhv+ZsXKIBdxjrvfCzt4lcQOqVdC5p6KtBLlOIFZ8iaGSDoIGXVkzhJZClgz
         cknu15MwFLHS0+nNSd7XiuXD6OARkPCaCbNZu6EjEX9Ih3lJopme263BfwLQqp2LspP5
         4hCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702378822; x=1702983622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oS4wVP35PVGO59/b7c4+3ecHSQ6XQIEYerGoZ3jwyuQ=;
        b=uYM2xNgE8WX8DBa7x2Fo3ObJ2wzNNO+ZJgHFvbSDO+WH+d4ZPKV+58EW2WlRsGXG6I
         dfk2qfD9zLyWuyTNccxp+X6vPSpENEMoGL6wQTEHMqAFWHwVYGbhZ7j7F8mAIF3oc6Zo
         uZsiohR43uRMQ4f4Qz2aPsVWMpKWn2Q97bOGqCu0JFsPwEX1dPdqK1bkVwVp9VkY6Qik
         T08SGg4nZESOL0q2AC6YdfCkh4nM8B0MhD+tUeAHL2EhwyM6jx6WGYsX1oFAkZ6FcCu2
         nQ/mzBSnJtdtKnZucYhQHz6olGVDSvlowh0HxjNxe1V8S9oakVc+Sw37gaZkWTj+hpEI
         QueA==
X-Gm-Message-State: AOJu0Yy29FZ4mtN4tzMPlxW1T8uhW1D7q/CfGwQ9gV02eUC0snjIthiJ
	xjhxAi2nNMvB8mfTqSBcY+ibfN0J0kIyiolwdFsqHA==
X-Google-Smtp-Source: AGHT+IFkac3qNLoVwCbnoEOQhL20v90KXMs41e5qojKufUxciNVF0E5Ld8xWLfteF/Zuhh/cInGsmyFwylwrjevkwYk=
X-Received: by 2002:a0d:dd0c:0:b0:5d5:f15f:dbd6 with SMTP id
 g12-20020a0ddd0c000000b005d5f15fdbd6mr5394115ywe.1.1702378822205; Tue, 12 Dec
 2023 03:00:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZWKL4r9DREwYjnyo@rigel> <CAMRc=Md6y=91o_zB7ePLM1tEfG7sjgE2tujZXSRTQQ8y8oJnPg@mail.gmail.com>
 <CAMRc=Me3JV6yjfRK6TaVtVYV0zhbn=274uCzbfYZ-uywaSuz0A@mail.gmail.com>
 <CACRpkdb06kOV82Ssyv4ERPbRorbwj9QdpZtHAEVDv6GMGMhFOA@mail.gmail.com>
 <ZXMgmhTioEQ78Xeq@orome.fritz.box> <CAMRc=MeB9noBavBRiuKZf_6iWZJY0+ZG=n+ddGOs+TVavvuEfQ@mail.gmail.com>
 <ZXNHG0yp9QVflLBG@orome.fritz.box> <CAMRc=Mfg0tYwmiNfTkX+aBJyZSk0TG-EXmnd=3R22wmT7q53Tw@mail.gmail.com>
 <ZXbqjY14ick-3YpW@orome.fritz.box> <CAMRc=Mex=1jWD8OrU8PzkVjk2iCorv=2Kofjo0iD7CJEiBA_bw@mail.gmail.com>
 <20231212101228.GD12022@darkstar.musicnaut.iki.fi>
In-Reply-To: <20231212101228.GD12022@darkstar.musicnaut.iki.fi>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Dec 2023 12:00:11 +0100
Message-ID: <CAMRc=MfYhOyA-owP=VvXXJqnGc31DCkee0to-hMXreoAPCow0Q@mail.gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Thierry Reding <thierry.reding@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 11:12=E2=80=AFAM Aaro Koskinen <aaro.koskinen@iki.f=
i> wrote:
>
> Hi,
>
> On Mon, Dec 11, 2023 at 04:49:43PM +0100, Bartosz Golaszewski wrote:
> > Aaro: do you still have the HW to test this driver?
>
> Yes, and I still use it.
>
> > I understand the need to disable interrupts during writing or reading
> > data - when we are driving the clock line. But do we also absolutely
> > need to hold the spinlock when setting the direction of the data line
> > to input? Because if we don't then we could modify the last remaining
> > offender to not set GPIO direction with a spinlock held and finally mak=
e
> > gpiod_direction_*() functions sleepable.
>
> Hmm, I think it's required to be able to provide atomic xfer function.
> That is needed for e.g. for power off.
>

By xfer: do you mean a request-response pair? Or just a single atomic,
one-way transfer of data?

Bart

> A.

