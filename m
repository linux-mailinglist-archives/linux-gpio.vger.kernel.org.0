Return-Path: <linux-gpio+bounces-1466-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E688132D6
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 15:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9DDE1C2185E
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 14:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1448359E33;
	Thu, 14 Dec 2023 14:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kYYZoevh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F31BC11A
	for <linux-gpio@vger.kernel.org>; Thu, 14 Dec 2023 06:19:00 -0800 (PST)
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-4b2dc44d54aso2087254e0c.3
        for <linux-gpio@vger.kernel.org>; Thu, 14 Dec 2023 06:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702563540; x=1703168340; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xK1Zz0ik7xN5iCx8Rt0y08scTAc5eJ32ICjBtV1g5R0=;
        b=kYYZoevhROyiajdFeiO6llNmswfxd1iVdGn/Tf5GNyNGkBUxtJ9ipHU2WyVB9eymgY
         CfaeT0Gf/A4UU+fsq2F8iJsr1iGR7t8K/sw8ehYFwCMPJXVEXOLJTElaYPpgpk0fQPG4
         t1zaMtBtxcdPpss0b8mvSUK+LaXyP4BddU05txoQew26l7OKlu6KSJGLNnlfc2NvmKjM
         lAtKfJpEjgsdRkue26KyhcPjHAjVWolCpGxNzKwxmZTdZFBrhx8NyOrK0eWkODM4hN58
         pEHhYhP6O5Dx7feNPOhtjs8pXjwZhe8Hhr//EykN1A3jYRX1kHE/6qj3ZKhLcmDXrAFV
         Cb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702563540; x=1703168340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xK1Zz0ik7xN5iCx8Rt0y08scTAc5eJ32ICjBtV1g5R0=;
        b=s+vJfR6i4JNRm5IV/z7LFzGM758s0GmmooJK0+hOWhVoBuZ1jXAoKSFmSK84DfjbEF
         4SW/FZWuAzBK9RSMpQUGaimeFd5fIx3lu2RDT7MMUxA5P6/ZrUL1L8fRcKLfwW1oi2oY
         cqxG5Kt4szs/uv69GP4BbRn/asSpJxOsp/XaqBfCdN+aOcSi0VTrOkq6xro9zE6ZZCrv
         jzWHLSz6iGNZdzSywXqFLRTconfChHjPOQyI3eSVqrua+dzmlSR5a94TMPyQMyWwBbjW
         bpv107DZR8r3DdyyVbFt7c6KLDl3blDa9lqU3Jwi89K7B2mVrspV7T0K2UXhQ/eoeSYo
         Plmw==
X-Gm-Message-State: AOJu0YxqhJ3IyL4RLyfIDB9huOM6J6ivXgZh6eDo1rFJjXbii4t3H4Z7
	TSSlfkotVZzTurK3AtA4Oi9x1sza4CMqV78ksZctFg==
X-Google-Smtp-Source: AGHT+IGp7N0kDKKmg44BR/UTVhPYQAXaP/J0i9EfoiSn3v8/kmsSPtwUVxlkF51Mb6DLMeWbbOQ2HLX16hUnLvPRqkk=
X-Received: by 2002:a05:6122:2986:b0:4b2:c554:d2bf with SMTP id
 fn6-20020a056122298600b004b2c554d2bfmr6676722vkb.33.1702563540050; Thu, 14
 Dec 2023 06:19:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208102020.36390-1-brgl@bgdev.pl> <20231208102020.36390-3-brgl@bgdev.pl>
 <ZXMiq3wDOt9zFzuX@smile.fi.intel.com> <CAMRc=Me5fzUaxQZ8Ec086papUpOD+chZ3+BM4CzASmB=ksh9kw@mail.gmail.com>
 <ZXsLhDGeNofXp4IC@smile.fi.intel.com>
In-Reply-To: <ZXsLhDGeNofXp4IC@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 14 Dec 2023 15:18:48 +0100
Message-ID: <CAMRc=Me5mj19jH7QxkL4LPfwUkr0F9t5UQpPjz5GDjRbC5XDsg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpiolib: use a mutex to protect the list of GPIO devices
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 3:04=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Dec 14, 2023 at 02:59:28PM +0100, Bartosz Golaszewski wrote:
> > On Thu, Dec 14, 2023 at 2:53=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Fri, Dec 08, 2023 at 11:20:20AM +0100, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > The global list of GPIO devices is never modified or accessed from
> > > > atomic context so it's fine to protect it using a mutex. Add a new
> > > > global lock dedicated to the gpio_devices list and use it whenever
> > > > accessing or modifying it.
>
> ...
>
> > > > While at it: fold the sysfs registering of existing devices into
> > > > gpiolib.c and make gpio_devices static within its compilation unit.
> > >
> > > TBH I do not like injecting sysfs (legacy!) code into gpiolib.
> > > It makes things at very least confusing.
> > >
> > > That _ugly_ ifdeffery and sysfs in the function name are not okay.
> > >
> > > If you want do that, please create a separate change and explain the =
rationale
> > > behind with answering to the Q "Why do we need all that and why is it=
 better
> > > than any alternatives?".
> >
> > I can move it back to gpiolib-sysfs.c but this way we'll have to keep
> > the GPIO device mutex public in gpiolib.h.
>
> And I'm fine with that. Again, we can discuss this in a separate change t=
hat
> will do that (make that mutex local with the explanation why).
>

No, I won't be sending one. I'll send another iteration of this with
sysfs stuff contained to gpiolib-sysfs.c.

Bart

> --
> With Best Regards,
> Andy Shevchenko
>
>

