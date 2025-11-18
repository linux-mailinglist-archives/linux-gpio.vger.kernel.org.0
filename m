Return-Path: <linux-gpio+bounces-28714-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A04C6BFBA
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 00:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1CD524E649D
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 23:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5242A30E0D8;
	Tue, 18 Nov 2025 23:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BV/TgF/u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC1E2F6168
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 23:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763508251; cv=none; b=bzm0wWWs7qmbFs/AMyPMeEJZoosp6hTZtO8U5Or8/f5To6heTzHQuoxfuDa5Qizd+xaKeBYi4tUZIloEftjKJ25geP2uyjnD7nbCGTSapX6fE0BkY1P3C+1CVYulGgdN4mR25Ts6RHgH0s3/EXKYnd6G0Rza9oUhq31zRK+nWVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763508251; c=relaxed/simple;
	bh=W7pcPwr+HQ1DtHd5FgFi1WUcp3JgCAPSk1CS0dBa6sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JIrN2n2u06E21La1uysxIFtMTzXZ1+mj+4uCZdyFztZt9UHSIjRAWBy/1waeAQtGdADYiXpt8TU4Flw1GF4k4mJWqOOnJw0iVhF9zAZZ7l6hlbXeUBkzrrCnXI/X8PqP0CyagM3BixtGBx5TaAQ1OODxVn4h+ZIMsGOrvP0MXwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BV/TgF/u; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-787c9f90eccso65749337b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 15:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763508248; x=1764113048; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkQ/NuFQlM3VlJsncZMDZvs25ArXxORoyFile8VIKq8=;
        b=BV/TgF/uOgrXpqAY/wX0NC3SXEKfyzVDENCie11YOlfGTFq94ENVFtFH6ktjbDcAD8
         /2QUwTQwgxSDz9JButnQJTHb3qDC8tZEWckmkyTxAkhd0EELB86aPabtMfqbDsiEXZJg
         xoXG3UXcAna2m+XHfIiQuCetEfC4gd2Zah1n0GKOTEAoI+fwDBWegkDNvzujS51fCwv8
         cDd5lTJci1tNUE8wu/El5qnP1TQZ57eIgzTgAhqNO7Qg0nJS3s1aXTXvR2JFoFY8+RAE
         7j32/EXyJpNDLicpjmE6TBM+R0PkZavjK7VHnZ1zML+UvPPNWR93W4oTdmJEcismlG3S
         yf6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763508248; x=1764113048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gkQ/NuFQlM3VlJsncZMDZvs25ArXxORoyFile8VIKq8=;
        b=XR8J21o7X/VdwjcReZs6l+NkFEsClhshbDwUUclrgspAxvZFF0xTrMB+Nh+xj1XgtC
         NGJ08QCMhLZg50A972rK0uC5xqahsg+FeezXKmd6dPI81lUPphjiX7aPZutRXqXqx4Y7
         zV+mtxrKiq7B9x35gl+L/Zb6ocPrla1HCgLfAOeBMuJOmtnQaJpvZMRCAiJWNsZn+ABS
         RPQGgQYf9Vvmg+04FaMO9WRwj26AW8eAMPWmaKHnwQRa7chisyq8jTkrGoPB86akNmyM
         N6x24FK6Ds3iLvWhpFPhvW+jGTXVGB60dNitKIoyZd/zgNZd6qLX+g8JfPJgrDvbaUao
         2kEg==
X-Forwarded-Encrypted: i=1; AJvYcCW5BI2IIneBUxhw/t7B1QMcc8hpMI81Pxw4o3KV66CoBG4ucE5KClHdAGykSoR//1Wn1AAOoLAnRsr1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0m99z+vL79oqY2r4M7i5XoR2QZOkNC+ARxnyprTr6w/fJxbvF
	zkppABXO5wds2v+4tzv87KkGfovxfOpUkOELNoK1O6SfPpJZNvDPj/G9pPTraadsaGtUsJ2v1+7
	iPcTp9JMjBRPzDJED+lYjiQREDuyTjIERv6w0XWioOA==
X-Gm-Gg: ASbGncvb/8IOV14HbXqtaSzqNAuewbf7yhhL3S3SrZ03vHYLySJ3N+EqbcAod92enKi
	trraTcxU5y+NmfbVW9YvyLr6kUI3GUgQcfREuCtZ7Ca5/8KjL7rU5MGEtxQSJO1ZtdvzyoTzND2
	NDutzOP/QSYQ2iufY35VfAggWVFtS8PQlXrYfPZ9/vY1mLsSFkFvdZdm524gcSxcLv/XV1KnAE+
	d0ZHKKj6Ixd+1j68+5HF/hzyC7W7ORvE52w/aNfK+cHuZu76OJywxCM/oskjpOiUSDtXt6PQspY
	gQbrjw==
X-Google-Smtp-Source: AGHT+IFyBO03TJnQUlzqci/5MJ4HTgz/fgmqOzYPPzLJFMjECkvojkE8ZLq0wzXV0U24gpbvqdWxMWsnSwsdREunK9g=
X-Received: by 2002:a05:690c:6706:b0:787:e9bc:fad4 with SMTP id
 00721157ae682-78929eed6camr148903037b3.46.1763508248199; Tue, 18 Nov 2025
 15:24:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org> <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 00:23:53 +0100
X-Gm-Features: AWmQ_bk2_VJnze8bWKsmcQjt5Ax-Z34cI2HnH2M84uK1kPWn1ddtleYK9nAAhL4
Message-ID: <CACRpkdZioOu9AEBdaNWX1njsVvFYR8SP8yJrY8MFMbJtL6YLJA@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 12:15=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> We have a long-standing use-case on various Renesas R-Car Gen3 boards
> (e.g. Salvator-X(S) and ULCB[1]), where GPIOs are shared by LEDs and
> key switches.  Basically, the GPIO is connected to:
>   1. A key switch connecting to GND when closed, with pull-up.
>   2. The gate of an N-channel MOSFET, turning on an LED when driven
>      high.
>
> Hence:
>   - In output mode, the LED can be controlled freely,
>   - In input mode, the LED is on, unless the key is pressed,
>   - Hence the switch state can only be read when the LED is turned on.

Fantastic solution to a lack of GPIO lines.

This reminds me of the Amiga 500 power LED which was connected
to a GPIO which was cleverly also reused to control the audio filter,
with the effect that when you turned off the audio filter the power LED
went out and music toggling the filter off/on for effects would also
give you an incidental stroboscope.

> If you have any idea how to handle this, feel free to reply ;-)

Isn't it pretty clear from the system-level DTS how the line
is used?

If it is connected to a gpio key it gets assigned for that usecase
and handled by that driver and if it is connected to a gpio LED
it is handled by that driver.

For the input usecase the status of the LED is a byproduct and
should not reflect in software I think. It surely should not be
controllable and possible to set into output mode because
that sounds like a recipe for HW damage if you drive it
actively high and press the key at the same time.

gpio_keys {
    compatible =3D "gpio-keys";

    button-ok {
        gpios =3D <&gpio 0 GPIO_OPEN_DRAIN | GPIO_PULL_UP>;
    };
};

Yours,
Linus Walleij

