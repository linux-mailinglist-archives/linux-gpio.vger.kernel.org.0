Return-Path: <linux-gpio+bounces-824-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A1A800924
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 11:55:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D48212814B0
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 10:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0018120B2C;
	Fri,  1 Dec 2023 10:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0H0S8Iv2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81AEB196
	for <linux-gpio@vger.kernel.org>; Fri,  1 Dec 2023 02:55:02 -0800 (PST)
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-7c495bec2f7so633122241.2
        for <linux-gpio@vger.kernel.org>; Fri, 01 Dec 2023 02:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701428101; x=1702032901; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRc7hGweDPEOg5xEFn3wNwDGBn9iwKQTXIiSrreqaqk=;
        b=0H0S8Iv2GLs/hEmyWlkPoW69eFRJARXjBH+M+vOKy1yVUzhP1suY6kIGSBRVIqAzVs
         uxxYN5MgSHj0CgGKXQAa1RPE1dviHs7vG8wDmOQOz0olEUL8FjNlrc5sAKByY8oSoLJz
         oFMb76JAC5o+jJDTQ8LklAzf2eCn2ul6n+MMLVZ84LeCz/xIM3l5/zBUEu6UJKA4BxR1
         2hDGRfuUBPp1InGZ6a9+GFEndGSraJ48XS+mfvmtWAboZCHwK6IfboA+5rA9lZPtYJtR
         jWDM2b+ELreAxINTCsWZdedf2MSePywIOVF8cOC7NEHrYoXKCxJRCAdHESy4R4ogr4WK
         gQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701428101; x=1702032901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRc7hGweDPEOg5xEFn3wNwDGBn9iwKQTXIiSrreqaqk=;
        b=YMWIcvaSekME5swjGJItomcTPR0BsYQABGCsA5LsssLr71md7yo6740hXh0c26rvQd
         NgtgwuHW8zednN+9yp4aRi+ZyR43xASsuOPqLM4t8xIzqXq1pMtVtvrmR3EGRRigv4mD
         nNobZd0s4vc+Hm25Np40N5Zxc2ISMK0Z2nxlQT8v1deTdBnmegssgbgQbhvn/MW8C/G+
         rAdrwKlnETEbZ2lK1KGO6xQWpEMlVCRsV53PoDHCF6P8ZUUkoYHLG5HpJ1R85gNkh1RV
         cWmw3wmnd2s39r87CF1J+CYWqy9aKprHK53xZ+ZpcSy1JYKmYzj5+HxWp61S9+9XgkFd
         WC8w==
X-Gm-Message-State: AOJu0YwRU0PJRDL5BnJr5lrUZ4y9G1nLwvN1Gz3G4QbcUFAqfJeLbELJ
	JP0GXzG7rHRSYQ0qW4BaNMA1hkDauIpMM7TXZpAE8LRY6x5036o8
X-Google-Smtp-Source: AGHT+IGAlIaVRocI/1rYFwxey38Epksigkho811/nZO5hyApNGNgobsySh/w+WreQNGFp5LlrF+be6aYd1v3OJPVV5A=
X-Received: by 2002:a05:6102:945:b0:45d:b7f4:4639 with SMTP id
 a5-20020a056102094500b0045db7f44639mr22603164vsi.25.1701428101626; Fri, 01
 Dec 2023 02:55:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130134630.18198-1-brgl@bgdev.pl> <20231130134630.18198-2-brgl@bgdev.pl>
 <ZWi34tkzNsvkCQqi@smile.fi.intel.com>
In-Reply-To: <ZWi34tkzNsvkCQqi@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 1 Dec 2023 11:54:50 +0100
Message-ID: <CAMRc=McfMpir_i=0vRoveozQDBp-4W8c9ufbhD55jLoTKdGEZQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] gpiolib: provide gpiochip_dup_line_label()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 5:27=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Nov 30, 2023 at 02:46:21PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > gpiochip_is_requested() not only has a misleading name but it returns
> > a pointer to a string that is freed when the descriptor is released.
> >
> > Provide a new helper meant to replace it, which returns a copy of the
> > label string instead.
>
> ...
>
> > + * Must not be called from atomic context.
>
> Put the respective lockdep annotation.
>

What are you referring to?

Bart

> ...
>
> > +     char *cpy;
>
> So, why not naming it fully, i.e. "copy"?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

