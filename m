Return-Path: <linux-gpio+bounces-7163-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 440CE8FCAAF
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 13:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53C821C2350B
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 11:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F9A194A71;
	Wed,  5 Jun 2024 11:41:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5662194A64;
	Wed,  5 Jun 2024 11:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717587708; cv=none; b=N4HRFvFxvgBVO7dwaG2WHvc5XCtwtEaXXLh5beFy9ZuW1SyGePcDwmjXyob1oPh42gp4GoleElHQYOB1+NX+9dlEzp26iw9L3MyiQqSUnu60G6UZdZUZezVHrX9eYhcGS8gGNcqasEeI/ZC970kSf/IjWqrZejDBOVLzURkC4Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717587708; c=relaxed/simple;
	bh=zEbjA5mQs7E8AU4s6oIaI0OIqqfAgw+mFjJG+HRylTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZkuAbx+3vn/dToCzcRcTA0AOcJISDBN9w58qyiyDp1IFsicm6mcxH/aibM3Son3AfISQCzinzNL04GLXgxhR/SsWCm3bxxpnkiA36cGS5q2HLUSNWCcyHxbZ4Fggmmgfo+FTyJwM81ZwWt6T1XG7k3GmXGjOk8WiuF92aNIQmco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-62a08b250a2so23025377b3.3;
        Wed, 05 Jun 2024 04:41:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717587704; x=1718192504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/oUtIFNxSgveJx6lCLtu8yauokqZ9PR7YV0F5ie91Lc=;
        b=BIV+ppdBvWYYAZGKcatfm/auKF32lz/4pBfxs9t77E+BrAJpZzHVkC2WL//1gevjkN
         IeY98zdCV+q5WZ1++lAgZ3uwNuI/BM5WNB2lyVbAWet4jMKe192BedrRLfNyk6XJDntI
         nVq/mURWHe1O8ODqRx6JA1+mOxBwa4yh+F77FpN6hWGBuSH59Pwhq7TeJrOdHPqyeZaf
         idsxq1LV5krRlVt1X2yXZNIXB0ozSGDSkwI92vjSenvccFqAm5HzPG3Cn5+KTkqLiJ8m
         uAw1ut/4pEcisUUKbqwNT9tTPZBx5zWW+LJJshgUJku0hxliPbP/n7IHLwesStPXoF5Z
         7Bqw==
X-Forwarded-Encrypted: i=1; AJvYcCWVtjwjLODpz7JxGjMObaX4NjWc0LgJHmR67R3wKpAx1G4hVEuiyR7Zgc3k18UJb6st9Vp7JRZrH72tln7jlwr7+Y1oUjTIKZPTHCP5lPyaxwtTUSkdFSFLFNzgmcI/rBD/B8GA/vdnmC+R5R+svz+p9LaF1DeC7Z2MNRrmMeLM2Jxbac1y4we1D8dsOefuk/FIVQs6wT0DlMDgbtlB707uZNUOTEPc5w==
X-Gm-Message-State: AOJu0YwYswXMLlbI2wqqnGMzaXGbe0A7XmK9BTGlX/CO4DN1/8vz/edH
	iQn53gONvtRPDOY1Z4h5Yy+n3oepQLKiNQ14nn3NoAe0zyTmaoTr8C90GHV0
X-Google-Smtp-Source: AGHT+IFpycvC68AYrUU5baS4vx8rUmQM2q3JxeMxlJjgTaJyYzV7ALN0tQHMWSNGb+EroviDtFtNuA==
X-Received: by 2002:a81:e20e:0:b0:61b:1c6f:830e with SMTP id 00721157ae682-62cbb5ce7a6mr21734347b3.43.1717587704529;
        Wed, 05 Jun 2024 04:41:44 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62c766afffcsm21823707b3.108.2024.06.05.04.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 04:41:44 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-df771b45e13so2219655276.2;
        Wed, 05 Jun 2024 04:41:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWoDYmsVGzfDZxbGpHb0eRmxCxMYRvReu6Vfvmyi8GDq1T7zvOVp+j2WNejprlvxTtSVZxvILRXZUA/8jomB1OnUIbQ61xE++VglI8LV/Rj38zw7OwzXatFqVFwpp3MfkuPK5tMBtDcDGtQ2pCQD/rdVBgpXk886T9iE7Xo6z7UPvoBR0bMKHVaZowAuUb+1RUV9A5Ch4nBJPbgPsszxpGCKRaCXK1Z9g==
X-Received: by 2002:a05:6902:4ce:b0:dfa:b47b:e9fb with SMTP id
 3f1490d57ef6-dfacaceda90mr2104197276.52.1717587703941; Wed, 05 Jun 2024
 04:41:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240530173857.164073-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240530173857.164073-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Jun 2024 13:41:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU8Anov0Z5=fsXY7DxVDKU8TFc-vRNvx6SYf2ej1X7=9Q@mail.gmail.com>
Message-ID: <CAMuHMdU8Anov0Z5=fsXY7DxVDKU8TFc-vRNvx6SYf2ej1X7=9Q@mail.gmail.com>
Subject: Re: [PATCH v3 03/15] pinctrl: renesas: pinctrl-rzg2l: Allow more bits
 for pin configuration
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

On Thu, May 30, 2024 at 7:41=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The pin configuration bits have been growing for every new SoCs being
> added for the pinctrl-rzg2l driver which would mean updating the macros
> every time for each new configuration. To avoid this allocate additional
> bits for pin configuration by relocating the known fixed bits to the very
> end of the configuration.
>
> Also update the size of 'cfg' to 'u64' to allow more configuration bits i=
n
> the 'struct rzg2l_variable_pin_cfg'.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - Updated size for cfg in struct rzg2l_variable_pin_cfg

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

