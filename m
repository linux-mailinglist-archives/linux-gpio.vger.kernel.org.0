Return-Path: <linux-gpio+bounces-28729-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC1CC6D47B
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 09:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A878736602D
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 07:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0481832D0F5;
	Wed, 19 Nov 2025 07:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BcKXW1Mz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5F231D727
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 07:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763538730; cv=none; b=lGBopLxru1klpj4d90uVacVNUUinnoyZgz76QQdPz3v12w6mlhmukwYKmpXl8PnAdB1B7GAbOutSdUgQ4C/Bz6wzitI30qYwCZejtg87qg9p5NwZDLDJ/qcgCWQQQZB3j+m6JNtmTm/H2HBF+B/Ddfc+uawLx/tCUy5ActqC4ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763538730; c=relaxed/simple;
	bh=+knjy1mYLTtcSi7oSKXUL41zdpNqO3yYJh2KmNDyZEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=us25OU0zI40InHSls9nU+c9+78uxcKuETVRJAwxPBYoPKCi7LHSQxXRKqsTx7kDIOuLfWfDkqIJuLblgs8OolkvYE0NH28jBcr+g7cCuCIYbtlAgQMbVPgU/icjblghQY2KOhl+NY89h/xEMLIf/LQN/Itr1VI6p5f8qiwtH34k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BcKXW1Mz; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59431f57bf6so6721345e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 23:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763538726; x=1764143526; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwU2GYwNQnlMl5NP0rEc93dyZ4Rb4vZCEVrGNl0M5D8=;
        b=BcKXW1Mz2kS4ad9RUT4V/S/z6gZIUd7ai0/ppQ59wIi5OuDWw7c/SLIeycdzmAxdQs
         8vmqaWtY+bcXQbQRMLaTm76F+yYdBEbHxLzGdxXB52qpZtDEDaebU6BegYj+zeFWKfko
         /1qByGQRVBu7ojS9Oitp03BL/mRexA6mpia8sYiBpZAzVW/62O4RK+tHC1IQWeMzCx00
         PbphROe8glWxwo/94aExA3lNefD1AcZrKFzIqMO/Zqw6YCv9k5qBOMArw75OPfnAdgq1
         RQrJVhMQSkEh/5Z9+wucWgn8VN7gc3UUoug1R8iDvjVbl/MvGUU/lO3ONS/zRlb6UnBQ
         W1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763538726; x=1764143526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jwU2GYwNQnlMl5NP0rEc93dyZ4Rb4vZCEVrGNl0M5D8=;
        b=wfVVAU9TaW7qr0JyuZMkZkvJYOzLKplXMCU8qvRjWDWgDMPxPAEbKKJLby6qhs5t+M
         No0Ez33CxTIygQRtdnkiAyM1uOEk2ejf7rNtkfb60+lL62xgfvkncftkHFbiXpVXSzUk
         zpG+5BxxdphHy6m8gD2QZ1EAsM7hTUKLDe+/bue8LzH3ZL1PGjUMHG+DUqpcMk10xvYB
         HqqgyubXhANukemXlTckHyw8wTHa+BEFkujoOaGCApQ+tM2RxKGE6qL0I2IVTop0DrG2
         Esgduu5Jiu+/A5oGec3fEsXrXCar2jlVRmTbYyZeJVhDvTj8pDNTSdcAoJ+p50A0bFHM
         fT0w==
X-Forwarded-Encrypted: i=1; AJvYcCVW8KoA8VDSjL0Z/qS8bqkIEQD1FBttuxgpV456UWpyLNvH1p24Lx8o9j8/vZda8g+GCkwQtjjVDDSj@vger.kernel.org
X-Gm-Message-State: AOJu0YyIMouGpjFwV1zgs5aAWSlkxNbjc19c9HOX7XPHGC68unIGHKJB
	7UFnCXRzcSXKn2nG99SruIc3f94k9nWOGn3/+bW54bYl39CYSmNjHrEkgoNYHjQoAL6IiPz6uad
	BW9vwqGErRXg6x7aUhimYDan9EKZ257v9hcarqn5rcWOLkCnnWW06Yo7Gug==
X-Gm-Gg: ASbGncsqOxmjTN13EpOCBW590IZFeMgcIScIEwXkJq4T3gg6FtcKw1qfMBT1+jGCRUX
	g5fk4vGpMDNEuVl9eDLnbO6BS+HhRlzz+q8eyFYa2LQt58/Tre08/N3hKvu96NPdH086ymSaVd9
	7xRSe9XW5k39yn3BDOde4yR5XP9I7+sWQbGJXvM7a4fd2BL9Q36Z+l0MQId555Yimlxxr9mmafr
	spmFssBOSe8lcdoM1klP5/umgkmqYxjy2oiB8x2BjGOcOnP1nepuGkURS21ZYlGDConozMyWB9V
	yWKXTd0Ss1orbt8pQ39ZHzWWX+xGZd7DAeb5SA==
X-Google-Smtp-Source: AGHT+IFA3Go2eF2BwWY09oJ0Cc5G6GOR510iuyfBNrQSzFMWx2OC2w4uzCKM6347Afhcs+F0I7XinNKiUc9fRkF7AiU=
X-Received: by 2002:a05:6512:2347:b0:595:9d26:f54b with SMTP id
 2adb3069b0e04-5959d26f656mr992072e87.41.1763538726125; Tue, 18 Nov 2025
 23:52:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112224924.2091880-1-andriy.shevchenko@linux.intel.com>
 <aRfWouKGA7q2ufCV@archie.me> <aRzBGhsLA_s1rJbM@smile.fi.intel.com>
In-Reply-To: <aRzBGhsLA_s1rJbM@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Nov 2025 08:51:54 +0100
X-Gm-Features: AWmQ_bmHzMwCGa44nLscoV9Y_lW3wDvmdoRMJQt6LG4KvSbBvmhm78b506Tofc4
Message-ID: <CAMRc=Mci_jEp-8TW9+hAyb=viMy69SXDSE99k0Rsss_0b7ZY1w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] Documentation: gpio: Add a compatibility and
 feature list for PCA953x
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, =?UTF-8?B?TGV2ZW50ZSBSw6l2w6lzeg==?= <levente.revesz@eilabs.com>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 7:55=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sat, Nov 15, 2025 at 08:25:54AM +0700, Bagas Sanjaya wrote:
> > On Wed, Nov 12, 2025 at 11:48:20PM +0100, Andy Shevchenko wrote:
>
> When answering to the long email, please remove unrelated context.
> Thanks.
>
> ...
>
> > > +I went through all the datasheets and created this note listing
> > > +chip functions and register layouts.
> >
> > Nit: above first-person intro can be instead edited to:
> >
> > This document lists chip functions and register layouts for all chips
> > supported by PCA953x driver.
>
> I believe it's fine to leave author's original text here. Also the propos=
ed
> version is not so clear how these document was assembled.
>
> ...
>
> > > +.. note::
> > > +     This is followed by all supported chips, except by pcal6534.
> >
> > Do you mean aforementioned banks offset arrangement?
>
> Yes. The chapters are per the stuff explained in them, so everything in o=
ne
> chapter or section is related to the entire chapter or section.
>
> ...
>
> > The rest LGTM.
>
> Thank your for looking into this.
>

Is there anything else to address or is it good to go?

Bart

