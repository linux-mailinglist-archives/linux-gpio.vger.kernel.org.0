Return-Path: <linux-gpio+bounces-19823-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EC4AB0D3B
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 10:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 690B4505CE0
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 08:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6632741DA;
	Fri,  9 May 2025 08:38:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B1A22577C;
	Fri,  9 May 2025 08:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746779904; cv=none; b=nFRa/zWwWwEJ9Qu8vY8KiDy+r38qLLpDYQkAJlSDtgQXjRQg/zfPGCyCOG6m3qZrcIz/SzLCybESjUoKX2WJk+1GzSwmJLmKBIEcBWm56h+xfMuA5Tsz4RivZiHIVwgpPad8XQOxkshptft957PSDqUxhYOQxCnuTZOgXl/pzk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746779904; c=relaxed/simple;
	bh=fmr4r3BEnQhHzRx/H0iPf40EUakfMySWJkPhts0T/Dk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VPqSYHvrCQ5dyucByZklEl6OxMI1g20S468IIS4JcStmDszSsIiriMV1wlsTlemvpiqktnz3y1NEL8v7vhHfL6WrA2/1MLqzqZKmKYFHG2uJcC+HM0nTuz66g8n94wFZjYTfzDl83torpowvDBlbwX/ZTqQtQvi7H6oSe1eGu80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86d5e3ddb66so516266241.2;
        Fri, 09 May 2025 01:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746779899; x=1747384699;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o6vBjFcppbWx6n+WHaEsE8iJ5qADa6/6dC++ZNGDg6Q=;
        b=juTFdI4C+34ods4vn+2p2zyM9Sp3/MNm+rDOAUqP3p4o66AlNN7MDwLV0onCRpEiD/
         OHSM4EiesMvg2FmyZcnG6KjtZPMSgflwkfI5s9Y21BDD+Apa+9LJ7Fg1vd2mh2FyUxAI
         MNf45QioTK0pXUdoOTYZMd0f54YyMKqkJp5bW4z/PrfnGixqoSEy38FkbwSxiPy8q9Xi
         yuJemJmqLyotZpK994K7jznbIYDltxfVuoZDPh7b9174kluIbB+4zwvCfrfL6oLBq6rD
         aTe8uuckMgFQo2EZGn4zf3u4mc+p72TVGD+TV2tnC7rgPxAGWh8d9v3FLuDICh01p9uh
         19wQ==
X-Forwarded-Encrypted: i=1; AJvYcCUux4jrXVLNQBfY25cFqfbeJiFeO3OkVnd9l6BjwuWd7BW52NawHh8U/UDxBEX0xXEWqkT1IqsVdlj1yw2f@vger.kernel.org, AJvYcCWy0z9fAX3yIGPP7YuhTBQXaObpkUZR/B/jaEVApSfkEIhpskHE3tdB8L+lOsywR2eX9Ewmh+xwHrUW@vger.kernel.org, AJvYcCXJjipXXdOFUCmMAXbDSHsDT0PHEXiJNewMGFFD7vxoFJHrIWBHMXgfqIZXZCNE7IMztMoFr5SfN2tHGEriqijb@vger.kernel.org
X-Gm-Message-State: AOJu0YxEZBXj0EH0agjCDa9eB0v0qkOxkZwdpY1GpM48VOUpRfTP+pHs
	2GQ301eLR/xNzLGC+vpHac9ShBRy2mOnwRAVlBzdUtt66jWq1lLJdgDpfWaZ
X-Gm-Gg: ASbGncsHdALqzmCCnJl/TE9W87lDwz8DxKAp+9u9c+IAhx3sEu+7mGHQXyxwqnoGo80
	3lpNUGeKerOChTVI5z4oZtGnf5aS4TVyYOwKaZrmV48KdtOgiNuTmZD42EOOMLKPr1xGw6VvCzr
	RTMPOSOrQ901PP3xo/fBqTCgBvQk5Nqqdlk+HD3WqfahGK37YrRU5HR35wCpFD7qTJnSjBQ8waU
	Kig+CjjlhwNQR8uopuekrix+A8SkvduBMWZRtIRJ+Zd84fNFs0WdWXRObvEYEsAvuNC6sPRkO9I
	H2RLdxB2VIB6C518xTfsCHcyhjpk16egCa2UPobrfb49itycc+N3hYqt+EjoOjaiZ9EBKVFYdel
	aAMBxol8=
X-Google-Smtp-Source: AGHT+IFoh+G6QdcQx8yuTu16ZDoS0j36I6y1KaidTzvEKQS20poKTsrrxZUtTNsrbU++mqw4ayzsnw==
X-Received: by 2002:a05:6102:800f:b0:4c1:9cb2:8389 with SMTP id ada2fe7eead31-4deed30e640mr2113947137.2.1746779898999;
        Fri, 09 May 2025 01:38:18 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f61982eesm722669241.19.2025.05.09.01.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 01:38:18 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-527b70bd90dso713866e0c.3;
        Fri, 09 May 2025 01:38:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/393rVLiHn1rz9Kabt8rw1yRajT5QUh0oz6PG9tMoOwShJcT94RR25N/kQhKctRbigU+17qhbWipZmij9@vger.kernel.org, AJvYcCVhcftghJUkZIrng/N37atxKbWAL2uhaRorAT7SGq0OwUAUbgIOJgAmkWD3pI8qvQN7sEKnpo/5im/C@vger.kernel.org, AJvYcCVk1WmPSpQEhe6b7IoNywjpE7ykfeSkkIzWy+OcLSgqBe6sJ8OsyevkmsTo0z6fDGVV4XvOV8sOhH1zZh3ZIZDN@vger.kernel.org
