Return-Path: <linux-gpio+bounces-19967-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1953AB3AD3
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 16:40:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 430CB860089
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 14:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9790622A7E7;
	Mon, 12 May 2025 14:39:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF01E22A7E0;
	Mon, 12 May 2025 14:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747060797; cv=none; b=bEH6uFtBAE0mtpFuD76bTGYmpsAHdsxgI+s3qbYErq2PSvmTXDF3WWeFyPZMEx7y0i624GMbqtDCYFEDpXr6MPV2pixKnL/+36yNZYpcUUWLSMIvzK9VcazH9Dzl2slqOm5T0f2EPgBzZWrqEaB7QPa+KCjkvwVqCXF7k5rXHYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747060797; c=relaxed/simple;
	bh=Y17awEESg2LErrL8JCmdKRYQ5sEkFBnsWygtJqC80NE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pEotVJCuRRx29J2yRHETYoUgtkmCkOZPQimX2ykc+Aj/KQyZiyLDIlS0WuVIcK541E4elLnxduzmCtCVvm9dGZF4el13Zsnrv1EEKogjf9APMrCMOmPpHjHXRqHlwUGajh0cbgQ5ATK6aFA4fYtuOSeQb/zN7PNDK460EZI3dhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4def6955e85so1107788137.3;
        Mon, 12 May 2025 07:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747060794; x=1747665594;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=05JsmMNwJva64+BtkCkZpam/OAJPWNRgxTT4dtTVxqo=;
        b=P0UcKAMUWZOtsuKaqUfZHCnngc53rwvCzTR0jAYNfyrukVvmpb0+DhebfwXXdLKcC0
         OgEf1LbLb0I1Jc1mMqfKBvjxD0FDQ2OGOMOVeSXbaJNsLDMB8lrih8uCl2bgL16scM2W
         qclVBw4yZfcvNYExE48RFaHGkgoUKe3lOiNCrf9yJMZoDxD/8EYIKfgGY19o7aa3Y388
         dzDjDFVIfA29R94zFj0WXu7V1WrqjieMYh7duTRoI8rvFq/K5HGhYnA9xob/4SsHYKKN
         35IWtCLY41PVE880hfw5ICAD5meFGQxd3htFxFGyD10eASr4cWhzhURDX/rJfX/XZXEa
         XSEg==
X-Forwarded-Encrypted: i=1; AJvYcCWDTaHCkMAUlvIzu0VHZ9itjYmaN3jxKYUcU4E87YQFXWNcuqQFL9Z+FbqiudUX/oalSykrTxQ4ojMGzw/MuUK+@vger.kernel.org, AJvYcCWdBdUnGYRbkM58HG2ienOpF20WzTxBbY7Nrm5IIhmLQ76jDWn6DHPx8yYsTuIUMiLIf2iu/o/ca2jZ@vger.kernel.org, AJvYcCX4UTmmnMQX3hhIPK8yOamAvgf0xDBYUMSNM/jcqFyHrmEF0kfp7yXvOhKY9g+Ew5TfqUyi9wBQxk4WMb9Y@vger.kernel.org
X-Gm-Message-State: AOJu0YwVGqjoWGFyQXOsF3AtD5dYrZ3S1/fH2MumC2zv3ldejfdHzOtU
	vjcG6zRG30moqJBQTHNRqrCKyA4G1reM+wQ5XU2otXDwwZ3nbm84ABS53FqP
X-Gm-Gg: ASbGnctrQdNT0yVu/tvV3wZ69Nb+TrUkMYY9xbRNZFBX5Krz14lxrHFR1COLYFvhkLO
	gPPKaIoPCpAITAuqrwcFO+gGLS3tYPEdV30OX7u9GaKKombLRT1rKOHWfSaoKbv4XI69rW4i4g5
	RYQsKzAZ3UW9Xy9srvbW5sKVBlbjnVjMCwTYf/KwcBh+08dnGW5AOYKrp6oSIhABS2ZbiYIALQn
	x9y6QcMPJmcUJDowtZLoUn2P6vpTSVS+rT+7BTQpgoV6rCHPvFNPI/Wvtwi0OB1FZluUHisRnK6
	rBTMQRWgDYO+4uQV/bacp+lrszvKjNa7Rv0GAhs8uz61t3HrQD+vHmal/8+WmlpAtRdeUhEaIQE
	5maI+ylfIkwXTfA==
