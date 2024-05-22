Return-Path: <linux-gpio+bounces-6555-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 123EE8CBF27
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 12:19:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A46C1B20A8B
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 10:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC4B81ABA;
	Wed, 22 May 2024 10:19:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B4A405CC;
	Wed, 22 May 2024 10:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716373186; cv=none; b=RLS1VUiDMp9RQYY693Bo8eame7V59znAXh/Vh19zwVTAzysPyakf/wcG57M2Lht5CzrSkr8wA/B+jWhCnXwdFx9nmFZlD0bklFlE8zpD3FHl550WbrrcDLedkC5s798Ej1fm0bJoSXTj2rPRmVce1OE9kU50MzspSWwNWRrLFYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716373186; c=relaxed/simple;
	bh=h/WrScmV7jrD1kirJW74TuxtAnU/XPNByaPbQ1ps5Eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hRM72NCVryuU7hsU2GDbo/1tnnPpeaOM+nG1eWLq4Q6nwUYTx4Xi9DgjgiLhYqNSzqCO5iT6gRCxasn6Y8orF+8AFETRnxDB2TsgXLMeSKMBJLhCNBlzH6PjFaiRnmNJYhHIkCDr9Cvzo8fZKDtu1PpvPaCQ4JU6DV4CfsctQlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6202ad4cae3so46598477b3.2;
        Wed, 22 May 2024 03:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716373183; x=1716977983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EbANJdHWuB2a7IymPyfXUkvFMkRGKi7YXN40vnGgOh4=;
        b=bRcuX7DmT5tI5YRRxKBXzO9xJtI/Z9p9ykxdacHacJuvYCqWepcwJ9j32Ri8g7ZP7e
         PmTBYc6Wk4O4exnYq+X6f5tFjXu4DLBOGtfSRbBjKyFIbIgljfxxDS3ZsM60jgfKqsKb
         nAV7duPMUP0pkL0ol2Y/mOfAAuff+85U70Y9oVS6xWaVQI4hmBktVx73JwFYvqhCXMAG
         ODyETgfsnF0/JDFh3Eg9HdNLVGkZXBXBB0ngWrFyFdbU3S9WH8LyOG0K0yYBbbKWWgSW
         aanCwU2m1j6xD7m15JOWNLb06EKQBLxdY//maxZ8iLs0zd/18rIISnxq7xdcZjW4UuVU
         22+g==
X-Forwarded-Encrypted: i=1; AJvYcCXiYFSLzVpSTIwq4anMqBQSRwlIMH5htCVGCavxOHdRy9VnlvXc8yhzLNtl4EJAt5qLg4kZUXgM/5VmALYQq9P9WKEunMmokNLy/3X9nLptgT9zg6hx46dRx8MBVQcNsRs+ZAAWZbDP2KBFfLGL9aRpalb366aK9yAjWgHXIyd4ixdBriFZ30XMtdOd6AAEG3j8fjfMSb3BH/7+m2tPwDvQnmCsruGgMg==
X-Gm-Message-State: AOJu0YxqZgkNQx0BjV7drQKL8kfS+jTStqv1e4ZIkVikSaPC7LCGF+wD
	7AidgHDdyA08mDSfvnVJ2k1VWuK9DK5xtrqtoKtG9+vu9z6EX2g57SyBvaJa
X-Google-Smtp-Source: AGHT+IGIChpmkFiMRpqkudu4J80oNjhMzGh3P0H4zxTtg2Nv0doirKxenJGDe7UTeD+Oo3vh0nUJ7A==
X-Received: by 2002:a0d:d40e:0:b0:622:ed44:3450 with SMTP id 00721157ae682-627e48a0dbemr14236757b3.46.1716373183572;
        Wed, 22 May 2024 03:19:43 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e346810sm58078907b3.95.2024.05.22.03.19.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 03:19:43 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-61be4b98766so7421587b3.3;
        Wed, 22 May 2024 03:19:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWA7Z1co0zWrNN6AU0xCnH0fn9bQaTfVokExwTEkX5jgSw39pkc1gdjTocc2lc+5wTtSHd3t1i0xokoe9vejM5QF3rKWJJLetTEc2ADe4HtQZM+ncOcczb5Pp/w00sGw/g+O7tIpZySSwZsxm/mPIvjrfZahI6oZTWtg3d3YbQweHw6Ub+wueMvmeWq0RYoNCfyArsFW9MaAVHOh8OY1x+Gpji2K5czsw==
X-Received: by 2002:a0d:cc4a:0:b0:61a:999f:e499 with SMTP id
 00721157ae682-627e471f818mr15049237b3.22.1716373183070; Wed, 22 May 2024
 03:19:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423175900.702640-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240423175900.702640-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240423175900.702640-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 May 2024 12:19:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXUM-s5RQXgKQUtqu5=fVTFk5Ajg2WNZ2eAiy5Lr-tX5A@mail.gmail.com>
Message-ID: <CAMuHMdXUM-s5RQXgKQUtqu5=fVTFk5Ajg2WNZ2eAiy5Lr-tX5A@mail.gmail.com>
Subject: Re: [PATCH v2 03/13] pinctrl: renesas: pinctrl-rzg2l: Allow more bits
 for pin configuration
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Tue, Apr 23, 2024 at 7:59=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The pin configuration bits have been growing for every new SoCs being
> added for the pinctrl-rzg2l driver which would mean updating the macros
> every time for each new configuration. To avoid this allocate additional
> bits for pin configuration by relocating the known fixed bits to the very
> end of the configuration.
>
> Also update the size of 'cfg' to 'u64' to allow more configuration bits i=
n
> the 'struct rzg2l_variable_pin_cfg'.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> RFC->v2
> - Merged the macros and rzg2l_variable_pin_cfg changes into single patch
> - Updated types for the config changes

Thanks for the update!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -78,9 +78,9 @@
>                                          PIN_CFG_FILNUM | \
>                                          PIN_CFG_FILCLKSEL)
>
> -#define PIN_CFG_PIN_MAP_MASK           GENMASK_ULL(35, 28)
> -#define PIN_CFG_PIN_REG_MASK           GENMASK(27, 20)
> -#define PIN_CFG_MASK                   GENMASK(19, 0)
> +#define PIN_CFG_PIN_MAP_MASK           GENMASK_ULL(62, 55)
> +#define PIN_CFG_PIN_REG_MASK           GENMASK_ULL(54, 47)
> +#define PIN_CFG_MASK                   GENMASK_ULL(46, 0)
>
>  /*
>   * m indicates the bitmap of supported pins, a is the register index

> @@ -241,9 +241,9 @@ struct rzg2l_dedicated_configs {
>   * @pin: port pin
>   */
>  struct rzg2l_variable_pin_cfg {
> -       u32 cfg:20;
> -       u32 port:5;
> -       u32 pin:3;
> +       u64 cfg:46;

47, to match PIN_CFG_MASK()?

> +       u64 port:5;
> +       u64 pin:3;
>  };

To avoid such mistakes, and to increase uniformity, I think it would
be good to get rid of this structure, and replace it by masks, to be
used with FIELD_GET() and FIELD_PREP_CONST().

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

