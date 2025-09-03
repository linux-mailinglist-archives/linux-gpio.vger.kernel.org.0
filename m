Return-Path: <linux-gpio+bounces-25529-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F953B42651
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 18:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4DE5562656
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 16:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D6D2BE646;
	Wed,  3 Sep 2025 16:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="g0GotaTv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52042BE64B
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 16:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756915955; cv=none; b=oclMJOwPI9utpAbJT3n0bm4HqHH/3LWxherWUkIlrEc+SPAiWrfCxLmsO/1n7piFBkAbVfsPE7QUzpBMzwIRaQyJcX6auVcngoK1NaHmQsswI1yc+HCFFhvcXaJbXGZlKKKVdnMBLEBWvylvZIU7FRLWsXflsD9XiB+5btt4Xcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756915955; c=relaxed/simple;
	bh=jVYSc68dlYLIHKx6ZtZFTCSfeXf14R8XdkSzH6Aqiyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oMBhqGI7UeWWUOS5MxSOPD7HWoOE9YsXEZ4VTdjLFyYlWzuCYUDK1GfqmRuYccoiWZ9KFaZGQ2I4P4tpgyrEjtASaV6j3Ai4Fn3+TiUZ6A555D0grOeY7V1/1gKLARoCp2+sKiTGBMy7sIre2huY5q+MDx/6ERXRec7eGWCIIpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=g0GotaTv; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-560888dc903so1770532e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 09:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756915952; x=1757520752; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDv0YkWfgMrbAykmYhgPc5757sIuuDQeVA6MDv7fwBM=;
        b=g0GotaTvYeDS/wUcPp+TCppD4nJrMcFXWFKkMsl/AXwlo8AjTv7WSr1kbAj6cIm8I0
         AuXn+bz9/UBFxCv+NSXKgKArQygHeJtyi+5lGTDeiGB+zYCyLNnaWi25OKf3zXMzt3fI
         a1OIPJxLfhLwXO9w5sjdCo6TQ3E9FdexCJaJ8G7rl+QBHId6kTLYDMVdZKWUiIi5STUs
         1gZ9A1CbNhksVd3xmYvwfOEIBm/xg3S9kam9sjGcpKCeAA1HiYrvBZBfeAo+ApaSIMx0
         9j+tKenTmvoJ4JMf2MXAP+YbIULvCMj167877Ochsf4+pFJDeiihsJ4L/do1tkD8DUNd
         ysbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756915952; x=1757520752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YDv0YkWfgMrbAykmYhgPc5757sIuuDQeVA6MDv7fwBM=;
        b=S0KeK8LQ0rxH1Lv66vrVUiuUS/s6/lOipKs/YvEV9vWvzRZydqd7eLrsG7gF0D63wh
         HO8eVIzHKz5fSSyMsK0pkWsEBwiGJpZ/jRzP65rKFf6wYvR6Mgi9pG/NGZvXDGt5EYRz
         3P7sMqFG5XjRCgQcxI2p0+arZtPQpjPe950p52kvBSS9AYIr3JakHL4vlmql2nwXbYzt
         hPyOUU2Q8uHkFStUVb/0CyQEfNVh/c2ol+4wr88hH3yWcipc/g1LWzU9d1wpFZx6ZWHO
         J88gCwLTFTlwdHKf+M7aZTiTvFAKJxYZMQwfKvms3D276g6hsNL7lc6g/6/pUOrD1DQO
         XLww==
X-Forwarded-Encrypted: i=1; AJvYcCXpjaupSyFYm2A8T0SVE7d2Ew9WLrBvitUscEV2yY5v+soO3+cquBiDGMw2s5d5XC5WhhXDbn3m3MMV@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0xOR9QFEPufNd4aiX+N79gwPcMTooiH2Z1RKcZO8x3uuhOGoj
	wH8v3lvLhV54PJ+cHaqtC10dYbtS11OreTfV+asAJJQ7oopETxEUkeUmTibo/Ww/edRnTNbM6wX
	C4JykiYIkHUCSxUrHuAk48vx6s2QjBGgbCGvM8fiyAw==
X-Gm-Gg: ASbGncuaCJc//wFHINg44KBneoFzQfPLhHfphEA0Eu0Ioml9NJ6G7VC3oenSk44AKAw
	DwM2j1ZmfIhrURRYEwHkldIrCyYYuZsurXltOeOE0vY/dD6RKg/RlE/mm4vuaM9wQ+xH/Pp7NRe
	eq7GdAWOrXajOA1j77+rLNkRQrB9gUB+Wg+lAo7s2zLLS7TFaTe5zPdvqSbbuwddxaiz4xvJoR8
	q7G1wzFymudxDz72Fc4rq+U/z4VwelStiOt+dQ=
X-Google-Smtp-Source: AGHT+IG9kbY2aWTL+bQ4CXwiiutR8P33iBoPBAGU9ej78mB+Iz64u9wBkzKBXujWDJSkJohiCiXP1iFkD6uUx+YHjIw=
X-Received: by 2002:a05:6512:4608:b0:55f:67d5:938e with SMTP id
 2adb3069b0e04-55f7094f818mr4090090e87.39.1756915951790; Wed, 03 Sep 2025
 09:12:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
 <20250825-gpio-mmio-gpio-conv-v1-5-356b4b1d5110@linaro.org> <aLhhpiVpGscOFydS@black.igk.intel.com>
In-Reply-To: <aLhhpiVpGscOFydS@black.igk.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Sep 2025 18:12:20 +0200
X-Gm-Features: Ac12FXyZAxIt_WffCZOnIM4e2vN_EwG-wp8GqcwHD84BnpN3MJueeTCK3eA5rqA
Message-ID: <CAMRc=Mfk9yBSkMQj_egtfNQ8=A+mvyqqy+_KM690GCV-Sts0Lg@mail.gmail.com>
Subject: Re: [PATCH RESEND 05/14] gpio: ts4800: use generic device properties
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Yang Shen <shenyang39@huawei.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 5:41=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Aug 25, 2025 at 11:48:46AM +0200, Bartosz Golaszewski wrote:
> >
> > Avoid pulling in linux/of.h by using the generic device properties.
>
> ...
>
> > -     retval =3D of_property_read_u32(node, "ngpios", &ngpios);
> > +     retval =3D device_property_read_u32(dev, "ngpios", &ngpios);
> >       if (retval =3D=3D -EINVAL)
> >               ngpios =3D DEFAULT_PIN_NUMBER;
> >       else if (retval)
>
> Don't we have a method in GPIOLIB that does this (can be called explicitl=
y by the drivers)?
>

Sure but we don't have the same behavior in GPIO core, we don't know
what DEFAULT_PIN_NUMBER is. I can't test this functionally so don't
want to change semantics.

Bart