X-Received: by 2002:a05:6102:fa8:b0:4c3:6568:3e18 with SMTP id
 ada2fe7eead31-4deed37048dmr1886205137.15.1746779898071; Fri, 09 May 2025
 01:38:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-5-3906529757d2@bootlin.com>
In-Reply-To: <20250506-aaeon-up-board-pinctrl-support-v5-5-3906529757d2@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 May 2025 10:38:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVLo2w609eFOKRkYAfEMb8XOTNB-XzzZn_89VM-YV_-kA@mail.gmail.com>
X-Gm-Features: AX0GCFvJSiFNvcVDdNdJn2WdyrzyZvvL3Z-R_r9rdaO_lM6jAipfu9beQmHxVro
Message-ID: <CAMuHMdVLo2w609eFOKRkYAfEMb8XOTNB-XzzZn_89VM-YV_-kA@mail.gmail.com>
Subject: Re: [PATCH v5 05/12] gpio: aggregator: refactor the code to add GPIO
 desc in the forwarder
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

Thanks for your patch!

On Tue, 6 May 2025 at 17:21, Thomas Richard <thomas.richard@bootlin.com> wrote:
> Create a dedicated function to add a GPIO desc in the forwarder. Instead of
> passing an array of GPIO descs, now the GPIO descs are passed on by one to

one by one

> the forwarder.

Also, the passed array is no longer stored as-is, but copied.

>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -509,6 +509,10 @@ devm_gpiochip_fwd_alloc(struct device *dev, unsigned int ngpios)
>         if (!fwd)
>                 return ERR_PTR(-ENOMEM);
>
> +       fwd->descs = devm_kcalloc(dev, ngpios, sizeof(*fwd->descs), GFP_KERNEL);
> +       if (!fwd->descs)
> +               return ERR_PTR(-ENOMEM);
> +
>         chip = &fwd->chip;
>
>         chip->label = label;
> @@ -528,6 +532,36 @@ devm_gpiochip_fwd_alloc(struct device *dev, unsigned int ngpios)
>         return fwd;
>  }
>
> +static int gpiochip_fwd_gpio_add(struct gpiochip_fwd *fwd,
> +                                struct gpio_desc *desc,
> +                                unsigned int offset)
> +{
> +       struct gpio_chip *parent = gpiod_to_chip(desc);
> +       struct gpio_chip *chip = &fwd->chip;
> +
> +       if (offset > chip->ngpio)

>=

> +               return -EINVAL;
> +
> +       /*
> +        * If any of the GPIO lines are sleeping, then the entire forwarder
> +        * will be sleeping.
> +        * If any of the chips support .set_config(), then the forwarder will
> +        * support setting configs.
> +        */
> +       if (gpiod_cansleep(desc))
> +               chip->can_sleep = true;
> +
> +       if (parent && parent->set_config)
> +               chip->set_config = gpio_fwd_set_config;
> +
> +       fwd->descs[offset] = desc;
> +
> +       dev_dbg(chip->parent, "%u => gpio %d irq %d\n", offset,
> +               desc_to_gpio(desc), gpiod_to_irq(desc));
> +
> +       return 0;
> +}
> +
>  /**
>   * gpiochip_fwd_create() - Create a new GPIO forwarder
>   * @dev: Parent device pointer
> @@ -559,26 +593,12 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
>
>         chip = &fwd->chip;
>
> -       /*
> -        * If any of the GPIO lines are sleeping, then the entire forwarder
> -        * will be sleeping.
> -        * If any of the chips support .set_config(), then the forwarder will
> -        * support setting configs.
> -        */
>         for (i = 0; i < ngpios; i++) {
> -               struct gpio_chip *parent = gpiod_to_chip(descs[i]);
> -
> -               dev_dbg(dev, "%u => gpio %d irq %d\n", i,
> -                       desc_to_gpio(descs[i]), gpiod_to_irq(descs[i]));
> -
> -               if (gpiod_cansleep(descs[i]))
> -                       chip->can_sleep = true;
> -               if (parent && parent->set_config)
> -                       chip->set_config = gpio_fwd_set_config;
> +               error = gpiochip_fwd_gpio_add(fwd, descs[i], i);
> +               if (error)
> +                       return ERR_PTR(error);
>         }
>
> -       fwd->descs = descs;

So the passed array is no longer stored, and thus the caller
(gpio_aggregator_probe()) can free it after the call.

> -
>         if (chip->can_sleep)
>                 mutex_init(&fwd->mlock);
>         else
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

