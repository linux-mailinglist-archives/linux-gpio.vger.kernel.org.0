Return-Path: <linux-gpio+bounces-16774-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 439CEA4937F
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 09:30:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02387188150E
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 08:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9298624EF86;
	Fri, 28 Feb 2025 08:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VJiyz0oU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965D82505A2
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 08:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740731419; cv=none; b=THYU+6GqPR3Vr39NP/KAF3zj4oNQJXBi1Gs2EeU5lU6/U4g0iLB8SpCgzE4ON7pdZ4KDZZd1qTFuQs3Gc+nUjRmMCI0bLZmQq9ibA+5fqvl69oF4FX/tvbyDU2eXUQL4NSi/RbKCzLIRD+6HyQnCV5rFNGq16nSbhissbTnlbLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740731419; c=relaxed/simple;
	bh=XLeo5Vi0OixPq2usRBaLnZM1RGFrZ64TkfzAhPZN/00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BPNhxHRGmxWFTrrMCGb9RtDCp73K6ud+9S303txJSpyVp2eRu0IDzQo0qj7ULytfGEx/wRCEY1M72JBYf//8amFBZp/BKgzPK6r9E1SJb6Na3J8dBMo2npxMqn2zMsz6WQ34s9Fft92gk+XqtAaMQkNx+m6+uqAoxPT7bOTvP9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VJiyz0oU; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30b8cbbac91so9040981fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 00:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740731416; x=1741336216; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLeo5Vi0OixPq2usRBaLnZM1RGFrZ64TkfzAhPZN/00=;
        b=VJiyz0oUSMjK9zPu15m/CZF0RbCX9jKneAQ0x4jWScV1Pp3HgW+YQ8DJb+hfqtxxJ5
         zDq6yODwaIW9FXXMR2qwMQNxcB01MqH5CwGVqEa1oliEeHrzXYBXiDCxXOqSmZxDliaX
         udWrQTYyVPJRw5BWuWg5vEPbKHLZRngv0oam5aqkV78qe0+GR4137SkZeI8VSw7EXgU2
         fjBrSf0hVBJHGrth6/dSgo7ANL5ap3Oot2WVT23xCdsyQzZlXAeAOXjVYLwb90xEg9d4
         4Y9MOzXJzP4PCNnlEuzN4WwIrRl/OhcD8uWfZWcw+WwsjWBvai7Rma25TD03+MSojkh1
         bzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740731416; x=1741336216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XLeo5Vi0OixPq2usRBaLnZM1RGFrZ64TkfzAhPZN/00=;
        b=hDhnli3lnKCE7/lrx1jw2OmEaFdl+N2IjBzn1SfUl5hIDIoTe7hZbeh3gR1Jp8FUOQ
         RVyUCwSYaPVCCSgl0WSx2qfbGx7XlPmcBnD5YhXWZhSVTORSr7QyBVxb8UmxgAz6LoCf
         cX0IqZ6aRhOvQ5DrA4AtsjqgW2bGYFd0tT1cUxgHRCMoySCOix8tP/1VZSLNRBOLlOMZ
         z1SJk5vzN6vDlA3e6cruNzZGnRh07fxgUSJPPDneXE4UOleHgAVt96up2RG8TXCm7ZiU
         2UCCaobzHXuGD7CVLwh6f6txV5IFHNBnq5mZvb369zNSuIr3XlO2nyd+4aPaAzp+xmYl
         BSLA==
X-Gm-Message-State: AOJu0YyUdzA5ZnEI7TEhxGChoYmG8pZPxLPp/ioWQrGAw5zWLblTEJh2
	kAlrQbfYLl6LCICK8lbIBja5d5uLWGBQrmSE4BhA7g0fNt6OkE5YeW4ekgJOsmQbHxXWKre70XF
	871QWDLrupd7WbFPtEN4mT+E3RbSXiSaIfns7tQ==
X-Gm-Gg: ASbGnctFOV/k02GveaB2KEkq5r7oAjpXAy9+hWOnB+d8VW5nGAZgruJIg+W5fzGjzEc
	UbAe5hwgRvOSPFhRFce1PBdak1K0ocHDo9SLx4XWvC5JY7TTbfUKwhijLEEsvIoUAHsWKVn5cBM
	P6qPGYpKk=
X-Google-Smtp-Source: AGHT+IFabYR4anq6ZnLG1cYokflyCZpl7vXNDkVse2kJ8e83DCgpLEdWqJ5k3QMlfybkzSzdA+z9Ryu1m5Kz270QjQ4=
X-Received: by 2002:a05:651c:10a9:b0:30b:94b3:7f87 with SMTP id
 38308e7fff4ca-30b94b38053mr5217851fa.11.1740731414526; Fri, 28 Feb 2025
 00:30:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227152831.59784-1-brgl@bgdev.pl>
In-Reply-To: <20250227152831.59784-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 09:30:03 +0100
X-Gm-Features: AQ5f1Jpb-gX8sgef_3oXTCJS8DXaXh7_9cKS1g-9bF1Ux-_WbeQKPC42ilJWQFk
Message-ID: <CACRpkdbpNkwQQTLcEk1r7=KcG-d+auozOr9jA160zwE9mq6qAg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: remove unneeded WARN_ON() from gpiochip_set_multiple()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 4:28=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> GPIO drivers are not required to support set_multiple() - the core will
> fallback to calling set() for each line if it's missing. Remove the
> offending check from gpiochip_set_multiple().
>
> Fixes: 98ce1eb1fd87 ("gpiolib: introduce gpio_chip setters that return va=
lues")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/ab3e42c0-70fa-48e0-ac93-ecbffef63507@=
samsung.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

That's right.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

