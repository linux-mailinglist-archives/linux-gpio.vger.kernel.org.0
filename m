Return-Path: <linux-gpio+bounces-1103-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED145809019
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 19:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7907281C82
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 18:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F3A14E62D;
	Thu,  7 Dec 2023 18:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="z2hNBnyI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84FD81717
	for <linux-gpio@vger.kernel.org>; Thu,  7 Dec 2023 10:38:06 -0800 (PST)
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-4b2d237ab87so330421e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 Dec 2023 10:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701974285; x=1702579085; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1ifn+/36oKxRSYkStCNDscYo93mjbvatC/9tPKfC1M=;
        b=z2hNBnyI2szRgO0kO1p2fUEUlqMPJYm5XWk92EtPRn6zZaJm9hYcBgN/8F98/e+841
         zQdQBl/gvQwyz8ma0cSby0/Z69crox1+Pnw+tiJMBmjGPoHJj8iHryfMtBHmmo7O2ShA
         3OyNKtCqRG6f7MVPgJDCnpXG46KYUMmTBwzrrkXccDC+ueYZkSx3iC8Soev09ox/3IHb
         ZtbfJ0sV4u+Jnb/NGgIBWEwkCz9eKF3F5Ch5G8BZ1himCSC+MaUzKG+NNjFNN2ZT3V5f
         LVpbXePWFtBgisPqnKNZJ+TWIBcHSwtoJyaDtbrDz0zvR4SOBBMz/fWCocD0M6nEUHIu
         5mKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701974285; x=1702579085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1ifn+/36oKxRSYkStCNDscYo93mjbvatC/9tPKfC1M=;
        b=iR0zJq8TuDxo9izp7jGSspbc9Ny3A+fy6zYF/Mbhg39KolXpa2MSWbEU3lq4ggpdhZ
         GnM3CJ9fEhw1Otq/cjoYAjlba4gLz6gLwhVMbt+D90YRjGNLV9uLT1aWRcypsWrnFiAR
         kioK+m+WE3y1nK4iOPLqy+K9BvSocGj9HYaYoCibZGz9ViR/2o6mBdnAMvrc0bEAlPac
         H8mJpgGuIgu2AuYdJtg0fe9GkiKohCYsfycK+PYZWpP25uAvXPelRK5YhaC8kuFdcCev
         jn/V7ckwYxWaBZ3abaS32VYCZWg93TrV02w2UMfguaBjV7iPSoILmNrPIutZzOOioFym
         dvuQ==
X-Gm-Message-State: AOJu0Yw9JCN4/u4l1gGizBv5bt+Yw3FbSygGULvL3CHWn7XmZ8zLqebA
	HhaFBUFHG/9fPsya6gzs/+aqS90yCe8vYNltuTSvZ0HuA0df8NfOwBY=
X-Google-Smtp-Source: AGHT+IFGNUPK19aagNixpIUH/WVoRkw7wNUTvGjCem9kjAPrFjhjAYde5pSVJKGdL48JjCyUnQQwRAanWUUKJQcqjqs=
X-Received: by 2002:a1f:e243:0:b0:4b2:e63a:1161 with SMTP id
 z64-20020a1fe243000000b004b2e63a1161mr2629134vkg.3.1701974285604; Thu, 07 Dec
 2023 10:38:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McMxnYQosDDip3KGNBsQHDpHg_7bJgvS_Yr_7Y=2kqyUg@mail.gmail.com>
 <ZWFN8RVUy7Vx72CE@rigel> <CAMRc=MdcPNrbhXWm6NX_=kA8ut9pcfy5wJGP7EZFNkHDLrSZUQ@mail.gmail.com>
 <ZWKL4r9DREwYjnyo@rigel> <CAMRc=Md6y=91o_zB7ePLM1tEfG7sjgE2tujZXSRTQQ8y8oJnPg@mail.gmail.com>
In-Reply-To: <CAMRc=Md6y=91o_zB7ePLM1tEfG7sjgE2tujZXSRTQQ8y8oJnPg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 7 Dec 2023 19:37:54 +0100
Message-ID: <CAMRc=Me3JV6yjfRK6TaVtVYV0zhbn=274uCzbfYZ-uywaSuz0A@mail.gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Kent Gibson <warthog618@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 11:47=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>

[snip]

>
> Because years of technical debt, that's why. :)
>

Speaking of technical debt: you may have noticed that despite stating
I'm almost done last week, I still haven't submitted my locking
rework.

The reason for that is that I'm stuck on some corner-cases related to
the GPIO <-> pinctrl interaction. Specifically the fact that we have
GPIOLIB API functions that may be called from atomic context which may
end up calling into pinctrl where a mutex will be acquired.

An example of that is any of the GPIO chips that don't set the
can_sleep field in struct gpio_chip but still use
gpiochip_generic_config() (e.g. tegra186). We can then encounter the
following situation:

irq_handler() // in atomic context
  gpiod_direction_output() // line is open-drain
    gpio_set_config()
      gpiochip_generic_config()
        pinctrl_gpio_set_config()
          mutex_lock()

Currently we don't take any locks nor synchronize in any other way
(which is wrong as concurrent gpiod_direction_output() and
gpiod_direction_input() will get in each other's way). Using a mutex
will be fine but for non-sleeping chips if we use a spinlock here (no
other choice really) we'll set off fireworks.

One of the ideas I have is using the fact that we already use atomic
bitops in most places. Let's not take locks but add a new flag:
FLAG_SETTING_DIRECTION. Now when we go into
gpiod_direction_output/input(), we test and set it. A subsequent call
will fail with EBUSY or EAGAIN as long as it's set. It will have no
effect on set/get() - any synchronization will be left to the driver.
When we're done, we clear it after setting the relevant direction
flag.

Does this make any sense? There's still the label pointer and debounce
period stored in the descriptor but these are not accessed in atomic
context AFAICT.

Bart

