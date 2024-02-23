Return-Path: <linux-gpio+bounces-3685-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB701860D63
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Feb 2024 09:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C8D51F27292
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Feb 2024 08:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A061AAD8;
	Fri, 23 Feb 2024 08:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GvU863DQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0292941F
	for <linux-gpio@vger.kernel.org>; Fri, 23 Feb 2024 08:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708678733; cv=none; b=Lrvbhcp9NRH79OkgpGBIPoJU3JGLs+BuHVOm+6RS6oC49WcbpIXLarjQTh5eVFW/FWBcsLKXgZeQz6y0Ik5mu+Fck9ewVP2ymZvGzuodGcnmhkQJhza7PCfQSr8fB5EXL07w2JhdwLywHz1vfoJikXtVUmVEpVya5wQWO5hWIzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708678733; c=relaxed/simple;
	bh=yml1Rz7s3mR6tO9FKM3OAOqt7AHAEkaT1I5a2+DNf5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJDhqpIVJHLVpH0HrsKbu0rn9XgicDNErguSgDp1yFzh9tRLYGcTaPxmtdd/+xyJXbuxAQjEU+ELHlpcbxGiShkAVRwu+xUctYCyNHTiiVSyXyJK3AQd52fGAsn0W5IfZ2K34/eHogky9Ws7CvQ1hus/q6yUgoHA0/gUe9g9GOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GvU863DQ; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-47050fd33f5so115659137.1
        for <linux-gpio@vger.kernel.org>; Fri, 23 Feb 2024 00:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708678731; x=1709283531; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uI/vdQg5UeNJ4dmbbqkc2ezjlu04dZOug2/6SvrZwnw=;
        b=GvU863DQDEVxnkTe/8Ylw7awOYKCk6s7I54BbQ8EdpyXNshjZiklUHAOq7mWIrHwlL
         jc1qebfBxOGI29+oHQLp21yGrMoAmU1SjwaSHNZJ0pdm1tcV2jhNn7nMToUoxNPudq+6
         crbnJp4qoA+BeNKTXgKP4GXSvE6hKgt02Ubt2v+1yJ2F/XCZF79E3s/YcKoEh27e6IKt
         qXQysw8+tjEtP3KeMmIwO0vh9nNLeggZvXGKAiTknW86TKesPwOZXst+KItahNOWSXaO
         J9V5zEJ1Q/FmujmKuZrL6qNmfIquAdOnQjFAW9jrg0n5pUCc/JT72WWE3vty98uhRlkT
         w/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708678731; x=1709283531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uI/vdQg5UeNJ4dmbbqkc2ezjlu04dZOug2/6SvrZwnw=;
        b=Z2p32XOyLfTDELLIaJsPrCuK06KVXnLtCswpOwDbuvi2gnNB05iAuKbV9pvt46m49l
         1hTLc6nxcDnv35M4+7cTFw2a9jyLBLLEAKODeey+Y+KxydOoczHcVx9TK59M/nf57Lkk
         yDmqrL043qb+LdWHSxZAM4Sa0cWzX8ADFxsioO0AUHoIGLng45LUilDcFCnslIQ0d5yF
         vnX0MuxFbzns2Tw9+2Gk+57NVAbgm9eIfbUcCGwLBT3vGO9gsyGpeMxA60GK9yA1QXN1
         1Bl0xACoE+8MKgBILw8nHzS+x3Fomk2Jq7idqR1AJiHNKzSeiUd9KlsGpV9EvWA/qszH
         OAMA==
X-Gm-Message-State: AOJu0YysvBXvO4Iz+v7RMd9GePwWgJBYOBzh7tJqZqd8H0EvVhz8MNvp
	N7KvfoNsT9VJw3hMEprvMhfm+DCQPBZUgFyh8hEqVm1TRMhYtS6KYoivmUQAogQRg3tblzJcm8d
	0MPsSbrQuJDB9lmPeATbwxQl4vPT7QOxOlizoJg==
X-Google-Smtp-Source: AGHT+IEdbMaYMdJXUHdgYFhnzswKsMhA3rkp7GqkfyoGQ6ZLsIJWtTIWmSWiZNIqvRb19m0SRp5908+n7KUOJ7K8MJc=
X-Received: by 2002:a05:6102:d9:b0:470:6009:16cd with SMTP id
 u25-20020a05610200d900b00470600916cdmr950225vsp.33.1708678730895; Fri, 23 Feb
 2024 00:58:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240222102513.16975-1-brgl@bgdev.pl> <20240222102513.16975-2-brgl@bgdev.pl>
In-Reply-To: <20240222102513.16975-2-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 23 Feb 2024 09:58:40 +0100
Message-ID: <CAMRc=McAGdmMBH2cqUM0nhfWjDWRXCWqXqS9NjXLBDErfK-Ckw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: sim: use for_each_hwgpio()
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 11:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Display debugfs information about all simulated GPIOs, not only the
> requested ones.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-sim.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index c4106e37e6db..88fc3712811c 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -234,10 +234,10 @@ static void gpio_sim_dbg_show(struct seq_file *seq,=
 struct gpio_chip *gc)
>
>         guard(mutex)(&chip->lock);
>
> -       for_each_requested_gpio(gc, i, label)
> +       for_each_hwgpio(gc, i, label)
>                 seq_printf(seq, " gpio-%-3d (%s) %s,%s\n",
>                            gc->base + i,
> -                          label,
> +                          label ?: "<unused>",
>                            test_bit(i, chip->direction_map) ? "input" :
>                                 test_bit(i, chip->value_map) ? "output-hi=
gh" :
>                                                                "output-lo=
w",
> --
> 2.40.1
>

Patch applied.

Bart

