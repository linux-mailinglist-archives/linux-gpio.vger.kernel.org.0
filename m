Return-Path: <linux-gpio+bounces-28646-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8878AC68C7E
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 11:20:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D890E4F1AFA
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 10:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C439E33DED3;
	Tue, 18 Nov 2025 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0XpuBiB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9122533FE1A
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 10:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763460979; cv=none; b=nNU+QRvIPJBleaPsJafR3GW8b8fYi5q8Xfxw7Aezgc4hgHutcsuDMD7NW34FCcCofEo1xWNdte2mfP/QvWZKETc6nJrxUv/QxmZlTNPi5f0i8JMMeDC2RFm+/VdEa1Xh14/kq7c+5tnHZoaabyt60ZeSVUDqo5xm5VSVMBJOhuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763460979; c=relaxed/simple;
	bh=KkZMZqyB5eWUZrzPQXKcKmAdMoBJnYI98RasHB1ZAO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N5q/PQ0CNqwPicEgbcX7jnN/7J96HWF1io1Qu5hj2Gi1l/zQ867dZz+8u+ZOUUh8GaA3deGMxXw1JP0dE0BZY5D+Qjno5YQNNonlCtqfzKweDx3Kn1GiDzI8a1wR9IsSnjIPwwVubaNPvnRsLAFfa9P+3oizjAQYAkelT4NcUgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0XpuBiB; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b7277324204so726613166b.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 02:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763460971; x=1764065771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkZMZqyB5eWUZrzPQXKcKmAdMoBJnYI98RasHB1ZAO4=;
        b=L0XpuBiBNW/qtp3KJd7UB9E6ELFzyJeySGWEPuQfsrnmrB42ebn+x58f/uqAd89PYX
         rT+IhXKGxZCwf03+9co2w2GGOwOnTH15smm2kUdzGq0LBCuXZkbHXR0cJe6oWcwN1lQL
         WCbeeS9dKyeNYchUxi0czRTeWWG5j0nWoj0znJb1CZMJUiQxVCC9zk4tfII16OOzkW8P
         0UWp4B72upAWPS7vdL7YQJlTFBntyWUJDOYJAtcqZqPMVfNlmkntToUQyvd0HK0RPSfx
         sPlxo9bsMpJScpzovjevk16E7SziZ5gkP7SsfgnJM2pUX2tkiNcMEbmq/yJxTm35Qb/S
         rRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763460971; x=1764065771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KkZMZqyB5eWUZrzPQXKcKmAdMoBJnYI98RasHB1ZAO4=;
        b=uwvWe6hvLEP0So9Qf2tZ5YfENt3xN/ll3RinVLEPbqmwxx+kYsgANUUdmoFKSO7w+9
         ymLalBe/hc05YRqEB2g4wSRaWG4YW3LvP33JICzYe9XvVSPcTAcnXIAcSB+eGZLCqEew
         rx/DtE1vtnAZqWgeCNEv4UY82qtX807fSgDl4NMa1+3XWoT1/uJfz8c8xMv9hlrzyFEC
         6fGCR8JYi4RWEzPOwKsprqONKYedmjKDTY/Ak7Edb9IrVZsZZb6kCNQil//Ex/niiGMe
         q8DNbktH4qvS+tVvBDCCOO1en64mxf7yYMiSQxV1TNYmkJ4Ac06YcmSTJaP1ko6i3kH+
         71hg==
X-Forwarded-Encrypted: i=1; AJvYcCXwee1gb19qOPwYtvEXBQbUKKPF1SDDh6D4fw11SGYZqjPLYyZkw244qJjRwxnR1t35t/133Xj6XFMz@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn0VQr7wSadigi2rm7v8n/p7Faeai4EHWf8ryQ6d7vvzYG3JOx
	ME6Xrgh1uTX4NzLBNZ0PNKqpUkukDCpO62S3U+5R1gaBCwByIiiT3VKMq+tKvAh12HpdILUuL6K
	g/XfkJIp9W9SgTCjiqqaNJPXZoiYKucw=
X-Gm-Gg: ASbGncvL1oLC9qUQ2YWFakuS8lMabvkdzE4kLorD1g2SDTUdECuUkVVTJzzpd4FAfOT
	dD45HFYCvrszPbn12w+MpZl0qo2Y1VFBNCM5G1yQN2tUkttc/vPZL9idYTKVBVhsBX2FgbRQdcU
	XW1UHe/6nIQbnmLukU9V0H2gJo2avXJypf0qGlbUvXpggSa+JPPvhi6PeiWcuDs6+hPLf6XDZXS
	seWP7S96P+AlZ483XEA6btHAJqzcXHXwbomL/vQWqDt/l5tzxl8xrrYKFZma13U+W78rjKlXp2j
	ed02c0ksd6G14xB4lGKGTCCyYhfVuEB/QdO0cXrYax/fcJA9ge8oizcvxuWEsU6O8SExmPQ=
X-Google-Smtp-Source: AGHT+IHWVqaHds/q+LTdhqRXaLWytjahqcnDcixSB6BIfNsrZiukSD6Fp2tjp7MP7I7eFis6nLzSaJ0KogSHuqCHmsg=
X-Received: by 2002:a17:907:9622:b0:b73:7280:7821 with SMTP id
 a640c23a62f3a-b7372807e5emr1454519966b.60.1763460971389; Tue, 18 Nov 2025
 02:16:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118003229.26636-1-jszhang@kernel.org> <20251118003229.26636-2-jszhang@kernel.org>
In-Reply-To: <20251118003229.26636-2-jszhang@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 18 Nov 2025 12:15:35 +0200
X-Gm-Features: AWmQ_blAt--6c37TNGtYz06A9WDhIGNjmkfqZdEk3NoJJOsCX6O0tW-2H1DDGnU
Message-ID: <CAHp75VeB1L5ZwQx=uKqaCMsij1ghFH+Kw3jsLa4qFxnWV1vTyw@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] gpio: dwapb: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 2:50=E2=80=AFAM Jisheng Zhang <jszhang@kernel.org> =
wrote:
>
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
>
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
>
> The dwapb_context structure is always embedded into struct
> dwapb_gpio_port to simplify code. Sure this brings a tiny 36 bytes
> data overhead for !CONFIG_PM_SLEP. After greping the arm/arm64/riscv

SLEEP
grepping

> dts dir, the max port number is 6, the berlin2q soc families, so this
> means current we have wasted 216 bytes memory which is trivial

currently

> compared to the system memory.

I still think the embedding is not related to this change and should
be justified in a separate patch. W/o that part the rest looks fine.

--=20
With Best Regards,
Andy Shevchenko

