Return-Path: <linux-gpio+bounces-8285-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 777A9934FF3
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 17:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3E001F2294C
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 15:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E21EA143C6D;
	Thu, 18 Jul 2024 15:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wMGXMuvm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A745A4D8B7
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 15:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721316834; cv=none; b=fsawHV8c8PIiXj4+/1Adc1eMgtJR8ijBNS9CUdIke4IGBlEfXhPDt9b65oxVDOzhlNN19tgpXgoX2I+rrWPY2ttvz628DnZLCDQNcusdMyZwFc0Nc8PkK55QuPZvx4y2WnaEXDHsuoaSVNQ1pBgF/XiE3cc5sLy9zrQ9JuQi4ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721316834; c=relaxed/simple;
	bh=GCR0CFRobQRw7xW5igxBYBkUPbLVql4oW/fQXJpkOuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JfdMjn3r0OUYEu4rx7yt0lTSyoJG9GnkdU+li3+u1kavuscGK4ceeLcqEbtQRhmnt4587Wxyo7YIOsItUVMEG9JbnnEvItWpb9KOCP7zK7Mb4RWcOu3PucNTj9T1DFMYsbVHu12Dsq2CI0vvOcYKlO1qgl1NLoZB+0pU/7oL03o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wMGXMuvm; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ee9b1b422fso9297301fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 08:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1721316831; x=1721921631; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQmzV+03IahZ2nZfnvKXf7qXYLOLcvtEICvS0CRZ9tQ=;
        b=wMGXMuvmFt82A8lVlKjat54jdm6ueifEUVUZjMfM4oglIDLEE0RBg1zKhZTj87/PZm
         k/YOIjqYWFTPMDcqJOZgaaWnurlQ33b6L7wgX08GYyGYXkWS/cR+0uM+fEqAH4XTag+J
         lXYAf13Jh9FFMvESspYUJI4iuV387NhGlVOVWV39pZc+GIFDhVZpeJMpjSBzrB95K3QX
         0QhI7yyGESMHhq6MLEv6jcR3N7bnT3E4I/bIgJ4dWF/wRhTVv8andyuS4s5ZqIWb+qMh
         XPma6AROdrSuNmy2N0u5+lQoWqh+LcmrefGWKICPNyA+sbZWoJy0I3BD7hLkKP0YqmLH
         tDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721316831; x=1721921631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQmzV+03IahZ2nZfnvKXf7qXYLOLcvtEICvS0CRZ9tQ=;
        b=ZZn/7duevJ1NJvHUD3qnnY4WxRuU7Boo3V5s9tvQYl0CQpfvP23C8LgHoZiimtfN3o
         wKNO1a+BOhNsbo8lOoGZMzZrjsZC6h4nUR8Qh40nsnPWrldSP28dzTNGYDX5PVWopTvS
         80dQgoBayGtoJFQmp/AUphuE7rMtWbf84zC/uOipJgJsGsRW5gbcYLvnEwcrv0EstoPG
         UcG/O7wLy6OQQlKoNuwQuWiv0lnDO3bCIB2SCzmuydv1mRUNF14WYzEvSEg9/GGdOzp3
         7rEpVzihqLUL7jSMb834X/V4N07bGLnQHR6xeQ14DWdrOAhCgBdZ+ea2XG82NcpniCQB
         McCg==
X-Gm-Message-State: AOJu0YwQb8urboF9Pdzt6I0/5BYMEA8SYaWB/l/7ECg58tgF9BXRNM4M
	t3mzfYcz3UpfP3YS0Gv0wKxTWf5L6zyRu+JiIwQOCwEyo0wzhHBq1LeIpMwDjncuTMnB7JWDj98
	HZIq0ug4vu54RzwRb3N2SJqFX+W4sQDUSBgOjuA==
X-Google-Smtp-Source: AGHT+IE6TGRDmdl3CtWniJLe17DpqfH8aK0Z3g+DTrfjXa+idRNXZGoqmlVsDZsSp7njbnqtLlmFbyGig48BtQr0Qag=
X-Received: by 2002:a2e:8ecb:0:b0:2ec:32dc:60ba with SMTP id
 38308e7fff4ca-2ef0657e165mr8574531fa.7.1721316830801; Thu, 18 Jul 2024
 08:33:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240718-dbus-v3-0-c9ea2604f082@linaro.org> <20240718-dbus-v3-3-c9ea2604f082@linaro.org>
In-Reply-To: <20240718-dbus-v3-3-c9ea2604f082@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 18 Jul 2024 17:33:39 +0200
Message-ID: <CAMRc=MfJTJH=UngJB2q8anrfcwQQDhSUj1q7o8FQ4Spv16h-uQ@mail.gmail.com>
Subject: Re: [PATCH libgpiod v3 03/18] bindings: glib: add build files
To: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Erik Schilling <erik.schilling@linaro.org>, Phil Howard <phil@gadgetoid.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Philip Withnall <philip@tecnocode.co.uk>
Cc: linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Alexander Sverdlin <alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2024 at 11:28=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Add the directory structure and build files as well as changes to
> .gitignore and Doxygen.in for GLib bindings.
>
> Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

[snip]

> +
> +if HAVE_INTROSPECTION
> +
> +INTROSPECTION_GIRS =3D gpiod-glib.gir
> +
> +girdir =3D $(INTROSPECTION_GIRDIR)
> +gir_DATA =3D gpiod-glib.gir
> +
> +typelibsdir =3D $(INTROSPECTION_TYPELIBDIR)
> +typelibs_DATA =3D gpiod-glib.typelib
> +
> +gpiod_gir_SCANNERFLAGS =3D \
> +       --c-include=3D"gpiod-glib.h" \
> +       --warn-all \
> +       --namespace Gpiodglib \
> +       --identifier-prefix Gpiodglib \
> +       --symbol-prefix gpiod
> +
> +gpiod_glib_gir_CFLAGS =3D $(libgpiod_glib_la_CFLAGS)
> +
> +gpiod-glib.gir: libgpiod-glib.la
> +gpiod_glib_gir_INCLUDES =3D Gio-2.0
> +gpiod_glib_gir_LIBS =3D libgpiod-glib.la
> +gpiod_glib_gir_FILES =3D $(libgpiod_glib_la_SOURCES)
> +gpiod_glib_gir_EXPORT_PACKAGES =3D gpiod-glib
> +
> +include $(INTROSPECTION_MAKEFILE)

Ah, I realized I added the introspection bits but they just silently
fail to generate anything useful. I probably still need to change the
file names to fit the convention.

Bart

