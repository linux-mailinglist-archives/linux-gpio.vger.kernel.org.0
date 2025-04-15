Return-Path: <linux-gpio+bounces-18857-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 596D5A89F75
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 15:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E1AF1887A07
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 13:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14B81EA91;
	Tue, 15 Apr 2025 13:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PLHX54V0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4878F66
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 13:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744723881; cv=none; b=TGNbGvi0QZCAmDdwNbe9XMfhLKxsOPnWh9toe7MQB/lszqsTh1trr5A58lMi7/9TaqhUoeXp7TJpEaL/oeAU6Tpb0+2RG+PrG3KmQF7Oexd+cSN1kuYOZFsrrxcHLQ7hO/C9pjuuzJspWY8HaF9g5XMZu5WSrebL0zPnM6qMWgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744723881; c=relaxed/simple;
	bh=GvfmE/eBZ2/aRfUOlGi5PJS1SLxONEyNYd1JH900fW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iqbhd7iDcOkX6LAxLeuMF7DdySwsZQ/55fNmgbNljZ8dIjEgEXLaPolSgb92UkCSANWMOVfdzqY/ASJK5ljh8QxFbeOQXeI9YEaWzHD+zZZimAXr9aAQeIT8iuWFWZPwSaYHKFGXaDzfBibvZ31lI9yh4u+on9xw/3qOH8B/UAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PLHX54V0; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso56793761fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 06:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744723876; x=1745328676; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eug+7WZO7KWDYOJu0WrkQfNoikV10bCs+DYBAICnEU0=;
        b=PLHX54V0BgMryQWa6LnZlLdqOPV9s9QnsVc//C6Zo7jr5LSW3bHz9sLsX0qIVdQ8ln
         3gUKXpwOBjT6MWfu3h0CGpR/bS8il2DiTe24rbkg8MYh79N+3JeWGagEmfkN+gzS8guy
         g+oqvlArnoL7NlAd+oftiy8zFQ71ALT+gmgdaGCZXHIZN3vc9JOedtnK4s4VkeAc3H+G
         4bPZcuvuQ+kKwZbBFN+mZ9/7FKGIa1ikll38j/oYKQ0VXBl6T3oKXB5SMdxRyyFAGPLh
         TtIpxExGgmZpoKyIM38vVsL0nw4bhKbS01siHxDb1ZmT/rE5ijkGLqusjDIlNcFSnq4X
         BiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744723876; x=1745328676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eug+7WZO7KWDYOJu0WrkQfNoikV10bCs+DYBAICnEU0=;
        b=rsIHusYVBMbj5MRsN2tRqVKHvrgGoWsAzUPY9rvF3ZGiQIWzoIT870W9ZyXi8FpjTk
         IFYUodENuLRYjfyres5olNGorRL1HCEtyo9PTjZk4CAZ7myqxjpT1eRR/FwGRH5shYs3
         j5XDJyId6F/x+lg3AT0TUcgF8GxAfLwLomvag2tOezjt6RSJ/saSchPdZTmItfzqKWQY
         LK0b4iR4DUXIjZTOe4feN8Vpsc85xgEBd1v+CUTbEi0wv/2MTthxMalhW54arpDfaeyu
         1hj7Z5dAETuJyiKQQCs+Yms1odXvtc113XYsZrf0j5bqAFshZlfNBjmjiW36y+yyNelR
         ogEw==
X-Forwarded-Encrypted: i=1; AJvYcCWPtuHIhmnEbrfLoIe/NjCdeSX9peaD62lnyXcvduyEGqeqD7RxoIrdkPBD08wJP9DxyBaMbP10NtEv@vger.kernel.org
X-Gm-Message-State: AOJu0YyIudWc/xGCzTyaIPYD+c/ecixgJK4ZJ7blmuhGA2sfOnsirJfV
	wPpJicJYoqC/ll6Zpw9uxI+sUESVVdoZVEU1udgJZu6a4uhbCC2c0UCeB7StiQm0hN6c0JXhJ82
	JHZc5BfhVRTRlx1Q1/vvzUxRp9qvHLI2hjsUBvw==
X-Gm-Gg: ASbGncvKZhrpTNMAmHavUZIUzrUdzdIjc1gVy6o2SIkMinwNxgC1kck4vw8h1fRp1bM
	gAIK029J/VI0fKstDyySJjW7kWvES5fPXz6OrBd/fdNrlcKw/hZaRPz04qqVINlZQq5HNH1ke37
	ewpYoDuR2fnNAZTc/KUzNY/A==
X-Google-Smtp-Source: AGHT+IFZev9RFyJCNmmQraspcvfhrbsLl68EnSdbuJYcS/l62aD0avrIYML3YObdQCZ3x2MmS3i5RX8xRk8V7dFCwXM=
X-Received: by 2002:a2e:bcc1:0:b0:30c:523a:a84 with SMTP id
 38308e7fff4ca-31049a7e538mr59706231fa.32.1744723876267; Tue, 15 Apr 2025
 06:31:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com> <20250408-asoc-gpio-v1-7-c0db9d3fd6e9@nxp.com>
In-Reply-To: <20250408-asoc-gpio-v1-7-c0db9d3fd6e9@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 15:31:03 +0200
X-Gm-Features: ATxdqUEQNMpQWYYn2o7kRD2SxefyzEZHkzT9pv-wDTuqunbvAd_GIf-5Wu2lh9g
Message-ID: <CACRpkdZA_bOWt0yqm0mmou6Rp_TA7+L=K9XeU4KXoL=A69e0JA@mail.gmail.com>
Subject: Re: [PATCH 7/7] ASoC: codec: tpa6130a2: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	patches@opensource.cirrus.com, Peng Fan <peng.fan@nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 3:41=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use devm_gpiod_get_optional to get GPIO descriptor with default
>    polarity GPIOD_OUT_LOW, set consumer name.
>  - Use gpiod_set_value to configure output value.
>
> While at here
>  - reorder the included headers.
>  - Drop sound/tpa6130a2-plat.h because no user is creating the device usi=
ng
>    platform data
>
> Checking the DTS polarity, all users are using GPIOD_ACTIVE_HIGH.
> so all should work as expected with this patch.
>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

(...)
> -static const struct i2c_device_id tpa6130a2_id[] =3D {
> -       { "tpa6130a2", TPA6130A2 },
> -       { "tpa6140a2", TPA6140A2 },
> -       { }
> -};
> -MODULE_DEVICE_TABLE(i2c, tpa6130a2_id);
(...)
>         },
>         .probe =3D tpa6130a2_probe,
> -       .id_table =3D tpa6130a2_id,

IIRC the DT-only I2C drivers still require this ID table,
unintuitive, but I think that's how it is.

(Others may correct me!)

Yours,
Linus Walleij

