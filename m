Return-Path: <linux-gpio+bounces-1307-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FAC80EA7E
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 12:38:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C5301F21B2A
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 11:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C074E5D4BB;
	Tue, 12 Dec 2023 11:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Rg1Q/VhL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3616D9
	for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 03:38:14 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3b9db318839so3972618b6e.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 03:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702381094; x=1702985894; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5/D0YU7gGtrSpSeIc3IrchK91RMOWCF3UZFtqPOQBE=;
        b=Rg1Q/VhL7A8itOoXzVDobrKhntCV5SE32weqTmuB1DNaylB/Y8H/+pReGNQZxsSBVx
         ykSkk2BemRmz9suS8WCUBLuyfmopqqcbWv7CK6u+TGOTijsXqLnfkXh7jePbZstfmk1y
         FpRFyFY5mNf6PUbv9A776y7ailUmEXfzvTf7AsStVXhiqeESkV2PDoDi8Ur0q2kkh/z4
         YQjuLb8fJ/MbAEjbTZzVi/uFk8jsyzLkYUG7fTpGPx76FWZA9Dc5fr6wg8v2hPZeJFoc
         5NPYVhypDzYX8tHDZVKj72kd+hLz4DKGUg/N7nFTE/Imd7ltn5+pzfUFrFBw3omPihny
         gaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702381094; x=1702985894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5/D0YU7gGtrSpSeIc3IrchK91RMOWCF3UZFtqPOQBE=;
        b=hGO//36VDZmaQPL6MdI8q1BxfTHWagu4UNQQ21+eyUIrAAQM1fnW1giT3FffSC4Kjg
         j8bYVvXIH5xuwywGg+Jz24MyzefGinPlmhrvKPVjE/sc0AcTU1YHCwyPSymRm4DXKaIz
         oL+Jw2dF4LLawxwme3qqo3BCNpKUi8Yrg5MVvWZwpU5f1uX66+tGG0smjTykX6glwHfH
         7fEMNHrxtTd/62WgkG92GmRiSa89jyGF34Hv1ezqpW4CAfDsU1jnGi8QT4UCEfmiVX31
         SFZB7cW7IHJFEY1Fgk2gm0bh5ygoBSLPk/XJdIsHzKZ7tKprWZ0CCpNZqI7V7RQ/81XJ
         bdkg==
X-Gm-Message-State: AOJu0YzPJfY5xVXQURRrM+azNFs1pfDkk8dN+Y1HkohZ26Exe4eW37ma
	RTXlfc6R678wdPanDloS8TG7ejZaioUEOEnv2jDAMw==
X-Google-Smtp-Source: AGHT+IGq7ocaMpouyXL57LHNUqb46sNCxyTIr2aRqe9mTE7Ey+aPLkMJA/TKgJk/XxLfvwJevumOfphCaPl0gNb+xtA=
X-Received: by 2002:a05:6808:3a13:b0:3b9:e779:8a0e with SMTP id
 gr19-20020a0568083a1300b003b9e7798a0emr7286825oib.1.1702381094358; Tue, 12
 Dec 2023 03:38:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <62588146-eed6-42f7-ba26-160226b109fe@moroto.mountain>
In-Reply-To: <62588146-eed6-42f7-ba26-160226b109fe@moroto.mountain>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Dec 2023 12:38:03 +0100
Message-ID: <CAMRc=MfbFzF76Xs293p3RqQE3cb3Mx9H3VeAQHExYynvttXCvg@mail.gmail.com>
Subject: Re: [bug report] gpiolib: remove gpiochip_is_requested()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: bartosz.golaszewski@linaro.org, Andy Shevchenko <andy@kernel.org>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 10:20=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> Hello Bartosz Golaszewski,
>
> The patch f8d05e276b45: "gpiolib: remove gpiochip_is_requested()"
> from Dec 4, 2023 (linux-next), leads to the following Smatch static
> checker warning:
>
>         drivers/gpio/gpiolib.c:2402 gpiochip_dup_line_label()
>         warn: sleeping in atomic context
>
> drivers/gpio/gpiolib.c
>     2392
>     2393         desc =3D gpiochip_get_desc(gc, offset);
>     2394         if (IS_ERR(desc))
>     2395                 return NULL;
>     2396
>     2397         guard(spinlock_irqsave)(&gpio_lock);
>                        ^^^^^^^^^^^^^^^^
> This takes the lock until the end of scope (the end of the function in
> this case).
>
>
>     2398
>     2399         if (!test_bit(FLAG_REQUESTED, &desc->flags))
>     2400                 return NULL;
>     2401
> --> 2402         label =3D kstrdup(desc->label, GFP_KERNEL);
>                                               ^^^^^^^^^^
> Can't do GFP_KERNEL allocations while holding a spinlock.  Testing with
> CONFIG_DEBUG_ATOMIC_SLEEP will warn about this.
>
>     2403         if (!label)
>     2404                 return ERR_PTR(-ENOMEM);
>     2405
>     2406         return label;
>     2407 }
>
> regards,
> dan carpenter
>

Thanks Dan,

I sent out a fix[1].

Bart

[1] https://lore.kernel.org/linux-gpio/20231212105501.16347-1-brgl@bgdev.pl=
/T/#u

