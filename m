Return-Path: <linux-gpio+bounces-1599-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBF8816908
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Dec 2023 10:01:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 518241C20BCC
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Dec 2023 09:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D1B10A10;
	Mon, 18 Dec 2023 09:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PxrFdoT+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB15125C0
	for <linux-gpio@vger.kernel.org>; Mon, 18 Dec 2023 09:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-7cbc56a8023so493378241.1
        for <linux-gpio@vger.kernel.org>; Mon, 18 Dec 2023 01:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702890050; x=1703494850; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dw026XAnMtLtxWNCzhpPAk2Qu2t2BiOON2FGMJeyr7g=;
        b=PxrFdoT+DSIB6eEzateOpfY4/ZhLgx569COxdfk9kGK6c/eEMRhkTUspc4IPkyTELL
         WMuggvwAnC4BOplgrCIX0l4xPtOG/Va90wnPLaSwbVtw7m6ksYE7Ls7tvuycK4Tvodcn
         6ptYHPi2TguKa4uoOxUidMZbczE/LfVVL0ovgV/Baihz7guz1IjjEVd3o4XJ6ma3xZ8u
         D8xE0EuPJsLsj0zsJTFBYw8wZzPFbikFL9OCbz4fPmgYWaPuy3GDFNzMh9kHCQzxP/yP
         fSY5VLPJr0aWay9WnROv/RA2jV5a7GFLi4N8dxKvvXO2gRkw7zKzFjrUHyXpiz38Z9Ls
         B5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702890050; x=1703494850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dw026XAnMtLtxWNCzhpPAk2Qu2t2BiOON2FGMJeyr7g=;
        b=FMHV7geJ1yhuOMItv/wmTug2WEoZmswXm2mtRKEtoX0RtmJi9NxCDNwi7/KPx7XJzg
         SfGCOJeBUEK/DS2HuOHP+6U0R4S8AsrEOhLa72S88HWikPESaTHzPbXGdRBMzdKQFdGh
         /c+7Ul1aeqbsH1Z9Kf5gt95oihX3p8dLIDq0J/HdSLHEyBessIThF6deAc2zy9FOtwvS
         tqDe3fqFjwpDUiHIFz2n71OU16FYYo/IUEehbd6hl2jioZPT+rnCDeszPFZdbW/2+FZV
         pbikpfc1EpzrP/TDh2UJ+bFWRON3rjbAcTE+ZC1UZ7IPpu3dewPSIpCqhmDQsJZ2iNa7
         Yccw==
X-Gm-Message-State: AOJu0YwWzuYmpDcI2JxnzEyHTlUKbodFgkjWJf8ObqGeMO5+9MS/p/CT
	Kem4/0ULbcN0QRS0M17PHOBxLafeWAyuXzgoQUR+Hw==
X-Google-Smtp-Source: AGHT+IGAem1nDjnIi/J+LHNBgQ4NtWFW5yBV6M0O+03v+atNRenIB54exX2ziXmYNDuGtPwz9HtnjyZK+OpGDUlNAj4=
X-Received: by 2002:a05:6102:2b82:b0:466:8748:1309 with SMTP id
 ib2-20020a0561022b8200b0046687481309mr1799507vsb.13.1702890050618; Mon, 18
 Dec 2023 01:00:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231215155300.21186-1-brgl@bgdev.pl> <20231215155300.21186-3-brgl@bgdev.pl>
 <ZXyN5WrJL6NmV_l8@smile.fi.intel.com>
In-Reply-To: <ZXyN5WrJL6NmV_l8@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 18 Dec 2023 10:00:39 +0100
Message-ID: <CAMRc=MfiiF3SGY-4t+EQYEL1gjUN6-EQsdSP7LKdOA=a+H+_PQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpiolib: use a mutex to protect the list of GPIO devices
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 6:33=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Dec 15, 2023 at 04:53:00PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The global list of GPIO devices is never modified or accessed from
> > atomic context so it's fine to protect it using a mutex. Add a new
> > global lock dedicated to the gpio_devices list and use it whenever
> > accessing or modifying it.
> >
> > While at it: fold the sysfs registering of existing devices into
> > gpiolib.c and make gpio_devices static within its compilation unit.
>

This part is no longer true, I'll remove it and apply the patches.

Bart

> LGTM,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

