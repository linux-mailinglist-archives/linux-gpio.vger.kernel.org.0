Return-Path: <linux-gpio+bounces-16769-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7055DA492F0
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 09:08:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1A2216F1BB
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 08:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7969F1DFE02;
	Fri, 28 Feb 2025 08:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W7MzjX/A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1121DFD9B
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 08:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740730023; cv=none; b=F0S0djnu++gATm5R04amI3btvo0CaNw4CUvbMfMPpap/X8ssWdZ2Wei1oT0PsM8rMdbs0SqvBH0LRh2OCs0bfi7QbyXzSmtCDxwg4fd+rn2ddpfGXEoWmBL11KAw6SjROIJAm86l202+0nhh00yrOc+rW+ZZC28zBw+rstsEQmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740730023; c=relaxed/simple;
	bh=BmJ/lVzZSA7fl7W+s31zkTISrUXtMIX78WNI7kT6pdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d0KTDUjb2scBG6qea9CbG92tzWw36jbDQvSMlTH/EjOsOwpIEgMIQ29pI5tla5VjBomHfk4FPszKexDV9ZemShbbM8e4zH4H3FPmZFhlpr3WUk8R0SfFLx9o8XQQvGJFs8BAj8jXd16osp1ewztZXdnMndXCstStEUBPsHEvBdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W7MzjX/A; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-546210287c1so1789740e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 00:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740730019; x=1741334819; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmJ/lVzZSA7fl7W+s31zkTISrUXtMIX78WNI7kT6pdI=;
        b=W7MzjX/AHghc+6oVIh9EQTCKxaOwv0DqXXoZZtGf5EVwAtExSDkRuVrCl0WKEQT9Gf
         3TUHhD2QLi4C0RMKEyrTaliiXnaCjcrFXEpKpMRvj/v7jba36xQHJ79RGv1JnXcHpaAh
         MEcWbvw3GsWuWojev+ccy9w55HC+w6ZA08pIY2fhWazBExwqAUJHajOae9ZMRqTLb8sR
         I+VPpHIT2GfeWhWZK+9pY+xK0eeJ7xuuCe+3hDykbe1H+ojUAmjJRef/hwdFB7YJLnGF
         tlLTqkmzMdAFmLcB5CSWF8YaIOis3EC09AI1AvX4p1PKa+1CoSuzCNNsE5Ni+0ZBfWKC
         Mi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740730019; x=1741334819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BmJ/lVzZSA7fl7W+s31zkTISrUXtMIX78WNI7kT6pdI=;
        b=dYsenmeyBN6kehGZqV3vs0hX5lIyHt+aEP+bt0hW/HdR+6Fr0xAu4YgP0QGOPhJHZA
         efRQH8NqIMmy/BgDEmQb4dNusLaN9x1qH35kPrFNgD5ohpl5tmRf0uukkFK57nLuZVap
         ENP1en3Sm0MGZ+Q9oHRXH6V2d35RtZdVrMMoamNpSA9F23grozg5+T2x56+xH6+y1Gli
         mXviSgEzICFtgIM4V4GW3kehbE+UUgfgB+6nmzDNlHHbay6sHjZFmjJhSD2UxvSiqMQx
         iCdBPyqyKM4tpfZvAXhB8JhOTIX5opclHWKmpg8LJAGRDjSzAXEORQPDtJqUpaKcKv58
         t6Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUr+c+L26Zh5UDa5fVJMGilSRwqijcmc3D5FqTiioW98ytWqUCuHb/8xNWt589Im29HTsLmJmNww41C@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo7VF5AwfbyWG4lEcZ0B/mkvW5T/L+vq2Xucwmf8qVV1NLR0LX
	GSs6F15Ifge3FKWnsAt9hLAHlO4nWo+T1MeZmoKFp4PyJxB+L9vYgLx+vcFN8bPeJ5zTMv1a4E1
	3NlenBa4b2/4wvGDcbhhW0LCC1wmPr+vdUzCADw==
X-Gm-Gg: ASbGncsPZhMs1SPYkH2jYORf88jvKff2x2k5lNKKMGfnNMAObp+MSW7ymH82/mE+HqF
	zrhnQGfEmSC8hUmxXvyyCn1GN6mDjAroIMXpWEf4PZ9ytM0+71gZmNfo3kzg/LPXna4wE5PADy+
	K1/9e/96g=
X-Google-Smtp-Source: AGHT+IFX5LCqc4zj+I+fDMMy6Qj3F6HvFKgL0PhFMbmA8t7r07E9HuEUrbEQYDHDQ0S+rIm5ImU6MfGOQWA+OMTAvLA=
X-Received: by 2002:a05:6512:6d2:b0:545:aa5:d455 with SMTP id
 2adb3069b0e04-5494c323289mr943874e87.15.1740730019397; Fri, 28 Feb 2025
 00:06:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z71qphikHPGB0Yuv@mva-rohm> <CACRpkdYOGeDaDUuQQUGwvFNNk7ZuFjkXSMPXL3BJ=4jGEGPkoQ@mail.gmail.com>
 <ce0d802d-6bad-4028-bb57-18bddba5632d@gmail.com> <CACRpkdZtWLGAn0K+xENY+RF6CsWPn0m7R--W9EaH+xTKazALFg@mail.gmail.com>
 <8979f8d4-8768-40b0-a3a7-6638ddb626cd@gmail.com>
In-Reply-To: <8979f8d4-8768-40b0-a3a7-6638ddb626cd@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 09:06:48 +0100
X-Gm-Features: AQ5f1JqtXa1vp8lT0VdJJWyBrFs4qLMArBc_1M7bj9evlmGzfINOXdE_ss7H7Mo
Message-ID: <CACRpkdasQZ26cEv7CCSu75MJH=Pn8a45XQvZmNt4MB=hzTSa6A@mail.gmail.com>
Subject: Re: [PATCH] gpio: Document the 'valid_mask' being internal
To: Matti Vaittinen <mazziesaccount@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 12:42=E2=80=AFPM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:
> On 26/02/2025 12:18, Linus Walleij wrote:


> > That's easy to check with some git grep valid_mask
>
> True. I just tried. It seems mostly Ok, but...
> For example the drivers/gpio/gpio-rcar.c uses the contents of the
> 'valid_mask' in it's set_multiple callback to disallow setting the value
> of masked GPIOs.
>
> For uneducated person like me, it feels this check should be done and
> enforced by the gpiolib and not left for untrustworthy driver writers
> like me! (I am working on BD79124 driver and it didn't occur to me I
> should check for the valid_mask in driver :) If gpiolib may call the
> driver's set_multiple() with masked lines - then the bd79124 driver just
> had one unknown bug less :rolleyes:) )

Yeah that should be done in gpiolib.

And I think it is, gpiolib will not allow you to request a line
that is not valid AFAIK.

This check in rcar is just overzealous and can probably be
removed. Geert what do you say?

Yours,
Linus Walleij

