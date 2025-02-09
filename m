Return-Path: <linux-gpio+bounces-15611-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1C4A2DBCF
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Feb 2025 10:41:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1F9F3A5277
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Feb 2025 09:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303C113DBA0;
	Sun,  9 Feb 2025 09:41:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811B433987
	for <linux-gpio@vger.kernel.org>; Sun,  9 Feb 2025 09:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739094069; cv=none; b=MTCv2Cwqq0B3ybDq39scQXN3Rtw8oAC88hBYOaOoAxDxJCMQ/EuJ+8erk7VApMy6HfhcDHugMAxN/1Yjd+WWVQqeqL1LGdIySeBcOLNVsV0SBWH0paXpljb/JSKK2C5pNTWfMoHGg4ALlpDvpGoCz7R910alFs0uDSPQnTKhv94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739094069; c=relaxed/simple;
	bh=qgeNDZM+2PVBE+7orbo7TSZVpNy1KRa/mEZrjDqZ0oI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d0+VYcgmtLPdWgQpZdos6ATUU4BY+oO7HqGmYgzlJ/tmIFjn7WCSBOb9H/k11WF/GhWC1OeqgPkqYcn1aVi+c8CCXQ8htntrJTbFfdaZcSP6r5941M3ScgbhYgOr2qAUOISwtSXeqtZLwTihQ53zF5VDD0xXsJHmNueiR1zox74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-52031ffca74so237375e0c.2
        for <linux-gpio@vger.kernel.org>; Sun, 09 Feb 2025 01:41:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739094064; x=1739698864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8cUkSq5br4RYq/jOxCyYuBl3rTeKO5DZFE1Si1EHkCY=;
        b=g7v8MvrY4ZtW+IqGBvqcKePaSenQkcjgOqVNvDKKZgJE6Rlppcp+Q6Apu5CuDNBAMw
         oa3tJBbz4YXYfwAwV9Zyjn6+K4RC9u4sqvL79/iDFRkcCnmSAbMByroYM2kUbO4pJaiW
         5OsMPPr1FOl3S4g85yFSDuydKJ0V/Rfx8Q5CDLeaYWeEfjPjk5b+//QBrW55O7iY6oZ/
         fTYpLhc9SimYzMRf7sYaBHM0CMBG+B2JWoH3Xgp11KeMO/NpRsJvZgR5X29ptLKhsctH
         pbXav8033uLmZla3/4lTY06jRS3uFGe80KQhtN/678slqila1fU8u04XZoD+7xJ0mXY8
         1seQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUhpE5WQ39B07UOsrAJm0/gHzvEkzhOaPL9iZ6UHkVS0Of4FFy5qriQXk5FiEbnFIFyv6hJdzPZFGr@vger.kernel.org
X-Gm-Message-State: AOJu0YwVFN6/yjpg+tnQW3xND/nRwPQLIx4P9TlkIkgwKTR2lnvCOTNv
	bIM7PuxreBhDrP36Fse41lH4MdkJP38f29i8fw7OIAYFB3aV5quKyg6x8wil
X-Gm-Gg: ASbGncsYUxs8kQr5znvJLb5nU4Zj9dlQCuYOPU0Xy8dj9Q7P68tpNUAFyomTfXddZ+U
	j1Gpz6FUCZpYMqevb074TvqWJwXbYsQDs6iCmPMHhzYUj30J6fID6aUEK0e396oqKiqVEqyD3Ba
	UV/gPTW76GCeYJbAcMII+E2WJvT+XSKgIAAbony3bcjL3wLKwXO5tUbIK9jCb1PDYsLJpsSFkL7
	4Nb22JsbxJbUMbicdgrE2HGm0HmKyxDLnTcQrFpQa9PqBF/MG2tymMLhPMWDaDFTTYCVV6dRWpP
	xK8VOeOoIdOWME6zEOpITjmnA86OLIs7m6L3a8RjZ68jVWJkjqizTQ==
X-Google-Smtp-Source: AGHT+IHKSv2vK5nPCmpDGO5m5ceehdl/V8iBNIeX65cQSzK/sMgegFbQtCGrf7i5RhMJ4WoW9DMu7g==
X-Received: by 2002:a05:6122:794:b0:51c:c23e:8cd6 with SMTP id 71dfb90a1353d-51f2e1d9b57mr7292769e0c.6.1739094064003;
        Sun, 09 Feb 2025 01:41:04 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51f228dabd4sm1069135e0c.32.2025.02.09.01.41.02
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 01:41:02 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-8671441a730so286168241.0
        for <linux-gpio@vger.kernel.org>; Sun, 09 Feb 2025 01:41:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXhaLQ7XFyMVCPs7WdYjDSCcmwrO9uWTtD5YEj0fs1ivcfsz3KfqFVZwcvHE9BxH6PVjAlKWZ8TXkzf@vger.kernel.org
X-Received: by 2002:a05:6102:3046:b0:4b2:48cc:5c5a with SMTP id
 ada2fe7eead31-4ba85e8d160mr7070808137.15.1739094062684; Sun, 09 Feb 2025
 01:41:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com>
 <CAMuHMdXgQPcUw-UuGC886RRBpeCz34OAz-Nx4FUxeAq0w2qBkA@mail.gmail.com> <CAMRc=Md7Z9zASsbDcy4prY8tZggS5505_gTQULzOweYYEpNsig@mail.gmail.com>
In-Reply-To: <CAMRc=Md7Z9zASsbDcy4prY8tZggS5505_gTQULzOweYYEpNsig@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 9 Feb 2025 10:40:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVxZab5X4HyKj2d_21WohKfpFrsnRYYjx9X1ys22xCvLA@mail.gmail.com>
X-Gm-Features: AWEUYZmpYH6QplbU8RzkMV_BCixvOTmPuPRxqU8rhNFjQhOfMH9qZmGX2CEl6Wg
Message-ID: <CAMuHMdVxZab5X4HyKj2d_21WohKfpFrsnRYYjx9X1ys22xCvLA@mail.gmail.com>
Subject: Re: Replacing global GPIO numbers in sysfs with hardware offsets
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	Kent Gibson <warthog618@gmail.com>, =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
	Marek Vasut <marex@denx.de>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Fri, 7 Feb 2025 at 21:18, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Mon, Feb 3, 2025 at 3:23=E2=80=AFPM Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > The other thing to consider is why people are playing with GPIOs
> > directly: do they lack hardware descriptions? Or do they lack proper
> > Linux drivers for their use cases? Something else (people brought up
> > testing random pins, or plugging random things into a Pi)?
>
> I think you're speaking from the position of an experienced kernel
> hacker. The majority of libgpiod users with whom I interact on github
> or via email have never even compiled the kernel. They're working on
> some kind of RPi or BeagleBone project and want to have their python
> script fiddle with the pins. These are hardware people and makers. So
> to answer your question: they play with GPIOs from user-space because
> they don't know better and can't be bothered to learn - developing
> kernel drivers is not on their roadmap.

Ah, the dreaded userspace GPIO drivers...

Please point them to my ELCE2020 presentation "Gadgets and Trinkets,
The Upstream Linux Way"
https://elinux.org/ELC_Europe_2020_Presentations#Day_1_Presentations

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

