Return-Path: <linux-gpio+bounces-13758-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 504269ECF72
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 16:13:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32D622845E2
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 15:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B2E1A0BCF;
	Wed, 11 Dec 2024 15:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HmJYUxy4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB5124634C
	for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2024 15:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733929986; cv=none; b=Ed7jhnBFKOHe7HN2iABs9oIBX9MO2DsJ5qy/qUMCjuAcs/npEY2abqW9m2hrRXnqZtygV/3NgMVV5Y9PUGQnwj9ghK2X2hu7ejqr9lMhfyOjt6YFVNLiPCt3vpYNRNBuxnGLH9SYJhd5QznkOH7pDzHRcxloTId1KviUK5IyWME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733929986; c=relaxed/simple;
	bh=Ida9K9R8M/eaxDjCcpy5xMIip2V7SZvxCRqxCUBEADY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rGeNROUi0mJgmRbxaBDCsfviOzSUyUfMwr5nFzCwyLZYbNzg1n4uaLAVAy4iDtfJbRkMsJXHD9vUT4MT0uML8UHxOXoHTALHJxIgtSGRb485zBC5pBJoqUue1aZ6uSN241cEmyYkoRNn4yyOYPmeVavCptgrmTKJ9aFclmLwHRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HmJYUxy4; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5401c68b89eso934473e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2024 07:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733929982; x=1734534782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lpf6MN4Rww7TiJcGNQaPz3mB5lzUzQDMBTu0stTBwrQ=;
        b=HmJYUxy4QnggwmEGXGCthODcfkjL8vRUE1he+oY3948aS9jlWP6NTFUDxoFvZPLBJW
         BvaQE096TzJa2UQuujdOq0d6tCIi06Gj2obyfwoiwBNMR3UrkAnJfrI7DPTUQikbgM/W
         HORe8YUrDtnzBILhK/cx0GOr6+47azUtWDeztYb0N/cIZsiXV6/pQGsY+vqCgg8UNQTf
         FV/DX76/f4hjdDL5hyNCG15gj2DIy5jxEvyZayJLYwQg05eoNuxOE3A6MhXV0RKuyBfO
         5FXWaLARsFIUWqNRQubYyrPI0tfQ5uUCDFj/Hq5D1fKgZRBgUXxFvWi4stS4yL8yPD3a
         N2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733929982; x=1734534782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lpf6MN4Rww7TiJcGNQaPz3mB5lzUzQDMBTu0stTBwrQ=;
        b=gInQaX1fzfnMAqOqUCc7dtnGZm+SG9SqzbahYb1UilkbRbjgCW5lOGA5pTRbsm5Dxx
         4Ktod99BLQNoL3zRXVnXxsNtmLgw/SrCYGT3cG1gcMxt4cTfLqAoULK3r753FlWOOImC
         ejaCtUdm+vlrrOIgbJqS16oJ1uH46r0AhhqhwDZx7ZnDZhbFPVlmBRzMCncevtBHFN7V
         OwLFXvTdCi63o3cb/2kl+sjKO1uzmWVpAfzDHJYnMxy6h+F8K7oWopF2MJUgAunfu/Js
         /ASu/n4fC6mQfVXkHY6TjE1CRg/ZhT/NTc3K2YiS4ZzK+0pdf4tZlK8d0vAevZdC8ryX
         eGRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZNzL1idYcXAvwvso112EkJpYiQrOaF1A3s+P/kNCjHjHoHk793J+X71N2yWiA0O4D0eQ6CGQGHMcp@vger.kernel.org
X-Gm-Message-State: AOJu0YwGNNgUcaA71x7Ov9eHuS2yK+A4dqP+L+lyWaDo++Qx9s18O/z1
	7VpDMiDF+kRnJOZhAPv5xiD6/d620yu2XMF4mGuLN21YDh3KinqH4MCZykPz7OhLFJEhZ6bhWW3
	D4nMKEfH/O35ceIBK8nEVoeC2qaDQ3ps5rTldfw==
X-Gm-Gg: ASbGnctuy/aWyj/q1jaJlfbJbgmLXDJWTzkqDCGWSiG3JgBaY5iab1Hw8XA+ZxA9gVR
	prRSuYfMpQprYGeK2pjBM4vV9C+ZhxzqWK2/Y3d2BXKj2EcHSVsMI0N7jW6baUTC5Y7k=
X-Google-Smtp-Source: AGHT+IH+Jy4Uk21qsc5YzWudoL6hjyjthNl7P9QvDhnQSipuCMSu21KcIdlDiOTA3wmwamf4aliqsuP+gFUib7QtVts=
X-Received: by 2002:a05:6512:68b:b0:540:1bd0:347a with SMTP id
 2adb3069b0e04-5402a783b95mr1075836e87.26.1733929982528; Wed, 11 Dec 2024
 07:13:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1733739697.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <cover.1733739697.git.matthias.schiffer@ew.tq-group.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 11 Dec 2024 16:12:51 +0100
Message-ID: <CAMRc=Mcw-r3b_a0XmpfVbF04MuZYnmM05AZqGav8GA_PM0-ozA@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio-tqmx86: cleanup + changing directions
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux@ew.tq-group.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 11:36=E2=80=AFAM Matthias Schiffer
<matthias.schiffer@ew.tq-group.com> wrote:
>
> This is the first of two series adding new features to the gpio-tqmx86
> driver. The first 3 patches are cleanup/preparation and the last patch
> adds support for changing the directions of GPIOs.
>
> Once this is merged, the final series will add support for new TQMx86
> variants (SMARC and COM-HPC) that feature up to 14 GPIOs and full IRQ
> support on all lines.
>

It's not like this series is very big, what stops you from posting the
entire thing right away? It would probably add more context to this
series.

Bart

>
> Matthias Schiffer (4):
>   gpio: tqmx86: add macros for interrupt configuration
>   gpio: tqmx86: consistently refer to IRQs by hwirq numbers
>   gpio: tqmx86: introduce tqmx86_gpio_clrsetbits() helper
>   gpio: tqmx86: add support for changing GPIO directions
>
>  drivers/gpio/gpio-tqmx86.c | 135 +++++++++++++++++++++++--------------
>  1 file changed, 84 insertions(+), 51 deletions(-)
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> https://www.tq-group.com/
>

