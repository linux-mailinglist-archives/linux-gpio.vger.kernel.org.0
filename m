Return-Path: <linux-gpio+bounces-18654-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCBBA83F41
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 11:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E56B44076C
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 09:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB6A126B2A7;
	Thu, 10 Apr 2025 09:46:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9C726A0FF;
	Thu, 10 Apr 2025 09:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744278372; cv=none; b=fiGnHJ1QyUsnGpgGYSEGHE+AT0Nej34qlsz01jcGQozGxhLYuTVeaFP9wOstosaa7kyv45RLD6ILwqsnD/DyXsjXw/KhSIanqBiV5ecUyIhwWaiBjaxXLazjG1WuyARTFMSnWbVwQc/PnZSKP6oQ6CC5e2vEzO+AgH1PwmGkh+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744278372; c=relaxed/simple;
	bh=cngY2/urcvZ0wt9wEGOapP2KnXYfjkIGmayk8KPO/Tg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E3wI+GtazAgAX1KmvQDUyHpDLCI2c/znSp1Km/5eS+PgQvPGP7VZmXzFLjw8byvXozXXIq1XvlPxvRqhF82sbPxVYbDeNeSM9CH/PS2I1ogh9qn2+ADX66bbjzCGEkqFCWz2C4lgj/kLljdgZcZdqUIFiGczwM67vA9hbfwl3RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-86fab198f8eso240234241.1;
        Thu, 10 Apr 2025 02:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744278368; x=1744883168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PxDHlscx+bggMtz8CWXRU6QwUOr08l3Z7PZVHbtMipk=;
        b=C+BpGK1EfOm4Vu9Jm9xJAqJWMzx4M4K7/GJbpyheqxhjF4ryyTaehB0FbaRlgk1DLf
         qdRFSjPGY0tB3vfXomGbjBrOYgsrAtbyo6ofpLKXVuLLk7NUl7mmnsKLaxu4YQbRx7Cx
         uSxDCXQTfQIsWbL3keoDhakusOfVeylFkgmSFvf04Lpf2rY+PZllB5E/gV1F88JBxiQN
         5nBBZIJEIMXjmqwCpegSPuBt/Cb+mO5PDf64/Pq2qham0xcJKtfAD9oa2GdyU29NtLbM
         LUjiJSSao8NxSoX/1SfWwGYu1UlrCtxCLlK0i7zKGztDUtJ7dyQFlrv61Cdv2ciVaU0t
         XdbA==
X-Forwarded-Encrypted: i=1; AJvYcCUYaZsou/2ntW7MTtp6uyZj/qBXXHUjtSf1A7t20QGn1DvDdwIq/I4QKjU4y2eZP7Rv3UByXj+zefYC@vger.kernel.org, AJvYcCUaQjsb9toRDVnf6O4O6qCES0OFRECHO+q7ig3Dg+egtrBbLRpsSly6gnDPIFxDMxbTlGEI6MPPGeKxrAd8y2GlHBY=@vger.kernel.org, AJvYcCVEjq6WvVDyA8oaFvsQWMfjqo276V7KvQwdvM9vlVCDwl5kzbRqgkvpCiMmpBrUkTTocpyClE+lokha@vger.kernel.org, AJvYcCVv9wfDZoluYLqwSSa0HkvFKS9E4wdJXGJkcUwK21hA6s9cPsHocppddta7J6scIMeLer9ZDGlSX3k/fdwh@vger.kernel.org, AJvYcCW8kVAZafqRxOZWa92nTaCbu+OTPGWYGXwPYGAHFk/IejW0bF2G+DkMd5rK506Z0FKTABjLWgk8OwlnKQ==@vger.kernel.org, AJvYcCXsSjJ8F/zU6o1QmYrqlZnab8ghB8V3kUFd0Ay35YLR56za7HeB3pUEhwLjIzrfq3AhJMh1+cjYuAJQPcdk@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/F1bnle22o2LS4raV4LoNSwZJe5Nqol3CQGXmBXbeZRfw9bYZ
	m5pfSdccc/yMZQhoKHbPu767ybC1lcQgdnG1tLTtHRvEGEYFDjYKUgkpQcF6
