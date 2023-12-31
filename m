Return-Path: <linux-gpio+bounces-1945-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F863820A5C
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Dec 2023 09:18:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AEDD1B2167C
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Dec 2023 08:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347CD1844;
	Sun, 31 Dec 2023 08:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nUITqKpH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2C917C3
	for <linux-gpio@vger.kernel.org>; Sun, 31 Dec 2023 08:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2cca502e642so76979351fa.0
        for <linux-gpio@vger.kernel.org>; Sun, 31 Dec 2023 00:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704010712; x=1704615512; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6J0N/UOhTpBt36tZMyX8hRVWmTAvag3He398MjVU4c=;
        b=nUITqKpH8k2EqjEpvAF285NPwEIzJJ4iuy5Xu9j/ds3zfC87AAgfBQZLFvYZRXsHBl
         l+TTzDT6gUHp3BZ6ZRQqTVFDQej5Axgtflraoh2jRCZ5va2+aErekY2yh6isw8Nrn1Y+
         /CEVyQBx7WtygFHp2y4pIhHK1mychhqkMsp4PXTEomFPmEn9KTNf/FTtqajFuqduH5q9
         6A5SbiIU8DLpRrEfSyMGFVhw5xQ42o+EL46UeiBnsiiSu1xYlEeNrW49yKtoza+KBQyn
         qSzNemCiW1PH5/IbDtt7YhUhnL8FPqPTEIj1gMCLZfaBMFTHqxGdWHnzpj3vtr3k2vsX
         4YXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704010712; x=1704615512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6J0N/UOhTpBt36tZMyX8hRVWmTAvag3He398MjVU4c=;
        b=liEo6A0t7PD3dLOut3LpLpYt9HKIwHK6Ro/efB8Ao2mrenDZo4pln7gykjSyESHGoE
         xboGyH65NyfKP8ucxlQ2rF1CfUzp+XgXG1eOUH0H2WIVRdTGrMK/D/CTpKkafnQhLQL2
         E56NVWrgxeyAL0ihoSFIPZcUafztSjZVM8MmGB8QpjcbZKeddEp/HO5BxoL2ql//9UMC
         eEyoYZEinMUBj1B6bJz74sTLd7gJcm6tZN+dUeI84vVld5hNYEEhgaC3ZM3w5F/dvFlR
         sr3U27lxupdEmPsSXVG7NfIyqC/cvfOMFUIkK8NB7N4efMcCxpOPMqtgWMCXRRyQE5wr
         10vg==
X-Gm-Message-State: AOJu0YzS7dltvcas9tJCKScpdp4Pdzw23C3pzFeUE0XGWlnnKonVraa8
	8Wol2vQ2TN1I+PGA8Rl7bAphJcy/aMh06K4WZAg=
X-Google-Smtp-Source: AGHT+IGh/jVis/mxyaQZauhxtt7I/agEDcccwHeZWA/XizU8ExLXXSF0H7Fl7R4f38ickVJknQzO1TKRogNAKXjcUJU=
X-Received: by 2002:a2e:8512:0:b0:2cc:e742:a18d with SMTP id
 j18-20020a2e8512000000b002cce742a18dmr1082271lji.194.1704010712296; Sun, 31
 Dec 2023 00:18:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ8C1XMpDFFTf6W_YW5EZM4Qok+=O9oOvGudUaxh8zQ-nE2iEg@mail.gmail.com>
 <20231231035114.GA15400@rigel> <CAJ8C1XM_+nhwNvxMh6xbMyLRexaRye9+Z5sTe6fLUte=uk1ufQ@mail.gmail.com>
In-Reply-To: <CAJ8C1XM_+nhwNvxMh6xbMyLRexaRye9+Z5sTe6fLUte=uk1ufQ@mail.gmail.com>
From: Seamus de Mora <seamusdemora@gmail.com>
Date: Sun, 31 Dec 2023 02:17:56 -0600
Message-ID: <CAJ8C1XMx=5PLLyBTP4-3A1dEQ9FZb6drd9dP4KJN=2T66hfYzw@mail.gmail.com>
Subject: Re: [libgpiod] Documentation question
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> On Sat, Dec 30, 2023 at 9:51=E2=80=AFPM Kent Gibson <warthog618@gmail.com=
> wrote:
> >
> > On Sat, Dec 30, 2023 at 08:04:40PM -0600, Seamus de Mora wrote:
> > > Hello,
> > >
> > > I read a description of libgpiod recently that I cannot find... (my
> > > well-organized reference catalogs have failed me  :) I'm hoping
> > > someone here can help me.
> > >
> > > The documentation I read made a point about libgpiod restricting
> > > itself to GPIO; i.e. not I2C, SPI, PWM and a host of other specialize=
d
> > > GPIO interfaces.
> > >
> >
> > It is kind of in the name ;-).
> >
> > The headline of the README is
> >
> >   libgpiod - C library and tools for interacting with the linux GPIO
> >              character device (gpiod stands for GPIO device)
> >
> > It doesn't describe what it doesn't do, only what it does.
> > And the scope of the GPIO character device uAPI is to expose the
> > functionality of the GPIO subsystem to user-space.
> >
> > > I thought it was in the libgpiod README, but it's not. Any ideas on
> > > where I might find this?
> > >
> >
> > Like you, I can't even find the brief documentation on the GPIO uAPI
> > that I thought was in the Linux kernel documentation - the only thing I
> > can find is a reference to gpio.h itself, which is not very helpful.
> > Something else to add to the todo list.
> >
> > The closest thing I can find to what I think you are after is the pinct=
rl
> > documentation[1], particularly the "GPIO mode pitfalls" section[2] - bu=
t
> > the whole thing is worth a read.
> >
> > Cheers,
> > Kent.
> >
> > [1] https://docs.kernel.org/driver-api/pin-control.html
> > [2] https://docs.kernel.org/driver-api/pin-control.html#gpio-mode-pitfa=
lls

The pinctrl refs didn't have what I was looking for, but thanks & keep
your eyes peeled, please. I found something close (and a surprise) in
this item named 'Using GPIO Lines in Linux'[1]. The surprise was the
recommendation against using the ABI (libgpiod??) for "production
systems". Am I reading that correctly?

[1] https://www.kernel.org/doc/html/latest/driver-api/gpio/using-gpio.html

