Return-Path: <linux-gpio+bounces-13667-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9A59E9728
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 14:34:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E32016A8CD
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 13:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410D21A238A;
	Mon,  9 Dec 2024 13:30:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF0B233157;
	Mon,  9 Dec 2024 13:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733751007; cv=none; b=XoohNI4fARx/3pyzKV9YkFpW0ICDa+3A1wnj/ahuHPsIYC8Euv0JB9JCPLd249T719ma0VhjwHvCXXYFBcd65qsUXGIcNecFz2PjuINTeIaXSO+EHRFIXau6m/4M+SvI1HH7XvA4y6GU96toqIFdjzV9hYEkEW2iq9CyPTJrolc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733751007; c=relaxed/simple;
	bh=YEMGXB0MoeTQD9c+Ltz3nao8e0c8pp7JWuZ504qsbtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D3CfToxpqnJ7tDum4hN0oUs4NLwyRumYgKA/gZy1zMt2Y+M4q+SGCHUNjSpHqJJSgp2f4LcQ6AGcpl4FTvezPjx33qexYmT+iVJnCUd3/RCkLxp9hhGIdxEbeDenv1MhKItJgEC7v3MmxXMo4Jp9VJ8wDRAyQsaTp4ahDVU4QOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-85c529e72bcso470590241.0;
        Mon, 09 Dec 2024 05:30:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733751002; x=1734355802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RtZbd29HX50F62FjGhcvqNG8diKJQIVgFd1izOOOLbE=;
        b=p7+wDI5qh5TWxXsLnAkiaJ5amDuZRotB4+cLCHUdsxEgj/zqSfF4P2Zo9bq7Sp5cDh
         eSmo5/fNefvodQrEOBHzaAsGx0EJ2rOuKFMfNs87KEZ3zMIjowXhcQkJqxBC/yvy/BqM
         ly13lXWATDbSwNnbs4EGvWMsJeOT++EztQm+3yd6jVBJBjagbAj8ON9r5FygzGaB1nrj
         nGq7bc+GN4mF9YUAXWGMgiGjkLBO7dhyHXSkaoGd3i7wnbKQZ1VcdOHnOrdVvEyaQiQ+
         C+7THjpCP7M+JtW0KR4y4T+02dChhP9xo1Sklfagr6g7tvPccTmspZgm2b3ON1hoMfdf
         oL9w==
X-Forwarded-Encrypted: i=1; AJvYcCUdk/Psj0DLP0SNuUjr3HVSdaUYXKvjBO9u9KDdygCBtSG2KSQckaceG7XDgP5S6v7ViNZy+3bPXo1HEfI=@vger.kernel.org, AJvYcCV+o7SVw+gZameFJS/Z4dw/UujUNo1knSma8MJdnh28NjC7C4StE8gxuLuhJ6AwqQOUJBiN+JIZfAU8qagn@vger.kernel.org, AJvYcCVG3G8Micyfm9ZxbZ1vjKekDsw1ioBgOb9eSv7uOKXDZjdF2Jfk0WPfTEtGbz8ezsyKT6DQ4If762JY@vger.kernel.org, AJvYcCW7fsfGnGQQgSAZFkXVp2TDaXr9TwhYMNeADKSwfTEZRGFJLjgcLK8P44tyGdx07ZoxndBRrxyXHwc+EyktwjWRLdA=@vger.kernel.org, AJvYcCXSRYGlDIp4AAsWcCSCZx2GDeuMLgXu2Y9afgNoxy+0y+4KRpeQ8XYLQphR7cGaU+gh62/oGimMcwBLtw==@vger.kernel.org, AJvYcCXVCDFqYytI5UfkVEo+wt/FD5WiWOu9hzYmUQthQ12Kbml1+yOiCYCMZDjJ5lYkMdQY9wanHbMHUFLM@vger.kernel.org
X-Gm-Message-State: AOJu0YzvZ7TlYOvfmtQgewIWCp7KwaSsMjZrQdoaFkPrK2WKW0ZX6PgP
	SuGqcJvmRBFNWTWMFd5QyGsBU3Q+5xcV61npbPmxrIOgdonPMPfg4jnveR0KzXU=
