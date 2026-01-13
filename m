Return-Path: <linux-gpio+bounces-30502-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0A4D1A34F
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 17:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F3BA300F8AE
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 16:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C882E2852;
	Tue, 13 Jan 2026 16:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bDEm4Xwg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DB22609E3
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 16:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768321242; cv=none; b=BFHTJpbdJKg2c1qtI96yZ45Qq0JzUy8IngPEi6t6FwpnjYXFvNp/JB+Wpn/tQlA/6CMdYhd7YQIyC9qnhMdJePCWvB00Jqncu7U9dHemPyhS1ncZqC/6IOzYxlHASLfJ9UvXYs3L3GtfK4e7jsLtGVcnnuzvLrtI9hMdJZ+q/QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768321242; c=relaxed/simple;
	bh=QE50A6N74JiT1YTdsEYJNTdYhGay3rlU8StFdylcxes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y7FSVfPrauXeikSmJNHB5SLxEjzB0WteyCaw45tbUyrJ6Bb2DvtuUJaI57rE0Qz7kz+E7khGyOc6wg2HMcjRHUFhVpi8H0yLfrvHNDD3rRcs91HVVeSHbdhYqb/ZTtSSQ6mM2qW8Qd/ng2+i2/pDpbUthKWnH/Fnn9Ska5ae7nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bDEm4Xwg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1BC3C19425
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 16:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768321241;
	bh=QE50A6N74JiT1YTdsEYJNTdYhGay3rlU8StFdylcxes=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bDEm4XwgpNAZmzD+VUgCx043Vg/3mH1mvI6DKH3Ik5iLztiG5FW5Hw5VdTlMrIjLr
	 oV8ZiScEUQVVxZLhbv+QcXs0+dp68CAra0slXzwdx2M0Ho1ixkAnk0Agz6hvH/0U66
	 LAFjCEqQpGVvyNgnKKwGXmieEJ8WnBGzhFLRz6dPrUKqI3rksPhG0v1rn5QslkYup7
	 V37F6IYjCeDeh37ZGSx0pVVKza1UnQfZI7vc5PU9NahPfCyJEGrsmglwx2Tm8AL5NK
	 bN+IwpFtDqsv6+AJKv8ii75GdspIR90fBou1YKDldwaHrv70wMwvv/+rTm6my2xvNN
	 cCnCTkqSWkp+g==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-382fceabddfso54987191fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 08:20:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVkGXgee1/CsPsIwtcujypf18pd70zdVbuGeW4sVdj0Dvz4dI1rJ0/8m9NvBuxKasyOg21JFj0GCUDf@vger.kernel.org
X-Gm-Message-State: AOJu0YwlUz5enyG6HGuHOtDf8/b9VQykRWKCxEKK9jWetL1folw1q6rJ
	47FBR1pXcvHmei1ce+nDqJbg0Qw/Z0kIb6xgtDZlp2enU7BjWme24yOfARCZ6qE5WgHPikCGTds
	frg4Ha9nuFVlm6Ckn/iIZlM34zwTKY+PWHz2ijTzYig==
X-Google-Smtp-Source: AGHT+IFKOWqwjZbxcFJ4zB9bqD7BCgyM4TegNTQdFs3Tw6rY/WlDFX8QLM4J11ke3ozfEdCS1YUM1V8Fvr0IJF85XXw=
X-Received: by 2002:a05:651c:211b:b0:383:1b75:b9bf with SMTP id
 38308e7fff4ca-3831b75c2a5mr47283781fa.28.1768321240439; Tue, 13 Jan 2026
 08:20:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113161152.3688309-1-shorne@gmail.com> <20260113161152.3688309-2-shorne@gmail.com>
In-Reply-To: <20260113161152.3688309-2-shorne@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 13 Jan 2026 17:20:28 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfLqoPvCiEtunvfidaRGAfZFbGM98y8vjj8R187ziUtdg@mail.gmail.com>
X-Gm-Features: AZwV_QiWKv7qTHI37EWrS4Ims9IVvV6gH-K3n0gK_u90s8jQ4e7D9NtXWn5GUNY
Message-ID: <CAMRc=MfLqoPvCiEtunvfidaRGAfZFbGM98y8vjj8R187ziUtdg@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: gpio-mmio: Add opencores GPIO
To: Stafford Horne <shorne@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux OpenRISC <linux-openrisc@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 5:15=E2=80=AFPM Stafford Horne <shorne@gmail.com> w=
rote:
>
> Add a device tree binding for the opencores GPIO controller.
>
> On FPGA Development boards with GPIOs the OpenRISC architecture uses the
> opencores gpio verilog rtl which is compatible with the MMIO GPIO driver.
>
> Link: https://opencores.org/projects/gpio
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Since v3:
>  - Removed example.
>  - Re-order this patch to be before adding compatible string to driver as=
 per
>    device tree binding patch rules.
>  - Add Reviewed-by's.
> Since v2:
>  - Fixup (replace) patch to simply add opencores,gpio and add an example.
>    (It was incorrect to specifying opencores,gpio with brcm,bcm6345-gpio
>     as opencores,gpio is not the same hardware, its 8-bit vs 32-bit)
> Since v1:
>  - Fix schema to actually match the example.
>
>  Documentation/devicetree/bindings/gpio/gpio-mmio.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml b/Docu=
mentation/devicetree/bindings/gpio/gpio-mmio.yaml
> index ee5d5d25ae82..a8823ca65e78 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> @@ -23,6 +23,7 @@ properties:
>        - ni,169445-nand-gpio
>        - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO con=
troller
>        - intel,ixp4xx-expansion-bus-mmio-gpio
> +      - opencores,gpio
>
>    big-endian: true
>
> --
> 2.51.0
>

This is not a follow-up patch. Please rebase your fix on top of
linux-next. I already have the previous patch in my tree and will not
be rebasing the entire for-next branch.

Bartosz

