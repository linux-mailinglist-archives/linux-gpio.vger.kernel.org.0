Return-Path: <linux-gpio+bounces-14480-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5963A00E0A
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 19:48:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DB1B3A0886
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 18:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9E91FAC49;
	Fri,  3 Jan 2025 18:48:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E911FA15D;
	Fri,  3 Jan 2025 18:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735930093; cv=none; b=cnnRjK8mBOJ5vFqsjnpm6XXyc5M4M3chzugHVS0nGJ/7OK42m31gK+9vqvnZe7mYCly+LjAGj91JRGHfrAVyBmS8ZaApBV1KCLk8CDlYTUFc+YnvL07vHK0YoCNuiGSbxbYVRA4xYpLLhcTiycgNjZWPcWrOhALsfPQhglozCfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735930093; c=relaxed/simple;
	bh=jN4/fcYtMlt97ItSkUnMpVPf1/UOk0RMYQmkmLGbE0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q0Ij0jLcN8BADjt+Hx/T6MsqxRZVUPCjXhp8kwu9dQEwwDe0Exvy/3BJAxcimiPEZMQYg3T8qgEyq9AUpn9Z4V8x0FH/MEdz04ZjRup8NTVQhCLeD3/rP8GTnCkgeorh3P0zyGO1m9I6Kkj+Ryt8BUBUwv6xJuy9h5P5LQussgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5188b485988so3932355e0c.3;
        Fri, 03 Jan 2025 10:48:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735930090; x=1736534890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/FoI96jByPne1maK9PCbT8i3q3nm14z4V3GatRZAHs=;
        b=IEqrv5elfr0BcbIczF8Tx39qz3iDTJuaeNjDK2uipM4Wr6utw2+WIJBLe30X5GpZJJ
         3gm8Of2vaqRIqQzfkmdV9xgAR0KkkVVB2s/j3gn/VGcd8RkV4pkpBbvMj7Z4GPQziwES
         bVpSzvWfuAbR/+roXdg6znlCvwr6dZuEINvzFQBhSeOxyTA/hA43gtdzq6boF6hWj0ic
         DIjtJP+PihOcSupvaa2QqMsKZTkuDc0YIKlZsP8ScAQfZfCWVpVLwO6uOWvAK18UEEeP
         /h8VxgI/eYe/zfCF8MCa+J2HfV37twfyjRMlyqZet8O0jHJgCYg7tUWwMF/9Rh9JFZr3
         H+Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWkKOO83STTTOAhL01rWjyg02BUZ6PpW/NU3KkesRM5JZRGxPst4E9gZYuNoG/N9/DbuIa0RbbFqphoBHkdnpNeuMs=@vger.kernel.org, AJvYcCX6YQ64tzuAMag94khHqRjmmpz7rnub+t9EfBAenZ3yQ0vz9HCXNkCK+K+Me/3hiJx6p9edLxvUPguv@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyf8jGolrX63K8N2fDYnK7lNPqWry/LlqQm2Zr60CSR/bYRN1p
	Lq/hvk0DEGPaUga7bwDxyTxRJcSaRfig9WFVIP/x4+txh5AUkAg7/cJejsWg/Hc=
X-Gm-Gg: ASbGncs2MviqeSNyqNwSTDHt0KiXq9WioYvZwFNA7LPrY41oZas99QEgi9zrzofPjDh
	T/xQo3PzNhC/F+V+4dW+P4MeFssc9aQ/BKEK0282BxINYxB6d5rOLcx5aN24EAU+EQ3AsQWB/Pi
	3hPoYMZ4LLt4sIv3MT2IU2VresGi3tyJ7hzqqZHLhizHKU4SMKY/ginypdM+ceCcDZch/cN0Qor
	dMilo3D61QQSYoyJrPLBRI6Pcx4frVu7YUL9VE3bQJzF7y5aSvUVHDUxOShdJgg+ZQmnIUd1ApT
	AjmIM3jDLiVpBOL0XP8=
X-Google-Smtp-Source: AGHT+IFO8VDmIk98IvKamnbK0T5hZ+hFvHSc9PpUTOq8IEWVzundKxHBW+CRyCuQ/XCVyOKAeZUebA==
X-Received: by 2002:a05:6122:240a:b0:515:3bfb:d421 with SMTP id 71dfb90a1353d-51b75c5a219mr38298573e0c.6.1735930090000;
        Fri, 03 Jan 2025 10:48:10 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b7f003249sm3006808e0c.40.2025.01.03.10.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 10:48:09 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-85c5adbca8eso2458084241.0;
        Fri, 03 Jan 2025 10:48:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW+JfoFh8A0TJODYE2eQzAcvg8CF6hqzU2nHkUEkXEq+NsnWUzOr/W+5O/OlLTIzzzXYKuVz+HYo5Bb@vger.kernel.org, AJvYcCX3FZHhLUmp6egFJJ1j9DruQDYzIB62T590j7/R4BXI08lMoD0AKTtWk5X4kX1v/Je102abTP52Zn0LJDZ6tOSJ0bI=@vger.kernel.org
X-Received: by 2002:a05:6102:32ce:b0:4b2:bcea:dce2 with SMTP id
 ada2fe7eead31-4b2cc36886bmr43513447137.10.1735930089426; Fri, 03 Jan 2025
 10:48:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216195325.164212-1-biju.das.jz@bp.renesas.com> <20241216195325.164212-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241216195325.164212-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Jan 2025 19:47:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVRziUVrAYnWnAFn9piRffCs0qShk4oieQ7kFyCnMByBQ@mail.gmail.com>
X-Gm-Features: AbW1kvbGX_HaxhNcrUW-baouEMn3dW5nP6zrPGsK06y7e5HOWKLHdpQT75QUm40
Message-ID: <CAMuHMdVRziUVrAYnWnAFn9piRffCs0qShk4oieQ7kFyCnMByBQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] pinctrl: renesas: rzg2l: Add support for RZ/G3E SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 8:53=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add pinctrl driver support for RZ/G3E SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v4:
>  * Included header file renesas,r9a09g047-pinctrl.h
>  * Replaced macros PORT_P*->RZG3E_P*
>  * Updated rzg3e_gpio_names table with NULL port names for ports
>    corresponding to unsupported hardware indices.
>  * Updated r9a09g047_gpio_configs table with NULL value for ports
>    corresponding to unsupported hardware indices.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.14.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

