Return-Path: <linux-gpio+bounces-13373-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B7C9DFBF9
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 09:34:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E46F16310D
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 08:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5EA1F9F69;
	Mon,  2 Dec 2024 08:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wdvlDL1u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B49D1F9EDA
	for <linux-gpio@vger.kernel.org>; Mon,  2 Dec 2024 08:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733128430; cv=none; b=YQIcSMPmDTknW9KzJZyKZenoKrsdv6SW2WkeHMZyRn0fTOChdFjlcNUMbMzyASVANJ6d7kAyn7DwE2+HMA3iL2UXmJxu3BemzbnjqxU3/fdTY7RG/nh8ISjCNwxalwetCZ8642UID9GGYNsnP8EmrbtSd+nxkKBPFb8DuYoD8Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733128430; c=relaxed/simple;
	bh=Cu0kKv0IZ7+ctFg9FxMw6umtnTNixeMGCTXdGrM7RsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tU3W+aPOCTKEjddRT6fTU12bc7bLjFWb/eFQwZ57UTfaNuRt4g1NNLWeZKFOBTqAkbvI7x/FMezSyXRJPDJ/9BWZWPNW9VM7i2hMNqW+9lJNZZVZokyxpf+IXSYI7+r4Xreime7IpP0SHqWHp8fBcnnaeBlMQQeIWqEOkSLySE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wdvlDL1u; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53de852a287so4454894e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Dec 2024 00:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733128426; x=1733733226; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7oHXVMDbu75Pk+qDQ4qwIsEpykCKn/aLIv7MmjbmJY=;
        b=wdvlDL1uRK94pI1FMzDG8hnlymiHmw68IbVAxu93CNxkhxKMSkIeNCLeq4euXSQA4d
         eT5xdR0H3dwxgS6xs/tvCioCZMR+0PcVxKDMKWDqa3W4Ob8/IQgyWoG6DS6EOhcb/rQU
         1lNLvRHIm1WUORtiHEPZ1ilUyxCeckfqRUQUmaWjDIgtOAHQqNgPv7nUHiyIe8oncGpo
         6sMPQiL4zxd1HAqIBDZ1g1H6QilJH9GZOVwDBqSuH7a7v82eFyMWseZJ2QphQoGZBWoa
         nUOlr11xgq3Hrr8PWxHDAuU38zjBb5QPZHesqK8ud5OmzgHszAzqT8fkWY3An+dLzNqI
         A8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733128426; x=1733733226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7oHXVMDbu75Pk+qDQ4qwIsEpykCKn/aLIv7MmjbmJY=;
        b=t/e9qHmSmnBlnBFibu43zLIbkyNgm1iUml1XrhckF18yYCsVzbKKTrlwzKTYI96QN9
         UbcPoKtkJt3SDSvsXhfL48cE6DLiyrN20q2Gtlj/4g94z33N/gCM887vglTcwGPMeGkt
         mT4W3vT9itOrPsIxD8UHXv5ImiKdOH0sGdV5OF3xCAyrQRZngPNtolF9YUWvVvyUfK8H
         2jeTnWEwpa7T0REY9R/tLeS+sZJDX6VBJZeWU4VRNTz9shjeP2kiWgnF11rup4uFC8BJ
         j+ehY5i+88oBS5qt7jxQlEiTbHMXTdhv2uQhz2qy76d060vlD0/0EmlDQNGuzXiC5ngN
         qJQA==
X-Gm-Message-State: AOJu0YwdVMxg7l930h1Zt2V64gKrB4Yw7+69MdCweex4UiU/d9FPZF7S
	nq3OeqGV/ZjS/6Z2peqKWhEX7zG55ozBKTyQSnsgmpDSda7ZsuWWqaRRERaTgeC8uXUG8acr5IE
	Q/FDUXVxNr0ab0GqRXA7YIXo417OA3X5bxAIZVg==
