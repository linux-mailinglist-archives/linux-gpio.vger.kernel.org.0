Return-Path: <linux-gpio+bounces-2261-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5960082DE95
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 18:42:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C1831C21B3E
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 17:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A1B1803C;
	Mon, 15 Jan 2024 17:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OJ/k3m2b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA59717C98
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jan 2024 17:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-467d87c90b7so1733707137.2
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jan 2024 09:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705340524; x=1705945324; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRtXF11JeYHbUVtnviFK5u1mVUgafTiIGFJk86/XzQE=;
        b=OJ/k3m2bYgi0NI65Fig3217LXZJNfMEXYHzMFWO5DliOecqpMNbA/Uae1TLvSuoil9
         tQNhZgnf4LWvM3746aGVyOWqmWRBQM4WC5x99l/Nz8b5KrtVIVzPaNlUBHRy68Ddhih/
         7pKU5MN05IpQ//WIy0cyi+RVIvNaJzA9ZahfTHWEYAGT7v4E/RQpIDxckJS1OZByeezk
         vlpFoHOtyUKIElRfBzQk08cPlJGneSdX+ZBMZYc//VDi/YUg4f+qM2y+iFFDoMzqdBAV
         WBtFxJc2vWUgGaBX8vXYAbs+7SrYFedf1L6tu596qyP1r027v8otlV2ONC0wjHKwzKtk
         MOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705340524; x=1705945324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NRtXF11JeYHbUVtnviFK5u1mVUgafTiIGFJk86/XzQE=;
        b=JwLlBagDjruVhhaHDqoKP8EajdrN7HZxt5y90CgGax909IXJooHb67gg4FENcqbPgL
         /YeBIYVtOpFK6AlUBHJcZHSYHob2CaCINtlpG+5bKD+lzs+DFfghYmj3LRsdeH0myIiB
         4//7l7o6aG7Ajmx70v+V0XeRKAcvp2j1H4E+5xfZUwUhMU8Ec1cs9XBzmYR0akU8OLRG
         igb5dD5w7ihBevYVBI4WSfdU0x4QrVaNlklYiC+N0uSiWrZJ0+qQnY6AIqJshmBV7N5z
         Q4oKrXCOV7t/Ll1cQkQ1m9x+Izo4ikrWSeJjjxzroFIb+vykkH//TiIDAQv6320ZAd/g
         nG2g==
X-Gm-Message-State: AOJu0YxeXlVMZ4A12vOZDbOS6dBeVN2+ERuabgi5L0Al00mfHTxJhZUj
	/Q0vgRTdnanlOtg7vPnh1Us5XW/OezXQkoscIM+scrgAMFaPbg==
X-Google-Smtp-Source: AGHT+IFXQLN+WZw9uXBQ9B56hIIzPGHg1eZWnBTnWdSbm5555PYbfMBOwyfBBm8wkL+ZSOgvZnR2u7NnYjteOfdP+v0=
X-Received: by 2002:a05:6102:1892:b0:467:f500:e749 with SMTP id
 ji18-20020a056102189200b00467f500e749mr3194051vsb.32.1705340524561; Mon, 15
 Jan 2024 09:42:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f481d5bff884c16606cbe577e707e1c1c0e6ccb2.1705330861.git.lukas@wunner.de>
 <CAMRc=MczKMSY48y3xC-0rah0sOP_OP1Ln1qu_QCCen504q5Xog@mail.gmail.com> <20240115163554.GA4205@wunner.de>
In-Reply-To: <20240115163554.GA4205@wunner.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 15 Jan 2024 18:41:53 +0100
Message-ID: <CAMRc=MeeorYRCmZgF8=sjkm87yWUO=1_Xn62UuVnjMBJvnXjhw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Fix scope-based gpio_device refcounting
To: Lukas Wunner <lukas@wunner.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2024 at 5:35=E2=80=AFPM Lukas Wunner <lukas@wunner.de> wrot=
e:
>
> On Mon, Jan 15, 2024 at 05:09:05PM +0100, Bartosz Golaszewski wrote:
> > On Mon, Jan 15, 2024 at 4:05PM Lukas Wunner <lukas@wunner.de> wrote:
> > > While at it drop a superfluous trailing semicolon.
> >
> > While not strictly needed here - I think it's better for readability
> > to have a semicolon following every statement. Any reasons for why
> > dropping it is better?
>
> I looked at all the DEFINE_FREE definitions in Linus' current master
> and this appears to be the only one with the extraneous semicolon,
> so one reason is consistency.  Another the avoidance of the illusion
> that this is a proper C statement.
>
> It's basically an empty statement so it doesn't hurt but it doesn't
> provide any value either.
>
> Thanks,
>
> Lukas

Fair enough, I picked it up.

Bartosz

