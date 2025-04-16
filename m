Return-Path: <linux-gpio+bounces-18916-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5086A8B27F
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 09:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA1807A6464
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 07:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2147322D781;
	Wed, 16 Apr 2025 07:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iw9rziFQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C561A8F9E
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 07:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744789452; cv=none; b=kfFuIhAEIa/6kEHGuxcJD5rTt3YXU6HApACm8BV2rshkhxWuK78gQQHLYnrOXswYVXD/1QL92icH4+j++3upkMTH3rIe2olC7Kezcy0DC85PqpJCM8HJV+9HVM8zPiktr4WCKrESw6D3e77IDKkYc3Xc7mCVU2ux0F35u4t6C7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744789452; c=relaxed/simple;
	bh=w7BUvBYqTMm1Ze0afEibdThADpsOyoFKneytr7BCkqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LBjgpvvXB2npnIVMbTCAKJ6xKPSGmWkDbxHFI926xMFprzV2P+j1rW2Sf6dkR5gDgiFYwnm46o0qxkbTRw8B75Cr2WfO37xa3I+zOLhZG2+2dCgcqfgW6R0uUXil571wi7ZYnRsgXQu+P8MibWGvsB9cd1T+dmjCOhRftLWj8fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Iw9rziFQ; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5499d2134e8so7759641e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 00:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744789449; x=1745394249; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7BUvBYqTMm1Ze0afEibdThADpsOyoFKneytr7BCkqU=;
        b=Iw9rziFQ0zflq0thJE07XZeRtG5fvZ/UHqo7sL7GBaNh2gWnF/3MHaGz5+4ixr6pk7
         V/lAf/TNIXxPlzuBL7+uhsdWqGzWGj7dwoqFVbnrMFQkCdgF4tI+lx0ay5Nv0HdfTtDw
         IgM1sFW6iPaEc89Yr3Lvnus9Qb7n33KGMypsVe+P4GyClXjIeNd1O/WfNBG/nroXjPjn
         hn69/rtZhnOSiBg5G5lv+cL+yi7nOjttmz01oO0VGhGF2fkXXj2k4D1SJxveuHxvt6hr
         owg1y23r5FbLoiRiMFV48r048dIcmIc8SfiRqGQ8KCxFcDxZGW5bJZbjWeoNbSpHUeQp
         U60A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744789449; x=1745394249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7BUvBYqTMm1Ze0afEibdThADpsOyoFKneytr7BCkqU=;
        b=KCSQ8TnY3FG9s0xHmMzOnUTGzEUmmraDY3DNNApzMMlwMvda3pRRsY2UMt/faBbNBE
         dA2IfOAmk8zqtaVeuzDiiqI7ba/bNoKItpVuVLoEaaySRBvksn3751bdpuotRTONtyG+
         6YwwPKTKzUCrUylo6jceh4sX6MRMulJt8dxE9Xqlix5zSG1CxGwFCM3NlnY2g73IMjf6
         zO3EAhL67h7O4FHB0Io/3HQdEDtFC9maGvxbkL7A2+ri11aRZrBe1swD0ShW+Kap6omy
         XM++5RFKxyuGMFDM081UjUnagoBYgD1rkUip22ge58JpSHGn0G7LmrkZoj9ZvYTr4B37
         92PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYWy93Fkup4O/Z4kqFrNWihj3OFoc9XuQzAqfq/tmIteqV79zQcoNgwUyyZj2kwPpc6nM9mFj/Icup@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7e5JsaxV7/i//w/Ke2x9tkkSSFJTAmCKQOtphrztoJGzeAHhV
	ofigQym23vgwDu5dyUJ/sVyS45kio6U0APMwXUuH1muCR1nEiekQ8OkHfgFwXpopGKqF6UJvySR
	h3m/JcqmragQz/XkorT+qjGQYHWBga1FzC2UgqQ==
X-Gm-Gg: ASbGncuyyYNgB5sM6NV3991vQeTC8pXO191lKRQksnsDoKKm7gX4NacUAOUO5favnsW
	AvgWm8+LyXYiGxm0usCx1qRiRPuk8uZ2mmWUiCeSClpYSCK9DxnZTSyFpwVvlH0Kh7Xl6a7t0Mt
	q8DhLjSQl/Pvpq2eicbBAu1A==
X-Google-Smtp-Source: AGHT+IG0Lwyub0udHPr2t5fpOsIZ2RLg7Lkae30HWcbs+tlOsVB08fWQavStEVsRHF6ju8VE3aya9e5Yj0LjLkUgobg=
X-Received: by 2002:a05:6512:118e:b0:546:2f4c:7f4f with SMTP id
 2adb3069b0e04-54d64ab0b47mr201581e87.28.1744789449414; Wed, 16 Apr 2025
 00:44:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1744325346.git.Jonathan.Santos@analog.com> <414f5b60b81f87f99b4e18b9a55eb51f29d2225a.1744325346.git.Jonathan.Santos@analog.com>
In-Reply-To: <414f5b60b81f87f99b4e18b9a55eb51f29d2225a.1744325346.git.Jonathan.Santos@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 09:43:58 +0200
X-Gm-Features: ATxdqUFrHLfUgDMhA2bIeO0emn67mugRA29Aq8hS3KKX_3FOQ4i_PWerQ3Zb48o
Message-ID: <CACRpkdauyPb3bhgK4MTYN4Xq0cM80vwT8i_jcKoQcicpvMo7yg@mail.gmail.com>
Subject: Re: [PATCH v5 01/14] dt-bindings: trigger-source: add generic GPIO
 trigger source
To: Jonathan Santos <Jonathan.Santos@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, lars@metafoo.de, 
	Michael.Hennerich@analog.com, marcelo.schmitt@analog.com, jic23@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	marcelo.schmitt1@gmail.com, brgl@bgdev.pl, lgirdwood@gmail.com, 
	broonie@kernel.org, jonath4nns@gmail.com, dlechner@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

thanks for your patch!

On Fri, Apr 11, 2025 at 5:56=E2=80=AFPM Jonathan Santos
<Jonathan.Santos@analog.com> wrote:

> Inspired by pwn-trigger, create a new binding for using a GPIO
> pin as a trigger source.
>
> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>

Is this actually documenting the trigger sources I implemented for LED
here?
https://lore.kernel.org/all/20230926-gpio-led-trigger-dt-v2-0-e06e458b788e@=
linaro.org/

Then maybe put this in as Link:

I tried to figure out how to properly document it but I think it was part o=
f
dtsschema and that may have confused me.

> +title: Generic trigger source using GPIO
> +
> +description: Remaps a GPIO pin as a trigger source.

Please write "GPIO line" instead of "GPIO pin".

The reason is that not all GPIOs are pins. Some are other stuff.

Yours,
Linus Walleij

