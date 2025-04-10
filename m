Return-Path: <linux-gpio+bounces-18643-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D3012A83EA1
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 11:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9ABB77AE038
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 09:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16AC42571C3;
	Thu, 10 Apr 2025 09:28:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173AA256C9C;
	Thu, 10 Apr 2025 09:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277335; cv=none; b=mecyE37gG4QZubQrxUh+uE1Casn3GpUsyLp/fsf3A67n5fAa8B8hsk7cVgQGcLRWhp50bTZYRgfn1gF7xNl7K1s4Xoh9lTOzgXbA8qnOL2OB9kof5PPYJQ+aUeAZFokIlVV1oxg1CSlkCv0X30+Cstwc/ZlS6lQhTxRxlQ7lbRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277335; c=relaxed/simple;
	bh=j0cR0UkHwVBhvb6qrzH2gIti95jd2tW3Z9zzf4mBamI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rpQx5+e8zmvxC/83IeLMIJg66qoBwafMn4Vi7K6tKBcUYHZxVzlvB5pZOfPOXPjKO8cTjzxvfe3rF8OsepuIbX4yTF4hOSRmngcQ7tM2LQHR5xpD8e4dJQgN1DJ1rieB6S3gaSjlEZQmuD8RrlhHC/vFl/yaRnemz7c7xvnZ9aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-523de538206so293872e0c.2;
        Thu, 10 Apr 2025 02:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744277331; x=1744882131;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBl1rpTFmuBR/zPu0dOpPN0jRShCrJGGB5hAKx+yje8=;
        b=TXsTta4FZxYpcQh9OoKCny3ffXlyOEeBOge8ibTG0NuZGGALVaOj0Oo0DHLXP7D0Pq
         zzpselrfbPwt+Tc/bSqeG10P1vK7atadhS5Oetpyhvf+OsJLmFMB2CmJ9CtXshVqxfKt
         6+VogFWrfqwx89PQLHun2GBYMwwQ6383AORKGXRotHdMy1ZsWj9iOBsRtVzQrmQfM5WT
         yP38+sH4ayBLfRqHpFhhtXjqsMbZaPh05wjad4oeCPLZDC77VHAAJmTCNPZFg3QBNFne
         3asJbzCAlX3A1XlLnvm9Epp7VyO1t8F6L2xgi1k8evvbpT09hPRqkvbz/46S4WB77noj
         4pgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7VIbO56DGIEZ4Jj+kgH/RuBK2iWhG9dQpvvK3irt3EzKpMTRXgxzF7q5OWkym1lb6aOzwBjqeoWdwmQ==@vger.kernel.org, AJvYcCUklrK+Sgj5lLHI1xWOKEnjfFXqou/qaLlHRlH7isVpV2ZfE55u8zQWv03JSr1hP3+PueMa+lTzYUMG@vger.kernel.org, AJvYcCUxfjj6U9s6s7dyFrDJIFTHMsYFHd0IjtwZSacUYU17hv/23f1DDOATN8o+w4/T+eAZYz9dC+knKXJJds5p@vger.kernel.org, AJvYcCVNYLRP2InocjQuwlv3/evmrebBY3Fs2tDWVbUPLY2rRuqrIXwMQmQBWPRAj7zPEPQbOXvHvvbN8NFGcvdW@vger.kernel.org, AJvYcCWeaVzfEkeX+BUuC5UpYleHO8thawqsNmrM+EsqG0OhNjVJRDzVLqOPNt0S1UkK/bA7WxoFVtpyLVl8@vger.kernel.org, AJvYcCXkQ2Spbe+Edo8iTwZtGwLwWaBEgSCOb8fcWnV375iJNu6vtxyTCE1bSdMjtMUOnbTBGqwXLzqNoy0bqPLp1T2RhLM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqW4GxdmCOz1MziVhnYNPMYKOMDKpUfCoBrv10v7zHymtu0OcV
	7jgEvzCKK1B1PErxawnI3gRolGshHtvbKCGQRntqdREbd0TlCEcxRXZkIBkR
