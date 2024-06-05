Return-Path: <linux-gpio+bounces-7173-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A7C8FCED9
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 15:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6388B25130
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 13:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F32919924E;
	Wed,  5 Jun 2024 12:39:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD840192B98;
	Wed,  5 Jun 2024 12:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717591163; cv=none; b=FXXLmCQctBXIsgKfvy6MAaKCx7xXQ7zVpQtkveC5yQ+ODhZmlDzTw7+jzMW7eaIC81NNCx1kXVf1NY4lSBHJlOs9Uu/M5uid8ihYKDKOw8R3UYX4UULGM5PDhNZY/KsFFoq25IAKhU1hJ59wiUrAkLmbGDJ2/QtE6y2hVC86/hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717591163; c=relaxed/simple;
	bh=fECiDaMb4F1kMdlJ53fEzmA/KWwVjlDq+a1cu8tfqZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fho8fxBzYk93/k1Jsj5n7tNgdDIS3ruZLt7I7zZ6Vfnj4siBIhLDWyOoTKa3zBrDuQo/SBENxjEkEwV50nLpy7GE0vGfy3Vgz2NPnybCkrdIcKd3Kt6qVzL0DUBSu0FUC74WmNptG9MX/MbuNuSU6tsyWvQhH4dwj6+0HntTEdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-62a145e0bb2so66578657b3.0;
        Wed, 05 Jun 2024 05:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717591160; x=1718195960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4h29fdB+cnJRLBhs8OVkcXiYefk6YXDuyr3Sq5hSqc=;
        b=iF27VcF7FTzWeB/RFf1MeiIP6PohIc8pWZ8M4zjvmH7s7CqrpjRTq3jpQekKa+8XWc
         AHQ1+kxuuFE6KRRq3FA91xSPvSohkIQiY4uUG91Pql8iE+Pk3TodhN7+2vqYERGYoW4a
         sSRlnnLiE+iCn0k7k52VuTITiS1XsnYYDzsbLqcKDAt/qhVVSAZZdXKExx74KrdimqFQ
         k6MTzhZjnApzzkzSiQvBOYxyHEJq8lKvTQ6Q47UkQmTQrNTBAVXwNPNvcxd1SXnt8kA3
         ci4xOsXYI/V6SezS19oJcURr1IlRYLVaCEsf0QcBao5c5NvcMR9zWhyNB5GTQSLrCJ/J
         o4/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPDcsLaRJnIw7WSqB9UyUrf/kqPu9GNsyR0S/qbbqx3YBLgCC2eO897Xea/lPIRqjvonM3Cz8uqFVuG1nB+dRepxQBFFQEP+S0L1FAcUgPS1Jff+PngGfoJwueBQeKhpe9InsZ0OwQOxEGfSjaxg6inY19qh1UPbVnDk/mrI8kXJfXydMTV7WbBiuC+LmCwGHI7ZI/wwIOIEAqiZJPJOfMD2EdiyIgaw==
X-Gm-Message-State: AOJu0YyBcAC39fzkvhkoCH9M09uf19AxhScT2tMRoLMJRBXF8ktoicHK
	wltqdFj5a8mRGmtJENhLD4+1jUub9rkOFHeq3Rq4zt1HdCdZfDpgLwAP9Z1m
X-Google-Smtp-Source: AGHT+IGRGEmazPxZajP7SNGEMm4USOakuizHfYTBsD0XeiL8mFCI4UYH0L9bHZ67vQl1O/ISKYwzqg==
X-Received: by 2002:a81:c604:0:b0:615:10f8:124a with SMTP id 00721157ae682-62cbb510b16mr21269527b3.29.1717591159670;
        Wed, 05 Jun 2024 05:39:19 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62c765b8c28sm22024947b3.28.2024.06.05.05.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 05:39:19 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dfa5b9274feso7351607276.2;
        Wed, 05 Jun 2024 05:39:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVEIs2CIIMKPpKf2qhjYiURPDkPPtcyo7To1uEITvOETkuMcFdJmXW/JuDhIZ0f+3FRKJChTEjP3Aug0sP6jlZItPlx0wpibK1uCHdi9pA8jV3fQ86avo7h3vrv4k1uQnH7vuX/HBOvk/VFcSRK3AXqW/ICq/12zDPn/lS+1YmU+Hdab1Sf77TZtQi0zf7TpLPTQ5swa7DKd2ZLv+EQAUfRcgsVCPU8Xw==
X-Received: by 2002:a25:d8c3:0:b0:dfa:5a2f:9e56 with SMTP id
 3f1490d57ef6-dfacab2efefmr2435803276.6.1717591159339; Wed, 05 Jun 2024
 05:39:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240530173857.164073-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240530173857.164073-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Jun 2024 14:39:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXbDiP6g5CvHj+LJqcP+1yMzWADz0eZ50-jZbNqogiXxw@mail.gmail.com>
Message-ID: <CAMuHMdXbDiP6g5CvHj+LJqcP+1yMzWADz0eZ50-jZbNqogiXxw@mail.gmail.com>
Subject: Re: [PATCH v3 15/15] pinctrl: renesas: pinctrl-rzg2l: Add support for
 RZ/V2H SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Paul Barker <paul.barker.ct@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 7:42=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add pinctrl driver support for RZ/V2H(P) SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - Renamed PIN_CFG_OPEN_DRAIN->PIN_CFG_NOD
> - Renamed PIN_CFG_SCHMIT_CTRL->PIN_CFG_SMT
> - Introduced PWPR_REGWE_A instead of using PWPR_PFCWE
> - Dropped using pwpr_lock
> - Optimized rzv2h_pin_to_oen_bit()

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

