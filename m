Return-Path: <linux-gpio+bounces-24060-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23098B1D2DF
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Aug 2025 09:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5DC8726581
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Aug 2025 07:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A848322068D;
	Thu,  7 Aug 2025 07:01:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC9D1E3DED;
	Thu,  7 Aug 2025 07:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754550106; cv=none; b=MLCvnMfmbaO8MkAhwVi0Q6v6LdkiwkgraCEj4hZPMaES3vX4ETREtGlKrEGqOnLaufE3Pkogi15WzdzwWjDdsXQ2RN1YKleAcydq4VgcjPkbM8nIMANiXNbEHHeKcqOOxknx6ySG8X9pHnJEUMxd3OxEzRQHaQkWqzi7n8Kq4bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754550106; c=relaxed/simple;
	bh=gtaKeTPDYj9R4e6sc4KjxbTGXRdm4jAQy5A3dyK4kK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kbcDhvHoZH4ZXaOpYxs2LUjrq1ZqenDqwCCY6KQ47eNKuZdguehtf8TqQ6RfrXciGocl5QMdS5F8Gu+9Cj8hv9AgOXUmNLR+4+a2TaL8aVybBFNErghiVCvCHSeM7GdaAktWcApF/5FklAksaivD5Xak6/QL+EGTT0E/xUSTXWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5397d436dccso1231706e0c.0;
        Thu, 07 Aug 2025 00:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754550103; x=1755154903;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y2z0gFQIpzMpAcMXnaZJ47zFeeVwbviQvE7xhh2/PBU=;
        b=TjaqCyr9NbkClwiCxt+a/tELqaDOtCbELSt3WCR0fhoRS7NBUk5eJgjfBbXq9TPSex
         Z5HxPg0ymdr5UqldqSZLO7ZDylaU119nAf2mzMnsocLRJygJBqytHNYELKn8MQK6flSn
         yhm7jC8pfXeTajfFZcBg/0z1n/Tm7vmpRvsGmodA7Y41d/gCHf3MCo0vcndOknGHAHxF
         xJyumgBSuzvO5HWgWXGfMBKN9D/+fsirxahBbv5mWkoTxi/P8UbnaSBmwPR/pEN/ajCb
         8O/hzrJlzBQ7b7lH+Zc4Jo/ohjRRW0q5BdwYzHr6t8xzvMrVPRn+QISPsryEf8IUXIJT
         kMPg==
X-Forwarded-Encrypted: i=1; AJvYcCUE5kizbz7yGJWL7MmrrnJlZoHwf3WqrzOWGNaksVNGfvyrza0r16ayLMyJi7mA4PhVAb05tFo1SoqQ0VpG@vger.kernel.org, AJvYcCUK92zrNELyuTQqLeMZKr01810bAkm7Vt03ziV3fNQ6p6/gY8rIwiW8Zj/8QImw586iggC9yqj/qiT8N66GHz8+sjo=@vger.kernel.org, AJvYcCUcqM6V72tZ2oHedvOoe8A30h+m82eJfqp7jOhodMISKuQbPi97gC4/FqmUEyDqQ7nxRG4uOIj1ZuEp@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4RvTbEnEBAlNjm4PhsncYWeG3bP34F08yneJvfSKEu0dQd6I4
	IUbP/K4uhcV7RjusuYMY1H6i8AizwfeLb3xKveTqupZ0f325C/lgNJpb+y0OvSxz0Oo=
