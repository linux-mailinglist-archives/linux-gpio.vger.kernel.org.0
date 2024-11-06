Return-Path: <linux-gpio+bounces-12644-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BAA9BF100
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 16:00:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 279BC1C218A4
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 15:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370E820513B;
	Wed,  6 Nov 2024 14:59:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED11204F7F;
	Wed,  6 Nov 2024 14:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730905177; cv=none; b=UXE/dN7sQlgZwXBt0iAeyG4/z4FxZsVriflE/6XpxK5tp5M3MRyhzcYAB6w0a/86Om+H7GFsxlH2u4TEwcwDeyYGPUQ+d8TN2FGlPVQu5C+1BVZzczuBXKhiLmYIR1gwYG2pdHfIX/wFJBsk3E+wHL4cZTgCVvVUVZdw5cmmz4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730905177; c=relaxed/simple;
	bh=UZKpKujLwVeGdVZk9MpJvykEvV6HabVlF+HSnOu32uU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hNxkSifL5Md35+5HINdCQzsp1AapKZ4oOIeHl4+q4HmufKx9mTIKzUOw/96jvi/H5+9Otc6eSjN+VnoExuqAA/EaQpTqPeKyZ6q5aKcb61HyqvrISkXu9muXSJES6ZDIFpObvRiQYyhjeRk88pL06WhdMueZy2v7ozKkyE9shV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e38fa1f82fso17246277b3.1;
        Wed, 06 Nov 2024 06:59:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730905173; x=1731509973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRSWOQdsDyO6AcUgL70A+o8qTcIm6mjHEU7V94H9DC0=;
        b=BDZwoJ2EG/xETOZPTVF0nT/+WXr4ThL5vvx9XvSLBXKx9WuV3mDd+PGL38NdUIbALO
         AHMxfHjnBVbtXkp5u0fAwE9SppXqV+nH9UZV6d8YWeU2Iy270gJiLdh7AtsdxdBA9Qmp
         E8ZJ3p7+2wT36iA5DgliCU01cuxxRA6HW11sRt9mqXe1mwfKnDQwTCW6uaxRxlWInctD
         8/4+3dCg2pk8a353QvA4A9BsjjyAEwmH8zWKE07WgvKHxM1mgdugFk5dLvgP7yOJpQDx
         AnBQ9/e/jhvEKtdppt3OFn8N1X02wcXOxe0MJr9oNQWeMXZplXLJrrwEkiC7Cd3aS0nc
         06lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFXJRsPawr44gXQelcgVpviMZEoBE6YKMHlaIrAAsEqN9Y2cWEr3z4Ijx4OxCnbJKGr1hODClC8Ysn@vger.kernel.org, AJvYcCUpZyt8F+6ynSGQDoWxiklaSBkCDdFJSMT4YiOyC91FjrL/fCVVxG3Ggbhl5OGZ+BHcMvZbpplw56oh0jeY@vger.kernel.org, AJvYcCUzZFN8HyiAJwaxP+eHeMospHQ69J1Kh21OlPUS48A0lSAUYya1M5kU1lq7P1Z5d6+PpKJkfcxzFZolSyE=@vger.kernel.org, AJvYcCWUNevwN5C7B4NbJGkd4L6+4oamuVJ46mknHWxzyZZLYBzkpTwLSWz2yPSgth8TJqD6AxoXFFL0mtXf@vger.kernel.org, AJvYcCX2KBpfJJVNRs6+GT8y3Qd7ApaozmJASUxuATBPMFng19q2NqGWTluvth9hlvOzGhxKOKEial3dFi4mFH4fvkyYosw=@vger.kernel.org, AJvYcCXbIFwyfh/S39qJZQAiQcCdQd8UoH3ZPGF5hqziDrwMz3cWaCsFI0KPPxkVdaHzIVDNOOWFis+D//gzmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJJVxABhIpMzr5oC7oYX9w0xq3RKwP+HROPoO5gCHVFQVBjZI2
	siSol6dkjvekqgGA/cMoA/cXB/qaR3CPbpVDa0cjz0uTS8xfVeVKq3CZhJSB
X-Google-Smtp-Source: AGHT+IFrL+bK+Xx4mH0U8pW6cZ1PVhkcDrJHq0TByzXCWYR+KqytyM/FfwoxgmZLlBrKTibplSYkxA==
X-Received: by 2002:a81:c843:0:b0:6ea:8236:d1fa with SMTP id 00721157ae682-6ea8236d5e2mr102152827b3.4.1730905172756;
        Wed, 06 Nov 2024 06:59:32 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c45c36sm27607457b3.91.2024.11.06.06.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 06:59:31 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e2e3e4f65dso21911337b3.3;
        Wed, 06 Nov 2024 06:59:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUrLSyZPBrC2+GmfPERg7XOBcgNgpBf9XIH5f5mZIsdOhRNrrphWy+Aadkyv25NLG+1D0v93HbxQRKT49s6@vger.kernel.org, AJvYcCVI9+oC2W8fHUQYB6aT/xXvK2OkEadKSVEyHLKS1SFZwa0tgQ3P3o9gbWjUB5EpzbF2k5+KmKSTUD1AVpw=@vger.kernel.org, AJvYcCW6KHi0BNLW09Yt8VwdVKxTGFvtvGjG4Bn6kEg2wQqoyMyV2v8ba1nEYThrUoBter41nLG38HxPC2P4Yg==@vger.kernel.org, AJvYcCWRpZdgsgf+emGhQprUJFxqbMnAiuCHuy9JdEPIQbVibyONTwVPSKe88x3eb8U8GWnObnB12xxBGfZ8@vger.kernel.org, AJvYcCWxGuxQUugUG3Z8MSNB1NFX6A8sy0SokBfR/BnstRcpnh+68gkFnfIQSEiOgfUjshifkLXBYgS2ShK67zjUgm1FiXQ=@vger.kernel.org, AJvYcCXAi/GVJuNyD6A70n/dOqAj+rLfrVs/Jb3tjCl772WX9+n3VYKOBznkryvdDcghTBOEhqYk7smjoUu9@vger.kernel.org
X-Received: by 2002:a05:690c:31a:b0:6ea:6876:5226 with SMTP id
 00721157ae682-6ea68765303mr192089937b3.23.1730905171325; Wed, 06 Nov 2024
 06:59:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com> <20241106081826.1211088-12-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241106081826.1211088-12-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Nov 2024 15:59:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUFY0COLzOSZBSkTwCUQApANbWMYBG5+1TbucPeNk=L0Q@mail.gmail.com>
Message-ID: <CAMuHMdUFY0COLzOSZBSkTwCUQApANbWMYBG5+1TbucPeNk=L0Q@mail.gmail.com>
Subject: Re: [PATCH 11/31] ASoC: sh: rz-ssi: Remove the 2nd argument of rz_ssi_stream_is_play()
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com, 
	broonie@kernel.org, magnus.damm@gmail.com, linus.walleij@linaro.org, 
	support.opensource@diasemi.com, perex@perex.cz, tiwai@suse.com, 
	p.zabel@pengutronix.de, Adam.Thomson.Opensource@diasemi.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Wed, Nov 6, 2024 at 9:19=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev> w=
rote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The 2nd argument of the rz_ssi_stream_is_play() is not used. Remove it.

s/2nd/first/ (also in the one-line summary).

> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

For the actual change:
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

