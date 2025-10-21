Return-Path: <linux-gpio+bounces-27373-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D03CBF67BF
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 14:41:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CBD734EE571
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 12:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE4932ED45;
	Tue, 21 Oct 2025 12:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IXuFI9KG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBC432E741
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 12:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761050463; cv=none; b=N9v53v1bG8YvgpzkPgdfg9H146vKDhzDd7ay5o1KIIol6fv4vlMHEpuxDVAxHaptMipUf+xdGDeVEA0BnC6Apj4nFk1xonOYPtVFbhRn6U401UEmTajVBozhkf+X+tCYBZtlP/QGMkf9EsUcs1nqDpPVkRtEAW9Z0con9JlrrcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761050463; c=relaxed/simple;
	bh=yuVQZTDGjvvcPalMUgTg4epkdUaGdD4g6/GxObBxEI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YAIgK9+17jF2pN1RqtMrTsixrCbw7DczcT4YANzpoDt+SqghEopnkfkmd2gYA6v39rvODuVVDGwBmQcsgJ+29prBbCCW+3QXNuG5q5RsF3zHDrFB/v8Cdd4N7FCxAMBCj9/JajaepGM5dSHRFL3PbPIqS5ZPUN7EJT/bAfQjaQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IXuFI9KG; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-57edfeaa05aso6341735e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 05:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761050459; x=1761655259; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWb3L2HC5GL7gJV88qPeFIZPSp/OKkdc2F2PK/9kqwo=;
        b=IXuFI9KG4A3E4U5Fibyo6SAZNeh861N5dZ2edgvOUXsjhDgufvCVHz/9zsQZEjK3BW
         MjdzfFJgfVaycKMJmwOmMDVjWwXkD7nlGV67Jf8zvmtPIwiJnQ2Hi16/68lWT3XbNX0q
         7UCzdCkaXSC/d6+2uyK1aPWErerdzs6Igm9Tb1vs/sYCNuAVd6bEm8yBMPW3HV7o+6lR
         oKyQWdMb9O1alofphP99ZmDTFd+Qzv6AnI2dCfLRhj8HNObmEMBPQTn+FgswF+1mdw56
         trf8UoHLlB9JpJl1xWI4L0iPsJJXVTFXUuRVtCxZ3EA8ysrGASRUvQ/StiZWJHbSyx4X
         GBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761050459; x=1761655259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWb3L2HC5GL7gJV88qPeFIZPSp/OKkdc2F2PK/9kqwo=;
        b=fmb+J46UO6ji7jgV+3oEa+fSGGwnR8AZN5QB5bnUuHsdlLPUBBDo9H8AI0D3v9eMMG
         oTfjHIqb0yGlS1W13OOCODLMBOwAPM/5MI+uP3e57qrU/v1xDRlfBBQv49mEA7141aDE
         qskmBqeSp4sjxlA19f+syINWf8xtZyD8al1yDqJjX9ojbWa7cvt9X4y7FsZzIcQe1bjU
         aVBGZ4Hlu6WtJGfAvou4M009haoYk6OC/KMPZHeDsA56hU4v69RZfbCdbragf+nJINp3
         0zmbeZvLy1P3T0WHJA4OlVne9JXu52syNn46p2GwMjaTqxJkuwvmqvLM7j15oDozqqYR
         biGw==
X-Forwarded-Encrypted: i=1; AJvYcCXEq8WVxpp5ZbOdFaYcP2p80w+UPzmQCVcHpTa964XCYVVlfg90Ipxo0SUxy3IegCEF3jfLrl1ve+UF@vger.kernel.org
X-Gm-Message-State: AOJu0YziZ9EE/8r3ni4u48NII9vW0gWfunv8x/9P9d5hakY0Za/PCC94
	TQAVJy3iobjEuDBIP+Cl/JBHyD4yctCrr9YK28x8jXJZNqrE/J9Mi5v9UxbncaDPl7+gkmm0heM
	D7iRs9isKsGbehTCoRKjO9O9lgj2Oj3RO4rkDyZUc1w==
X-Gm-Gg: ASbGncuR1tCyiaZFQieybiKsLnfkIcjbII84+qVKh8Vb9GtZOLQQdZPKO0cfTaZXLPQ
	+hM83jGMg/Ap56DD+PIzwFIkAgykcVGjOfrmhYjQCQZetby1IwO3Pc+mi98UyRGfHNYK/aW74ph
	BPfjD0EBOuusIsOnuS4iCQOAXIzCj3Ccj7GscfmO6a+vFYG2b7pa7I1plqA6wfTPCp+T5CHG5si
	K8KAXq96nfunm+/o3YfZ48d9jAbOzPdaVDTMU7NxaxnOojBLQy8bKKR0PWNhdM9dz1kVrkFVXTz
	rF17QfAWih7KC7RIs3dIa2tOIlk=
X-Google-Smtp-Source: AGHT+IHJJi40QO2j+AEEIXG+FSVZbH+WW1DwyjfojmvqVA8OuBIji8cOMNjvhsKfbFVOj/fVZy/UensL3Bqq96jG85U=
X-Received: by 2002:a05:6512:3b0c:b0:57a:310:66a8 with SMTP id
 2adb3069b0e04-591d85773ffmr5098755e87.55.1761050459418; Tue, 21 Oct 2025
 05:40:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015232015.846282-1-robh@kernel.org>
In-Reply-To: <20251015232015.846282-1-robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 21 Oct 2025 14:40:47 +0200
X-Gm-Features: AS18NWCQWmhq7gNfZEHIkGW0O-gEdDRZh4gksyliLmXKxwOZhptAVz-Dcd8I0sA
Message-ID: <CAMRc=Mf++cYPVrFH5_1KggTQi2Tew_MaeHMHSiczkVfM+=Y4rg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Fix inconsistent quoting
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lee Jones <lee@kernel.org>, Joel Stanley <joel@jms.id.au>, 
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

On Thu, Oct 16, 2025 at 1:20=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
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

For GPIO:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

