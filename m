Return-Path: <linux-gpio+bounces-19769-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5590BAAF4A0
	for <lists+linux-gpio@lfdr.de>; Thu,  8 May 2025 09:23:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C17974A1470
	for <lists+linux-gpio@lfdr.de>; Thu,  8 May 2025 07:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 018AC21E0BD;
	Thu,  8 May 2025 07:23:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED2FBA38;
	Thu,  8 May 2025 07:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746689029; cv=none; b=b/G655T/Ihh+LD2EcAi2/bEogNS40VSnZc6w+QleiDkSQN5rcUkMu1O2DzIZrPI5dhO9k717Lc/nv6SQeq45aSD76reyIPA1i9bmb3r+FKDiivJtMowCAg6KSjGa1dI7dSgzUuiNznOUFolo+E/UWCWpWgQnsjmWa2NYwNx0owk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746689029; c=relaxed/simple;
	bh=x6UYtviapPHf1R3zc4RWuyiNLIffWNkfuKVrmU838lA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iIDwflQomRX5TOop5sY/jtjnQzwzMzhtrpCouCu8n/Nu+y8eeP9TFyOoTj5A50cmi6sooQLJnpECjIBLo8mMxsQ4yZtXtjIorxrWFuWXcT+z27ZEmjvGRouatc99LSk2sqp+hLh2YAHuODidOpMmnu6Zb8OUsCJOx29K6VUxKW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-524125f6cadso432681e0c.2;
        Thu, 08 May 2025 00:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746689024; x=1747293824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MC2q4Bvc/SNvLt3WT4WF7kVWRNYt1yaE/Dlb0P0YraY=;
        b=oMCKLef6x6sP9TxIrpvgMGH1kOFj/9XC6H+DOvO7nITMnr34xuM7VcxBwGl6SCHGhg
         gysQ+E9I2+bNwqn4jBac/8EnJDktOqDh9oXkwBVdhASOpgffM6JfDTX9ROtTdRUh+6D3
         Id4hQSHgmVXCw4gRRQ72gHOmqn3LXEVxg6v3SvMR5fFvPvuuILm275M1E8+k/bFW3Hjv
         lQ0g8HpHPAx+H6Bl+dd9Ukw8rbaxn2g2wvkcJpUQi0OTL8nGdHuOEVZqkVjyRAq1M7XM
         tOzTc8nu2WeWbEYrrh02gNxuKyrQ5+7OL/cNdXAkr1tGaP5dSVwTlBVOWWMxAurN64i6
         cWUg==
X-Forwarded-Encrypted: i=1; AJvYcCU/xmMbjArWFH1dlH+mupouu6T0Azft0ts/THoB6GwDgIqtkPXlEj97nah+Kk6jnFDNOsogNEF9U1Sp@vger.kernel.org, AJvYcCWoTQxOlnL7avznIaAJ3y3wZJJEW/Hb9Sabi0Nx62EpQmYi2anZLd7V5DaJlUmkXJwoUTjRBRQDZJnM1blU9TRn@vger.kernel.org, AJvYcCXYfdE031Mgtsu8L5iUdk7/Q0caQviEweXJkovUI4d2bRjUqKpqWqQtcTAvZJT7Rm+MGEAHIFcxIY3K/cOz@vger.kernel.org
X-Gm-Message-State: AOJu0YwzHvU4il43soVKbzyENHTAX+NIY5XeRwwls23MXffxoJym6qp9
	V9tMJzZqyXEnnZyzafk1pP80OVsaB4soDo5BT2+t1Mr/yJ+Rjd+v7jMJWYbn
X-Gm-Gg: ASbGncvjNJpf6rJvro9HJxuy8dULZ+s6pE6fEN70NeZLPFeH+M9VQ8DfbuYCaBl9DLs
	MRRQHePXH22nMKdLzej4r4KLbdGiMMhr9AqOjjmnR7kHc83j2ta97MV7VVMcGoqJ//79XN7ZY5J
	TQmKD/sUsKRofGR4CFXuieXRh2MPxBNhu39dDYOqbPb0MTPChEwB/rDc89XaedZUV4MzHMjpwvi
	a3Pcx4p9Wn2KOEDKOTdweruPi9RIRnA+k/Ps35uVKn3HNwtKeSYlH/W35PchTMUC6uwiuecw5LW
	pepcoVn+aMfk9zThBGCvS+FP8aI47uGXpfSLH0AV9wl3UIXADzWjvyVYH9P4kUz0JYWcVsQr0Lf
	a4zFQVm/f/Oul1XzCJw==
