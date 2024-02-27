Return-Path: <linux-gpio+bounces-3797-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 191FE869152
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Feb 2024 14:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A43D01F28371
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Feb 2024 13:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23CEA13AA2A;
	Tue, 27 Feb 2024 13:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="aqcbhvg0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A431332A7
	for <linux-gpio@vger.kernel.org>; Tue, 27 Feb 2024 13:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709039180; cv=none; b=B9Qq+R0naiuRkurz17sW302KD7NQqIOOOwxzc5ZCHbS2d7C+98cC/SmP0iUFZhxHf2lf8taawmvcLX71fk6GBmDIwd283tdZ5Mn/3XRK8cLpjVuM6ghrbwcpWvDLoLldycDRjdP55xhsI/aGQc7Jxp96HxE6g8QF9naNjbqqwhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709039180; c=relaxed/simple;
	bh=/uDylJuigd4d8kEq+ujZnBuzh0BMwt6INRnFR5uTzPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UaRsZv5q/UmA862hUakZOvcysBfAzOJQ88icL6jwALNIc9VMxUtE4s0+x5OwdYMxOzvKqGzTdPeejeFFdSyycVUwxtduoZPrq6GqPGHXLJYPAZYP66rXqcXktxLtzLmt1W1uUrQKM8sZgBRIcPF4pxmrf0dWIyhS7Z2OCsHpARo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=aqcbhvg0; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3c1b38ee443so45600b6e.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Feb 2024 05:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709039178; x=1709643978; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uDylJuigd4d8kEq+ujZnBuzh0BMwt6INRnFR5uTzPE=;
        b=aqcbhvg0DZmDVK3W97ZeMU/LrSBRZ2r0yWF7B/Xykud2yfxYZP/DxxmZxYn2BZXjXh
         pgw8yBhsw6NU/mI0lQ6vJXqmN8ih99OBrAKr/Pg4Ex+vp4Fq9DyQENang8K3qB0UtSw5
         ekhG8Rv2LEcDKGbPfLyQ7kWq++XBpYO48fzUvt3MU9LA2nTnXnGC3yrX6Tm1+EO0SWeQ
         e6AEfumgKlvcKQvJesOvhyPBwLhWXOLmEG5AUb/LcbAl6SJmz5oemIOuoK/CslXK1Yiz
         TUuV5Qq9GeejIAw2Ya8961VHtjF+X3kIk6bJ3CLJSkQ3x83V3p8EvaAV7HKp3BP1J0ly
         1jIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709039178; x=1709643978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/uDylJuigd4d8kEq+ujZnBuzh0BMwt6INRnFR5uTzPE=;
        b=EXDNh/GftGbW5cUna9i7he9G3cmUwF/w2hP0qbTv3VHTz2P3us0Y5OcygMpJ5efKYt
         zY4YQug0xdU5tFXFUpZomeGh4nFs0hvgFh2jqlsxXslNjUX6myddqwwOIS5sKztV3G2V
         m1E2fkuaWPdt+RXdROdhrHR1dThX+wzhe6r9jJQ+8PJeAU5/8qHAECiH5jeD94Uq/u3V
         2BOnYMHWv44gzO0UnxGy3AQKqiiGVSuRt5wd9H9HXvPuzB9gL76lOx/Cdn8Re9T5tp0J
         QtVlBYRTE1bl3f/l7YHgMzo0g5UdDcxj9018+2WXDanrvsUYhyxBHV5vYdrrASpoQFOz
         LMTA==
X-Forwarded-Encrypted: i=1; AJvYcCXYqhFlJZ9KSFnXkjegKKwjMKLPUSQ3aO6KWOzLhAx9btKfCxnsb/r+oTHo9D01EjHAjGJv/e67Irsd8XhILm4c0ijzdNbNMnPbvg==
X-Gm-Message-State: AOJu0YyNClXcckUEJozoeRqbOgUz2ZIU2bstUOqvNp8NJXa2Cw7Io67p
	PTPg/Fmsh0OUrHsapzpxzy6bHXx4JSxSET3cYZ4UQz6de/bpqKQlsLIMdY6NRlIX2xjcVnN/BiR
	WX6ME0A2L/4UMDj8T1sBQh/iBKR5+KTTL9OrW1FN/+JEPRo2Z2Myljw==
X-Google-Smtp-Source: AGHT+IHymsnTIzpxxyFaUH2TMYMIhZIuV1ZmmTokIhLJSPK8tB568uQzASfJBzQQOq6hn71h2+9vuxHhF3pkwDw32HM=
X-Received: by 2002:a05:6808:10cf:b0:3c1:8039:c6a5 with SMTP id
 s15-20020a05680810cf00b003c18039c6a5mr2062657ois.35.1709039178020; Tue, 27
 Feb 2024 05:06:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221213208.17914-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240221213208.17914-1-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 27 Feb 2024 14:06:05 +0100
Message-ID: <CAMRc=Mfh-ojboNUELXfszKUbZRfeZn9vsN-HMTdMQv6my6ZrdQ@mail.gmail.com>
Subject: Re: [rfc, PATCH v1 1/1] gpiolib: Get rid of never false
 gpio_is_valid() calls
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 10:32=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> In the cases when gpio_is_valid() is called with unsigned parameter
> the result is always true in the GPIO library code, hence the check
> for false won't ever be true. Get rid of such calls.
>
> While at it, move GPIO device base to be unsigned to clearly show
> it won't ever be negative. This requires a new definition for the
> maximum GPIO number in the system.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

It looks like a risky change that late in the release cycle. I want to
avoid some CI problems at rc6. Please resend it once v6.9-rc1 is
tagged.

Bart

