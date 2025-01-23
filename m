Return-Path: <linux-gpio+bounces-15030-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B5AA1A0B9
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2025 10:19:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 587DE188DFF2
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2025 09:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E291C5D7C;
	Thu, 23 Jan 2025 09:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="W0g/hRam"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40561537D4
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2025 09:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737623981; cv=none; b=g7XMp0rj/3vNwpFRldTzTqUmHuvNwpXU6AKzDc6xJiInPpZmYy0dFYs8A4a4WImA7K/bSUMFnqIyU4lY4EbCS+4Is6UNDak0e1ZxKQeyONn4XWYseJQ4IA79xIW9ks/WJEbd44A7lhfQYmnPdmM8Cyp9kZT1G3HFKfyA5aqlrO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737623981; c=relaxed/simple;
	bh=oB4W4SH6htOtdlhb8GrE+2UJqq21f/9wPF0wA34Zojk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KEQyNrn9EVOYQ0RTfaRXx43XGa4nVHL2RgONMl12jpDHCy2xLPkfvFEiPtuov8+qrX6ORoGg5gFzPT7aAVwOVtrdkpf02I5mjmrGYTchTHoQgY2NISNRHUbsFW/D7PUk6K5coA+t2iXOrEw+zlE6Rhh9Y53j3q/QcqJo81HeVVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=W0g/hRam; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30616d71bb0so6412901fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2025 01:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1737623978; x=1738228778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oB4W4SH6htOtdlhb8GrE+2UJqq21f/9wPF0wA34Zojk=;
        b=W0g/hRam9EddRKgzi6aQUkcVlAZfhyVCatffgcTdzDaWuDwFt98oWzPqi/F8txR0ca
         8G9FHLs8NtpgNrrtmCRpvzAmXID5wzPVpCfPW9yqxNMO/EvyAYQndpLVywfNEov4Pwwq
         W66fM7UpAt0+zqBD0Ahd+Runhadentn57q6wrXXqK0HM4rUb/38wYxtx27H5YoKRuORZ
         lsj3OcRc0UAA50l+Q7HOm1RQhcmT5Rat0H47rLcTEPqD434j6PRb2s3REEhWoc1WUmlW
         8flt+gmSwAS054MCNT8JxMDFONfpIxR+tZXUGITgiBNWZeftg/hPTaN5J3CEiTWEup9x
         hHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737623978; x=1738228778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oB4W4SH6htOtdlhb8GrE+2UJqq21f/9wPF0wA34Zojk=;
        b=QzkEPsGlVR1/BWPoI/wTwnHcbNwAgTLfemxKQTcoi2mQJem1vEZ5H2Trl4ZyMgmhmB
         0Ry+YbBdP1NcINl+/povYola1v/8OlgfFTYvtmjU7t5onX06Ur9rLhKEoHm+bY5s/ZQ3
         kWOj7T/rEJ5B8FMZTcqHsMuUGaRGzYFFePTLInZLK3LwvFEKkIeUX8hpgj1X+rmnTd2i
         TLCTk4Bu9M6TF3qZT7t96zRXGJ/bBAddrjpTWyC+MBHQvYKTfin8eZjLzq9o/UO5juaC
         v7lDpGEjoE2A3BjZ3eitbADfx6xy8dazhZDJXfsvIkTG2ILQk8izI/cy8Xb6QFvAknMT
         lKgA==
X-Forwarded-Encrypted: i=1; AJvYcCW83xx9BO/3CJdPoqA5eXBQHLnoqU0JXMKZ6O3rP2BVh7dCtRpMuw5G6FM5iQb6DQjGREvAkYBkCe+N@vger.kernel.org
X-Gm-Message-State: AOJu0YzIvKiJ3cHmSxtMGv1Ua18CoTODxy1KKBxQpqdPNNRJIjYn2GUn
	Cs6H9XhPKGC1+7v8+dGCFlZaUaa/ZLFSP1D8T9Wdj7MMVtLPA05EITe3uGrYMD6f5vySO1p3ZZ3
	IDwsIaNEAFIC/Jsri8iSj4PO1fPph2fAeN5stQw==
X-Gm-Gg: ASbGnctxVZxOFMG1XZlyN5SF2peq3fK1khyKSv/ULhKLhoQ5htZYu883FDwL/IQ/UQe
	YAHEHJLsrgO81XnzjIIVZ+HmWihuD3AIHEpWSFSapZEMCYc+Gfh4I+hdUc7dwAFwYIzsxekx+ld
	By5VP82Fl5iYI2+OaKqg==
X-Google-Smtp-Source: AGHT+IGbSoxSTFInm4TCaCofKOLTJWRiuDcAw2dKFZSYyjUZBr9SIVV2X/zkpumKU3mLaYhF4wBklmHsUPwTqe2gouc=
X-Received: by 2002:a2e:a373:0:b0:2fb:4abb:7001 with SMTP id
 38308e7fff4ca-3072ca5c94dmr67603241fa.2.1737623977535; Thu, 23 Jan 2025
 01:19:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <CAHp75Ve8d96Uw1obJVwRPyRE5E0eC8qU7uXe-UKuZeB-3XLPcA@mail.gmail.com>
 <528b6695-387e-436d-98fc-6f576636d16f@pengutronix.de> <CAMRc=MdYB_XHCaurs1mO+KGX7rB5zFT3zCi=UbNY0rSbMEJdWw@mail.gmail.com>
 <3f21523b-816e-488c-bf0a-c6677c375a18@pengutronix.de>
In-Reply-To: <3f21523b-816e-488c-bf0a-c6677c375a18@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 23 Jan 2025 10:19:26 +0100
X-Gm-Features: AbW1kvYo_Qrh_r7UXUMBdQ5UCw_ecPTbUqtFHQIGsKawdSRJFwErHJRVdlHKD1o
Message-ID: <CAMRc=MewWr8nrUBgWe+ckTuVdmLC=grkw1aWeXnWszcaBZvZvQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio: mxc: silence warning about GPIO base being
 statically allocated
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 11:37=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:
>
> Hello Bartosz,
>
> On 15.01.25 17:52, Bartosz Golaszewski wrote:
> >
> > I recently wrote a user-space compatibility layer for sysfs[1]. While
> > right now it doesn't support static base numbers, I'm very open to
> > adding it except that I wasn't sure how to approach it.
> >
> > Is this of any use to you and could it help you switch to libgpiod
> > without changing your user-space set-up (given the support for static
> > GPIO numbering)?
>
> If the goal is to have a drop-in replacement for sysfs outside
> of the kernel, I think it needs to maintain the same numbering.
>
> I am not sure I see myself using it, because the new projects are using
> libgpiod from the get-go. My issue is not with removal of sysfs, but with
> user hostile deprecation approaches.
>
> > If so, how would you like to see this implemented? A
> > config file at /etc that would list chip labels and their desired GPIO
> > base?
>
> Many GPIOs tend to not have labels. I think the mapping config file
> should rather map GPIO controllers to a base address. The same thing the
> kernel is currently doing. This assumes the numbering of the built-in
> GPIO controllers is deterministic, e.g. by consulting /aliases. I haven't
> checked, but I hope this is already the case.

Well, they will have labels, it's just that the label will be
something like "6e80000.gpio" which can very well be mapped onto a
predefined GPIO range.

The file could look like:

/etc/gpio-static-base.conf

```
6e80000.gpio 12
foobar 340
```

Where the first column is the label and the second the static base
that must be less than 512 - ngpio.

Bart

