Return-Path: <linux-gpio+bounces-13664-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA93E9E96A0
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 14:26:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 603522835D6
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 13:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B7C1ACED0;
	Mon,  9 Dec 2024 13:24:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A26233146;
	Mon,  9 Dec 2024 13:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733750696; cv=none; b=bBCsVSxutIAoTmXWIPJ3b0Xoc7WfiBWUHojhAIYkuBX106WoKrnRS0puTpO9wVbJD2wvhf0KC5rm9ZhCJNX0qN6a3F2aOIISHDlSRyt4ioPxO/w3sT5yW7d1B2c7fEDNV6vT2sQdWGr6lnXJ+CSG/plZczcQUK8YGsUFVTr68gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733750696; c=relaxed/simple;
	bh=AiykNb0iYkR2dOF88FitvAe1i1r61SccOnLVphqPX6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HEZIGwx0WBLS4JdW+lQ6gdlwD4lOYhQA1mSaZdfXjBrPjAqO0CF506cy3dt375H1Lv1xR4ZdwWpzJh0qqPRakNLddPVZV2uYlcbHi5ceFIAfD3z9IAKlT9cHuZv5Ph+QtZwpH8wFaEuJBVJBcinoqd07kBYRDNDZusSbeQyfJBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4afdfefc6c1so550352137.0;
        Mon, 09 Dec 2024 05:24:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733750691; x=1734355491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1AtrfJs9qMBlwLy9WabdsW5VY8CJwau05PvncDaX6k=;
        b=KBSlvyJ1ZuPulpdIk3USccJFOEWZDAfLnRKGGisOCu/0aCRq+wweCUQ/kP9Yja5P9b
         CU+V4hjKvXL5UXqwewumY2jy5dpO8iU3lQVIdt2R1EzEa8PR2auVZfmkKKTefRG4g9zt
         XIrQ42mHXkMWD7vYSeOus+iJg4+yzemHyQFQcXJ5Y7610cXy6HjJQY3c7bqe17+f7Af2
         Cuorg06jFZWR120bRUGjIKTHMiaT1qNMOaR5hZgdFXU9I7oMY4KOp5EZqY+N6DFiF6YX
         p/fNTxrTO8CvehQd4BwfFQF7/Y0JJM9vlyh1v/sE33TtHyGqR4MYsixqgaxHsHjikr66
         wdNw==
X-Forwarded-Encrypted: i=1; AJvYcCU4rsyUov69/bX/7KEOLiLOX7VdHzuPystqOZb5WNRLZTPGp0WpCRh9CLypBwnk+4vGjvaGqb9Sv8Ft8eE=@vger.kernel.org, AJvYcCUjsHDRkD/LRWU8APEKMv5Qd7PXBpEYu2n+m2/ZhbBVpF8PzbnZj/XsPoxmRGNg/HnwWCnbXOgq06nD@vger.kernel.org, AJvYcCVW3Imdu4nScSHYcH1aNQzbOyG3MPrC4uVmOdu6UxfT+4tY2mqovT6bAuv5iSXrw/27HqBavn/gzon7@vger.kernel.org, AJvYcCVzoG3sngoz/3Egj3SEbjv1fJvVt+FtHYubN13QNO215Bu+7qpPHzbLu+jpQ9b4RJxNnErkCpQUvL3p3FRMSKJ77YM=@vger.kernel.org, AJvYcCXbf5JAyUN2FjP0hjzVeNKD4Mv5WtR4HmAT/6UXVkAbWaSoNBVGV2kYsz3pDNVH5tiAdApGRtKd3CGwQQ==@vger.kernel.org, AJvYcCXftQA9/hY2OcjE/MPrOwmyxBzJqakDjq9UJUdw3dWhL+unnVP0boo2w0fahQjtvaEl71UD7oBk/3kWaAFk@vger.kernel.org
X-Gm-Message-State: AOJu0YwtWX/PeCvzgGXu/TpJ5bmUYKmAzf54U6D9vI8tgOmY7WJvyKFY
	Ch3H84zPwNo7lRfzoUDTvvU48mjbBnUP/IupmglEnXElqmI2GzF+yiNlvI0JL9c=
