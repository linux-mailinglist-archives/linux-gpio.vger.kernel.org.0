Return-Path: <linux-gpio+bounces-20358-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 861DFABE187
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 19:07:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16A6E7A4536
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 17:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF8127A121;
	Tue, 20 May 2025 17:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lTF5QwtG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AE4262FC4
	for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 17:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747760825; cv=none; b=bEgyXUPUT19QV/JEfholyHNDQAIIFnGzBr+GJ1GXe7cEzPFGmeZdpwSA7omJkiLKFCHXkSpDfzQrMJd73oEcWh8dZjph8hu5MVVl9FAjP2HxDnVQknqGUS40gYeqI6XkJFY1M8efDUaQFZlEAew2SmBGkxajIMhFfsOqz6p/voo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747760825; c=relaxed/simple;
	bh=Adr44lrbjsmXoOwujV+JXJKC/0dp11U+EuHbW3DQjGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=luRvDeDQRV19OljRSlxdxWAJAmaywaWdAEMc3fNRkkDRXikicAezc+UFAQbEaTkvg6cdP/UbYRRHE0Egy2nEcSXZyVRaKLmNJBhy+K7ARLIUTaclR5UgdBJtDn6+WSAcd7djCmdCh+dDNDmCyODcFamY0WmQP89vdsgVkuTOqrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lTF5QwtG; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-551f14dc30dso2518874e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 10:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747760821; x=1748365621; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKZ/DOS74Nf8VMwAesCPZapfqJEzoCeBvijff87jyRE=;
        b=lTF5QwtGMaBLkvztY7E3GRjU51KMstIpH2OjIiWiVDMUC1QVAguasaOAekQ1qTOOga
         aLBHhJr+n+poLCBVkmEhCJiyv52F2yOWtWuwCWoI9I4MNeQLIBcdFLwlP98uFEQFTC/S
         hGjYYV7q6nSdIoyHg5Eu5//EFGuuTVwEQ3i3CXVKXzwmAgwzcesAmr8UTmEMtgxCdoo5
         W5/xKEk0GWk7SdBR+l2PrRgOKTTatDummLwxO3/H6Zb6gyI26RHWPqcUQdk9QLbvvL3s
         +aTFwNudrIsNaFbVn0jcWwG30O0hSVYLKhZrBUNiq1ePkBFz4OUZg+PJaT/OVm21QO5C
         nv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747760821; x=1748365621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKZ/DOS74Nf8VMwAesCPZapfqJEzoCeBvijff87jyRE=;
        b=mnCvY+Fw0CEQ16cQT67Eoz4FduIt+rSdX5qinZZ9+ojOAyCP9xrAfaYbDo9PasVz6w
         mWg3bShmwCWnkse7zEn00HfbwH2A5dBIrGsABiWkUDd6MwUTSLx31QKXMutxNaEy9xef
         6IWXKfZZeTYUJsLk2t4JkG0ZVR/3TdSCyeZsj8gpcUjPBMVJtun+hr4ykcCtINRuhZhp
         EJNUFjsrndnNf3hvczZLq6jexiB4PcSg9q4o9LqbJgqycdnXoLNP+QWJLrpdsUW8OH1N
         Ar3r3/sTnsp4ueBsGvIqHBtjLiiKNteSHi7MD/Uwq+BsP1alYs3L5uTlGHcRUpvxv0zw
         Vkkg==
X-Forwarded-Encrypted: i=1; AJvYcCVx6IFtkOiOMJi+mIxSfVZyetNPOltChgRwz424KqoRqR/ZtEJ53FA1SbFAplKfSDMP5qmaSeQ8Mxl2@vger.kernel.org
X-Gm-Message-State: AOJu0YziY5mSi6YkS40Myd4OSU3Z++BY/yhuQvHWthrbk64Hg/unPVCm
	V39HdejESiqPCDLWY8+eXzarksvvmhUuUB+//w760BcwuXIfEnY9tML8NVFEAqdbgKT09DQN2Vl
	IhJ4UTN5QVwjpmuIuRgihBKpCxbVVvTJ7ABSDd9e/3g==
X-Gm-Gg: ASbGncua/YdMciyIZG3/Z5ngxz/2U9w4JswByJbTm5xmekpSqRxCYBKb1CQ5aDYC8Ba
	+XSOVUOhZ5oMQCojss0RNW75jVEo82tHNZgGVlhLxsJgr9w7wSgbZgwWfez9aKPtpF0AUu5L1BI
	pf/+jIsMJQu0yxYzuivQmg55gYgvWFeJ/wUR0minq4GB5nkV7yabEMLBZcldCKh/fg
X-Google-Smtp-Source: AGHT+IE94WYPcJWNFg4NYJY80yMW+YBrxzlbo6GpAVtlZwVgXjjobfKZPhi/TuG+fBNOHPLriHho0nGdbtbKb+ATFBw=
X-Received: by 2002:a2e:ad0a:0:b0:328:c9c4:8ca5 with SMTP id
 38308e7fff4ca-328c9c48e0bmr53924511fa.9.1747760821408; Tue, 20 May 2025
 10:07:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1747083143.git.marcelo.schmitt@analog.com> <6e7dde3fa52161873c6e05891a7410bc8ef75249.1747083143.git.marcelo.schmitt@analog.com>
In-Reply-To: <6e7dde3fa52161873c6e05891a7410bc8ef75249.1747083143.git.marcelo.schmitt@analog.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 20 May 2025 19:06:49 +0200
X-Gm-Features: AX0GCFu-1HWUSDG-PKcPd3_RvCPjeJCFAZE3atYyLGkjJRLlS3BwEdYRGfrtQ1c
Message-ID: <CAMRc=MfJuT8q1jRMeSJQaE9aQGQFpph4O9TrE6xircqi3v5FgQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] iio: adc: ad4170: Add GPIO controller support
To: Marcelo Schmitt <marcelo.schmitt@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jic23@kernel.org, 
	lars@metafoo.de, Michael.Hennerich@analog.com, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linus.walleij@linaro.org, marcelo.schmitt1@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 2:36=E2=80=AFPM Marcelo Schmitt
<marcelo.schmitt@analog.com> wrote:
>
> The AD4170 has four multifunctional pins that can be used as GPIOs. The
> GPIO functionality can be accessed when the AD4170 chip is not busy
> performing continuous data capture or handling any other register
> read/write request. Also, the AD4170 does not provide any interrupt based
> on GPIO pin states so AD4170 GPIOs can't be used as interrupt sources.
>
> Implement gpio_chip callbacks to make AD4170 GPIO pins controllable throu=
gh
> the gpiochip interface.
>
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---
> Change log v2 -> v3
> - Defined masks for updating GPIO mode register.
> - Replaced regmap_clear/set_bits() by regmap_update_bits() to set GPIO di=
rection.
> - Removed GPIO direction check before setting GPIO output values.
> - Made use of regmap_assign_bits() to set GPIO output reg bits.
> - Made value to be set as GPIO output state be either 0 or 1.
> - No longer locking on state mutex on GPIO set since GPIO output should n=
ot
>   conflict with other direct mode functionality (e.g. single-shot read).
>
>  drivers/iio/adc/Kconfig  |   1 +
>  drivers/iio/adc/ad4170.c | 224 ++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 224 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index 6e4b14243599..a328f03eea34 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -78,6 +78,7 @@ config AD4170
>         select IIO_BUFFER
>         select IIO_TRIGGERED_BUFFER
>         depends on COMMON_CLK
> +       select GPIOLIB

In general GPIOLIB should be depended on, not selected.

The rest looks good to me so with that:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

