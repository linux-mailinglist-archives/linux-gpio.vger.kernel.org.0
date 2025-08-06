Return-Path: <linux-gpio+bounces-24032-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A890B1C68A
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 15:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6279E18C3129
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 13:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7ED221D9E;
	Wed,  6 Aug 2025 13:01:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B1842AA5;
	Wed,  6 Aug 2025 13:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754485311; cv=none; b=LzmyS3akcozH1O4Ow/bt1AqFiZhKORtnIDxkfRkY4XDg55E0HLWBlvzlZtVN720AjXLQ89lete/k8xTaYSfdtVq31XarIkBzwD3IABnGgq6xDoj1MG7l79+3v3gMzXYyEqwb46Fh8vJ4mBzhkhOd/V/UGwjhBw3Ye6xBJtC/5ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754485311; c=relaxed/simple;
	bh=atyL/BY0VKuqOLzOGFYrTSXHxdrXsLWotPxW+pZkGJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JxiKbs1mCiF7iIZxRHOCWW1wE5LRXEJJDrGWcjlQX5hvZ2aQAlfOnlYugVl6xSQ2w/NkFbDVA6oiENrbgftKIxOnIGnftLsywW2g8/hEfABcRKGAEEmrn4TSjPHfthuUdlYs3cgYiRHh/mc1izCEBZBH78G0XWr0UY+jMUtq+yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-741a8bb8aa4so1220642a34.1;
        Wed, 06 Aug 2025 06:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754485309; x=1755090109;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JAT+fbsVBlKl4BCqeaUk3Yqdz9E5O5hG6x7f+SIR9a0=;
        b=KoxIwhHCaXD1C2Q09s2QyGu7R2edMz3YlHgw2ZmOn9/fkKhGAK3S9/Y3svmlnd2mfm
         MN5wP2FYBiGb5Z33f1nTJFZ/g7dcmifNejAKjo9jqck9UvjgbWLWTGkcyu4vnrI09xk6
         kf2QXrpeD7Pul0bQ/nzUdQmwsHWX+8T0sPTDyA6sqkbky73+Ko32jTFfNX+W2//VqK8g
         mv6NyWJZEMY/M+YNVIxI8MnlCq4Ck5AeXppyI8sBt8V3f0haaZC0hgpxVvNg/zGBTfdv
         a47NkCWe5xGlt5IZu9LsoBzpZ9MIciqZbk9M166jqOb/d7MZfj9VOGfyX2spFshoB6ar
         hYCA==
X-Forwarded-Encrypted: i=1; AJvYcCVD4/Lt1I3KCI0NrJyzzA6nl0bZKZqx2hRTzZMbb+yzPJ8IjuE3W4lefRfVIZHtNaTtcUSkVmTl43mg@vger.kernel.org, AJvYcCVnfe0BRiIgkYDswfv2WFHBaHSxJk4qkEfkfR9TolLX/DePxFps5jnBY8/6tYvYbsnhVg+zi+OSNRXhJVeLvloL/7M=@vger.kernel.org, AJvYcCWDPtf4toiWZvuTBMUi/DgcK8PuB7pX6T86LfYwh2N/ICdO3TvCpfmPf5aF4lzG0JHGPpnfG7oNYCMpreKO@vger.kernel.org
X-Gm-Message-State: AOJu0YxSPbNAnKD3FTic5vu45M/pbzwzJQ0veIrfXzTgpvHFC7wiFHCr
	Z6XlfCwaya65csDVaXOJ7OML4jhi6DaNFgmu4qDyUFGfkeaz+2dZ1UAcvz8aH137xHM=
