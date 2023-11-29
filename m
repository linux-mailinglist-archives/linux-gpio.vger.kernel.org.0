Return-Path: <linux-gpio+bounces-683-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A137FD9DF
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 15:43:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 541681C20BE2
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 14:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B485F2FC58;
	Wed, 29 Nov 2023 14:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BwzzGAyG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56486A3
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 06:43:44 -0800 (PST)
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-4b28f8ca7b6so166348e0c.3
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 06:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701269023; x=1701873823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3rmkMM8ESI5mrgpY+hyRZPX+eOseClGKdO3wFuBysPw=;
        b=BwzzGAyGcJvMYxbZHk3Fw6C4CIfcTu4ipU9hvvs0/LWuEljUjTWFRI82IAoZrbEURW
         VD63Ac0nQRGahWdOxWbjruPFtDz4i/Ys0OactYBFWwUQvWtALaj3yYTVO45SjmC9Vjrc
         isutxXfzGaKOn8LNLEAalcDUUSbdiIo8hNnR3Jz+D/CC8J8psRoN6SAgVuGmd/Hidkfv
         w2ZOE/gAjaqy2N0GWNd70t1p/Yt+i/209DMJo2RNuV8ba79mDHUxXkMRXqymrPo8GkBA
         yjgMFhlZs21+vBygzvakvKKhOEtY+AHY1bRoNDVfbs1BVjVqGO6nSLAKCIz/isKHXgrc
         THVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701269023; x=1701873823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3rmkMM8ESI5mrgpY+hyRZPX+eOseClGKdO3wFuBysPw=;
        b=jpdhihUesB5Szw0IZoO/h2R9P6sWdLxbtUmi3F16NOQdmyxMxVNdQdmddEPLMUqEWv
         6/JwDQoKaVuGdSK0zgjx4V/PclLbhBJSc+NfOxkYbrSSy3bD1iMZfTnW/S4xdrDDj03n
         /4kZlosNuFBXHN3EwwSyZhM/QgKkOEVsGZeNyN9Aplso3IGzuwbMPU8Y6mnImwShkGiB
         K+wC45X+CUiL3/OUgXBfFE3cs6l1NTtVf1h0k2wPjmkmjZQBzofkY91nkuZRjdD2XWGO
         q/Alva46VBQPwAmn5YFAtXWZU7htDMCeSwLuB8w0I/sxl3Cea0kdu03keIfgZHp23+1+
         tvfg==
X-Gm-Message-State: AOJu0Yz39s+YIRJrqkB8lFHrgjA0Nz7WHyjM6KoYgenmUnG/VinbqFYt
	EwHosMh1PwATDGdRfmpivOC8y5HZNe22sMYUnXJ6uA==
X-Google-Smtp-Source: AGHT+IGg4feXHlqH1k+LS1haHX894DfH+rp+1nlOgEZHI0wBa6s1+9a8a7exhdIV/QguwIGDn8v54ioBMnVhi7rKoho=
X-Received: by 2002:a05:6122:3106:b0:4ac:22c7:89d5 with SMTP id
 cg6-20020a056122310600b004ac22c789d5mr14312769vkb.2.1701269023361; Wed, 29
 Nov 2023 06:43:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231129142411.76863-1-brgl@bgdev.pl> <20231129142411.76863-10-brgl@bgdev.pl>
In-Reply-To: <20231129142411.76863-10-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Nov 2023 15:43:32 +0100
Message-ID: <CAMRc=MfL2nHF78TUmRjRSUC-2zyMjWotzU7Tv_27mVJPLET40Q@mail.gmail.com>
Subject: Re: [PATCH 09/10] gpiolib: use gpiochip_dup_line_label() in for_each helpers
To: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 3:24=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Rework for_each_requested_gpio_in_range() to use the new helper to
> retrieve a dynamically allocated copy of the descriptor label and free
> it at the end of each iteration.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  include/linux/gpio/driver.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 9796a34e2fee..6405f6d454af 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -543,8 +543,10 @@ char *gpiochip_dup_line_label(struct gpio_chip *gc, =
unsigned int offset);
>   * @label:     label of current GPIO
>   */
>  #define for_each_requested_gpio_in_range(chip, i, base, size, label)    =
               \
> -       for (i =3D 0; i < size; i++)                                     =
                 \
> -               if ((label =3D gpiochip_is_requested(chip, base + i)) =3D=
=3D NULL) {} else
> +       for (i =3D 0; i < size; i++, kfree(label))                       =
                 \
> +               if ((label =3D gpiochip_dup_line_label(chip, base + i)) =
=3D=3D NULL) {}       \
> +               else if (IS_ERR(label)) {}                               =
               \
> +               else
>

Ah, cr*p, it will leak if we break out of the loop, why did I think it
was correct?

Any ideas how to handle this one? I was thinking something like:

    for (i =3D 0, char *p __free(kfree) =3D label; i < size; i++)

would work but it doesn't.

Bart

>  /* Iterates over all requested GPIO of the given @chip */
>  #define for_each_requested_gpio(chip, i, label)                         =
                       \
> --
> 2.40.1
>

