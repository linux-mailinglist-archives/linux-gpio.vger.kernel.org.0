Return-Path: <linux-gpio+bounces-9438-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2BD965C68
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 11:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09C6B1C229F1
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 09:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3D2216F0E3;
	Fri, 30 Aug 2024 09:12:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA90116F0EF;
	Fri, 30 Aug 2024 09:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725009127; cv=none; b=CWMxcTEWM9fS/Tp+xk5TEinCs3K2ozqlmCkvKSi4Lifk9vla+R2IklDBTzcOR5YnuI6pZuIxztX3niQ5RJ6C3FgtFVcJL5VmBSDZ0HOdpWpUNuTTd613pj/8ikyMxh9nS/uoSbPUxz5VhuhajE8mAGHbXjm20Rg9eHHtV1jGWF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725009127; c=relaxed/simple;
	bh=SL1tJCOx4Kzg4rA4j3RzxOS2+Zr0y6BBy1QlMpvCz5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GlIVPC246Xy1poRVEfQVMH6ur0FBYD+LjhzwT58HtJXHAOcpgsDf+kv9NaRXdq/cMikF0GCfiTdBSfJ24lv4ebcUgfXcc+AUVF2GF7UqOscEDV50rvsVX7v0BTgliuYo8KyGNl1Y7ts7OHRJTu4klf7AmLGvaAWV0RcLTPLi0K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e04196b7603so1603950276.0;
        Fri, 30 Aug 2024 02:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725009123; x=1725613923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eIOH3LpzIVdDeYI/iq40E50sWmAPCzD6l+fBwO+s++I=;
        b=PTTV43HJ+SjcAwHT51fAVcLJE6BqRMdWeuvc7Ws7XhuHKUvbMnHMqQmHirRWqOaRmL
         qQdiXk68JoI9G7KZXTei4j8ZRzOZy3niHjCMCU4nzacJeJahT7DjRjTUfn2q7vIl1t1K
         4/Vr1Y9tuPiUOKQ7IakvA8TB/s3cva+2asWBBx6DqEKfV4P6O1NByAEfS83xb1Vcz5QV
         r6XN5iURmw5xL0rm0vZWj1gO243vCJ7kElq/XinJwkhj3jbTeWxrwn90XKcFgQ6RjjN8
         FxT9yVbeMp2H8ZfhvXxK7z+UVomebsSHe4y5BDPRJASyoS2sz9BUzN/9EFgR7BdUg+SB
         MjeA==
X-Forwarded-Encrypted: i=1; AJvYcCUc4ttesvSfxeTSqwN+qZRQwbZlegkjL/dg6zv92hyQaj3l+aUkqHcpPYe5xcbzg81UDkkVywFzwJi650PNx/k+128=@vger.kernel.org, AJvYcCWGLQ3qFGyL+UIA+kTgfgPaIab/h7GLF1EAR23vy1jXzw4wuapnB3vNSQ76wDkOJflSKz2xXo4PUfFsraJB@vger.kernel.org, AJvYcCXLCfF7Cl9B4GhqL32R5hKVTai8Dw67l4ollt9AOdda2mNniBOMNdW78L3mFDhMWUPvhj4iA90tc+0H@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4kNuvK0sv9u5FWQWOPho1UmUZmB2ybTLBPW3eoetVHT8G/Rum
	lT8bW0yvvnq35P5pGOmAYzwhr53zVoJGfxVmoDOigFPaXMr5i0plKdy60aXA
X-Google-Smtp-Source: AGHT+IFPsEO39TB9UjXvXE3upePIjXddIvdtD9rJj3JQIjXtMuXt8TPPN4kMXlCIlwgZVMRoBHaxiQ==
X-Received: by 2002:a05:6902:1028:b0:e1a:40da:f47f with SMTP id 3f1490d57ef6-e1a7a1a33d6mr2026016276.38.1725009123553;
        Fri, 30 Aug 2024 02:12:03 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1a62682f6bsm542768276.35.2024.08.30.02.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 02:12:03 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6d3c10af2efso7019357b3.0;
        Fri, 30 Aug 2024 02:12:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQ5YGpc9O+26ZuQMDRIJfbw22PK2ITRHlv/feUvG9rTNCt82J8qwKV4rf+96o9lYJvhBC1bO3lbJ9/@vger.kernel.org, AJvYcCVOv6RyWUeYfiqPgxNwQlkaEIRhSp+cQZKDx5hgLPCqaKUJn1QBjQDN/5EHUl3nTeEXINYKoRb4S6HKMc06@vger.kernel.org, AJvYcCVc0qO8rFb3zbOmLJXk++R7CB7mOZ2199xm1KOgaUYKN8wrMkyG1rzNw5IY3SwUiQWMdYqXyyt5B7koOmZzPlE3XfA=@vger.kernel.org
X-Received: by 2002:a05:690c:4e87:b0:6b0:5b97:8d82 with SMTP id
 00721157ae682-6d40e08615bmr10477197b3.18.1725009122767; Fri, 30 Aug 2024
 02:12:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829194841.84398-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240829194841.84398-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240829194841.84398-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Aug 2024 11:11:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW3+ZUhwbX29zE_18mLn6tudKQ74rfcrvcLXzX2aZTC5Q@mail.gmail.com>
Message-ID: <CAMuHMdW3+ZUhwbX29zE_18mLn6tudKQ74rfcrvcLXzX2aZTC5Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: renesas: rzg2l: Introduce single macro
 for digital noise filter configuration
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 9:49=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Support for enabling the digital noise filter, and support for
> configuring the noise filter stages (via the FILNUM register) and the
> sampling interval (via the FILCLKSEL register) are related: a pin
> supports either all or none of them. Hence simplify declaring digital
> noise filter support for a pin by using a single feature flag instead of
> three separate flags.
>
> This patch removes the PIN_CFG_FILNUM and PIN_CFG_FILCLKSEL configuration
> macros and renames PIN_CFG_FILONOFF to PIN_CFG_NF.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2
> - Updated commit description
> - Collated RB tag

Thanks, will queue in renesas-pinctrl for v6.12.

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