X-Gm-Gg: ASbGncsBx/zWIeRT6Gy/XPiw9XEpnRx5HoeH+5pZFY5h8psu4yZzimBWAjIS5gHVgV3
	PaeN9TH2jfGUivuKFqPKhHgRUKxXIJRXvefEbSRU6eGKzx76hdwstyfV0yHzUCaIcdn3DZd/Ltc
	ZR8wU1U1PiVoO9MI97AfYgaX5Mvf/2QLBp+OlCiS/cTBi46SO/FAvJpdpPsrDhEuHN9fVC4iJZp
	0vW53aEs9Dz7iG3EN3YCyI3kLdwDHJw3Tpo1Et/65Qu2gTPGZEUXSHj3UbZ78/6Et9XInHrUbX5
	hbs+V88s71tLj+PSFIABHlnRu+GQyqzT9AZeL4kkP6WZLzl1td1ujqRc4wLPrFKvbwaXEebmzzK
	MN+8=
X-Google-Smtp-Source: AGHT+IFYjJ6UO4xqCEEQYg8LgSZ5axEngXXZ3ZKkwJBhDVsF97WE/H1sOAZSizKpt3UZMI4O+b6B3w==
X-Received: by 2002:a05:6102:3f48:b0:4c4:e414:b4eb with SMTP id ada2fe7eead31-4c9d34d094bmr1431658137.12.1744278368429;
        Thu, 10 Apr 2025 02:46:08 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c9c98edc91sm519434137.29.2025.04.10.02.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 02:46:08 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86d3805a551so262385241.3;
        Thu, 10 Apr 2025 02:46:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSOujFEfpUUbY77+rBpK+PuSNylD46MvCV4ccQKTNo8I3BcNKiiXtkr0qOK/f+fm1H2myICvAkYbrA@vger.kernel.org, AJvYcCVXGk9W6/3i4mcJ10Udnr/N56kQ7YeICjHYtLDCoXJQcy/jfliay6H6YPcxWykMByWW4TvpjkH0chyG@vger.kernel.org, AJvYcCW5xbHLu6Rb6ZVvQVfFPyhQ/aSwifMi7N0h018SnYozML63eUtO2tDq4HtFPni8+FqybXIQ0JY1iH8ong==@vger.kernel.org, AJvYcCWlsQjkSy+L8a0yHPCIjxchjO7CkAkzcaUtdhdGUQRAJQdVeX7EhIapoSkrlHJKt3cisZfnK/XC/H5e5Hnp@vger.kernel.org, AJvYcCXGBkK5IIhmBvkHJI/18BzlkW1tLt73/y0EJZ5N7PxBjAnTfeXz/fNFaJ3CsW8G5JXyUdwcBf3CtslaDiuoRQRNY7I=@vger.kernel.org, AJvYcCXZGCiLYXJRcrJQJ6vZEp1oFfZou7567tpZxMKRDlv9Fi4jd5Uwpz5QGmT8a9DXVWJnzNn6KfLVVWqur2+k@vger.kernel.org
X-Received: by 2002:a05:6102:50a2:b0:4bb:c4ff:5cb9 with SMTP id
 ada2fe7eead31-4c9d34d7aabmr1176571137.15.1744278367820; Thu, 10 Apr 2025
 02:46:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250407191628.323613-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250407191628.323613-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 11:45:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXqKga_tUS6HHovnxBNCqHQx_tkMNt=WJvAO2z+743LRg@mail.gmail.com>
X-Gm-Features: ATxdqUHWB9OPOI4UpxDtPd26THswkWl9HKWMeZllh96mN7-b7XJ6OGyeEYXngtk
Message-ID: <CAMuHMdXqKga_tUS6HHovnxBNCqHQx_tkMNt=WJvAO2z+743LRg@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] clk: renesas: rzv2h-cpg: Sort compatible list
 based on SoC part number
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

On Mon, 7 Apr 2025 at 21:16, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reorder the compatible entries in `rzv2h_cpg_match[]` to follow a
> numerical sequence based on the SoC part numbers.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

