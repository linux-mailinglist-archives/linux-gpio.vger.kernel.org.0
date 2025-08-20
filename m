Return-Path: <linux-gpio+bounces-24619-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B33DB2DD98
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 15:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D83C5C024B
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 13:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3785227EFEF;
	Wed, 20 Aug 2025 13:17:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951FB27BF99;
	Wed, 20 Aug 2025 13:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755695877; cv=none; b=jxcTvaOHlcUNPPpHfOlYGU56rTqGWLxsAOLQWjjSD3+COhkMKo1C6VbdM5tUE3WvP5w/OsHGqedmVYLq2Q67cpM/KsUN0y7SyC0GOZowJAw3m1kKrJZNNoDdOHWMoX3e/A2kGmrt8yYXV605xnZcsvBqb6qO+ugcdxRNfGwYtNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755695877; c=relaxed/simple;
	bh=amp618qAhEw+37IrUCKwJ0eJSOkm4YK6dbemdWIFD08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PwuPKK+bgRQqcJl+FLUiQG6U06mvXB+gchaZQ0NIU7yjH4E1hSbR37FyhCXdL963SGvfv2sY2Wnqv3d084CK2Ga8fd6vjLhed0kw5A6Yd8MFc82Pq5Fj4im7V1w09Zzw2RdP6oHOM05mZ7l5lAhrKW9WE4qbWSVGJJiJJWXxCtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55ce5243f6dso7162636e87.2;
        Wed, 20 Aug 2025 06:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755695871; x=1756300671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pPixgx/r2pzG9SYlVyxWbRJbcFdefcug1MJMB9A4a4U=;
        b=SrfhTudY3GI9EdOtZaDhJyH2vr2EeNrsweq4bFs/v6zvbFY5UA/pDk+0Lc04IqOU1w
         W5HH+LizKnWIKxHW4sw5eKwNCaeUuVwFYn3k+cMG4moU07wC7sVowmu8HLk0KcfCPWUg
         z0V2QurA1oiGZ0ZCk0yyHBwdhrQ2SbU22lH3BY6oDWTRB+e9b49X+hXZ3COMByFFT7B4
         oAfylRdv8IfLux030b/UnoDLfTMq2pIazONPVUbcI3irJO7vgc0wSi3/suD2jOlKZya8
         V+h6j2EVnsTu4uXy3XG4RZ8OiKMB3xubBjmGA82AfBfuA8pVCKKicuF2XwPG9yp4RTPx
         M/+A==
X-Forwarded-Encrypted: i=1; AJvYcCUcuP7pncMy92SARQv2xZOC+WcEFXKNfDKRwK3z+xlwZEHs4ruxhS0MpFU15WE5dFAkG6aRW8ROhm5zFsR4@vger.kernel.org, AJvYcCXXel60aYJewwYGDiH0GnEvmI9PGGoFeWfAKI6yydI54+uXA1Vs84vZGm8L4ijU7qpX1rSnLV1ludDt@vger.kernel.org
X-Gm-Message-State: AOJu0YwozeCP4wG3lq+HDJ73XwVmv38I0pMcTizySFEsJSMfMAnG4IVg
	6EKYjoxFLq6kd2GCNBd5P44KgYlZqiqFQVK2pJ5yL8F+SuZasnJefRS+HTPJK0qx
X-Gm-Gg: ASbGncsjyWoxrA+fekjWBaX5OahWv15VJv0XPApp2pbhsdBiJAwX5gyvtMgK7DbZeaQ
	FS+DkCjxzW7fjoLI4VWygT/7zYKzUZEMHr2tfYvY/CMH7ItA/xdZlv8rObiiClnFlar0vwVOj9e
	Q8anfIkcm4b9DxLOj7P+pSYsyC+5NER5orIvfuxgyw9oau2YfpoZ8Bj7HoAlNmjGLUetnclXBuf
	cV/7gsnkMuenmuF/FEu3FxdgqbVodRsuW/F8vXnnhhb97EzKaIA/S/hMK9q116IW0ugVi+rXaSf
	h9l9Iq6dPOQXtTYBkb6goT3nYNhABL2wy4DNaflRZesAmjBiUaGzT52kIfi0eK+wdqIcNCFvfWe
	vfeZhFB0RrWpQi8e3A8qkhS1jxvgYTt6dVqw4NCZTNCQqQt9N15UqQr8=
