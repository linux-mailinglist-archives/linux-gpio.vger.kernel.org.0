Return-Path: <linux-gpio+bounces-12477-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5619B9AD7
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 23:31:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F320E282724
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 22:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E831CB513;
	Fri,  1 Nov 2024 22:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yGRcXSYJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C314C156C72
	for <linux-gpio@vger.kernel.org>; Fri,  1 Nov 2024 22:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730500263; cv=none; b=uGyFxVL2/3PjXGmJYRIAPcrjX9T664zviMsvQQHEOaXSWEzOI56nzztx7qF1JLL31yOeyJ9CoM91CF+D5TOU2VTYt3rpjIvdgaNwQBkSav4xerukVTdkhvUr5aFZWcZtFCnS7/noDGKqj02Z68Jo6LhQhCU4gqgJ+91qTvMH4GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730500263; c=relaxed/simple;
	bh=aej0LhWBZI3/aVtW8S01eaT1zhKPhIn9w1TNsWR1BqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z4UtdaCxO7DwS80hhvl1fqsB7IigA+NQajWwLTjQnukxyuI2CFD+9sRUlpl4RYwDESHMcln2zDwcjAUHbXSdgUuIJCV/160zSH9Dx1glhUdtblI29KCahwHxVJfKYqFmz3TCh6h9XCqmCPa5B6M4oBkrcn4zFGOyjXjiinOX2dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yGRcXSYJ; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so26193501fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 01 Nov 2024 15:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730500260; x=1731105060; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RobcnHQJq8mxRHaqUB0b7sXJSm/A+uQAMiA0w+Qz0W0=;
        b=yGRcXSYJSO72K1WiEeJVfCmfxQTQrSRZftESUC7a8FQ5WSV/c1vF0P54ZsINzlIG/6
         x5t9kh6D9OPDIuDmArV8zYg3rAazydzCOeEpg2k5DtNYyqQIp3j/ia4CQXYlIy4jq2Nc
         yLSQR56SdMKevTaxw8f+G0g4WvA4CcupBgnLKy/X6HRcfkE0A4Vi3Rei7/YpNnFMAja4
         ibl7y1WPoZ14cdRlq0XMHttaylgSo1LNI2Ugc6k1Mn6dJHm26iX4A8hkN1n2uE983R4h
         IG++nVi4XmW41PdkC1mZo0vxvaavoaODpSlbrUuqCCMMbLTmdID3qnt+qJsYayj5S3IP
         FdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730500260; x=1731105060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RobcnHQJq8mxRHaqUB0b7sXJSm/A+uQAMiA0w+Qz0W0=;
        b=a3ZI/sfaxEFQQaxfgUkG+UQ6Q3eBcA4nMkHcIbEy5KA+eC9Z8TYma4SLNNxSUPAmrS
         hjMF68okqxKHJoJY7weEXZMNhUfRmaNrjwIZdZu+KK7UALZeW/xOIz7UJ+f0OIKNmFW0
         HLShFg2BtP7tq9aJpkmbNQjVHMNsfah4g9bRUJo3wjW/Pb7Qfy+Ic5KZwvLojZSU7xQQ
         u6Gayd2ePHgBQk33QwnnKYcxY5jigVozXga8ZQHw52JsKBlL1gr5FaiZtJYsF7f3Mr93
         7NDByua5Zt60kAzKHqxhDGwwRyqtVuGk4glIYHTF02fdPKmhF+CdIf6lzgF6qT7r56u/
         azQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEUCpOS1YXrfhMdzf+KuAWF3fBm5Te4Rn0j7ui40ZeYfuyFmNSqwL8O3qsOVEJcR7sIOk8LKzBGzUU@vger.kernel.org
X-Gm-Message-State: AOJu0YwVMNCr2ItoheZflcydE/gq6oUGv38GbxeOtmy6FUDu+B4fiT1R
	SZT2bKcxg8qKfZKE4tga8WxW5GD85je5vqYwKT/C6VNs9JuKB+3EKE5jD/zYynzXvh5SJXPVUeg
	bIXwptKpPXf0i2kg30lq9oOXa8/CAHkfBwCqHP6AHhpFnsO9B
X-Google-Smtp-Source: AGHT+IHisqDCHpTGKsL2pkgamlF8JB+UtNjMiyPFyyQxl/JugM/Uhj3kleNDCNXyldbdqr+o9aDT332It5snW+z5ftE=
X-Received: by 2002:a05:651c:1585:b0:2f3:eeab:7f17 with SMTP id
 38308e7fff4ca-2fedb7ec2d0mr25903271fa.41.1730500259883; Fri, 01 Nov 2024
 15:30:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZySrvXpFANlXrnh2@black.fi.intel.com> <CACRpkdaDBsRGntbq4wyEFxA+-ffpQN=MbAhUsoWbp2MO8SK2MA@mail.gmail.com>
 <20241101120911.GX275077@black.fi.intel.com>
In-Reply-To: <20241101120911.GX275077@black.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Nov 2024 23:30:48 +0100
Message-ID: <CACRpkdbdGLQu27i6YcR0ejbgw53YEFN-oFQZD=dYeqB3wvY=HA@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.13-1
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linux pin control <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 1:09=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Fri, Nov 01, 2024 at 12:43:07PM +0100, Linus Walleij wrote:
> > Hi Andy,
> >
> > On Fri, Nov 1, 2024 at 11:21=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > One of the tiniest PR for Intel pin control drivers, only two changes=
 there
> > > which were in the Linux Next for some time without reported issues. P=
lease,
> > > pull for v6.13-rc1 (next cycle).
> > (...)
> > > The following changes since commit 42f7652d3eb527d03665b09edac47f85fb=
600924:
> > >
> > >   Linux 6.12-rc4 (2024-10-20 15:19:38 -0700)
> >
> > Does this require stuff from rc4 or can you send it based on rc1?
> >
> > I know we added some ACPI ID or so for rc4 but ... that's only
> > required at runtime right? Are there hard compile-time or
> > textual dependencies?
>
> It does not strictly depend on -rc4 but is that a problem pulling from
> something that is based on > -rc1? I mean this is what we do all the
> time in TB/USB side of things and typically apply first patches to
> "next" branch on top of what was the -rcX at the moment.

I usually do not pull in later release candidates unless it is necessary,
if it is necessary then I do it, such as if there will be merge conflicts u=
nless
I pull it in.

Yours,
Linus Walleij

