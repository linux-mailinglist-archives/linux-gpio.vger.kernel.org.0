Return-Path: <linux-gpio+bounces-26482-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 457DDB91C35
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 16:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 702951902BC5
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 14:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF44E27B326;
	Mon, 22 Sep 2025 14:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HQpnWgms"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D0527CCF3
	for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 14:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758552024; cv=none; b=YKb220WnzBTdFd3it2M7HyQC4YnqgUnSlHSbM3S2A3YVNImfblnP6iuN5ASCMNLgbWukYIjyH2cSPbNCTdY4CF0lXxd5B2VaKqB6UJqRJnGYwioEMkeRMhuRdZarb5i3poynwyO+6bVGVFDCna27daZa8Myze3mQmdOWOZj0IKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758552024; c=relaxed/simple;
	bh=yepCEkqx+tJ9SfMA2OEX+XtK06+n5ZYh63moEPd46x0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=id9CAgkoXk7Zht5tbjaW0L8S4mdDSvSa57putWrZ2nWZ2VMHhi1E38uUZx5QsNEC0aiLstL10JSyA7l6xGN7DmXiVl2v/0QZcfpTx6Fy8+PfIJBF5P+f+wmI7+iKQQr3M7EUxdZjhYNkZ+EoacN4N3kI0sNmw7eIHf+xZ6ZUpZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HQpnWgms; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3637d6e9923so30699711fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 07:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758552021; x=1759156821; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hLBAazs/nxJF8yxwNh5gEJHCO5ze8QeHzK+y6Ysr1Nk=;
        b=HQpnWgms0Ja5FSezEBH0iFDJ8euwgu2ncgsNS8/YeJF8xycl3PLLMxe1/AX9Adi5Ux
         CH+RRN1lnbwYWtvPTaRGV0YkP8wBKGjr95EFIvt8e3esJYkZThPuodOPvGxlOwd94ezV
         JYR4zCKUfu4s+2x/rjNgpo3UpVheYXfpDpeLgDA96Wu4j/eDqfyEVxhoRJ934W3/d7++
         u4Sn94eX5y3aPro7rGzEIhqWSyz9RNUzjzz9267JHiete7HgUx8e/InOJl8swpe4fgQd
         fqZB0Tnd0O5jfcGDWF3wkRflmZXSavNgJJcjrIUg4IumZra74Q5pD/1TpDazikVDH+7H
         5uOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758552021; x=1759156821;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hLBAazs/nxJF8yxwNh5gEJHCO5ze8QeHzK+y6Ysr1Nk=;
        b=RRzaGkLethf0PJZJ5E4J2fV4uD9gH3BK2RQ1ukSRSfMciFnOAwZ4C3gM70AgagPgKa
         /gIGoeB0HOTdB5O1uEqmDw/iLsmSEaPwFvunYiH+CnwnmvUgBukrOAQ+2FuLFTRhlMnL
         5Jwa8ZKwrDh06gxXuhfGDU24wRDum3b2fz5jgSiyg3zVmt/OGVqJOpTQ1zTl5Znlz9eH
         e+d2Gmspg2gle8e+oQ8+0ujI88h53QRoxe2QGWXubfc0V1JdYB2sGrjUG2UdItSudKdK
         JC2ABUFRlvL8eK4Wevw/2RprzWiNUq7SBmkhTKtG18PrjI+dGs0ejMwW3hLr1JjGhyUk
         KB4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWcEtytsd/qplkZfIq2JyDNQRr0yLhqPdTiOqvjjGpgMgR41O1hMZ4tgwS5PyZyPDXTWSf15O/K7eB@vger.kernel.org
X-Gm-Message-State: AOJu0YwOuJ3a6mhRgkT+riBockhRULJ4txr7Aepw5GNSTSD6N5nE6tlj
	ZgtCOg2rfoiEjcHdsQuxwt9yIvkKMWOr7zmcLPZQ4hi2FQuwCHcLjerquSgprACBKVuEaNyNE4H
	eXac8oZM7R5JP5s2+XhujEvNsS11QRkro5+Fdk9wPdA==
X-Gm-Gg: ASbGncuU4BFjjZ50wguO0FGP3VI4IeiQbCGn9iIhpMw+ILMWTyJHK88GlM/xA9TixP6
	5RiG2rpxvjas9XZ3cfgZ5/lSTtY8HXhb5rIIuT4UjFdPK6Biim1WTlWUSCymcEbWyMWXvlXB3Qm
	z4xaPP+TNJecvqus4RLhmPobuTvy5+KJM9sfGDBBUwb8egxba/2VpQEm4ok5x/0bzoQbEvaKApc
	HnyFCQFZ/RqpQwv7SJse8v0/MvLHQj7AgO44Q==
X-Google-Smtp-Source: AGHT+IEtl7gRzMLbqHBpWHIR87hQXX3FGhxljgXueBTPbiKB62hfEksllYkVt1kYIENgJIzsIXJLZZ/2dbBopV9ru0I=
X-Received: by 2002:a05:651c:552:b0:336:72e1:7f45 with SMTP id
 38308e7fff4ca-3641a9e760amr29584451fa.24.1758552020948; Mon, 22 Sep 2025
 07:40:20 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Sep 2025 07:40:18 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Sep 2025 07:40:18 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250922142427.3310221-2-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922142427.3310221-1-ioana.ciornei@nxp.com> <20250922142427.3310221-2-ioana.ciornei@nxp.com>
Date: Mon, 22 Sep 2025 07:40:18 -0700
X-Gm-Features: AS18NWC7aoxTWWKVeKbCbIcNgPLnDms_wQkRSqMIUUGXxxUoQ0T1B-fPxmnWVhY
Message-ID: <CAMRc=MfefZjPrBCLHNUry7JvWUKe7SnuqtkF0_w13d+sRkn9SQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/12] dt-bindings: gpio: add QIXIS FPGA based GPIO controller
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>, Lee Jones <lee@kernel.org>, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Sep 2025 16:24:16 +0200, Ioana Ciornei <ioana.ciornei@nxp.com> said:
> Add a device tree binding for the QIXIS FPGA based GPIO controller.
> Depending on the board, the QIXIS FPGA exposes registers which act as a
> GPIO controller, each with 8 GPIO lines of fixed direction.
>
> Since each QIXIS FPGA layout has its particularities, add a separate
> compatible string for each board/GPIO register combination supported.
>
> Since these GPIO controllers are trivial, make use of the newly added
> trivial-gpio.yaml file instead of creating an entirely new one.
>
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v2:
> - Used the newly added trivial-gpio.yaml file
> - Removed redundant "bindings" from commit title
> - Added only one compatible string for the gpio controllers on
>   LX2160ARDB since both registers have the same layout.
> Changes in v3:
> - none
> Changes in v4:
> - none
> Changes in v5:
> - none
>
>  Documentation/devicetree/bindings/gpio/trivial-gpio.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml b/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
> index c994177de940..3f4bbd57fc52 100644
> --- a/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
> @@ -22,6 +22,8 @@ properties:
>            - cznic,moxtet-gpio
>            - dlg,slg7xl45106
>            - fcs,fxl6408
> +          - fsl,ls1046aqds-fpga-gpio-stat-pres2
> +          - fsl,lx2160ardb-fpga-gpio-sfp
>            - gateworks,pld-gpio
>            - ibm,ppc4xx-gpio
>            - loongson,ls1x-gpio
> --
> 2.25.1
>
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

