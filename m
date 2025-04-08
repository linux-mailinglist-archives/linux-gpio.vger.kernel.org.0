Return-Path: <linux-gpio+bounces-18434-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFB8A7F620
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:24:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 726517A689C
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9F326159C;
	Tue,  8 Apr 2025 07:24:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C3A261589;
	Tue,  8 Apr 2025 07:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097044; cv=none; b=HwbQSs8yeJwGZLTXWqGu3IKjIYYxnq5191SN9X6abggDWM11Os+Vf2pZRFjoqh2VrDNEn1EX4DUhpuLGJWyfeLs9t97TUqQMZ4GNn6YgWTRwtOK7iiiByeftGDncyyJVQAK328nX9jGwXlqfehoUpVgaffEi9PhIgC2XhOHG2dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097044; c=relaxed/simple;
	bh=iTDpusoco6Y+4k6a2+IWTCtigaSRBwJqfYGPmGoeLII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mvAJZIKUwLzpRA+dJiTY+PieIkwb7iWjTuTXiPZCFwL38AbHVqUm1tDndyyKQXzT0D6rm7oStgjVsEGH2qXH5H9HEP2nPYWpt9D6wJFNGFNccdqUIQ73EQQ743WoJnebb4qQeaNz7vpFT0IDAxZtF67l8bguLIqFBBMQSCAnl1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-51eb18130f9so2795370e0c.3;
        Tue, 08 Apr 2025 00:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097041; x=1744701841;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=710dm2DYp+gy41dXZbNWGaKY57T4AIMJf61TXzyo8AQ=;
        b=pbcKGj9E2sAWv4fdfRvCdF/zLXGA/j5bxnMweoN8ZMRXbD+31KOLcTcKHX6dSHAWGR
         Rx+Y///7m51W2r3A6BMWAC/A2WSBjZm6vgCh71rMnAT4tHAomhBoXouYM9SySZLjvvEG
         0VW6OQ4tKKuncjBkFVlEDef9JGdvS2izqHGvfhHHiCHfoflE8Td/AyLRkqLP9UOTDoI1
         3U+8q9nLy7mfId+jJmSayIJ3z+H6sRS7/CYoN+A6OgrBPOTavSExdoEIoHz924DqJups
         uak67xC9b7U54bkrsAjDh55u05P5V5CHUE6RyJZ6bny+j9Ylhrs4Xhav6Drbmx3oQA2N
         OHNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPJbwbprMiB2AKu6JmP8L16CjtHQS8xRMqPXxp5antlx86yFSo4sNnpS4JRX4CtEwUtlEridVOQHmnrf8b@vger.kernel.org, AJvYcCUPeJjfrSadSJ0NHmouJF1zNXGiLoUM18JzFaykcB/JzceVMa7s+YRnIInmJt4r6Q0RBffdw74aSa7m@vger.kernel.org, AJvYcCVDJ/SsjGw65jgPEOpPL3Mk/bWpx2cQyPWm8zaZkhiKHjha8S+rbl+SYiZ6QzTGjnwk/4+NekTwOe7wNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3G22BGHnvoeLuCc/hP7kRvQvAbQtLM2qUqADSzdiAaxZvygBM
	04KqjkYo+KfgwmARkPg0tEA2MbjwoTjp6QRfqCg372PomlYIIDWuC0lvINZ0
X-Gm-Gg: ASbGnctwg7OcI6qlBt8OyH421BO2vl4tjJrQOXDDASRvgY2q7aLOjqY7tu+jYvet3mW
	Ql7tATgOaVYp2fXu4mStDEWDKP16RnknYm6n7SgYMIJCc3B1qrYlX3mc7rp0/4fr8qE9CAM65gH
	iTf2RtgcOTHhjgETVRwwHkclkvmUiCoxquWqvipQ6lL+VOC3jYCXdOCvzjFVEcSHbXiptfbZURI
	bvsKJI/JZGLnBzzFBWEgPX0Z7UgrQrbukP39KvxsQIIT6rShitqdcxu4w73EOu7RCOF94hCRSS8
	wqXXXXyj6DLINA3/2EB4b5hRhtY559Yk0EFM1riZ8+62lGZnEABU5OQrCZwwfFEu5OqhGd6o2lC
	EZIH+vfQ=
