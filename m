Return-Path: <linux-gpio+bounces-15873-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB4DA32AF4
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 16:59:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75133188CECA
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 15:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52BC42135B7;
	Wed, 12 Feb 2025 15:55:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088A7211719;
	Wed, 12 Feb 2025 15:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739375743; cv=none; b=WIkNI60I5OCcNFgbpM7pzWjr0BIFA7ylqSRlYT8jlXsYZBzSqdgNy/c5Hdso67JAgCzrUNI4aKHMkEqpiPmoAwvTCFScg+a3c46cancC6/jOMrJ9961d7ncabX0iqlYyyj0Pf06BYCrFx/GBTOP+YumxbksalXqWb4KVhHa6nds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739375743; c=relaxed/simple;
	bh=D5mD9IAXTnOb2cQ8W0aejURoCVrV8nKfuVaFTld4tz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mgAmHj+8pn0V3YD3HlHXQQTc/Bb+M4Rw6c9P1LWu+Gae79It69uhpkXgIA8GityC/y0fP0Z0HFwz7lnkLkctjxORz9TIHWCD+/H4tOZX19ew8OogRYQUt948WL/mBKZkjKU8NOTiWRvvp0K8M/a6Ql7N3Y8lKkkOjqxjr2zsF18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-86112ab1ad4so1964110241.1;
        Wed, 12 Feb 2025 07:55:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739375738; x=1739980538;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bforJpo8vosER9QTAjbmU387xww9JghWz4rNWUdpIZ4=;
        b=JB49GMiRWLgKinW+voJ5YVJ3IrudKPCboalgQmTHhvHWVsJriJQ8VYnsHv3q9XgvV5
         cyiHcT8F0Hz6GszWzYD4qu45MhJ0kgbSvvTiPGXLmn2P5LyY6fhUf1NavAMxOX89SxBw
         DsZ3StFQGWTMy1hyfmzfUcNYoHKNmxgXpoO8BLZ5K6wRVLZ/z328WL+JMCGvwVd8q5tp
         Hp+IU3GrTjESGrtOSVoCRq09Cyb53osH7dHkkxv5Xys4WSbeXYnZlpxqlqfZgi+Vl7+B
         v2WtaR/kUCj3ykwZplROrlUTwEXuPWYv/v7wsQakYWwljXwRd2UFEcbHWv6eWQpzcOAV
         uAiw==
X-Forwarded-Encrypted: i=1; AJvYcCUuaqNXMK+tajtK7Xu9p3KNdYS0ZHHlsnCa6hTi4XeDgoa1fkK9SekRmrjhtVX32H8kD2i5m0ePAtz9ahg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4DJSzfEFkLETWoP5HreGov6yPUIZNghwktNYoL6uR1Y7Z70qT
	s2K5l3aZv92xqa5jDZkb0HYonISQ/GxOvoiRrdnuLELN1qR0xbwT75ffMW842Hc=
X-Gm-Gg: ASbGncuD/BHMvKnaGgsgrTO5R4RyPWL8sYzTNdWlG7BrFh9/Ih4ui1YpkS+/1ozyOfX
	e2rtM2WBjBJ5MGJEnhUmBmz+e1zScq+iEjhoMzoaYpOHOqqLtc3uHb3v6NtVqq/C0EG2AVLXU6N
	D71zsZOiU6PFJKfUNA8mQF4qbBdIJTgJwtJd3ryWFbiHyDoUXI6cgmSX7kOs/ZBBLaOGnwYRTtA
	oyTgGrcl95zWSfaIHpSqkvePOTNYjA+yAgahBTief4vx66U3twStbMSzELP9JsdzsTx1oiJr76f
	I+GlYitYoitoGuDE+XFnYw+D3jroCov+Z/qBsLjJ/H8R5m8+44z8Lw==
X-Google-Smtp-Source: AGHT+IFm9tScj+pnf9kdtSHkANerT5orm3eLABTSwYPJVLx6ZwUzplqv6qD1qkUguUFGYfzyzNBuzA==
X-Received: by 2002:a05:6102:f85:b0:4bb:d962:61f with SMTP id ada2fe7eead31-4bbf225f4famr4281077137.24.1739375738515;
        Wed, 12 Feb 2025 07:55:38 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ba772d7239sm2320166137.19.2025.02.12.07.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 07:55:36 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4bbf29bb21eso271885137.1;
        Wed, 12 Feb 2025 07:55:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV8xw2+02UyVGL3JhEDjWxfEi4eCxlGZ+mQgmzI/B4OETNVl2wr0TdecQcbNAtEmgD9Z9/ABJHCIkE4FD0=@vger.kernel.org