X-Google-Smtp-Source: AGHT+IHuokG2RC5Fv6TahnJCCJ3Z9qTn5AZBW04hh4g23AvNpmq4xUYyxNAlyhJf8igSO6ewt5sX1Q==
X-Received: by 2002:a05:6122:2a08:b0:52a:863f:78dd with SMTP id 71dfb90a1353d-52c441a450fmr1774518e0c.6.1746689024601;
        Thu, 08 May 2025 00:23:44 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52ae419d6b0sm2863925e0c.38.2025.05.08.00.23.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 00:23:42 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-524125f6cadso432617e0c.2;
        Thu, 08 May 2025 00:23:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVOQHqRto+iztrQQOmqFptZ7JT42Q7el8U3luXn0yveMpo12nEAE/7Xz5bMRRr0pHWyJN2AUS6URPDmL7cP@vger.kernel.org, AJvYcCWAWEMGr4KYxu1Qq4vOy3uos1Eca/0TgIc+gFIDfmXaKpcAQNFKyohnGiPF2m8pxmNoIZ4EuD40ZctF@vger.kernel.org, AJvYcCWSQmvVsXSJo7g8bKP/YEd5aIq6oY7Qmfua4bTBALz7fxalM+VJsPF4l/S/2JrvWusw7VIp7S8cPJUeelnMdv9s@vger.kernel.org
X-Received: by 2002:a05:6102:3348:b0:4c3:6544:c250 with SMTP id
 ada2fe7eead31-4ddad0cd585mr2181667137.23.1746689021878; Thu, 08 May 2025
 00:23:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-8-3906529757d2@bootlin.com>
 <CAHp75VdRp7RG-YCAL2Jx4uXsT2RVQNeu-MxPB5pWRq8TqtsSXw@mail.gmail.com>
 <cb98bec7-748c-4e00-aa9f-b5075bebb5b2@bootlin.com> <CAHp75Ve_oM6NyvLGsBK4CddEEv=cafw_VfONKwEBX2CBdNxJmA@mail.gmail.com>
 <CAHp75VeBBG-2OZ6fDDJMdZ=SGZRWyaL71nTXaHx7Pyr1PLME2w@mail.gmail.com>
In-Reply-To: <CAHp75VeBBG-2OZ6fDDJMdZ=SGZRWyaL71nTXaHx7Pyr1PLME2w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 May 2025 09:23:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJ+XLuVqnTVYX20Zjzt9gzAtE5w7nkZ3agaxjQ_cPwmA@mail.gmail.com>
X-Gm-Features: ATxdqUG9aTueYzZzMECN6trZGp_ApPNLbA9m42YvM6OF-IADrHcQH0Bzu4semJ0
Message-ID: <CAMuHMdXJ+XLuVqnTVYX20Zjzt9gzAtE5w7nkZ3agaxjQ_cPwmA@mail.gmail.com>
Subject: Re: [PATCH v5 08/12] gpio: aggregator: export symbols of the GPIO
 forwarder library
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Thomas Richard <thomas.richard@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Wed, 7 May 2025 at 17:23, Andy Shevchenko <andy.shevchenko@gmail.com> wr=
ote:
> On Wed, May 7, 2025 at 6:21=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, May 7, 2025 at 5:53=E2=80=AFPM Thomas Richard
> > <thomas.richard@bootlin.com> wrote:
> > > On 5/7/25 08:29, Andy Shevchenko wrote:
>
> ...
>
> > > >> + * gpio_fwd_gpio_add - Add a GPIO in the forwarder
> > > >
> > > > forwarder
> > >
> > > Sorry I do not see the typo :)
> >
> > Your original piece of the code. Please look better.
>
> Ah, it was probably me mistakenly fixing the original text :-) It has
> a typo there.

Gmail suggests correcting typos in your emails while you type them,
even in quoted parts, and you may have inadvertently accepted the
suggestion.  I've been bitten by that, too :-(

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

