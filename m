Return-Path: <linux-gpio+bounces-18658-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9133FA84026
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 12:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF5539E1E00
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 10:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F07627C871;
	Thu, 10 Apr 2025 10:01:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A344827C850;
	Thu, 10 Apr 2025 10:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279306; cv=none; b=Ps3jTr5dB28eUwdJkdX7son8mSvavpJAnHWa5Drbnx3iC5pYMKRVPZxZ1IrVLJG6XzfAdTzc2cZVi9HNELFE9XUdxcwE9+7S2EZLgZgRJq+6z6sOPYoLkaSZsyWuWlXWzip20PSyYCtN6rsJYCRQnootEbflgPebvY3Jkv10P3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279306; c=relaxed/simple;
	bh=9b78sYMlgKV8xbhGsnnU6NEj0KRXsexk+EnRgrPV9zo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZmkpxOIxKWyFDEc8qKKD6WamPfHD927kELy485Z+rbSU/OUoy+rlPYSZG+BDRx30QtJtqyyVT5mwz3JvwCosnjV1ethaQcNkMn2P1iG6FDnml5Gem/rLMU0S7n739+d51fXsB0aPFvmMWwf1svS21z4ovSrCgd0mpMWcEZum7DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5f0c8448f99so1273884a12.1;
        Thu, 10 Apr 2025 03:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744279302; x=1744884102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3F2NKJ9dNLSl3ARkhxIkJK0rOGADequNLd0IXRv1ebs=;
        b=XDk4WxN0Mx/M+BRmPQUkBRL5qry2AYccEa1FRETBKOrf5s5Dp3S06P1QDvp5eplpMn
         OEGOFLJv36UHSB7jx1eZXHinrPtocdkKIni9Eb2nn1tWeoX7MBpIJUpbDmU8g0XfPjuW
         Ngtacz+GpIdJPjKijY/+4XhuUpIYA5BxXxpKK1yVQ3K20PPXeT3kRipu3LHljzBtMoui
         fX+UmSBafiOsTFIitHwCmzQ+ZgVbZCBDsTnqIgQOLBeQjYLHL0BJNODxlBJCJZIhGcBP
         Fj7hwHKvKccnAYvx/o/4eBAO4Wy+mzoqgIjaVC4mxMsu84c9uwlbANBPa99raIcLenFQ
         /ymA==
X-Forwarded-Encrypted: i=1; AJvYcCVB9JgUrUKn1eOZcGh+DKIOhZtMaey+7+Dx0HRpd97wDlMLtWHmBCEIW9bh6DCkbFUOOc/flYA5HsdgFODu@vger.kernel.org, AJvYcCVBxMV/IIuyJbsd1+eyguA1lPSpjLltLjHVhWZs8lRY1PDQ5a6DSak6AvZ0c1/ozVSLcSAsQwDaD5GMl5Iz@vger.kernel.org, AJvYcCVgmJEH7j4/TAu9Rz6JG4VRgFVdu6dw4N8dY1pl23e62tGWFgNtki6ESSAbH1vznJjQuoM+XmUe1pejcg==@vger.kernel.org, AJvYcCW/xPyQJB6HrVsBhZwt0nKHbPUrkJR6PkacnpmqpWgJnLCIoq29e5Ydz0s0HBmIwfHbwJGX6UuxC6/b@vger.kernel.org, AJvYcCXW82NCKlqUo0pKSvDFq9kzSF8gGNKiY0dpA6EbPn01LLumxxT6IcxaIEMS5989FzMaN6Q7mXvMejeP1Yex9kT4FrM=@vger.kernel.org, AJvYcCXc/Luu+NMR2/jD2qsBaaEtA8QPEReuLUXDOCYKZPP36XuYykbD+qdDOoA8ozVYLu3YcG++5n5Uz2/0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Fya05jVZxNQHvoMiqxa0wvz6Zzz1OWSHJVBm+WoVFrbSAhvH
	ppczHXTdXdrOGix4s9hgBeFGqgigJamijmSCRVGEmGrj1q5UfX74Etk11Kdo1Oo=
