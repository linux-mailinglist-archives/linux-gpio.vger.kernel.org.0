Return-Path: <linux-gpio+bounces-691-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 443C57FDAE5
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 16:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB904B212E4
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 15:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346E3374D5;
	Wed, 29 Nov 2023 15:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKrlOYww"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EA2DD5D;
	Wed, 29 Nov 2023 07:13:56 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5bdfbd69bd5so779647a12.1;
        Wed, 29 Nov 2023 07:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701270836; x=1701875636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0iIKWxGyiRbf3SG4rKDTOqBlNDSA1cc3f6H9uieYbWQ=;
        b=cKrlOYww7cA9oC9eVtKWVO866JjR4DizsLqiWArerFVlB4p3vTGDlnoA2hQ8FuHyeS
         uydfCRImVLOf7TZP2fxOjXFXEsnbqTjTBt29tBkl8qCym/EHJLqQqbuU7FV0pyalum4V
         oEKw2RF/Kl718uN/Ij8Z58xwZsj+sXjuuSPaBMJw/mUAlGE/j43wL6nD0iEu7lRpJ5qQ
         rRojGhhBzHSuGWgNMAIgfKsgLaVtQxm9Sx9N5Ipz6Xq9nys7iEuynJUPtw8o1ONbZcDQ
         Brsvqq/d+DKWhnG0Y5rwGjoN0TXliFxpYoPJ8RlKU1A9rhsy7M5jm1JaoD+4mW0ABad/
         OExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701270836; x=1701875636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0iIKWxGyiRbf3SG4rKDTOqBlNDSA1cc3f6H9uieYbWQ=;
        b=ufaLlVf6Q2xA9e0pWddQoBks3GwiC3xzoy3Ax/ggGef50aZn7Z2fputDHc3cWvFVSc
         6+qFVPlgd5fszGQOfZOp80ez5C4I8NKzFSS3atpIvAlH/GtJeixSCS1uOe+MJsQW3iyQ
         oY7tMMyOJnBxs8AA8BKiMQCzZoFX4QRfKgmIrvJDfaSiz22wxIBdhE+plznlHYf/cAS3
         IS/t1eoDhBAQETHxrSDA0N2f6H1xdGHR3JPOwvh2Db15g7YenvifFsJv+veC0KvAjTbX
         OfQBw15A2gf7FjBWblN91cFq4Nmf1Sn3gTM2n1oCJAoyiOlef44t+eGi+Y2FkzQUy6lk
         trgw==
X-Gm-Message-State: AOJu0Ywl7k3ua4e5xv4BnRptfOQkErmE7XGzrrIIZGdYGvRmrGT4uEJI
	5OYOJN3HC53ziVe/0ALosLPVEukp3/LRn0r0vUI=
X-Google-Smtp-Source: AGHT+IGefgEeFVwSE2YE0tvnc8G4Kez5vym0kVbW57S7KbimWr8xl59X64QhhOD/XIjQvIgaf5ts76/7Wg7OVUe/1HM=
X-Received: by 2002:a17:90a:ad04:b0:285:a161:ad8f with SMTP id
 r4-20020a17090aad0400b00285a161ad8fmr19998927pjq.21.1701270835659; Wed, 29
 Nov 2023 07:13:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128141321.51669-1-boerge.struempfel@gmail.com> <ZWYVVvB0O-CBIbos@smile.fi.intel.com>
In-Reply-To: <ZWYVVvB0O-CBIbos@smile.fi.intel.com>
From: =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>
Date: Wed, 29 Nov 2023 16:13:44 +0100
Message-ID: <CAEktqcv8NC0Cy+wo7nRGOp9USoBdta=n=mrbo-WomxgcmWN5nQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: sysfs: Fix error handling on failed export
To: Andy Shevchenko <andy@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bstruempfel@ultratronik.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Andy

Thanks again for your feedback.

On Tue, Nov 28, 2023 at 5:29=E2=80=AFPM Andy Shevchenko <andy@kernel.org> w=
rote:
>
> On Tue, Nov 28, 2023 at 03:13:21PM +0100, Boerge Struempfel wrote:
> > If gpio_set_transitory() fails, we should free the gpio again. Most
>
> gpio --> GPIO descriptor
> (I already mentioned capitalization in v1 review)
>

I'm sorry, I misunderstood your comment "GPIO" in the v1 review. I fixed it=
 for
the next version.

> > notably, the flag FLAG_REQUESTED has previously been set in
> > gpiod_request_commit(), and should be reset on failure.
> >
> > To my knowledge, this does not affect any current users, since the
> > gpio_set_transitory() mainly returns 0 and -ENOTSUPP, which is converte=
d
> > to 0. However the gpio_set_transitory() function calles the .set_config=
()
> > function of the corresponding gpio chip and there are some gpio drivers=
 in
>
> gpio --> GPIO
>

thanks

> > which some (unlikely) branches return other values like -EPROBE_DEFER,
> > and EINVAL. In these cases, the above mentioned FLAG_REQUESTED would no=
t
>
> -EINVAL
>

thanks, I missed that, when I added the minus to all the other Error codes.

> > be reset, which results in the pin being blocked until the next reboot.
>
> Fixes tag?
> (`git log --no-merges --grep "Fixes:" will show you examples)
>

I thought it was optional. But I have added it for the next version.

> --
> With Best Regards,
> Andy Shevchenko
>
>

