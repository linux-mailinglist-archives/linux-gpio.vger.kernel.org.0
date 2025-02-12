Return-Path: <linux-gpio+bounces-15864-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F336A32863
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 15:28:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B6AE188A7F1
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 14:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30077210182;
	Wed, 12 Feb 2025 14:28:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B5020E70B;
	Wed, 12 Feb 2025 14:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739370487; cv=none; b=MQo/C9Zr6V2CUx6wjvj5phCSqsu1HWIRgSkHLHpqotNICmqmZ0ATMHkrwWLmVLiEzxv+pizCyzgha5gCD8/Y8a6HfluSEpOSoHJ3HRsOanAETJdB+AsB5zo6GZIo0S5QcDHQGJ7wpohSC8/c7TjrYY9rX2pUt1TXTpRLC/IKz9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739370487; c=relaxed/simple;
	bh=ufar0w70vXNNGPtC5NL0LW5K23clTayPogTX1Ff5/10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BlneANpdueLEWsUR/8U8gpTgORJrJyKBfl3mnqfWaE+E0IsgAO7/STlpOWQVOYDoQ7yavQPXGQu05QO+9xWwTApNAoZIhtmrcavPUdcHwAIbeiIf2DJxXevyb70DG2Ja0bWEjdNuIflt/iU0nBWS79fkQwPh92c8bHF4Rax5UHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5203bbb969cso1001993e0c.3;
        Wed, 12 Feb 2025 06:28:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739370483; x=1739975283;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhC8rf1vpQF8mEfYpEVkOS/fQGbyABinaAFRiAMwgnc=;
        b=QNeF8O4Q453wpBp1MVB8Z6bI3JbH3UPg5G4FdgTTARlwo/gKEyYqOlI9dNRrc+q6Fu
         /oliOMkXmNHdNYvCz8A2hpXtS1yVUUlvhbEz2QhphxJqyQUQBG3NdpvlkH5GdFxTmP9l
         bycO9WL2e2RED8Nv7KTAeLDoHG5XvAn3Q2UyFEzTxoiL3mzHtHyzkir4yNiTabCJKbqh
         NMFEF+RRVB21Uik3lcCEesquLVOfuqa2bcojuq2ZCVMCbkDrIrDkwt653e5u8h36T3+R
         TUAGgq3MbU7GiRbKlFGbIA4qrmleb0eQJuq6R/aT/yh+ZUd3l06wqikd0YXuXi4hM3BO
         AIlw==
X-Forwarded-Encrypted: i=1; AJvYcCUS3zLyVje5HTQ9jAMaHnM9JIoPaGw9KGZ0kcr85tadZlW/Nz7MYFovI2p7KG4pbiJJR6MxW+jiRoSJLgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRl1duqVUOurVnbDGqszLgVqRIxbsqtNIgnnwSz7Xt/lRTzTAw
	ZO2waxARuZpXx8H95EeefCL5c8MLLqUnFE7jXFrNivu50c2CblcTiDK+1YfKEmI=
X-Gm-Gg: ASbGncsMEs7eboCBgbpMrdW8nQoG3DEi416FIoXpsts5R6GPwrkxsL5r09keWunj9Uj
	tp9R5ljtExcckPWxBdZhnetnc26Rk2nLK6pf5rPyvpECYXJA1JqXHiVuVZKsuOD1/i6NacI0Zdj
	V0+4+6beYmnNMAkXLzLbyhHpGpAmZ/SaBro2h2pQ8vQI+JSrXYJK7ANVXU+XpvIwy9CxQfALlTI
	Pl513i+1MShftc6xfgNd3FDLCQjWN2ngCL+YdCHqmYP2DOvZXQ/mhdh754O/Mo9dkMIe++CafEb
	N0u2QCr0+epWZZfK0C6TNCgD8l+hDyf1I3gp2+oisyKY8uqzjz0jKQ==
X-Google-Smtp-Source: AGHT+IFk7A45UpLIIfqXuAg3ZqeVp8n1Q9AmiaFqBrxsIOU3pyplxMffDZXA1UI0Yaqzz2w04ESh/w==
X-Received: by 2002:a05:6122:1683:b0:520:61ee:c805 with SMTP id 71dfb90a1353d-52067c2e4f3mr2929318e0c.3.1739370482895;
        Wed, 12 Feb 2025 06:28:02 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5204900cfd1sm728366e0c.29.2025.02.12.06.28.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 06:28:02 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4bbefec9362so374175137.1;
        Wed, 12 Feb 2025 06:28:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUCYZLrtAk/xyNn3bDhJYtrOKuKeYCdYXLFAcSrTQ3b2Jb6WIKXf7Y8wx7rsRKafx6cGhaTuO3UA1JZP8Y=@vger.kernel.org
X-Received: by 2002:a05:6102:50aa:b0:4bb:d062:436 with SMTP id
 ada2fe7eead31-4bbf1fbb722mr3249274137.0.1739370482234; Wed, 12 Feb 2025
 06:28:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203031213.399914-1-koichiro.den@canonical.com> <20250203031213.399914-5-koichiro.den@canonical.com>
In-Reply-To: <20250203031213.399914-5-koichiro.den@canonical.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Feb 2025 15:27:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXnST1Y3oxEz_r59urauZ42nrtL5P4+rnPEsgiKgENOOg@mail.gmail.com>
X-Gm-Features: AWEUYZkY4h0ACOAIiyzE48Rv0lGMuOcaZQjgQi3518er7EMQfREuJN-qKiMAuG8
Message-ID: <CAMuHMdXnST1Y3oxEz_r59urauZ42nrtL5P4+rnPEsgiKgENOOg@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] gpio: aggregator: add read-write 'name' attribute
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, brgl@bgdev.pl, linus.walleij@linaro.org, 
	maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Den,

On Mon, 3 Feb 2025 at 04:12, Koichiro Den <koichiro.den@canonical.com> wrote:
> Previously, there is no way to assign names to GPIO lines exported
> through an aggregator.
>
> Allow users to set custom line names via a 'name' attribute.
>
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>

Thanks for your patch!

> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -63,6 +63,8 @@ struct gpio_aggregator_line {
>         /* Line index within the aggregator device */
>         int idx;
>
> +       /* Custom name for the virtual line */
> +       char *name;

This can be const.

>         /* GPIO chip label or line name */
>         char *key;

Actually this can be const, too.

>         /* Can be negative to indicate lookup by line name */
> @@ -678,6 +680,44 @@ gpio_aggr_line_key_store(struct config_item *item, const char *page,
>
>  CONFIGFS_ATTR(gpio_aggr_line_, key);
>
> +static ssize_t
> +gpio_aggr_line_name_show(struct config_item *item, char *page)
> +{
> +       struct gpio_aggregator_line *line = to_gpio_aggregator_line(item);
> +       struct gpio_aggregator *aggr = line->parent;
> +
> +       guard(mutex)(&aggr->lock);
> +
> +       return sprintf(page, "%s\n", line->name ?: "");

sysfs_emit()

> +}
Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

