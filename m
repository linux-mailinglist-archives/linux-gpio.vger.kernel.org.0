Return-Path: <linux-gpio+bounces-13666-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C079E9720
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 14:33:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 234F416BC41
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 13:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85033596E;
	Mon,  9 Dec 2024 13:28:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CE535946;
	Mon,  9 Dec 2024 13:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733750920; cv=none; b=Bhxl7IW/toaPMh3uXTfpuvqtR8bWqKddNHP74ZBwptGyeLVORynhIDfzjPEfXYeu3fslBtx2et6FtBfpEbMxUAM6MTCEEOCo28oi508XNZYjodKGhTVfxJevIUlr7GnDRNSgRPZ/r7Wb9xYuJtRL0cba9ZINv6NMujtTBz/1/1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733750920; c=relaxed/simple;
	bh=0DfKCdOHiKS7NaS0SJzshZdpQR9NsM0cNVlsUZgFlEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ub45r/+9AMZImLxpWBqygE6sDPX9ZTHjCzH9hqZhZAHgAqxHlENK+xzMaENR9fIrwWwb/DlEEZP+ICLKau0IRngkZbYOZG45B/UXxglK7j454iihv7Dr8f3bZPVMwkAcvkx0vTRDm8JvCTotq3lN2JqfWlq7oojyjKv4+4P3cyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4afed7b7d1bso407623137.2;
        Mon, 09 Dec 2024 05:28:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733750916; x=1734355716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rv31Sku9lhjJCVIQrljGaQop6GbpuTKF4xIpmrz3aQA=;
        b=fBtIgBXGcz/UpBeqVDqJQjxxXe9ZoSavpeDzkOtLZn4gCcu6wrtD1CGxnycrRWmzPU
         Zi3uLeWNdQ8gPGhVa0RWSYz22sZBsUQ0Fo2MdAjAo7rvTkgPXUZ5gqjqc4la66xYVBn9
         38dO0VBtWUyzit5h4jmedR12QaA2f5D5FkBWfztm9KeUNEU2e82Iua8UjEwMm/KzX6ng
         wZHZc87aHbeJQ7fMgYb5l2cBoJIrVb/KVcBnR1T0n+bsNzCp2Pju0PslBw9N+jgZBPuL
         haj0Y7Q8sTDp00WXO0pJmzta7pB1uQGpC1/do9TqY46LuOqNd7pxykb0NBHozqNjnRA+
         NXLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEyXYAxTvw+Ho2xtVBKTbHLhfYoQWBDwAUMKZDgtTM0VQ8qpmkUx+cWPizzhKmW6pDYN9HbUnNwJM/@vger.kernel.org, AJvYcCUZfcLYYfYAh5QJwr4S7xMhpw0aCjVDbCkJWfyHS9mzZyvsQ+4bc0p/v3s6tbCbCKCNuYEHjYGpTOSwfoP8e/ZEc+A=@vger.kernel.org, AJvYcCUvUgMKNFfgn7SBwwwSrnkW+8P/b3IywScjEioaQnMvTefnLOCmqThGjjujPtpz5kuMSTADqYZjk3nNhngP@vger.kernel.org, AJvYcCVA3KFHKWqdN+wDI6jAcj1kV6IZMeIkXrE7Mj9/UrPtYxN4NpL59UWGcyd5IVgIsNLaWO1oCD13uXMp@vger.kernel.org, AJvYcCVXpq3+emkg6Hg1eJS0d6mTMx8rypstiPT3IpiUiusl83l8BB9DLM4M7AWak6hW+9jS23Zp13/DdMk7LQ==@vger.kernel.org, AJvYcCW/qOFVRHlm5+oHZnnYHFOhZkiXFoBH96YtILlMYfg77KG/pALqBcig6UeDAFku3IOj8hMbT3QFFPVth0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YydC7PQAVHIen0J+EYyxBm/eBKzFe/TeRfk5jNN9NW41oLYtLkY
	fsOfH3wB/rQ7q89NACIV0qgaAnRdO/OQYZZjmzSU6EUWvT0gbNFmCylRrffDGKk=