X-Gm-Gg: ASbGnctHyCJpF6QX+buY9sTPxHAonZuI97/C67XhB5G+bz7TjRubqhD7yHupIc028F8
	zaFdijxt/bg3/hasY9RQTZ75UhDZmVALf3unJH5i5PymtHFgZeP0+DEfsUwTeKc0Aq7v0m9mx9N
	IZa46G3DuFapKVOWT3kvc1b4UkWp9z46qbnKSxxaOAhJRI4yTURbN7TMw94K/nTudsjqS1VdaOJ
	x5ymfqeQxR721Pq6keytizVXFXK6EemTGdkgL+xwjg+19vgCq8Ad+AmCmHKHJar3OdTZx3DC/Ih
	H4Rxpqo98XBA
X-Google-Smtp-Source: AGHT+IGkZWJBKkd8l8W7VhyqTj7gaLve/Og/ZMN0kRbJEDNTdFOfszLfAEWwG+Kbon+YkNGNUELg6g==
X-Received: by 2002:a05:6122:2a12:b0:518:7eec:be7a with SMTP id 71dfb90a1353d-5188834b027mr631080e0c.5.1733751002301;
        Mon, 09 Dec 2024 05:30:02 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51606dc43efsm557997e0c.32.2024.12.09.05.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 05:30:01 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4aff3f30d9aso406979137.1;
        Mon, 09 Dec 2024 05:30:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVMZvMBn2bzpCgM3TzGY+CVpjx1dCCh4tonItBCPKgnxBupMBTCQeb1+YDDMDrP71ta/jMxdfkeMi6wATk=@vger.kernel.org, AJvYcCVNz8MR/mtCpGAIGke8D9Q5QTLrdy3jxU7cUywf/HlNZOcp1qeAzvPgxI6ltWj/4JA90fEUbRJO9swr@vger.kernel.org, AJvYcCVqJs/rPWQeiC8Oz4QGxNRZIAFvvvSXVAln+WVXQ7F92wMjxnCeMqkYNLhm7d+asZbM5z9E7Uv4UjRAsdyp@vger.kernel.org, AJvYcCVrzU7IkPoIHGmz6aS9lIuMgHviyPDt7M7JH4GZRQNsH/a9V031obsSehs0nN2hGPQWdsOn2aNNTtN1tiPejTY9PTU=@vger.kernel.org, AJvYcCX3cWx3FArGN/tiVPeFYO9RVuoxE8+WSDWmXzdCiDIWGw3oLT3oXoEXI3BVIueHgM8t7ZOvwLGejz9T@vger.kernel.org, AJvYcCXLNFufAQ6lVvBwgE3yM93+RH4EGlH+z1vD+zovaKchrfL6qyLUw3GIjXMXRAezJ4rm0EYPUOH4tVc9Uw==@vger.kernel.org
X-Received: by 2002:a05:6102:38ca:b0:4af:fa1b:d8f9 with SMTP id
 ada2fe7eead31-4b11604bf5bmr578413137.7.1733751001320; Mon, 09 Dec 2024
 05:30:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com> <20241113133540.2005850-12-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-12-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 14:29:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWqsSPduGA+3OS7T5jm6dHUPKpmGFSH4aVy1MhjNpQMrQ@mail.gmail.com>
Message-ID: <CAMuHMdWqsSPduGA+3OS7T5jm6dHUPKpmGFSH4aVy1MhjNpQMrQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/25] ASoC: renesas: rz-ssi: Remove the first argument
 of rz_ssi_stream_is_play()
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com, 
	broonie@kernel.org, magnus.damm@gmail.com, linus.walleij@linaro.org, 
	perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 2:36=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The first argument of the rz_ssi_stream_is_play() is not used. Remove it.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