X-Gm-Gg: ASbGncuU+5AxS7kIdkjAYBH7uAJ+KI98R8fA8hsmCauQG0qOEnG9eT+qwEgQ7v7NrUY
	Cx0Ks9RkReb8dyoNdW2A38K+cA5HB8eagCQX5A98ameEbGstwMV/wWvOuGIcrzpM+r/Ugz0He32
	YrqZ4MKfrzqx4rcV8chp7XIr9pEdqCicRcAJaM5mpjw8YomgL55HpPxeQ/TygMwDCWVysTDmNjX
	kc7RyhkiL2n+6iYk8uxUTcHSxXCwHPfsUPIeYeYz4K+ZPSUhZXtu/Ir1xI9Y3UZ6wHIrt8L/gou
	Fl8WDiPaFRbBxkmD4wopzAr5cqelE9HumiFVlqv9bRy6NlACRpUIQgBfHqdrNzkXISQReNXkCqZ
	eaNo=
X-Google-Smtp-Source: AGHT+IEp1dzmPfmYoXoV7GiRH5Sn7oB3ysaFgUw/bRRW5GdV+CThvRd2Re69rTPihq0vbvCLu6+OLw==
X-Received: by 2002:a05:6102:1528:b0:4c5:1c0b:4ee9 with SMTP id ada2fe7eead31-4c9d36295aamr1187237137.22.1744277331428;
        Thu, 10 Apr 2025 02:28:51 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c9c9738376sm522168137.6.2025.04.10.02.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 02:28:51 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86d3805a551so255790241.3;
        Thu, 10 Apr 2025 02:28:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGXGo3OY1lPDCzdamUc5NTwM/kVpZqfuIg3qSMgDYDTyiZNCzgHcFB7zID7s7UiYvRXFM7R1M7vxHpzDwu@vger.kernel.org, AJvYcCVVvgo+CRhBZopJA4ETv30j3aDevzUh+mJ2oye7lGaNyUIYsF1aPnbQyK5DBNBjLUgEwKgy43e5WtqN@vger.kernel.org, AJvYcCWQe07LIydN0jNmxhJzqmyeBOv6kFntCdCADxTS2CCeAnV7wEysAyQcTgMKz2Z8uxzJLed51Ad6aV2a@vger.kernel.org, AJvYcCWmNOdu3NWtg9oicAzMUS38WEkgyLqpun2Rhj9NHGZLF1WJJLW+YhkPh5bf9w3CD1tv6qVa0iCPLM9UT8Du+C8XW4Q=@vger.kernel.org, AJvYcCXbOWCDSEM+Znvt3rVAD57lyuYFPHNuzwuANXV/VGWkhh0w0M9KyKXgEgFIC9fK3GaajrE7EDLDfsaNZMjC@vger.kernel.org, AJvYcCXd/tW7x03Q/lgEHnOEeYuyJa+BaZLJzScknQxT9oeMoU4xLYcdjDkA8GagNHGrDNaBQmXkqlwNjKWtwQ==@vger.kernel.org
X-Received: by 2002:a05:6102:1528:b0:4c5:1c0b:4ee9 with SMTP id
 ada2fe7eead31-4c9d36295aamr1187228137.22.1744277330836; Thu, 10 Apr 2025
 02:28:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250407191628.323613-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250407191628.323613-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 11:28:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVjrHN8e-yWTFWE1BLfnQKDeYsvuGepkoqcgxrR+CK5+w@mail.gmail.com>
X-Gm-Features: ATxdqUEYc_Qs25l4gr_1nikV9rdWYeVtBxciGQr8vWSlUzu_O6eXylqnRYziDHA
Message-ID: <CAMuHMdVjrHN8e-yWTFWE1BLfnQKDeYsvuGepkoqcgxrR+CK5+w@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] soc: renesas: sysc: Add SoC identification for
 RZ/V2N SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 7 Apr 2025 at 21:16, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add SoC identification for the RZ/V2N SoC using the System Controller
