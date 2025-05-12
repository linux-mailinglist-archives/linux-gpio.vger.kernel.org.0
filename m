Return-Path: <linux-gpio+bounces-19968-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F28EBAB3ADB
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 16:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7803A17E608
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 14:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E828229B1F;
	Mon, 12 May 2025 14:42:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A48A1E25F2;
	Mon, 12 May 2025 14:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747060966; cv=none; b=PLYNXeYPc+OHQdm1JD1z+nyzttvs3plnaXj73hjaFYuS02SnMRiOsDWNRQYBr+z7afltk0GP1D5JKPOt/8wanXub0ADto4fUqF0rdeuGh+6Z5dlgVFs16ijybE8D6AUf9VVGZfos0uhZChP0noK2Wa2ankyjsGcNhNdrLDNhjek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747060966; c=relaxed/simple;
	bh=/zeZk37/Sv3KCF0ywu3fxUm22KdgIlQIHMvT60KwLw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LJcMDPyJuzwQMIh4UMrAx7tH1gl/x/GTozKJHTk4IrKW7druRC0nsHzFj/3VYYRaaegYAt8KNVGp+6/R3uB9PxY5ASIbu5wM0Z4hwx+S0sFINjkIOnyM9m4s/XIP8yBCuTH69XYhPanxvv3XkXIU44v32xOGmzI6mRERJv/St08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-52934f4fb23so3801068e0c.1;
        Mon, 12 May 2025 07:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747060963; x=1747665763;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+YmUH1CSfFZhqrgXJQPbodZECFT0KSPOD8Th8GJ69tE=;
        b=WZ4il+mzlfd0oSiwYnRyvLWKx5NNOpr6at25tR3VKq/7rmv+Tp0AE96IiTnwgeYiui
         18Ks3MytL/NRn7xUy6s14sXAEuQolWtpVG8ldSGroYAXHmqAToyRF067ARLTKqFbX4eo
         OFcAllpJFVYIE6+E908c3EUaNlnJQ/OHXn6tct36ZUWQXsqrowXWlFAWb6ZzVmPYxTUr
         L5O2F1yIiLaAeMCKKP52LN5F0pD5/+MVhgbEYNXRmHbjM520x5yHSAgFO5f1lp7+igSO
         VOI7eeSD00PiocWsCTvD79VZp614DzBcv24kRtKu7U/nGkbVS73Jcikd7RR2jYz/s8Gy
         ERYw==
X-Forwarded-Encrypted: i=1; AJvYcCUOZyw1J3TvJsU6s8pMGmf7XN0ZjNEHsKJVmrklHUoyDk+pAh6zUhjnprRxrin8CswpzTaVVRS232EvcEgP8DYA@vger.kernel.org, AJvYcCVIIodkDrG2VkMUe9EYu+POCctPnYE1v1qzPLVzJ9pf6RWem420JH8oznmZn2rNTLX9EZUTG5/scFTsnA4A@vger.kernel.org, AJvYcCXApXYjC03y8iCF1/lToTRJt1M92Ti884ab0G7uIwwrnVz/2Xeh0kLmWcjBcfD3zYOQzE467fPKLrhH@vger.kernel.org
X-Gm-Message-State: AOJu0YyxOghhTukGL2cTuzcDCusgm2M0cE024gb1j/9GDHi7ta18uXPL
	qzRr4UyvVRVx1jWqOH8qGhM5/l26AycKBCLpYBHkcBcWQX6tvuLwxlqERUgk
X-Gm-Gg: ASbGncuxJFDkqwZqESpP2n8WWqVwftW2ZnaWaNGO+H5nW3uZJHqvIUlsEIjjgJVsB4H
	nF5QpgMJMvuKO1h2WpLeyQ3WucybsgcWo6tzOzfvG3LnZDsxIZLgjdoAUvOBFIsaqkXhXMvv4ya
	snfASq2EN4WnJo/aklgDl+lFow+/OZ/mGX7cSYLJgKY0O2oHGIyn7B7VDUPTVB5eZEcxvG03Nnp
	KpwTEv1InV+SqFBQcE7Rl5UrDHwVdIi3MqwGQbHCmfmOkgOo/JwFwpbmoDlwtfPpoOxBgU4hh3j
	SIdpRIyFwagtFUtwud3739xaBtfuzwJI6bzIofKxNguIORHZV+j8tJBN/ehqhllEb7mWpSkEl5i
	MvB8eQrhfahBcXQ==
X-Google-Smtp-Source: AGHT+IEJCAYBKjmFK0kALYhBAXU+qHXb1nvr8z7J+qvSff8tIG+exRgQKlDVNWnKIwDSrogi7HOf7g==
X-Received: by 2002:a05:6122:a17:b0:52a:7749:b517 with SMTP id 71dfb90a1353d-52c53dde312mr9520646e0c.10.1747060962733;
        Mon, 12 May 2025 07:42:42 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c53758c87sm5789613e0c.21.2025.05.12.07.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 07:42:41 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86fea8329cdso3214297241.1;
        Mon, 12 May 2025 07:42:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBbrj+B6xW+BJ/EbmC9Fbl/psvXRyOvosbAM8AcBKqcl2VMfxFRk4HenXgQAuOfrhlLupO62gyo1xNrUiW@vger.kernel.org, AJvYcCVnLGCOHrvWge3FIUUJalpenrYgfY5I8/LfJRLzxDOo3HbGmGbKcIvmVf1YKP2u9FA0U/s7XNoXPtwb@vger.kernel.org, AJvYcCWQGeRS+RQSNoJY6/wemOckvglnP+WjoGnM5sryeuQzq3e2ldZtLQLg194EnE0gN44TMS59PB7/Ay3UGRmgcYoO@vger.kernel.org
