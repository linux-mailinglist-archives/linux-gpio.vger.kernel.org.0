Return-Path: <linux-gpio+bounces-6566-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 062AC8CC15E
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 14:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A3101F22B5A
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 12:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D7613D63A;
	Wed, 22 May 2024 12:39:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA65C1E86A;
	Wed, 22 May 2024 12:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716381586; cv=none; b=kBF7zt1QSvCAhme/y6k6ULOEHIY6trYzdVqV9JPSLNl1HUf1FBE9LDApNbATnn9s5zqCiWX9i34r2m9aafGXOIBbBTMx/Xg2hE81xr45cxx14Fq+pGkuUgmp/W1Gu8rDitS1XCjBnnjuI4NRkQuaVIqAPdyizJRTwr74yQV/p3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716381586; c=relaxed/simple;
	bh=aNedcAVnCvJrAapeIogsNjauhIABcjyNM4HfaFnJdpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DwGnrElci4BpU81QIdfxKfyH191dn1lwD5zFVXtzVn9LwSrro8XCIKogdYqiW0K3+VU9WhmYyag2GSotbTSVEG7G9lou9IlKDqdmq+QcIOSNIyEALTadQQa13I+Ib1P37R7pWYf6ck28QoVmf9ERM4sFPr6L4GKSfzijUdn1/mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-df4d5d0b8d0so1346448276.2;
        Wed, 22 May 2024 05:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716381584; x=1716986384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STYz1CCHL1ReBDNZAxtBrSRfOeV1rl9JcCw8eXKJlk0=;
        b=IDD5OoOcfg4WkuYCGNUiywH8VpDDmwyKZvVd7HUyZEN3j92myGTIg9gLPwQDjTDcA9
         gkpPZPEvzQclr4K2s3K/f7QBisREfUiIT9StF2RbFw10uBFgdyNG8FuMc3I6uZ7FpQ1A
         KHDX+gRPJY8/K1sNaUiH5DgfqeOdrpSM4UNHfriORoYXVBnvy9FjLXc8E2pOnhI3tPNm
         xDuZ01qPFO3Bc2pl7RxWLIuqv1GaOHBAuuHz8uR2v/ZpObGNlOkPsugj013+YQ44Ure7
         35O8zvsLPh7hkY3/IfyXDohYFS3zyZE3jVwuB9vFdSZi9GySL25jGua2tQpypKxWekJI
         H5lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV4tBBjALisMB93LHuu+yfyqRMwEftA5MRLr2cD5vWGlWPxW6U70mK2a49wFGxPt65BPx8/cvzyTH/DPE4AZo9+EEH9+4YqRz8UiKfAw5hC416quHcDg5egG/peWn2YMKBCP4GKGCnUb2ES7a/7oDlmpbtq+xZxrBpBil+LbZaGVph7UTC+VxQJcBRYuRdUteZ33wIdgE6wkK4D5DCzpBnuy4Wch9nMA==
X-Gm-Message-State: AOJu0Yw5SoVlgj9/Pw6FQubBdnoENJhgvlidLa4Nsy7EwmUsNYfRebKl
	JoA2wYBcQ1JqqYbOu0oCDOxDU9EOQX8gAL8FbFSAJffVrP1jinltuNh7K6Wx
X-Google-Smtp-Source: AGHT+IHzH8Ek3jgip/zOfXMzLZeMsnpnr8rirplvnPliKVOoUVMbmCxtt17VRYoKRYU3nJHcPjGBOg==
X-Received: by 2002:a25:ac66:0:b0:de8:8cd9:c44a with SMTP id 3f1490d57ef6-df4e0a76ac3mr2108284276.5.1716381583714;
        Wed, 22 May 2024 05:39:43 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-df4ec644d91sm61091276.44.2024.05.22.05.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 05:39:43 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6181d032bf9so8554827b3.3;
        Wed, 22 May 2024 05:39:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXbSF542F2s+3B3M1P0tgY8Ej8iuWPAh4KXGhCoikoLpbFuq2XejrvKQQplBekDJuGjYkKVwbqrr6X0Cq9TjBG7drkHhws3bk6Ew/zAwmKVkMmqdv+geqXMIkpGvyBcvlkUeUwlqq3Vt83w3ueeZiaGAE4UG6qIaO1/0XZB7mTBCzBdWqCW9ru7+w012ouM0/H0Dw0VHd5v74okVv3c6YeA/9nhdNVHhw==
X-Received: by 2002:a05:690c:fce:b0:61a:fe34:18b6 with SMTP id
 00721157ae682-627e46dd10dmr22299147b3.21.1716381582320; Wed, 22 May 2024
 05:39:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423175900.702640-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240423175900.702640-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240423175900.702640-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 May 2024 14:39:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWh5dD_dT6+SvxycgfX6OHw0m4Lu+QoRE33HgG_-AyYaQ@mail.gmail.com>
Message-ID: <CAMuHMdWh5dD_dT6+SvxycgfX6OHw0m4Lu+QoRE33HgG_-AyYaQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] pinctrl: renesas: pinctrl-rzg2l: Add function
 pointer for writing to PMC register
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Tue, Apr 23, 2024 at 7:59=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> This patch introduces a function pointer, pmc_writeb(), in the
> struct rzg2l_pinctrl_data to facilitate writing to the PMC register. On
> the RZ/V2H(P) SoC, unlocking the PWPR.REGWE_A bit before writing to PMC
> registers is required, whereas this is not the case for the existing
> RZ/G2L family. This addition enables the reuse of existing code for
> RZ/V2H(P). Additionally, this patch populates this function pointer with
> appropriate data for existing SoCs.
>
> Note that this functionality is only handled in rzg2l_gpio_request(), as
> PMC unlock/lock during PFC setup will be taken care of in the
> pwpr_pfc_unlock/pwpr_pfc_lock.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> RFC->v2
> - No change

Thanks for the update!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -463,6 +464,11 @@ static const struct rzg2l_variable_pin_cfg r9a07g043=
f_variable_pin_cfg[] =3D {
>  };
>  #endif
>
> +static void rzg2l_pmc_writeb(struct rzg2l_pinctrl *pctrl, u8 val, void _=
_iomem *addr)

Please pass the register offset instead of the virtual register address.
You do have pctrl->base here, and rzv2h_pmc_writeb() will need to use
pctrl->base for all other register writes anyway.

> +{
> +       writeb(val, addr);
> +}

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

