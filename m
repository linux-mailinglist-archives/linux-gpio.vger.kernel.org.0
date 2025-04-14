Return-Path: <linux-gpio+bounces-18785-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 713BBA88015
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 14:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32C7D1735D9
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 12:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E5F29B23F;
	Mon, 14 Apr 2025 12:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Me95RUpC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077B880B;
	Mon, 14 Apr 2025 12:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744632701; cv=none; b=Lgk9MUZGgS8EEzFJBznmB0FV6ygE7TtLJ/X/1RKmxV+ZWxqdPb16PB5MuESPbuKZqUI2ho/T1S/R+nGVV50QwaBul3ADkBstRVql6IjHV2ELLnYTbLQvTeME9JqEWsJVI0zJi8oNIuxXHkSq7o3bbMzm8DKrqzWyFf12MvLbckg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744632701; c=relaxed/simple;
	bh=bnGxRLs+K1CD65Hx8HF8eGtWOdGRG6IAiUaBqUPEOhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mvGNQSC6kyhH/xMjRum/Bul7FrK3ZKV6Yxqi+N5wU1UZ0+tPcp7/1B0C6K3sBJ6bLHbu2Pw/bI9UGDvpq6pOcy1K+Eu+L8sDgZ6epYC6z+mMIsJZS6L0yUdfiKjEimZ0iUl7PacikEIKFSPOz8gUX73wQyuphV5NaiXYmPbKaCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Me95RUpC; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86cd8bcd8dfso160593241.0;
        Mon, 14 Apr 2025 05:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744632699; x=1745237499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ac6H1/o/h+9u2eKjIhXkLMaofu5biYHSL+e4b7ZsNoc=;
        b=Me95RUpCaGgc69j61FaFshjtTYENg13e+D47PgRr5hIFM5GBn7vBDRucNvVdWIOund
         KR09nLZMlSn+QOPT1/faj8DyfPfgC2AcrZxsATjq3FZ3ayNtt8RBzR1xIb/mz5Sm2xJo
         8Lflg3NpeokLWKItyqox7aS+1jqODFwuK5yhMMI+POg8fGxffbhhtG9r9ohvScuLGaSp
         jBQEsJ+tTrOAd41GCvrsZ+YqEv5JMT7f5KwZ40ydskw+8NGCWV6OYf/Y9mJyXMBS9cSX
         6mT+aqppiN8dhIIE+EY4Hu4hKenUEQGRG3ljMkeDlAGVFP/V0zvmOsAlqQLCgO1gMhm+
         nJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744632699; x=1745237499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ac6H1/o/h+9u2eKjIhXkLMaofu5biYHSL+e4b7ZsNoc=;
        b=ad3VF6OTE1NFdsQDlSw0vI7evfYZnkVJYai552Sa1A0N8Zbzj2s/SwL9xRVrFMNxjs
         5WlNVygh71PdIyvMyZ1bRZCnZZSSw/zt64Lpc4Icy/F1h0eZtcmSjum++ip6P13knw3G
         95ashmcDv5jSIDfKJByLsjxzGthJm65pxq6QxW2ek5bs9RQEJXzu6CdysyM/w+Yid3YF
         x97HfGAw3v198iv1cON5MSmioN/UAcjhIpMIMzjOvf6ZMGWCHpK++lSlQsvqGGkeYniP
         KQzciWcE63jxQR9M0XllLoH875yGdW8Q8Mp/Pnk9jSrIdkDcOp7YQBs23kEN/GrUIY0m
         JyeQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1THRjcUOrhKm1LO3kiLVa7Yeqerg1O+DBYx6F2Rw7v+EnQoBcQ9wkfX3M81okfFXFmnWrGcvEoyoS@vger.kernel.org, AJvYcCXKq0yE8RDszOWS+wlspAgSYSTf5QnkCC7QfKKvrMtEtYFNMegoRLTedShgnkuz32PYvakVVMDw8jDuvH/P@vger.kernel.org
X-Gm-Message-State: AOJu0YwJwbe0ZBSXjDdm0tP2fV2/OS6u2WOb64eiSbrYPa9Lu94OQCWC
	ASt5VMGuBwCZbeRnp7St+xzWvGYdBIN6/4i+qiH/t7p9F36i/Hqdvo+wIIxq9dQl9srIiCdwvJy
	k7rshBsA4JxNwcboLsDlFvL5jqQ==