X-Gm-Gg: ASbGncuaiabaWAJ1PwXBgfJgAlOkc4RX57NFUEh+zESvrCVwOYrBy7eMXuVrCGSteqn
	2+g9f24hZYQdm9gtHUhvvUeG5Ujs4tYeRUAUq2cp2HLYzAxNE9golt1Ibq4Uq8Ig1OTmZjgK6Ge
	m5+ev70M2cvdv0ptxkjRDrDdUF24v9VY93ggfMpYPdlRxvQtEdRqEgPRpJMy/rKLiFeEY9ZTcIA
	r1CBEKTDfH/iWCckH3lh6mUUGz6Nyzp1AH07v7CWzco7dFnxQp78X/BIergPOU5cRrc3FY4L8XJ
	/mydSCbbhulVPiWfLeBnaXT89asgFHRMPcSd8ZnAx7bKHXD6yFl18Q7l15H7aVGZroJByb5L/55
	yyfB+oF1w5JBHnkrxLlSpc/NBBdSIzWgyOh+WvnC5zR7T4Q7qA7PYYDfGjCt7
X-Google-Smtp-Source: AGHT+IFWzfHmCrx/syVFj93MmDxB8EWDdVEsTRkmfkCoz8OSlHamUrq5OfYNhU6stdKQsaQKJPXPBA==
X-Received: by 2002:a05:6122:3bd5:b0:527:67d9:100d with SMTP id 71dfb90a1353d-539ac932297mr1040545e0c.4.1754550103458;
        Thu, 07 Aug 2025 00:01:43 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-539b02a39f5sm258308e0c.27.2025.08.07.00.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 00:01:43 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4febcc4c93dso624897137.0;
        Thu, 07 Aug 2025 00:01:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUnXWbmFQQ1DllQlD6vsk40+YFExdoAtzyIQFwjYCN4VKk8kBjL20CGJ7bp5NiuZHk1PAZyJeVgrDP5@vger.kernel.org, AJvYcCX1mfLedeqzL6qVWBdX2UZnkWAHU6MAH1jLY4oBsbgpCYxa15ShKmzNrFg17nStJ9xq9nf+ezXgREIZuD/W@vger.kernel.org, AJvYcCXBZyxIEm99y1Ev21Ku1PU85ezh8a1fGdRmH6ssn6kE1Tmx6/8cn6EMBA/XKH4HadauPmieknYGgVzz+R/E/snhFec=@vger.kernel.org
X-Received: by 2002:a05:6102:3583:b0:4fa:3547:2d38 with SMTP id
 ada2fe7eead31-50496539382mr1232373137.10.1754550102675; Thu, 07 Aug 2025
 00:01:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250806195555.1372317-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250806195555.1372317-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250806195555.1372317-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 Aug 2025 09:01:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW=-O3NDjgNSGa8GFArp9wJ0CFRmbFbTKcZ-mW=TCiTOQ@mail.gmail.com>
X-Gm-Features: Ac12FXzcsKCSwRNytiOMEpoQrG1uZXEUyYZqvFk3cPaRpytKlAbgkzI0RyRVu2Y
Message-ID: <CAMuHMdW=-O3NDjgNSGa8GFArp9wJ0CFRmbFbTKcZ-mW=TCiTOQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] pinctrl: renesas: rzg2l: Unify OEN handling across RZ/{G2L,V2H,V2N}
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
> Unify the OEN handling on RZ/V2H(P) and RZ/V2N SoCs by reusing the existing
> rzg2l_read_oen and rzg2l_write_oen functions from RZ/G2L. Add a
> pin_to_oen_bit callback in rzg2l_pinctrl_data to look up per-pin OEN bit
> positions, and introduce an oen_pwpr_lock flag in the hwcfg to manage PWPR
> locking on SoCs that require it (RZ/V2H(P) family). Remove the hardcoded
> PFC_OEN define and obsolete per-SoC OEN helpers.
>
> Also drop redundant checks for the OEN offset in the suspend/resume paths,
> as all supported SoCs now provide a valid offset through the `regs.oen`
> field.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2->v3:
> - Grouped oen_pwpr_lock flag with other bools
> - Dropped redundant checks for OEN offset in suspend/resume paths
> - Updated the commit message to reflect the changes
> - Added Reviewed-by tag from Geert.

Thanks, will queue in renesas-pinctrl for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

