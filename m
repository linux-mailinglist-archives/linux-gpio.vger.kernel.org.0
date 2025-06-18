Return-Path: <linux-gpio+bounces-21746-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A285ADE840
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:15:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD1DB189B1CF
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 10:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4302857C2;
	Wed, 18 Jun 2025 10:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lJgl9yHq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B1D201006
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 10:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750241727; cv=none; b=QbcqTv8mVGo8pfztK62uZULluE/4bXZ49NoDgX93XWQ9lMbCiFKjb64rnYpNYJnhgOOkQcFKJ+rGbWmqJQ3FyU/5eHvWHWkkVNU2WiGhcShjIEDXUZ7B52J7W4LOgrhqbN1bcuUnqRBWVfSr8DAWXHMJ4jJPBqM4+UJjfNx1+Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750241727; c=relaxed/simple;
	bh=jD921DQHaDQ1ESWyrhW1JyQ7YkUvB798UiZzCJTny/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p4bD79j/j+2fDfJrcxeJqJjw2GYKr2eEdGx4dxhm5prUE4jAy7aP9d43JRuBlpLtTv4cVWUGlwrJulb21VY3Wlf3VNE00Y93Eegs7zuMBsoj6BQgTBIkeJ4GDg4/lZVptyY4DLSJS5nECx00O0vCGGOfTZ0fDkmQQ5RvWw52h7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lJgl9yHq; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32b43846e8cso40529381fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 03:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750241723; x=1750846523; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jD921DQHaDQ1ESWyrhW1JyQ7YkUvB798UiZzCJTny/I=;
        b=lJgl9yHqBu8jryFDFVQ4GSv9B+Z8KJq/GKGTBxW9xGW/sWdtlDPr4FwVt/Ms4tYBw/
         wzKjkA7uMQt+M5fRcqW4WnnYuVrzDu19CLbuYJZvJGxdHdD8c7HYr8xidqWaTZ/zprWv
         MsND+kOgGtUfAzW/gPhbA1wgOZyiaEpAZjLL5+Q4lpMQA2Bh76RDvXRokkIoFpBEKbpQ
         UvWFJq2eYm7A2Lxa3BRZHaRQ5+ZmKPLgoNsLi8DVBuTUPf/xFJXj8i4XN+soFPB+pF04
         9T2MGXBT2y96bDhfzrSXSwi6qq38wufY8ertY9hZt2o4k2UXrSmqvqtOjX90BoKutrph
         QabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750241723; x=1750846523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jD921DQHaDQ1ESWyrhW1JyQ7YkUvB798UiZzCJTny/I=;
        b=rzPxnG+6QLPGyroSIbWX1Yk0xiIqd6hlFT396yJkXfxFDNbha20K4qovsak4ND2etN
         IfiArh5KZbp8a1GY0E/UWPeMovRfMqDuoxXft2KTv4mI85rliUtvCW3nWsbKQZDtaHiy
         dxdf0YZ41BokQnCFyteHhmOqbCitUwWcWhi+7raumf88cwGho257BZP32gtm5GeScl7T
         I+CZe+tlWl/i8NANcwkeUlmtc9MjvIFOm/IHRwCtN5wNCi8uxaOSybUq75XrEZqYaZ5x
         Pc2nQ3RK8pIcQmRLuBK+00j0++SX/cbOsycvUo8mm8EZ14ik6SSe6uw6JAUalZ/Vue0D
         TVuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5BQmr148Na7Nuc76/iQqlbebetJMByONZ4B6GEDz6+K55lrAlTALGpJuwXUQpLUE9X4/pgd5MyLGo@vger.kernel.org
X-Gm-Message-State: AOJu0YzWvcvFR+xlTvJagDU5NhHHBP+gTW0/urSMUgSnGoT2zjXmlijl
	VFOmAQNO9qrIASTwl9HoHcHwzb+nVAjyRUD1icRxKze7OqO3NzMQnB0CmcrVwdcUTXpwlGoxpXo
	2XAFSnswiSL6LXC7XuehidejAODGKepCw+oMWaqudOw==
X-Gm-Gg: ASbGnctZ0nRD6qulJ14h3P6U9njHILSsyDtmuBcZubN5/u8f4wT8bDDaBOskhLHH95W
	r7Z9HzvqbvqTCz5IsXqXZIAhpjxfK7LwFwdCWMlqKwl/MchoMLIBJZlrLGlM0Q8zRMMxI54HaPX
	XpiwpgxyRgyEFsjXDi5Ls+WRE+HvPFByP5qpp5OkWFa40=
X-Google-Smtp-Source: AGHT+IFgJoTNO+BsB4HVVc11Iwmn03x/+8pEoCMR5VEUoD09rS2tyjDc5RccGdUlZPyD0CvACF53jo8rK9pUhRXX4xI=
X-Received: by 2002:a2e:a546:0:b0:32a:648e:7ee3 with SMTP id
 38308e7fff4ca-32b4a6dbc53mr60545701fa.25.1750241723005; Wed, 18 Jun 2025
 03:15:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1749582679.git.marcelo.schmitt@analog.com> <834e630a45f8b3ffe93f5663b356046d6c6fdd95.1749582679.git.marcelo.schmitt@analog.com>
In-Reply-To: <834e630a45f8b3ffe93f5663b356046d6c6fdd95.1749582679.git.marcelo.schmitt@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 12:15:12 +0200
X-Gm-Features: AX0GCFu0MlYcjSENoy5QcqrOme-qHw-2bn5oP7jO7v4dKtoPQUQWh1af-rRa5E8
Message-ID: <CACRpkdax5amh2ei9QJDzT12FQwg33Mnnv5iJphzM31gL1mupMw@mail.gmail.com>
Subject: Re: [PATCH v5 08/11] iio: adc: ad4170: Add GPIO controller support
To: Marcelo Schmitt <marcelo.schmitt@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jic23@kernel.org, 
	lars@metafoo.de, Michael.Hennerich@analog.com, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, brgl@bgdev.pl, marcelo.schmitt1@gmail.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 10:33=E2=80=AFPM Marcelo Schmitt
<marcelo.schmitt@analog.com> wrote:

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
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>

Looks good to me!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

