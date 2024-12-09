Return-Path: <linux-gpio+bounces-13670-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FB49E974F
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 14:38:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 378661887AC1
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 13:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3141A23A6;
	Mon,  9 Dec 2024 13:35:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF7F1A2383;
	Mon,  9 Dec 2024 13:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733751358; cv=none; b=Ehndx6gBqJyf4ZQx8KyzK1OrCV6mvlafHMsDKC3/wgWGaTn9pl8I/ztG8rjkH7Ka6pPxRHv63F+Xe3jlse+PtRKwHEqfrp8x1f3LiKRtWdFG1RyzhxHN86iakRS1lb4ftn1JjFe/gTsFvJapLrINo2vl30fTui5G4Z0hy+eAwTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733751358; c=relaxed/simple;
	bh=WNz0gZiXZkvHaFSN5ZkiQ5VdRIyPVUq1YshY4B4Islw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nNEHtI0MBZKIALgW5P8b05jhdv5AL5w+G+3jEE0qDxYGsxxnuT8wyOQWMNQdLgEwqYk2QkzZ6PoOKpqeYtpwzCY3g7Ug8D46U7SY6dHvg1jjy+a7qc5iCNeSzmiU6fQM+g6n0Yhi70QMlNORY4HErjQmXtkyAoGO23z4Riot6VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-85ba8b1c7b9so2312499241.1;
        Mon, 09 Dec 2024 05:35:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733751354; x=1734356154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RHQgfBS9vF/bIRLp2OZ4MjR0Xk5ziBT/flFqP5tvpzQ=;
        b=aUHajQEbO7SLItWlVjSDwJzNpVu4GwzoK5/fOpAeKISWW4Jn7sxE+6oQxLShGESQqg
         yDva12NXrzvf4t/MyW5xdxl8+xUB7dWJhS+KvpEPmifyOwK8gWYh1oYV3qZFlv/TVq+a
         UxrsIkMrn8RYecHTlw2eJ8J3vrmZYNBK+VSDodPrl6qwcHRjYIZKz8GVkcKJv89PMxCi
         tlpbqvXOXNi2K49leoq07S76z9ztvxaH7OcCsPqaeI83n0PSAUQLIp3htYN+vumoDX1i
         bVNzc61iSiEJeq4xaM09dYBYf7eWxcc7hs0e7L//o3nYY0ZMKiIneGyYmjHG8gG6XibI
         4cLA==
X-Forwarded-Encrypted: i=1; AJvYcCVCF8uKbpC3KKo3nH8mKypRd19ndiZJZAzruV2WaKsBYnPA4XXLIycyn7KD/LWervIlX+5Om9MGRfwi@vger.kernel.org, AJvYcCWNFkgQ2WqNplwkK52a/zQQwS9k5Qfq8mkWPM0kq8rrE6KcQQfZWqsP7Si/cRzu9LsJc1EjqulDLD/+xNq9@vger.kernel.org, AJvYcCX4fOhH7yxP3QZHnvV7KqjYx4Uk+qK/gAy8yOCBzkDBsn5LlyRgc1P/4nb1uPTGgYzw/afAyGQhIjt/b+uu/+xyffY=@vger.kernel.org, AJvYcCXnDIXO+kyJTLU8IIn2BAeaK4Ebe1chOwAEvmnflZ4tXQbaeIsGTptj8Cq6ISQyWSKdqe2NYxEXKmhjpw==@vger.kernel.org, AJvYcCXrHvbGhUT7B3i/gV6w0fdpgSLoAhzKQKTGrNFWrOPLYDKhwgBSvFrOuPakG786hwF35BIhbS2tvQh5@vger.kernel.org, AJvYcCXriZygt7HewM/0ajB3aO3NbLAr9x4Z2hT85h1lmPN3dRTQDtDerK+jJ3cAhNn/JLOLJ0w02xyGwJSW958=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1i3MO8036taDD+DxsaFwrq5zepo/GLWmO3n8ioEgWK/d47X1C
	REt1/HyZkv25LgxJPm74VV8Nh7btMcZeEG6IIKXvutdjVC1VJ/+zix/yA2lV2TU=
X-Gm-Gg: ASbGncuddCEdOMSZfV4/2r9qU61lv5nsjraRmWeJksYvtj/fL9qMYdE+Hdy09Wb17LM
	91ceh5vtYTsdlNHu19mMxFy4kWsheCvZPBtu6256Fxk0NwttulushY4nqp7MtM7KG/YR133bEX+
	HdzM6wzHeWinbxi3eyBD1QHBUdGOIMcFlQelHbU07E6TsQsS8yaAGXWBL/1MivWb32Q7ner9KRn
	6cDsNnlfACNUpsQIEI+l2KdIFgwxXr+uJhAbX7XaiB1xLuwo/39fyidrrg2V6Gekj2WKFuBhpWW
	ZRbTI/3SliBL1kAq
X-Google-Smtp-Source: AGHT+IFMT7Z3S2y84DrC2ZlCUDyfh6pMB8W7C0l7byyI0rF5JeFmGJkFPmvrsOGCOIIaOO609B6hqw==
X-Received: by 2002:a05:6122:178a:b0:518:78c7:9b50 with SMTP id 71dfb90a1353d-51878c7a3aemr1921278e0c.5.1733751354217;
        Mon, 09 Dec 2024 05:35:54 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5174fbc9923sm190600e0c.11.2024.12.09.05.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 05:35:53 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5174db4e34eso610062e0c.0;
        Mon, 09 Dec 2024 05:35:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU/kkT+IOACqM+IJ10uYIHY3O0EcK66in7mH2s4WUQnn4U617tLjZnkBXfXb05YcKeOqIQrkokfzXAhSbvu@vger.kernel.org, AJvYcCW3Nbn2gdDjRIISa9b7A0+64d4SaXIAz9kyUd0S7+zQnzzBT04ePBvEBeX0nF0HUAL46uGWb6Mdp2cepYo=@vger.kernel.org, AJvYcCW8bKcz5jEoEmavodS+jN+OycorqszRHCpYeRV/Nhbj7VbvVyoeYWJAj8VG/poSbUkMkl5aAqOV+F4IouDDSGWJnG4=@vger.kernel.org, AJvYcCWTum68rlmKPtSyOEGeSCNgUepqmVvS6+Usd3mbYLFwGzascxZVAZJMFtSLG091dktzzaVBv26oiqsy@vger.kernel.org, AJvYcCWhHCVvzuimI9a5opme+eoUC5tLpkZ1FYirAlTKw+g93tuKt2SXaG9lBVxvwkwgwSfhyK3P9oeM7bch@vger.kernel.org, AJvYcCXaPz0NIUlLeQsNBKaScotTxeC5qDa3SABl340ohFWuOlFdsFrSUmn75LN5J7TveDkeyUv8WiRl0ckDcw==@vger.kernel.org
X-Received: by 2002:ac5:cb04:0:b0:517:e7b7:d04b with SMTP id
 71dfb90a1353d-517e7b7ddb4mr2204963e0c.5.1733751353018; Mon, 09 Dec 2024
 05:35:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com> <20241113133540.2005850-14-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-14-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 14:35:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXHMP9m1EZSnNUFGfw4ZJUOF4c6MXwgu3+Sou66HUr6XQ@mail.gmail.com>
Message-ID: <CAMuHMdXHMP9m1EZSnNUFGfw4ZJUOF4c6MXwgu3+Sou66HUr6XQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/25] ASoC: renesas: rz-ssi: Use temporary variable
 for struct device
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
> Use a temporary variable for the struct device pointers to avoid
> dereferencing.
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

