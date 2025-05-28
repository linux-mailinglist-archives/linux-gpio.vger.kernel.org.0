Return-Path: <linux-gpio+bounces-20658-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC21AC696E
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 14:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 445B34E47F7
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 12:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7CF2286402;
	Wed, 28 May 2025 12:36:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C900285411;
	Wed, 28 May 2025 12:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748435798; cv=none; b=Pj7DAMbiJUyQA3VmpN1pt9p8y2BDlRiGAVnpqDsO1tnVO8Hv6vM8r6I7zpQkB9SGL/X+1AMQPFJMVwlbDy9Fn1UsVMqMoWhohU28UdlrddSiEGW+Nzw/U3Su2+Q1JAJru2j39dBeZRO6IJKB5om624U+shKp5X27zfWZIg2bRN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748435798; c=relaxed/simple;
	bh=Tb8JwKiZIuYCl3tOsCNwIpx036fyGp61/t1y80b2mTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NWtc3N3dk/bKFKug90xxuDsMY8AMs8THXFrhR1zkDqpZp2kCn9gtiwNQXg03TfF0k9IZkjNjibX/fTezDgU9sstoxpouPpWgEKAGY/vR06/9vEhimhusMGxFtg6JuaobFzyczoEKT/fsYeCcnOdycLv0tZhqG+F906olnrIwKHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86d5e3ddb66so1273840241.2;
        Wed, 28 May 2025 05:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748435794; x=1749040594;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EttMl+UEO23MQ5/zgKZh51X1fkqP6brx9qDrKYFmyoA=;
        b=Zz8NzvcetK05jErEbx/ZP8QJVx1G1THE7k6BzGtuwnEbL2Qlt7JPbihNQNyZy+irtN
         rGQ7yMEwBzW0E7ZED5ZGqtWh7NW37aMscQmtkpmsHXqc9XMsrrsoDFuXuNTdzqdE7y78
         FjurhvWJA3n7ltUBXfXRQ4VFzUmv++koJilWjNF12as13Vk/8ZCzu6MSqt94ard3Qimx
         jGUEDKZ5CMFWkwCSuyoYDgLnReAseueGT4/haA6zy+bnAkE0NYt1h+jD1CGnfUPFZSTR
         lqzEDhVXDhcGLkQKATNACqsfNhRRU1Bmfu2CJj1yIey71WaMBiRPWy/46NFRJwkRgaW2
         bH2g==
X-Forwarded-Encrypted: i=1; AJvYcCVa0JJeYhTLJ34WgLsKtf4mDSUfm5oirLJbNQ/y5wBvWOsu3olB3WLKOsMk+tPA+2+B1xWh/QuB+uRu2Ro=@vger.kernel.org, AJvYcCWRlyQmU8QDqHotGTZlOMYs8Asmdyini862gJvv11kqpghYsMN07kdDBR4P0FRWnLtLAl9L/PCTXZgU@vger.kernel.org, AJvYcCWUJT+wEWHZaGm0jBVz0QWYpTbEcBqHuiy7SOnk9H7HH4aDK8hEbcxPud7pga510WV4wOpOqt8rssHE@vger.kernel.org, AJvYcCX9UlbJpcH8IqGWQADHeY0dJCieWJSUkNSMjH0vw2lz+c4vyOvv3D6aiJdQyr2v9nYScwmq8H4U63ggqJfS@vger.kernel.org, AJvYcCXZasUqzV8vVyIZwXY2bJcoKtjTxpEPfMPoNP9KKJTdFBcnpIed0byge8siNpUPxAL3D3qAhLcmXHYVyvKfa4Fn8LA=@vger.kernel.org
X-Gm-Message-State: AOJu0YywLC8EMdRBpVJuq2XMLXCLZCWjlI7JPL8afTt3Q+CEo8eH8mRd
	UQlLg+O8cnCeBnhjb1GvWmGEVqmq4NBCjrwneizw+LwBS+aXxFYaeEjjW0036KVB
