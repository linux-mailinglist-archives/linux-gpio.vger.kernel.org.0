Return-Path: <linux-gpio+bounces-3405-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 403B5857D87
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Feb 2024 14:20:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 292931C218F1
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Feb 2024 13:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79D1129A88;
	Fri, 16 Feb 2024 13:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zHkbhh+P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCFA77F25
	for <linux-gpio@vger.kernel.org>; Fri, 16 Feb 2024 13:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708089605; cv=none; b=oyHTFcjAH0bmXXqYyvW5jxCDhFQoivXYGue8+GZY2hcBznPhkx/C3XDlcMqsqbZCKj+DaTSLTdDH3gdYtb58DbiRBoQ+SYKeNKYL7pTC9IghLtr53Wpr/gbSeIBq28jLXP/WxvXryOLpFaEJh09J4wVyY0k6/zzgPAogGhsB9jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708089605; c=relaxed/simple;
	bh=oIiDRMEbbLxh2NMVvXuVZOzfsezcwPFoldYPdeq/AbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vn415DE+fOjKh5lkRa28l8csVyNrg85eNXKOiyCFUXiS6yFAjtZEGLHYAzX1rwmpSRC++kH4ILyPo0a3JIBO84Wl0XXJQV/AeUion4qGdK60GezOlnkuIPjctZyrTxkHmu3agvLqwj7WkdLNJLLoA7auVegZXerqyJyuOJGRSvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zHkbhh+P; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-46d2635b15eso1889109137.1
        for <linux-gpio@vger.kernel.org>; Fri, 16 Feb 2024 05:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708089602; x=1708694402; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfGxcPxgpqvVu7pn9g9q/ypersVX9C8Adoc2SdohQL4=;
        b=zHkbhh+PxlpcfEpGA2fhij607y2yi6ZYT2CCdrFMRkNfJm47GoJ2nbfAyiLxjPRgBJ
         snNNnKi+OZHSD2ASWPy7dEGeOuDNeH4vkxko8kFxW+MRy9K9S56amYxaP9n/yi3sED4O
         A6/uRrsRsXaUfzZMJcCbALsjKCtGVwF1OEwGO4/3tGvPXLg2s2rV0jqpBJZMIZeUwrBW
         PCc3GD6TmeaHGwvGOLVBtOpv0QEx6bD2dNkpLwPulRjh+wA6y0UuS5OEnaCuSXtmjCoi
         53Klbi/xaUfcq7DOR6dLmGD0D61CZbgkUaEbpf3d77iA1vAe/vT4kUwqhUaxfPZiuDRA
         uu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708089602; x=1708694402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfGxcPxgpqvVu7pn9g9q/ypersVX9C8Adoc2SdohQL4=;
        b=mcciUWy+6YyTNF3FxPPkl2qkNbj5HX4F7f1gNVMuV0VRmnGPeZpl1Z7V1WEaWB0X56
         o+HojUioHPMpfn9UmeEE3HHB1c/0DM+j6ppsFrKe2ToJlgsOj4kMC3iskxpy6YnEULmF
         5b5ejgNsXsb7l48hKMFydoTXV/g03pohjrCoqbfcIAzrkUF8iTuaQb6XFSLqHliUWBGQ
         V+Ug1IpfDzW/YJBnEsGE8BxA9KNT9wjgGN+f+dIOuON21Vf+jrgbwo75SNTpNBZ/OdG7
         cMPvo2vZHkk1c5magUnIUnx+bW9gLTO0MVltD0tqOltqYXvUf3uoHO3j0MHoltADmFrR
         yo2g==
X-Forwarded-Encrypted: i=1; AJvYcCVdNTlqy2QY2HOhr42RienPYhh6pq/NJE9KsGh+eAEOQydtJA5+kCrHFEdwQ4nuZ9jf/y759ObQWeo3opaaamgnvyRP44lLDR+BFw==
X-Gm-Message-State: AOJu0YxCouMnp2EZsqFMf9ysTY5tghGpmpBahl3TpZKxOmy511eo1qYJ
	b2ops8qo9x6GKIAD1BAkFed4giNiZgHLOJmx/w4lQKWU0ZwNOo2TaUZSad5pSpThB+Z8c/M9AMm
	Q3Jnjebr1gtMbfOp1bAt9STzjNcZKNZXhTNu6Gw==
X-Google-Smtp-Source: AGHT+IGK2SB9sektHQUi+tLu8JuF/SmQ8r9soL0NJ+fvMufwT1z+n3PbFC/Fn3sCcuqvpQxVdiQ36d1juc/A8lTJTH4=
X-Received: by 2002:a05:6102:236d:b0:46e:ba66:f40e with SMTP id
 o13-20020a056102236d00b0046eba66f40emr3677342vsa.10.1708089602382; Fri, 16
 Feb 2024 05:20:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216125959.3766309-1-arnd@kernel.org>
In-Reply-To: <20240216125959.3766309-1-arnd@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 16 Feb 2024 14:19:51 +0100
Message-ID: <CAMRc=MdBbzff5BppY4Hjwfi=SnmYopnFxg1AX4QsGt3Y+-g60Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: cdev: avoid uninitialized variable dereference
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Kent Gibson <warthog618@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 16, 2024 at 2:00=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The 'gc' variable is never set before it gets printed:
>
> drivers/gpio/gpiolib-cdev.c:2802:11: error: variable 'gc' is uninitialize=
d when used here [-Werror,-Wuninitialized]
>  2802 |         chip_dbg(gc, "added GPIO chardev (%d:%d)\n", MAJOR(devt),=
 gdev->id);
>       |                  ^~
> drivers/gpio/gpiolib.h:277:11: note: expanded from macro 'chip_dbg'
>   277 |         dev_dbg(&gc->gpiodev->dev, "(%s): " fmt, gc->label, ##__V=
A_ARGS__)
>       |                  ^~
>
> Use dev_dbg() directly.
>
> Fixes: 8574b5b47610 ("gpio: cdev: use correct pointer accessors with SRCU=
")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Hi Arnd,

I seem to have beat you to it[1] and my patch doesn't change the log
message so I'll apply it instead of this one.

Thanks,
Bartosz

[1] https://lore.kernel.org/linux-gpio/1542ef65-508b-45be-ad5c-63ad124cb1a2=
@samsung.com/T/#t

