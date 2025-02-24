Return-Path: <linux-gpio+bounces-16468-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9845A41757
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 09:29:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B8F5167EA4
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 08:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A271AA782;
	Mon, 24 Feb 2025 08:29:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC13719CD1D
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 08:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740385747; cv=none; b=oaL+KtO7F7SlcbieBqvQHgO3uhli6ZqpmuoXX/njQz3nj+KlW+G+43qX2sjKpXgBfSNFhn7xyN20LMDCsQguFieb9bjkM1UwL71NZC78OVsoC1IM/ql4XTDtf4wgCXnjmOjRGelJqAmEDl+LX6OqrRGVryKqfbzFkN9P3fdQO3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740385747; c=relaxed/simple;
	bh=fhRDAo5az9m8qfVGRpDV9iK8y7sKQVyiAKRcfP2pbbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mlQhdO2uuKKhgyls4l6onE9d/GPZWMLwRqEmuAWXFZaak6vPPpoU/sQ2BZ64iYH+AFoyXak8798WS+OvIrBpVIb8wolPPA7zFt+goPNumz2ZesYiRQenpg7FkmSGG5XRdYDoXtNhI7G78RxBm/oNokba+sJPhE4CWc6Pc9+GH1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-868e5684712so1151156241.3
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 00:29:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740385743; x=1740990543;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KjOjRkWrv71j3kflYLEW2Mi/geGzPHfPlcz7yblISDg=;
        b=vdDbC4RK4doppMc37igCZPRcccSsnYot0+ggzr3yelgMz5YwHkHBhTjt2kxHPAUj8+
         7l4J6KG4ZFxLlPBPzbq1wfhOdsFVdzwGElIXfnHMyjXEm2rMTGj0K58ozImnA8niWHkP
         OfQCLWp5TfuKw8v5sjTWlbiEytZ/AjdRiZKU38IbiXES/MxkfUGK+nEFYnZDArUSYJCG
         W4SW/sTWTTjeX4vMmMytvMRHsTCfm7M2yONPwitxSIdoIoVLOUrervigEhDMzuiG3kgV
         iJg1XdRE5+4YRDWZnkbCWaVrIJlgoaqKdULzzDYkcralPVY0rshIwgm9bKzElnJBEfyd
         A+hA==
X-Forwarded-Encrypted: i=1; AJvYcCUHY92/KmGjaNPWyrzCOPnNkd7fYoFtSEgIl7PoVTVJTgaIH0ed6Rg5k32LTB5aFwEA2Vxxv8iCkZkt@vger.kernel.org
X-Gm-Message-State: AOJu0YyME2bErxAZXKfz+wEivAk2V9MlrcgeGc06M4K/YOZVLXDoxF6i
	P9xVtigChOLPvnH1aQBUBqyxcp7FoKtjezQ3VqacPqV0VlMW6QGi9JS+Nn4h
X-Gm-Gg: ASbGncs99OIXNSzcjfro8wtM1yQJQMI841C/bnlWV1psNdu3kZv17h1ZsqrRRcMmZKs
	pba825y6Z91WbbtY6ZmynkUE2a8p6wKecqHhLYZCTz7CsEzBSsVxIMMZ4mzPg8NlJc+9HiuMuft
	vf0XueQUtvIZjcc86zBc9BDtfNHM1V7E31kdMkpURIJADgZWPvcEgJxNGSunv0xXnqaF8kH55BW
	4HLoqc2wbiz3R8ZDnOYcnk7ZVU/O7RZQ0cqtLSqsV+esmZ1Ul+F4/kmeix+qT6VYVPBYZdcy4Lq
	8oyQoxAATQsRJdBwxjauCRYfbuYov78QNBXQR1Dbk+T+jEwzZ/qz6B4GfiD8rZdD
X-Google-Smtp-Source: AGHT+IFpszEtO+dj+wOkNMQuKHMJaLiNge6RUvpNasCjmyg5kMeWkFzFmt4r7d7SwKubd4ET5XA02g==
X-Received: by 2002:a05:6102:2ac9:b0:4be:68fe:e698 with SMTP id ada2fe7eead31-4bfc00568c1mr6146513137.10.1740385742931;
        Mon, 24 Feb 2025 00:29:02 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-868e86bd45csm4562907241.24.2025.02.24.00.29.02
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 00:29:02 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4be74b9de53so1175493137.3
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 00:29:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVSGkYDgmaeMopz2eoZaDba5UPtbCmuhW245LICJVs8IQLuR3V2fPdP+HqOAXqwNN2s+b2OfapwOzg7@vger.kernel.org
X-Received: by 2002:a05:6102:508c:b0:4b9:bc52:e050 with SMTP id
 ada2fe7eead31-4bfbffcfb2fmr6444989137.2.1740385742462; Mon, 24 Feb 2025
 00:29:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com>
 <20250224014936.GA12854@rigel>
In-Reply-To: <20250224014936.GA12854@rigel>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Feb 2025 09:28:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWtmgbgriKvTWQEJ8PRvPJDuJK+naQybHjRKRj-SKOvRw@mail.gmail.com>
X-Gm-Features: AWEUYZlLxQgteAJpmanpC-5yioFR0oNL5LG9GPbAluGgCviRFfX9coUAPsfJ1aU
Message-ID: <CAMuHMdWtmgbgriKvTWQEJ8PRvPJDuJK+naQybHjRKRj-SKOvRw@mail.gmail.com>
Subject: Re: Replacing global GPIO numbers in sysfs with hardware offsets
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
	Marek Vasut <marex@denx.de>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Kent,

On Mon, 24 Feb 2025 at 02:49, Kent Gibson <warthog618@gmail.com> wrote:
> TBH, I think you will have trouble getting users to adopt it - they
> require a solution no more complex than what they already have or they
> will resist the change for as long as they possibly can.  So if you want
> them to migrate before removing the global numberspace then that will
> never happen.
>
> As it stands the user needs to search the gpiochipXYZs looking for the
> matching label. It would be easier if the chip was identified in sysfs by
> its label, rather than (as well as) its base address.
> So no searching required.
>
> Aside: Speaking of which, once the global numberspace is removed does
> exposing the base address serve any purpose?

l doubt the global numberspace will really go away: some number
scheme is still needed internally, cfr. I2C bus numbers and virtual
interrupts numbers.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

