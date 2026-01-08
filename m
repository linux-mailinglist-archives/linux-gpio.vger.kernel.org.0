Return-Path: <linux-gpio+bounces-30294-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7D9D05649
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 19:11:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78C333049F03
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 18:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEFDB2EBDD9;
	Thu,  8 Jan 2026 18:08:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2582EBBA1
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 18:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767895703; cv=none; b=kCxgLqKLtMT+J7BJNzpmngA2i29YkKS2EGs45C0PEt0dDUGDD3mBwX5Attd+8AolcmzWUTvXVa90rTiYxf9VuW/9nZ1jKWJUN83lVGQv+nprv/fCgpfhkukqWeg8HDK10ksqd1/ehYlaSDQsMZCF2Fmb/E9HaJcCSyPwqaOZfTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767895703; c=relaxed/simple;
	bh=2xO+ZHQ5A8qFLt3P8aROWKAmWa7cUbLqr/lnbgCw24c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FQOuQ0bLjT0BbHuZw+qeLZRJScCcA/+VCok2YqVyA55tnbkiafVXSQVFZVQsw+bWGEAG3KlVmxpoIIvXZJY1trlb7z99SsUo0A0PJm/tZxp6yWl8+3HOToSGxN0Wthehq1LcL93VjLC0yuBG9bRgNoQSExUAb9m3iCg/lGz9E4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-93f542917eeso1120049241.2
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 10:08:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767895698; x=1768500498;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfFjVTiVA/VL3JBWaNXNVyzJkm9nYhmIUTtZUIKm46g=;
        b=ABUsAQ2q6gScWIDM8Tm8VXVRjcI5k7vbCcTI4LlIGGzjPHsP5t0mYeXrUYwqXb+sog
         GiHwgxe5MZ2foaeyAxHCOU9BMgrHBfCaVxT9vo4MuXSWaOdl5UIG7M7QyBnFnnbx6JL+
         7HiHFppYKZCm6v66oIw2n/XZ6x5Lwdaq9vm0OqHRIoYxJWNF38HryvApzfImziigDHEU
         iRLl1Ms2gUJzhkb04W+Fa54nEAlt1Jhbuh/ZV4NqQGWnsD5VUk2jbhzFQ6QehR9gCt1S
         5OExvqcl4hOgHsyiQ7ZTrXSdTBbkTejpNveG30ZwIBZPVv2izEZXEon8Uuu6+Xy5vPFs
         BXZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr5DuUEAbSAWv4k/J4/a7XPBxgD1psq2fK/12o3vFImF/jFoIvaLB8YzdGPysplKZWhCnyBnkX1n8A@vger.kernel.org
X-Gm-Message-State: AOJu0YwhrZp43HJqhVYox3d3WqVebFoFYLeovcqP0h3es7I1Gp7GBwTm
	Ku3oYkEPYiTM4wyQ6AApLfa9tBT+L5Z5wdcqGzfuyMA9DOZVN9uMR1AoxEJa364v
X-Gm-Gg: AY/fxX5cS/Jv28nG4+x59mn4HczIUxBSTEb7WFqrPoDtxXX+KmzoeI0d6M0e/yGVhDY
	+O/4v3tbZQ8pwOFFGMEJ6GE6D71XZCodYOEbiGzhzB7cS7pDZiSpwtCvaMDpB0AXyirozV1BPYh
	RrchNHpappw5+LrEZV9cPhoWtO5mnSc0SueWlnf7NPxF/7KNSRCE7d62nMj31FbLUHONslvX2BY
	Yd+iSSlyWa4ERv07g7H6KQ62MG2CI1SoE8wkSrduhI6qP5I7SwKY8FvMPOnokFz8d0TJYcrefAg
	6/pCe8fk7QMQ9RzOKpZ2ywff1C4u8Og6EhsVfSDO3PkIvwe0Cy0TYgE12tFURFPzqhKgrWZqKOO
	2xxgMJoTsSXjIXqTHofVdXr4u8NX5QOaH1dk8nfeuhRibsSRmdjsbYfwDIl3FDCiexQwfoNPs61
	Qvg41uOekp7/1XhpFLYbS7QoztofXSYKhKPoPE6oOlfS98+nTX
X-Google-Smtp-Source: AGHT+IGaL8Td3lPb8m5eK86lMAMAgJlVFnR7KfLJajCNT8Xy5HE20kmmYB8BnWuL+fP8ThHQg/Z4fQ==
X-Received: by 2002:a05:6102:e11:b0:522:86ea:42c with SMTP id ada2fe7eead31-5ecb6866d0fmr2882129137.11.1767895697744;
        Thu, 08 Jan 2026 10:08:17 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944124e906esm6456740241.14.2026.01.08.10.08.16
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 10:08:16 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5eae7bb8018so1328003137.2
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 10:08:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXmf8K15isNIvuh1aZ4QIsuj9ZTuXm8ACvkT3QC+ReZ2EbE7rhwvC+xPDdNpUhp1EBhNwXvSMIQ2Jm7@vger.kernel.org
X-Received: by 2002:a05:6102:6f07:b0:5ed:c98:37f1 with SMTP id
 ada2fe7eead31-5ed0c983b52mr1804827137.1.1767895696438; Thu, 08 Jan 2026
 10:08:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251205150234.2958140-8-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251205150234.2958140-8-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 19:08:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWSB=9d7jwFcLjJY3zJjs7neFJ+tr+GtTDAU85=o8xK1A@mail.gmail.com>
X-Gm-Features: AQt7F2oZ7EpOfRC5VK28dLvBYQp2AsKz2b03nI7P4C3otujbnCexl7cMnsmNYpA
Message-ID: <CAMuHMdWSB=9d7jwFcLjJY3zJjs7neFJ+tr+GtTDAU85=o8xK1A@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] arm64: dts: renesas: r9a09g077m44-rzt2h-evk: add
 GPIO keys
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Fri, 5 Dec 2025 at 16:04, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H Evaluation Kit has three user buttons connected to
> GPIOs that can be used as input keys.
>
> Add support for them.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> @@ -7,6 +7,8 @@
>
>  /dts-v1/;
>
> +#include <dt-bindings/input/input.h>
> +
>  #include "r9a09g077m44.dtsi"
>
>  /*
> @@ -60,6 +62,37 @@ / {
>         model = "Renesas RZ/T2H EVK Board based on r9a09g077m44";
>         compatible = "renesas,rzt2h-evk", "renesas,r9a09g077m44", "renesas,r9a09g077";
>
> +       keys {
> +               compatible = "gpio-keys";
> +
> +#if (!SD1_MICRO_SD)
> +               /* SW2-3: ON */

Shouldn't that be OFF?

> +               key-1 {
> +                       interrupts-extended = <&pinctrl RZT2H_GPIO(8, 6) IRQ_TYPE_EDGE_FALLING>;
> +                       linux,code = <KEY_1>;
> +                       label = "SW9";
> +                       wakeup-source;
> +                       debounce-interval = <20>;
> +               };
> +#endif

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

