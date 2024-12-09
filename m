Return-Path: <linux-gpio+bounces-13681-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 041059E9A7E
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 16:28:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD1E52821C6
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 15:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E10AC1C5CB8;
	Mon,  9 Dec 2024 15:28:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CDF1C5CA0;
	Mon,  9 Dec 2024 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733758085; cv=none; b=YU+GjqE4B94X+ICSxHYfJ0mnpI6s3SmyMyDUKcaG/uWJYd1DJvJQ6gQbMqDWDGV+ILOu2zUjfDVGwEqlMooXqfzbPeAXoy/MG98cnTsGlsR0q+/r8TMTWaHYfsepiPTBDuH7OU1fi19cZr2ZQ2FTo1DKDza6a1hMeslUZ1In5Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733758085; c=relaxed/simple;
	bh=xdHaTdXFdYTtHxafGhZhv7UCoLyj8YCRBuOdJFcZEkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AgnoFUzAFfGWSnZ7Uy/BLMagplG/zrG0hp8HU4HN5x2fOVI388lpCVEJ13mzW0ZycsrpnRitw8wjhIvd0wk8PmrPEi8C2UNd32821bqoKekUox6WKL/fE4/nHgXU5r4PP3LQUD7C/tHdPJTW8j+0ZNg/qeBO7/JQ37QhQzIFkag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4afdfefc6c1so591602137.0;
        Mon, 09 Dec 2024 07:28:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733758081; x=1734362881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZwCXShpyrYZQBQu1Hq1in63vMRmxTciTHr0EHzD/3o=;
        b=mw8vtjowdQhiAgYtc8KB6dxOF8ilhdTnJ/JWBLlOQaTP1VI7t9Vh+KcxuvCqqFLFJQ
         /V1CPBdXLbRQj6fc8k/8cm3D9ULC6dyYrJzHLKptG8EZ8RDERtqpDklLalVFVpB0ajME
         nIr4POGSiwRZ9OyH4JciYtP221hcbMHf0uLw1Gd1lAVViwJpMHGl9Mvg3J9EqLiqBuiQ
         C4gtinIeCsj3vCP4OAA5CLDN9hz6jL6ENiLyytPlSLc+Y5fLtu/g9nCsLz+z+/3jnO36
         rae4FCmCxThcyj7Xc03kbm5pXrMTEUK2CoBgIiIpWQ0vh2y5ee9SPV9ZfBD5v2v4lPLU
         o6Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUIwWiiZT44gFnLgHlyLM3i6SkTOBNX4BLd4KwVtIPPT2Arz4EK0YoMKXMrwsgSdX5txMripL7D1UVG@vger.kernel.org, AJvYcCUj3pMhx1hQ4PtRPdbUMOW7klh0Lcxgaajkmr96/Y4mNWgIEdkQu8Y08wNMGG7U7haT/ASVO6JkTfyf@vger.kernel.org, AJvYcCWDH9nQqrrJS0qiq9QqzYrHOpJuvrrdMaX7JuZMiHv1fqtzzM4W/DMGjrTOdQuih1JPuXhaoFRZR+yPFLs=@vger.kernel.org, AJvYcCWeVmYd7wkX+4h/ZZQFMjXfmySt/oaIHjjRPtGXH0TIPS9thVvq892RuNOLArQJvdFPdCgsI7YtUMIXbQ==@vger.kernel.org, AJvYcCXp2dViXYypRHVbvvFu3GRHT807rBReXvBCW4GOTG7YVk4HWN4Z31NqLd6Oe8Lzdcq5sD9TFRQ84mo3KXU7Ky9k9EE=@vger.kernel.org, AJvYcCXuAknrD+Kzbk8CTtzJI5MgWCwjhZwS725iprPdypPSM/lN3nFpXnVepBYYxovli+hn2QuGOlb19KA7kuXZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzDzB2q4tcQdBil640DtWeZhRs/esZxL0swlX3QTyCmzBkBmEpJ
	mC8kD1Uxmrn28OGrOqrosIDwIMNtNC1IZNKJcYj4MxcSeVjVuRv19K9Ow73Rb+g=
X-Gm-Gg: ASbGnctmMAtTunyB8szYwI1m3uDJAOrxxODaQx1+cy5fyzy1JKxGIk97ZIVV7PzDkDU
	AJ4AkLxDejd2jwlftwkU4JihS7j934/RJ5g7snY10QW7eSoThYof9kJir8kpGteGld+UNi11jBs
	ngquyDfTAElbuBT0zA+jjsdZgWVvdshBnzL38zA5jylMIJNpgE23dWBdc1JVjVfZD3SclidZQYt
	KehWNvKu5vy9osU6D/TVZeKBc+prvItdsP+I5g+jvWTnde5sdk0vdzXJEg1OXw1lf9dZT2WRRVo
	k6jwuITtxMTO
X-Google-Smtp-Source: AGHT+IGNSdaAB8TFx0WADF4ID06n0kDRJ+SdlRNl+FGrDknb+lcx1D+C5PAPOSJf0keltduOrOPHkA==
X-Received: by 2002:a05:6102:5494:b0:4b1:14f3:5d6d with SMTP id ada2fe7eead31-4b114f36884mr1589692137.6.1733758081129;
        Mon, 09 Dec 2024 07:28:01 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4afd24a30a4sm844685137.17.2024.12.09.07.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 07:28:00 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4afdfefc6c1so591586137.0;
        Mon, 09 Dec 2024 07:28:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUYLwWjxWofsBTsikUJSZi5AHTQBxMvvhu9eHj4A4avD6eETItBvR0BZ7vtynW8wzRJBWMUGukJtO+GQkXd@vger.kernel.org, AJvYcCUqskYqOiHkfYEGsEUlIfS4pAWk0owJ8WsWl+ioCYp8clr6lwTvlJojyLfmMJvVksqHa2mfdFHg4ex6QvBTQJ9esOc=@vger.kernel.org, AJvYcCUysLI8pyqjZX2+7DKJNw2yRSmTJ8+GAK+K579UPG999KyqoJCDMl6m1haro9Xnh/i1wblqbIU07gK9h9o=@vger.kernel.org, AJvYcCV/CjC040wz5Io5PwDiO/XZibxnlrHbWZTXnoQNVpl2SJWBMGXKGavlF7Fvkuarkt+wv43QS8NmvW1jCA==@vger.kernel.org, AJvYcCVMgN9fcU4p+PUvdTr/7DbqgGqZSj1bDKdF48gekqgeqkWLGMkctjCUmo66XseAXchKdLk9ZiTAgTmJ@vger.kernel.org, AJvYcCW5jHkVtxaDZFWFKjmUSLhTIkzvcR/2ZmZ6SHtF+v5hv9A4UvK8l2pwjxt3fZZFOMRfzr9leysJfL4M@vger.kernel.org
X-Received: by 2002:a05:6102:3b8e:b0:4af:eed0:9211 with SMTP id
 ada2fe7eead31-4afeed09e26mr4318188137.13.1733758079660; Mon, 09 Dec 2024
 07:27:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com> <20241113133540.2005850-25-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-25-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 16:27:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWT+KQ_MdfYKP0c6wEX315e8+=2qOYzty25f-yNRkNkNw@mail.gmail.com>
Message-ID: <CAMuHMdWT+KQ_MdfYKP0c6wEX315e8+=2qOYzty25f-yNRkNkNw@mail.gmail.com>
Subject: Re: [PATCH v3 24/25] arm64: dts: renesas: rzg3s-smarc: Enable SSI3
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
> Enable SSI3.
>
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

