Return-Path: <linux-gpio+bounces-4096-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A13B4870524
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Mar 2024 16:16:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41BB9B281AC
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Mar 2024 15:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99004C602;
	Mon,  4 Mar 2024 15:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pvUYGsix"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22EF3FE58
	for <linux-gpio@vger.kernel.org>; Mon,  4 Mar 2024 15:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709565333; cv=none; b=kRlDGm2CgMM7zz2Zg1apUsu6JUB9X8keNeS770g3+fugx4TNaT3GD/pZSwVAR6rZbW6pG0v4LesuV2KbKAAuXyzgxjOp+21vm9EpP3Mh2VZq7eMotozoZQmLjDg8ebFwKJ00popbuJp2hks04tBR55BJbouka1v0n3sbO82RiYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709565333; c=relaxed/simple;
	bh=YxbTFoLqP6oY280USyFbflYr0v1oTqG8VedpUTgh7JM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lOGqhGVUpali5HiwVVl1w3EpJpzyvUY87iPa1uxWOw6b5mobs14MD78fRm2+V86VzMowjBaqB8Z3YY2KHIJJBM4pXE8zoL97xLihcr6umaJf8KzktX1+5sS7D8cSQAiWXJpxly438rGXreO5vPGpeM978MukSGAeySfVqb2Ufo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pvUYGsix; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-4d33d049cbaso1125997e0c.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 Mar 2024 07:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709565331; x=1710170131; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYjJ9NXUu5m1nDaRsg8bhsfXlzVxtGulq6ljiUHV0SA=;
        b=pvUYGsixQ123Y425uz1ePWL2lJdDw5rOwviYexooqHTqECkY4BduexWPLvsFOtEzjc
         fbiFXtkvFWAy1RXD0UjM4Qp6pMBb9asQY5/mvlQm4EdCmlbpPZezhWzb8gbGSZUH225Y
         qR8Fe0VM44giTUAL/NYhdSWcGi7YXH1ShHaJvd/XU0/xyhtnhVwAf1bjohiJC6jWs59d
         NeiKMfFq9ciK4MPFg/kNDLUcJga2kJNfeNuh1RWHje+ch5eGG83uuMsqpLd1te97Nkud
         EMqgvxqGKuhIIxvJHu4l99CDvoHBuBWhLMAJUUPN3lIBG3/okw17qmoEJwEM/NmvwcBx
         VqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709565331; x=1710170131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kYjJ9NXUu5m1nDaRsg8bhsfXlzVxtGulq6ljiUHV0SA=;
        b=MsUKWSWK+JPplXKsU1pFiWd2aT/GhdpQt/qPX//0HonMDpXQ/i0ReNcp43N3Ru42jA
         uDx04SG0krBuCF4h8e/duBpsFJMI7CjArHJbbxfBaAwxYM5Y5AQEcja/jwMAC1T+4qWV
         NWbXksC2XzH7RsfTrisk+JpiOTPHJ4tvUQySO2LUBeXgE7fhBi60omBCi6LKNXRLEGor
         uJz2KifMqdxFg7Fw8/u4W/rA8oU3R4TDD5CPXbKmEy1gm4hZ52pjHIZeHcFxWOzUgyIn
         oELnIdIykwHnst0SvlDl1Z9Uw4QzqpbJen40KhnfD6fnA8TLmKQNvAGPJPSr8upMzfe1
         oXow==
X-Forwarded-Encrypted: i=1; AJvYcCVpPCJZuX71QEPoc429UzPGdlNyiNvaLuGNi9Zxi4RFkIEl9R3bnam4xmiShpzOXSLuIoWLbfme/YmqV1hkegK8E/9Adrlh+yGQ7Q==
X-Gm-Message-State: AOJu0YyGbJ3gIEa3M2EYRRgRsr2nP+DQnnrjCkKQvRsXeuKbcUoeGWyb
	5Pao5yVNfs7EGh3eRmtIDp1mTMLWUetzNbHaeA+mL4VbbLPl5ZbpmRd5yL3hHKRqSftXvZsWGlI
	qwbrSuiy2CQ3Jubw29nKbphpqlt3K4qpaS9ljwQ==
X-Google-Smtp-Source: AGHT+IGcUa2shBJW7CAhyhkG6SYS4eHgsUA4RZw2fnlT7G4lYKf145+I8+ZU6+U6BcVoB5jryN+nBitx1d4WjxESkak=
X-Received: by 2002:a05:6122:3685:b0:4c7:7407:e8ab with SMTP id
 ec5-20020a056122368500b004c77407e8abmr5906270vkb.12.1709565330774; Mon, 04
 Mar 2024 07:15:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221193647.13777-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=McECxKW+uS7fQyGtYVfcSZQaAJZFi+s+wNMoRiHxef0zw@mail.gmail.com>
 <ZddL7L24RXoqR7sN@smile.fi.intel.com> <CAMRc=Md6d19hhySFti+vSLV9pfyzuHNUDmHN_XYV73uCWDAY7w@mail.gmail.com>
 <ZddOcJrYEANc2B2Y@smile.fi.intel.com> <CAMRc=MdABvY8dC+UBpkoLiHc881UFKv0VAQsCUhqnxn3f5LKRQ@mail.gmail.com>
 <ZddPEHjLeiYUd6Tb@smile.fi.intel.com>
In-Reply-To: <ZddPEHjLeiYUd6Tb@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 4 Mar 2024 16:15:19 +0100
Message-ID: <CAMRc=MdDDz1HHqB4pkHFv+_A4iVdh7m-R2B9BrmotRW3Pm2EEA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Deduplicate cleanup for-loop in gpiochip_add_data_with_key()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 2:41=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Feb 22, 2024 at 02:40:05PM +0100, Bartosz Golaszewski wrote:
> > On Thu, Feb 22, 2024 at 2:39=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Feb 22, 2024 at 02:30:03PM +0100, Bartosz Golaszewski wrote:
> > > > On Thu, Feb 22, 2024 at 2:28=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Thu, Feb 22, 2024 at 10:48:00AM +0100, Bartosz Golaszewski wro=
te:
> > > > > > On Wed, Feb 21, 2024 at 8:36=E2=80=AFPM Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> > > > > > > +       while (desc_index--)
> > > > > >
> > > > > > What about gdev->descs[0]?
> > > > >
> > > > > What about it? :-)
> > > > >
> > > > > for (i =3D i - 1; i >=3D 0; i--)
> > > > > while (--i >=3D 0)
> > > > > while (i--)
> > > > >
> > > > > are all equivalents.
> > > > >
> > > > > The difference is what the value will i get _after_ the loop.
> > > >
> > > > Ugh of course. But the first one is more readable given I got trick=
ed
> > > > by variant #3 at a quick glance but the for loop says out loud what=
 it
> > > > does.
> > >
> > > I disagree. `while (i--)` is very well known cleanup pattern.
> > > Less letters to parse, easier to understand.
> >
> > Whatever, I don't have a strong opinion, just rebase it and resend.
>
> Sure (just will wait to the fix to be settled down first), thanks for rev=
iew!
>

I realized you haven't resent it after all, do you still want to change thi=
s?

Bart

