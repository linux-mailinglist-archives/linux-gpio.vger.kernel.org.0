Return-Path: <linux-gpio+bounces-1772-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7D781B6D6
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 14:02:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29101282D4A
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 13:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B33C76DA8;
	Thu, 21 Dec 2023 12:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cSoyIyKs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6473C73195
	for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 12:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-466a085c203so125777137.2
        for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 04:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1703163546; x=1703768346; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+rIonLAPWX8k6/DJ2PlKj7AAvhFNZVDSfcroSDgk3M=;
        b=cSoyIyKsMiVeFqvHZ/S/UHZlOv/ZXXqpg9eOiO9hcABGEzs5I81gkQKThFR3kgRYVo
         Egwz9EP7VTx5tvCpwNenajm+AE2rOVW4hhvAeVnxJtS/Z91tKolgkpyRUn8tMOtRXKK+
         mZi+sYT2taxrYYgYHv8ZfEAB7QGXvrgJmVgb/mcaM6eJ6iaw0olC5BEsMH5orT7CE8up
         LO6fjCqRl+fbrrsmNUM7L6LodenJszu1QwRnbv9gwcd4CwQs4noraShSx0hgc3TYPQcu
         QudKk/EmDPqm368YCJhQh+qE5Q5Q2veMvNM0Nya3EiapAZlnz/dJFTdcwb5KIuAD3KF9
         4y6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703163546; x=1703768346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+rIonLAPWX8k6/DJ2PlKj7AAvhFNZVDSfcroSDgk3M=;
        b=bJnQ9r1dXfAPEekB672NDg9XYZcp5vyxEC7KxatQf8C+KnSDDEqtpGEPd0EEKW/cJC
         YATQ185o+k1FhWBypOuTCVaKSWo/vIK3ljB7+RatDBAuLyw7WMf1tOn90eUg/WLUQb/9
         70o2PXHzS/oaqWxrnf0TrAdo5DXIBGPHQOJdZITLOW1qhYU1YLzdhHidFVOOpxb8ySUv
         NgebIp6UgTRKAwP20KC3rudE1YDIJclWJKki3PDGWv2DuGo69FrvgafdJv+0q2hSWbCQ
         UV3nPK+Nu8p5xblY4lCFBA664QnION6E9F1g4SzYRFvvH2sbrYEc2OMhgSx4XQhjQEwm
         6ANQ==
X-Gm-Message-State: AOJu0YzZnTKNOHGKaYaZ6weRPbYqASqCPNgghy7VYW2CVrI/S2iVnIUw
	NuesPfB/r+bFq6rr/OjuYtzuEpp0mksXtFqQeR8e1g==
X-Google-Smtp-Source: AGHT+IFUqqzHjmQvwYRqEIFAvklKHzwEfjzRE7ccVbVyT7d6Pc4DAZTRQVc1K7cWr/KAv8sTOXibR2GtGrR38VWuh88=
X-Received: by 2002:a05:6102:3d8d:b0:466:afed:f2d6 with SMTP id
 h13-20020a0561023d8d00b00466afedf2d6mr987307vsv.30.1703163546268; Thu, 21 Dec
 2023 04:59:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231221091547.57352-1-brgl@bgdev.pl> <20231221091547.57352-2-brgl@bgdev.pl>
 <ZYQ1a_nQZ1GWg3gg@smile.fi.intel.com>
In-Reply-To: <ZYQ1a_nQZ1GWg3gg@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 21 Dec 2023 13:58:55 +0100
Message-ID: <CAMRc=MexKOET=WJOARSF=SPkvDYL2cw-svQZ1EiZ5MV7QC98VA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpio: sysfs: drop tabs from local variable declarations
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2023 at 1:54=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Dec 21, 2023 at 10:15:47AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Older code has an annoying habit of putting tabs between the type and t=
he
> > name of the variable. This doesn't really add to readability and newer
> > code doesn't do it so make the entire file consistent.
>
> ...
>
> > +     long gpio;
> > +     struct gpio_desc *desc;
> > +     int status;
>
> Not fully reversed xmas tree order...
>

God dammit! :)

I'll fix this one when applying.

Bart

> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