> (SYS) block.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/soc/renesas/r9a09g056-sys.c
> @@ -0,0 +1,107 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RZ/V2N System controller (SYS) driver
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/string.h>
> +
> +#include "rz-sysc.h"
> +
> +/* Register Offsets */
> +#define SYS_LSI_MODE           0x300
> +#define SYS_LSI_MODE_SEC_EN    BIT(16)
> +/*
> + * BOOTPLLCA[1:0]
> + *         [0,0] => 1.1GHZ
> + *         [0,1] => 1.5GHZ
> + *         [1,0] => 1.6GHZ
> + *         [1,1] => 1.7GHZ
> + */
> +#define SYS_LSI_MODE_STAT_BOOTPLLCA55  GENMASK(12, 11)
> +#define SYS_LSI_MODE_CA55_1_7GHZ       0x3
> +
> +#define SYS_LSI_PRR                    0x308
> +#define SYS_LSI_PRR_GPU_DIS            BIT(0)
> +#define SYS_LSI_PRR_ISP_DIS            BIT(4)
> +
> +#define SYS_RZV2N_FEATURE_G31          BIT(0)
> +#define SYS_RZV2N_FEATURE_C55          BIT(1)
> +#define SYS_RZV2N_FEATURE_SEC          BIT(2)
> +
> +static void rzv2n_sys_print_id(struct device *dev,
> +                              void __iomem *sysc_base,
> +                              struct soc_device_attribute *soc_dev_attr)
> +{
> +       unsigned int part_number;
> +       char features[75] = "";
> +       u32 prr_val, mode_val;
> +       u8 feature_flags;
> +
> +       prr_val = readl(sysc_base + SYS_LSI_PRR);
> +       mode_val = readl(sysc_base + SYS_LSI_MODE);
> +
> +       /* Check GPU, ISP and Cryptographic configuration */
> +       feature_flags = !(prr_val & SYS_LSI_PRR_GPU_DIS) ? SYS_RZV2N_FEATURE_G31 : 0;
> +       feature_flags |= !(prr_val & SYS_LSI_PRR_ISP_DIS) ? SYS_RZV2N_FEATURE_C55 : 0;
> +       feature_flags |= (mode_val & SYS_LSI_MODE_SEC_EN) ? SYS_RZV2N_FEATURE_SEC : 0;
> +
> +       part_number = 41;
> +       if (feature_flags & SYS_RZV2N_FEATURE_G31)
> +               part_number++;
> +       if (feature_flags & SYS_RZV2N_FEATURE_C55)
> +               part_number += 2;
> +       if (feature_flags & SYS_RZV2N_FEATURE_SEC)
> +               part_number += 4;

The above construct can be simplified to

    part_number = 41 + feature_flags;

> +       if (feature_flags) {
> +               unsigned int features_len = sizeof(features);
> +
> +               strscpy(features, "with ");
> +               if (feature_flags & SYS_RZV2N_FEATURE_G31)
> +                       strlcat(features, "GE3D (Mali-G31)", features_len);
> +
> +               if (feature_flags == (SYS_RZV2N_FEATURE_G31 |
> +                                     SYS_RZV2N_FEATURE_C55 |
> +                                     SYS_RZV2N_FEATURE_SEC))
> +                       strlcat(features, ", ", features_len);
> +               else if ((feature_flags & SYS_RZV2N_FEATURE_G31) &&
> +                        (feature_flags & (SYS_RZV2N_FEATURE_C55 | SYS_RZV2N_FEATURE_SEC)))
> +                       strlcat(features, " and ", features_len);
> +
> +               if (feature_flags & SYS_RZV2N_FEATURE_SEC)
> +                       strlcat(features, "Cryptographic engine", features_len);
> +
> +               if ((feature_flags & SYS_RZV2N_FEATURE_SEC) &&
> +                   (feature_flags & SYS_RZV2N_FEATURE_C55))
> +                       strlcat(features, " and ", features_len);
> +
> +               if (feature_flags & SYS_RZV2N_FEATURE_C55)
> +                       strlcat(features, "ISP (Mali-C55)", features_len);
> +       }

The above looks overly complicated to me.  What about handling it
like on RZ/V2H?  I agree having 3x "with" doesn't look nice, but you
could just drop all "with"s.

> +       dev_info(dev, "Detected Renesas %s %sn%d Rev %s %s\n", soc_dev_attr->family,
> +                soc_dev_attr->soc_id, part_number, soc_dev_attr->revision, features);

This prints a trailing space if features is empty.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

