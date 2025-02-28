Return-Path: <linux-gpio+bounces-16773-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0121AA4935A
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 09:23:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C8FE1613C4
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 08:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B9F424395E;
	Fri, 28 Feb 2025 08:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="it1AR6gi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304631FDA9B
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 08:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740731013; cv=none; b=WqqDpaeCMSeDgtxxubYC6N4GZ0z+uoOjta5CWb2oKWSVXmO2G6Tq1Otxt9psnEMIF0LMOCSTCAkjE3BrMXzxj1HwLFOV0bb4KD1NxDpQZjuDe+OVqyTeLYnIsHTA2+lKOnFcPDdPI6Ld9iMHYNGtIvGAYKZFlEfm9KBn+LDZfzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740731013; c=relaxed/simple;
	bh=R2MRTRMr+W9eU/udrGmceJQKzw74JG9DRcT8CxcYlD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fK+Ffdxb6Y41yLBL0UWogk2PRCV72D2uD82ycLh/ES5luzZmDYKOnR2ow5SUi+jHGYByiOU/6y9lR07O5DFRTJfuzAnNyHrztkpwcpZlyGQAKaVqZnJBUcWbYUXKG8Y7Fgoqi/t3PK2rL4Bksmtr0lwudysAuo8WKde5Bt5M0yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=it1AR6gi; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54527a7270eso1818661e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 00:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740731010; x=1741335810; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6CmQnr9nJmjwVIpC9L7TXMlfKzgO8vBaB5ebrTKh4k=;
        b=it1AR6giXuMT7UtAuCHfdr7Hp59a7tatYQXOAdc1a+NFxw0ZwwasC1mn3f9XN9qGNX
         AnZ/HHKSTe69tD7E0GUIxoBsPcAw21lpfZbLQzovdXrTm0DhSleY5eGnyapDYDcocksc
         8xqujCNmMY5wKyp3PLRr7opt3mqh7GCg9Nv74lTBXBlSe0gYyv3uZbOwfb6cpAHTVUCB
         ksL3oArmiHmCtX1I11Q7m0oUE9lAvvtr46vIyuhfyKvz6p4enDg8kUtZyW8V/F10/Dih
         m1dqFjNCHG0STE0iKEzHsEzIMksvI9N0v5CGBueekluEPfEnazCb0W+dS1PxUrbbRvCO
         FC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740731010; x=1741335810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6CmQnr9nJmjwVIpC9L7TXMlfKzgO8vBaB5ebrTKh4k=;
        b=uogmnm5gNj7cebnaXv1KprkiANM2FCfO1e1nT5Q7vo8dWwPNqkOQSmxRLNkg3fzRBp
         i3ZpvvOwHw61apMKC5K7n0fmGQgfC4/xsUsNupypJ0BfGWWlpwAAotHFMuT76Srwmv1I
         BqUk+YpXk0VzNaUceYzHoUgU0KK3Dg/JyRCiuPbHenCHOkQYVbICWg1khVPrip7/vNyJ
         vHeUllHXzrqrTytVxXNn81SlIb/bwDZLFRw80JX54b4+uaxup6Ev4bJ2m7hY72Nnf72v
         fmScLPL9N4ouoS6vhiMBl3yATLO9lxtWZZ5LA9xmZNwV9l40w/Qv2tSig4uUXw/lrxt1
         4keQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp+iQTjPgG/rJ5UuMl3gkRyKRSpARoNU4nszCSSX/YuhQu1R1OYIkV5srYkDwzuEpmtV+SNo/LArdg@vger.kernel.org
X-Gm-Message-State: AOJu0YztR0R0d5qM+xSKH5FS2ykuM626AhstDNh4xroq4yfIQ7UE8EjS
	NRM/aFwTUeUwSVI2QIL72gittOgcIfdzm0enRFxr5/Iw+HnwPJn8vYzWj/514rNdQ2ueO4DDH1h
	ldlgHNRl9TuKmCHP03uA/w2YTGVQgDY+OFUvQ4A==
