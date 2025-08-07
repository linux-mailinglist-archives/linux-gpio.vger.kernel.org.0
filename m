Return-Path: <linux-gpio+bounces-24058-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 127ABB1D2D5
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Aug 2025 09:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BF345839C0
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Aug 2025 07:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E1022A813;
	Thu,  7 Aug 2025 07:00:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2552F227BA4;
	Thu,  7 Aug 2025 07:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754550041; cv=none; b=rlUUifVH6HsV0c56U3p12APD3abaC2AwDLVY5M+PWhvY/fbdNPbBDq9na9LExv/D+V77Gd+93tGAsBu5+Zy/af1PQcTyyKwOLibUob0Itwmy+ynaLiZp4otcXdI8dirTdaVor/psYRI3sXvOav4zctpvLzn8ESlkQr5+cn2FjyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754550041; c=relaxed/simple;
	bh=y0pbEmAucXyzYHwN+AvxMZLJhfnG6Tw24S4jNDx0MSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LWqxBOdFUbTuI2b4qgL/tghY8GTXa+S2hfr4Om/2Mv5zWRDh1VuKz3behj/Y7lQLW9zTKsEmOooqz1ScsO7ez7IZD+9Q2FF5dSwdORZwBKpbSXO2fyg1PuyfSExNeQDxqhSziQzQxdLlJ9cOKfNQhrB1qiWvQDT5Tsl+ELqeDNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-504dd872585so177483137.3;
        Thu, 07 Aug 2025 00:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754550038; x=1755154838;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DXhKXdZ45N1Qi/RxA8tMd1Sxq2dLMp5kIMy6a3nLPy4=;
        b=TRpLSojsem4S15YLsczIkcIjahIah0hvh0XUh70gkAchvB1cDEK4Ybk0r/Yd/iWtWZ
         Q0Jjh7cr37cMTfGIlYDdkiVy9zbj00+4hmJkjWP3Z8oSZ9NMHS20morQJTgIhVWdtgFz
         DGdCL97w1ldIDCKl/5/FnHsnwiyuM9jUCSlWchCdvjSV2Y2uAktQ+Rid1uNNP01IKsAz
         Uc5TyYu7adkH8FYkoiv3bpbWQ7IH1urbmNNHPeUUq86MG8x4LL1s8W6ug3yjL0rE6avJ
         roWPSmdPPmI0vlctlXW9VZt0rqwtMZAfgW6A5Fk90ykxm6u482bxFYOOrDHTtfJgQ1vy
         Vd2w==
X-Forwarded-Encrypted: i=1; AJvYcCUrGEjUrsGB68zdQtM/5jDyQ6YnM1jkRyaY4mpCsKJ7MOa5CvISaveb1+T/qfZK4IL+Bbcboh00G3o1HKe4@vger.kernel.org, AJvYcCV3L1MaEpEBpRM3rCvah7URd2ykcLCPmoEhIRX/oTGAzelIbeQlsKYUJBM/3LEbu5mq04dHMBczc2Ff@vger.kernel.org, AJvYcCXqG6gHyh4xxgSsBqZ9zjrJwMatZAYoPpX5CsHgruqR1zDpg3pKVzwM47zI2UU7GhSSLwTD6R/ylb/JAc1fD1Tsgjc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ODT+ddSVIFtt7ZclrxCKYqgNOj9EHGs8L3HxthJXINlmmj3J
	Lx9/z+CC+cZ/n5bPk5qwWb9rvhlfw8hJOGBaG3RBjkoXPCbIX+OcHz/9Vrv9hzNs7jc=
