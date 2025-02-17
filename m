Return-Path: <linux-gpio+bounces-16135-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13444A3842B
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 14:13:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6456B3B67FA
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 13:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB5121C180;
	Mon, 17 Feb 2025 13:08:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D7C21C175;
	Mon, 17 Feb 2025 13:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739797698; cv=none; b=uCN1RPPgU2L3dvI02BHQGPg+cap1/MlRLD+grttaaSsPc33H1bmbEmku1HmL6Lc6C34w6bBWXmQMMjBwd9t2IcfTe9CWdRsXvEPBykHADtmA4Xzx7A92B3ZeIozkW5nGv67PxM+4+ZglwRmoH9z5bjHD6aCDi4PyY4WmlvlU5ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739797698; c=relaxed/simple;
	bh=y1H2JBuU6JcgWw5rxen1Jv1bcC4VLW3Yr5QDBhCl4og=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OMv9IJqEeNKgOlAoc4pxYeBkRoWUqHgR1Ih8wKhhZCFFzBvjE7dQDibNbS58OBouPJhv/d0wdL9aI68LCp2T45CoQGoTHWeuDO9iPfIofY/7Ii80x2G4WwxkQykZFmE5+TXnTrZkBv6uIxn0v63zQOBdRtvpRm0tOj8hKUkA41s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-abb8045c3f3so204130266b.2;
        Mon, 17 Feb 2025 05:08:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739797692; x=1740402492;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nNWuRhGm1KWB6PNHebw5XJJjOKXA1zZLJbkAnBhAANc=;
        b=MqesWqMuqgnmq/z9eKQOOWF6dH54cPqXIuSswUP0RoMdfYAPmEX1T42RoX6q/V+980
         4IMbleppXMuvo3/pe6tnVqOXOGH2l3shn67BAbyMr79JARDdTJ1ROLvvcdNFN3LVw+NA
         U/twgXAU5udJm6RX+wfdCyexMcUhCuIq6yyMU155mdqRkV8CIVoPzSi8FI7CT5njRUnK
         UombnTSYTCUjAdAjW3uWmkCmQ0GkUoYhiAlH4whWGj/PDMBlHp9JEj6c6rTuIynXs1he
         EfGg8EoU8hzzFf6Q4Kc9Ge8VMNzUowlZrEbSeQ54JsjUne39bb/4F/+4VS3ifbFxdAn2
         DzYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8N0Arrcnd6Il5P6WO6kp2tZ0zb1WmILM5f1QU14zPY4b0j/NIV8k0BdYWXcM6uFZiQFw4hl3q/Wh4l3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzksH/MPBqVn9y41cxbZ5yDhGZA1SAhUpPchsUZI7FD1gmxq9YU
	fsd5bm1GbS6unCr010JTrlToVMalHdsHeI/IPpIsQM/P0tlJVu4/re6cTAu2Y3I=
X-Gm-Gg: ASbGncuJQDvGETfiTkV3oYTariuMY7iYm1P0FMet0Bycsmywmi7BqdtGtY3FE0komfY
	qfZGdBE1nMhcIeJ/HglcL4EY+TN6qt82JZ7/RGoI7zYaZ0ENmURXo+vS5DJMz1igdNBC/7+W7DF
	sezvU1IXXw6rjQWAuG9iq+pyVY9bIK404hSJ00MxQhXgWi2wT77ETE9rUX0txcc1N2GLnjrhpIZ
	5pUVCO+pRWDFwzWfOssCb0L3oAa3jLHS422KJXD9Pf2Z2SLXBj++RkwzinOKYiUxgu2ob+0M/51
	XTvUWLrLklZib/EZq8NgkzdzlWlDazXQnJRYatzZDVkqpbXXtar1pQ==
X-Google-Smtp-Source: AGHT+IH8h2D4e9oLfNdWxv8ImqFR5IiAUzZ2piHVCb4w56B9Gq2lgRPeHyaB6x0ka97FJsbW9Gtn5w==
X-Received: by 2002:a17:907:72d3:b0:aa6:9eac:4b8e with SMTP id a640c23a62f3a-abb70dd71ddmr1059181266b.41.1739797692047;
        Mon, 17 Feb 2025 05:08:12 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53232039sm879231066b.9.2025.02.17.05.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 05:08:10 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e0373c7f55so3503995a12.0;
        Mon, 17 Feb 2025 05:08:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWYu4BiGnfS/1K2Yi4MJJlyBYm98PUB+JGA1DS9bVH3nHnriJnew1fY+NG4YGvkvThyy8/0h8/P3Nfl8TA=@vger.kernel.org
X-Received: by 2002:a17:906:8a64:b0:abb:b1ce:b4ed with SMTP id
 a640c23a62f3a-abbb1ced54cmr8458166b.8.1739797690671; Mon, 17 Feb 2025
 05:08:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250216125816.14430-1-koichiro.den@canonical.com> <20250216125816.14430-2-koichiro.den@canonical.com>
In-Reply-To: <20250216125816.14430-2-koichiro.den@canonical.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Feb 2025 14:07:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWZy22ckxoLOWH4x40VE4pRsBCfMDXJZ5ZYcu-ABFKRWg@mail.gmail.com>
X-Gm-Features: AWEUYZl3s-qQR5E5shlSQwMlXJvTXmu4fdYjLwRkJwVsDPqJK-LQCIRlX8GY_8s
Message-ID: <CAMuHMdWZy22ckxoLOWH4x40VE4pRsBCfMDXJZ5ZYcu-ABFKRWg@mail.gmail.com>
Subject: Re: [PATCH v3 01/13] gpio: aggregator: reorder functions to prepare
 for configfs introduction
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, brgl@bgdev.pl, linus.walleij@linaro.org, 
	maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 16 Feb 2025 at 13:58, Koichiro Den <koichiro.den@canonical.com> wrote:
> Reorder functions in drivers/gpio/gpio-aggregator.c to prepare for the
> configfs-based interface additions in subsequent commits. Arrange the
> code so that the configfs implementations will appear above the existing
> sysfs-specific code, since the latter will partly depend on the configfs
> interface implementations when it starts to expose the settings to
> configfs.
>
> The order in drivers/gpio/gpio-aggregator.c will be as follows:
>
> * Basic gpio_aggregator/gpio_aggregator_line representations
> * Common utility functions
> * GPIO Forwarder implementations
> * Configfs interface implementations
> * Sysfs interface implementations
> * Platform device implementations
> * Module init/exit implementations
>
> This separate commit ensures a clean diff for the subsequent commits.
>
> No functional change.
>
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
is still valid.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