X-Gm-Gg: ASbGncspxQQYy6y54vQMDhBK6Bqri82l+u9XdmV9gh/0nA3JkzkmUwbZUJglXVYQ8YW
	x7c8vhyEV9IT/q6+dZ3C/IkK25qBTk1dCULZ3S/YR7NlA6skX0dfE+NeOTMcwceGZzil85l5br/
	AdypIQWXJYJKewJIK3Yebv4rE=
X-Google-Smtp-Source: AGHT+IF+TKucMPytpTJ5R+CA8NEB5VA18YC7dTPTBjoM8fCHrXGk3NfE5eJA70tng973CAZHmwTuo9mPRPDMashJT88=
X-Received: by 2002:a05:6102:568c:b0:4c1:8047:e002 with SMTP id
 ada2fe7eead31-4c9e4ebb690mr2539916137.1.1744632698529; Mon, 14 Apr 2025
 05:11:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412193153.49138-1-chenyuan0y@gmail.com> <D9694O0MKV31.3SY6ZCTSKXWI9@bootlin.com>
In-Reply-To: <D9694O0MKV31.3SY6ZCTSKXWI9@bootlin.com>
From: Chenyuan Yang <chenyuan0y@gmail.com>
Date: Mon, 14 Apr 2025 07:11:27 -0500
X-Gm-Features: ATxdqUEmzNKqNy2VeDRm0Ya7G52O07CobBBqgfreeKbyqmOiDNlMjis513mrcFY
Message-ID: <CALGdzurLWayryjUEdSy4iuHAgFO=RA=HN=u+BZY96JqESKvi+A@mail.gmail.com>
Subject: Re: [PATCH] gpio: nomadik: Add check for clk_enable()
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 4:24=E2=80=AFAM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:
>
> Hello Chenyuan, Linus, Bartosz,
>
> On Sat Apr 12, 2025 at 9:31 PM CEST, Chenyuan Yang wrote:
> > Add check for the return value of clk_enable() to catch
> > the potential error.
> >
> > This is similar to the commit 8332e6670997
> > ("spi: zynq-qspi: Add check for clk_enable()").
> >
> > Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> > Fixes: 966942ae4936 ("gpio: nomadik: extract GPIO platform driver from =
drivers/pinctrl/nomadik/")
> > ---
> >  drivers/gpio/gpio-nomadik.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
> > index fa19a44943fd..dbc4cdddf4df 100644
> > --- a/drivers/gpio/gpio-nomadik.c
> > +++ b/drivers/gpio/gpio-nomadik.c
> > @@ -262,8 +262,11 @@ static unsigned int nmk_gpio_irq_startup(struct ir=
q_data *d)
> >  {
> >       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> >       struct nmk_gpio_chip *nmk_chip =3D gpiochip_get_data(gc);
> > +     int ret;
> >
> > -     clk_enable(nmk_chip->clk);
> > +     ret =3D clk_enable(nmk_chip->clk);
> > +     if (ret)
> > +             return ret;
> >       nmk_gpio_irq_unmask(d);
> >       return 0;
> >  }
>
> Returning a negative value whereas the ->irq_startup() [0] return value
> is an unsigned int? From some quick godbolt testing and briefly reading
> the spec it looks safe to do a round trip (signed->unsigned->signed),
> though not ideal to my eyes.
>
> The caller is __irq_startup() [1].
>
> As for why irq_startup returns an unsigned int, I am unsure. The kernel
> Git history isn't enough to know more. The startup field in struct
> hw_interrupt_type appeared on v2.3.14 [2], so no commit message to
> explain decisions.
>
> Seeing the __irq_startup() code, my proposal would be to turn the return
> value to a signed int, but I haven't exhaustively checked codepaths.

Good catch! I agree that using a signed int could be a better option.

Dear Linus and Bartosz, could you please share your thoughts? If
you=E2=80=99re on board with the change, I=E2=80=99ll go ahead and send a n=
ew patch.

> Thanks,
>
> [0]: https://elixir.bootlin.com/linux/v6.13.7/source/include/linux/irq.h#=
L503
> [1]: https://elixir.bootlin.com/linux/v6.13.7/source/kernel/irq/chip.c#L2=
44
> [2]: https://elixir.bootlin.com/linux/2.3.14/source/include/linux/irq.h#L=
21
>
> --
> Th=C3=A9o Lebrun, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-Chenyuan

