Return-Path: <linux-gpio+bounces-30454-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 42ED0D12E2B
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 14:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 743613024134
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 13:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1673D35B144;
	Mon, 12 Jan 2026 13:45:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBB722DFA5
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 13:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768225523; cv=none; b=uOH2iNkGusaenL8HZMeN9At8i5IUEAOfWmG1Bn6RqB/evRmnVZMVISswkWuMmk9yln6Cx9RsQZXbfaIrX6upFIz6JRkuy04lmp4YNQww67aQ0CwoGP/u9RZ9tdaluLN375chLYhgAmrZaNVjXLQDwMpMK1lZsL4/qajRc2KZvQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768225523; c=relaxed/simple;
	bh=wQiVbguMyGjKSMqL9UFVXXfC2kZ11shLrO1Zg6cSg3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LRbW6pjnP7IjH6HkF/7hMe8YRLO+YVbksg9Nc8beZd/eipHv+T7w/IyWkooW5Oqy21smAXJEgKLjSOpm+Sy1HMTYVC8g+sePdz+E6k95/rAC3aDAhVIiMxuCPLbyt1VkqCrHg6FlfrYWlaZOgVwZrYllDRA/v7ZHQkBmwvuTUR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5eea9f9c29bso2570222137.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 05:45:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768225521; x=1768830321;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OO/WjXr3wzVpti8iWB/GBgohXEwzSHUfz2xAcjYWVKI=;
        b=Z8C+he2UFuJeiBq7k1cLPw2/oMSn7nK+dnqS+RQQ2HjPmYY08r9p3LSKnNYwPuJZdq
         5MvQVNQlxoevfQ2tw5Z5p1j8xpU0Tax2YQ/lOZ+QmHbl9312Zqrhk3USJUnC06e06Q1G
         hF2BmcKsrsTnt+BoLCs5040T7dZDL3aeuzbh/TTgIv2w6KYZIyhUxa4Zjm0a9I+ori2o
         VBaNVCSRCkvGEAzOgp3a4S3/U+h986FRoaKfIkxGbsZO9bKA7mxk2SFnp3R06g5K+N8Z
         UbU9RF/mAYP2X3/LzWmH/ne4nRgc4E+RTQvrnqA3NZs8LlESb6xCDfyxIMm+KDNfVeLo
         ZOFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVELvLBsjVIFzbgg3nzsrIRUqSqmBxyn0TjLSv5hfUTT/69+tvB0kxHcnwDv0nC4qV5FziN1oeGbSP1@vger.kernel.org
X-Gm-Message-State: AOJu0YyEzt87mdkqWGgaEd6tZimELMLaCO4CsM34/OGenaIxvATnJSBD
	d3mndgcLQB/uYKRlPJfOWSZhPnRdilM2dGZEn6pdAmp9V1lnN82uWQlVCpTiiDYk
X-Gm-Gg: AY/fxX71fnkenFAJsCYUAVNX/IyaTuWDPoZz5GLixap/ANRE3AxcakBCCGwq9ymR94m
	w3rb1n80FJtJjpEvTXSkqsJFkhF4PGzNxGUy+bojcJF0zcYZPR8XTxeeky5n1M0dY9l61krSxCp
	EcN5RORaKtBz/pCE6MI3SCv3EbHkTBQ5TMEDfb+SHS0aKk0myCjjwfKlSdmFQteDxzTv7cqW6I6
	KN65hI5wu6moiqT1NyNIhMH2UlyRyoq7hoSXHlRKUVfgtKbORkpTiKoTkYVmgzYtRT1l/cTeJC+
	x8GIrlmGCFRjvP47xstXRXbEnnvleDrTm/y6ll0Nm1FyCrWCJmaeYhoFj/6zE2lU8hnTRpeI6xv
	1GSAAgno7Hj9EXtNQpDInMlxM3Fr3TA3ANvtWTtdMeLfV2nZzp9euy/u1woqDt9vv9f8325jeDk
	1y8MdM5b+WFzcAnB4mKM0yi7CUFOt3K/+/Hcntt//ZECUj73KJ
X-Google-Smtp-Source: AGHT+IFUCnSlfG3W27Xna7U7/3zDOqSkwmRM/5eLqKGL2qnRIkghLIJ7qEtCnZJGqw7kpR5SfeMzQQ==
X-Received: by 2002:a05:6102:578d:b0:5ef:a3b1:3012 with SMTP id ada2fe7eead31-5efa3b130d9mr3814771137.24.1768225521123;
        Mon, 12 Jan 2026 05:45:21 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ee9fe7f478sm12318793137.3.2026.01.12.05.45.20
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 05:45:20 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5ec87b1f525so2445834137.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 05:45:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXp7GghNpYNYK5Qib3DsYYA4gUbzoz5mkTfjgMHtQvEW9qCqoVSaS+UbExZlFODbX+z1W5c28Cdw1Wn@vger.kernel.org
X-Received: by 2002:a05:6102:1626:b0:5ef:a6bd:c8af with SMTP id
 ada2fe7eead31-5efa6bdca83mr3722114137.39.1768225520792; Mon, 12 Jan 2026
 05:45:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109143910.645628-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260109143910.645628-2-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260109143910.645628-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Jan 2026 14:45:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUwzQSTk2ns2c_uXnER-jHXym2ep=u8t7yA1LuM+uwYZA@mail.gmail.com>
X-Gm-Features: AZwV_QiPdXqTPfQwR6lIzBF4dtqc8FQL3DhvJdOHFP7aTpgdTsrHRXEboogPJLg
Message-ID: <CAMuHMdUwzQSTk2ns2c_uXnER-jHXym2ep=u8t7yA1LuM+uwYZA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] pinctrl: renesas: rzt2h: add GPIO IRQ chip to
 handle interrupts
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Jan 2026 at 15:40, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) and Renesas RZ/N2H (R9A09G087) SoCs have
> IRQ-capable pins handled by the ICU, which forwards them to the GIC.
>
> The ICU supports 16 IRQ lines, the pins map to these lines arbitrarily,
> and the mapping is not configurable.
>
> Add a GPIO IRQ chip to the pin controller that can be used to configure
> these pins as IRQ lines.
>
> The pin controller places the requested pins into IRQ function,
> disabling GPIO mode. A hierarchical IRQ domain is used to forward other
> functionality to the parent IRQ domain, the ICU. The ICU does level
> translation and then forwards other functionality to the GIC.
>
> Wakeup capability is implemented by placing the entire pin controller on
> the wakeup path if any pins are requested to be wakeup-capable.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>
> V3:
>  * adjust comment describing the source of truth for the data inside
>    rzt2h_gpio_irq_map
>  * check if interrupt-controller property is present before populating
>    GPIO's IRQ chip
>  * move rzt2h_pinctrl_suspend_noirq() above rzt2h_pinctrl_pm_ops

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

