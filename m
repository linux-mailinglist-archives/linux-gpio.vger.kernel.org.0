Return-Path: <linux-gpio+bounces-27271-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6754ABED82A
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Oct 2025 21:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D407819A5CAC
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Oct 2025 19:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF4927E1DC;
	Sat, 18 Oct 2025 19:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AutLg8/Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4BB1F584C
	for <linux-gpio@vger.kernel.org>; Sat, 18 Oct 2025 19:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760814322; cv=none; b=l/ZQCOVYOODrNutKkTgx+vaKvugyYht8rtjmQHB2ZqUhtta3/t/UsisHKHLLf9RcdarQezRGWaoLKXydDOiP9c1+LswQlJAhr4l1XNIh2Tl3V/Ej8AqTJQTpxSJIO70mAetRf5az93YCBpRwxks53YGM7Ei7ZL8/Hexab9MpaGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760814322; c=relaxed/simple;
	bh=GlkRPCPhPzOU9mLCQrN+RQspS//dfiZHnMCrJx2XjUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JEAeJlX/kieTrkUGbzowTg9z6UNAC6SGcTdJFrxsKohO6T6Sd5zBU44M2RPfUJhNUEVv3X3kiCQNlobjttCH6qsBy60GUROipOF80XLWTXH/YKReunNpRg3zttnRgU/FDCvJmtiTozlCgjumo13LCSoU3k14ploj2jaEQ07APII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AutLg8/Y; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-64a6cff75e9so813104eaf.0
        for <linux-gpio@vger.kernel.org>; Sat, 18 Oct 2025 12:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760814320; x=1761419120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npvxteVAfIEKzMeytJ2WmNF7D4AAPzWxw0qzjoJdKTI=;
        b=AutLg8/YD91s2Pa5W48hZ3OrDxy/xKimxKdqmnQ9L9+1JudCP6yV0yTaPsTHLj9Ng6
         ayu5A1t4VTvR2u4O4BNdk4UZQdTgAQm38dyU9qLzekSonv6ChcNGevrmv735Owp1ibgJ
         b3qopqYRQMmPrWfBrDz9c6VcFRTp7gg0RafKw5fx+C6GTJ98hkRuPXE6qL0Nj9ThxvBx
         M55Dr/GnPxZ6AJ/IGHa49FGKcK5TM3g7w7fRQG7jygaIWPB06Omtdh+ZoQfK6TqmfGpc
         X1KelEdVtXe0T6BYZEMayKWX7AYx/89PpMW5VWQhEv2I2GVGBehpXaE2rr4/KaeTKGjB
         ZbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760814320; x=1761419120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=npvxteVAfIEKzMeytJ2WmNF7D4AAPzWxw0qzjoJdKTI=;
        b=mbD6gXaOqwZaWlowaCEd0L8gqKsvVzMcQWVjjOkNPl9F+dg0Q5PTAgapC2wRKf3iI+
         gqph0gqBuiO6Nl6wIX3xNUb/fe9mJuI5iFXrO/dsZVJ7c8V9Q/JSOkHgOn4XezYGGUEE
         sRPggE6bY5hf+mMaZW198XrEFyUu3KhQa1kGwjlCMv5YtYDSWtPbcGQCvy5Si0ojf8eX
         lU3wUAbQnWd5QCT5IwNWukWu3HPeBbwJHym3YwxXXfNMLA2G4QK5kYZGxxMOQgxB8502
         yYYiRy4CeTe7/ru4x6Qeik3zvQ1buhp22eePpaah1tNaSSnxoPQjimVk/xzadf6qqDPo
         Tbgg==
X-Forwarded-Encrypted: i=1; AJvYcCXju6dVbJAZ+NePZstuHecHwXPojYUWM048WBIR4osk8tBRTF0ToJcB64S7gvxzHDMZ4JOHBl0Ul3ey@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6dzidbjBxmQIQbp1Rm2sbWi359R8Ji1Usp/s2Cu4A4XCHsawF
	m5dOt6ZzLS8NwtVlpSdy+/EJ0Hy9CULJmoX6swJniequzlobl2tPWMfmd/UpZQqq3LBUF5RUgBe
	AOkBN/a0m3IpCXGMWo9QlE74LGTeOcEk=