X-Received: by 2002:a05:6102:f96:b0:4c1:869b:7db4 with SMTP id
 ada2fe7eead31-4deed340270mr10798768137.9.1747060961078; Mon, 12 May 2025
 07:42:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-8-3906529757d2@bootlin.com>
 <CAMuHMdXzU1k_JZ0UhUh33XCq_zpq6MBJgAjo9F9Cw4gckA12EQ@mail.gmail.com>
 <c10b7752-cec5-483c-90a9-ada16aa0904a@bootlin.com> <aCIBoSi84NnwEA2s@smile.fi.intel.com>
 <b5b24b98-ae89-4d50-90cb-c2bbc38aafba@bootlin.com>
In-Reply-To: <b5b24b98-ae89-4d50-90cb-c2bbc38aafba@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 May 2025 16:42:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWzHqdFyLB1YTK59y81khWxs2Kbev69qbQULBCGw7RcfA@mail.gmail.com>
X-Gm-Features: AX0GCFu1xBr7zMqK6ypaMPPajLwN01lziJdcwKnBBfj-ACqTX8-JAXYo_Ubth6E
Message-ID: <CAMuHMdWzHqdFyLB1YTK59y81khWxs2Kbev69qbQULBCGw7RcfA@mail.gmail.com>
Subject: Re: [PATCH v5 08/12] gpio: aggregator: export symbols of the GPIO
 forwarder library
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Mon, 12 May 2025 at 16:30, Thomas Richard <thomas.richard@bootlin.com> wrote:
> On 5/12/25 16:11, Andy Shevchenko wrote:
> > On Mon, May 12, 2025 at 04:08:35PM +0200, Thomas Richard wrote:
> >> On 5/9/25 11:07, Geert Uytterhoeven wrote:
> >>> On Tue, 6 May 2025 at 17:21, Thomas Richard <thomas.richard@bootlin.com> wrote:
> >
> > ...
> >
> >>>> +int gpio_fwd_set_config(struct gpio_chip *chip, unsigned int offset,
> >>>> +                       unsigned long config);
> >>>> +
> >>>> +int gpio_fwd_to_irq(struct gpio_chip *chip, unsigned int offset);
> >>>
> >>> I would expect all of these to take gpiochip_fwd pointers instead of
> >>> gpio_chip pointers.  What prevents you from passing a gpio_chip pointer
> >>> that does not correspond to a gpiochip_fwd object, causing a crash?
> >>
> >> Indeed nothing prevents from passing gpio_chip pointer which does not
> >> correspond to a gpiochip_fwd object.
> >> And it is also a bit weird to pass a gpiochip_fwd pointer in some cases
> >> (for example gpio_fwd_gpio_add()) and a gpio_chip in other cases.
> >>
> >> I can keep GPIO operations as is, and create exported wrappers which
> >> take a gpiochip_fwd pointer as parameter, for example:
> >>
> >> int gpiochip_fwd_get_multiple(struct gpiochip_fwd *fwd,
> >>                            unsigned long *mask,
> >>                            unsigned long *bits)
> >> {
> >>      struct gpio_chip *gc = gpiochip_fwd_get_gpiochip(fwd);
> >>
> >>      return gpio_fwd_get_multiple_locked(chip, mask, bits);
> >> }
> >> EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_get_multiple, "GPIO_FORWARDER");
> >>
> >> So exported functions are gpiochip_fwd_*().
> >
> > Sounds good for me. Let's wait for Geert's opinoin on this.
>
> Regarding Geert's comment for patch 9/12, an other proposal for naming:
> As mentioned above, exported functions gpiochip_fwd_*() take a
> gpiochip_fwd as parameter.
>
> But for all functions corresponding to a GPIO operation add the gpio
> word, and for functions to add/remove GPIO descriptor add the desc word:
>
> devm_gpiochip_fwd_alloc()
> gpiochip_fwd_register()
>
> gpiochip_fwd_desc_add()
> gpiochip_fwd_desc_free()
>
> gpiochip_fwd_get_gpiochip()
> gpiochip_fwd_get_data()
>
> gpiochip_fwd_gpio_request()
> gpiochip_fwd_gpio_get_direction()
> gpiochip_fwd_gpio_direction_input()
> gpiochip_fwd_gpio_direction_output()
> gpiochip_fwd_gpio_get()
> gpiochip_fwd_gpio_set()
> gpiochip_fwd_gpio_set_multiple()
> gpiochip_fwd_gpio_get_multiple()
> gpiochip_fwd_gpio_set_config()
> gpiochip_fwd_gpio_to_irq()

Sounds good to me (from a quick glance).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