X-Gm-Gg: ASbGncuQLdf5D6zme7m0drbMsCApWBdvg4m0x+jXhBVnhZi/Im1JbNe1eQ8jlV6XFDn
	ORiIQvExRJCvzi/3rexvMJ03kpKOveYRhCVheCN+f1Jg+1Mzg4K9KTHO5H8caB/tUcNFoHNCxmS
	5PJKiTy85Q9oip7IDlg/E7xiJcQaItO2j55tIrJc865iXRnzCYjL1nkkdv9Z2liAgHGdI+MM5mg
	w6u8d/hjRB2mt5MwgsKeDBzY0XMrivljrSbXcWfGPkc9Ejkm4yqD9lcvcIlxd0YdfZhR+Fw2GHN
	VkNH2e1kyl/pAZ0ujRp4ojieRuZpv58oVC1BuP4j/+SBPm6+0rF0u8tE09sgYtENLjIMog3j4ma
	Ndzw=
X-Google-Smtp-Source: AGHT+IEFrTLNQPfXz1mp8f92xYtXrhIRRdb7ZcNLyKRlx2dfbTxo8MRLNtb6jNbIjIjkmXRlsSFgPw==
X-Received: by 2002:a17:906:f585:b0:ac3:9587:f2ac with SMTP id a640c23a62f3a-acabd24cb50mr191576566b.33.1744279301862;
        Thu, 10 Apr 2025 03:01:41 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb3513sm247952966b.11.2025.04.10.03.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 03:01:38 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so1034688a12.2;
        Thu, 10 Apr 2025 03:01:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7mXlDrvRwvyguq0Kk1L8BtiqRpjWLIpd0yV87IuXrxOId1vneyr9IZpNizqN9K/FFg5sOvwnQetka@vger.kernel.org, AJvYcCUEKJIUTfQVW9E/J948HtHeh12sTUc1QAc92rDE4HVMKhHm1SLbVOI/Ti5yAoKDNxQ5c5/WqztLHfYmASjR@vger.kernel.org, AJvYcCUXqdIwdtccZvjpxWGyBdEKuMq1TWbXflCeYJ1lUmw/t1MVnHuS5Gcusr4jvYyhivfnTnh7NuVyYGl8@vger.kernel.org, AJvYcCX3JR4QhTBdydenr3//sbADmFcILTDBkW77wt+OXf2F6dL6fCGE0i+hzEVbr538Ks3ptVhqeJa4D1rurJRFTD3m9fg=@vger.kernel.org, AJvYcCXjLZI35mgOkp8GWeHWUZhRRDVDJnQlx56nEzN9h7tpTklYV5VlXL9PFW9S4A+o4CtZk98TdW+rRk+2BHXu@vger.kernel.org, AJvYcCXjrZm+cDJL0in2mHh1dgn3qsUzuC9dJnIOvPbrsTTSnTYBSR9YSmIoB/Yuci21XVsokHPMB0kVQL6sOQ==@vger.kernel.org
X-Received: by 2002:a17:907:9692:b0:ac7:ecea:8472 with SMTP id
 a640c23a62f3a-acabd206311mr163848966b.26.1744279297800; Thu, 10 Apr 2025
 03:01:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250407191628.323613-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250407191628.323613-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 12:01:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXTDMZvVieaTsuPYKjVaK5tFnT_5Pcx7zeRQ6j5vW=C2g@mail.gmail.com>
X-Gm-Features: ATxdqUFnFS8ru0MA_-DyWlGEfk_lZ9qfaotati6OchDHxwVypNec4oWk2u6TNGc
Message-ID: <CAMuHMdXTDMZvVieaTsuPYKjVaK5tFnT_5Pcx7zeRQ6j5vW=C2g@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] dt-bindings: pinctrl: renesas: Document RZ/V2N SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 21:16, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add documentation for the pin controller found on the Renesas RZ/V2N
> (R9A09G056) SoC. The RZ/V2N PFC differs slightly from the RZ/G2L family
> and is almost identical to the RZ/V2H(P) SoC, except that the RZ/V2H(P) SoC
> has an additional dedicated pin.
>
> To account for this, a SoC-specific compatible string,
> 'renesas,r9a09g056-pinctrl', is introduced for the RZ/V2N SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Dropped `renesas,r9a09g056-pinctrl.h` header file.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