X-Gm-Gg: ASbGncszGBtsPiCRIDmcg1pVPFr9uZP9wuSU0cSNJTZhObZBlxw8+XreOj06soFXvf5
	tYnMkqQuroLmMr9zimZCDAIR+1ZCQYAxarFQVbvI5iyJmWKZmdRA4GFxvdZwvbT/QCkPvx7SjoS
	pzWohm2FE=
X-Google-Smtp-Source: AGHT+IH1bE/hdaIBMayw+gGpM9k5nGDh5XFnSS7BihMAS5lMqvifednGcS3mKS9CRv9UyLY40VYo/FzdFubU5gvJfnI=
X-Received: by 2002:a05:6512:3a90:b0:546:27f0:21a7 with SMTP id
 2adb3069b0e04-5494c38c10emr1014114e87.49.1740731010148; Fri, 28 Feb 2025
 00:23:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z71qphikHPGB0Yuv@mva-rohm> <CACRpkdYOGeDaDUuQQUGwvFNNk7ZuFjkXSMPXL3BJ=4jGEGPkoQ@mail.gmail.com>
 <ce0d802d-6bad-4028-bb57-18bddba5632d@gmail.com> <CACRpkdZtWLGAn0K+xENY+RF6CsWPn0m7R--W9EaH+xTKazALFg@mail.gmail.com>
 <8979f8d4-8768-40b0-a3a7-6638ddb626cd@gmail.com> <a7ab9d47-cd17-4098-b2ba-d53dfc19dbed@gmail.com>
In-Reply-To: <a7ab9d47-cd17-4098-b2ba-d53dfc19dbed@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 09:23:19 +0100
X-Gm-Features: AQ5f1Jo20gvTk170DYVLWFd3aItRoAfaOdggSzyNA14E_0d2W-2xhzX4PDw9OD4
Message-ID: <CACRpkdafJfmuO++XXSFha51Q5=9DrqqRtxOpNeUsmvy7BHrC2g@mail.gmail.com>
Subject: Re: [PATCH] gpio: Document the 'valid_mask' being internal
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 9:24=E2=80=AFAM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:

> I did some quick testing. I used:
(...)
> which left GPIO0 ... GPIO6 masked (pins used for ADC) and only GPIO7
> unmasked.
>
> Then I added:
> gpiotst {
>         compatible =3D "rohm,foo-bd72720-gpio";
>         rohm,dvs-vsel-gpios =3D <&adc 5 0>, <&adc 6 0>;
> };
>
> and a dummy driver which does:
> gpio_array =3D devm_gpiod_get_array(&pdev->dev, "rohm,dvs-vsel",
>                                   GPIOD_OUT_LOW);
>
> ...
>
> ret =3D gpiod_set_array_value_cansleep(gpio_array->ndescs,
>                 gpio_array->desc, gpio_array->info, values);
>
> As a result the bd79124 gpio driver got it's set_multiple called with
> masked pins. (Oh, and I had accidentally prepared to handle this as I
> had added a sanity check for pinmux register in the set_multiple()).

But... how did you mask of the pins 0..5 in valid_mask in this
example?

If this is device tree, I would expect that at least you set up
gpio-reserved-ranges =3D <0 5>; which will initialize the valid_mask.

You still need to tell the gpiolib that they are taken for other
purposes somehow.

I think devm_gpiod_get_array() should have failed in that case.

The call graph should look like this:

devm_gpiod_get_array()
    gpiod_get_array()
        gpiod_get_index(0...n)
            gpiod_find_and_request()
                gpiod_request()
                    gpiod_request_commit()
                        gpiochip_line_is_valid()

And gpiochip_line_is_valid() looks like this:

bool gpiochip_line_is_valid(const struct gpio_chip *gc,
                unsigned int offset)
{
    /* No mask means all valid */
    if (likely(!gc->valid_mask))
        return true;
    return test_bit(offset, gc->valid_mask);
}

So why is this not working?

Yours,
Linus Walleij