X-Gm-Gg: ASbGncuEZYv5tV0/4YUZigYV5sBzjO1Rqe6YtjxRg0I8fwgHoxv874GIGzz9jmc+vkm
	f8+FF+/ncD3WSM/Cs/ZzOnR09DLfvfZsdGjlaBNiL0VEbh1ogivtDBm64PpDWSXsPyce3CsJahp
	BhsIdB+REanGq9TsKGrF9N+CRGvQNoirMmiIkAHflwl0kqPGYk6bfxyQWUEDMtqRfCKEOXj2HVI
	uVnnBglR9aNrfkyj6Gz+l3xMT7IbhfSwZInfmOHI1QM8VPdpPidiC7fDUleHahoea/iP6a5z7z8
	A4uqJARiEMdB/TFXFL07CuEJS1PpP3Ln7gYz1geQL9DFJVykJCpdETWQO51pvQxVXMIaCsR4JO6
	tYfP1r0PDi5x09A==
X-Google-Smtp-Source: AGHT+IFqX++8xVp+nCvnBBtE1xW7PBsDc7dPeyBs/u6wrEFcPIIOb+1g2Ka1Xfb5vCu7pD3ebvj7wg==
X-Received: by 2002:a05:6122:d81:b0:526:720:704 with SMTP id 71dfb90a1353d-52f2c56e83emr12183548e0c.7.1748435793843;
        Wed, 28 May 2025 05:36:33 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53066973c62sm872607e0c.44.2025.05.28.05.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 05:36:33 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-87dfe8388f8so834813241.0;
        Wed, 28 May 2025 05:36:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUdZMdzQj2tjIztXLodfaEF0vTWGP+GzqSKV9mrRsm7pzPKRREnrw0WMod4EsutEqZrnYWnw4WVTDyZ@vger.kernel.org, AJvYcCV1RP1XBseuqv33llEzkRQYA/Sy4ZB7qtd5jKFVvorlYyQDCz5K1F5TsQvcI+f0d/SnvprpTIbabd0gLJr2tSY/bpY=@vger.kernel.org, AJvYcCVcq3wrLQ6S8UN+kGk9Xm8SfIvKmB3+/nsM20AoorYIR1rPd9bRxne9pg5teFw8KbqJOwBJIbJpEzUG@vger.kernel.org, AJvYcCW3Nug3JCEca+iJygNTK7HuzaGKOk2lY1tYBPVYpBFRJIxDcGylvOwwAsasTW0uvZr8zi9yh2VACqIy0sU=@vger.kernel.org, AJvYcCWoURuO9za1nINwJwZ3CyCghrYlBYTKN3WZv01ZrZZtE7tGUPyrmpVhFR0Vt8UhrfLa7pDYwvRGx3ZIKk+S@vger.kernel.org
X-Received: by 2002:a05:6102:3e95:b0:4c5:1c2e:79f5 with SMTP id
 ada2fe7eead31-4e42415db7dmr12024574137.16.1748435792883; Wed, 28 May 2025
 05:36:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org> <20250528-pinctrl-const-desc-v1-1-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-1-76fe97899945@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 May 2025 14:36:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX7krbAssbYpJ1RA1EkpOP26nUhuhmtSW8X9nJkB5amBQ@mail.gmail.com>
X-Gm-Features: AX0GCFvOxqSsQb6hAAUjvGh24-ydFSS3wze_W2Lj6wpwfm4mEoNhN1lAYOnpqvg
Message-ID: <CAMuHMdX7krbAssbYpJ1RA1EkpOP26nUhuhmtSW8X9nJkB5amBQ@mail.gmail.com>
Subject: Re: [PATCH 01/17] pinctrl: starfive: Allow compile testing on other platforms
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Lars Persson <lars.persson@axis.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@axis.com, linux-riscv@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Wed, 28 May 2025 at 12:41, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Always descent to drivers/pinctrl/starfive/ because limiting it with
> SOC_STARFIVE is redundant since all of its Kconfig entries are already

... since its Makefile doesn't build anything if no Starfive-specific
pin control Kconfig options are enabled?

> have "depends on SOC_STARFIVE".  This allows compile testing on other
> architectures with allyesconfig.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/pinctrl/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index ac27e88677d14f1c697e0d0be9f295c746556f4d..dcede70b25660833a158c298d1269d6ecea9dd8b 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -82,7 +82,7 @@ obj-y                         += sophgo/
>  obj-y                          += spacemit/
>  obj-$(CONFIG_PINCTRL_SPEAR)    += spear/
>  obj-y                          += sprd/
> -obj-$(CONFIG_SOC_STARFIVE)     += starfive/
> +obj-y                          += starfive/
>  obj-$(CONFIG_PINCTRL_STM32)    += stm32/
>  obj-y                          += sunplus/
>  obj-$(CONFIG_PINCTRL_SUNXI)    += sunxi/

The actual change LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

