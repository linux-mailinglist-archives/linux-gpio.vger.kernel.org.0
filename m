Return-Path: <linux-gpio+bounces-4637-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 670D988C162
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Mar 2024 13:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 952641C3EE27
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Mar 2024 12:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389D06F066;
	Tue, 26 Mar 2024 12:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="meYl6z2H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD9559150
	for <linux-gpio@vger.kernel.org>; Tue, 26 Mar 2024 12:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711454413; cv=none; b=ChLvY30HcZGXdLlzpIJgdNpdkw4kvK2PVp5ADbNg8OkWhTQcdKM58i117Wn2LwFGQTBL3zOnaPbxu8CTzkh4v2JpTXAsW/PDptXEa1FbF/DgerDpMZp3Yv0UmNUYdktVnyqtHNQNHjjBnl/oU8R7aqYOrwb1UXZaYeH9FPpQi1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711454413; c=relaxed/simple;
	bh=5DLrqyloRw4HA2iztKCEKBkf1PO/zzmKtFuIEtK1KD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KdnqJDJWW45iRV3zXqWCovgD4DqNXVyxoaA4QPEk4mFAQjeOU6EwPo1tR5uQflgYl/Lh0VXhB85BFNCDVu/3ghplwcsapRKg+5ce1WzShcwcQH7+sSZlKRaKD6cX0atJ+Uz0EKig1MJQ0hQ87KnvCvqrQzLC7FY0Y7RPM6NDWsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=meYl6z2H; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d46dd8b0b8so70496751fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 26 Mar 2024 05:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711454409; x=1712059209; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCv5OyIKI9MbyQpyJs4bOZC+lzj0+dfLVYcz2czS3cU=;
        b=meYl6z2HGqvvCqek/SBsYcOkCtaKFnITbwl32h3incexUXPyhEZH/H/dpBRqQoNCAG
         LVC/T4aD7FxzYz9bg/NcIbqxJTK/AwGSsldHvdiXbaAdvJBR5M3lmGzBVdafT5UBLQw/
         Hu2rAcV4NSVmvuj3R3ZqXHslGmXd+tMCBRKT7i6aquf/yXP9/zpb8MwOGuxPzZVRtNn/
         Pni/Y/Z3FlDrbx5wyZWh4L54cdxZGHbC15tjR06G3Azup3ZfanahUXzUY8Llk/LUKtJm
         5E4lbB4Y/bSxhh6bQllerL5qTvkKV708KDRUS179g/QEICEUDpJwCi68rF5oJjjk3hNp
         jsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711454409; x=1712059209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCv5OyIKI9MbyQpyJs4bOZC+lzj0+dfLVYcz2czS3cU=;
        b=WEilYlOhdBT9ge/y9S0dc3SnA/zyic2fBCRXyYfcERZ9aEr4FpJxnmt86lxyh6EL0Q
         ggAkb1GpGSDD57CnNN9Kx/K10ozKKJ+HnSDlWm++PUBNDLsXfYeVs19PYdUX+vHhlbzE
         6XPpH6K9n+6DAhHi+kUK/vRAe4Xhq9JA5xnZ8ph82GwRcxXz86KeOLTfjOoS1HwnKvTA
         aqvoC7wbSkij5omXo/IZWOxJX8SNeQPGGjwCm1xUFvMqC/d3cjruj9c3r2MUe/BS+Dix
         WMz7ptBDhNjNiqWE7paeyKZkEjOGxryMIQinxtB+M7iJ/EPQAebmqg0fOIUFR8Xq6Stz
         Zn+w==
X-Forwarded-Encrypted: i=1; AJvYcCXJjYKnCJNif2jpmYuphwmqN7MM/NrhDh1DVMxMVvcqvIYOkxKtRs3X0dTTQqlWzRGy2y4CHGQ7kYOhiAigLeGAZ1dMKKeJR11u5w==
X-Gm-Message-State: AOJu0YxSdWvGQfjHdrDr94Wf9eSoFSxkKb0L6CQuLZnnn/ayCcDEvH4d
	JnMMBx3I1BRCjgcqVvDuK0rrVeIyJZnq+6P/D5+e7OuIq7lSOTEintna+p1gqLZQ1LyoMGoaA55
	XtwF8avVCW1iJoO+pS7VdUqhBjZI4w9V+6f78PQ==
X-Google-Smtp-Source: AGHT+IFNzs3lUN7jBqt538CCJ/Kmi9XufjzZKlCPHzb2+sbiFzwhETIGqSwEBOwlrE9EYPH1QyZuRmy5e6/qRp6e0hY=
X-Received: by 2002:a2e:3509:0:b0:2d2:f5fa:f37e with SMTP id
 z9-20020a2e3509000000b002d2f5faf37emr1412010ljz.51.1711454408639; Tue, 26 Mar
 2024 05:00:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325-gpiolib-find-by-fwnode-stub-v2-1-c843288cb01f@kernel.org>
In-Reply-To: <20240325-gpiolib-find-by-fwnode-stub-v2-1-c843288cb01f@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Mar 2024 12:59:57 +0100
Message-ID: <CAMRc=MeeG6+Q0YU21k19ADCDumDqSVej1DDdydi2axJ3J7Yf-w@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Add stubs for GPIO lookup functions
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 6:01=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> The gpio_device_find_by_() functions do not have stubs which means that i=
f
> they are referenced from code with an optiona dependency on gpiolib then
> the code will fail to link. Add stubs for lookups via fwnode and label. I
> have not added a stub for plain gpio_device_find() since it seems harder =
to
> see a use case for that which does not depend on gpiolib.
>
> With the addition of the GPIO reset controller (which lacks a gpiolib
> dependency) to the arm64 defconfig this is causing build breaks for arm64
> virtconfig in -next:
>
> aarch64-linux-gnu-ld: drivers/reset/core.o: in function `__reset_add_rese=
t_gpio_lookup':
>  /build/stage/linux/drivers/reset/core.c:861:(.text+0xccc): undefined ref=
erence to `gpio_device_find_by_fwnode'
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

Applied, thanks!

Bart

