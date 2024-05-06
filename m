Return-Path: <linux-gpio+bounces-6135-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1428BCC3D
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 12:45:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2ACAE1F22D87
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 10:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BED9142E6D;
	Mon,  6 May 2024 10:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDZK6MWq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E107757FC;
	Mon,  6 May 2024 10:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714992306; cv=none; b=EvhCiFkQ0P5I7qFa2flquM2IqOejo+sr6i6csjWXAcp8Xw0sfvH0dVRGxjxZMmWs7/M/ARQevOx3HVPEmSSpIMwiB/f2HM7vvvYbSZCWlxc2YvY8F535DXUO+g9l5bIcw1rsblhno36bSj5qkd5s1jsxkDwsWUvJ8yK2stSSsyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714992306; c=relaxed/simple;
	bh=EHme3yAbX+1vqZyTcgfu8ySIyYMza6nwEd4TlXNJbjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=noAxoMvQg1nxIPk6mugPzx9qN8h+5LcfwAcBIqsCxdQaR2/thy9gRKmsVuGM4oO1KzOSQNGl2cVErjJKISXcXiXcp28uSkkTOf9y4XEa1F2AV4CZDHmvU9t2ijh2XlglGNJgyw/O2zlO5JKsqt3FndyGyVgIIGnndwX60ZS2qXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDZK6MWq; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a59c448b44aso235291266b.2;
        Mon, 06 May 2024 03:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714992303; x=1715597103; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHme3yAbX+1vqZyTcgfu8ySIyYMza6nwEd4TlXNJbjk=;
        b=hDZK6MWqdSN5iGi1qgxitByTUQu3yrt3FiSNXSvpvS7d9ZGbT1jnX3SrwkCTpgSVs4
         TRPrsN+9wkpTIRqaDs7eoiFGRgeRQe//dgC+Se2mc9v4NwzOp1fP86mSAmU6rQPY9pbS
         skwIRB3S4u3J8mANCDra3KoDMorMJ4ctS5nEEG6toAcV43mKVWGefAacmPqjdQZbRdKG
         VvewOI/f+0nmNZrgk32xNxR+hDRxNbhChQkVPgfPzC71GQnBjGvHT5tZBTteOSv+7Em1
         FM7r4V4+B6fVs+8EzCzC27//mMp9bZEcoDYdK+GipabTbWb0bHmV/PR4KuCnbmUHOzOy
         8ddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714992303; x=1715597103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EHme3yAbX+1vqZyTcgfu8ySIyYMza6nwEd4TlXNJbjk=;
        b=dqn36iW6NaiJKBAlF+FK1/wdW2hRi3W/uTKExv9Eak7/MFp8M15rl9wV1mWDi7AhO0
         mypogHDmXzf08Wcn+OuowOl9KC6809fc25QZvsLL4wGJy6cWnr+3SkRcoeiizAPvPLbC
         E9XTJybjlK2HwT43MwgUzUYttcVQy62M56GYxjzU3YZ9MfXKDh6QIGuig4vb7P9mZOeB
         2Fqfu6Fb0Qtkp1PYKSHpZVSAwEg4Q0xnoBbYRMPmrMVC29ghR1VFKMnvCpiaTX8qMxtf
         CjldVo20z9Bne6M4BsuuJrDfLltNQ1ZOSUpwEQe4wzI32SN057DbImFJQBzXbXAC5Xq3
         nXHw==
X-Forwarded-Encrypted: i=1; AJvYcCXX6QIBfJW05oQOd6MPFcoxuSLJiWaa+n1DJpNpakjN12EGaPMqzIMLDAEKjfqmt01yGkbmlM0HyzPe3RO3CsaG8ctGl3nl73VVXakNbW+sxsOTSDwvkbjvzIbEIE4a2WfLjsKk1Drciw==
X-Gm-Message-State: AOJu0Yy1qL4T84S79pB3kWMD5hyDOYZYZtwEjh8jEAP246n333O6YsFa
	b6/HjnNCtw3Y/ktJDGvHCGuisvF7EKBhQ1hb1jYOZzatTDk3Yf/QW1M3Mfd3VtDHDSIzZhN9q/3
	EA4Ei68zeJwOeg7vXx8SUkXLnD/Y=
X-Google-Smtp-Source: AGHT+IFOweTyVqz+q//mIchLXte5UnSewstJ0qxVvQ5l5HmJ8VdPrSRRJeSjsHQnWTc65ee02jA4bLzIM0raZ0ZDL+0=
X-Received: by 2002:a17:907:7203:b0:a59:c9ce:338a with SMTP id
 dr3-20020a170907720300b00a59c9ce338amr2131074ejc.2.1714992302776; Mon, 06 May
 2024 03:45:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240505141420.627398-1-andy.shevchenko@gmail.com>
 <CACRpkdap=KXuyoCjWt_v53ArRPynDQndAjjHfvapLUM7VWbbdA@mail.gmail.com> <CAHp75Vdn+F=MMAyguOFup5xyOCEVZowOordiEG1FQ9Y22kLdDg@mail.gmail.com>
In-Reply-To: <CAHp75Vdn+F=MMAyguOFup5xyOCEVZowOordiEG1FQ9Y22kLdDg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 May 2024 13:44:26 +0300
Message-ID: <CAHp75Vey_gJ9KHemwK4QdStdW4vYCTWnY2yUwNxWycaZg3SgUQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Discourage to use formatting strings in
 line names
To: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 1:39=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, May 6, 2024 at 10:19=E2=80=AFAM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> > On Sun, May 5, 2024 at 4:14=E2=80=AFPM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> >
> > > Currently the documentation for line names allows to use %u inside
> > > the alternative name. This is broken in character device approach
> > > from day 1 and being in use solely in sysfs.
> > >
> > > Character device interface has a line number as a part of its address=
,
> > > so the users better rely on it. Hence remove the misleading documenta=
tion.
> > >
> > > On top of that, there are no in-kernel users (out of 6, if I'm correc=
t)
> > > for such names and moreover if one exists it won't help in distinguis=
hing
> > > lines with the same naming as '%u' will also be in them and we will g=
et
> > > a warning in gpiochip_set_desc_names() for such cases.

Dunno if I need to elaborate this more, but just in case here is one:
Even if one puts '%u' to one line and avoids putting it into other:

 "gpio%u.foo"
 "gpioX.foo"

it means that it was already in mind to distinguish them beforehand,
diminishing the '%u' appearance in the first place. I.e. one may do

 "foo X"
 "foo Y"

to begin with. Besides that repetitive namings are discouraged and
most likely have no value but confusion.
For example,

"gpio%u.SPI CS"
"gpio%u.SPI CS"

would be rather

"SPI CS 0"
"SPI CS 1"

which is much more clearer to the user.

> > > Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Thank you!
>
> Meanwhile, Cc'ing to Kent as well.
>
> --
> With Best Regards,
> Andy Shevchenko



--=20
With Best Regards,
Andy Shevchenko

