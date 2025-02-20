Return-Path: <linux-gpio+bounces-16327-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B67EA3DFCD
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 17:06:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12CC77AE3F9
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 15:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21BB1FECCE;
	Thu, 20 Feb 2025 15:59:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA8C1DF754;
	Thu, 20 Feb 2025 15:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740067163; cv=none; b=RH0MI34vah1JjZRViOnPPtS32PrKHzZq3t4BH3C24A+f6cEsHQwKxXOyuucDDm6KzHgNfFkXyWSjPmlnxiVgGAd5JJ3PHAvB16QSy5Yn53DjIO5jeyU3nzyf4X2HPA8cwp/nk88XM58l6XO7VUhCa4GeSRhkxgf/FvHM+iTmVbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740067163; c=relaxed/simple;
	bh=gd3mfG8VrcqHTh2pxAVnaphZe0jsHGM3eczfMJq9OPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kqxJ/sh7i9MOohnx0aE4eM8kVIModQKkimV+2wzQKh4rHA6giWKFnjTym2zvyM+i+u+qRdoA785zBpqzeqZQP5SlDNzjq236kCg/Ex3O3ghnB1bXvrFvnyQbGXNgL7KkhjxkpRfSotwtAPfg9YvgvY5443bGMpxQE5gH3wipi34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-520af4b872bso332299e0c.2;
        Thu, 20 Feb 2025 07:59:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740067159; x=1740671959;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eejQ75Vf2HsSAhkhKxQyUqAB1hwFl4RxUzvP3qgfJsw=;
        b=DtofrCD6BtJSDeXPLaNYrer9Sg1YOW7eKuuCJEHMPVAknaatCHk8qDc+8u0/nHEQOY
         oqU/oSnWhi7HW3k3kcWkGVAdTY0UegrtXyLn9yDxzOWZXrL+bKWlRlsC8M7xb3ARLbdw
         Y0uxFLwkRxSMWzQ2s3EvFrFB2ibn2i4Kj9HeDyUhW7FgJ38yyeBxxhYSx6+x5VcygSlZ
         iVelTc/3UQrB6LyL23V1BjJtR8dLwyjJnIZhUzvPLlYzdtJB921S7ArSh5ED0iOmY48z
         lgBEoFM9ntZ82A200XymtEM9nDsxtoZarXvZPIi0+pl0ghrknvikRaK0ggsclyuPgUnb
         D6rw==
X-Forwarded-Encrypted: i=1; AJvYcCU+Iar2g76pNaiKuWnX86JoDVXCdB++Awg18sT63rNQREbijro58AXAqEhLTOYwynsQXR+0YL2yhQzI@vger.kernel.org, AJvYcCUa/TT0rleQ22aNOx54WmF/mxqm8BS2mol2+l2OiZFVrPm3wwt3Krpguh5w4vHhIT+hU87lXFegpg8A7kSNxDphNwU=@vger.kernel.org, AJvYcCV9YML3XHRnTzrKsPW3A/n2YMSq3ERsx2L75xL950/Sdm6jYgjQcymnbOamJb8qH3fkTE03MqhSnoOIoe/T@vger.kernel.org
X-Gm-Message-State: AOJu0YwMen4j5BaZbxaJESlqG2c9yxUwiC0x7RAPJyaPUfsHYOdfZyI+
	cwPU877qT8Piz3o5hZ6r/9it1F8o7yRRI1TyYX0VbjerY31cqXsyAMh8D6vk
X-Gm-Gg: ASbGncu1QcHpUMmuDBBpDiCOoU2H+rAN3VF6mc585BbLvcMurjKJBlPShx2cWF3NhMP
	fDlCnTvq+nr/iX5SIkojRiC4NlKvIRv0s5oaFiAhMkfsJ3H2AgYliyiLtnuonvcDwJSKPfVh871
	edB6hWseENcKI1pkop6NEbQwNFJEV9liOb/tk4GqtChLXtYw8Aem32sGbiII9L5wzaV2yDjtsnw
	cPcwbF/yoWQ7S8xJoah+eGCaCGMQCoDGvz5I2g47noadTL8ZGJqbEkBTShwwc7LyE/oDGBHFTzC
	E9J2y/V9UW854bFewFNX3vWslaqjOz/RddTT9Fl9Y00arDsM7/aJOg==
X-Google-Smtp-Source: AGHT+IFzO3vx/kmCi+q/6+phknscQnYuQODMakjCYFfBwP0Zi2CdRt9WyI66Lwp7ylBp+2RULXXwOg==
X-Received: by 2002:a05:6122:308c:b0:520:60c2:3fd with SMTP id 71dfb90a1353d-5209da8bd81mr12004467e0c.3.1740067159674;
        Thu, 20 Feb 2025 07:59:19 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52097e27968sm3251110e0c.18.2025.02.20.07.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 07:59:19 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-868ddc4c6b6so288175241.2;
        Thu, 20 Feb 2025 07:59:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVEUuVgSYiMuzJZWGhlJU148qxizQT9wACtMCUD5YnAwhN2gh4ka1LZA9IfLAvkduSnPYWw0VOySolND7q3@vger.kernel.org, AJvYcCVW+girNYhMmnO1nsCA/kj8yraZ+jh1FrSku8dDwWkIkGtkvxydvG2cxyYJtjeM79vZPUXjBkp66GhV@vger.kernel.org, AJvYcCWX7pjbbDX9FtNaazyo5dY9YxE0+5CWPETgv1DPaIC64AY5cItHNBNk9hanmUoe0xP9f9tbxQ3WZvlWrSbE4bmX88s=@vger.kernel.org
X-Received: by 2002:a05:6102:2c18:b0:4bb:c4ff:5cb9 with SMTP id
 ada2fe7eead31-4bd3fd5249cmr14319737137.15.1740067159114; Thu, 20 Feb 2025
 07:59:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250215131235.228274-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250215131235.228274-1-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Feb 2025 16:59:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVSybU_J_Qn1oabQQv4fJv6eaT7YMQmB_zH=9+vLHs=YA@mail.gmail.com>
X-Gm-Features: AWEUYZm7DzKUx_jdkzSQKOfhMhFA2yo5hukaEE1mGU2GECJf0FH1kAyIYF6joLY
Message-ID: <CAMuHMdVSybU_J_Qn1oabQQv4fJv6eaT7YMQmB_zH=9+vLHs=YA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Suppress binding attributes
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: linus.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	biju.das.jz@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 15 Feb 2025 at 14:12, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Suppress binding attributes for the rzg2l pinctrl driver, as it is an
> essential block for Renesas SoCs. Unbinding the driver leads to warnings
> from __device_links_no_driver() and can eventually render the system
> inaccessible.
>
> Fixes: c4c4637eb57f ("pinctrl: renesas: Add RZ/G2L pin and gpio controller driver")
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.15.

>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 1 +

Looks like there are more opportunities for similar changes?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