X-Gm-Gg: ASbGnctRFjfc3ZM1xi/eZs+l8n3uhbQGgmzrJ3uW6aOdbj74lDlo3IiJlEeIm4tQLbZ
	uuzIeQCNbPbYSW/QFhKy0DEH3pVCEVPRxZSmPkXIcosgnRCwunmEhSTymg7Sz/RQc1tFC3x14pk
	L/bLNUaedHxAINzosKWP/uQrlgZDDs90OUk9du6LizsMHldS8f5UcgatPdgM+qne6cjeMqfLOBS
	kXAR8j4Km8E7K7mFFqs64SdpCVXESOt3egnhfWd6G6QcCZnplWmh9IYx0jzRPMiv3vmF3zt
X-Google-Smtp-Source: AGHT+IHn6bYHsxvnnBm5dSpuXWjNC+PBXDBTRxFzgYuC3xttEpimkJMntVWJZ0cZXwANZryVuMF0nNeTd369Q5XITzY=
X-Received: by 2002:a05:6871:6907:b0:349:de3c:bfc8 with SMTP id
 586e51a60fabf-3c98d0c7686mr2520732fac.31.1760814319754; Sat, 18 Oct 2025
 12:05:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015232015.846282-1-robh@kernel.org>
In-Reply-To: <20251015232015.846282-1-robh@kernel.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 18 Oct 2025 14:05:08 -0500
X-Gm-Features: AS18NWBGMwSlAmXgBiXSGQWXCd5xrZTGccuKfzZwiw4wGpClNDZImruw46Wm-dA
Message-ID: <CABb+yY2u=XZFdoDrjjYFhARLoaxH4uTnT=GyFmsnV_U1aWn=UQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Fix inconsistent quoting
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Florian Fainelli <f.fainelli@gmail.com>, Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 6:20=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> yamllint has gained a new check which checks for inconsistent quoting
> (mixed " and ' quotes within a file). Fix all the cases yamllint found
> so we can enable the check (once the check is in a release). Use
> whichever quoting is dominate in the file.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../arm/altera/socfpga-clk-manager.yaml       |  4 ++--
>  .../bindings/clock/nvidia,tegra124-car.yaml   |  8 ++++----
>  .../bindings/clock/nvidia,tegra20-car.yaml    |  6 +++---
>  .../devicetree/bindings/gpio/gpio-mxs.yaml    |  9 +++++----
>  .../bindings/gpio/snps,dw-apb-gpio.yaml       |  4 ++--
>  .../bindings/iio/temperature/adi,ltc2983.yaml | 20 +++++++++----------
>  .../mailbox/qcom,apcs-kpss-global.yaml        | 16 +++++++--------
>  .../mailbox/xlnx,zynqmp-ipi-mailbox.yaml      |  2 +-
>  .../bindings/media/fsl,imx6q-vdoa.yaml        |  2 +-
>  .../devicetree/bindings/mfd/aspeed-lpc.yaml   |  4 ++--
>  .../devicetree/bindings/mfd/ti,twl.yaml       |  4 ++--
>  .../bindings/net/ethernet-switch.yaml         |  2 +-
>  .../pci/plda,xpressrich3-axi-common.yaml      |  2 +-
>  .../bindings/phy/motorola,cpcap-usb-phy.yaml  |  4 ++--
>  .../pinctrl/microchip,sparx5-sgpio.yaml       | 12 +++++------
>  .../bindings/pinctrl/qcom,pmic-gpio.yaml      | 10 +++++-----
>  .../bindings/pinctrl/qcom,pmic-mpp.yaml       |  6 +++---
>  .../bindings/pinctrl/renesas,pfc.yaml         |  4 ++--
>  .../bindings/pinctrl/renesas,rza1-ports.yaml  |  2 +-
>  .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  2 +-
>  .../pinctrl/renesas,rzv2m-pinctrl.yaml        |  2 +-
>  .../bindings/power/renesas,sysc-rmobile.yaml  |  4 ++--
>  .../soc/microchip/atmel,at91rm9200-tcb.yaml   |  8 ++++----
>  .../soc/tegra/nvidia,tegra20-pmc.yaml         | 12 +++++------
>  24 files changed, 75 insertions(+), 74 deletions(-)
>
For the mailbox changes
  Acked-by: Jassi Brar <jassisinghbrar@gmail.com>

