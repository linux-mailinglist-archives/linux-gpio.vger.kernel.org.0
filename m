Return-Path: <linux-gpio+bounces-2221-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A742D82D6FA
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 11:16:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4B871C20349
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 10:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C76F9E2;
	Mon, 15 Jan 2024 10:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mD6V0ZKY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339E9F9C2
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jan 2024 10:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-7cc970f8156so2081352241.2
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jan 2024 02:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705313752; x=1705918552; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F63g5TCHfS+ybr9y0m7zDGbIPC00mu+XgQYirt8SpiU=;
        b=mD6V0ZKYqQy/Vm1ewV4M80fgdGvmb9oGTGRDiEqzU8h2SCqJhruvrjS0uJBn2VtSoP
         q+dmHedgy7P2edCjNm4wLrXlFCAtOaFBS4WK7XJhRGt7efkVDkkwy0gOgIuLDVVarCKm
         0Nb2seAUIRw6TGCva/NlFW4Dg/EjUYTHrSRU/Cb5wd0snuoeAu9y4WAwULdqfl3VwpqS
         w0D0Os557OAnZzUlytw8M5X/TOUoIyCjDZcht3032U2ZVLKFsmfJ8qUyPNRlLeXVcflQ
         snkC4NtYf3MYsAHoyfZ/D5VvB7Mhz1gO1lFkYV+XfgZ0BrKeH0bIXbiylL4NI20As7t4
         cDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705313752; x=1705918552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F63g5TCHfS+ybr9y0m7zDGbIPC00mu+XgQYirt8SpiU=;
        b=WXOyHZ/3vHvIpEAKu0TcwPdeuIItWpUp2+MY1UAVCUKxlEYvvaTQpU/lrIByRJ9TEL
         grSCef1ck6YN0c/l4e5HUgBAor5abyfLstxIadttCLlxX+alHhO6Px5UlwRwEO394xSg
         oUQDDS7IvU3S2xcwuFjMxm8WG24AMehUOWRaAmhB5642o1RuY04sKoQY6VEH5+2qYXRt
         bhfY1gKj75aTGytrBzQBus3smlmw43wNizEhCjspv79IecU2C/zVyq8leIZcgs3upmdP
         yVWhLiVxQIH7eE6V2FySN+8vf2yRP8C7J2cL1175WpVA9wzr5Gv0Cktxih/2LjkYC3/S
         26zA==
X-Gm-Message-State: AOJu0YxLlwkE/FribIN4nX7o3GoXdpSH0JjmsnENsGq48n1eoXq/5mV2
	MLigMfrCPbsoe43QLAmAPzGMoG6EAVaZ2c+qyaQz7hNEa1PgfA==
X-Google-Smtp-Source: AGHT+IGg+0cHeGdJGNhsJFz7pNukIbriiGOWqVvFIfIITRW2tE6ZGKf1COC6BJFOWvcn8gnxynR+TqaORxERAHxnKjI=
X-Received: by 2002:a05:6102:22dc:b0:468:1cc5:ed88 with SMTP id
 a28-20020a05610222dc00b004681cc5ed88mr1232263vsh.23.1705313752126; Mon, 15
 Jan 2024 02:15:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240115052140.18858-1-rdunlap@infradead.org>
In-Reply-To: <20240115052140.18858-1-rdunlap@infradead.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 15 Jan 2024 11:15:41 +0100
Message-ID: <CAMRc=MeGmN1xEEGhXV=zY9kKJayBbF4UABZEK4ieQPxzVefHfw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: EN7523: fix kernel-doc warnings
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, John Crispin <john@phrozen.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Felix Fietkau <nbd@nbd.name>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2024 at 6:21=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Add "struct" keyword and explain the @dir array differently to
> prevent kernel-doc warnings:
>
> gpio-en7523.c:22: warning: cannot understand function prototype: 'struct =
airoha_gpio_ctrl '
> gpio-en7523.c:27: warning: Function parameter or struct member 'dir' not =
described in 'airoha_gpio_ctrl'
> gpio-en7523.c:27: warning: Excess struct member 'dir0' description in 'ai=
roha_gpio_ctrl'
> gpio-en7523.c:27: warning: Excess struct member 'dir1' description in 'ai=
roha_gpio_ctrl'
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: John Crispin <john@phrozen.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Felix Fietkau <nbd@nbd.name>
> Cc: linux-gpio@vger.kernel.org
> ---
> v2: Add commit text.
>
>  drivers/gpio/gpio-en7523.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff -- a/drivers/gpio/gpio-en7523.c b/drivers/gpio/gpio-en7523.c
> --- a/drivers/gpio/gpio-en7523.c
> +++ b/drivers/gpio/gpio-en7523.c
> @@ -12,11 +12,11 @@
>  #define AIROHA_GPIO_MAX                32
>
>  /**
> - * airoha_gpio_ctrl - Airoha GPIO driver data
> + * struct airoha_gpio_ctrl - Airoha GPIO driver data
>   * @gc: Associated gpio_chip instance.
>   * @data: The data register.
> - * @dir0: The direction register for the lower 16 pins.
> - * @dir1: The direction register for the higher 16 pins.
> + * @dir: [0] The direction register for the lower 16 pins.
> + * [1]: The direction register for the higher 16 pins.
>   * @output: The output enable register.
>   */
>  struct airoha_gpio_ctrl {

Could you add a Fixes: tag too, please?

Bartosz