X-Gm-Gg: ASbGncsEdIEk0TYWl75gvmCRaDw5iACeDWv6KCeRWpkWfF8gLdgtTW1mUAcbtoAJSco
	2Ij43q95YSHhiVBj3Y05QNTe9dDatOeKy0kx+zp7gkVbWCut1I7lHyUffiKnDfd87Sut9gdQYRl
	cWw7RrCtF9PfdY2CvMQQIRFiU8R1G5pgQ6u1mLY+Gcz2Z80g7fgDS6FgeF9Evh3hzn8zuTYxV9N
	4Y7e7Ny+F0PQofvcR0YWY39p/H743o0K25dC5gANqlTuk4B+cpFXSttdas/BOdJ8/pVJT/MWYrx
	hh33vdzyc+FNvlhy
X-Google-Smtp-Source: AGHT+IEZ20Z2g3xbwsf+lqkSlTO1AwULj7YHrGtQJyvcTLFiZk22IcPJF/Gn4H5CVE/hAeCjTOKl9w==
X-Received: by 2002:a05:6102:3b8e:b0:4af:eed0:9211 with SMTP id ada2fe7eead31-4afeed09e26mr3500269137.13.1733750691155;
        Mon, 09 Dec 2024 05:24:51 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c2b9f7980sm1158448241.13.2024.12.09.05.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 05:24:50 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5160f80e652so665173e0c.2;
        Mon, 09 Dec 2024 05:24:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU766TNIKqYsxt/22dznLxzR16B+NayB9pberdPAKIyHih+U6+H+5SIWLCRdg6XmjUG3QjINt/TI69I@vger.kernel.org, AJvYcCUlmKqOZ59Lqa5K+3Q8ts6+i5JSwJz3UbsHsU8Qv3DWLZ+9R7edihTAoZCTm/uma0ex/lusOO/PgRI3D1nM@vger.kernel.org, AJvYcCV/sV4J+bTe6gJ2BLPJ9BUjX26Lht1dO28ZUkwHHgCp+VHcSHbMyqw2kb/GGRoaIl6QK24+aAJ2iNaZSA==@vger.kernel.org, AJvYcCXbZ7dlWdzSoM99pHQSnKmRV8xktbWUBGcOXpVPDtS6yMdTeMtHk+JFmCKBk7iQQmh9C18EV0/xNbrZ@vger.kernel.org, AJvYcCXhmQXhTPM3ZB3NbEFMfD+Ct3g56k0qXilZO2iqr7whDNQ7XLBW6kqpDoERzosM9HLwRJFXo+Se/TazdnM=@vger.kernel.org, AJvYcCXvUBODuDkrlCDz4QvaypY6y3tzmDjAIlOph3wOA8m9QUs3Wp+w3Ha4y88atsy+m7coS1PQN3h/KopA/FDgOtcKmoA=@vger.kernel.org
X-Received: by 2002:a05:6122:322c:b0:518:7ab7:afbb with SMTP id
 71dfb90a1353d-5187ab7b1ebmr2289712e0c.8.1733750689666; Mon, 09 Dec 2024
 05:24:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com> <20241113133540.2005850-10-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-10-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 14:24:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUFOb=hq960Xaa1iAccXFCh68vyQTiQO3basbNJmm88qw@mail.gmail.com>
Message-ID: <CAMuHMdUFOb=hq960Xaa1iAccXFCh68vyQTiQO3basbNJmm88qw@mail.gmail.com>
Subject: Re: [PATCH v3 09/25] ASoC: renesas: rz-ssi: Remove pdev member of
 struct rz_ssi_priv
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
> Remove the pdev member of struct rz_ssi_priv as it is not used.
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

