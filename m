Return-Path: <linux-gpio+bounces-4079-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA5A86F417
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Mar 2024 09:44:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2C0228293A
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Mar 2024 08:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423AF947B;
	Sun,  3 Mar 2024 08:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ub0UnWT3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7151A2900
	for <linux-gpio@vger.kernel.org>; Sun,  3 Mar 2024 08:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709455457; cv=none; b=U/xOD/WknTsThhKZMxnA9zyn2s4phE994/90jOP1cMqta7CRL4aR1Neezibgz1vd8fdxMNkQcHEepQVjMKg193sUowIFv0lGuQ5piheXoHeMmDQEruiG6+olxZoqv3Mn3rj1o7efSm3ZVNS7ODqOmJOkCrm/8TTPHOAzg4r42pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709455457; c=relaxed/simple;
	bh=3yzzCWNwkQ+PniCKvcwlV8Ttrp62iS99i0D3bBQSZj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MGfl+BdHZLUyFIo9m8FGsrKQYHZSY3ngfLOaYXoi+OcpzlxDyydjRREyEwJ3NHI6IQQHr89QD2CO554gdDW0O7kICHyvVlcw8Rw69qlGKchF9YoBLuFpOwUuSx0gGMzfE4ibc8rA+lpojlGGOFsanPMz3NPh/nzZ5CEVREOT95E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ub0UnWT3; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5a11b781a79so742066eaf.1
        for <linux-gpio@vger.kernel.org>; Sun, 03 Mar 2024 00:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709455454; x=1710060254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3yzzCWNwkQ+PniCKvcwlV8Ttrp62iS99i0D3bBQSZj8=;
        b=Ub0UnWT3EqRW5Ej4N/19dR28Edl9i8CynI5NiMKLWJVzJnVnDfs7TFIpk4Ced0HTxe
         akDj86mmE1jtifKtLARViB7CfpGyK9dH6hdI5XuH9jLw6FC5gEemCb7v/rAOlE6p1Y6c
         DKsfUC36P/hzB+ekpKnLzjknP9jIX4uBSaERJpwneH2Z4pHyoubNynOVG9YGbA83NRbV
         Iw0QwIOm/HL3/6w3qB+dFjhISwyE3P/8AJMQBqi+mFGzkUmrclKObPqwjSDQBpzj6kl+
         Z6Nt/GOsuEFZnhSP64DVEDsaPNC69CbMjni7eZJ4+dyWXNAdPbCD6C1g0O3S6dt3EA5c
         CJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709455454; x=1710060254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3yzzCWNwkQ+PniCKvcwlV8Ttrp62iS99i0D3bBQSZj8=;
        b=FS9RYR7sNa9lI5ljFJEif1c6BvnfrnSLxFOr8a/Tas1K65z9NWuR59Wf429KrnD8VM
         V7Lex8wfz8EI4QF10h7rOdUUGQ9rotkJIwUcD9eniWv0zbkCrAizus4uzFXh1StwDKIj
         1tSm8/uqKzMCA6FfuhdPy53uXUr255HG+9skexHySVRhRlvlzRCBoIA/hxqEYBU1e6o7
         eU3EAe9+eWQFkegz6mu3FNMKW+RRHZ5WC0B++JOz0qwdYSYxgBhUVFzxx2dHn54zQqih
         vx5uvaUYAn481p5pp0sevuzUB9leWavl44WRssr7pV8dM1RLNZgQkZuN7j15FqKo2pgu
         2fhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmjD1/4tLtyt8cztuDHSmqcmJdWxB5yl4g5LySBQjxcmI775MTG2ngRqs9Lf7+yg4jMd6YTPxMldR6k2gSDKR7co80OtbA2cYm+Q==
X-Gm-Message-State: AOJu0YzYUYviAk/OeguKMjbyQzYb0UWUsN9wDbM1RoPHtCR5DkWPt55g
	zGq7JeeQmOdTJWrOd6X4OeY4DaJNglNIn8BDE8+jTIOn0SmYbw9frLuFSqr9TL00d1f6HHsor9i
	6LfHrgOyq6k2EyPA4BFY4CIl/BpakYx9/xtlQ6w==
X-Google-Smtp-Source: AGHT+IF/dQlPk++sgIBUAh6KZr1jdP3M7z8/D2mPagrcdDnYOfOmJGfLqoi4HUnG9kuc8icpltFeH/cOzsvpfHAMFvc=
X-Received: by 2002:a05:6358:8a0:b0:17b:6453:d696 with SMTP id
 m32-20020a05635808a000b0017b6453d696mr6269462rwj.0.1709455454495; Sun, 03 Mar
 2024 00:44:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240302173401.217830-1-andy.shevchenko@gmail.com>
In-Reply-To: <20240302173401.217830-1-andy.shevchenko@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 3 Mar 2024 09:44:03 +0100
Message-ID: <CACRpkdZudHHkFcdmHB9mWGriV0EtvZrjiGUHF+b7W2L=t6xmwA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] gpio: nomadik: Finish conversion to use firmware
 node APIs
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	=?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 2, 2024 at 6:34=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> Previously driver got a few updates in order to replace OF APIs by
> respective firmware node, however it was not finished to the logical
> end, e.g., some APIs that has been used are still require OF node
> to be passed. Finish that job by converting leftovers to use firmware
> node APIs.
>
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
> v3: used correct types for fwnode (LKP)

OK took out v2 and put in v3 instead :)

Thanks!

Yours,
Linus Walleij

