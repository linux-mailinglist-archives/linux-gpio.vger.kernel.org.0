Return-Path: <linux-gpio+bounces-3262-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C9385446C
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 09:56:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 585DC1F2A7FB
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 08:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2F379DF;
	Wed, 14 Feb 2024 08:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XmCJqO9x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCE6BE49
	for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 08:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707900930; cv=none; b=L1KPN/nnBukrMe2ZeeztAV3egASOnxMtc+RRPzbis6kyiymAvTmSGcA0fOaWG7bOQSjQO1ffRtSnJ/ZSHYrtGUNoPllkidhYXfO/AcJYi8Iq2DSAAtlgVLMdbP3ZZNQn6U3KYDWL6haRSCVe+yM4VsFTMqv5k5XCwZ2D6baqSGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707900930; c=relaxed/simple;
	bh=W17sVjVx21LPJL/xwzFo2gVtqIVXgApzWPtP5jTx/5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SoarXKmRlWdbx5Q/8X5hFpOFSKLPAaiPOhDtNi5CXu3DixaH7FxCVjwtGGyui7ir9YdXehJcpcytJB6MpMXOfual+l/IfA8o0PXQ9ZxwomVPf1Gai9O90f9R2mJIZIGymvnjS/xUOEfmhVSAASUn90wS56D30/vakTJh6d0e+T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XmCJqO9x; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-4c09221ea4dso308118e0c.0
        for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 00:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707900928; x=1708505728; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eiBL7F+sie3P3HYR/ba7D5sv8pxp3Y7zeI2VOZhvazE=;
        b=XmCJqO9xszgovn5+nmJ1Z/hPQRPITGAlHKe4E6l8SG11io7Mf5NA8HhwpgjB783lkb
         T1F5928ZJxxa5YtgQCr93/F4hb8cUJ0QPzXZnx5uJT+gGzKmqrCXGmKffeSdtF8J+8ef
         OnahtMe6nohYfS4GAf5oR2LXeMOVCjL0C/2zBCQiC+4RzA7TeTAof/j4UnmIXtOzo5TD
         cqYeRvGAXIiuO+ysrC5GfyiTaC/+JZEBZinwOpx0kO8L9s8qXyJoCq/G0129YuJ8Be5u
         ufFR94TXNZ+N379hOFe65ZNhOh2hXiCx0j63o9VGdS7uBQQZQq0UyGcFzB39UyAsWsap
         h25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707900928; x=1708505728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eiBL7F+sie3P3HYR/ba7D5sv8pxp3Y7zeI2VOZhvazE=;
        b=hccYzPrbPuXIs3I0q0tLdR15LLqp9Ikubcy/4kHZt0MsQVlri49vTZdvfs7ADgZq4V
         roO/isiOO+OeEN7Now7IU1iCCzkkQtoGYMKSMZ0iO4MKgefKBNOWp2t2RnjTCqqxcHAz
         oCaZVVX7SIpS2tSIshnqpJL2xhAvndA4dYyxZdC9V3pBz70SAqxRbIFVIPlSKe4Kfeof
         ZAWe1VLIHZ/yi6LIn8bmqNWqcdCp0MELbRMhFMzIlKE8TRNvVOqFIdeLn9IDTFZ/aRvy
         PZZvP8dw3VDEGmf5Jmw5OiSPVn2I9me4Cw0HL9QpDQ3X9sbXEUUvX0Vot2pbYIzkHMu8
         BtQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7Yi8d5W7w2sYf0ki9fP9DHu3qUWsxMK51fnod8Bt0f/XAvQzgN7XZUgA9M/NF8lGectIIIE4b0CfqK+++WiRlJO18w7LIi3IlDA==
X-Gm-Message-State: AOJu0Yxp1LXcrL/8Hfr2COlDytm5+QhxKEtyCbAGAZhzWohhjiyEUmGK
	AHRkCcCuuhQSsCvnYTRYFmeprCWvnq4nn2Dr4cbqtwCsurrqcLfyWdARXsZScFzLgjmSgByqJa1
	N3joZAqm2pfgd1LwW+F0O49aZfZIsaahSuSJMuA==
X-Google-Smtp-Source: AGHT+IH/PyIlUvEKGrFfRfnlKo1waGceqe23DVgq4iz8mJWr8F3/YoMEhwi7R1zsM+8W8wuzuXKa1GH6eWR7wTmHElQ=
X-Received: by 2002:a1f:dd02:0:b0:4bd:7a0f:960 with SMTP id
 u2-20020a1fdd02000000b004bd7a0f0960mr800117vkg.5.1707900927838; Wed, 14 Feb
 2024 00:55:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <deee1438-efc1-47c4-8d80-0ab2cf01d60a@moroto.mountain>
In-Reply-To: <deee1438-efc1-47c4-8d80-0ab2cf01d60a@moroto.mountain>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 14 Feb 2024 09:55:17 +0100
Message-ID: <CAMRc=Mf+ffh0AvYRgNzAhvE63ZxNXmuxkMrdu+e_NAZE_9drvg@mail.gmail.com>
Subject: Re: [bug report] gpio: remove gpio_lock
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: bartosz.golaszewski@linaro.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 8:31=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Hello Bartosz Golaszewski,
>
> The patch 35b545332b80: "gpio: remove gpio_lock" from Jan 12, 2024
> (linux-next), leads to the following Smatch static checker warning:
>
>         drivers/gpio/gpiolib.c:120 desc_set_label()
>         warn: sleeping in atomic context
>
> drivers/gpio/gpiolib.c
>     115 static int desc_set_label(struct gpio_desc *desc, const char *lab=
el)
>     116 {
>     117         const char *new =3D NULL, *old;
>     118
>     119         if (label) {
> --> 120                 new =3D kstrdup_const(label, GFP_KERNEL);
>                                                    ^^^^^^^^^^
> This used to be GFP_ATOMIC
>

This not being GFP_ATOMIC is the least of the problems, we could
simply change it back...

>     121                 if (!new)
>     122                         return -ENOMEM;
>     123         }
>     124
>     125         old =3D rcu_replace_pointer(desc->label, new, 1);
>     126         synchronize_srcu(&desc->srcu);

... but this synchronize_srcu() call will trigger the same issue.

>     127         kfree_const(old);
>     128
>     129         return 0;
>     130 }
>
> The call tree that triggers the warning is:
>
> asc_set_termios() <- disables preempt
> -> gpiod_set_consumer_name()
>    -> desc_set_label()
>
> asc_set_termios() is holding uart_port_lock_irqsave(port, &flags);
>

So it should not be calling gpiod_set_consumer_name() but well, technical d=
ept.

I'll see if this can be changed.

Bart

> regards,
> dan carpenter
>

