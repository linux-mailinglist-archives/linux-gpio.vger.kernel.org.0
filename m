Return-Path: <linux-gpio+bounces-10335-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE3397E33C
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 22:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B7C52811A1
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 20:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1CF26BB46;
	Sun, 22 Sep 2024 20:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E3Zy0q8T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F282AEFC
	for <linux-gpio@vger.kernel.org>; Sun, 22 Sep 2024 20:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727037069; cv=none; b=U9Ny+lVW3rpJ2phay1ELCUaEYgOS1lrGciAZrYNeuUMpIAMxMK4fORPSO2U0P6+N6OrRgtADXi9KpRLWOSvxi97P4BJaoxHN61LJprqWPtIZh+tdhO8ULcV85qKsNSPFQe7P4k5roD/eMMGmcQLBFFzXU6SBvDGC12atjeuH/w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727037069; c=relaxed/simple;
	bh=AsPfUYcQ5eRxOsGeI6ZCtO5bcpyczJ9lmXOCqxwZg8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qECYtXKgpmiaPWjvC2bLKQVd78DbyqzSfdrlF3eYDcYTtJLbVn0Wzm1BM31Lfzb6h4Yf42vBpJnrVmWbEoJNkK5Q+rK9JpmlCFskTQ35Lt8tKvNmhxBS8KHoGIcC0JO+iAS+VUO/kkG5B2E6PLCuo2j4N6MTfm+m7kMjsLyJvE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E3Zy0q8T; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5365cc68efaso3711802e87.1
        for <linux-gpio@vger.kernel.org>; Sun, 22 Sep 2024 13:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727037063; x=1727641863; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBsT82UqSPJBFakORyX4WBDQ0ZXAcikr2Kh+gsVjIiY=;
        b=E3Zy0q8Tc18XePatDcusyUW5+GSmseQbKNzb1BsZctWW3iIaww2snZbjof1ezlfuRR
         rItO75/8cHJ2SNZWk7g+iOjkjIt4WyFuEJtTanuUn9aw8eZ8WPVBIcDbCK2K90HD4r7Q
         zulwRJK++AO7MbhbVZM8fTWBcd6LVQ447e85FjKPXUZjPNYnrepuSxILc+x6AtW/NF0T
         gsxzKXXdRjlrM4hCvU4F47Qhtr5nA8oAIzfxzuqZIm4m5ZA5tiO2iT63PEznx/rmqh2d
         1WhLQz/CHpWxx3P7GQN9E6HctFoiPPXsL/7tiDF3mY5HQFP4QUOJtKWeD03H3ouskEyN
         zf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727037063; x=1727641863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pBsT82UqSPJBFakORyX4WBDQ0ZXAcikr2Kh+gsVjIiY=;
        b=SKb/hDWmutNTgOcIcBxGey9c6rjbYiwR2/5ZH5xVqolEyoh+wcb+/KKuHRbMtac9JW
         NkxlfrhqnPG0xX/6XNqTQZXeRbdrQ2JdMqsS8Rfi7CW/j236M8qRQ2sw5g+czCIBZkVi
         sgEgKHlsFlthafvAxrjRfCW8YGSl5QDpWuKrBnudku3VNDk30JjRzLKnjV3d9FWm0dwY
         IvcNXwtZze0nvrpaPVsMGJFAiatCEKNhIW9IZowb3vJW+2GVA4QS1CciDTnR4HtC5w7A
         4sKIzBr13bHxS5ksAazkyvE22vyt1xU5o84efHu8jYdmlXKIWZo83ommzuDucHOVBfxP
         3MdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBZz7wdKwQMiXd1OmM/lF63s8svtkB+jEKnj8vfPKULfCoQsdQ3s9X9yWMDsLNLo8uhi4jUEwB0rot@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8+I35NgW1c5jXpDmhUzEXai3ACcbFbMlQPeh8xwIqJ6BqheMM
	wC6wyR+owRUx57JDrOnkRSrnIFnUSD93JVd1QBsIbbGGGw+nnuwSTgJxbvW4Pcs7lh4LRzCPEcA
	x88sOr1W16KGQuyfWX0epTl+wralZLWbDtxDyhg==
X-Google-Smtp-Source: AGHT+IGb/YDhaVlvSnxpkzsXQ0zE8s/Nw3hWqhyHUWjqtW5ddF9UoGabLCcTF8KwT1Q8QK9adnY1TvnYB7AwOfbYjsE=
X-Received: by 2002:a05:6512:31d4:b0:536:57fd:f307 with SMTP id
 2adb3069b0e04-536acf6b1f5mr4628769e87.7.1727037062714; Sun, 22 Sep 2024
 13:31:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240919141014.4000958-1-mstrodl@csh.rit.edu>
In-Reply-To: <20240919141014.4000958-1-mstrodl@csh.rit.edu>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 22 Sep 2024 22:30:51 +0200
Message-ID: <CACRpkdZ6WuC6Ak3n2Dg8VFrv2-kpiuaMYeFaiSeAX9HEiNcf0A@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: add support for FTDI's MPSSE as GPIO
To: Mary Strodl <mstrodl@csh.rit.edu>
Cc: linux-kernel@vger.kernel.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mary,

thanks for your patch!

On Thu, Sep 19, 2024 at 4:10=E2=80=AFPM Mary Strodl <mstrodl@csh.rit.edu> w=
rote:

> FTDI FT2232H is a USB to GPIO chip. Sealevel produces some devices
> with this chip. FT2232H presents itself as a composite device with two
> interfaces (each is an "MPSSE"). Each MPSSE has two banks (high and low)
> of 8 GPIO each. I believe some MPSSE's have only one bank, but I don't
> know how to identify them (I don't have any for testing) and as a result
> are unsupported for the time being.
>
> Additionally, this driver provides software polling-based interrupts for
> edge detection. For the Sealevel device I have to test with, this works
> well because there is hardware debouncing. From talking to Sealevel's
> people, this is their preferred way to do edge detection.
>
> Signed-off-by: Mary Strodl <mstrodl@csh.rit.edu>

Interesting device! Is it working nicely with hotplug
and using libgpiod for userspace access?

Overall this looks very good, some comments:

> +static int gpio_mpsse_get_direction(struct gpio_chip *chip,
> +                                   unsigned int offset)
> +{
> +       int ret;
> +       int bank =3D (offset & 8) >> 3;
> +       int bank_offset =3D offset & 7;
> +       struct mpsse_priv *priv =3D gpiochip_get_data(chip);
> +
> +       mutex_lock(&priv->io_mutex);

In all instances of mutex, I suggest using the new guarded
mutexes from <linux/cleanup.h>. I this case just

guard(mutex)(&priv->io_mutex);

And then the mutex will be dropped when the function exits.
Tighter scopes are possible, just:
git grep guard drivers/gpio/
for a ton of examples.

> +       /* MPSSE directions are inverted */
> +       if (priv->gpio_dir[bank] & BIT(bank_offset))
> +               ret =3D 0;
> +       else
> +               ret =3D 1;

Please use the new defines from <linux/gpio/driver.h>:
#define GPIO_LINE_DIRECTION_IN  1
#define GPIO_LINE_DIRECTION_OUT 0

With the above addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

