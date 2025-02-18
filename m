Return-Path: <linux-gpio+bounces-16195-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DC8A39D72
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 14:30:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36E9E3B3203
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 13:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529C9269AF5;
	Tue, 18 Feb 2025 13:24:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166CE2698BF;
	Tue, 18 Feb 2025 13:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739885088; cv=none; b=H916L6xvwRoyfUxpCS2Sa+BlafMuoBhU7HcBFYCboVjos3H61MHB1dvr0gOuDBCpJOBquFg24dd8ChjXx+hEJIMd0xpmh4W4maemyYRRraKTXRMcb4w+thmu3OCvO5drpDedpWnCKZYZq1jq5YEbPWEzb9m3oE7wX0PS0pnyP/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739885088; c=relaxed/simple;
	bh=EA5T8455k+n31uoB1gHaqCUfM6X4To+0/TVBZuFkZQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=updsWq2a+42ARa4BKHp2WR5qsXyR//j/g/7t/n+6lJlNoT3EWBNuiFbRHAur3AdUmmO7dhzGiJeDnfXzSef824ZORIgFNu75MbDelMMmv0Cgm7pElwvOCrUZaZMhoH2kDhqRMExQLn5xvObH4kkFHvgi1XYZCkcB5yOoTLeJvPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-520a80b1015so414699e0c.2;
        Tue, 18 Feb 2025 05:24:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739885084; x=1740489884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMGR/ywEZpSBdeMC5GBoPGH/9E5RjFPCg85if3tnzlA=;
        b=Po6nlIHzipXBxspnWuI04IBimBeWLNV7HqVw8Tfpe79Gq/AMilvujJIzGnHqqMx+O8
         90e3+dCGutOyFur32XV0e8ov298jCMnG8tn7MArY7QHPbRhBXLXhZXv3JATf/bTVs1Nh
         7Tw9H/bv6T4geIXqRi/Yo4txJ0MmBAjDZ7MAq+JdmXGe2PDMwGvHAqeI1phIS5sYSPEH
         fIPRC36aNGEm+xTtqW1AchcwsBrCjT5eQpQqFPHCTmdboHeTnk4CGd6u470H8okoe00o
         pUuSIjNNxY5r48kF/4kepJ+UiN48IQWJVO10WIZ74As6KJ7mOA8ytBnLVsCGA6+FRaME
         Owrw==
X-Forwarded-Encrypted: i=1; AJvYcCUKkAhqnioP5EChZ2FKFt+MXkB5/MZ1kYWeFfhqY2BUQtWv0sOcUhgdjFnFgJrxGGo7YQpRR+vwUiGjNc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlKYAPpgC0IVTrQgtoTxBhZ+/8MxbUI4vqRL3eT9iOa9bKCpYX
	pK+IC2j38ZDzTDWhAkXyfCqNw8vgKPq7FBuHJ172aChuFTRnEdKoGrz0rUFM
X-Gm-Gg: ASbGnct7GppwC53BXHE6/pLeeBXqCStR+hhQua7b33J7/hf1GGebvgUsWbTPxN6cj65
	0AGhy9HNzeisIm4Rhe5W+c76RC6A+ykbK8RepSwAZ0aE2eZgiNKC/VNW7mU0x4pQJLTxQnNxuDP
	1uSLeytdRlEYac+nS9qRazcZydIhF5RIb62s7PXG8QIsnKqYdSEkHA9LIh/eKE+cGRzkvH7l0vH
	5Psz/6JbqzOFnZgWE8EAvSYb03tSDoLiac/R6NBcdqAUJuAHgVOLw78mWD6n1NLenLed8DBsKHE
	vkOw8lr0Tg7HSD8pPkkkka1RQXyD2X46oa9wKfpJTT0aJ1p/0RJhDA==
X-Google-Smtp-Source: AGHT+IEpZhuQW4FTp/0qCg9b+sWWXJLjGsdwnWvNsZBIjURdkVc68lg0Yhhi6mvHQ9jO1TWKAdAVUw==
X-Received: by 2002:a05:6122:20a3:b0:520:5a87:66ed with SMTP id 71dfb90a1353d-5209dac20d3mr5824950e0c.5.1739885084431;
        Tue, 18 Feb 2025 05:24:44 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-868e86bce70sm2337976241.27.2025.02.18.05.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 05:24:44 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-868f169bb56so1465122241.0;
        Tue, 18 Feb 2025 05:24:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXhpOLJeD+2Eh6u0WwNymfVotODkNPfYj/aJh4Fv3sLh4/f3MIeVUZj5lXCqQ13HjeBWCFQuECmGATM8LE=@vger.kernel.org
X-Received: by 2002:a05:6102:c4f:b0:4b2:485b:e151 with SMTP id
 ada2fe7eead31-4bd3fc9b9fbmr6104477137.10.1739885084091; Tue, 18 Feb 2025
 05:24:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250217142758.540601-1-koichiro.den@canonical.com> <20250217142758.540601-2-koichiro.den@canonical.com>
In-Reply-To: <20250217142758.540601-2-koichiro.den@canonical.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Feb 2025 14:24:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWSBXHE9t2pMV+9iZRzrTUGVG+dnxxOMWbVF+HeCpt-xA@mail.gmail.com>
X-Gm-Features: AWEUYZnOPltRIBVqttBZm59CRgFdIfDDSsicHGinbXJlvgJtt8IxCEmMuNS8Aaw
Message-ID: <CAMuHMdWSBXHE9t2pMV+9iZRzrTUGVG+dnxxOMWbVF+HeCpt-xA@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: pseudo: common helper functions for pseudo gpio devices
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, brgl@bgdev.pl, linus.walleij@linaro.org, 
	maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Den-san,

On Mon, 17 Feb 2025 at 15:28, Koichiro Den <koichiro.den@canonical.com> wro=
te:
> Both gpio-sim and gpio-virtuser share a mechanism to instantiate a
> platform device and wait synchronously for probe completion.
> With gpio-aggregator adopting the same approach in a later commit for
> its configfs interface, it's time to factor out the common code.
>
> Add gpio-pseudo.[ch] to house helper functions used by all the pseudo
> GPIO device implementations.
>
> No functional change.
>
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/gpio/gpio-pseudo.c

> +int pseudo_gpio_register(struct pseudo_gpio_common *common,
> +                        struct platform_device_info *pdevinfo)
> +{
> +       struct platform_device *pdev;
> +       char *name;
> +
> +       name =3D kasprintf(GFP_KERNEL, "%s.%u", pdevinfo->name, pdevinfo-=
>id);
> +       if (!name)
> +               return -ENOMEM;
> +
> +       common->driver_bound =3D false;
> +       common->name =3D name;
> +       reinit_completion(&common->probe_completion);
> +       bus_register_notifier(&platform_bus_type, &common->bus_notifier);
> +
> +       pdev =3D platform_device_register_full(pdevinfo);
> +       if (IS_ERR(pdev)) {
> +               bus_unregister_notifier(&platform_bus_type, &common->bus_=
notifier);
> +               kfree(common->name);

On arm32:
error: implicit declaration of function =E2=80=98kfree=E2=80=99

Adding #include <linux/slab.h> fixes that.
Probably you want to include a few more, to avoid relying on
implicit includes.


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