X-Gm-Gg: ASbGnct48UkMr9yjv0KRm87jXY0WdLyjLZrwoXMx8CsyN7GT6Xrg97atwFGVuxAjHYh
	IG/I5gHSRYAVxGIhpE0MwtBOHc6GO/sELvN5xk4N89PMaOWF6u9RrlVjC7DFlvfrczM35UOAIwv
	rRONrH9R/THdxB4Q0rMPeuCv8uEM2ObyXk/A8qbmu7N6KkAjiqC1GhcHheeO/rv8NaPTjv7sOQu
	f5BhnaJBuEBpbtbTHfh4VGuuTjLC+MhGqUjwhfZ3CizSsAuBhT03rwbfLPXO/P/RlBaUxvdgWaY
	IC0ofQFFtPPfvtZn8mTofdERNBd7y3sXOWvkAI+QZ2T/CXHE4hO495PCzOWs5IfZeqVQHcWSzo/
	Omu44ZZ9o8vFnhtCP2b7PqrueqXaoiG7G50FjJczhsVP2VNwhbF60ROqsmQF+
X-Google-Smtp-Source: AGHT+IHKIKHdb8z1Tq4wrAr53O1lQdtCz/IPLAuNBzl1S7vm4MuI0bqmdp69kvC9C3TetbYUj43hbQ==
X-Received: by 2002:a05:6122:4f83:b0:538:dbaf:773e with SMTP id 71dfb90a1353d-539a0248bc6mr1064401e0c.0.1754485297671;
        Wed, 06 Aug 2025 06:01:37 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53936d14c1csm4192199e0c.29.2025.08.06.06.01.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 06:01:37 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-88dbaea0580so1036228241.0;
        Wed, 06 Aug 2025 06:01:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUU5QFp7aFw0yUYcegCvErxYddVhvuspo+vA0ErgRrYT0MdJ0MEptqshI8sVIkilRKw7e1ZGkWJFmSfIq0E@vger.kernel.org, AJvYcCUYTIOUIqLtx62QpQUnHRJDMWrvz03S8MEQZSzuI+h+1t2OKUTMtPKz/22xzAeiFWLRRigQMI3BGmziIl3lXAK8S5c=@vger.kernel.org, AJvYcCX6wpUAy8p9HrckTm4gJbeaccghZwf1ro+cyjFPnBTI5n95ss+0dNCaGgCw5dWEwDpMb0LAHqGyuUPc@vger.kernel.org
X-Received: by 2002:a05:6102:5111:b0:4e9:add0:2816 with SMTP id
 ada2fe7eead31-503710c71b4mr1001391137.5.1754485279951; Wed, 06 Aug 2025
 06:01:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709160819.306875-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250709160819.306875-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250709160819.306875-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Aug 2025 15:01:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVKCav74osWY+q4jEdni-zdcZvKg8B9VJVi7NtM7+kYDw@mail.gmail.com>
X-Gm-Features: Ac12FXwXxnHV6_RQQSE260BaQoZl3QuUrHJgyPEXlLOvLnl8pLxggLqK44ASlu4
Message-ID: <CAMuHMdVKCav74osWY+q4jEdni-zdcZvKg8B9VJVi7NtM7+kYDw@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] pinctrl: renesas: rzg2l: Add PFC_OEN support for
 RZ/G3E SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Jul 2025 at 18:08, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for configuring the PFC_OEN register on the RZ/G3E SoC to
> enable output-enable control for specific pins. On this SoC, certain
> pins such as TXC_TXCLK need to support switching between input and
> output modes depending on the PHY interface mode (e.g., MII vs RGMII).
> This functionality maps to the 'output-enable' property in the device
> tree and requires explicit control via the PFC_OEN register.
>
> This change updates the r9a09g047_variable_pin_cfg array to mark PB1, PE1,
> PL0, PL1, PL2, and PL4 with the PIN_CFG_OEN flag to indicate output-enable
> support. A new helper, rzg3e_pin_to_oen_bit(), is introduced to map these
> pin names to their respective OEN bit positions, and the corresponding
> callbacks are wired into the RZ/G3E SoC configuration using the generic
> rzg2l_read_oen() and rzg2l_write_oen() accessors. Additionally, the GPIO
> configuration for the PB, PE, and PL ports is updated to use the variable
> port pack macro, enabling per-pin configuration necessary for OEN handling.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