X-Gm-Gg: ASbGncsdz1XKvd4ofhcXtOOtfzpkJO9+RS8W35N97uIRqezKgeHzBvtDgCxdgmdkxDL
	Px5a0n/xXcDdOyfuoOzpS3jxM4klCq03qEnhX708fL7+s2NXF6X+DdS3lC5s0xLx0E8mqLfyahP
	gxVCwhyNWASyLaeiJAmA3PuSNG4bqVwEuwejnTSrwTz+i+iXO60qjT7QDzMvU3YszwfkIkHrsXV
	zNyjusAUerL1+YS/uoFpahaGhwPSPuo1z6P4MEIExFOKbPpcNOIHvGhoHtH+QQh6/b9+IohNv33
	DmcGfa69P62Ne4vkMyEpp9buifFa6UcW9jZK8LGclzM5GlYYKPvyxM+ZgEAN4KQgnLXJd7+/ukp
	zZCvtHpb7SaBvDFeCDp21BNMkfPuMco2t5xF/Hp2SQOKLdk3OSkVhspIv2YEgLG/Y7sxaguM=
X-Google-Smtp-Source: AGHT+IGHldsc2cnVr27KnuvLk0q5/WecqZP93GHUCQCQNjHIeOYShOvUtGBdpAEJkXD9dR9A4iNx8w==
X-Received: by 2002:a05:6102:3747:b0:4de:81a:7d42 with SMTP id ada2fe7eead31-503710c9afbmr2775394137.1.1754550038482;
        Thu, 07 Aug 2025 00:00:38 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fca3aea9fesm3503144137.21.2025.08.07.00.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 00:00:38 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-504dd872585so177475137.3;
        Thu, 07 Aug 2025 00:00:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCURJucShEVDFiDXG60+tZz6l1wpNInIzpIT3LZlV22ICIiQ3BJzTQyK6hDTSIxEp8wa775XT+UoXFomvqsD@vger.kernel.org, AJvYcCUjvg+z1q2Fj9g2tvL5luv5U8mpnx9W1Q0Fi0JqkPq1kKlXEYOuUv7+Ci11GwCR0q63MuPhK6s24LSyVqIvfCvckEo=@vger.kernel.org, AJvYcCVdOewOiHc43dJ22kXKrDAKmDbVi7Q1CSt+5CE+ynkIqLItVhJKVe0rsKqGxT+cKVT4LRxEKswI3US7@vger.kernel.org
X-Received: by 2002:a05:6102:418d:b0:4fb:f31a:98ce with SMTP id
 ada2fe7eead31-503710c9209mr2680177137.6.1754550037770; Thu, 07 Aug 2025
 00:00:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250806195555.1372317-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250806195555.1372317-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250806195555.1372317-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 Aug 2025 09:00:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXeL+bm_R+HD986FwC5AhokwX4219rcJpJveL+xP1F8Yw@mail.gmail.com>
X-Gm-Features: Ac12FXxAFYKHCV9J0KTwJrHpXh76t2zegs4nqbXiBgxRvlJbGZ5KGb0bPPNjP10
Message-ID: <CAMuHMdXeL+bm_R+HD986FwC5AhokwX4219rcJpJveL+xP1F8Yw@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] pinctrl: renesas: rzg2l: Unify OEN access by
 making pin-to-bit mapping configurable
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Aug 2025 at 21:56, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Refactor the RZG2L pinctrl driver to support reuse of the common
> rzg2l_read_oen() and rzg2l_write_oen() helpers across SoCs with
> different output-enable (OEN) bit mappings.
>
> Introduce a new `pin_to_oen_bit` callback in `struct rzg2l_pinctrl_data`
> to allow SoCs to provide custom logic for mapping a pin to its OEN bit.
> Update the generic OEN read/write paths to use this callback when present.
>
> With this change, SoCs like RZ/G3S can reuse the common OEN handling
> code by simply supplying their own `pin_to_oen_bit` implementation.
> The previously duplicated `rzg3s_oen_read()` and `rzg3s_oen_write()`
> functions are now removed.
>
> This improves maintainability and prepares the driver for supporting
> future SoCs with minimal duplication.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2->v3:
> - Added blank line after if condition in rzg2l_read_oen() and rzg2l_write_oen()
> - Added Reviewed-by tag from Geert.

Thanks, will queue in renesas-pinctrl for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