X-Google-Smtp-Source: AGHT+IHXLB/4lChI27Q1TOSUxDf5kKCJBourXFVGUUh/cssJjtbt8qWYZRmFvq3W6L0m+qvpiQPiJA==
X-Received: by 2002:a05:6102:1485:b0:4bb:d062:43e with SMTP id ada2fe7eead31-4c8551ce16bmr13850886137.0.1744097041129;
        Tue, 08 Apr 2025 00:24:01 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-873ca8d0f27sm215567241.15.2025.04.08.00.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 00:24:00 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86d42f08219so2189425241.0;
        Tue, 08 Apr 2025 00:24:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUhDuieywCZ5tmbDcchfbwaaKYXWaN5BlyROb1gux096k+a+uendw3dhe0CRpnb1HpKFowit3v9Fm2VNQ==@vger.kernel.org, AJvYcCWCUzVsCRN3l4a+S0RgznBtO/32rcNwdgEY6PXHVW1wE8sV4w7Medsu3d/JAXUuIj2DFLVcmq4cY3oLUTFq@vger.kernel.org, AJvYcCX0CgoeZinr7DNfwt9RUNeNy14YX7NovZIYnKAfzUg/etXLsNU0KQinYUNN6wrA2ozktCg2wRWFX4wb@vger.kernel.org
X-Received: by 2002:a05:6102:38c8:b0:4bb:c490:7d6c with SMTP id
 ada2fe7eead31-4c8553ba032mr12630312137.9.1744097040243; Tue, 08 Apr 2025
 00:24:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
In-Reply-To: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Apr 2025 09:23:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8ES618Hr+6xq-p11S573HcFKdRrz8sUc685yDa=cDGA@mail.gmail.com>
X-Gm-Features: ATxdqUGYGVzv3sgPFJoJZKKUaDCZ3SrbEz5zs3DshQWEXWWo_KwIHTOtR51_N8M
Message-ID: <CAMuHMdX8ES618Hr+6xq-p11S573HcFKdRrz8sUc685yDa=cDGA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] gpio: irq: support describing three-cell interrupts
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Thomas Gleixner <tglx@linutronix.de>, Alex Elder <elder@riscstar.com>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

CC devicetree

The first patch was already applied as commit 0a02e1f4a54ace74
("irqdomain: Support three-cell scheme interrupts") in irqchip/irq/core.

On Tue, 25 Mar 2025 at 23:08, Yixun Lan <dlan@gentoo.org> wrote:
> In this patch [1], the GPIO controller add support for describing
> hardware with a three-cell scheme:
>
>     gpios = <&gpio instance offset flags>;
>
> It also result describing interrupts in three-cell as this in DT:
>
>     node {
>             interrupt-parent = <&gpio>;
>             interrupts = <instance hwirq irqflag>;
>     }
>
> This series try to extend describing interrupts with three-cell scheme.
>
> The first patch will add capability for parsing irq number and flag
> from last two cells which eventually will support the three-cells
> interrupt, the second patch support finding irqdomain according to
> interrupt instance index.
>
> Link: https://lore.kernel.org/all/20250225-gpio-ranges-fourcell-v3-0-860382ba4713@linaro.org [1]
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> Changes in v3:
> - explicitly introduce *_twothreecell() to support 3 cell interrupt
> - Link to v2: https://lore.kernel.org/r/20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org
>
> Changes in v2:
> - introduce generic irq_domain_translate_cells(), other inline cells function
> - hide the OF-specific things into gpiolib-of.c|h
> - Link to v1: https://lore.kernel.org/r/20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org
>
> ---
> Yixun Lan (2):
>       irqdomain: support three-cell scheme interrupts
>       gpiolib: support parsing gpio three-cell interrupts scheme
>
>  drivers/gpio/gpiolib-of.c |  8 +++++++
>  drivers/gpio/gpiolib-of.h |  6 +++++
>  drivers/gpio/gpiolib.c    | 22 +++++++++++++++----
>  include/linux/irqdomain.h | 20 ++++++++---------
>  kernel/irq/irqdomain.c    | 56 +++++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 98 insertions(+), 14 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250227-04-gpio-irq-threecell-66e1e073c806
> prerequisite-change-id: 20250217-gpio-ranges-fourcell-85888ad219da:v3
> prerequisite-patch-id: 9d4c8b05cc56d25bfb93f3b06420ba6e93340d31
> prerequisite-patch-id: 7949035abd05ec02a9426bb17819d9108e66e0d7
>
> Best regards,
> --
> Yixun Lan

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

