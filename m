Return-Path: <linux-gpio+bounces-13003-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7099C8B4A
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 13:59:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C384B2890B2
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 12:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D051FA84A;
	Thu, 14 Nov 2024 12:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Gvzo9N98"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48394193061
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 12:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731589175; cv=none; b=c83nbuiXHElm8tC9Mh6wco2CAPN0F7aRPVJ+Qx9xd7Eqb4uQ/QSwSbq3RrU12oDXGDl7LzWiMqPy0cAXyVZ9aP8H66nhFyJvhJkgwSA9rMsIxOeWTLLRO8Dk29SiG2DlVHOAk2TLuHzdzHPpYExuekGJVFoqe5eCaABbPLSddqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731589175; c=relaxed/simple;
	bh=MGkV6k7ekIpGE7d8ywuC6KKlX8ewwJtWiBawQLrWFHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IIAGts20FsufsEhukd+NRUHBmqJAKpbCWR98tTULPewSD1BuZHSvEAi5jCfteLmcCM53MAgxuQKb6WOx8YtKKSVGWjV50ZWgLd42ZMXwidwxUMtoPAV1xsbYFLqHf/o9YF0UwwH7DruGNEPB4o5uNj0jEwHcsYKZTuZD14bpgyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Gvzo9N98; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f84907caso582886e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 04:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731589171; x=1732193971; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMdSFBpU3ulyQCbsazLw9uC5LrnPYy3sgCbS7yhbe+Y=;
        b=Gvzo9N988zE0jIP7bkTslczqYdev7tCShQtZB57xvW2ceb2nfNrkSoB8kIwZlUDObr
         jYMeVeZvqF9BfHYGaPoPLTe/UH3ckVC9qrvfgwyqsC93pxlBI3I0MZMqaoZVF9XrKQC5
         McOZMtrrNJ2AEcqiNvGVg/56804Qv/vYCebvd2LlJn6EXx7WQhi2ceKTFm3S/SWelGGO
         UDxSKCZGMO3zyBABcKRSrX646cBam4vjJz3Ocm95x7gv0ZKNUcBlIljw5WHvhQXsobWU
         mrtEoYlEfVx+dtECYT2FndTjbVOzEa80dha2MxmGG/N9ozN4ssI3RoM2B8Lam6ieDeNE
         vLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731589171; x=1732193971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMdSFBpU3ulyQCbsazLw9uC5LrnPYy3sgCbS7yhbe+Y=;
        b=W1TMlCWzpNAc9zMOl0w6NpmBuZ2nXx8gXWTXIDSre5TgwjgDdgDsQLn8QGfRG6Z4U7
         xUDgrDy870uaV9r2/eRjUtOS5iPv4bnK3xDGyQ1GRaxGt0Sc3XK7xK0OUpQ55bImAcQu
         ZnIkkJigrqxtkAk4n47AVkjjpL0UAKO1ntsszcW6/HJDwxH+kmorTR2JsPQFC8yYAsHm
         91t0IKaVfRK2jc2m2KFakl7dJ7Jd6Noaee6CvOtV60vt9PJFU47Ff1rW0zAHMWKs2tE1
         srnFqWz4Z06+O8nYqLuEzSUUr9UXDUdza0c3vrbsA6Kbhw6r0tGyUnt1SiS24wR9JL7k
         boEA==
X-Forwarded-Encrypted: i=1; AJvYcCWS2396/rC+ZKsSPBYGuHOIm4GL2h1ebyNAszkRsnlOWK0eTThYJKl0UoG/pDIhwVxNfrVuTl9uz70e@vger.kernel.org
X-Gm-Message-State: AOJu0YzHTj2VUrTt7kEakmOoMHEhzsw0jaU9bqoe4aT9Nn2djycnmA9Y
	yMKA987NsNxN+Qe04oZIRb2GMapXszBQGxlm4ZE511A3lGyAJBhHo7YBVwVlBCAbdb85pvvw5HX
	xgrcc1C5EzwKfBhmUVFwbDARkFvaaHLULFgnCEg==
X-Google-Smtp-Source: AGHT+IGDWKkoZLl9YnbdXfMARn0TDFveOqGcTx6vBzaoMPB7NVaZvWqSjtNwS41hkaMepCKrVfrH4D2HsiCP1mEXYxY=
X-Received: by 2002:a05:6512:230d:b0:539:e4b5:10e5 with SMTP id
 2adb3069b0e04-53d862bd4e3mr10788911e87.9.1731589171250; Thu, 14 Nov 2024
 04:59:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113171219.2949157-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MeaDjhxAwmTcNZ+oHniFn4EWVEmfP8MdNWitmD+Rr=scA@mail.gmail.com>
 <ZzXTbEcrLigXWpAu@smile.fi.intel.com> <CAMRc=MeEtyTXr6A4gXbbN=ZY1tzAQnbVMF0NYA2_6Xm3=jfS6Q@mail.gmail.com>
 <ZzXhf2zM9IisvZhs@smile.fi.intel.com>
In-Reply-To: <ZzXhf2zM9IisvZhs@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 14 Nov 2024 13:59:19 +0100
Message-ID: <CAMRc=Mdo2DysJRPvJRU9RwTCH8nmw_CFRYYoLfvfC8+j0K9roA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: Move and sort Kconfig entries as suggested
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 12:39=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Nov 14, 2024 at 12:15:46PM +0100, Bartosz Golaszewski wrote:
> > On Thu, Nov 14, 2024 at 11:39=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Nov 14, 2024 at 09:54:50AM +0100, Bartosz Golaszewski wrote:
> > > > On Wed, Nov 13, 2024 at 6:12=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > >
> > > > > The Kconfig under drivers/gpio has a specific comment
> > > > >
> > > > >   put drivers in the right section, in alphabetical order
> > > > >
> > > > > but in time some of the entries fell unordered there.
> > > > > Put an order again.
> > > > >
> > > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com=
>
> > > > > ---
> > > > Could you elaborate on why you're moving drivers between categories=
?
> > > > For instance: you moved Intel LJCA to USB drivers and I'm sure you
> > > > have a reason for it (it's not clear if this actually is a USB driv=
er,
> > >
> > > This one is actually clear as you see that it depends on USB_LJCS whi=
ch
> > > suggests that it's USB based.
> > >
> > > > it's not registered as such
> > >
> > > Neither one of the existing ones in that category, right?
> > >
> >
> > Well if you really want to open that can of worms...
> >
> > Only gpio-mpsse is really a stand-alone USB GPIO expander. Others in
> > this section are actually MFD devices and would probably better fit in
> > there.
> >
> > I don't have a strong opinion but we should at least be consistent.
>
> So, as far as I can read the whole picture the categories are based on th=
e HW
> (and this is how it should be) and these what I moved _are_ true USB devi=
ces.
> Linux abstraction is just a Linux abstraction.

If that was true, we'd have no MFD section at all in GPIO. In there
you have I2C, SPI, platform and I don't think there's a reason to
treat USB MFD devices differently.

You know what? How about just reordering Kconfig entries
alphabetically for this merge window and next release cycle we can
decide on what to do about Kconfig consistency?

Bart

>
> If you want consistency, drop these categories for good, just have plain =
list
> of the all GPIO drivers. No room for any speculations :-)
>
> > > > ) but please expand on it in the commit message.
> > >
> > > Okay, I will do in v2.
> > >
> > > Thank you for the review!
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