X-Gm-Gg: ASbGnctUS2e5LEDqe7VYrPRJYKbaHxbyYfO0D0zExWMqFNwKZaHC+o8ECgdWxE2zAuM
	dg4rmLgNwBzB7uzuNkHRyvDuDZoRPxloujGrfJCpZdZbtKMKjY/qyTDIUxqhkCy8=
X-Google-Smtp-Source: AGHT+IFvsdxi+4++/MJpcL/yS5MZrKTEeD2X6mhkYgOwffx0lnGoetYkEts2Dtw5LWT7CLjYC5OMYOOLKhVVk5GSLEg=
X-Received: by 2002:a05:6512:124e:b0:53d:d3bc:cc11 with SMTP id
 2adb3069b0e04-53df0112095mr7347163e87.48.1733128426038; Mon, 02 Dec 2024
 00:33:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241130201516.18034-1-george@george-graphics.co.uk> <20241201231313.42935-1-george@george-graphics.co.uk>
In-Reply-To: <20241201231313.42935-1-george@george-graphics.co.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Dec 2024 09:33:35 +0100
Message-ID: <CAMRc=McBtrPAkQoUS9tW74E3DgSv1RMH_dR6FYQCdeiSadkm8w@mail.gmail.com>
Subject: Re: [PATCH] libgpiod: bindings: python: Fix PyDict_Next contiguous
 assumption and pypy
To: George Harker <george@george-graphics.co.uk>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2024 at 12:15=E2=80=AFAM George Harker
<george@george-graphics.co.uk> wrote:
>
> PyDict_Next does not guarantee pos is contiguous, and pypy increments
> past the end of the dict size.  Patch fixes reliance on pos for construct=
ing
> args for gpiod call.
>

Just a couple nits below:

> As per discussion here https://github.com/pypy/pypy/issues/5142
>

Can you add your Signed-off-by: tag here?

> ---
>  bindings/python/gpiod/ext/request.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/bindings/python/gpiod/ext/request.c b/bindings/python/gpiod/=
ext/request.c
> index e1a2a42..4e49289 100644
> --- a/bindings/python/gpiod/ext/request.c
> +++ b/bindings/python/gpiod/ext/request.c
> @@ -206,6 +206,7 @@ static PyObject *request_set_values(request_object *s=
elf, PyObject *args)
>  {
>         PyObject *values, *key, *val, *val_stripped;
>         Py_ssize_t pos =3D 0;
> +       Py_ssize_t index =3D 0;

Please put this on the same line as pos.

>         int ret;
>
>         ret =3D PyArg_ParseTuple(args, "O", &values);
> @@ -214,8 +215,10 @@ static PyObject *request_set_values(request_object *=
self, PyObject *args)
>
>         clear_buffers(self);
>
> +       // Note: pos may not be contiguous and in pypy, is incremented
> +       // past the end of the dict size.

Please use /* */ style comments for consistency and don't mention pypy
- it's actually python spec and just by chance it worked fine in
cpython so far.

>         while (PyDict_Next(values, &pos, &key, &val)) {
> -               self->offsets[pos - 1] =3D Py_gpiod_PyLongAsUnsignedInt(k=
ey);
> +               self->offsets[index] =3D Py_gpiod_PyLongAsUnsignedInt(key=
);
>                 if (PyErr_Occurred())
>                         return NULL;
>
> @@ -223,15 +226,17 @@ static PyObject *request_set_values(request_object =
*self, PyObject *args)
>                 if (!val_stripped)
>                         return NULL;
>
> -               self->values[pos - 1] =3D PyLong_AsLong(val_stripped);
> +               self->values[index] =3D PyLong_AsLong(val_stripped);
>                 Py_DECREF(val_stripped);
>                 if (PyErr_Occurred())
>                         return NULL;
> +
> +               index +=3D 1;

index++ ?

>         }
>
>         Py_BEGIN_ALLOW_THREADS;
>         ret =3D gpiod_line_request_set_values_subset(self->request,
> -                                                  pos,
> +                                                  index,
>                                                    self->offsets,
>                                                    self->values);
>         Py_END_ALLOW_THREADS;
> --
> 2.39.5
>
>

Thanks,
Bartosz

