Return-Path: <linux-gpio+bounces-6353-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4698C4D45
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 09:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 890762829FE
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 07:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 766D914A8F;
	Tue, 14 May 2024 07:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="li7WcBBI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7D513ACC
	for <linux-gpio@vger.kernel.org>; Tue, 14 May 2024 07:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715672976; cv=none; b=l/3rNJVlJEhDJW8J9BUkkhsljXtvfbRjUsQZC3XbPDjolaRiCCkdrrPAA/spidjVCDtMqNfo8uPBkmz8eSSridn5VJ7HD7rU1S8HESwh3sxWr3CJGRNBiWwiY29R9AzP1Aj/mRaXuBwJk5uukAPlgbIGSGzT7/8zXzziLo5ggjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715672976; c=relaxed/simple;
	bh=cmgrJXHuW7Kk8/AQMe3xS8s7M55A8n+tPxsy68xlABY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FNeIIqpQyqwBT64RxZQuivGdyE5JgMIRicTuYO3m5fBpcF/qQrrHuFnm7662gfLtislvLykPSPEn3OD7+SRaN5oQPDzXWt1cxiinxvV/kn/ujDy+xkT0ZsYadL+X8WvAOsls3a8hS1xPJfDoNNA+d7dkotA7fhJUJ3mGKhw9on4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=li7WcBBI; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-de60a51fe21so5249244276.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 May 2024 00:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715672974; x=1716277774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmgrJXHuW7Kk8/AQMe3xS8s7M55A8n+tPxsy68xlABY=;
        b=li7WcBBIABV4uHYqKCLX9i6GN02ES4+706rgCDgf6kiPHGfEn6zHYojNnwDN1oz3px
         hOXWCivuCtyQtfuLzjtWTBh66wf6slzgy45deRHaU164tivol/ldfM/v8W+avpDobqvD
         mQkx598URvrZBJmggigG1wGAw5+IUBePWOQdFo/s4eqdSGr2MgTH+X4E5TGv9LWkjQT5
         36YJ7qvqoY8qsQOE+mgt+zcvD9rgRzrdvNXsMCSiOwIFdviodsaaFQ2UF6yUaT4a4PO6
         S2T4SYIXNL7E0c7W8XYqVM63sfnf5cy4EhnuqWLGniZ/Sxe+dl5y2xUM/9rcs7vREe29
         nUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715672974; x=1716277774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cmgrJXHuW7Kk8/AQMe3xS8s7M55A8n+tPxsy68xlABY=;
        b=bAfrUbOexaQDc8flPGMHf8GidFiH5R1jUqzE0XosSbqrPJJ4Wexi14YF87Fdwz3VhV
         IlyoseGbYT1kgJELqmjdLQu5I6ZdXnPeOO+dWdbEF+Im3NsygOz2iOmpGpmMU7UR9lPo
         Kn+nkUqJpsNd+pGhCr4Y8BG9/+pZG1qGy/aGYy7wnzR+yhE7sbJZHxGfU7JmD5ShZkT6
         H3gvNO8k7cqRs1ipfFgjJVoKI4oOZYxPZIMad557KOG3pIaVWW8f1BxKfx5OKkQEcIme
         nrgc0d7UqXYtOSrDeNe+apqrKVZCFtKQ1reg285+YQJ3/JqDFRFrRe+KP/0kQ7Hs0V8F
         J6dA==
X-Forwarded-Encrypted: i=1; AJvYcCVpMIWutGd2n2TYObwmqedl8I8OTngMeLXBKCGIEa8IKV7qeary6w9I+1qCFjykUldocXNXVyTHDdwn90Wm3HElfz/3bkD9Dy5AcQ==
X-Gm-Message-State: AOJu0YyKMhcOSJzLNRJVDoSMA6pw9fWRXVKILhdHPuho3dnTi9ML5OvR
	yHwr7zICVmnZEXJzo5tWgBvIZ+SphIYaZSii/kXPj1FUW9eqqN6xy4AR0TNVQHTVRnIKQBaAaOS
	EgNs7WYRNFH0E59id+ytYKutV6xwNw4vxvc7Sow==
X-Google-Smtp-Source: AGHT+IGVPD09Gx7FAbv/+yGMjy26yKNW+CPmRXQm/VskoFvtWEebSpHDyZRS+wyttpa+DnPVe896pD5o6YMv9Or7I+k=
X-Received: by 2002:a25:dc87:0:b0:dc6:d87c:fc73 with SMTP id
 3f1490d57ef6-dee4f35b7c8mr16794030276.35.1715672973568; Tue, 14 May 2024
 00:49:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231219125350.4031370-1-patrick.rudolph@9elements.com> <ZkL2Sdf0NcqaZRZ4@surfacebook.localdomain>
In-Reply-To: <ZkL2Sdf0NcqaZRZ4@surfacebook.localdomain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 May 2024 09:49:22 +0200
Message-ID: <CACRpkdbUye6RhbRNGn6sapARwVUyi5hKS-5VEVBr6ZR6W_KdQw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: cy8c95x0: Cache muxed registers
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>, naresh.solanki@9elements.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 7:27=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> Tue, Dec 19, 2023 at 01:53:49PM +0100, Patrick Rudolph kirjoitti:
> > Currently the port specific registers behind the PORTSEL mux aren't
> > cached in the regmap and thus the typical setup time for a single pin
> > on cy8c9560 is about 200msec on our system. The hotspot is the IRQ
> > (un)masking, which causes lots of R/W operations.
> >
> > Introduce a separate regmap for muxed registers and helper functions
> > to use the newly introduced regmap for muxed register access under
> > the i2c lock.
> >
> > With the new cache in place the typical pin setup time is reduced to
> > 20msec, making it about 10 times faster. As a side effect the system
> > boot time is also reduced by 50%.
>
> Interestingly that you have not Cc'ed me on your patches.
> This, btw, a good reinvetion of a wheel which regmap supports already.

Also sloppy reviewing from my side :(

Patrick can you look into making a patch on top of this
that switches the code to use the built-in caching in regmap
insted of rolling your own?

Yours,
Linus Walleij

