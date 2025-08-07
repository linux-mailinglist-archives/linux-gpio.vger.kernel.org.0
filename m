Return-Path: <linux-gpio+bounces-24056-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D2AB1D2CF
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Aug 2025 08:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CCBA18853E3
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Aug 2025 06:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17486224240;
	Thu,  7 Aug 2025 06:59:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4514A06;
	Thu,  7 Aug 2025 06:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754549974; cv=none; b=cp0lUH2TzetqKtrnynv1mHBsmissEcKyL0/BSTT6vUdlCzD0dt8mH6Wvay8U15ZZFz6Fd0MRVtAUBs5u8Rqe4hPeo1y08ggRC4zEat1oesNLaod8aKLrGNUqcIxl9E/tIbTyddKS4aX778eTXsgBC3gNzunvzDJ4nFBX1L3BRS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754549974; c=relaxed/simple;
	bh=2efjV245aS2HfMO1LYgjzxjjsBHErmQGZJM0AeI/lhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jH9a8HrHn4UJ7tTqbV9pz/63ceTYsT4FlAkrfm1ixErT7W1Q7ihvp+/PbuQJ4zVmpJl5IFYiWEEYfHROUCM8mGS7eAzgKCc/MTFUDYDrgARMgS7MNB3wFJBx1ktUizrb1yNHqZSs/pZUYC/er+fcdanpGi3EgoTH8seOtqUSkz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5394a7aae5dso122166e0c.1;
        Wed, 06 Aug 2025 23:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754549971; x=1755154771;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mcG1a630yEasFC8qX8kcY/+feKes4gS7GIzlRYpQ9Mc=;
        b=iGTr6ptHHaSJ+MJjJA1H1k0Q9/2ZOHnR3sDiGmZueTP9Rv7Zz5WEXQkR/o5eC5MdtY
         4oELKdXwhf/0094Nkpl1hVele2n+TSw8qTcKPNl7RS2Egxm8m57xfRg8Lg66fFw8l++Y
         arMBShZY6Nfcgm3W63I8ZxULTgZJ12MTWdnvno7Ki/jb88/arShrX3EKzK/ES741lmaA
         eFDkf2jnkoRS383MdplSNYGaPo0SAHyoXXK374dnYqs1eQ8OlnYM4csSJM+LQdYW87jA
         oSo8eYZTODt3IL7MBc05dBYSPzLMejQD2T/TToxQcEAbf2e3A03Y0z3JcRy8JY6bqYTM
         eyqw==
X-Forwarded-Encrypted: i=1; AJvYcCW45iSvhEM2R5bBe1Zo9zkJoX87ZfYsZOoQvuezczlh+uMv5o2sjv/hOPvjyuLrDrUbRAiybpQjrm9UoATGTIzcfDw=@vger.kernel.org, AJvYcCWS7e4IlH+T26s/dhIZvNNnkak2LRFo8L+/LLsnwbUMLy/mzgZ3Vy9snhTOvFDcnsoM9dgn2NcaEp2mfkja@vger.kernel.org, AJvYcCWaoH/NzcExZNH74kJCntM+DU4GcApu3pz+T7TsaiMNauDDPk8Y4tpyFyCibA3JcS10h3ZFgMkS+xYN@vger.kernel.org
X-Gm-Message-State: AOJu0YyeVDN/ZNHOUPzPlDmQctDfbpFzZypfbCwswq75KG8AhuI3TCRg
	kAYfWkJ0HcEJrAiHLIZpsHiImPBsW9LHEcja9vDKJc0hY2bFEDIai5ew4qNgnlGcI8k=
