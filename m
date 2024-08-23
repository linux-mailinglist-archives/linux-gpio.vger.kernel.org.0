Return-Path: <linux-gpio+bounces-9027-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E131495C678
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 09:24:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D28DB22884
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 07:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D966313C9B8;
	Fri, 23 Aug 2024 07:23:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7810613A88A;
	Fri, 23 Aug 2024 07:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724397830; cv=none; b=GgI0JROYev7oAyvSm7yfKR1OJqP7iiNSjYlKnMPTgC4FGw0TX7P5TL2DU0scSraChxGlpuSN9lLuZpr2zppDv9+hEKkATNAqpH378TouBKWcFqsu2juvFbDvHDAu1g6fgI2058dxLid+3FcfhwpHzD4HHz3b2S4YK/pqAGVYQ3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724397830; c=relaxed/simple;
	bh=TZ8pa3FlE5L+xPFRN/W9Z5wq6Lhu8mNg1Qmwnmdbf90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zh+gPIsA0hbyoJl+2Di84njE8fsX43eTwPuADRm3WOvbaUECNMCsk/ZoeRhz9gWQYbyl75p0J4cb8A7nPM4MBQ2xhxW+zcRFGElvzLtYhPFhpZdLvNptZ74RH2HM8YyiCXBZBjzvyssmH2YiIV14xuUCq/xWHR/kZYxJpnMW+RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e16582cb9f9so1297809276.0;
        Fri, 23 Aug 2024 00:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724397826; x=1725002626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6LuKNaeSfLw79fqt8g2TueEBKyy/sG3LeW1oOKYYb8=;
        b=AGDVp6VbJHwOtbq7VqJM5OM8jQP3Iq2TxF+mV1jvFMGPOrX53c4DFGhLyOQAjq5QpN
         WxZ8zNka+fTd7tfiFJlgoI9Rs6Z8Da0R0yQm5YdAVyTt5bd/HWNeAUVI1GZj1fNsWpNX
         2Gp5HWEh4YR8EtKJ/qRJ2+1o0EWxS+Aw/y8yRyRGQhjnzOcXRcat2iV75FtIMMEJkp9V
         2gkSd7jt8k2EtgpngqiTsdTdo0EgcCgXpWXcBVXyzzLKOSdP5AnJceOGlUAiYa8eL1oh
         Ow8mEUQwAL/KpFlT1fNLqjZbM+TJ3da6EwtyXrfg4Gb3kfeOXs3tmYrGA7BflvOzEVta
         a7yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQoJ2U9udYqDwm6hkFk8nDIv7cMfJjEGm6LbV8PokuDSQnLZAZBsSQQhTuJ7MK2/EfrEhIpS37XJhx@vger.kernel.org, AJvYcCXhcYkZicYElfi8fX60LqGBfJsdUEAcOIsVikPvQbonkMARPcyiMsdo0AqNj2lavbkOsaO7BZJ1tPAJCNW6@vger.kernel.org
X-Gm-Message-State: AOJu0YzxXgQZfxND/Av2aWVtKJb4HFIYtxKlKd3allAxmFdMoV/QM1F1
	7lkTDkwIR1C6IUqWkcHW6Y6EVZYFprbq2+Vqni2CrqPtyZZO3DoCDaAg5nUz
X-Google-Smtp-Source: AGHT+IEncNMW/TzrY3HsDtbqA5DUzfV4XJ8JIUDKhai+60RIveGzUxW7t+FNQf6TdlAL3y49C+yEXg==
X-Received: by 2002:a05:6902:2013:b0:e17:5746:15d with SMTP id 3f1490d57ef6-e17a7a708f2mr1163678276.25.1724397826196;
        Fri, 23 Aug 2024 00:23:46 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e178e4b3972sm583188276.30.2024.08.23.00.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 00:23:45 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6aab656687cso13698917b3.1;
        Fri, 23 Aug 2024 00:23:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+vNihjb+Nm1EX5YjAdnCG77vZvZSmxVuTuHoFWOLQ9aQiNxSyZ0cNvSIyKlv/mu4D9HCLGczx4vvF@vger.kernel.org, AJvYcCX6hOdpSfS4Z7N//shfQFeBLasAoXuGvDuQ1qw3rHDXL3qeLI5gpp1N4m9DWZvb8V48egw+Xi+LnuqReIuS@vger.kernel.org
X-Received: by 2002:a05:690c:6f10:b0:651:4b29:403c with SMTP id
 00721157ae682-6c30317233dmr52554827b3.2.1724397825549; Fri, 23 Aug 2024
 00:23:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822230104.707812-1-andy.shevchenko@gmail.com>
In-Reply-To: <20240822230104.707812-1-andy.shevchenko@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Aug 2024 09:23:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW2W+RsnBWdvxJJ7wOKCyM_162Hb1Xkd6id4h_74fzQrw@mail.gmail.com>
Message-ID: <CAMuHMdW2W+RsnBWdvxJJ7wOKCyM_162Hb1Xkd6id4h_74fzQrw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: renesas: rzg2l: Replace
 of_node_to_fwnode() with more suitable API
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Fri, Aug 23, 2024 at 1:01=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> of_node_to_fwnode() is a IRQ domain specific implementation of
> of_fwnode_handle(). Replace the former with more suitable API.
>
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -16,6 +16,7 @@
>  #include <linux/of.h>
>  #include <linux/of_irq.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/seq_file.h>
>  #include <linux/spinlock.h>
>
> @@ -2624,7 +2625,7 @@ static int rzg2l_gpio_register(struct rzg2l_pinctrl=
 *pctrl)
>
>         girq =3D &chip->irq;
>         gpio_irq_chip_set_chip(girq, &rzg2l_gpio_irqchip);
> -       girq->fwnode =3D of_node_to_fwnode(np);
> +       girq->fwnode =3D dev_fwnode(pctrl->dev);

While this looks correct, the new call goes through many more hoops, and
is not a simple inline function.

Perhaps just &np->fwnode? ;-)

>         girq->parent_domain =3D parent_domain;
>         girq->child_to_parent_hwirq =3D rzg2l_gpio_child_to_parent_hwirq;
>         girq->populate_parent_alloc_arg =3D rzg2l_gpio_populate_parent_fw=
spec;

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

