Return-Path: <linux-gpio+bounces-6407-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2376D8C725E
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2024 10:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9E111F2261F
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2024 08:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 971E96BB4E;
	Thu, 16 May 2024 08:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+kNbRQn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5584EB30;
	Thu, 16 May 2024 08:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715846585; cv=none; b=upFwa5oqH+7k/bX2erGquoYx3+DWTrjkjJgnsRPVb+n8PtnRD9IKfJiHjbkfJG9lmhBzudiL91QNxNe/E+mCTca3W1O2FpWLMVJIZuBd3go3L0xstHdchNP6Um73MZg6DRGM7QMZWzWtzV5foH9LD6ehh6CF2HsDhwNLB+bd5ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715846585; c=relaxed/simple;
	bh=5HE3VuQjHHXUOEE4YFWAvTD0H1sgsk7BGUNdV6sOGOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=trw+hNLr2FZysSAvHSuT2C8Gm49VniiJ+Ap8K9tYQwRbxYAwKWlu+5S+Q7/WUDHjK7+ahesDWo40rp1ibGwUjSNg/NlUlvzVQFMOu2fDosvE6Y7N+cTgNwifHZWiXimlXXFJgxeTc4V+llbhgIl94k+hjpET1Q+uN0+BGnE1Ngw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+kNbRQn; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-7fbbb2cf3c1so1196845241.3;
        Thu, 16 May 2024 01:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715846583; x=1716451383; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fl0nj/kLrslUm9shiSkyG/Y7CY/aAcnLARdZY81Sgbk=;
        b=j+kNbRQn5iymX73FVekrMtiTXiLFbcKGcrnKuLEbUWYxt1tRfqS1NKJq+MjfUAwGtx
         PeGzp30ZnvuXy/RMhH3sEw7jP32/V01d4lRvohnGrBJr9ICWBjB3fDiIu0u0XKDZWyei
         SbTbk2uImlEaAXJ7EkAVKUez74uxRlSDPYb6qeW6p1GrBHIvxutKNRAmCmCRv3T7M7Jl
         p7fzznEMV05vwMrHcpw/LOYmOjIhJDy8/WFT87bwBd0VaB+6GaMTCTCMmNXTHcpYC3mS
         rc/i+Jw+LsEDT6rVtqN/UPPdvM0JkGgD5oXVwBhWRtV+HcGljkAGOp4Zp2vRYtLzCH4K
         fknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715846583; x=1716451383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fl0nj/kLrslUm9shiSkyG/Y7CY/aAcnLARdZY81Sgbk=;
        b=SjiIDmS6+bgO86DxaQZwFyfCkgn0d01yGfDaggnH52vaDvbT1Rekh1kbDURBKXl15z
         ABQwZmSyNtYw6LEnLptDSZo4Bg7n6p0Mh0kDvsXGArXfwTBladUMWwJFKrOpPsFJkAlm
         7k3l29o5SChPIwhYYH3GzUgxjdxu7rbAN7X1Spu7FJUscs7NvgT5FFYqcWPRkuMyy/wW
         mIDD4YrneHTcQ+4jj35Gdf4R2UlBWkzRsACkZgHkztS/XnSavOZNmdQAK0tYqWCUmI2c
         Ve6Ih+4YK659iLUZr3Z9eyFj2mYOJdw6/UMdAtwdrgqQ8Kq9AYshvZKMjiwIenQrEyE3
         9haw==
X-Forwarded-Encrypted: i=1; AJvYcCWiFfJO0GraIj8CNK13YAILSomlGzc5WGlJTvZTYz11iDNrLN6TYxxyLC91XmQzF36j0CivSyzXAkXPZOmwLW2cuQWXupOWf1SSk4wziltXc2bwQLM1HkAUaKMeA0mnsxHKDlzFWE6MQdt4VrYd0rdn4U3LQp+BkE80JmbBn9pz0rokNmk=
X-Gm-Message-State: AOJu0Yy+zndMGE/XzSaYogrd9u2QIYSP4YYhvZJvhlxlf+7PAtHfPwcC
	7WFMVqZkWhOyM4IX21oBrDZKcNdQoxeJyt+qWDPaO2boA8nYTr02WNoTVaAuPYkI6IQn87hJy0l
	LXud4hkEPPCjN+C1PbW2WxuujBVk=
X-Google-Smtp-Source: AGHT+IEGmuIZ94m60TpcHFKQ9zhWmQGKsauGUlJNHGP37sp7Ssf2UU/Ll/3JZVxKgrv+EFCNMM8uiab2zcK65YD2nbo=
X-Received: by 2002:a05:6122:368d:b0:4df:2ce2:6e4 with SMTP id
 71dfb90a1353d-4df882c1c5amr15980200e0c.4.1715846582738; Thu, 16 May 2024
 01:03:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423175900.702640-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240423175900.702640-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 16 May 2024 09:02:35 +0100
Message-ID: <CA+V-a8vN5YHX3NFJNmqxzQt6HB=xC1Srr12ZvzEWHhKe85YWSg@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] Add PFC support for Renesas RZ/V2H(P) SoC
To: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 6:59=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Hi All,
>
> This patch series aims to add PFC (Pin Function Controller) support for
> Renesas RZ/V2H(P) SoC. The PFC block on RZ/V2H(P) is almost similar to
> one found on the RZ/G2L family with couple of differences. To able to
> re-use the use the existing driver for RZ/V2H(P) SoC function pointers
> are introduced based on the SoC changes.
>
>
> RFC->v2
> - Fixed review comments pointed by Rob
> - Incorporated changes suggested by Claudiu
> - Fixed build error reported for m68K
> - Dropped IOLH groups as we will be passing register values
> - Fixed configs for dedicated pins
> - Added support for slew-rate and bias settings
> - Added support for OEN
>
> RFC: https://patchwork.kernel.org/project/linux-renesas-soc/cover/2024032=
6222844.1422948-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (13):
>   dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Remove the check from the
>     object
>   dt-bindings: pinctrl: renesas: Document RZ/V2H(P) SoC
>   pinctrl: renesas: pinctrl-rzg2l: Allow more bits for pin configuration
>   pinctrl: renesas: pinctrl-rzg2l: Allow parsing of variable
>     configuration for all architectures
>   pinctrl: renesas: pinctrl-rzg2l: Validate power registers for SD and
>     ETH
>   pinctrl: renesas: pinctrl-rzg2l: Add function pointers for
>     locking/unlocking the PFC register
>   pinctrl: renesas: pinctrl-rzg2l: Add function pointer for writing to
>     PMC register
>   pinctrl: renesas: pinctrl-rzg2l: Add function pointers for
>     reading/writing OEN register
>   pinctrl: renesas: pinctrl-rzg2l: Add support to configure the
>     slew-rate
>   pinctrl: renesas: pinctrl-rzg2l: Add support to set pulling up/down
>     the pins
>   pinctrl: renesas: pinctrl-rzg2l: Pass pincontrol device pointer to
>     pinconf_generic_parse_dt_config()
>   pinctrl: renesas: pinctrl-rzg2l: Add support for custom parameters
>   pinctrl: renesas: pinctrl-rzg2l: Add support for RZ/V2H SoC
>
Gentle ping.

Cheers,
Prabhakar

>  .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  40 +-
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 640 ++++++++++++++++--
>  2 files changed, 617 insertions(+), 63 deletions(-)
>
> --
> 2.34.1
>