X-Gm-Gg: ASbGncvftc8BFklha4ncd+WRr4iADpSMw+IgIltj5pjzAueKttZC6xcFKviVJOMhjdS
	fVfd0/07JabS6M+ZM6keqjkFoOS4um3OgC6pGzUxTuJZNXpttjDuJHlo1jl+/6U9QnhurLedHvv
	5xY9BtljEoGzsla9odGTenRPl+E1ThA4BdVSyFXRpfT78DRRojhyfffoGFzBes/LgszghNSASfQ
	J0xnZJ+L8QR3gM+oSGlHYXZ0xgBP12ohGmIx4AeKIMpjYxeXQCK3I/H6AP7E7KmsBN8Tn4imC+E
	bLa9Fvp78VABefYSaK0DZmMfP1+IKJFOd4S4k0h9x57KQduKjCpifSQoKID9e0XmjnD0RnKXRvK
	ChOt7Ycjzt8jwZlTqqW7cG8Gb1d69ZBUpY8hksQ9pzeylqZPawhPQc/2/4+3B
X-Google-Smtp-Source: AGHT+IFIB4nUAbH4ZiHHb5Hzzq0zbu03bYBaGZgWET+6yjiRTmNo6HxIdKmHQyFipVdDmvczcAD3sA==
X-Received: by 2002:a05:6122:2a15:b0:539:3bb5:e4c8 with SMTP id 71dfb90a1353d-539a153628dmr2511226e0c.12.1754549971245;
        Wed, 06 Aug 2025 23:59:31 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-539b02a39f5sm257564e0c.27.2025.08.06.23.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 23:59:31 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-88db7a27cdcso187601241.1;
        Wed, 06 Aug 2025 23:59:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUhtT2aup0SYQeiKlnH7y44accfYiphGmmfSkF9QNh9SxWBkpL1bap/mvFdsTPUb+gZd0Q24pWD3AzmOJmJ@vger.kernel.org, AJvYcCVRKxTvwK8sphOXbsf67XBP6+juC474zysMcm2mAefM2rgMhcRw/V2dU0fegFZVptCwNVlmoWW0VaN0c3tlKyucXm0=@vger.kernel.org, AJvYcCW+TRZKPB5p+bSchORYzIvyaHF+POZSV1vbU5bRiSZ8AaLHstvd4hKsY+f6VspCU+RmvO/bqH/KKtWq@vger.kernel.org
X-Received: by 2002:a05:6102:6899:b0:4e7:bf31:2f68 with SMTP id
 ada2fe7eead31-5037b5d2b3emr2460256137.25.1754549970847; Wed, 06 Aug 2025
 23:59:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250806195555.1372317-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250806195555.1372317-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250806195555.1372317-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 Aug 2025 08:59:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXjWaAU=E8g1uQf95eYUPyVnOnxJKK=u4tj+rpTNO+0oA@mail.gmail.com>
X-Gm-Features: Ac12FXyLucdaeoa5K4SZ0_Ax4t20ZnqOnLyEYb7FaQFYOqEtDFnUOqfh_g4P9EU
Message-ID: <CAMuHMdXjWaAU=E8g1uQf95eYUPyVnOnxJKK=u4tj+rpTNO+0oA@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] pinctrl: renesas: rzg2l: Fix invalid unsigned
 return in rzg3s_oen_read()
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
> rzg3s_oen_read() returns a u32 value, but previously propagated a negative
> error code from rzg3s_pin_to_oen_bit(), resulting in an unintended large
> positive value due to unsigned conversion. This caused incorrect
> output-enable reporting for certain pins.
>
> Without this patch, pins P1_0-P1_4 and P7_0-P7_4 are incorrectly reported
> as "output enabled" in the pinconf-pins debugfs file. With this fix, only
> P1_0-P1_1 and P7_0-P7_1 are shown as "output enabled", which matches the
> hardware manual.
>
> Fix this by returning 0 when the OEN bit lookup fails, treating the pin
> as output-disabled by default.
>
> Fixes: a9024a323af2 ("pinctrl: renesas: rzg2l: Clean up and refactor OEN read/write functions")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2->v3:
> - Added Reviewed-by tag from Geert.

Thanks, but v2 is already queued.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

