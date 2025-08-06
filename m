Return-Path: <linux-gpio+bounces-24031-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E603EB1C67D
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 14:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10285165F67
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 12:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 212252580DE;
	Wed,  6 Aug 2025 12:57:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B40192D68;
	Wed,  6 Aug 2025 12:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754485071; cv=none; b=S73wyek/IHPUvI+dwCECNw7369W7GqswpfJVwTX3pYw3ZjltPQdja0u+sY1WGN3sDr+dWen3DuhDX+d8CO6DKzZqPnafH0Z5ypFuQ3Hn1Ct01szVhGD47PcgT+Eod4dfdURpVQEn0TYG3VxxDV3YVki4SW/frx5v9CwG4p4IWO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754485071; c=relaxed/simple;
	bh=idVj0LDZ1ciPqiFyp3oqlafE+EDtWJ2HQ/71qe7VF+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HLphxrvbDfSeJ9BSkaqKgbSIYwit3blbNRvKGRdt0vHfJLApg/2vvAQddM1G5N1G1dGRyJ8aABAzIirnZUGPnRv/95OTb4fuM9jY3k+ykegB3A72B+yFbme8j2ynN2cEY3cO06UkOi8JJKmUSGLETIuj1V42cc52Oe/uxpgzn7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae0bde4d5c9so1476240566b.3;
        Wed, 06 Aug 2025 05:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754485066; x=1755089866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U17pHvY+UHWFMa3DFDRkDraysS0TjqbCsuAVzTOwy7E=;
        b=qbIUlhR3YnUNYZNFvWfv7aw4PHyii2mjFtKzmRkFDOxGF0WsaCpwv5hdQLpkeP0f/3
         e5WlO29CjRId8VkL6TmMzIdHS2lri5u0/Z09xsamXzsKSVDOz07Jh/fk6HRH4kCXzfsZ
         ycLCJjo5sZ/AlgKf1ROIAAt1wuxrztCUMYvFetbKoKihHaJiEFV58EiHvsu7rWsv8qbo
         JSX2nJ3Lxl/k5DGmR4wx5v9thzf6BIoeKWCG5XTkaWymp5kZm18345Gizk3/sac/Ch7V
         fsbUuKWwRp3M1ygsnySAZE4EBb2wLFeOgQ98fTApA2nenv/KGQhXaUaO/oLsRr6tLoMB
         TEsA==
X-Forwarded-Encrypted: i=1; AJvYcCVmzQ2CGl3CMXkKGnvPsQAHAbfe30mCvOpbPLcytpJ5ENBCq2csnDKWn5deYtBLaJEPPYRWdbjrcMrD@vger.kernel.org, AJvYcCVp/LvKGuQHpysozlICUOwJAeUHfcHjL2zUlQnvsPkD9/HJXdWXo58o6C2i0Mu2fNHYb31JPFdUS0YbSAjg@vger.kernel.org, AJvYcCXyvVwGFJmaeFunHGnhFADPIhSKSpNWNNvi3m7nfoBnZpIjiba5wqZ0KXtGPenMmzpF35Ix+L0yLsRUNSqtyumfVSo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI8rvQchPt6tkq/enLo68eSqTQzn2HLnUhPZppLJqRpqD4I2bK
	eOsFwAiPgA+EXzaQa6hd9Z/UdrOxZ1YyquE6woEnHAuFTdRF4A1bBgUCyGkjTqwbV0I=
X-Gm-Gg: ASbGncv8Y+8GbIsMKXJPt5bPBYC6NB7mibtjGLnEsU8bLe01TS+sJvZ/m7XTYP63wtW
	IAbL+tmQaPhi7tEuci+13po4i5WJJpAM5my2W3fskaXWn0CPcTVrxy+JktNejMwjNguyG6Xnmno
	ElcboIvAqvBIMPKldvSB8JAuUbIS5lPsURRcgxUi++s6U6Xl72Z+bq7menWQ2M3HLRPwPj4LBON
	R4wBjvwjGzYTXX3UAnzFAKgTz2Ad4B5YaotfKgKtTDFtopNWzMZ7etXf7SVcXL4e1eQWec8nrfe
	AAW8HOrwCEL/aQ+o5TcSjzGv3w7nFBnFmQRVguMA3kDyd3dsO6lbsBfQs5jjazZw2SOueTTh8Ep
	dRC8VwPcGs2280NerZplcL1hb0xLdst25hkTWR9PwIybx89FU6q9fHkk3VXCb
X-Google-Smtp-Source: AGHT+IH7KKGtrKpoSaBghAPv5zZMM7jMTywrjEVG3ljTGmpRaCHW4rWHx8LjXLGITJ6jRpRx2T0NKQ==
X-Received: by 2002:a17:907:3e10:b0:ae3:7255:ba53 with SMTP id a640c23a62f3a-af99048e4f2mr264827366b.53.1754485065623;
        Wed, 06 Aug 2025 05:57:45 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0e7sm1095922866b.114.2025.08.06.05.57.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 05:57:44 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6157c81ff9eso9979418a12.3;
        Wed, 06 Aug 2025 05:57:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOeA1+x/Rvro3H9uKw1jeu9mQ0bUBuBxApwNtDIjDuHZeWB0uktELwGJwDOgBrnxrpjB/x5mhJJNHwiiH0@vger.kernel.org, AJvYcCV+4nPnLfhY3o3FMFqDIAix3Cx54Ya54Y1UnXD4QAsNveOi3bIx4oXuhBn3THlAsAm+LVmqoAQES7MT@vger.kernel.org, AJvYcCVRHF4ym+TjohoJwZgTAdFVxWBwadTAV3HV2rWxshK4WmMrQIiawJb1SqWaeHUObrDNcfBX7HkZEnpTVcTs/yUx3Ec=@vger.kernel.org
X-Received: by 2002:a17:907:9304:b0:af9:3727:99e0 with SMTP id
 a640c23a62f3a-af9903f06d0mr270371266b.38.1754485062293; Wed, 06 Aug 2025
 05:57:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709160819.306875-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250709160819.306875-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250709160819.306875-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Aug 2025 14:57:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXu+sYNO2=QU+9e7E1pMFpgWBPEh_VoWgVPb-5aDG6D_w@mail.gmail.com>
X-Gm-Features: Ac12FXz_Dp0l00QbEPO2xRsjcEZM6XNtVJ4vdS-kUOwkvJPpEMkvtl13GIy81ug
Message-ID: <CAMuHMdXu+sYNO2=QU+9e7E1pMFpgWBPEh_VoWgVPb-5aDG6D_w@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] pinctrl: renesas: rzg2l: Unify OEN handling across RZ/{G2L,V2H,V2N}
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Wed, 9 Jul 2025 at 18:08, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Unify the OEN handling on RZ/V2H(P) and RZ/V2N SoCs by reusing the existing
> rzg2l_read_oen and rzg2l_write_oen functions from RZ/G2L. Add a
> pin_to_oen_bit callback in rzg2l_pinctrl_data to look up per-pin OEN bit
> positions, and introduce an oen_pwpr_lock flag in the hwcfg to manage PWPR
> locking on SoCs that require it (RZ/V2H(P) family). Remove the hardcoded
> PFC_OEN define and obsolete per-SoC OEN helpers.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

> @@ -270,6 +270,7 @@ struct rzg2l_hwcfg {
>         u8 func_base;
>         u8 oen_max_pin;
>         u8 oen_max_port;
> +       bool oen_pwpr_lock;

While u8 and bool do have the same size, please keep the bools grouped
ogether.

>  };
>
>  struct rzg2l_dedicated_configs {

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