X-Gm-Gg: ASbGnct8+dRYFNbWBR7gTfMsNFibP051yySWyzWWfjHrXDJ0i+51CCFVcCYeQP2lisW
	BJXig4GpiLGX1sIivrmbEKU9Nk1aHXzIuYagOHLKkvDtdL05YtcPDi5qO6NNwgnFNsbublZY3Kg
	CkvBMdBt1Qk8ja9vX50fbnvfeIIEksEDo4TpbdUo2Iu0lvMaCUPShFY3Z0CCOCiB8TKzpBgeK1r
	SpVcga10buqlIKfKuIX7SYBFJc6Djxf7l9edXvuUNqLePca0wHnYNyS/Cw9VS68EoY0pfN6gKNX
	LboAx6FSp3zh
X-Google-Smtp-Source: AGHT+IH6ABwFR0i32FeJ0huqyAkwelaeC67pbBLmCLRhjdEY3BDb3xx9ud6OjGA7VmnylLHBYONz/g==
X-Received: by 2002:a05:6102:b03:b0:4b1:1733:63c5 with SMTP id ada2fe7eead31-4b117336de5mr240831137.2.1733750916405;
        Mon, 09 Dec 2024 05:28:36 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4affadf9d69sm248519137.4.2024.12.09.05.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 05:28:35 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4afc6ce5d94so897179137.0;
        Mon, 09 Dec 2024 05:28:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUHjYKpKDRl24sSWtJuQxpQJUaS8khgRuu5hi46QuF6RlQCLIg4xj7womCSFCP8O1yEW4tDCcf12lyBKQb+@vger.kernel.org, AJvYcCUoFlHmEYVzobbUpGB7Q0zHOZC8yhQd1nBcvF4irsxzWP8SCCTz1SRmQEiK32H1qKe4PisJK0TtDeNL@vger.kernel.org, AJvYcCUxr7UQEw6i+iBsdjIUl3oNYn5nnuuzURGy/Cmov0oMDrwbBJqkUXzxNyI7EhYbF2+GGOiiq+7TZ7/zWEc=@vger.kernel.org, AJvYcCWyQG5rd9qOIVXr3cv0IE28OxL/JrdB2HTqDBCtqhQ9eKzmo1opAPCMXdsNd6h0yzTPLr8YPLPXqn3dOI0VIKPNMgQ=@vger.kernel.org, AJvYcCXOFmp8H2l1HmsRRh9UZBdIJ+r6l9Jli1BI8PFwqZ9NKPjYUdq4mPpZosuOglLglgstWfG5jYRBkxS9ZA==@vger.kernel.org, AJvYcCXkGytEXIVqG0nmotiVKUT7ThB4FRnDGQmruPHBTFm+HBQAg7EMbKSied38otdIe5yEDDotONtU/mUw@vger.kernel.org
X-Received: by 2002:a05:6102:510c:b0:4af:ef82:ce93 with SMTP id
 ada2fe7eead31-4afef82de62mr3891945137.21.1733750915048; Mon, 09 Dec 2024
 05:28:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com> <20241113133540.2005850-11-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-11-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 14:28:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVv+tf70rLSqKQ09gBoBsrVd70V6dMfLW1N1vvNh=c=uA@mail.gmail.com>
Message-ID: <CAMuHMdVv+tf70rLSqKQ09gBoBsrVd70V6dMfLW1N1vvNh=c=uA@mail.gmail.com>
Subject: Re: [PATCH v3 10/25] ASoC: renesas: rz-ssi: Remove the
 rz_ssi_get_dai() function
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

Hi Claudiu,

On Wed, Nov 13, 2024 at 2:36=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Remove the rz_ssi_get_dai() function as there are already helpers that
> can give the same output that rz_ssi_get_dai() gives.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

The description could match the patch better, but the code change is fine, =
so
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