X-Google-Smtp-Source: AGHT+IEMzRG1ZWmgOTdQFfZAUZ5oVcCbTmOSO72Wz9WNZMeJJ8rKvxsP3LN8oleg18ZsJqctUDmEMQ==
X-Received: by 2002:a19:6a13:0:b0:55b:96e5:195f with SMTP id 2adb3069b0e04-55e06b2c4c2mr668000e87.11.1755695870726;
        Wed, 20 Aug 2025 06:17:50 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3ccafcsm2670423e87.83.2025.08.20.06.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 06:17:47 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-333f9160c21so47353311fa.2;
        Wed, 20 Aug 2025 06:17:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV+upC8h8ZdXBnJyiHCOJCEewnL0MnjZgzu5nXhD4gOZcq7fTA7c9nsyA8xL2+1HptqjuOckutUiG9t@vger.kernel.org, AJvYcCW8sCOqWIxyEaxkVq6juhhoCj2keiK72xF6o5/lwv6GEwEvTfysy6UDl9Mq03f9osOa8l7hkUZYHThHEQ5L@vger.kernel.org
X-Received: by 2002:a05:651c:4102:b0:333:b656:a69d with SMTP id
 38308e7fff4ca-3353bcd77efmr4582191fa.7.1755695867435; Wed, 20 Aug 2025
 06:17:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819143935.372084-1-rongqianfeng@vivo.com> <20250819143935.372084-5-rongqianfeng@vivo.com>
In-Reply-To: <20250819143935.372084-5-rongqianfeng@vivo.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 20 Aug 2025 21:17:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v67aScycSHQr+cToshGz=u6vOCcdamZmqBaDbpgD3zg0_Q@mail.gmail.com>
X-Gm-Features: Ac12FXxY1RMn12OMP_6ZvaC7ig2Ko0gOCjNM_-u3K-s-PXBOydhAFgSyE2Itvsw
Message-ID: <CAGb2v67aScycSHQr+cToshGz=u6vOCcdamZmqBaDbpgD3zg0_Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] pinctrl: sunxi: use kcalloc() instead of kzalloc()
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 10:40=E2=80=AFPM Qianfeng Rong <rongqianfeng@vivo.c=
om> wrote:
>
> Use devm_kcalloc() in init_pins_table() and prepare_function_table() to
> gain built-in overflow protection, making memory allocation safer when
> calculating allocation size compared to explicit multiplication.
>
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/s=
unxi/pinctrl-sunxi-dt.c
> index 4e34b0cd3b73..5f13315ebff3 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> @@ -103,7 +103,7 @@ static struct sunxi_desc_pin *init_pins_table(struct =
device *dev,
>                 return ERR_PTR(-EINVAL);
>         }
>
> -       pins =3D devm_kzalloc(dev, desc->npins * sizeof(*pins), GFP_KERNE=
L);
> +       pins =3D devm_kcalloc(dev, desc->npins, sizeof(*pins), GFP_KERNEL=
);
>         if (!pins)
>                 return ERR_PTR(-ENOMEM);
>
> @@ -199,7 +199,7 @@ static int prepare_function_table(struct device *dev,=
 struct device_node *pnode,
>          * Allocate the memory needed for the functions in one table.
>          * We later use pointers into this table to mark each pin.
>          */
> -       func =3D devm_kzalloc(dev, num_funcs * sizeof(*func), GFP_KERNEL)=
;
> +       func =3D devm_kcalloc(dev, num_funcs, sizeof(*func), GFP_KERNEL);
>         if (!func)
>                 return -ENOMEM;
>
> --
> 2.34.1
>