X-Received: by 2002:a05:6102:c89:b0:4bb:d062:44e with SMTP id
 ada2fe7eead31-4bbf207f1a2mr3569901137.1.1739375736177; Wed, 12 Feb 2025
 07:55:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203031213.399914-1-koichiro.den@canonical.com> <20250203031213.399914-11-koichiro.den@canonical.com>
In-Reply-To: <20250203031213.399914-11-koichiro.den@canonical.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Feb 2025 16:55:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXBJhpWht4eo569h0kdY+evi=JTgMQtccUxf2X+tX-QPQ@mail.gmail.com>
X-Gm-Features: AWEUYZkaMMoOeL3i8ya-GXV6XGIRzVwgfwwPhpIvHpWNBuMghWvHqLgDmA99Lnc
Message-ID: <CAMuHMdXBJhpWht4eo569h0kdY+evi=JTgMQtccUxf2X+tX-QPQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] Documentation: gpio: document configfs interface
 for gpio-aggregator
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, brgl@bgdev.pl, linus.walleij@linaro.org, 
	maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Den-san.

On Mon, 3 Feb 2025 at 04:14, Koichiro Den <koichiro.den@canonical.com> wrote:
> Add documentation for the newly added configfs-based interface for GPIO
> aggregator.
>
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>

Thanks for your patch!

> --- a/Documentation/admin-guide/gpio/gpio-aggregator.rst
> +++ b/Documentation/admin-guide/gpio/gpio-aggregator.rst
> @@ -69,6 +69,99 @@ write-only attribute files in sysfs.
>                     $ echo gpio-aggregator.0 > delete_device
>
>
> +Aggregating GPIOs using Configfs
> +--------------------------------
> +
> +**Group:** ``/config/gpio-aggregator``
> +
> +    This is the root directory of the gpio-aggregator configfs tree.
> +
> +**Group:** ``/config/gpio-aggregator/<example-name>``
> +
> +    This directory represents a GPIO aggregator device. You can assign any
> +    name to ``<example-name>`` (e.g., ``agg0``), except names starting with
> +    ``_auto`` prefix, which are reserved for auto-generated configfs
> +    entries corresponding to devices created via Sysfs.
> +
> +**Attribute:** ``/config/gpio-aggregator/<example-name>/live``
> +
> +    The ``live`` attribute allows to trigger the actual creation of the device
> +    once it's fully configured. The accepted values are: ``1`` to enable the
> +    virtual device and ``0`` to disable and tear it down.

As the code uses kstrtobool(), it accepts variants of
yes/true/on/no/false/off, too.

> +
> +**Attribute:** ``/config/gpio-aggregator/<example-name>/dev_name``
> +
> +    The read-only ``dev_name`` attribute exposes the name of the device as it
> +    will appear in the system on the platform bus (e.g. ``gpio-aggregator.0``).
> +    This is useful for identifying a character device for the newly created
> +    aggregator. If it's ``gpio-aggregator.0``,
> +    ``/sys/devices/platform/gpio-aggregator.0/gpiochipX`` path tells you that the
> +    GPIO device id is ``X``.
> +
> +You must create subdirectories for each virtual line you want to
> +instantiate, named exactly as ``line0``, ``line1``, ..., ``lineY``, when
> +you want to instantiate ``Y+1`` (Y >= 0) lines.  Configure all lines before
> +activating the device by setting ``live`` to 1.
> +
> +**Group:** ``/config/gpio-aggregator/<example-name>/<lineY>/``
> +
> +    This directory represents a GPIO line to include in the aggregator.
> +
> +**Attribute:** ``/config/gpio-aggregator/<example-name>/<lineY>/key``
> +
> +**Attribute:** ``/config/gpio-aggregator/<example-name>/<lineY>/offset``
> +
> +    If ``offset`` is >= 0:
> +        * ``key`` specifies the name of the chip this GPIO belongs to
> +        * ``offset`` specifies the line offset within that chip.
> +    If ``offset`` is <0:

Missing space before 0.
Please add "(default)", so the user knows he can skip writing to this
file when specifying a GPIO line name.

> +        * ``key`` needs to specify the GPIO line name.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