X-Google-Smtp-Source: AGHT+IF4bn8Q0Bij731smAvLbxSOpYh4jfFMTGmogTexjXrEcLLtAbNovk3mnCEAym7NX0KulPVWFA==
X-Received: by 2002:a05:6102:148f:b0:4b1:1eb5:8ee3 with SMTP id ada2fe7eead31-4deed3ff7d2mr10726549137.22.1747060793998;
        Mon, 12 May 2025 07:39:53 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f6171564sm5104061241.13.2025.05.12.07.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 07:39:53 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4de317a6fbcso1554176137.1;
        Mon, 12 May 2025 07:39:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUpx95Y7pybsXvCNuE+zEVnQTl6g2ktzyV1zHXbnIgKW0wjWvrDdrG+y4kwBSyMBTvwKmBfxV4fSND@vger.kernel.org, AJvYcCWRKnXHZrjNE2+MgiIo88LWGKtQ6ap36NB5BifImLNAcV7PP9v84ZSxB1Fjix8i764+iUtgzZqeherAUvif@vger.kernel.org, AJvYcCXe34r8ktpZs7jN1iftzc0dI9jjoTvdI6kfAYMtC5Z/wS4o2Bw+6N7ZHhNphII4CnFWL2gfbD6oj8k4a8NA9Dt7@vger.kernel.org
X-Received: by 2002:a05:6102:4a95:b0:4d7:11d1:c24e with SMTP id
 ada2fe7eead31-4deed3fdbccmr10508480137.21.1747060792620; Mon, 12 May 2025
 07:39:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-8-3906529757d2@bootlin.com>
 <CAMuHMdXzU1k_JZ0UhUh33XCq_zpq6MBJgAjo9F9Cw4gckA12EQ@mail.gmail.com> <c10b7752-cec5-483c-90a9-ada16aa0904a@bootlin.com>
In-Reply-To: <c10b7752-cec5-483c-90a9-ada16aa0904a@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 May 2025 16:39:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUtEtZH0MuS7TA6RTa1-LB=K47sEGzo9BJM_RvfCRmRAw@mail.gmail.com>
X-Gm-Features: AX0GCFtBB0NPqcRF4Vf9YhvCgyehMS_G0PxE4z0auJK_waQKI-5qQqM6guRCFiI
Message-ID: <CAMuHMdUtEtZH0MuS7TA6RTa1-LB=K47sEGzo9BJM_RvfCRmRAw@mail.gmail.com>
Subject: Re: [PATCH v5 08/12] gpio: aggregator: export symbols of the GPIO
 forwarder library
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Mon, 12 May 2025 at 16:08, Thomas Richard <thomas.richard@bootlin.com> wrote:
> On 5/9/25 11:07, Geert Uytterhoeven wrote:
> > On Tue, 6 May 2025 at 17:21, Thomas Richard <thomas.richard@bootlin.com> wrote:
> >> Export all symbols and create header file for the GPIO forwarder library.
> >> It will be used in the next changes.
> >>
> >> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
>
> ...
>
> >> +
> >> +int gpio_fwd_set_config(struct gpio_chip *chip, unsigned int offset,
> >> +                       unsigned long config);
> >> +
> >> +int gpio_fwd_to_irq(struct gpio_chip *chip, unsigned int offset);
> >
> > I would expect all of these to take gpiochip_fwd pointers instead of
> > gpio_chip pointers.  What prevents you from passing a gpio_chip pointer
> > that does not correspond to a gpiochip_fwd object, causing a crash?
>
> Indeed nothing prevents from passing gpio_chip pointer which does not
> correspond to a gpiochip_fwd object.
> And it is also a bit weird to pass a gpiochip_fwd pointer in some cases
> (for example gpio_fwd_gpio_add()) and a gpio_chip in other cases.
>
> I can keep GPIO operations as is, and create exported wrappers which
> take a gpiochip_fwd pointer as parameter, for example:
>
> int gpiochip_fwd_get_multiple(struct gpiochip_fwd *fwd,
>                               unsigned long *mask,
>                               unsigned long *bits)
> {
>         struct gpio_chip *gc = gpiochip_fwd_get_gpiochip(fwd);
>
>         return gpio_fwd_get_multiple_locked(chip, mask, bits);
> }
> EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_get_multiple, "GPIO_FORWARDER");
>
> So exported functions are gpiochip_fwd_*().

That sounds fine to me.

BTW, do you need to use these functions as gpio_chip callbacks?
If that is the case, they do no need to take struct gpio_chip pointers.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

